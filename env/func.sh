#!/bin/bash

# export FZF_DEFAULT_OPTS='--preview "bat --style=numbers --color=always --line-range :500 {}"'

ns() {
  kubectl config set-context --current --namespace=$(kubectl get namespaces --output=jsonpath='{range .items[*]}{.metadata.name}{"\n"}'| fzf --info=inline --layout=reverse \
   --preview-window up:follow,80%,wrap \
   --preview 'kubectl get pods -n {1}' "$@"
  )
}

ct() {
  kubectl config set-context --current --context=$(kubectl config get-contexts --output='name' | fzf)
}

exe() {
    local pod
    pod=$(kubectl get po --no-headers -o custom-columns=":metadata.name" | fzf)
    local container
    container=$(kubectl get pods "$pod" -o jsonpath='{range .spec.containers[*]}{.name}{"\n"}{end}' | fzf )
    
    kubectl exec -it "$pod" -c "$container" -- /bin/bash
}

log() {
    local pod
    pod=$(kubectl get po --no-headers -o custom-columns=":metadata.name" | fzf)
    local container
    container=$(kubectl get pods "$pod" -o jsonpath='{range .spec.containers[*]}{.name}{"\n"}{end}' | fzf )
    
    # oc logs deploy/multiclusterhub-operator -n open-cluster-management
    kubectl logs "$pod" -c "$container" 
}

logs() {
  pod="$(kubectl get po |tail -n+2|fzf -n1 --tac --preview='kubectl logs --tail=20 --all-containers=true {1}' --preview-window=down:50%:hidden --bind=ctrl-p:toggle-preview --header="^P: Preview Logs"|awk '{print $1}')"
  if [[ -n $pod ]]; then
    kubectl logs --all-containers=true $pod
  fi
}

plogs(){
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