{:user  {:plugins  [[lein-drip "0.1.2-SNAPSHOT"]
                    [com.jakemccrary/lein-test-refresh "0.14.0"]
                    ;; Experiment with Sayid
                    ;; [com.billpiel/sayid "0.0.14"]

                    ;; Stuff I'm commenting out for a while to see how I feel,
                    ;; & whether it affects perf, based on reading
                    ;; https://github.com/clojure-emacs/cider/issues/1717#issuecomment-218908109
                    ;; (& some of the rest of that page).
                    ;; [lein-exec "0.3.6"]
                    [venantius/yagni "0.1.4"]
                    ;; [lein-ns-dep-graph "0.1.0-SNAPSHOT"]
                    [lein-kibit "0.1.3"]
                    [jonase/eastwood "0.2.3"]

                    ;; Outdated Spacemacs CIDER plugins:
                    ;; [cider/cider-nrepl "0.12.0"]
                    ;; [refactor-nrepl "2.2.0"]
                    ;; [refactor-nrepl "2.0.0-SNAPSHOT"]
                    ;; Me:
                    [reconstructorepl "0.1.0-SNAPSHOT"]
                    ]
         :dependencies [
                        [egg-cljc-utils "0.1.0-SNAPSHOT"]
                        [datawalk "0.1.3-SNAPSHOT"]
                        ;; [cljfmt "0.1.10"]

                        ;; Experiment with Sayid
                        [com.billpiel/sayid "0.0.14"]

                        [clj-stacktrace "0.2.8"]
                        [pjstadig/humane-test-output "0.8.3"]
                        [john2x/repload "0.0.3"] ; https://github.com/john2x/repload
                        ;; [im.chit/vinyasa "0.4.7"] ; https://github.com/zcaudate/vinyasa
                        [im.chit/lucid.core.inject "1.3.6"] ; formerly vinyasa. http://docs.caudate.me/lucidity/lucid-core.html#core-inject
                        ;; [slamhound "1.5.5"]
                        ;; Spacemacs CIDER dependencies:
                        ;; [alembic "0.3.2"]
                        ;; Colorized pretty-printing:
                        ;; https://github.com/greglook/puget
                        ;; Temporarily removing puget to see if I still need it, 8/17/17
                        ;; [mvxcvi/puget "1.0.0"]
                        ;; [org.clojure/tools.nrepl "0.2.12"]
                        ]
         ;; :repositories {"my.datomic.com"
         ;;                {:url "https://my.datomic.com/repo"
         ;;                 :username "datomic-team@t-insight.com"
         ;;                 :password "c96e945e-56f8-4ead-a3f8-896f14350c12"}}
         :repl-options {:init (set! *print-length* 50)
                        :timeout 120000}
         ;; injections used with lucid.core.inject to make certain code available
         ;; in every ns
         :injections [
                      (require '[lucid.core.inject :as inject])
                      (require 'repload)
                      (inject/in
                       clojure.core
                       [clojure.pprint pprint pp]
                       [clojure.repl source doc]
                       [repload repload]
                       [egg-cljc-utils.core] ; egg utils
                       )
                      (println "Injections complete.")

                      ]

         ;; Old:
         ;; :injections [(require '[vinyasa.inject :as inject])
         ;;              (require 'repload)
         ;;              (require '[repload :refer [repload]])
         ;;              (inject/in
         ;;               [vinyasa.inject :refer [inject [in inject-in]]]
         ;;               [repload repload]
         ;;               [clojure.pprint pprint pp]
         ;;               clojure.core
         ;;               [clojure.pprint pprint pp]
         ;;               [repload repload]
         ;;               )
         ;;              (require '[clojure.java.shell :as sh])
         ;;              (sh "say" "You got repple!")
         ;;              ;; (require '[clojure.pprint :refer [pprint pp]])
         ;;              (println "Injections complete.")]

         :test-refresh {:notify-command ["terminal-notifier" "-title" "lein test-refresh" "-message"]
                        :quiet true
                        :notify-on-success false}}

 ;;  :eastwood {:exclude-linters [:unlimited-use]}
 }

;; For spacemacs:
;; https://github.com/syl20bnr/spacemacs/tree/master/layers/%2Blang/clojure
;; {:repl {:plugins [[cider/cider-nrepl "0.10.0-SNAPSHOT"]
;;                     [refactor-nrepl "2.0.0-SNAPSHOT"]]
;;           :dependencies [[alembic "0.3.2"]
;;                          [org.clojure/tools.nrepl "0.2.12"]]}}
