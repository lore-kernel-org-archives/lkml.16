Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8E61F417E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743615759; cv=none; b=GwD74TmXhaucgnYvf8WqbDxBKSQLwVOTZW09xrhXLp1nX1olCup1LqtMYlwEcvj/7GlG2SwtiAWFI/nATKFvtaqEJigksZuixS7CmPuFHVBFZ9vZwJXmAzBxK/WG/akdBBEVqVepXAgEmoLzXJpeHuGMRgRCuLDtpQRKdjeVzME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743615759; c=relaxed/simple;
	bh=0VhOah8KNQkjy9u5bqPxuxp4A0NYVfoyW8pjJzUH2xU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uO4R0iln0ud7cIbzL1Ka/0CjvmM6iSkxcS00qZH/Ag+aXWCTGJrAZ2dbUvFvuICcMe34JpHayD7yolHfqN7G3FMilDGs2VGppioRUcWVDd/evyijwi63lqe6rxmo0IPhOMMvWGndxKOsauEWE/aBP10nM3uubI/sK0L5s9/0FLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KZbpS34R; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KZbpS34R"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3ce87d31480so492425ab.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 10:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743615757; x=1744220557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eURkwPwKw4vTaVpJGMjl6Mz91xCr+xlab1qXSWsbeFY=;
        b=KZbpS34RuQPWFnSzZsDGohUPDzIJzwaNRMUFnOTVv1pFTidLkXKzss8WDwQb1Va1Mf
         5wYSwTYWVuhvcAcQQ5d7dPDSjalCwx4XKfK27Sn6b0pPBsjWHhLLL7daqTypuX2EqWx0
         mOp7DFqjLw8E2UmVbSYXnSJ87nr9je2wTIe9CQsL2LCIKSk+azj210H8MN2ij6wlmcrN
         SbwRJ19wIYVNLSwxlySVbic49j7w+I1aQ2F/qtYU8cutYwMTZm9Z1eFmkAx/GJHPtHer
         RtXku2zxx4aV2+NdTxiTrztHvyE1hB2ji0miqii+zu+3iwIifBc8okSGZ8ndlbzbF4cH
         SqrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743615757; x=1744220557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eURkwPwKw4vTaVpJGMjl6Mz91xCr+xlab1qXSWsbeFY=;
        b=TJLWeL5VI79eKAVreOTGMDsDqbHg9aDa/j5O8pIkZze2KSrrqljUk0/HH9j8600zOc
         A3sMm7QRfsH4EvBkQsmgrlEr8o4WnEMusANF26MwcdFOoQ7wpJ8ql4VgmfZjaS6xwP0X
         qT1ZYKXimeRzY6VqcdZfcvdDLc0GX0pYtj9ShDrYUM0iO7v9qsb7wk7/roBkfwNT47KE
         ERFJeUJmt0qA3rWEgfnzobh9W1qvJSGVNBdToC7UIf9t0wffbKlzux/+MkucR2jFe56N
         fxAoiNwUj9TFlTAbUw30+RvDkFONCZ5DzPeqMYWmtcsFUeT/82IS9TZBJmlPBKIY7Eva
         LMPw==
X-Forwarded-Encrypted: i=1; AJvYcCXJyWfPy0c9Q97YrUlPHgW6nVdZI0ybC7R/U1dqAcLDk+rPdHzw11PNlXn1HZ9/jc01MDr3W7Id/72c2/o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw85fmdI6AMlf3iq6J+oi63UdKuq3pcLhMkfRdgRyBrCuy9q+R1
	Ndnr83i9zFToGDWeeP5jAB8dp+IelOKZ6euyFMiElb6E/0/RxQaw
X-Gm-Gg: ASbGncvN3l9xGz1a7/wYblQfxW+2v863GQ2kH4kcUzWPvoO5V3MGBTUSpMb5m0ltdnW
	J1DAO1i1o7cNZydLaNvDa05V1yXfAGVTqIIijV8cjdute75eteyg1BOomqFvqdm72HfwGCONW69
	1K1qFmzMuQTlS6900M7exJtBYNnWz5hwvBsbM/0OAclHmMEEASnEGyA/Z/n8lEE4Egz6xfZRaP7
	AgXyF5mxbl9Sz6tbnHDd5zas7Nj4mbCKNPFFuCSAjM895zpVJKLzkyhY4szEefGbnhB+aQaEGqN
	aAU/Z4KjOW5ZljbPnP5Ic7lv0TVHI1rDsc7Iv1kFMpqTBhEm/vmx9K89fBtQ16tJeuQFvclZL90
	NvA==
X-Google-Smtp-Source: AGHT+IFOwJqxt3+Bc5BjTaI4wehPC3f7tDSqG024LF0DEkHz1iw3TJJMpnglnawcz+3wXnO3Ge6iQQ==
X-Received: by 2002:a05:6e02:c:b0:3d1:a34b:4d01 with SMTP id e9e14a558f8ab-3d5e09090famr201375295ab.8.1743615757146;
        Wed, 02 Apr 2025 10:42:37 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 10:42:36 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com,
	gregkh@linuxfoundation.org,
	ukaszb@chromium.org,
	louis.chauvet@bootlin.com,
	linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	daniel.vetter@ffwll.ch,
	tvrtko.ursulin@linux.intel.com,
	jani.nikula@intel.com,
	ville.syrjala@linux.intel.com,
	Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v3 23/54] dyndbg: treat comma as a token separator
Date: Wed,  2 Apr 2025 11:41:25 -0600
Message-ID: <20250402174156.1246171-24-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402174156.1246171-1-jim.cromie@gmail.com>
References: <20250402174156.1246171-1-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Treat comma as a token terminator, just like a space.  This allows a
user to avoid quoting hassles when spaces are otherwise needed:

 :#> modprobe drm dyndbg=class,DRM_UT_CORE,+p\;class,DRM_UT_KMS,+p

or as a boot arg:

 drm.dyndbg=class,DRM_UT_CORE,+p  # todo: support multi-query here

Given the many ways a boot-line +args can be assembled and then passed
in/down/around shell based tools, this may allow side-stepping all
sorts of quoting hassles thru those layers.

existing query format:

 modprobe test_dynamic_debug dyndbg="class D2_CORE +p"

new format:

 modprobe test_dynamic_debug dyndbg=class,D2_CORE,+p

ALSO

selftests-dyndbg: add comma_terminator_tests

New fn validates parsing and effect of queries using combinations of
commas and spaces to delimit the tokens.

It manipulates pr-debugs in builtin module/params, so might have deps
I havent foreseen on odd configurations.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Co-developed-by: Łukasz Bartosik <ukaszb@chromium.org>
Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
---
- skip comma tests if no builtins
-v3 squash in tests and doc
---
 .../admin-guide/dynamic-debug-howto.rst       |  9 +++++---
 lib/dynamic_debug.c                           | 17 +++++++++++----
 .../dynamic_debug/dyndbg_selftest.sh          | 21 ++++++++++++++++++-
 3 files changed, 39 insertions(+), 8 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 63a511f2337b..e2dbb5d9b314 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -78,11 +78,12 @@ Command Language Reference
 ==========================
 
 At the basic lexical level, a command is a sequence of words separated
-by spaces or tabs.  So these are all equivalent::
+by spaces, tabs, or commas.  So these are all equivalent::
 
   :#> ddcmd file svcsock.c line 1603 +p
   :#> ddcmd "file svcsock.c line 1603 +p"
   :#> ddcmd '  file   svcsock.c     line  1603 +p  '
+  :#> ddcmd file,svcsock.c,line,1603,+p
 
 Command submissions are bounded by a write() system call.
 Multiple commands can be written together, separated by ``;`` or ``\n``::
@@ -167,9 +168,11 @@ module
     The given string is compared against the module name
     of each callsite.  The module name is the string as
     seen in ``lsmod``, i.e. without the directory or the ``.ko``
-    suffix and with ``-`` changed to ``_``.  Examples::
+    suffix and with ``-`` changed to ``_``.
 
-	module sunrpc
+    Examples::
+
+	module,sunrpc	# with ',' as token separator
 	module nfsd
 	module drm*	# both drm, drm_kms_helper
 
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 0d603caadef8..5737f1b4eba8 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -299,6 +299,14 @@ static int ddebug_change(const struct ddebug_query *query, struct flag_settings
 	return nfound;
 }
 
+static char *skip_spaces_and_commas(const char *str)
+{
+	str = skip_spaces(str);
+	while (*str == ',')
+		str = skip_spaces(++str);
+	return (char *)str;
+}
+
 /*
  * Split the buffer `buf' into space-separated words.
  * Handles simple " and ' quoting, i.e. without nested,
@@ -312,8 +320,8 @@ static int ddebug_tokenize(char *buf, char *words[], int maxwords)
 	while (*buf) {
 		char *end;
 
-		/* Skip leading whitespace */
-		buf = skip_spaces(buf);
+		/* Skip leading whitespace and comma */
+		buf = skip_spaces_and_commas(buf);
 		if (!*buf)
 			break;	/* oh, it was trailing whitespace */
 		if (*buf == '#')
@@ -329,7 +337,7 @@ static int ddebug_tokenize(char *buf, char *words[], int maxwords)
 				return -EINVAL;	/* unclosed quote */
 			}
 		} else {
-			for (end = buf; *end && !isspace(*end); end++)
+			for (end = buf; *end && !isspace(*end) && *end != ','; end++)
 				;
 			if (end == buf) {
 				pr_err("parse err after word:%d=%s\n", nwords,
@@ -601,7 +609,8 @@ static int ddebug_exec_queries(char *query, const char *modname)
 		if (split)
 			*split++ = '\0';
 
-		query = skip_spaces(query);
+		query = skip_spaces_and_commas(query);
+
 		if (!query || !*query || *query == '#')
 			continue;
 
diff --git a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
index 465fad3f392c..c7bf521f36ee 100755
--- a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
+++ b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
@@ -216,7 +216,7 @@ function check_err_msg() {
 function basic_tests {
     echo -e "${GREEN}# BASIC_TESTS ${NC}"
     if [ $LACK_DD_BUILTIN -eq 1 ]; then
-	echo "SKIP"
+	echo "SKIP - test requires params, which is a builtin module"
 	return
     fi
     ddcmd =_ # zero everything
@@ -238,8 +238,27 @@ EOF
     ddcmd =_
 }
 
+function comma_terminator_tests {
+    echo -e "${GREEN}# COMMA_TERMINATOR_TESTS ${NC}"
+    if [ $LACK_DD_BUILTIN -eq 1 ]; then
+	echo "SKIP - test requires params, which is a builtin module"
+	return
+    fi
+    # try combos of spaces & commas
+    check_match_ct '\[params\]' 4 -r
+    ddcmd module,params,=_		# commas as spaces
+    ddcmd module,params,+mpf		# turn on module's pr-debugs
+    check_match_ct =pmf 4
+    ddcmd ,module ,, ,  params, -p
+    check_match_ct =mf 4
+    ddcmd " , module ,,, ,  params, -m"	#
+    check_match_ct =f 4
+    ddcmd =_
+}
+
 tests_list=(
     basic_tests
+    comma_terminator_tests
 )
 
 # Run tests
-- 
2.49.0

