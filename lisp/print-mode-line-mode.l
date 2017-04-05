;;; -*- Mode: Lisp; Package: EDITOR -*-
;;;
;;;  print-mode-line-mode
;;;


#|
http://www2.ocn.ne.jp/~cheerful/script/index.html
TKI

���T�v
mode-line �ɍD���ȕ�����g������\�������܂��B
(minor-mode)

���g����
(load-library "print-mode-line-mode")
�œǂݍ���
setq �� mode-line-format��ݒ肵�Ă���
M-x print-mode-line-mode
�ŗ����グ�܂��B

�����s��
���Ƃ� ���́u�}�C�i�[���[�h���ĂԑO�v�� �W���� mode-line-format���C�����Ă��������B

�ύX����Ƃ��� �}�C�i�[���[�h�I�t�ɂ��Ă��� mode-line-format��ݒ肵
�}�C�i�[���[�h���I���ɂ��܂��B
(�ԈႦ������Ă��債���e���͂Ȃ����ǁA���܂����f����Ȃ���������B)

�}�C�i�[���[�h�\�����F�u@�v�ɂ��܂����B

���t�H�[�}�b�g�T���v��

;�W���F�g���Ȃ����Ƃ���ƁA
(setq mode-line-format "[%i] %* %b (%M) [%k:%l] %P %f")

;�ݒ��
(setq mode-line-format "[%i]%b(%M)[%k:%l] %*,%T,%isech%PL(%/��:%pts) %ps %f")

;�J�[�\���ʒu���ƕ������\��
(setq mode-line-format "[%i] %* %b (%M) |%/��,  %n |  [%k:%l] %P %f")

;�O���j�b�W���ԕ\��
(setq mode-line-format "[%i] %* %b (%M) |%2ATIME|  [%k:%l] %P %f")
(setq *second-area-timezone* -18) ;�����E�E
(setq *second-area-time-format* "%m/%d(%v)) %H:%M")



���g���t�H�[�}�b�g
%/      : �J�[�\���ʒu�� �o�b�t�@�S�̂̉����̈ʒu�ɂ��邩
%PL     : �\�����C������ �_���s�ɂ����āA�����������ڂł͂Ȃ��_���s
%Px     : �\�����C������(x,y�`��)
%pts    : �J�[�\���ʒu
%ps     : m �}�[�N�̈ʒu���� ,  lm �Ō�ɏC���ʒu�̕���
%mpts   : �J�[�\���ő�ʒu  �ق� %s ����
%s      : �o�b�t�@�[�T�C�Y
%c      : ������(���s������)
%w      : �P�ꐔ (�X�y�[�X��؂�ȂǁA���{��͖���)
%n      : ���s��
%fd     : �t�@�C���X�V���� (�t�H�[�}�b�g�F*print-mode-time-format*)
%fh     : �t�@�C���X�V�� (�t�H�[�}�b�g�F*print-mode-time-format-sub*)
%2ATIME : ���n������\�� (*second-area-time-format*,*second-area-timezone* �Q��)
%fc     : fill-column��
%lc     : ���X�g�R�}���h last-command
%tc     : �R�}���h this-command
%machine: �}�V����
%T      : t  :trace-on-error?
         as :auto-save?
         l  :lock-file?
          * :���b�N�ς݂�
         b  :back-up?
          + :back-up-always
         u  :undo�\?
         ld :ldoc
         pr :paren 
(%isech : r  : isearch-deco regex
         c  : isearch-deco case-foldp
         d  : isearch-deco coloring
          * : isearch-deco coloring left  ) �E�E�E�C�}�C�`


����ȊO�ɂ� *print-mode-line-mode-list*�ɐݒ肷��ΊȒP�Ɋg���ł��܂��B���̂͑�ς�����
�E���V�C
�E���[�����M
�E�؋����v
�E�����X�P�W���[��
�E����
�ECPU���A�o�b�e���[
�E%cd    : �J�E���g�_�E�� �Ƃ�
�E%pd    : �o�ߓ�   �Ƃ�

�ǉ���F
(push (list (list "%XYZ" 'hogehoge-func)) *print-mode-line-mode-list*)


�E�W���t�H�[�}�b�g�ɂ��ẮA�X�V�����FVersion 0.2.1.153�Q��
http://www.jsdlab.co.jp/~kei/download/OChangeLog.html

������
�Ǝ��̃o�b�t�@���[�J���ݒ�(den8�Ƃ��H)���Ă���Ƃǂ��Ȃ邩�����Ă��܂���B

OFF�ɂ��Ă���ƕW��mode-line-format����S�~��������̂�
�K���ɐݒ肵�Ȃ����Ă��������B


���ꉞ�E�E�E
�o�b�t�@�[���Ƃɂ��Ă݂܂����B
(���ꂾ���ł����\��J���܂���)

���݌v���e
;mode-line-format�ɕ\������
;post-command-hook �����p����B
;���������v���[�X����B

������

2010/8/14 �g�����C�u�������T���v���Ƃ��č쐬
2010/8/14 mode-line-mode�Ɣ�邯��UI���g���₷�������B

2002/1/10 �V�K�쐬

�ȏ�


|#
;----------------------------------------
;�x�[�X���C�u����

(provide "print-mode-line-mode")

(in-package "editor")

(export '(
          print-mode-line-mode
          *print-mode-line-mode-all-format* 

          *print-mode-line-mode-list*  
          *print-mode-time-format* 
          *print-mode-time-format-sub*
          *second-area-time-format*
          *second-area-timezone*

          ))

;�J�X�^�}�C�Y�\
;--��{
;*print-mode-line-mode-list* ���J�X�^�}�C�Y�\

;--�g�����܂����C�u����
(defvar *print-mode-time-format* "%Y/%m/%d %H:%M")
(defvar *print-mode-time-format-sub* "%H:%M %S")
(defvar *second-area-timezone* -18) ;���{�� -9  (�H  �O���j�b�W��-18?)
(defvar *second-area-time-format* "%m/%d(%v)) %H:%M")




;�����p
;�o�b�t�@���ɐ錾���Ȃ�
(defvar-local *print-mode-line-mode* nil)
;�ϊ��O�� mode-line-format �FON���ɐݒ�A �ϊ����ɂ��ꂩ��ϊ�����B
(defvar-local *print-mode-line-mode-default-string* "")
;�ϊ��O�� mode-line-format �S�̗p�F   ON�� ���� 1��ڂ̋N�����ɐݒ� 
;  mode-line-format�����[�J���łȂ��ꍇ�f�t�H���g�Ƃ��Ďg���A 
;  print-mode-line-mode�ɂ����ĕϊ����mode-line-format�ŕ\�������������Ȃ�̂�h��
(defvar *print-mode-line-mode-all-format*)

;print-mode-line-mode �̋N���o�b�t�@��
(defvar *print-mode-line-mode-num* 0)

;���C���̃g�O���R�}���h
(defun print-mode-line-mode (&optional (arg nil sv))
  (interactive)
  (toggle-mode '*print-mode-line-mode* arg sv)

  (if *print-mode-line-mode*
      ;ON
    (progn
      ;�T�v(�����E�E)
      ;�E�f�t�H���gstring�̐ݒ�
      ;=1�̎�
      ;  mode-line-format����
      ;  all-format�ւ�
      ;  �Ehook�ݒ�
      ;/=1�̎�
      ;  all-format����


      (setq *print-mode-line-mode-num* (+ 1  *print-mode-line-mode-num*))

      ;buffer-local�ɂ������
      (if (not (local-variable-p 'mode-line-format))
          (progn
           (defvar-local mode-line-format mode-line-format)))

      (cond  ((= 1 *print-mode-line-mode-num*)
              (setq *print-mode-line-mode-all-format* mode-line-format
                     *print-mode-line-mode-default-string* mode-line-format)
               (add-hook '*post-command-hook* 'mode-line-extention))
             (t
              (if (local-variable-p 'mode-line-format)
                  (setq *print-mode-line-mode-default-string* mode-line-format)
                  (setq *print-mode-line-mode-default-string* *print-mode-line-mode-all-format*
                   mode-line-format *print-mode-line-mode-all-format*)))))

    ;OFF
      (progn
        (setq mode-line-format *print-mode-line-mode-default-string*
              *print-mode-line-mode-default-string* *print-mode-line-mode-all-format*
              *print-mode-line-mode-num* (- *print-mode-line-mode-num* 1))
        (if (<= 0 *print-mode-line-mode-num*)
            (progn
              (setq *print-mode-line-mode-num* 0)
              (delete-hook '*post-command-hook* 'mode-line-extention)))))
   (update-mode-line t))

;mode line �u������(post-hook�ŌĂ΂��)
(defun mode-line-extention ()

  ;���ׂĂ̂Ƃ���Ŏ蓮�g�O���͂߂�ǂ��̂�ON������������B
  ;post-hook�łǂ�����minor-���ƌĂ΂��O��
  (if (not *print-mode-line-mode*)
      ;local�ݒ肪����ꍇ����ON���Ȃ�
      (if (not (local-variable-p 'mode-line-format))(print-mode-line-mode t)))

 (let ((flag nil)(num 0)(label *print-mode-line-mode-default-string*))
   ;format�u����������
   (dolist (item *print-mode-line-mode-list*)
     (setq num (+ 1 num))
     (if (string-match (car item) label)
       (progn
        (setq label (substitute-string label (car item) 
                                (funcall (cadr item))))
        (setq flag t))))

   ;�\���X�Vupdate�ATODO?�X�V���Ȃ�������off�ɂ��悤���H
  (if flag 
   (progn
     (setq mode-line-format label)
    (update-mode-line (selected-buffer))))))

(pushnew '(*print-mode-line-mode* . "@") *minor-mode-alist* :key #'car)
;(delete '*print-mode-line-mode* *minor-mode-alist* :test #'(lambda (x y) (eq x (car y))))

;----------------------------------------
;�g�����܂����C�u����

;�W��
;%*, %#*, %r, %#r, %p, %v, %h, %#h, %b, %f, %#f, %F, %#F, %M, %m, %k, %l, %i, %P

(setq *print-mode-line-mode-list*
 (list
  (list "%/" 'ed::mode-line-string-pos-per)
  (list "%PL" 'ed::mode-line-string-logical-line-column)
  (list "%Px" 'ed::mode-line-string-xy-line-column)
  (list "%pts" 'ed::mode-line-string-point)
  (list "%ps" 'ed::mode-line-string-positions)
  (list "%mpts" 'ed::mode-line-string-max-point);narrowing �̎���NG?
  (list "%s" 'ed::mode-line-string-buffer-size)
  (list "%c" 'ed::mode-line-string-max-point-non-cr)
  (list "%w" 'ed::mode-line-string-count-word)
  (list "%n" 'ed::mode-line-string-count-cr)
  (list "%fd" 'ed::mode-line-string-buffer-file-date)
  (list "%fh" 'ed::mode-line-string-buffer-file-time)
  (list "%2ATIME" 'ed::mode-line-string-second-area-time)
  (list "%fc" 'ed::mode-line-string-fill-column)
  (list "%lc" 'ed::mode-line-string-last-command)
  (list "%tc" 'ed::mode-line-string-this-command)
  (list "%machine" 'ed::mode-line-string-machine)
  (list "%T" 'ed::mode-line-string-toggler)
  (list "%isech" 'ed::mode-line-string-toggler-isearch-deco)
   ))


(defun mode-line-string-pos-per ()
 (format nil "~A" (floor (/ (* (current-line-number) 100)  (buffer-lines)))))
 ;;%��\�����������ꍇ�� %%�ŁA���ƌ��̕������ϊ�����Ȃ��悤�ɒ���

(defun mode-line-string-logical-line-column ()
  (format nil "~5@A:~4A" (current-line-number)(current-column)))

(defun mode-line-string-xy-line-column ()
 (if (buffer-line-number-mode(selected-buffer))
     (format nil "~4@A,~5A" (current-virtual-column)(current-virtual-line-number))
  (format nil "~4@A,~5A" (current-column)(current-line-number))))

(defun mode-line-string-point ()
  (format nil "~A" (point)))

(defun mode-line-string-max-point ()
  (format nil "~A" (point-max)))

(defun mode-line-string-buffer-size ()
  (format nil "~A" (buffer-size)))

(defun mode-line-string-max-point-non-cr ()
 (save-excursion
  (let ((cr-num))
   (goto-char (point-min))
   (setq cr-num (count-matches "\n" nil t))
   (format nil "~A" (- (point-max) cr-num)))))

(defun mode-line-string-count-word ()
 (save-excursion
  (let ((WB-num)(WB-num-m)))
   (goto-char (point-min))
   (setq WB-num (count-matches "\\b" nil t))
   (goto-char (point-min))
   (setq WB-num-m (count-matches "-\n+" nil t))
   (format nil "~A"  (- (floor (/ WB-num 2))WB-num-m))))

(defun mode-line-string-count-cr ()
 (save-excursion
  (let ((cr-num))
   (goto-char (point-min))
   (setq cr-num (count-matches "\n" nil t))
   (format nil "~A" (+ 1 cr-num)))))


(defun mode-line-string-buffer-file-date ()
 (let ((str ""))
  (ignore-errors
   (setq str  (format-date-string *print-mode-time-format* (file-write-time (get-buffer-file-name(selected-buffer))))))
   str))

(defun mode-line-string-buffer-file-time ()
 (let ((str ""))
  (ignore-errors
   (setq str (format-date-string *print-mode-time-format* (file-write-time (get-buffer-file-name(selected-buffer))))))
   str))

(defun mode-line-string-second-area-time ()
  (let ((y)(m)(d)(h)(mi)(s)(w)(temp)(tz))
   (multiple-value-setq (s mi h d m y w temp tz) (decode-universal-time (get-universal-time) ))
    (format nil "~A" (format-date-string *second-area-time-format*  (encode-universal-time s mi h d m y ed::*second-area-timezone*)))))

(defun mode-line-string-fill-column ()
  (format nil "~A" fill-column))

(defun mode-line-string-last-command ()
  (format nil "~A" *last-command*))

(defun mode-line-string-this-command ()
  (format nil "~A" *this-command*))

(defun mode-line-string-toggler ()
  (format nil "~A~A~A~A~A~A~A" 
          (if  si::*trace-on-error* "t" "-")
          (if  auto-save "as" "--")
          (concat 
           (if  lock-file "l" "-")
           (if  (file-locked-p) "*" "-"))
          (concat 
           (if  make-backup-files "b" "-")
           (if  make-backup-file-always "+" "-"))
          (concat 
           (if  (buffer-can-undo-p(selected-buffer)) "u" "-")
;           (format nil "~A" kept-undo-information)
           )

          (if (ignore-errors (not *ldoc-status*))  "--" "ld")
          (if (ignore-errors (not *paren-status*)) "--" "pr" )
          ))

;���A���^�C���ɕς��Ȃ�
(defun mode-line-string-toggler-isearch-deco ()
 (let ((str ""))
    (setq str 
          (format nil "~A~A~A~A" 
                  (if  *case-fold-search* "c" "-")
                  (if  ed::*isearch-regexp* "r" "-")
                  (if  ed::*isearch-deco-ignore* "-" "d")
                  (if  ed::*isearch-deco-refresh-p* "*" "-")
                  ))
   str))

(defun mode-line-string-positions ()
 (let ((str "-")(strlm "-"))
    (format nil "m:~A lm:~A" 
            (progn
              (ignore-errors
               (setq str (if (mark t) (if (< (point)(mark t)) "��" "��") "-")))
             str)
     (progn
       (ignore-errors
        (setq strlm
              (if (< (point)(last-modified-point)) "��" "��")))
      strlm))))

(defun mode-line-string-machine ()
  (machine-name))
