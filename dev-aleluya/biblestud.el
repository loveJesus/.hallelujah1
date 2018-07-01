;; ουτως γαρ ηγαπησεν ο θεος τον κοσμον, ωστε τον υιον αυτου τον μονογενη εδωκεν, ινα πας ο πιστευων εις αυτον μη αποληται αλλα εχῃ ζωην αιωνιον.
(require 'button)

(setq bstud-s3l-aleluya "~/dev-aleluya/Bible-aleluya/bible-esv-notes-aleluya.sqlite3")
(setq bstud-buf-aleluya "*aleluya*")

(defun bstud-reset-aleluya ()
  "Clear the buffer, Hallelujah"
  (interactive)
  (with-current-buffer (get-buffer-create bstud-buf-aleluya)
    (erase-buffer)
		(insert (concat "הללויה" "Bible Stud - "))
		(insert-text-button "Home" 'action (lambda(x_aleluya) (bstud-reset-aleluya) ) )
		(insert-text-button "Book/Chapter Select" 'action (lambda(x_aleluya) (bstud-reset-aleluya) ) )
    )
  )
(defun bstud-people-for-verse-id-aleluya (verse-id-aleluya)
	"Return ((person-id person-name-aleluya person-desc-aleluya)) for a verse-id"
	(interactive)
	(esqlite-read bstud-s3l-aleluya	(concat "SELECT p.id, p.name_aleluya FROM person_verses_aleluya as pv, people_aleluya as p where p.id = pv.person_aleluya_id and pv.verse_aleluya_id=" verse-id-aleluya)))

(defun bstud-verse-id-for-verse-aleluya (verse-aleluya)
	"Return verse-id for a verse in diatheke fmt"
	)

;(define-button-type 'custom-button
;  'action 'button-pressed
;  'follow-link t
;  'help-echo "Click Button"
;  'help-args "test")
;(make-button 1 10 :type 'custom-button)

(defun aleluya1 ()
	"Hallelujah"
	(interactive)
	(bstud-reset-aleluya)
	(with-current-buffer (get-buffer-create bstud-buf-aleluya)		
		(insert (concat "\nGod be praised " "\n"))
		(insert (format "%s" (car (bstud-people-for-verse-id-aleluya "10331"))))
		(insert-text-button "Hallelujah" 'action (lambda(x_aleluya) (bstud-reset-aleluya) ) )
	;;	(insert (concat (esqlite-read bstud-s3l-aleluya	"SELECT * FROM people_aleluya limit 1")))
		(display-buffer-in-side-window (get-buffer-create "*aleluya*") () )										
		)
	)






