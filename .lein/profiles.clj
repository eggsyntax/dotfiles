;; TODO possibly add:
;; - speculative (specs for core fns from borkdude):
;; - re-find (leverages speculative to search for fns by the effect you want
;;   them to have): https://github.com/borkdude/re-find
{:user  {:plugins  [[lein-drip "0.1.2-SNAPSHOT"]
                    ;; [com.billpiel/sayid "0.0.16"] ; Now provided by CIDER, I think?
                    [com.jakemccrary/lein-test-refresh "0.14.0"]
                    [venantius/yagni "0.1.4"]
                    [org.clojure/tools.namespace "0.3.0-alpha4"]
                    [lein-ns-dep-graph "0.2.0-SNAPSHOT"]
                    ;; [lein-exec "0.3.6"]

                    ;; Release management:
                    [lein-release "1.0.5"]
                    [io.aviso/pretty "0.1.34"]
                    ]
         :dependencies [
                        [egg-cljc-utils "0.1.0-SNAPSHOT"]
                        [reconstructorepl "0.2.0-SNAPSHOT"]
                        [datawalk "0.1.12"]
                        ;; [datawalk "0.1.17-SNAPSHOT"]
                        ;; [datawalk "0.1.18-SNAPSHOT"]
                        ;; [datawalk "1.0.0-SNAPSHOT"]

                        ;; Make sure all projects can run cljs-repl locally
                        ;; [com.cemerick/piggieback "0.2.1"]
                        ;; And figwheel
                        ;; [figwheel-sidecar "0.5.14"]

                        ;; Experiment with Sayid
                        ;; [com.billpiel/sayid "0.0.16"] ; now provided by CIDER, I think?

                        [clj-stacktrace "0.2.8"]
                        [pjstadig/humane-test-output "0.8.3"]
                        [im.chit/lucid.core.inject "1.3.6"] ; formerly vinyasa. http://docs.caudate.me/lucidity/lucid-core.html#core-inject
                        ;; [slamhound "1.5.5"]
                        ;; Spacemacs CIDER dependencies:
                        ;; [alembic "0.3.2"]
                        ;; Colorized pretty-printing:
                        ;; https://github.com/greglook/puget
                        [io.aviso/pretty "0.1.34"]
                        ;; Temporarily removing puget to see if I still need it, 8/17/17
                        [mvxcvi/puget "1.0.0"]
                        ]
         :repl-options {:init (set! *print-length* 50)
                        :timeout 120000
                        :prompt (fn [ns] (str "\u001B[36m" ns "\u001B[m>"))}
         ;; injections used with lucid.core.inject to make certain code available in every ns
         :injections [
                      (require '[lucid.core.inject :as inject])
                      (inject/in clojure.core
                                 [clojure.pprint pprint pp]
                                 [clojure.repl source doc]
                                 [egg-cljc-utils.core] ; egg utils
                                 )
                      (println "Injections complete.")
                      ;; see http://insideclojure.org/2018/06/21/tagged-literal/
                      (set! *default-data-reader-fn* tagged-literal)
                      (println "Defined default reader for tagged literals.")
                      ]
         :jvm-opts ["-Ddatomic.memcachedServers=127.0.0.1:11211"]

         ;; Mac:
         ;; :test-refresh {:notify-command ["terminal-notifier" "-title" "lein test-refresh" "-message"]
         ;; Linux:
         :test-refresh {:notify-command ["sudo" "/home/egg/bin/test-refresh-notify"]
                        :quiet true
                        :notify-on-success true}
         }

 }
