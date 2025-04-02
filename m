Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3464E1D86E8
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743615761; cv=none; b=sc/dnrBpG7jZzvxGE78IWJ67aIjDkWbomqIobm3RKbez/a8LJzdKnhEOnWdOo6ltetMQHoaJviJ/PR6YX9jVxFTMP/eQPPWMGHG5aWr+U9xUizhNcvWMSKcIzq5tm89nHXJasGac2I5HZWgp/eSiTqYSl2K+yZQfKoqGm8/+S0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743615761; c=relaxed/simple;
	bh=/S2Oq6yq/+UN+BPX+p8Yp3K51tuN+nu4aCUOQLAnb1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fSdhBanFv/e9HS2maFpBaUx3yBRktcqp1DDITsZvyTfSaxAR/aBp0nlcpl5mQP8SANWPfan3Ysop08AEGl8oXVFo1VcBp4E3WDNd3iZ6+bgK+8DIN4TJv/U8lSgGNqC3+bG4dRWYEScp6r+p4VXthENl13KxW88IFpIBQ962WcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nAYQxoR0; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nAYQxoR0"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3d46ef71b6cso823445ab.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 10:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743615758; x=1744220558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ucC/m8VvNwawJ172sGBJnoV5QJtRGG6wMlODfeStmbw=;
        b=nAYQxoR0uxv1VT3Bfcqgna79O6kmIHf6mr5FfinzIwRmeBIK+cAJhKKXNciTeno0or
         3ekcq90mjXvr4XdnS/5qZU0YcHFge1cDjbmaBlLYzLuDEjDIvfnsno4+ChL6GsWqWZrB
         xmal+9796K/+ehCOrTXpgZXxGStKO7FwcV1FAGiIyjVFNxz8avcdj/avblZqeDOh9TId
         E3oWH3JlpuoAGNLDOZAyjiGPU7iKywl0up6TS9wkrM2We5Yrz3jzJ5ZwHJLTtS7hSQkW
         DaPedZnr0lYx8kfTw2aaRJK/NrLDzb4kem2MxJSvrFmBklnIDj6ApXHBQhNHJN9POe3i
         m0AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743615758; x=1744220558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ucC/m8VvNwawJ172sGBJnoV5QJtRGG6wMlODfeStmbw=;
        b=QiZ76CVc3cwzNAxNxSOpxWgDhZu9QPig2RzsOW5j5Fa397IwY7f1idjIoYMM6JyXgL
         CsnJKjmAxS395ohUrX9K1aVJROvXREoB5kwb1UIP1ZBjkqOdmxE5ohkSlCHugJ6lh4Rx
         FUfwfW2bdR5Zm9ivy65gFPnOQ0PaIahcb7PSgJKVKXzCPETlgnDq/IsdOwBm44i/ee1g
         b9MoVFy5H0h846yh9jp6YurBLxow/yw+IAxlkzWIHg27E2eUtd4eb6ThtsO4JYoKR7cb
         SUYJNFLx965HvgV9xT6l3yfVHeJgnCS6hEX9X5cEK6XzDoj66iqcI94Uy1z0iW3IhjtE
         0y4A==
X-Forwarded-Encrypted: i=1; AJvYcCUI+Orkd1EkE9f1LlQmCM3Bb+scLTuVA7h7w53uUWQtGrlgAFtn+54WtwEiWrnaRszpz//BEvhkrbm1T6A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDwxfebVChwckrAhU4+dZ7EPvxWEHJKPtBWcXqGyfqQm02c+NA
	TD3TyA48nzxHswd4+yWn0YBi2aMls7z2IljzYs78dytt/lUNJ0Z0
X-Gm-Gg: ASbGnctpc1R+gaNo9ODZs7cpDSW6tqZmr6TCTp12orPQnHFe+okCMyDRtbms3TRu1Ft
	f3mmi8+bOzpUKil0JM13P9bJrIKlr/TSvpjZdGPKFzsMez0ZrdcPtPnvr8Zt6jIoGfHURm6ei7J
	iQ2Q1LZHVtsoAVqpsgh645jmtvcclsf81AE6e56s8j29rt2kZlroxUAc6sLYD7drD0PjU8d1WKx
	5DXr7iPNm6ArClj0ht1IVfY/q5XVfreEvyGUL64mqWO25loEGt3K9/6jRU6QxgSoh/bnM+x94yZ
	084ZX30fS6JQSy+p6eym/f1hHJW6BnmycUH3WqYCopja9JyO37cWY8w6/DSeK4tGElvBLr+bOQH
	7vw==
X-Google-Smtp-Source: AGHT+IF/XWq8cu039JozjszDLRHZIQvsUr2yI7oC7chl8Xer0eG1cUzokFxTUnVEktkBv7Bfp+A18w==
X-Received: by 2002:a05:6e02:1849:b0:3d0:19c6:c9e1 with SMTP id e9e14a558f8ab-3d6ca5f84eemr79178055ab.13.1743615758138;
        Wed, 02 Apr 2025 10:42:38 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 10:42:37 -0700 (PDT)
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
Subject: [PATCH v3 24/54] dyndbg: split multi-query strings with %
Date: Wed,  2 Apr 2025 11:41:26 -0600
Message-ID: <20250402174156.1246171-25-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402174156.1246171-1-jim.cromie@gmail.com>
References: <20250402174156.1246171-1-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit
85f7f6c0edb8 ("dynamic_debug: process multiple debug-queries on a line")

Multi-query commands have been allowed:

  modprobe drm dyndbg="class DRM_UT_CORE +p; class DRM_UT_KMS +p"
  modprobe drm dyndbg=<<EOX
     class DRM_UT_CORE +p
     class DRM_UT_KMS +p
  EOX

More recently, the need for quoting was avoided by treating a comma
like a space/token-terminator:

  modprobe drm dyndbg=class,DRM_UT_CORE,+p\;class,DRM_UT_KMS,+p

That works, but it needs the escaped semicolon, which is a shell
special-char (one of the bash control operators), so it is brittle
when passed in/down/around scripts.  In particular, it fails when
passed to vng (virtme-ng).

So this patch adds '%' to the existing ';' and '\n' multi-command
separators, which is more shell-friendly, so you can more fully avoid
quoting and escaping hassles.

NOTE: it does break format matching on '%' patterns:

bash-5.2# ddcmd 'format "find-me: %foo" +p'
[  203.900581] dyndbg: read 26 bytes from userspace
[  203.900883] dyndbg: query 0: "format "find-me: " mod:*
[  203.901118] dyndbg: unclosed quote: find-me:
[  203.901355] dyndbg: tokenize failed
[  203.901529] dyndbg: query 1: "foo" +p" mod:*
[  203.901957] dyndbg: split into words: "foo"" "+p"
[  203.902243] dyndbg: op='+' flags=0x1 maskp=0xffffffff
[  203.902458] dyndbg: expecting pairs of match-spec <value>
[  203.902703] dyndbg: query parse failed
[  203.902871] dyndbg: processed 2 queries, with 0 matches, 2 errs
bash: echo: write error: Invalid argument

The '%' splits the input into 2 queries, and both fail.  Given the
limited utility of matching against the working parts of a format
string "foo: %d bar %s", nothing is actually lost here.

selftests-dyndbg: test_percent_splitting

This does basic testing of classmaps using '%' separated
multi-queries.  It modprobes test_dynamic_debug with several classes
enabled, and counts to verify that the expected sites show the
enablement in the control file.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
-v3 squash feature, test, doc together
    gate new test, which needs test-dynamic-debug.ko

test-percent-escape
---
 .../admin-guide/dynamic-debug-howto.rst       |  8 ++++---
 lib/dynamic_debug.c                           |  2 +-
 .../dynamic_debug/dyndbg_selftest.sh          | 24 +++++++++++++++++++
 3 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index e2dbb5d9b314..1ceadf4f28f9 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -85,10 +85,12 @@ by spaces, tabs, or commas.  So these are all equivalent::
   :#> ddcmd '  file   svcsock.c     line  1603 +p  '
   :#> ddcmd file,svcsock.c,line,1603,+p
 
-Command submissions are bounded by a write() system call.
-Multiple commands can be written together, separated by ``;`` or ``\n``::
+Command submissions are bounded by a write() system call.  Multiple
+commands can be written together, separated by ``%``, ``;`` or ``\n``::
 
-  :#> ddcmd "func pnpacpi_get_resources +p; func pnp_assign_mem +p"
+  :#> ddcmd func foo +p % func bar +p
+  :#> ddcmd func foo +p \; func bar +p
+  :#> ddcmd "func foo +p ; func bar +p"
   :#> ddcmd <<"EOC"
   func pnpacpi_get_resources +p
   func pnp_assign_mem +p
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 5737f1b4eba8..7a60088a1b5c 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -605,7 +605,7 @@ static int ddebug_exec_queries(char *query, const char *modname)
 	int i, errs = 0, exitcode = 0, rc, nfound = 0;
 
 	for (i = 0; query; query = split) {
-		split = strpbrk(query, ";\n");
+		split = strpbrk(query, "%;\n");
 		if (split)
 			*split++ = '\0';
 
diff --git a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
index c7bf521f36ee..513f6cb1db1d 100755
--- a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
+++ b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
@@ -256,9 +256,33 @@ function comma_terminator_tests {
     ddcmd =_
 }
 
+function test_percent_splitting {
+    echo -e "${GREEN}# TEST_PERCENT_SPLITTING - multi-command splitting on % ${NC}"
+    if [ $LACK_TMOD -eq 1 ]; then
+	echo "SKIP - test requires test-dynamic-debug.ko"
+	return
+    fi
+    ifrmmod test_dynamic_debug_submod
+    ifrmmod test_dynamic_debug
+    ddcmd =_
+    modprobe test_dynamic_debug dyndbg=class,D2_CORE,+pf%class,D2_KMS,+pt%class,D2_ATOMIC,+pm
+    check_match_ct =pf 1
+    check_match_ct =pt 1
+    check_match_ct =pm 1
+    check_match_ct test_dynamic_debug 23 -r
+    # add flags to those callsites
+    ddcmd class,D2_CORE,+mf%class,D2_KMS,+lt%class,D2_ATOMIC,+ml
+    check_match_ct =pmf 1
+    check_match_ct =plt 1
+    check_match_ct =pml 1
+    check_match_ct test_dynamic_debug 23 -r
+    ifrmmod test_dynamic_debug
+}
+
 tests_list=(
     basic_tests
     comma_terminator_tests
+    test_percent_splitting
 )
 
 # Run tests
-- 
2.49.0

