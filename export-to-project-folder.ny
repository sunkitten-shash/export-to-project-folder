;nyquist plug-in
;version 4
;type tool
;name "Export to project folder"
;release 2.0
;author "sunkitten_shash"
;copyright "Released under terms of the GNU General Public License version 3"

(setf filename (get '*project* 'name))
(setf version (get '*audacity* 'version))

(defun string-ends-with (str sub)
  (let 
    ((nstr (length str)) 
    (nsub (length sub)))
    (and (>= nstr nsub) (string-equal sub (subseq str (- nstr nsub) nstr)))))

(defun pathname-from-recents ()
  (let ((menus (aud-get-info "menus"))
  ;; this may be different on MacOS; may be "Open Recent"?
    (menuStr "Recent Files")
    (fNameOld (format nil "~a~a~a" *file-separator* filename ".aup"))
    (fNameNew (format nil "~a~a~a" *file-separator* filename ".aup3"))
    isRecent
    recent)
    (dolist (row menus)
      (let ((str (second (assoc 'label row))))
        (when isRecent
          (when (string= str "----")
            (return-from pathname-from-recents ""))
          (when (or (string-ends-with str fNameOld) (string-ends-with str fNameNew))
            (return-from pathname-from-recents str)))
        (when (string= str menuStr)
          (setf isRecent t))
      )
    )
  )
)

(defun preference-name-from-version ()
  (if (eql 3 (first version))
    (if (<= 4 (second version))
      (return-from preference-name-from-version "ExportAudioDialog/DefaultPath")
      (return-from preference-name-from-version "Directories/Export/LastUsed")
    )
    (return-from preference-name-from-version "Export/Path")
  )
)

(setf full-path (pathname-from-recents))
  (when (string-ends-with full-path "aup3")
    (setf directory (subseq full-path 0 (- (length full-path) (length (format nil "~a~a" filename ".aup3"))))))
  (when (string-ends-with full-path "aup")
    (setf directory (subseq full-path 0 (- (length full-path) (length (format nil "~a~a" filename ".aup")))))
  )
(if (not directory) (setf directory ""))
(format t "~a~a~%" "Audacity Version: " version)
(format t "~a~a~%" "Directory: " directory)
(format t "~a~a~%" "Preference name: " (preference-name-from-version))
(aud-do-command "Export")