#!/bin/bash

# export FZF_DEFAULT_OPTS='--preview "bat --style=numbers --color=always --line-range :500 {}"'

function ns() {
  kubectl config set-context --current --namespace=$(kubectl get namespaces --output=jsonpath='{range .items[*]}{.metadata.name}{"\n"}'| fzf --info=inline --layout=reverse \
   --preview-window up:follow,80%,wrap \
   --preview 'kubectl get pods -n {1}' "$@"
  )
}

function ct() {
  kubectl config set-context --current --context=$(kubectl config get-contexts --output='name' | fzf)
}

function exe() {
    local pod
    pod=$(kubectl get po --no-headers -o custom-columns=":metadata.name" | fzf)
    local container
    container=$(kubectl get pods "$pod" -o jsonpath='{range .spec.containers[*]}{.name}{"\n"}{end}' | fzf )
    
    kubectl exec -it "$pod" -c "$container" -- /bin/bash
}

function log() {
    local pod
    pod=$(kubectl get po --no-headers -o custom-columns=":metadata.name" | fzf)
    local container
    container=$(kubectl get pods "$pod" -o jsonpath='{range .spec.containers[*]}{.name}{"\n"}{end}' | fzf )
    
    if [ -z "$1" ]; then
      kubectl logs "$pod" -c "$container"
    else
      kubectl logs "$1" "$pod" -c "$container"
    fi
}

function logs(){
  export FZF_DEFAULT_COMMAND="kubectl get pods"
  fzf --info=inline --layout=reverse --header-lines=1 \
   --prompt "NS: $(kubectl config get-contexts | grep "*" | awk '{print $5}')> " \
   --header $'>> L (open log in editor) || R (refresh) || CTRL-/ (change view) <<\n\n' \
   --color ${ENV_FZF_COLOR} \
   --bind 'ctrl-/:change-preview-window(50%|80%)' \
   --bind 'L:execute:${EDITOR:-vim} <(kubectl logs --all-containers {1}) > /dev/tty' \
   --bind 'R:reload:$FZF_DEFAULT_COMMAND' \
   --preview-window up:follow,80%,wrap \
   --preview 'kubectl logs --follow --all-containers {1}' "$@"
}

pods() {
  FZF_DEFAULT_COMMAND="kubectl get pods --all-namespaces" \
  fzf --layout=reverse --tmux 100%,80% --header-lines=1 \
    --prompt "$(kubectl config current-context | sed 's/-context$//')> " \
    --header "- Enter (exec) | L (log) | R (reload) | D (describe) | W (delete) | T (tail)" \
    --bind 'enter:execute:kubectl exec -it --namespace {1} {2} -- sh > /dev/tty' \
    --bind 'L:execute:kubectl logs --all-containers --namespace {1} {2} | less' \
    --bind 'R:reload:eval $FZF_DEFAULT_COMMAND' \
    --bind 'D:execute:kubectl describe pod --namespace {1} {2} | less' \
    --bind 'W:execute:kubectl delete pod --namespace {1} {2}' \
    --bind 'T:execute:kubectl logs --follow --tail=0 --namespace {1} {2}' \
    --bind 'ctrl-/:change-preview-window(80%,border-bottom|80%,border-bottom,wrap|)' \
    --preview-window up:follow \
    --preview 'kubectl logs --follow --all-containers --tail=10000 --namespace {1} {2}' "$@"
}

pod() {
  FZF_DEFAULT_COMMAND="kubectl get pods" \
  fzf --layout=reverse --tmux 100%,60% --header-lines=1 \
    --prompt "> " \
    --header "- Enter (exec) |  Y (yaml) | | L (log) | R (reload) | D (describe) | W (delete) | T (tail)" \
    --bind 'enter:execute:kubectl exec -it {1} -- sh > /dev/tty' \
    --bind 'L:execute:kubectl logs --all-containers {1} | less' \
    --bind 'R:reload:eval $FZF_DEFAULT_COMMAND' \
    --bind 'D:execute:kubectl describe pod {1} | less' \
    --bind 'W:execute:kubectl delete pod {1}' \
    --bind 'T:execute:kubectl logs --follow --tail=0 {1}' \
    --bind 'Y:execute:kubectl get pod {1} -oyaml | less' \
    --bind '/:change-preview-window(80%,border-bottom|80%,border-bottom,wrap|)' \
    --preview-window up:follow \
    --preview 'kubectl get pod {1} -oyaml' "$@"
    # --bind 'ctrl-/:change-preview-window(80%,border-bottom|80%,border-bottom,wrap|)' \
}

k() {

  local args=("$@")
  # local new_args=()

  local resource=""
  local previous=""
  for arg in "${args[@]}"; do
      if [ "$arg" = '{}' ]; then
          resource="$previous"
          break
      fi
      previous=$arg
  done

  if [ "$resource" = "" ]; then 
      # Set resource as the last parameter
      resource=${args[-1]}
      args=("${args[@]}" '{}')
  fi

  local fzf_command="kubectl get pods"
  if kubectl get "$resource" > /dev/null 2>&1; then
    fzf_command="kubectl get $resource"
  fi
  
  FZF_DEFAULT_COMMAND="$fzf_command" fzf --tmux 80%,60% --layout=reverse --header-lines=1 | awk '{print $1}' | xargs -I {} kubectl "${args[@]}"
}