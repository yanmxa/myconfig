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
   --header $'>> CTRL-L (open log in editor) || CTRL-R (refresh) || CTRL-/ (change view) <<\n\n' \
   --color ${ENV_FZF_COLOR} \
   --bind 'ctrl-/:change-preview-window(50%|80%)' \
   --bind 'ctrl-l:execute:${EDITOR:-vim} <(kubectl logs --all-containers {1}) > /dev/tty' \
   --bind 'ctrl-r:reload:$FZF_DEFAULT_COMMAND' \
   --preview-window up:follow,80%,wrap \
   --preview 'kubectl logs --follow --all-containers {1}' "$@"
}