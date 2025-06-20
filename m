Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECB4242D97
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 23:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750460540; cv=none; b=czh57slRp0nBuYRV19+6U4PY32dfQacSXUP3ORQ6x1Q0qvZxrBcOiANmISiUlkELATO5D5M7G37PqD89t1562o2E8+8YSqXhlFby4RTn3IeXJt6GNAN/P2BvXj8OF/+BZJ/IzaGWuiZyEswc6VD6TE9kPQVv1KptwzNOWmjv1v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750460540; c=relaxed/simple;
	bh=Tbh8ry1lWJGYK/W7V9BgYWpNKiajyQhbqRdEU96TOGA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FdfKFbOr50psRfD/RSnZfOefoUi7rByZp1dU0XQBgAxyCagBOjDIkwDOWsEuYAUcCiCiYEyzKKZ0D5JV8DDs4Wc5rfH8V0jpgiW1vrFjx6eOtiCc5WUNKy+H46h6hCrzn4kwESW5q+A4Nok4DOgQ9shb8+01NqkdEq2ppnxNw5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nVQJGRSb; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nVQJGRSb"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e7dc89108bfso1911187276.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 16:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750460538; x=1751065338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ArUQ8QVqS/QJ/vgHPbGXTRv239wlRJkgHtl0VZTwag=;
        b=nVQJGRSb/cSS3JsyXC+6Lllc2/ugQvBa7SMwJml7i3NdP6qP5sDpWi620vr6wOWv/E
         j5j2iOlh1f41TdIzVvZxrItl6mpIAiEsXRn4kYPmHb0nhavZkbK/od2g5u91LL8OteMw
         niiymnq94d+zDv3kF2pMgxNtMwPRClCO0UJBMHRNgO27zXbLQXzlvzZVLOnH7Kn6UoL7
         y1rInpkNPE7iZOuigMfrQpQ2c5VHF6bLurOsINP6MzvV9ROiDS4jQLXkeAeV9BJh3js0
         6+PdE1FSRU5rdfM0A/w8FHFOdgXwroCvOKInb+Y/n+nii5PRfnyRQLE71OZ8l5f66RAW
         VQRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750460538; x=1751065338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ArUQ8QVqS/QJ/vgHPbGXTRv239wlRJkgHtl0VZTwag=;
        b=DEr2LTDkI2APXoqZT136EYw3h6cs85FPP0HiWrNVE39xYRWepWzFzh94UAA2h4aZK0
         /BJ4TWxDRbGazobwaec5rcYSdDRPxbmLpYAhmzuf/Mr2aRmuqSRLR92SgCVLz+apmj7q
         5v2kHQwrXhvoJ1a+4Sntbj6kblcIWx6s6ndqXloD4Rl5VPZzW7fMO0T5AnOCeLWNP7cV
         +3JYnhLUJLzIWfHWncbMCRwnStyEMl40WFD/Dx81o4355ZDEZBTGRBUAyhCqHvgSTXTU
         Xwnbx8L5dzbOFyTWIo/+OhUr8l9Q/9JkO7Cc5CRj2A5gr27rzClo3CifvJW4hDEEXjkj
         /wSA==
X-Forwarded-Encrypted: i=1; AJvYcCUTvvQLZ5fTUn0+D85pHHhFeETlNs4DRORtxY8UR6dBDpgsRK7YSS+48ImWQcGODomUYzsoqc1ptzfAnDM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhRoqZCAPuAw2rQd1s8EKckrpfFcujb8wquBdkQJDV6pGoFtSM
	XIYextDlirH5XLwtNXBLTyyO3GRQY4TaLDBUDbYhZgS1fuUgm3CATij8TeWOFboj
X-Gm-Gg: ASbGncvtTUY9RUTlKEB4M0NzpjXjC6eLzm8iHyR3vKXNSm7Qvh/NNAkKTu2IMCRpWLX
	pXHxdMcUqzCx1T281Z5zzuDfvws7H0/QI4mypfssxnYEbHkvX2Wi5rRJKbX5ZhHePYM7JJ0dtyG
	pymbx1xrPc5vC78YkREiF4cdjS6Xlpu/c6Qlwh7Mg6Cck14aByutqkVl0bmOh/eGLzVq8W+rzEk
	zm8egdXt9K9wXw14PAcIlrWR8PbatOX17LxY3XC5cVAxHDqt3xOR54caqAoBCw6rrX6xAw95Mot
	oBxulxiAsLNOyWCPVcD4d+9q07TbbRhYoCWf5yddDZoq1C+lMmccVh4t8ZFo46vT36wigztp2Ru
	DXA==
X-Google-Smtp-Source: AGHT+IEIvzmiWthMEcAxXwgVG3Wo9vvhbiOI15NAoRwemKNFyO05E7JCSh/OsyIWpCFFN7A9sOhphg==
X-Received: by 2002:a05:6902:6986:b0:e84:32a7:89ad with SMTP id 3f1490d57ef6-e8432a78a96mr3235478276.48.1750460537797;
        Fri, 20 Jun 2025 16:02:17 -0700 (PDT)
Received: from Slackware.localdomain ([191.96.150.102])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e842ac984b4sm893270276.48.2025.06.20.16.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 16:02:16 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dan.carpenter@linaro.org
Cc: Bhaskar Chowdhury <unixbhaskar@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 9/9]  Trivial changes,usage text show scriptname without path,and few of them use nproc binary to show cpu core
Date: Sat, 21 Jun 2025 04:08:58 +0530
Message-ID: <772a80d0cc54bbc1c138730972193faa76238bd1.1750459100.git.unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <cover.1750459100.git.unixbhaskar@gmail.com>
References: <cover.1750459100.git.unixbhaskar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Trivial fixes for the script name to show up in help/usage test without full
pathname and some of them have CPU core variable via nproc.

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 smatch_scripts/gen_no_return_funcs.sh  | 2 +-
 smatch_scripts/gen_puts_list.sh        | 2 +-
 smatch_scripts/gen_rosenberg_funcs.sh  | 2 +-
 smatch_scripts/gen_sizeof_param.sh     | 2 +-
 smatch_scripts/gen_unwind_functions.sh | 2 +-
 smatch_scripts/kpatch.sh               | 2 +-
 smatch_scripts/show_errs.sh            | 2 +-
 smatch_scripts/show_ifs.sh             | 2 +-
 smatch_scripts/show_unreachable.sh     | 2 +-
 smatch_scripts/summarize_errs.sh       | 2 +-
 smatch_scripts/test_generic.sh         | 4 ++--
 smatch_scripts/test_kernel.sh          | 4 ++--
 smatch_scripts/whitespace_only.sh      | 4 ++--
 smatch_scripts/wine_checker.sh         | 4 ++--
 14 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/smatch_scripts/gen_no_return_funcs.sh b/smatch_scripts/gen_no_return_funcs.sh
index 713456c04aac..c5e16cc1008a 100755
--- a/smatch_scripts/gen_no_return_funcs.sh
+++ b/smatch_scripts/gen_no_return_funcs.sh
@@ -4,7 +4,7 @@ file=$1
 project=$(echo "$2" | cut -d = -f 2)

 if [[ "$file" = "" ]] ; then
-    echo "Usage:  $0 <file with smatch messages> -p=<project>"
+	echo "Usage:  $(basename $0) <file with smatch messages> -p=<project>"
     exit 1
 fi

diff --git a/smatch_scripts/gen_puts_list.sh b/smatch_scripts/gen_puts_list.sh
index 5a877aeb8423..32eda6d52e42 100755
--- a/smatch_scripts/gen_puts_list.sh
+++ b/smatch_scripts/gen_puts_list.sh
@@ -4,7 +4,7 @@ file=$1
 project=$(echo "$2" | cut -d = -f 2)

 if [[ "$file" = "" ]] ; then
-    echo "Usage:  $0 <file with smatch messages> -p=<project>"
+	echo "Usage:  $(basename $0) <file with smatch messages> -p=<project>"
     exit 1
 fi

diff --git a/smatch_scripts/gen_rosenberg_funcs.sh b/smatch_scripts/gen_rosenberg_funcs.sh
index 0152ba9c1192..cfc0c9a8a40d 100755
--- a/smatch_scripts/gen_rosenberg_funcs.sh
+++ b/smatch_scripts/gen_rosenberg_funcs.sh
@@ -4,7 +4,7 @@ file=$1
 project=$(echo "$2" | cut -d = -f 2)

 if [[ "$file" = "" ]] ; then
-    echo "Usage:  $0 <file with smatch messages> -p=<project>"
+	echo "Usage:  $(basename $0) <file with smatch messages> -p=<project>"
     exit 1
 fi

diff --git a/smatch_scripts/gen_sizeof_param.sh b/smatch_scripts/gen_sizeof_param.sh
index 8f4e5f7493c0..653f39dae61e 100755
--- a/smatch_scripts/gen_sizeof_param.sh
+++ b/smatch_scripts/gen_sizeof_param.sh
@@ -4,7 +4,7 @@ file=$1
 project=$(echo "$2" | cut -d = -f 2)

 if [[ "$file" = "" ]] ; then
-    echo "Usage:  $0 <file with smatch messages> -p=<project>"
+	echo "Usage:  $(basename $0) <file with smatch messages> -p=<project>"
     exit 1
 fi

diff --git a/smatch_scripts/gen_unwind_functions.sh b/smatch_scripts/gen_unwind_functions.sh
index ae8504902018..dc7d66fa0bf1 100755
--- a/smatch_scripts/gen_unwind_functions.sh
+++ b/smatch_scripts/gen_unwind_functions.sh
@@ -4,7 +4,7 @@ file=$1
 project=$(echo "$2" | cut -d = -f 2)

 if [[ "$file" = "" ]] ; then
-    echo "Usage:  $0 <file with smatch messages> -p=<project>"
+	echo "Usage:  $(basename $0) <file with smatch messages> -p=<project>"
     exit 1
 fi

diff --git a/smatch_scripts/kpatch.sh b/smatch_scripts/kpatch.sh
index 66cef9581ca0..7ee229a0bfbf 100755
--- a/smatch_scripts/kpatch.sh
+++ b/smatch_scripts/kpatch.sh
@@ -4,7 +4,7 @@ TMP_DIR=/tmp

 help()
 {
-    echo "Usage: $0 [--no-compile|--amend] <filename>"
+	echo "Usage: $(basename $0) [--no-compile|--amend] <filename>"
     echo "You must be at the base of the kernel tree to run this."
     exit 1
 }
diff --git a/smatch_scripts/show_errs.sh b/smatch_scripts/show_errs.sh
index bc6930ffa245..2f3983abab45 100755
--- a/smatch_scripts/show_errs.sh
+++ b/smatch_scripts/show_errs.sh
@@ -15,7 +15,7 @@ done
 file=$1
 [ "$file" = "" ] && [ -e err-list ] && file=err-list
 if [[ "$file" = "" ]] ; then
-    echo "Usage:  $0 [-C <lines>] [-b] [-k] <file with smatch messages>"
+	echo "Usage:  $(basename $0) [-C <lines>] [-b] [-k] <file with smatch messages>"
     echo "  -C <lines>:  Print <lines> of context"
     exit 1
 fi
diff --git a/smatch_scripts/show_ifs.sh b/smatch_scripts/show_ifs.sh
index 4f93ca5fa285..8b84606250b5 100755
--- a/smatch_scripts/show_ifs.sh
+++ b/smatch_scripts/show_ifs.sh
@@ -9,7 +9,7 @@ fi

 file=$1
 if [[ "$file" = "" ]] ; then
-    echo "Usage:  $0 [-C <lines of context>] <file with smatch messages>"
+	echo "Usage:  $(basename $0) [-C <lines of context>] <file with smatch messages>"
     exit 1
 fi

diff --git a/smatch_scripts/show_unreachable.sh b/smatch_scripts/show_unreachable.sh
index 7402615dc670..e866760c6726 100755
--- a/smatch_scripts/show_unreachable.sh
+++ b/smatch_scripts/show_unreachable.sh
@@ -24,7 +24,7 @@ done

 file=$1
 if [[ "$file" = "" ]] ; then
-    echo "Usage:  $0 [-C <lines>] [-b] [-k] <file with smatch messages>"
+	echo "Usage:  $(basename $0) [-C <lines>] [-b] [-k] <file with smatch messages>"
     echo "  -C <lines>:  Print <lines> of context"
     echo "  -b        :  Ignore unreachable break statements"
     echo "  -k        :  Ignore some kernel defines"
diff --git a/smatch_scripts/summarize_errs.sh b/smatch_scripts/summarize_errs.sh
index b958a015ddf2..a444fa267495 100755
--- a/smatch_scripts/summarize_errs.sh
+++ b/smatch_scripts/summarize_errs.sh
@@ -2,7 +2,7 @@

 print_help()
 {
-    echo "usage: $0 <warning file>"
+	echo "usage: $(basename $0) <warning file>"
     exit 1;
 }

diff --git a/smatch_scripts/test_generic.sh b/smatch_scripts/test_generic.sh
index 9fbd1caf4b29..5ad08f4fa135 100755
--- a/smatch_scripts/test_generic.sh
+++ b/smatch_scripts/test_generic.sh
@@ -1,12 +1,12 @@
 #!/bin/bash

-NR_CPU=$(cat /proc/cpuinfo | grep ^processor | wc -l)
+NR_CPU=$(nproc)
 TARGET=""
 WLOG="smatch_warns.txt"
 LOG="smatch_compile.warns"
 function usage {
     echo
-    echo "Usage:  $0 [smatch options]"
+    echo "Usage: $(basename $0) [smatch options]"
     echo "Compiles the kernel with -j${NR_CPU}"
     echo " available options:"
     echo "	--endian          : enable endianness check"
diff --git a/smatch_scripts/test_kernel.sh b/smatch_scripts/test_kernel.sh
index 9d25ce9c1ed3..9a0eb482a2f6 100755
--- a/smatch_scripts/test_kernel.sh
+++ b/smatch_scripts/test_kernel.sh
@@ -2,13 +2,13 @@

 set -e

-NR_CPU=$(cat /proc/cpuinfo | grep ^processor | wc -l)
+NR_CPU=$(nproc)
 TARGET="bzImage modules"
 WLOG="smatch_warns.txt"
 LOG="smatch_compile.warns"
 function usage {
     echo
-    echo "Usage:  $0 [smatch options]"
+    echo "Usage: $(basename $0) [smatch options]"
     echo "Compiles the kernel with -j${NR_CPU}"
     echo " available options:"
     echo "	--endian          : enable endianness check"
diff --git a/smatch_scripts/whitespace_only.sh b/smatch_scripts/whitespace_only.sh
index 975e6571e1e7..e72afb67a519 100755
--- a/smatch_scripts/whitespace_only.sh
+++ b/smatch_scripts/whitespace_only.sh
@@ -2,7 +2,7 @@

 usage()
 {
-    echo "usage:  $0 <patch file>"
+	echo "usage:  $(basename $0) <patch file>"
     exit 1
 }

@@ -84,7 +84,7 @@ for file in $files ; do
 	echo '!!                            !!'
 	echo '!!#$%@$%@^@#$^@#%@$%@$%@#%$@#%!!'

-	diff -u $before $after
+	diff -u $before $after
     fi
     rm -f $before $after $tmpfile
 done
diff --git a/smatch_scripts/wine_checker.sh b/smatch_scripts/wine_checker.sh
index 79b4faa51a07..5825cf9e8a13 100755
--- a/smatch_scripts/wine_checker.sh
+++ b/smatch_scripts/wine_checker.sh
@@ -1,7 +1,7 @@
 #!/bin/bash

 function usage {
-    echo "Usage:  $0 [--sparse][--valgrind][--debug] path/to/file.c"
+	echo "Usage:  $(basename $0) [--sparse][--valgrind][--debug] path/to/file.c"
     exit 1
 }

@@ -14,7 +14,7 @@ else
     echo "Smatch binary not found."
     exit 1
 fi
-
+
 POST=""
 WINE_ARGS="-p=wine --full-path -D__i386__"

--
2.46.3

