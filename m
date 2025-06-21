Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB282E41E;
	Sat, 21 Jun 2025 01:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750468892; cv=none; b=Ab4N2cjHA6iZlL50JGFbRGQhblSyLx9WrLsdnwvzbB4vpK6lmGDN/F3Zn1TM0nC8cMiXEB9JOMNq9rJNXdwR7P0PKZotb8jEFvfU+Ao9wxpyYz0PZQSn6ZVspL2V+O6+tRQo5HHPU71IF9HBNHQPGWZworachlJzotO2wVkJlAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750468892; c=relaxed/simple;
	bh=5DHrR6YAg+BOJ9S4sLOn28PC5F/W4Y0ReEEsJZwIwU4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hFnJlV863BZE4CRTgWlybkreKn+cZgSccsaOU0h0vp31WoqRIScD+qQW1VcH/0bUixqtNWIVF/KdkLKmkVb8poLY7PrX9l0u895ZRIinlVzHLBX0rks8mUBEf9/9lhKWI5jIh2WOtTTMx3GKp+HhuyFyZXQ6MmPzSX9VIE8pn/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VGSWhjBD; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VGSWhjBD"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a4e62619afso286818f8f.1;
        Fri, 20 Jun 2025 18:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750468885; x=1751073685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ao9A3eeh1wMDgz+b3o2ZzLVe+lnq76mTzM8hEJgSQU=;
        b=VGSWhjBDGrCm/s0oKNJ9FO72qfG17WJDcZ5Mj8d+a57/E5/h5xSJt43OV5w+xIkmcu
         t9bPeO31PIMwO2fcWjUUYBQE2D5PeRwQ1s5ZdqZUWtNORZQq/6rbAICxpvbJvwNTx7Zq
         AT9dtRw9nNGysFViaV6cWO7GzLjSAtEnlg0i4FphCWI5UMTp0Ng9Jj51BVzt+mlAGued
         E9dNq7YmPri/nPp8nVHd94AFbgcH5wK8G1E9co2o5g8wxNtYqT8W9zK7kpIuXjbTrnh5
         mSApOI/t0lkLTMoHFndi4obRMnAkdmBVbzZEHMv2DXuQBNaerbcJsRrxgpzvW27TmxW8
         toeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750468885; x=1751073685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ao9A3eeh1wMDgz+b3o2ZzLVe+lnq76mTzM8hEJgSQU=;
        b=wNwPJwQ9oWXTSzbgLrkR4g1ZjL/nd8ASqrUPYIg4E2c/ULO5cJQKo8p4sBLtyRdSRa
         s5eDy62Fyf3DqbC81KfjzZYqjO2OL8maBQgOLkNxprWcLejmwYWPFdhDg0Xf4G4odKoi
         hXV/RSBgDpbQBoihQzLTXewEgeUU6ijHS//P3ia9o+AgxwuqEpMFXNeB/fmsrTG4eGNU
         heAM8BzTNYP47huE8dvp8l0oj5p6AubDBYQJOWEx9cnnKL8Qi+LGE+s4sEAbFNnn5rf4
         yrPJ1Tb+IlFhnIGGT3+1EBKPJebsFIJZW7QIpLYa0kDHadhAcsdYXeUMm0uyDUzdfbmn
         Sm+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUHm2I3o7v2aya+5j8uo1TTyjecSjqqSVxWYPon2PX+C1DqsoZ8XHQX2uFJIlXVuBQ5Rvv3bHDpq/Pd0Q4=@vger.kernel.org, AJvYcCWgRiDMX60e4Yseh87hJhIF8F4PD2uEmj9wrDFjhdnGDAa4gGP8bjKowLV2O/BiYr+iGqamsy7JCU6NeA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn77rTsSpC8oE3mpIkN3vYKyP6BnWakDudos2KptvAe1IpcQ6h
	Xd5+T+5Pbd71+NCILeYmBzQzBQOIwDSKDMwcqGWmbF3YR9jqcSQHxDs=
X-Gm-Gg: ASbGncsu1Gg05GbIO/7TyC/L5/S72nlhsO5nZ6Dim/BFrKAGM5DQtcH5+f2CkW6xcqK
	J2/WrTSM6s3jja/Ua991ISQxzEvJvmMruF0u0Fovwaz4/RQv+kQeDDFV/bsX9+2IKcKbpgyk+ox
	+nzN/v/qzBEFlx0ptUiAwCkOEFGk76awztryA8OooCOL9O+qOF9DqDAFS0kfy3orz/XiaSbQ80g
	ja6zcgsa6HK6YjiLAtz5XWG5X5jRzC0f13gZomTmIaWGDOkDRM2IL9T79nUi9URN+miXeIG0EAi
	Twv8SVI+NUOd08Zvi/UI4xJoyaBATdpZuNl80Oc8DsN4Ej4zDlKLOL2XXmuJ/roRp4Pn7cj4Ope
	8GmlxIpA9SQJ/Z/YCJjs5
X-Google-Smtp-Source: AGHT+IGZVP6BDsmtIDRbM7UGw0R6vMGtgpzXUFQBn/IaqqVL5C/ZDiKSSato4JWgCSL/D/y+4YglLw==
X-Received: by 2002:a05:6000:3111:b0:3a3:71fb:7903 with SMTP id ffacd0b85a97d-3a6d12de22dmr1492017f8f.10.1750468884388;
        Fri, 20 Jun 2025 18:21:24 -0700 (PDT)
Received: from localhost (8.red-80-39-33.staticip.rima-tde.net. [80.39.33.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ebced8asm73792595e9.40.2025.06.20.18.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 18:21:23 -0700 (PDT)
From: Xose Vazquez Perez <xose.vazquez@gmail.com>
To: 
Cc: Xose Vazquez Perez <xose.vazquez@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	LINUX SPDX ML <linux-spdx@vger.kernel.org>,
	LINUX KERNEL ML <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] LICENSES: refresh FSF LGPL licences
Date: Sat, 21 Jun 2025 03:21:14 +0200
Message-ID: <20250621012117.91729-2-xose.vazquez@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250621012117.91729-1-xose.vazquez@gmail.com>
References: <20250621012117.91729-1-xose.vazquez@gmail.com>
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
https://www.gnu.org/licenses/old-licenses/lgpl-2.0.txt
https://www.gnu.org/licenses/old-licenses/lgpl-2.1.txt

Relevant change: postal address was replaced with an URL.

There are many changes, because the original text from
spdx.org is a bit odd. Maybe an old copy :-?

Cc: Thomas Gleixner <tglx@linutronix.de> (maintainer:LICENSES and SPDX stuff)
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org> (maintainer:LICENSES and SPDX stuff)
Cc: LINUX SPDX ML <linux-spdx@vger.kernel.org> (open list:LICENSES and SPDX stuff)
Cc: LINUX KERNEL ML <linux-kernel@vger.kernel.org> (open list)
Signed-off-by: Xose Vazquez Perez <xose.vazquez@gmail.com>
---
 LICENSES/preferred/LGPL-2.0 | 769 ++++++++++++++++-----------------
 LICENSES/preferred/LGPL-2.1 | 818 ++++++++++++++++++------------------
 2 files changed, 803 insertions(+), 784 deletions(-)

diff --git a/LICENSES/preferred/LGPL-2.0 b/LICENSES/preferred/LGPL-2.0
index 957d798fe037..5a4498e50817 100644
--- a/LICENSES/preferred/LGPL-2.0
+++ b/LICENSES/preferred/LGPL-2.0
@@ -12,476 +12,483 @@ Usage-Guide:
     SPDX-License-Identifier: LGPL-2.0+
 License-Text:
 
-GNU LIBRARY GENERAL PUBLIC LICENSE
-Version 2, June 1991
+                  GNU LIBRARY GENERAL PUBLIC LICENSE
+                       Version 2, June 1991
 
-Copyright (C) 1991 Free Software Foundation, Inc.
-51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA
+ Copyright (C) 1991 Free Software Foundation, Inc.
+ <https://fsf.org/>
+ Everyone is permitted to copy and distribute verbatim copies
+ of this license document, but changing it is not allowed.
 
-Everyone is permitted to copy and distribute verbatim copies of this
-license document, but changing it is not allowed.
+[This is the first released version of the library GPL.  It is
+ numbered 2 because it goes with version 2 of the ordinary GPL.]
 
-[This is the first released version of the library GPL. It is numbered 2
-because it goes with version 2 of the ordinary GPL.]
+                            Preamble
 
-Preamble
+  The licenses for most software are designed to take away your
+freedom to share and change it.  By contrast, the GNU General Public
+Licenses are intended to guarantee your freedom to share and change
+free software--to make sure the software is free for all its users.
 
-The licenses for most software are designed to take away your freedom to
-share and change it. By contrast, the GNU General Public Licenses are
-intended to guarantee your freedom to share and change free software--to
-make sure the software is free for all its users.
+  This license, the Library General Public License, applies to some
+specially designated Free Software Foundation software, and to any
+other libraries whose authors decide to use it.  You can use it for
+your libraries, too.
 
-This license, the Library General Public License, applies to some specially
-designated Free Software Foundation software, and to any other libraries
-whose authors decide to use it. You can use it for your libraries, too.
+  When we speak of free software, we are referring to freedom, not
+price.  Our General Public Licenses are designed to make sure that you
+have the freedom to distribute copies of free software (and charge for
+this service if you wish), that you receive source code or can get it
+if you want it, that you can change the software or use pieces of it
+in new free programs; and that you know you can do these things.
 
-When we speak of free software, we are referring to freedom, not price. Our
-General Public Licenses are designed to make sure that you have the freedom
-to distribute copies of free software (and charge for this service if you
-wish), that you receive source code or can get it if you want it, that you
-can change the software or use pieces of it in new free programs; and that
-you know you can do these things.
+  To protect your rights, we need to make restrictions that forbid
+anyone to deny you these rights or to ask you to surrender the rights.
+These restrictions translate to certain responsibilities for you if
+you distribute copies of the library, or if you modify it.
 
-To protect your rights, we need to make restrictions that forbid anyone to
-deny you these rights or to ask you to surrender the rights. These
-restrictions translate to certain responsibilities for you if you
-distribute copies of the library, or if you modify it.
+  For example, if you distribute copies of the library, whether gratis
+or for a fee, you must give the recipients all the rights that we gave
+you.  You must make sure that they, too, receive or can get the source
+code.  If you link a program with the library, you must provide
+complete object files to the recipients so that they can relink them
+with the library, after making changes to the library and recompiling
+it.  And you must show them these terms so they know their rights.
 
-For example, if you distribute copies of the library, whether gratis or for
-a fee, you must give the recipients all the rights that we gave you. You
-must make sure that they, too, receive or can get the source code. If you
-link a program with the library, you must provide complete object files to
-the recipients so that they can relink them with the library, after making
-changes to the library and recompiling it. And you must show them these
-terms so they know their rights.
+  Our method of protecting your rights has two steps: (1) copyright
+the library, and (2) offer you this license which gives you legal
+permission to copy, distribute and/or modify the library.
 
-Our method of protecting your rights has two steps: (1) copyright the
-library, and (2) offer you this license which gives you legal permission to
-copy, distribute and/or modify the library.
+  Also, for each distributor's protection, we want to make certain
+that everyone understands that there is no warranty for this free
+library.  If the library is modified by someone else and passed on, we
+want its recipients to know that what they have is not the original
+version, so that any problems introduced by others will not reflect on
+the original authors' reputations.
+
+  Finally, any free program is threatened constantly by software
+patents.  We wish to avoid the danger that companies distributing free
+software will individually obtain patent licenses, thus in effect
+transforming the program into proprietary software.  To prevent this,
+we have made it clear that any patent must be licensed for everyone's
+free use or not licensed at all.
 
-Also, for each distributor's protection, we want to make certain that
-everyone understands that there is no warranty for this free library. If
-the library is modified by someone else and passed on, we want its
-recipients to know that what they have is not the original version, so that
-any problems introduced by others will not reflect on the original authors'
-reputations.
-
-Finally, any free program is threatened constantly by software patents. We
-wish to avoid the danger that companies distributing free software will
-individually obtain patent licenses, thus in effect transforming the
-program into proprietary software. To prevent this, we have made it clear
-that any patent must be licensed for everyone's free use or not licensed at
-all.
-
-Most GNU software, including some libraries, is covered by the ordinary GNU
-General Public License, which was designed for utility programs. This
+  Most GNU software, including some libraries, is covered by the ordinary
+GNU General Public License, which was designed for utility programs.  This
 license, the GNU Library General Public License, applies to certain
-designated libraries. This license is quite different from the ordinary
+designated libraries.  This license is quite different from the ordinary
 one; be sure to read it in full, and don't assume that anything in it is
 the same as in the ordinary license.
 
-The reason we have a separate public license for some libraries is that
+  The reason we have a separate public license for some libraries is that
 they blur the distinction we usually make between modifying or adding to a
-program and simply using it. Linking a program with a library, without
+program and simply using it.  Linking a program with a library, without
 changing the library, is in some sense simply using the library, and is
-analogous to running a utility program or application program. However, in
+analogous to running a utility program or application program.  However, in
 a textual and legal sense, the linked executable is a combined work, a
 derivative of the original library, and the ordinary General Public License
 treats it as such.
 
-Because of this blurred distinction, using the ordinary General Public
-License for libraries did not effectively promote software sharing, because
-most developers did not use the libraries. We concluded that weaker
-conditions might promote sharing better.
+  Because of this blurred distinction, using the ordinary General
+Public License for libraries did not effectively promote software
+sharing, because most developers did not use the libraries.  We
+concluded that weaker conditions might promote sharing better.
 
-However, unrestricted linking of non-free programs would deprive the users
-of those programs of all benefit from the free status of the libraries
-themselves. This Library General Public License is intended to permit
-developers of non-free programs to use free libraries, while preserving
-your freedom as a user of such programs to change the free libraries that
-are incorporated in them. (We have not seen how to achieve this as regards
-changes in header files, but we have achieved it as regards changes in the
-actual functions of the Library.) The hope is that this will lead to faster
-development of free libraries.
+  However, unrestricted linking of non-free programs would deprive the
+users of those programs of all benefit from the free status of the
+libraries themselves.  This Library General Public License is intended to
+permit developers of non-free programs to use free libraries, while
+preserving your freedom as a user of such programs to change the free
+libraries that are incorporated in them.  (We have not seen how to achieve
+this as regards changes in header files, but we have achieved it as regards
+changes in the actual functions of the Library.)  The hope is that this
+will lead to faster development of free libraries.
 
-The precise terms and conditions for copying, distribution and modification
-follow. Pay close attention to the difference between a "work based on the
-library" and a "work that uses the library". The former contains code
-derived from the library, while the latter only works together with the
-library.
+  The precise terms and conditions for copying, distribution and
+modification follow.  Pay close attention to the difference between a
+"work based on the library" and a "work that uses the library".  The
+former contains code derived from the library, while the latter only
+works together with the library.
 
-Note that it is possible for a library to be covered by the ordinary
+  Note that it is possible for a library to be covered by the ordinary
 General Public License rather than by this special one.
+
+                  GNU LIBRARY GENERAL PUBLIC LICENSE
+   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
 
-TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
+  0. This License Agreement applies to any software library which
+contains a notice placed by the copyright holder or other authorized
+party saying it may be distributed under the terms of this Library
+General Public License (also called "this License").  Each licensee is
+addressed as "you".
 
-0. This License Agreement applies to any software library which contains a
-   notice placed by the copyright holder or other authorized party saying
-   it may be distributed under the terms of this Library General Public
-   License (also called "this License"). Each licensee is addressed as
-   "you".
+  A "library" means a collection of software functions and/or data
+prepared so as to be conveniently linked with application programs
+(which use some of those functions and data) to form executables.
 
-   A "library" means a collection of software functions and/or data
-   prepared so as to be conveniently linked with application programs
-   (which use some of those functions and data) to form executables.
+  The "Library", below, refers to any such software library or work
+which has been distributed under these terms.  A "work based on the
+Library" means either the Library or any derivative work under
+copyright law: that is to say, a work containing the Library or a
+portion of it, either verbatim or with modifications and/or translated
+straightforwardly into another language.  (Hereinafter, translation is
+included without limitation in the term "modification".)
 
-   The "Library", below, refers to any such software library or work which
-   has been distributed under these terms. A "work based on the Library"
-   means either the Library or any derivative work under copyright law:
-   that is to say, a work containing the Library or a portion of it, either
-   verbatim or with modifications and/or translated straightforwardly into
-   another language. (Hereinafter, translation is included without
-   limitation in the term "modification".)
+  "Source code" for a work means the preferred form of the work for
+making modifications to it.  For a library, complete source code means
+all the source code for all modules it contains, plus any associated
+interface definition files, plus the scripts used to control compilation
+and installation of the library.
 
-   "Source code" for a work means the preferred form of the work for making
-   modifications to it. For a library, complete source code means all the
-   source code for all modules it contains, plus any associated interface
-   definition files, plus the scripts used to control compilation and
-   installation of the library.
+  Activities other than copying, distribution and modification are not
+covered by this License; they are outside its scope.  The act of
+running a program using the Library is not restricted, and output from
+such a program is covered only if its contents constitute a work based
+on the Library (independent of the use of the Library in a tool for
+writing it).  Whether that is true depends on what the Library does
+and what the program that uses the Library does.
 
-   Activities other than copying, distribution and modification are not
-   covered by this License; they are outside its scope. The act of running
-   a program using the Library is not restricted, and output from such a
-   program is covered only if its contents constitute a work based on the
-   Library (independent of the use of the Library in a tool for writing
-   it). Whether that is true depends on what the Library does and what the
-   program that uses the Library does.
+  1. You may copy and distribute verbatim copies of the Library's
+complete source code as you receive it, in any medium, provided that
+you conspicuously and appropriately publish on each copy an
+appropriate copyright notice and disclaimer of warranty; keep intact
+all the notices that refer to this License and to the absence of any
+warranty; and distribute a copy of this License along with the
+Library.
 
-1. You may copy and distribute verbatim copies of the Library's complete
-   source code as you receive it, in any medium, provided that you
-   conspicuously and appropriately publish on each copy an appropriate
-   copyright notice and disclaimer of warranty; keep intact all the notices
-   that refer to this License and to the absence of any warranty; and
-   distribute a copy of this License along with the Library.
+  You may charge a fee for the physical act of transferring a copy,
+and you may at your option offer warranty protection in exchange for a
+fee.
+
+  2. You may modify your copy or copies of the Library or any portion
+of it, thus forming a work based on the Library, and copy and
+distribute such modifications or work under the terms of Section 1
+above, provided that you also meet all of these conditions:
 
-   You may charge a fee for the physical act of transferring a copy, and
-   you may at your option offer warranty protection in exchange for a fee.
+    a) The modified work must itself be a software library.
 
-2. You may modify your copy or copies of the Library or any portion of it,
-   thus forming a work based on the Library, and copy and distribute such
-   modifications or work under the terms of Section 1 above, provided that
-   you also meet all of these conditions:
+    b) You must cause the files modified to carry prominent notices
+    stating that you changed the files and the date of any change.
 
-   a) The modified work must itself be a software library.
+    c) You must cause the whole of the work to be licensed at no
+    charge to all third parties under the terms of this License.
 
-   b) You must cause the files modified to carry prominent notices stating
-      that you changed the files and the date of any change.
+    d) If a facility in the modified Library refers to a function or a
+    table of data to be supplied by an application program that uses
+    the facility, other than as an argument passed when the facility
+    is invoked, then you must make a good faith effort to ensure that,
+    in the event an application does not supply such function or
+    table, the facility still operates, and performs whatever part of
+    its purpose remains meaningful.
 
-   c) You must cause the whole of the work to be licensed at no charge to
-      all third parties under the terms of this License.
+    (For example, a function in a library to compute square roots has
+    a purpose that is entirely well-defined independent of the
+    application.  Therefore, Subsection 2d requires that any
+    application-supplied function or table used by this function must
+    be optional: if the application does not supply it, the square
+    root function must still compute square roots.)
 
-   d) If a facility in the modified Library refers to a function or a table
-      of data to be supplied by an application program that uses the
-      facility, other than as an argument passed when the facility is
-      invoked, then you must make a good faith effort to ensure that, in
-      the event an application does not supply such function or table, the
-      facility still operates, and performs whatever part of its purpose
-      remains meaningful.
+These requirements apply to the modified work as a whole.  If
+identifiable sections of that work are not derived from the Library,
+and can be reasonably considered independent and separate works in
+themselves, then this License, and its terms, do not apply to those
+sections when you distribute them as separate works.  But when you
+distribute the same sections as part of a whole which is a work based
+on the Library, the distribution of the whole must be on the terms of
+this License, whose permissions for other licensees extend to the
+entire whole, and thus to each and every part regardless of who wrote
+it.
 
-   (For example, a function in a library to compute square roots has a
-   purpose that is entirely well-defined independent of the
-   application. Therefore, Subsection 2d requires that any
-   application-supplied function or table used by this function must be
-   optional: if the application does not supply it, the square root
-   function must still compute square roots.)
+Thus, it is not the intent of this section to claim rights or contest
+your rights to work written entirely by you; rather, the intent is to
+exercise the right to control the distribution of derivative or
+collective works based on the Library.
 
-   These requirements apply to the modified work as a whole. If
-   identifiable sections of that work are not derived from the Library, and
-   can be reasonably considered independent and separate works in
-   themselves, then this License, and its terms, do not apply to those
-   sections when you distribute them as separate works. But when you
-   distribute the same sections as part of a whole which is a work based on
-   the Library, the distribution of the whole must be on the terms of this
-   License, whose permissions for other licensees extend to the entire
-   whole, and thus to each and every part regardless of who wrote it.
+In addition, mere aggregation of another work not based on the Library
+with the Library (or with a work based on the Library) on a volume of
+a storage or distribution medium does not bring the other work under
+the scope of this License.
 
-   Thus, it is not the intent of this section to claim rights or contest
-   your rights to work written entirely by you; rather, the intent is to
-   exercise the right to control the distribution of derivative or
-   collective works based on the Library.
+  3. You may opt to apply the terms of the ordinary GNU General Public
+License instead of this License to a given copy of the Library.  To do
+this, you must alter all the notices that refer to this License, so
+that they refer to the ordinary GNU General Public License, version 2,
+instead of to this License.  (If a newer version than version 2 of the
+ordinary GNU General Public License has appeared, then you can specify
+that version instead if you wish.)  Do not make any other change in
+these notices.
+
+  Once this change is made in a given copy, it is irreversible for
+that copy, so the ordinary GNU General Public License applies to all
+subsequent copies and derivative works made from that copy.
 
-   In addition, mere aggregation of another work not based on the Library
-   with the Library (or with a work based on the Library) on a volume of a
-   storage or distribution medium does not bring the other work under the
-   scope of this License.
+  This option is useful when you wish to copy part of the code of
+the Library into a program that is not a library.
 
-3. You may opt to apply the terms of the ordinary GNU General Public
-   License instead of this License to a given copy of the Library. To do
-   this, you must alter all the notices that refer to this License, so that
-   they refer to the ordinary GNU General Public License, version 2,
-   instead of to this License. (If a newer version than version 2 of the
-   ordinary GNU General Public License has appeared, then you can specify
-   that version instead if you wish.) Do not make any other change in these
-   notices.
+  4. You may copy and distribute the Library (or a portion or
+derivative of it, under Section 2) in object code or executable form
+under the terms of Sections 1 and 2 above provided that you accompany
+it with the complete corresponding machine-readable source code, which
+must be distributed under the terms of Sections 1 and 2 above on a
+medium customarily used for software interchange.
 
-   Once this change is made in a given copy, it is irreversible for that
-   copy, so the ordinary GNU General Public License applies to all
-   subsequent copies and derivative works made from that copy.
+  If distribution of object code is made by offering access to copy
+from a designated place, then offering equivalent access to copy the
+source code from the same place satisfies the requirement to
+distribute the source code, even though third parties are not
+compelled to copy the source along with the object code.
 
-   This option is useful when you wish to copy part of the code of the
-   Library into a program that is not a library.
+  5. A program that contains no derivative of any portion of the
+Library, but is designed to work with the Library by being compiled or
+linked with it, is called a "work that uses the Library".  Such a
+work, in isolation, is not a derivative work of the Library, and
+therefore falls outside the scope of this License.
 
-4. You may copy and distribute the Library (or a portion or derivative of
-   it, under Section 2) in object code or executable form under the terms
-   of Sections 1 and 2 above provided that you accompany it with the
-   complete corresponding machine-readable source code, which must be
-   distributed under the terms of Sections 1 and 2 above on a medium
-   customarily used for software interchange.
+  However, linking a "work that uses the Library" with the Library
+creates an executable that is a derivative of the Library (because it
+contains portions of the Library), rather than a "work that uses the
+library".  The executable is therefore covered by this License.
+Section 6 states terms for distribution of such executables.
 
-   If distribution of object code is made by offering access to copy from a
-   designated place, then offering equivalent access to copy the source
-   code from the same place satisfies the requirement to distribute the
-   source code, even though third parties are not compelled to copy the
-   source along with the object code.
+  When a "work that uses the Library" uses material from a header file
+that is part of the Library, the object code for the work may be a
+derivative work of the Library even though the source code is not.
+Whether this is true is especially significant if the work can be
+linked without the Library, or if the work is itself a library.  The
+threshold for this to be true is not precisely defined by law.
 
-5. A program that contains no derivative of any portion of the Library, but
-   is designed to work with the Library by being compiled or linked with
-   it, is called a "work that uses the Library". Such a work, in isolation,
-   is not a derivative work of the Library, and therefore falls outside the
-   scope of this License.
+  If such an object file uses only numerical parameters, data
+structure layouts and accessors, and small macros and small inline
+functions (ten lines or less in length), then the use of the object
+file is unrestricted, regardless of whether it is legally a derivative
+work.  (Executables containing this object code plus portions of the
+Library will still fall under Section 6.)
 
-   However, linking a "work that uses the Library" with the Library creates
-   an executable that is a derivative of the Library (because it contains
-   portions of the Library), rather than a "work that uses the
-   library". The executable is therefore covered by this License. Section 6
-   states terms for distribution of such executables.
+  Otherwise, if the work is a derivative of the Library, you may
+distribute the object code for the work under the terms of Section 6.
+Any executables containing that work also fall under Section 6,
+whether or not they are linked directly with the Library itself.
+
+  6. As an exception to the Sections above, you may also compile or
+link a "work that uses the Library" with the Library to produce a
+work containing portions of the Library, and distribute that work
+under terms of your choice, provided that the terms permit
+modification of the work for the customer's own use and reverse
+engineering for debugging such modifications.
 
-   When a "work that uses the Library" uses material from a header file
-   that is part of the Library, the object code for the work may be a
-   derivative work of the Library even though the source code is
-   not. Whether this is true is especially significant if the work can be
-   linked without the Library, or if the work is itself a library. The
-   threshold for this to be true is not precisely defined by law.
+  You must give prominent notice with each copy of the work that the
+Library is used in it and that the Library and its use are covered by
+this License.  You must supply a copy of this License.  If the work
+during execution displays copyright notices, you must include the
+copyright notice for the Library among them, as well as a reference
+directing the user to the copy of this License.  Also, you must do one
+of these things:
 
-   If such an object file uses only numerical parameters, data structure
-   layouts and accessors, and small macros and small inline functions (ten
-   lines or less in length), then the use of the object file is
-   unrestricted, regardless of whether it is legally a derivative
-   work. (Executables containing this object code plus portions of the
-   Library will still fall under Section 6.)
+    a) Accompany the work with the complete corresponding
+    machine-readable source code for the Library including whatever
+    changes were used in the work (which must be distributed under
+    Sections 1 and 2 above); and, if the work is an executable linked
+    with the Library, with the complete machine-readable "work that
+    uses the Library", as object code and/or source code, so that the
+    user can modify the Library and then relink to produce a modified
+    executable containing the modified Library.  (It is understood
+    that the user who changes the contents of definitions files in the
+    Library will not necessarily be able to recompile the application
+    to use the modified definitions.)
 
-   Otherwise, if the work is a derivative of the Library, you may
-   distribute the object code for the work under the terms of Section
-   6. Any executables containing that work also fall under Section 6,
-   whether or not they are linked directly with the Library itself.
+    b) Accompany the work with a written offer, valid for at
+    least three years, to give the same user the materials
+    specified in Subsection 6a, above, for a charge no more
+    than the cost of performing this distribution.
 
-6. As an exception to the Sections above, you may also compile or link a
-   "work that uses the Library" with the Library to produce a work
-   containing portions of the Library, and distribute that work under terms
-   of your choice, provided that the terms permit modification of the work
-   for the customer's own use and reverse engineering for debugging such
-   modifications.
+    c) If distribution of the work is made by offering access to copy
+    from a designated place, offer equivalent access to copy the above
+    specified materials from the same place.
 
-   You must give prominent notice with each copy of the work that the
-   Library is used in it and that the Library and its use are covered by
-   this License. You must supply a copy of this License. If the work during
-   execution displays copyright notices, you must include the copyright
-   notice for the Library among them, as well as a reference directing the
-   user to the copy of this License. Also, you must do one of these things:
+    d) Verify that the user has already received a copy of these
+    materials or that you have already sent this user a copy.
 
-   a) Accompany the work with the complete corresponding machine-readable
-      source code for the Library including whatever changes were used in
-      the work (which must be distributed under Sections 1 and 2 above);
-      and, if the work is an executable linked with the Library, with the
-      complete machine-readable "work that uses the Library", as object
-      code and/or source code, so that the user can modify the Library and
-      then relink to produce a modified executable containing the modified
-      Library. (It is understood that the user who changes the contents of
-      definitions files in the Library will not necessarily be able to
-      recompile the application to use the modified definitions.)
+  For an executable, the required form of the "work that uses the
+Library" must include any data and utility programs needed for
+reproducing the executable from it.  However, as a special exception,
+the source code distributed need not include anything that is normally
+distributed (in either source or binary form) with the major
+components (compiler, kernel, and so on) of the operating system on
+which the executable runs, unless that component itself accompanies
+the executable.
 
-   b) Accompany the work with a written offer, valid for at least three
-      years, to give the same user the materials specified in Subsection
-      6a, above, for a charge no more than the cost of performing this
-      distribution.
+  It may happen that this requirement contradicts the license
+restrictions of other proprietary libraries that do not normally
+accompany the operating system.  Such a contradiction means you cannot
+use both them and the Library together in an executable that you
+distribute.
+
+  7. You may place library facilities that are a work based on the
+Library side-by-side in a single library together with other library
+facilities not covered by this License, and distribute such a combined
+library, provided that the separate distribution of the work based on
+the Library and of the other library facilities is otherwise
+permitted, and provided that you do these two things:
 
-   c) If distribution of the work is made by offering access to copy from a
-      designated place, offer equivalent access to copy the above specified
-      materials from the same place.
+    a) Accompany the combined library with a copy of the same work
+    based on the Library, uncombined with any other library
+    facilities.  This must be distributed under the terms of the
+    Sections above.
 
-   d) Verify that the user has already received a copy of these materials
-      or that you have already sent this user a copy.
+    b) Give prominent notice with the combined library of the fact
+    that part of it is a work based on the Library, and explaining
+    where to find the accompanying uncombined form of the same work.
 
-   For an executable, the required form of the "work that uses the Library"
-   must include any data and utility programs needed for reproducing the
-   executable from it. However, as a special exception, the source code
-   distributed need not include anything that is normally distributed (in
-   either source or binary form) with the major components (compiler,
-   kernel, and so on) of the operating system on which the executable runs,
-   unless that component itself accompanies the executable.
+  8. You may not copy, modify, sublicense, link with, or distribute
+the Library except as expressly provided under this License.  Any
+attempt otherwise to copy, modify, sublicense, link with, or
+distribute the Library is void, and will automatically terminate your
+rights under this License.  However, parties who have received copies,
+or rights, from you under this License will not have their licenses
+terminated so long as such parties remain in full compliance.
 
-   It may happen that this requirement contradicts the license restrictions
-   of other proprietary libraries that do not normally accompany the
-   operating system. Such a contradiction means you cannot use both them
-   and the Library together in an executable that you distribute.
+  9. You are not required to accept this License, since you have not
+signed it.  However, nothing else grants you permission to modify or
+distribute the Library or its derivative works.  These actions are
+prohibited by law if you do not accept this License.  Therefore, by
+modifying or distributing the Library (or any work based on the
+Library), you indicate your acceptance of this License to do so, and
+all its terms and conditions for copying, distributing or modifying
+the Library or works based on it.
 
-7. You may place library facilities that are a work based on the Library
-   side-by-side in a single library together with other library facilities
-   not covered by this License, and distribute such a combined library,
-   provided that the separate distribution of the work based on the Library
-   and of the other library facilities is otherwise permitted, and provided
-   that you do these two things:
+  10. Each time you redistribute the Library (or any work based on the
+Library), the recipient automatically receives a license from the
+original licensor to copy, distribute, link with or modify the Library
+subject to these terms and conditions.  You may not impose any further
+restrictions on the recipients' exercise of the rights granted herein.
+You are not responsible for enforcing compliance by third parties to
+this License.
+
+  11. If, as a consequence of a court judgment or allegation of patent
+infringement or for any other reason (not limited to patent issues),
+conditions are imposed on you (whether by court order, agreement or
+otherwise) that contradict the conditions of this License, they do not
+excuse you from the conditions of this License.  If you cannot
+distribute so as to satisfy simultaneously your obligations under this
+License and any other pertinent obligations, then as a consequence you
+may not distribute the Library at all.  For example, if a patent
+license would not permit royalty-free redistribution of the Library by
+all those who receive copies directly or indirectly through you, then
+the only way you could satisfy both it and this License would be to
+refrain entirely from distribution of the Library.
 
-   a) Accompany the combined library with a copy of the same work based on
-      the Library, uncombined with any other library facilities. This must
-      be distributed under the terms of the Sections above.
+If any portion of this section is held invalid or unenforceable under any
+particular circumstance, the balance of the section is intended to apply,
+and the section as a whole is intended to apply in other circumstances.
 
-   b) Give prominent notice with the combined library of the fact that part
-      of it is a work based on the Library, and explaining where to find
-      the accompanying uncombined form of the same work.
+It is not the purpose of this section to induce you to infringe any
+patents or other property right claims or to contest validity of any
+such claims; this section has the sole purpose of protecting the
+integrity of the free software distribution system which is
+implemented by public license practices.  Many people have made
+generous contributions to the wide range of software distributed
+through that system in reliance on consistent application of that
+system; it is up to the author/donor to decide if he or she is willing
+to distribute software through any other system and a licensee cannot
+impose that choice.
 
-8. You may not copy, modify, sublicense, link with, or distribute the
-   Library except as expressly provided under this License. Any attempt
-   otherwise to copy, modify, sublicense, link with, or distribute the
-   Library is void, and will automatically terminate your rights under this
-   License. However, parties who have received copies, or rights, from you
-   under this License will not have their licenses terminated so long as
-   such parties remain in full compliance.
+This section is intended to make thoroughly clear what is believed to
+be a consequence of the rest of this License.
 
-9. You are not required to accept this License, since you have not signed
-   it. However, nothing else grants you permission to modify or distribute
-   the Library or its derivative works. These actions are prohibited by law
-   if you do not accept this License. Therefore, by modifying or
-   distributing the Library (or any work based on the Library), you
-   indicate your acceptance of this License to do so, and all its terms and
-   conditions for copying, distributing or modifying the Library or works
-   based on it.
+  12. If the distribution and/or use of the Library is restricted in
+certain countries either by patents or by copyrighted interfaces, the
+original copyright holder who places the Library under this License may add
+an explicit geographical distribution limitation excluding those countries,
+so that distribution is permitted only in or among countries not thus
+excluded.  In such case, this License incorporates the limitation as if
+written in the body of this License.
 
-10. Each time you redistribute the Library (or any work based on the
-    Library), the recipient automatically receives a license from the
-    original licensor to copy, distribute, link with or modify the Library
-    subject to these terms and conditions. You may not impose any further
-    restrictions on the recipients' exercise of the rights granted
-    herein. You are not responsible for enforcing compliance by third
-    parties to this License.
+  13. The Free Software Foundation may publish revised and/or new
+versions of the Library General Public License from time to time.
+Such new versions will be similar in spirit to the present version,
+but may differ in detail to address new problems or concerns.
 
-11. If, as a consequence of a court judgment or allegation of patent
-    infringement or for any other reason (not limited to patent issues),
-    conditions are imposed on you (whether by court order, agreement or
-    otherwise) that contradict the conditions of this License, they do not
-    excuse you from the conditions of this License. If you cannot
-    distribute so as to satisfy simultaneously your obligations under this
-    License and any other pertinent obligations, then as a consequence you
-    may not distribute the Library at all. For example, if a patent license
-    would not permit royalty-free redistribution of the Library by all
-    those who receive copies directly or indirectly through you, then the
-    only way you could satisfy both it and this License would be to refrain
-    entirely from distribution of the Library.
+Each version is given a distinguishing version number.  If the Library
+specifies a version number of this License which applies to it and
+"any later version", you have the option of following the terms and
+conditions either of that version or of any later version published by
+the Free Software Foundation.  If the Library does not specify a
+license version number, you may choose any version ever published by
+the Free Software Foundation.
+
+  14. If you wish to incorporate parts of the Library into other free
+programs whose distribution conditions are incompatible with these,
+write to the author to ask for permission.  For software which is
+copyrighted by the Free Software Foundation, write to the Free
+Software Foundation; we sometimes make exceptions for this.  Our
+decision will be guided by the two goals of preserving the free status
+of all derivatives of our free software and of promoting the sharing
+and reuse of software generally.
 
-    If any portion of this section is held invalid or unenforceable under
-    any particular circumstance, the balance of the section is intended to
-    apply, and the section as a whole is intended to apply in other
-    circumstances.
+                            NO WARRANTY
 
-    It is not the purpose of this section to induce you to infringe any
-    patents or other property right claims or to contest validity of any
-    such claims; this section has the sole purpose of protecting the
-    integrity of the free software distribution system which is implemented
-    by public license practices. Many people have made generous
-    contributions to the wide range of software distributed through that
-    system in reliance on consistent application of that system; it is up
-    to the author/donor to decide if he or she is willing to distribute
-    software through any other system and a licensee cannot impose that
-    choice.
+  15. BECAUSE THE LIBRARY IS LICENSED FREE OF CHARGE, THERE IS NO
+WARRANTY FOR THE LIBRARY, TO THE EXTENT PERMITTED BY APPLICABLE LAW.
+EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR
+OTHER PARTIES PROVIDE THE LIBRARY "AS IS" WITHOUT WARRANTY OF ANY
+KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE
+IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
+PURPOSE.  THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE
+LIBRARY IS WITH YOU.  SHOULD THE LIBRARY PROVE DEFECTIVE, YOU ASSUME
+THE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION.
 
-    This section is intended to make thoroughly clear what is believed to
-    be a consequence of the rest of this License.
+  16. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN
+WRITING WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY
+AND/OR REDISTRIBUTE THE LIBRARY AS PERMITTED ABOVE, BE LIABLE TO YOU
+FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR
+CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE THE
+LIBRARY (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING
+RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A
+FAILURE OF THE LIBRARY TO OPERATE WITH ANY OTHER SOFTWARE), EVEN IF
+SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH
+DAMAGES.
 
-12. If the distribution and/or use of the Library is restricted in certain
-    countries either by patents or by copyrighted interfaces, the original
-    copyright holder who places the Library under this License may add an
-    explicit geographical distribution limitation excluding those
-    countries, so that distribution is permitted only in or among countries
-    not thus excluded. In such case, this License incorporates the
-    limitation as if written in the body of this License.
+                     END OF TERMS AND CONDITIONS
+
+           How to Apply These Terms to Your New Libraries
 
-13. The Free Software Foundation may publish revised and/or new versions of
-    the Library General Public License from time to time. Such new versions
-    will be similar in spirit to the present version, but may differ in
-    detail to address new problems or concerns.
-
-    Each version is given a distinguishing version number. If the Library
-    specifies a version number of this License which applies to it and "any
-    later version", you have the option of following the terms and
-    conditions either of that version or of any later version published by
-    the Free Software Foundation. If the Library does not specify a license
-    version number, you may choose any version ever published by the Free
-    Software Foundation.
-
-14. If you wish to incorporate parts of the Library into other free
-    programs whose distribution conditions are incompatible with these,
-    write to the author to ask for permission. For software which is
-    copyrighted by the Free Software Foundation, write to the Free Software
-    Foundation; we sometimes make exceptions for this. Our decision will be
-    guided by the two goals of preserving the free status of all
-    derivatives of our free software and of promoting the sharing and reuse
-    of software generally.
-
-NO WARRANTY
-
-15. BECAUSE THE LIBRARY IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
-    FOR THE LIBRARY, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN
-    OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
-    PROVIDE THE LIBRARY "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER
-    EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
-    WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE
-    ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE LIBRARY IS WITH
-    YOU. SHOULD THE LIBRARY PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL
-    NECESSARY SERVICING, REPAIR OR CORRECTION.
-
-16. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
-    WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
-    REDISTRIBUTE THE LIBRARY AS PERMITTED ABOVE, BE LIABLE TO YOU FOR
-    DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL
-    DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE THE LIBRARY
-    (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING RENDERED
-    INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A FAILURE OF
-    THE LIBRARY TO OPERATE WITH ANY OTHER SOFTWARE), EVEN IF SUCH HOLDER OR
-    OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
-
-END OF TERMS AND CONDITIONS
-
-How to Apply These Terms to Your New Libraries
-
-If you develop a new library, and you want it to be of the greatest
+  If you develop a new library, and you want it to be of the greatest
 possible use to the public, we recommend making it free software that
-everyone can redistribute and change. You can do so by permitting
+everyone can redistribute and change.  You can do so by permitting
 redistribution under these terms (or, alternatively, under the terms of the
 ordinary General Public License).
 
-To apply these terms, attach the following notices to the library. It is
+  To apply these terms, attach the following notices to the library.  It is
 safest to attach them to the start of each source file to most effectively
 convey the exclusion of warranty; and each file should have at least the
 "copyright" line and a pointer to where the full notice is found.
 
-one line to give the library's name and an idea of what it does.
-Copyright (C) year name of author
+    <one line to give the library's name and a brief idea of what it does.>
+    Copyright (C) <year>  <name of author>
 
-This library is free software; you can redistribute it and/or modify it
-under the terms of the GNU Library General Public License as published by
-the Free Software Foundation; either version 2 of the License, or (at your
-option) any later version.
+    This library is free software; you can redistribute it and/or
+    modify it under the terms of the GNU Library General Public
+    License as published by the Free Software Foundation; either
+    version 2 of the License, or (at your option) any later version.
 
-This library is distributed in the hope that it will be useful, but WITHOUT
-ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-FITNESS FOR A PARTICULAR PURPOSE. See the GNU Library General Public
-License for more details.
+    This library is distributed in the hope that it will be useful,
+    but WITHOUT ANY WARRANTY; without even the implied warranty of
+    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+    Library General Public License for more details.
 
-You should have received a copy of the GNU Library General Public License
-along with this library; if not, write to the Free Software Foundation,
-Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
+    You should have received a copy of the GNU Library General Public
+    License along with this library; if not, see <https://www.gnu.org/licenses/>.
 
 Also add information on how to contact you by electronic and paper mail.
 
 You should also get your employer (if you work as a programmer) or your
 school, if any, to sign a "copyright disclaimer" for the library, if
-necessary. Here is a sample; alter the names:
+necessary.  Here is a sample; alter the names:
 
-Yoyodyne, Inc., hereby disclaims all copyright interest in
-the library `Frob' (a library for tweaking knobs) written
-by James Random Hacker.
+  Yoyodyne, Inc., hereby disclaims all copyright interest in the
+  library `Frob' (a library for tweaking knobs) written by James Random Hacker.
 
-signature of Ty Coon, 1 April 1990
-Ty Coon, President of Vice
+  <signature of Moe Ghoul>, 1 April 1990
+  Moe Ghoul, President of Vice
 
 That's all there is to it!
diff --git a/LICENSES/preferred/LGPL-2.1 b/LICENSES/preferred/LGPL-2.1
index b73f9b6230f5..36638f37ede0 100644
--- a/LICENSES/preferred/LGPL-2.1
+++ b/LICENSES/preferred/LGPL-2.1
@@ -14,492 +14,504 @@ Usage-Guide:
     SPDX-License-Identifier: LGPL-2.1+
 License-Text:
 
-GNU LESSER GENERAL PUBLIC LICENSE
-Version 2.1, February 1999
+                  GNU LESSER GENERAL PUBLIC LICENSE
+                       Version 2.1, February 1999
 
-Copyright (C) 1991, 1999 Free Software Foundation, Inc.
-51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+ Copyright (C) 1991, 1999 Free Software Foundation, Inc.
+ <https://fsf.org/>
+ Everyone is permitted to copy and distribute verbatim copies
+ of this license document, but changing it is not allowed.
 
-Everyone is permitted to copy and distribute verbatim copies of this
-license document, but changing it is not allowed.
+[This is the first released version of the Lesser GPL.  It also counts
+ as the successor of the GNU Library Public License, version 2, hence
+ the version number 2.1.]
 
-[This is the first released version of the Lesser GPL. It also counts as
-the successor of the GNU Library Public License, version 2, hence the
-version number 2.1.]
+                            Preamble
 
-Preamble
+  The licenses for most software are designed to take away your
+freedom to share and change it.  By contrast, the GNU General Public
+Licenses are intended to guarantee your freedom to share and change
+free software--to make sure the software is free for all its users.
 
-The licenses for most software are designed to take away your freedom to
-share and change it. By contrast, the GNU General Public Licenses are
-intended to guarantee your freedom to share and change free software--to
-make sure the software is free for all its users.
+  This license, the Lesser General Public License, applies to some
+specially designated software packages--typically libraries--of the
+Free Software Foundation and other authors who decide to use it.  You
+can use it too, but we suggest you first think carefully about whether
+this license or the ordinary General Public License is the better
+strategy to use in any particular case, based on the explanations below.
 
-This license, the Lesser General Public License, applies to some specially
-designated software packages--typically libraries--of the Free Software
-Foundation and other authors who decide to use it. You can use it too, but
-we suggest you first think carefully about whether this license or the
-ordinary General Public License is the better strategy to use in any
-particular case, based on the explanations below.
+  When we speak of free software, we are referring to freedom of use,
+not price.  Our General Public Licenses are designed to make sure that
+you have the freedom to distribute copies of free software (and charge
+for this service if you wish); that you receive source code or can get
+it if you want it; that you can change the software and use pieces of
+it in new free programs; and that you are informed that you can do
+these things.
 
-When we speak of free software, we are referring to freedom of use, not
-price. Our General Public Licenses are designed to make sure that you have
-the freedom to distribute copies of free software (and charge for this
-service if you wish); that you receive source code or can get it if you
-want it; that you can change the software and use pieces of it in new free
-programs; and that you are informed that you can do these things.
-
-To protect your rights, we need to make restrictions that forbid
+  To protect your rights, we need to make restrictions that forbid
 distributors to deny you these rights or to ask you to surrender these
-rights. These restrictions translate to certain responsibilities for you if
-you distribute copies of the library or if you modify it.
+rights.  These restrictions translate to certain responsibilities for
+you if you distribute copies of the library or if you modify it.
 
-For example, if you distribute copies of the library, whether gratis or for
-a fee, you must give the recipients all the rights that we gave you. You
-must make sure that they, too, receive or can get the source code. If you
-link other code with the library, you must provide complete object files to
-the recipients, so that they can relink them with the library after making
-changes to the library and recompiling it. And you must show them these
-terms so they know their rights.
+  For example, if you distribute copies of the library, whether gratis
+or for a fee, you must give the recipients all the rights that we gave
+you.  You must make sure that they, too, receive or can get the source
+code.  If you link other code with the library, you must provide
+complete object files to the recipients, so that they can relink them
+with the library after making changes to the library and recompiling
+it.  And you must show them these terms so they know their rights.
 
-We protect your rights with a two-step method: (1) we copyright the
+  We protect your rights with a two-step method: (1) we copyright the
 library, and (2) we offer you this license, which gives you legal
 permission to copy, distribute and/or modify the library.
 
-To protect each distributor, we want to make it very clear that there is no
-warranty for the free library. Also, if the library is modified by someone
-else and passed on, the recipients should know that what they have is not
-the original version, so that the original author's reputation will not be
-affected by problems that might be introduced by others.
+  To protect each distributor, we want to make it very clear that
+there is no warranty for the free library.  Also, if the library is
+modified by someone else and passed on, the recipients should know
+that what they have is not the original version, so that the original
+author's reputation will not be affected by problems that might be
+introduced by others.
+
+  Finally, software patents pose a constant threat to the existence of
+any free program.  We wish to make sure that a company cannot
+effectively restrict the users of a free program by obtaining a
+restrictive license from a patent holder.  Therefore, we insist that
+any patent license obtained for a version of the library must be
+consistent with the full freedom of use specified in this license.
 
-Finally, software patents pose a constant threat to the existence of any
-free program. We wish to make sure that a company cannot effectively
-restrict the users of a free program by obtaining a restrictive license
-from a patent holder. Therefore, we insist that any patent license obtained
-for a version of the library must be consistent with the full freedom of
-use specified in this license.
+  Most GNU software, including some libraries, is covered by the
+ordinary GNU General Public License.  This license, the GNU Lesser
+General Public License, applies to certain designated libraries, and
+is quite different from the ordinary General Public License.  We use
+this license for certain libraries in order to permit linking those
+libraries into non-free programs.
 
-Most GNU software, including some libraries, is covered by the ordinary GNU
-General Public License. This license, the GNU Lesser General Public
-License, applies to certain designated libraries, and is quite different
-from the ordinary General Public License. We use this license for certain
-libraries in order to permit linking those libraries into non-free
-programs.
+  When a program is linked with a library, whether statically or using
+a shared library, the combination of the two is legally speaking a
+combined work, a derivative of the original library.  The ordinary
+General Public License therefore permits such linking only if the
+entire combination fits its criteria of freedom.  The Lesser General
+Public License permits more lax criteria for linking other code with
+the library.
 
-When a program is linked with a library, whether statically or using a
-shared library, the combination of the two is legally speaking a combined
-work, a derivative of the original library. The ordinary General Public
-License therefore permits such linking only if the entire combination fits
-its criteria of freedom. The Lesser General Public License permits more lax
-criteria for linking other code with the library.
-
-We call this license the "Lesser" General Public License because it does
-Less to protect the user's freedom than the ordinary General Public
-License. It also provides other free software developers Less of an
-advantage over competing non-free programs. These disadvantages are the
-reason we use the ordinary General Public License for many
-libraries. However, the Lesser license provides advantages in certain
+  We call this license the "Lesser" General Public License because it
+does Less to protect the user's freedom than the ordinary General
+Public License.  It also provides other free software developers Less
+of an advantage over competing non-free programs.  These disadvantages
+are the reason we use the ordinary General Public License for many
+libraries.  However, the Lesser license provides advantages in certain
 special circumstances.
 
-For example, on rare occasions, there may be a special need to encourage
-the widest possible use of a certain library, so that it becomes a de-facto
-standard. To achieve this, non-free programs must be allowed to use the
-library. A more frequent case is that a free library does the same job as
-widely used non-free libraries. In this case, there is little to gain by
-limiting the free library to free software only, so we use the Lesser
-General Public License.
+  For example, on rare occasions, there may be a special need to
+encourage the widest possible use of a certain library, so that it becomes
+a de-facto standard.  To achieve this, non-free programs must be
+allowed to use the library.  A more frequent case is that a free
+library does the same job as widely used non-free libraries.  In this
+case, there is little to gain by limiting the free library to free
+software only, so we use the Lesser General Public License.
 
-In other cases, permission to use a particular library in non-free programs
-enables a greater number of people to use a large body of free
-software. For example, permission to use the GNU C Library in non-free
-programs enables many more people to use the whole GNU operating system, as
-well as its variant, the GNU/Linux operating system.
+  In other cases, permission to use a particular library in non-free
+programs enables a greater number of people to use a large body of
+free software.  For example, permission to use the GNU C Library in
+non-free programs enables many more people to use the whole GNU
+operating system, as well as its variant, the GNU/Linux operating
+system.
 
-Although the Lesser General Public License is Less protective of the users'
-freedom, it does ensure that the user of a program that is linked with the
-Library has the freedom and the wherewithal to run that program using a
-modified version of the Library.
+  Although the Lesser General Public License is Less protective of the
+users' freedom, it does ensure that the user of a program that is
+linked with the Library has the freedom and the wherewithal to run
+that program using a modified version of the Library.
 
-The precise terms and conditions for copying, distribution and modification
-follow. Pay close attention to the difference between a "work based on the
-library" and a "work that uses the library". The former contains code
-derived from the library, whereas the latter must be combined with the
-library in order to run.
+  The precise terms and conditions for copying, distribution and
+modification follow.  Pay close attention to the difference between a
+"work based on the library" and a "work that uses the library".  The
+former contains code derived from the library, whereas the latter must
+be combined with the library in order to run.
+
+                  GNU LESSER GENERAL PUBLIC LICENSE
+   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
 
-TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
+  0. This License Agreement applies to any software library or other
+program which contains a notice placed by the copyright holder or
+other authorized party saying it may be distributed under the terms of
+this Lesser General Public License (also called "this License").
+Each licensee is addressed as "you".
 
-0. This License Agreement applies to any software library or other program
-   which contains a notice placed by the copyright holder or other
-   authorized party saying it may be distributed under the terms of this
-   Lesser General Public License (also called "this License"). Each
-   licensee is addressed as "you".
+  A "library" means a collection of software functions and/or data
+prepared so as to be conveniently linked with application programs
+(which use some of those functions and data) to form executables.
 
-   A "library" means a collection of software functions and/or data
-   prepared so as to be conveniently linked with application programs
-   (which use some of those functions and data) to form executables.
+  The "Library", below, refers to any such software library or work
+which has been distributed under these terms.  A "work based on the
+Library" means either the Library or any derivative work under
+copyright law: that is to say, a work containing the Library or a
+portion of it, either verbatim or with modifications and/or translated
+straightforwardly into another language.  (Hereinafter, translation is
+included without limitation in the term "modification".)
 
-   The "Library", below, refers to any such software library or work which
-   has been distributed under these terms. A "work based on the Library"
-   means either the Library or any derivative work under copyright law:
-   that is to say, a work containing the Library or a portion of it, either
-   verbatim or with modifications and/or translated straightforwardly into
-   another language. (Hereinafter, translation is included without
-   limitation in the term "modification".)
+  "Source code" for a work means the preferred form of the work for
+making modifications to it.  For a library, complete source code means
+all the source code for all modules it contains, plus any associated
+interface definition files, plus the scripts used to control compilation
+and installation of the library.
 
-   "Source code" for a work means the preferred form of the work for making
-   modifications to it. For a library, complete source code means all the
-   source code for all modules it contains, plus any associated interface
-   definition files, plus the scripts used to control compilation and
-   installation of the library.
+  Activities other than copying, distribution and modification are not
+covered by this License; they are outside its scope.  The act of
+running a program using the Library is not restricted, and output from
+such a program is covered only if its contents constitute a work based
+on the Library (independent of the use of the Library in a tool for
+writing it).  Whether that is true depends on what the Library does
+and what the program that uses the Library does.
 
-    Activities other than copying, distribution and modification are not
-    covered by this License; they are outside its scope. The act of running
-    a program using the Library is not restricted, and output from such a
-    program is covered only if its contents constitute a work based on the
-    Library (independent of the use of the Library in a tool for writing
-    it). Whether that is true depends on what the Library does and what the
-    program that uses the Library does.
+  1. You may copy and distribute verbatim copies of the Library's
+complete source code as you receive it, in any medium, provided that
+you conspicuously and appropriately publish on each copy an
+appropriate copyright notice and disclaimer of warranty; keep intact
+all the notices that refer to this License and to the absence of any
+warranty; and distribute a copy of this License along with the
+Library.
 
-1. You may copy and distribute verbatim copies of the Library's complete
-   source code as you receive it, in any medium, provided that you
-   conspicuously and appropriately publish on each copy an appropriate
-   copyright notice and disclaimer of warranty; keep intact all the notices
-   that refer to this License and to the absence of any warranty; and
-   distribute a copy of this License along with the Library.
+  You may charge a fee for the physical act of transferring a copy,
+and you may at your option offer warranty protection in exchange for a
+fee.
+
+  2. You may modify your copy or copies of the Library or any portion
+of it, thus forming a work based on the Library, and copy and
+distribute such modifications or work under the terms of Section 1
+above, provided that you also meet all of these conditions:
 
-   You may charge a fee for the physical act of transferring a copy, and
-   you may at your option offer warranty protection in exchange for a fee.
+    a) The modified work must itself be a software library.
 
-2. You may modify your copy or copies of the Library or any portion of it,
-   thus forming a work based on the Library, and copy and distribute such
-   modifications or work under the terms of Section 1 above, provided that
-   you also meet all of these conditions:
+    b) You must cause the files modified to carry prominent notices
+    stating that you changed the files and the date of any change.
 
-   a) The modified work must itself be a software library.
+    c) You must cause the whole of the work to be licensed at no
+    charge to all third parties under the terms of this License.
 
-   b) You must cause the files modified to carry prominent notices stating
-      that you changed the files and the date of any change.
+    d) If a facility in the modified Library refers to a function or a
+    table of data to be supplied by an application program that uses
+    the facility, other than as an argument passed when the facility
+    is invoked, then you must make a good faith effort to ensure that,
+    in the event an application does not supply such function or
+    table, the facility still operates, and performs whatever part of
+    its purpose remains meaningful.
 
-   c) You must cause the whole of the work to be licensed at no charge to
-      all third parties under the terms of this License.
+    (For example, a function in a library to compute square roots has
+    a purpose that is entirely well-defined independent of the
+    application.  Therefore, Subsection 2d requires that any
+    application-supplied function or table used by this function must
+    be optional: if the application does not supply it, the square
+    root function must still compute square roots.)
 
-   d) If a facility in the modified Library refers to a function or a table
-      of data to be supplied by an application program that uses the
-      facility, other than as an argument passed when the facility is
-      invoked, then you must make a good faith effort to ensure that, in
-      the event an application does not supply such function or table, the
-      facility still operates, and performs whatever part of its purpose
-      remains meaningful.
+These requirements apply to the modified work as a whole.  If
+identifiable sections of that work are not derived from the Library,
+and can be reasonably considered independent and separate works in
+themselves, then this License, and its terms, do not apply to those
+sections when you distribute them as separate works.  But when you
+distribute the same sections as part of a whole which is a work based
+on the Library, the distribution of the whole must be on the terms of
+this License, whose permissions for other licensees extend to the
+entire whole, and thus to each and every part regardless of who wrote
+it.
 
-   (For example, a function in a library to compute square roots has a
-    purpose that is entirely well-defined independent of the
-    application. Therefore, Subsection 2d requires that any
-    application-supplied function or table used by this function must be
-    optional: if the application does not supply it, the square root
-    function must still compute square roots.)
+Thus, it is not the intent of this section to claim rights or contest
+your rights to work written entirely by you; rather, the intent is to
+exercise the right to control the distribution of derivative or
+collective works based on the Library.
 
-   These requirements apply to the modified work as a whole. If
-   identifiable sections of that work are not derived from the Library, and
-   can be reasonably considered independent and separate works in
-   themselves, then this License, and its terms, do not apply to those
-   sections when you distribute them as separate works. But when you
-   distribute the same sections as part of a whole which is a work based on
-   the Library, the distribution of the whole must be on the terms of this
-   License, whose permissions for other licensees extend to the entire
-   whole, and thus to each and every part regardless of who wrote it.
+In addition, mere aggregation of another work not based on the Library
+with the Library (or with a work based on the Library) on a volume of
+a storage or distribution medium does not bring the other work under
+the scope of this License.
 
-   Thus, it is not the intent of this section to claim rights or contest
-   your rights to work written entirely by you; rather, the intent is to
-   exercise the right to control the distribution of derivative or
-   collective works based on the Library.
+  3. You may opt to apply the terms of the ordinary GNU General Public
+License instead of this License to a given copy of the Library.  To do
+this, you must alter all the notices that refer to this License, so
+that they refer to the ordinary GNU General Public License, version 2,
+instead of to this License.  (If a newer version than version 2 of the
+ordinary GNU General Public License has appeared, then you can specify
+that version instead if you wish.)  Do not make any other change in
+these notices.
+
+  Once this change is made in a given copy, it is irreversible for
+that copy, so the ordinary GNU General Public License applies to all
+subsequent copies and derivative works made from that copy.
 
-   In addition, mere aggregation of another work not based on the Library
-   with the Library (or with a work based on the Library) on a volume of a
-   storage or distribution medium does not bring the other work under the
-   scope of this License.
+  This option is useful when you wish to copy part of the code of
+the Library into a program that is not a library.
 
-3. You may opt to apply the terms of the ordinary GNU General Public
-   License instead of this License to a given copy of the Library. To do
-   this, you must alter all the notices that refer to this License, so that
-   they refer to the ordinary GNU General Public License, version 2,
-   instead of to this License. (If a newer version than version 2 of the
-   ordinary GNU General Public License has appeared, then you can specify
-   that version instead if you wish.) Do not make any other change in these
-   notices.
+  4. You may copy and distribute the Library (or a portion or
+derivative of it, under Section 2) in object code or executable form
+under the terms of Sections 1 and 2 above provided that you accompany
+it with the complete corresponding machine-readable source code, which
+must be distributed under the terms of Sections 1 and 2 above on a
+medium customarily used for software interchange.
 
-   Once this change is made in a given copy, it is irreversible for that
-   copy, so the ordinary GNU General Public License applies to all
-   subsequent copies and derivative works made from that copy.
+  If distribution of object code is made by offering access to copy
+from a designated place, then offering equivalent access to copy the
+source code from the same place satisfies the requirement to
+distribute the source code, even though third parties are not
+compelled to copy the source along with the object code.
 
-   This option is useful when you wish to copy part of the code of the
-   Library into a program that is not a library.
+  5. A program that contains no derivative of any portion of the
+Library, but is designed to work with the Library by being compiled or
+linked with it, is called a "work that uses the Library".  Such a
+work, in isolation, is not a derivative work of the Library, and
+therefore falls outside the scope of this License.
 
-4. You may copy and distribute the Library (or a portion or derivative of
-   it, under Section 2) in object code or executable form under the terms
-   of Sections 1 and 2 above provided that you accompany it with the
-   complete corresponding machine-readable source code, which must be
-   distributed under the terms of Sections 1 and 2 above on a medium
-   customarily used for software interchange.
+  However, linking a "work that uses the Library" with the Library
+creates an executable that is a derivative of the Library (because it
+contains portions of the Library), rather than a "work that uses the
+library".  The executable is therefore covered by this License.
+Section 6 states terms for distribution of such executables.
 
-   If distribution of object code is made by offering access to copy from a
-   designated place, then offering equivalent access to copy the source
-   code from the same place satisfies the requirement to distribute the
-   source code, even though third parties are not compelled to copy the
-   source along with the object code.
+  When a "work that uses the Library" uses material from a header file
+that is part of the Library, the object code for the work may be a
+derivative work of the Library even though the source code is not.
+Whether this is true is especially significant if the work can be
+linked without the Library, or if the work is itself a library.  The
+threshold for this to be true is not precisely defined by law.
 
-5. A program that contains no derivative of any portion of the Library, but
-   is designed to work with the Library by being compiled or linked with
-   it, is called a "work that uses the Library". Such a work, in isolation,
-   is not a derivative work of the Library, and therefore falls outside the
-   scope of this License.
+  If such an object file uses only numerical parameters, data
+structure layouts and accessors, and small macros and small inline
+functions (ten lines or less in length), then the use of the object
+file is unrestricted, regardless of whether it is legally a derivative
+work.  (Executables containing this object code plus portions of the
+Library will still fall under Section 6.)
 
-   However, linking a "work that uses the Library" with the Library creates
-   an executable that is a derivative of the Library (because it contains
-   portions of the Library), rather than a "work that uses the
-   library". The executable is therefore covered by this License. Section 6
-   states terms for distribution of such executables.
+  Otherwise, if the work is a derivative of the Library, you may
+distribute the object code for the work under the terms of Section 6.
+Any executables containing that work also fall under Section 6,
+whether or not they are linked directly with the Library itself.
+
+  6. As an exception to the Sections above, you may also combine or
+link a "work that uses the Library" with the Library to produce a
+work containing portions of the Library, and distribute that work
+under terms of your choice, provided that the terms permit
+modification of the work for the customer's own use and reverse
+engineering for debugging such modifications.
 
-   When a "work that uses the Library" uses material from a header file
-   that is part of the Library, the object code for the work may be a
-   derivative work of the Library even though the source code is
-   not. Whether this is true is especially significant if the work can be
-   linked without the Library, or if the work is itself a library. The
-   threshold for this to be true is not precisely defined by law.
+  You must give prominent notice with each copy of the work that the
+Library is used in it and that the Library and its use are covered by
+this License.  You must supply a copy of this License.  If the work
+during execution displays copyright notices, you must include the
+copyright notice for the Library among them, as well as a reference
+directing the user to the copy of this License.  Also, you must do one
+of these things:
 
-   If such an object file uses only numerical parameters, data structure
-   layouts and accessors, and small macros and small inline functions (ten
-   lines or less in length), then the use of the object file is
-   unrestricted, regardless of whether it is legally a derivative
-   work. (Executables containing this object code plus portions of the
-   Library will still fall under Section 6.)
+    a) Accompany the work with the complete corresponding
+    machine-readable source code for the Library including whatever
+    changes were used in the work (which must be distributed under
+    Sections 1 and 2 above); and, if the work is an executable linked
+    with the Library, with the complete machine-readable "work that
+    uses the Library", as object code and/or source code, so that the
+    user can modify the Library and then relink to produce a modified
+    executable containing the modified Library.  (It is understood
+    that the user who changes the contents of definitions files in the
+    Library will not necessarily be able to recompile the application
+    to use the modified definitions.)
 
-   Otherwise, if the work is a derivative of the Library, you may
-   distribute the object code for the work under the terms of Section
-   6. Any executables containing that work also fall under Section 6,
-   whether or not they are linked directly with the Library itself.
+    b) Use a suitable shared library mechanism for linking with the
+    Library.  A suitable mechanism is one that (1) uses at run time a
+    copy of the library already present on the user's computer system,
+    rather than copying library functions into the executable, and (2)
+    will operate properly with a modified version of the library, if
+    the user installs one, as long as the modified version is
+    interface-compatible with the version that the work was made with.
 
-6. As an exception to the Sections above, you may also combine or link a
-   "work that uses the Library" with the Library to produce a work
-   containing portions of the Library, and distribute that work under terms
-   of your choice, provided that the terms permit modification of the work
-   for the customer's own use and reverse engineering for debugging such
-   modifications.
+    c) Accompany the work with a written offer, valid for at
+    least three years, to give the same user the materials
+    specified in Subsection 6a, above, for a charge no more
+    than the cost of performing this distribution.
 
-   You must give prominent notice with each copy of the work that the
-   Library is used in it and that the Library and its use are covered by
-   this License. You must supply a copy of this License. If the work during
-   execution displays copyright notices, you must include the copyright
-   notice for the Library among them, as well as a reference directing the
-   user to the copy of this License. Also, you must do one of these things:
+    d) If distribution of the work is made by offering access to copy
+    from a designated place, offer equivalent access to copy the above
+    specified materials from the same place.
 
-   a) Accompany the work with the complete corresponding machine-readable
-      source code for the Library including whatever changes were used in
-      the work (which must be distributed under Sections 1 and 2 above);
-      and, if the work is an executable linked with the Library, with the
-      complete machine-readable "work that uses the Library", as object
-      code and/or source code, so that the user can modify the Library and
-      then relink to produce a modified executable containing the modified
-      Library. (It is understood that the user who changes the contents of
-      definitions files in the Library will not necessarily be able to
-      recompile the application to use the modified definitions.)
+    e) Verify that the user has already received a copy of these
+    materials or that you have already sent this user a copy.
 
-   b) Use a suitable shared library mechanism for linking with the
-      Library. A suitable mechanism is one that (1) uses at run time a copy
-      of the library already present on the user's computer system, rather
-      than copying library functions into the executable, and (2) will
-      operate properly with a modified version of the library, if the user
-      installs one, as long as the modified version is interface-compatible
-      with the version that the work was made with.
+  For an executable, the required form of the "work that uses the
+Library" must include any data and utility programs needed for
+reproducing the executable from it.  However, as a special exception,
+the materials to be distributed need not include anything that is
+normally distributed (in either source or binary form) with the major
+components (compiler, kernel, and so on) of the operating system on
+which the executable runs, unless that component itself accompanies
+the executable.
 
-   c) Accompany the work with a written offer, valid for at least three
-      years, to give the same user the materials specified in Subsection
-      6a, above, for a charge no more than the cost of performing this
-      distribution.
+  It may happen that this requirement contradicts the license
+restrictions of other proprietary libraries that do not normally
+accompany the operating system.  Such a contradiction means you cannot
+use both them and the Library together in an executable that you
+distribute.
+
+  7. You may place library facilities that are a work based on the
+Library side-by-side in a single library together with other library
+facilities not covered by this License, and distribute such a combined
+library, provided that the separate distribution of the work based on
+the Library and of the other library facilities is otherwise
+permitted, and provided that you do these two things:
 
-   d) If distribution of the work is made by offering access to copy from a
-      designated place, offer equivalent access to copy the above specified
-      materials from the same place.
+    a) Accompany the combined library with a copy of the same work
+    based on the Library, uncombined with any other library
+    facilities.  This must be distributed under the terms of the
+    Sections above.
 
-   e) Verify that the user has already received a copy of these materials
-      or that you have already sent this user a copy.
+    b) Give prominent notice with the combined library of the fact
+    that part of it is a work based on the Library, and explaining
+    where to find the accompanying uncombined form of the same work.
 
-   For an executable, the required form of the "work that uses the Library"
-   must include any data and utility programs needed for reproducing the
-   executable from it. However, as a special exception, the materials to be
-   distributed need not include anything that is normally distributed (in
-   either source or binary form) with the major components (compiler,
-   kernel, and so on) of the operating system on which the executable runs,
-   unless that component itself accompanies the executable.
+  8. You may not copy, modify, sublicense, link with, or distribute
+the Library except as expressly provided under this License.  Any
+attempt otherwise to copy, modify, sublicense, link with, or
+distribute the Library is void, and will automatically terminate your
+rights under this License.  However, parties who have received copies,
+or rights, from you under this License will not have their licenses
+terminated so long as such parties remain in full compliance.
 
-   It may happen that this requirement contradicts the license restrictions
-   of other proprietary libraries that do not normally accompany the
-   operating system. Such a contradiction means you cannot use both them
-   and the Library together in an executable that you distribute.
+  9. You are not required to accept this License, since you have not
+signed it.  However, nothing else grants you permission to modify or
+distribute the Library or its derivative works.  These actions are
+prohibited by law if you do not accept this License.  Therefore, by
+modifying or distributing the Library (or any work based on the
+Library), you indicate your acceptance of this License to do so, and
+all its terms and conditions for copying, distributing or modifying
+the Library or works based on it.
 
-7. You may place library facilities that are a work based on the Library
-   side-by-side in a single library together with other library facilities
-   not covered by this License, and distribute such a combined library,
-   provided that the separate distribution of the work based on the Library
-   and of the other library facilities is otherwise permitted, and provided
-   that you do these two things:
+  10. Each time you redistribute the Library (or any work based on the
+Library), the recipient automatically receives a license from the
+original licensor to copy, distribute, link with or modify the Library
+subject to these terms and conditions.  You may not impose any further
+restrictions on the recipients' exercise of the rights granted herein.
+You are not responsible for enforcing compliance by third parties with
+this License.
+
+  11. If, as a consequence of a court judgment or allegation of patent
+infringement or for any other reason (not limited to patent issues),
+conditions are imposed on you (whether by court order, agreement or
+otherwise) that contradict the conditions of this License, they do not
+excuse you from the conditions of this License.  If you cannot
+distribute so as to satisfy simultaneously your obligations under this
+License and any other pertinent obligations, then as a consequence you
+may not distribute the Library at all.  For example, if a patent
+license would not permit royalty-free redistribution of the Library by
+all those who receive copies directly or indirectly through you, then
+the only way you could satisfy both it and this License would be to
+refrain entirely from distribution of the Library.
 
-   a) Accompany the combined library with a copy of the same work based on
-      the Library, uncombined with any other library facilities. This must
-      be distributed under the terms of the Sections above.
+If any portion of this section is held invalid or unenforceable under any
+particular circumstance, the balance of the section is intended to apply,
+and the section as a whole is intended to apply in other circumstances.
 
-   b) Give prominent notice with the combined library of the fact that part
-      of it is a work based on the Library, and explaining where to find
-      the accompanying uncombined form of the same work.
+It is not the purpose of this section to induce you to infringe any
+patents or other property right claims or to contest validity of any
+such claims; this section has the sole purpose of protecting the
+integrity of the free software distribution system which is
+implemented by public license practices.  Many people have made
+generous contributions to the wide range of software distributed
+through that system in reliance on consistent application of that
+system; it is up to the author/donor to decide if he or she is willing
+to distribute software through any other system and a licensee cannot
+impose that choice.
 
-8. You may not copy, modify, sublicense, link with, or distribute the
-   Library except as expressly provided under this License. Any attempt
-   otherwise to copy, modify, sublicense, link with, or distribute the
-   Library is void, and will automatically terminate your rights under this
-   License. However, parties who have received copies, or rights, from you
-   under this License will not have their licenses terminated so long as
-   such parties remain in full compliance.
+This section is intended to make thoroughly clear what is believed to
+be a consequence of the rest of this License.
 
-9. You are not required to accept this License, since you have not signed
-   it. However, nothing else grants you permission to modify or distribute
-   the Library or its derivative works. These actions are prohibited by law
-   if you do not accept this License. Therefore, by modifying or
-   distributing the Library (or any work based on the Library), you
-   indicate your acceptance of this License to do so, and all its terms and
-   conditions for copying, distributing or modifying the Library or works
-   based on it.
+  12. If the distribution and/or use of the Library is restricted in
+certain countries either by patents or by copyrighted interfaces, the
+original copyright holder who places the Library under this License may add
+an explicit geographical distribution limitation excluding those countries,
+so that distribution is permitted only in or among countries not thus
+excluded.  In such case, this License incorporates the limitation as if
+written in the body of this License.
 
-10. Each time you redistribute the Library (or any work based on the
-    Library), the recipient automatically receives a license from the
-    original licensor to copy, distribute, link with or modify the Library
-    subject to these terms and conditions. You may not impose any further
-    restrictions on the recipients' exercise of the rights granted
-    herein. You are not responsible for enforcing compliance by third
-    parties with this License.
+  13. The Free Software Foundation may publish revised and/or new
+versions of the Lesser General Public License from time to time.
+Such new versions will be similar in spirit to the present version,
+but may differ in detail to address new problems or concerns.
 
-11. If, as a consequence of a court judgment or allegation of patent
-    infringement or for any other reason (not limited to patent issues),
-    conditions are imposed on you (whether by court order, agreement or
-    otherwise) that contradict the conditions of this License, they do not
-    excuse you from the conditions of this License. If you cannot
-    distribute so as to satisfy simultaneously your obligations under this
-    License and any other pertinent obligations, then as a consequence you
-    may not distribute the Library at all. For example, if a patent license
-    would not permit royalty-free redistribution of the Library by all
-    those who receive copies directly or indirectly through you, then the
-    only way you could satisfy both it and this License would be to refrain
-    entirely from distribution of the Library.
+Each version is given a distinguishing version number.  If the Library
+specifies a version number of this License which applies to it and
+"any later version", you have the option of following the terms and
+conditions either of that version or of any later version published by
+the Free Software Foundation.  If the Library does not specify a
+license version number, you may choose any version ever published by
+the Free Software Foundation.
+
+  14. If you wish to incorporate parts of the Library into other free
+programs whose distribution conditions are incompatible with these,
+write to the author to ask for permission.  For software which is
+copyrighted by the Free Software Foundation, write to the Free
+Software Foundation; we sometimes make exceptions for this.  Our
+decision will be guided by the two goals of preserving the free status
+of all derivatives of our free software and of promoting the sharing
+and reuse of software generally.
 
-    If any portion of this section is held invalid or unenforceable under
-    any particular circumstance, the balance of the section is intended to
-    apply, and the section as a whole is intended to apply in other
-    circumstances.
+                            NO WARRANTY
 
-    It is not the purpose of this section to induce you to infringe any
-    patents or other property right claims or to contest validity of any
-    such claims; this section has the sole purpose of protecting the
-    integrity of the free software distribution system which is implemented
-    by public license practices. Many people have made generous
-    contributions to the wide range of software distributed through that
-    system in reliance on consistent application of that system; it is up
-    to the author/donor to decide if he or she is willing to distribute
-    software through any other system and a licensee cannot impose that
-    choice.
+  15. BECAUSE THE LIBRARY IS LICENSED FREE OF CHARGE, THERE IS NO
+WARRANTY FOR THE LIBRARY, TO THE EXTENT PERMITTED BY APPLICABLE LAW.
+EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR
+OTHER PARTIES PROVIDE THE LIBRARY "AS IS" WITHOUT WARRANTY OF ANY
+KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE
+IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
+PURPOSE.  THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE
+LIBRARY IS WITH YOU.  SHOULD THE LIBRARY PROVE DEFECTIVE, YOU ASSUME
+THE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION.
 
-    This section is intended to make thoroughly clear what is believed to
-    be a consequence of the rest of this License.
+  16. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN
+WRITING WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY
+AND/OR REDISTRIBUTE THE LIBRARY AS PERMITTED ABOVE, BE LIABLE TO YOU
+FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR
+CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE THE
+LIBRARY (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING
+RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A
+FAILURE OF THE LIBRARY TO OPERATE WITH ANY OTHER SOFTWARE), EVEN IF
+SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH
+DAMAGES.
 
-12. If the distribution and/or use of the Library is restricted in certain
-    countries either by patents or by copyrighted interfaces, the original
-    copyright holder who places the Library under this License may add an
-    explicit geographical distribution limitation excluding those
-    countries, so that distribution is permitted only in or among countries
-    not thus excluded. In such case, this License incorporates the
-    limitation as if written in the body of this License.
+                     END OF TERMS AND CONDITIONS
+
+           How to Apply These Terms to Your New Libraries
 
-13. The Free Software Foundation may publish revised and/or new versions of
-    the Lesser General Public License from time to time. Such new versions
-    will be similar in spirit to the present version, but may differ in
-    detail to address new problems or concerns.
-
-    Each version is given a distinguishing version number. If the Library
-    specifies a version number of this License which applies to it and "any
-    later version", you have the option of following the terms and
-    conditions either of that version or of any later version published by
-    the Free Software Foundation. If the Library does not specify a license
-    version number, you may choose any version ever published by the Free
-    Software Foundation.
-
-14. If you wish to incorporate parts of the Library into other free
-    programs whose distribution conditions are incompatible with these,
-    write to the author to ask for permission. For software which is
-    copyrighted by the Free Software Foundation, write to the Free Software
-    Foundation; we sometimes make exceptions for this. Our decision will be
-    guided by the two goals of preserving the free status of all
-    derivatives of our free software and of promoting the sharing and reuse
-    of software generally.
-
-NO WARRANTY
-
-15. BECAUSE THE LIBRARY IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
-    FOR THE LIBRARY, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN
-    OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
-    PROVIDE THE LIBRARY "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER
-    EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
-    WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE
-    ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE LIBRARY IS WITH
-    YOU. SHOULD THE LIBRARY PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL
-    NECESSARY SERVICING, REPAIR OR CORRECTION.
-
-16. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
-    WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
-    REDISTRIBUTE THE LIBRARY AS PERMITTED ABOVE, BE LIABLE TO YOU FOR
-    DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL
-    DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE THE LIBRARY
-    (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING RENDERED
-    INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A FAILURE OF
-    THE LIBRARY TO OPERATE WITH ANY OTHER SOFTWARE), EVEN IF SUCH HOLDER OR
-    OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
-
-END OF TERMS AND CONDITIONS
-
-How to Apply These Terms to Your New Libraries
-
-If you develop a new library, and you want it to be of the greatest
+  If you develop a new library, and you want it to be of the greatest
 possible use to the public, we recommend making it free software that
-everyone can redistribute and change. You can do so by permitting
+everyone can redistribute and change.  You can do so by permitting
 redistribution under these terms (or, alternatively, under the terms of the
 ordinary General Public License).
 
-To apply these terms, attach the following notices to the library. It is
+  To apply these terms, attach the following notices to the library.  It is
 safest to attach them to the start of each source file to most effectively
 convey the exclusion of warranty; and each file should have at least the
 "copyright" line and a pointer to where the full notice is found.
 
-one line to give the library's name and an idea of what it does.
-Copyright (C) year name of author
+    <one line to give the library's name and a brief idea of what it does.>
+    Copyright (C) <year>  <name of author>
 
-This library is free software; you can redistribute it and/or modify it
-under the terms of the GNU Lesser General Public License as published by
-the Free Software Foundation; either version 2.1 of the License, or (at
-your option) any later version.
+    This library is free software; you can redistribute it and/or
+    modify it under the terms of the GNU Lesser General Public
+    License as published by the Free Software Foundation; either
+    version 2.1 of the License, or (at your option) any later version.
 
-This library is distributed in the hope that it will be useful, but WITHOUT
-ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License
-for more details.
+    This library is distributed in the hope that it will be useful,
+    but WITHOUT ANY WARRANTY; without even the implied warranty of
+    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+    Lesser General Public License for more details.
 
-You should have received a copy of the GNU Lesser General Public License
-along with this library; if not, write to the Free Software Foundation,
-Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA Also add
-information on how to contact you by electronic and paper mail.
+    You should have received a copy of the GNU Lesser General Public
+    License along with this library; if not, see <https://www.gnu.org/licenses/>.
+
+Also add information on how to contact you by electronic and paper mail.
 
 You should also get your employer (if you work as a programmer) or your
 school, if any, to sign a "copyright disclaimer" for the library, if
-necessary. Here is a sample; alter the names:
+necessary.  Here is a sample; alter the names:
 
-Yoyodyne, Inc., hereby disclaims all copyright interest in
-the library `Frob' (a library for tweaking knobs) written
-by James Random Hacker.
+  Yoyodyne, Inc., hereby disclaims all copyright interest in the
+  library `Frob' (a library for tweaking knobs) written by James Random Hacker.
+
+  <signature of Moe Ghoul>, 1 April 1990
+  Moe Ghoul, President of Vice
 
-signature of Ty Coon, 1 April 1990
-Ty Coon, President of Vice
 That's all there is to it!
-- 
2.49.0

