Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156A0282FA;
	Sat, 21 Jun 2025 01:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750468886; cv=none; b=p1ym0maw8WXGzdes7EFzLcBfCZPES1ECphE4+PAoad6CuqppNAOxPVXKO1M9DD+XmrAdm7WAUA8/vbbijOkt+inwr55vEKEZ5MogqX2ULgso3Q7XLwBJ3cGeZkwMWCBd7WhXlDBum5BZVcaS9Dj6eIv3pA4qL/NsvT0yNUMlppE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750468886; c=relaxed/simple;
	bh=79W4M3TnObZbcG33+bXpGZVvrcrVUWOB/kc2kQGJo1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cj+v6QreTtnnnajkZhJLQ9IapPl5POurXePYMvRseN23UvwMh6z/fzQH2TL97HHADlYMZyXF3GHetvSlwyWaLm8T4qTkvb2ljvMTOHn9A3G1wBPV7dvAEN0vVp2wXouLyax8tlxJ1kwCsc5/387S7JH/Wn8buLglVMVYnGekHfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M7vUqv2N; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M7vUqv2N"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4533fbbd21bso1206895e9.2;
        Fri, 20 Jun 2025 18:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750468882; x=1751073682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fXpm+cxKWXfaOG8hceGrPfeeN1euve+3oYaUIIlU6GY=;
        b=M7vUqv2NB4YMBOu8Y21BGBb3rgQa1jJQFYYVGICTSpW6QCOVf3rRoH5zggJ15FqOOj
         n+l1ZBbEnBePGq2J1LsNUvtgEFMKFlOeGMzaGYqjQOK+HnNw+wdT4qisekw5cx0VhCli
         lW3gNHacPgf2xB5MUlpcadq4mXCBDIMVJEDExDuEKcGyRd+tUNDnv+hRAaCx8/UTDXd7
         anAezCRZut5jKkZFy85IoTFgg1FLm44j1i5pEu/BrtDj4oB/yo+IpFxqLTZgf8nEJHH8
         w99FuePIJUFZGPMiR5LNLKw8efnqDn3JolI3bP1DGA72TUuwc4e0TxAv2aPge9zqVf8z
         GoCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750468882; x=1751073682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fXpm+cxKWXfaOG8hceGrPfeeN1euve+3oYaUIIlU6GY=;
        b=KueRalKfQAmmN34TK1Y8H/lqRsqjQDQBbEoVqzd4isWBpq7jn9brIxYprShZW+q5rO
         8ZIfNYn/zV6j6L39dA3abfHftIm1KMM46n3Qk3WeVU3w0tsjQCAJnac7Eg/3l6yFJoVV
         0tVryrIfknp/oj9S1FvmZX0HaS23Tbq+NNNSGSiVrPGugbK/t5HroDSOHOMXT9VlJzy1
         4NW34amwLmJwjWJrCgmxBy/H9Pq2SZb0q0z7Pmec+v/jQMNLdbJufjOHYPhSCbN0NDaN
         txvCCTemWSMpa4SAanfNE1fSb3nFRc2lGM/XUeQje+yyKzONYHk7bKbdBhj+jJBHKL7R
         3VGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHQzdDVwStKhTvagCis8p+tmtheQQR0DqDPwLuwCTQaKXdR73x2M3okQTp/93/UsH1ebGdfBWsAKltFg==@vger.kernel.org, AJvYcCXLCKhV5z05BlYAcEXf9u1wtfPj3ZxlmPQJhnEw5YxL+VZOpto0Y42dm5nD2aXv3BRuprlCXwgtbNNqIgY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoYqfAxs34OZ1O0Azi7HRTbaNshHHsnLUh0ats4XHzDug2RVtk
	2t6iW5dsDJfvnXNQPkW+vwcm8RkYGsZROJb2+B38nIsMxOKUnifpNnw=
X-Gm-Gg: ASbGncvWoE9kJVf2o6wFjKOJ1+9YM7BOVQ0j3nFDY2JiBw3VI5mnNmNbPNLvMOciw77
	a/LIyaBkcL9Cutj3ZcW5NmCw6pUY8mU3bHzZHvSX4Wdv8c7KY0BYFPuxZNjduNcS7wuPWigN2iw
	vk45P7Y7/0Drmc+gsDtVVgnrRT9GeAwUWXJ74/t607UmTyLvV9ThopeUrRQQQKVdjRtUYv3Rb9o
	czO/micRYqePn/Fgy+/O3tCNACU245bc7h0/UNQRPJx33RTTvtrAIVajoXO/HRGb0wgn/aQOTCp
	FsM0uQE+BgQ8HmjuC79/Ie5PWP1M7C2PS13va1jzAPc51bppCahcExZaIKPeoZ0UAmNqzEWN7uW
	3L+K31qxhljo0w+vyA2FV
X-Google-Smtp-Source: AGHT+IGrZhZjI5fxcFgQtboSULqB3e2HJXak2N6S4RR55/cgfEAKe1tjLX+yCRSmLwGce1ecNMuXOQ==
X-Received: by 2002:a05:600c:3143:b0:439:9c0e:36e6 with SMTP id 5b1f17b1804b1-453658bac2cmr19747555e9.3.1750468882072;
        Fri, 20 Jun 2025 18:21:22 -0700 (PDT)
Received: from localhost (8.red-80-39-33.staticip.rima-tde.net. [80.39.33.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f18152sm3284046f8f.27.2025.06.20.18.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 18:21:21 -0700 (PDT)
From: Xose Vazquez Perez <xose.vazquez@gmail.com>
To: 
Cc: Xose Vazquez Perez <xose.vazquez@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	LINUX SPDX ML <linux-spdx@vger.kernel.org>,
	LINUX KERNEL ML <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] LICENSES: refresh FSF GFDL/GPL licences
Date: Sat, 21 Jun 2025 03:21:13 +0200
Message-ID: <20250621012117.91729-1-xose.vazquez@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit

Old licences have been modified, because FSF postal address was changed:
https://lists.gnu.org/archive/html/info-gnu/2024-09/msg00000.html
https://www.fsf.org/blogs/community/fsf-office-closing-party
https://www.fsf.org/about/contact/mailing

Just "cut and paste" from original sources:
https://www.gnu.org/licenses/old-licenses/fdl-1.1.txt
https://www.gnu.org/licenses/old-licenses/fdl-1.2.txt
https://www.gnu.org/licenses/old-licenses/gpl-1.0.txt
https://www.gnu.org/licenses/old-licenses/gpl-2.0.txt

Relevant change: postal address was replaced with an URL.

Cc: Thomas Gleixner <tglx@linutronix.de> (maintainer:LICENSES and SPDX stuff)
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org> (maintainer:LICENSES and SPDX stuff)
Cc: LINUX SPDX ML <linux-spdx@vger.kernel.org> (open list:LICENSES and SPDX stuff)
Cc: LINUX KERNEL ML <linux-kernel@vger.kernel.org> (open list)
Signed-off-by: Xose Vazquez Perez <xose.vazquez@gmail.com>
---
 LICENSES/deprecated/GFDL-1.1 |  2 +-
 LICENSES/deprecated/GFDL-1.2 |  2 +-
 LICENSES/deprecated/GPL-1.0  | 33 ++++++++++++++--------------
 LICENSES/preferred/GPL-2.0   | 42 +++++++++++++++++-------------------
 4 files changed, 39 insertions(+), 40 deletions(-)

diff --git a/LICENSES/deprecated/GFDL-1.1 b/LICENSES/deprecated/GFDL-1.1
index ae62699ab62c..d7a524f602a4 100644
--- a/LICENSES/deprecated/GFDL-1.1
+++ b/LICENSES/deprecated/GFDL-1.1
@@ -24,7 +24,7 @@ License-Text:
                    Version 1.1, March 2000
 
  Copyright (C) 2000  Free Software Foundation, Inc.
-     51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
+     <https://fsf.org/>
  Everyone is permitted to copy and distribute verbatim copies
  of this license document, but changing it is not allowed.
 
diff --git a/LICENSES/deprecated/GFDL-1.2 b/LICENSES/deprecated/GFDL-1.2
index b97e99a11d37..5e8fff04af05 100644
--- a/LICENSES/deprecated/GFDL-1.2
+++ b/LICENSES/deprecated/GFDL-1.2
@@ -23,7 +23,7 @@ License-Text:
 
 
  Copyright (C) 2000,2001,2002  Free Software Foundation, Inc.
-     51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
+     <https://fsf.org/>
  Everyone is permitted to copy and distribute verbatim copies
  of this license document, but changing it is not allowed.
 
diff --git a/LICENSES/deprecated/GPL-1.0 b/LICENSES/deprecated/GPL-1.0
index 3a4fa969e4c2..78de6cce6347 100644
--- a/LICENSES/deprecated/GPL-1.0
+++ b/LICENSES/deprecated/GPL-1.0
@@ -10,15 +10,16 @@ Usage-Guide:
     SPDX-License-Identifier: GPL-1.0+
 License-Text:
 
-	    GNU GENERAL PUBLIC LICENSE
-	     Version 1, February 1989
+                    GNU GENERAL PUBLIC LICENSE
+                     Version 1, February 1989
 
  Copyright (C) 1989 Free Software Foundation, Inc.
-                    675 Mass Ave, Cambridge, MA 02139, USA
+                    <https://fsf.org/>
+
  Everyone is permitted to copy and distribute verbatim copies
  of this license document, but changing it is not allowed.
 
-			    Preamble
+                            Preamble
 
   The license agreements of most software companies try to keep users
 at the mercy of those companies.  By contrast, our General Public
@@ -58,8 +59,8 @@ authors' reputations.
 
   The precise terms and conditions for copying, distribution and
 modification follow.
-
-		    GNU GENERAL PUBLIC LICENSE
+
+                    GNU GENERAL PUBLIC LICENSE
    TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
 
   0. This License Agreement applies to any program or other work which
@@ -109,7 +110,7 @@ it, and copy and distribute such modifications under the terms of Paragraph
 Mere aggregation of another independent work with the Program (or its
 derivative) on a volume of a storage or distribution medium does not bring
 the other work under the scope of these terms.
-
+
   3. You may copy and distribute the Program (or a portion or derivative of
 it, under Paragraph 2) in object code or executable form under the terms of
 Paragraphs 1 and 2 above provided that you also do one of the following:
@@ -155,7 +156,7 @@ Program), the recipient automatically receives a license from the original
 licensor to copy, distribute or modify the Program subject to these
 terms and conditions.  You may not impose any further restrictions on the
 recipients' exercise of the rights granted herein.
-
+
   7. The Free Software Foundation may publish revised and/or new versions
 of the General Public License from time to time.  Such new versions will
 be similar in spirit to the present version, but may differ in detail to
@@ -177,7 +178,7 @@ make exceptions for this.  Our decision will be guided by the two goals
 of preserving the free status of all derivatives of our free software and
 of promoting the sharing and reuse of software generally.
 
-			    NO WARRANTY
+                            NO WARRANTY
 
   9. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
 FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW.  EXCEPT WHEN
@@ -199,9 +200,9 @@ YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER
 PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE
 POSSIBILITY OF SUCH DAMAGES.
 
-		     END OF TERMS AND CONDITIONS
-
-	Appendix: How to Apply These Terms to Your New Programs
+                     END OF TERMS AND CONDITIONS
+
+        Appendix: How to Apply These Terms to Your New Programs
 
   If you develop a new program, and you want it to be of the greatest
 possible use to humanity, the best way to achieve this is to make it
@@ -227,8 +228,8 @@ the exclusion of warranty; and each file should have at least the
     GNU General Public License for more details.
 
     You should have received a copy of the GNU General Public License
-    along with this program; if not, write to the Free Software
-    Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+    along with this program; if not, see <https://www.gnu.org/licenses/>.
+
 
 Also add information on how to contact you by electronic and paper mail.
 
@@ -254,7 +255,7 @@ necessary.  Here a sample; alter the names:
   program `Gnomovision' (a program to direct compilers to make passes
   at assemblers) written by James Hacker.
 
-  <signature of Ty Coon>, 1 April 1989
-  Ty Coon, President of Vice
+  <signature of Moe Ghoul>, 1 April 1989
+  Moe Ghoul, President of Vice
 
 That's all there is to it!
diff --git a/LICENSES/preferred/GPL-2.0 b/LICENSES/preferred/GPL-2.0
index ff0812fd89cc..9829bf39a74a 100644
--- a/LICENSES/preferred/GPL-2.0
+++ b/LICENSES/preferred/GPL-2.0
@@ -17,15 +17,15 @@ Usage-Guide:
     SPDX-License-Identifier: GPL-2.0-or-later
 License-Text:
 
-		    GNU GENERAL PUBLIC LICENSE
-		       Version 2, June 1991
+                    GNU GENERAL PUBLIC LICENSE
+                       Version 2, June 1991
 
- Copyright (C) 1989, 1991 Free Software Foundation, Inc.
-                       51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
+ Copyright (C) 1989, 1991 Free Software Foundation, Inc.,
+ <https://fsf.org/>
  Everyone is permitted to copy and distribute verbatim copies
  of this license document, but changing it is not allowed.
 
-			    Preamble
+                            Preamble
 
   The licenses for most software are designed to take away your
 freedom to share and change it.  By contrast, the GNU General Public
@@ -34,7 +34,7 @@ software--to make sure the software is free for all its users.  This
 General Public License applies to most of the Free Software
 Foundation's software and to any other program whose authors commit to
 using it.  (Some other Free Software Foundation software is covered by
-the GNU Library General Public License instead.)  You can apply it to
+the GNU Lesser General Public License instead.)  You can apply it to
 your programs, too.
 
   When we speak of free software, we are referring to freedom, not
@@ -74,8 +74,8 @@ patent must be licensed for everyone's free use or not licensed at all.
 
   The precise terms and conditions for copying, distribution and
 modification follow.
-
-		    GNU GENERAL PUBLIC LICENSE
+
+                    GNU GENERAL PUBLIC LICENSE
    TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
 
   0. This License applies to any program or other work which contains
@@ -129,7 +129,7 @@ above, provided that you also meet all of these conditions:
     License.  (Exception: if the Program itself is interactive but
     does not normally print such an announcement, your work based on
     the Program is not required to print an announcement.)
-
+
 These requirements apply to the modified work as a whole.  If
 identifiable sections of that work are not derived from the Program,
 and can be reasonably considered independent and separate works in
@@ -187,7 +187,7 @@ access to copy from a designated place, then offering equivalent
 access to copy the source code from the same place counts as
 distribution of the source code, even though third parties are not
 compelled to copy the source along with the object code.
-
+
   4. You may not copy, modify, sublicense, or distribute the Program
 except as expressly provided under this License.  Any attempt
 otherwise to copy, modify, sublicense or distribute the Program is
@@ -244,7 +244,7 @@ impose that choice.
 
 This section is intended to make thoroughly clear what is believed to
 be a consequence of the rest of this License.
-
+
   8. If the distribution and/or use of the Program is restricted in
 certain countries either by patents or by copyrighted interfaces, the
 original copyright holder who places the Program under this License
@@ -274,7 +274,7 @@ make exceptions for this.  Our decision will be guided by the two goals
 of preserving the free status of all derivatives of our free software and
 of promoting the sharing and reuse of software generally.
 
-			    NO WARRANTY
+                            NO WARRANTY
 
   11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
 FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW.  EXCEPT WHEN
@@ -296,9 +296,9 @@ YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER
 PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE
 POSSIBILITY OF SUCH DAMAGES.
 
-		     END OF TERMS AND CONDITIONS
-
-	    How to Apply These Terms to Your New Programs
+                     END OF TERMS AND CONDITIONS
+
+            How to Apply These Terms to Your New Programs
 
   If you develop a new program, and you want it to be of the greatest
 possible use to the public, the best way to achieve this is to make it
@@ -322,10 +322,8 @@ the "copyright" line and a pointer to where the full notice is found.
     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
     GNU General Public License for more details.
 
-    You should have received a copy of the GNU General Public License
-    along with this program; if not, write to the Free Software
-    Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
-
+    You should have received a copy of the GNU General Public License along
+    with this program; if not, see <https://www.gnu.org/licenses/>.
 
 Also add information on how to contact you by electronic and paper mail.
 
@@ -349,11 +347,11 @@ necessary.  Here is a sample; alter the names:
   Yoyodyne, Inc., hereby disclaims all copyright interest in the program
   `Gnomovision' (which makes passes at compilers) written by James Hacker.
 
-  <signature of Ty Coon>, 1 April 1989
-  Ty Coon, President of Vice
+  <signature of Moe Ghoul>, 1 April 1989
+  Moe Ghoul, President of Vice
 
 This General Public License does not permit incorporating your program into
 proprietary programs.  If your program is a subroutine library, you may
 consider it more useful to permit linking proprietary applications with the
-library.  If this is what you want to do, use the GNU Library General
+library.  If this is what you want to do, use the GNU Lesser General
 Public License instead of this License.
-- 
2.49.0

