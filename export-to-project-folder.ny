;nyquist plug-in
;; well THAT fixes shit,,,,
;version 4
;type tool
;name "Export to project folder"
;release 1.0
;author "sunkitten_shash"
;copyright "Released under terms of the GNU General Public License version 3"

(setf filename (get '*project* 'name))

(defun string-ends-with (str sub)
  (let 
    ((nstr (length str)) 
    (nsub (length sub)))
    (and (>= nstr nsub) (string-equal sub (subseq str (- nstr nsub) nstr)))))

(defun pathname-from-recents ()
  (let ((menus (aud-get-info "menus"))
  ;; this may be different on MacOS; may be "Open Recent"?
    (menuStr "Recent Files")
    (fName (format nil "~a~a~a" *file-separator* filename ".aup"))
    isRecent
    recent)
    (dolist (row menus)
      (let ((str (second (assoc 'label row))))
        (when isRecent
          (when (string= str "----")
            (return-from pathname-from-recents ""))
          (when (string-ends-with str fName)
            (return-from pathname-from-recents str)))
        (when (string= str menuStr)
          (setf isRecent t))
      )
    )
  )
)

(format t "~a~a~%" "Pathname: " (subseq (pathname-from-recents) 0 (- (length (pathname-from-recents)) (length (format nil "~a~a" filename ".aup")))))
(setf directory (subseq (pathname-from-recents) 0 (- (length (pathname-from-recents)) (length (format nil "~a~a" filename ".aup")))))
;; TODO: set it as default documents dir if not available?
(if (not directory) (setf directory ""))
(aud-do (format nil "SetPreference: Name=\"Export\/Path\" Value=\"~a\"" directory))
(print (format nil "~a~a~%" "Set default export directory to " directory))