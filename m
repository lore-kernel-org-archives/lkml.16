Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9BB1E9B28
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743615744; cv=none; b=N5EOXtR6HcDYNJMeNODXBOHEQHRZyhZpeaCN7rtMawiB5GXfXveWG3gNbgsPenGL5v8mWro4d5bWG5MawJINYDid6FRAB3ZmFQWrzETg+QyplpcRexuztXzdZqWT0wxEp7w1Pd4NU7+SxtG4pPKyOS2bzHMdQRNx4J1M/mFKb+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743615744; c=relaxed/simple;
	bh=zTzu1lwT/yPrwrMLE6P5y0xJGhOKXxeyMkk94mm8q0o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WydyOo7VRBwb/j7MBP0xE5l9BrLt/r/B483AnWML27wGxFFAecVezobhK7mskOSz+1eD/ukNqo0Tsy/eyXd5zWe9ky+Sws/qrgBNNkYeQd5HLdCv/dP4YN4vhLFbWPRgfg+qODFtvnaxQGAvy+B4TR6KEO7SpB6u0FYKzY5QQ6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E/OYQ03p; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E/OYQ03p"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3d442a77a03so428115ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 10:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743615741; x=1744220541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0gFevukveSt7PbWkbUevQGA0uvSXu+LT7vaKBaZctmY=;
        b=E/OYQ03pVDbebdL0NcKdz8VLxw1a6CfER/8kYpc2UwXFC53UPqp8HYtF+vfdCBG5sY
         /moDQTYS6M39gaWe6+B5eOCpdqidLP4+iOgas3pR/JEixbOWcmVzuQuPZ2SwalhAqFsD
         XQZYeldKvQ8I6LSKSpS1/amlFX9aoOJKr/ScQIxZ2PZWdjr+cF/kvYos1Jb7YHvaG25C
         BKsEQrROva5PRYf1MoPnemHfZhReye4NEVUp5YrALwPMH4DjsdWXxVqbWTypTuQcEf32
         70M3vnnfq9NMX+QVTNE/oCfS/Zd6sFza4kXfFSBdQh5krr9l9aCwAX8BE8t0bAe6DlgL
         VGVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743615741; x=1744220541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0gFevukveSt7PbWkbUevQGA0uvSXu+LT7vaKBaZctmY=;
        b=kza09svRYGoKg/ubKq9j3HNcF1wZU0ggpwYZZezlr22hU//x9lqMg/r/h6zNpLKawv
         43aLPcVAjOV7dZ5oagJDBmCrhLS/GLKEjqkFl+o3XxiE5WIAn32jbuDPIj6Bp5gbHDXC
         uXNRrvOTAalSWehHWsQpDaF5ycQ0VviBAIqi97g5oZriOTqbCorrpC8az2h+AvfwrBm/
         JMg5zU37n0Sw4xSek+P05Vhy2B62nnY/xkrUNJmzGxgsZmOA2acssOSDxBnaVKxfY+Kr
         xDjYT79VyiZ9uWBKgWPlqOpzm9xJL+5oKJWo+2Wlu/KuFaq/4TKs90y82GGUFgCYHlg3
         6NEw==
X-Forwarded-Encrypted: i=1; AJvYcCUcL0Dtbqo4Szj/CsNg+Q0VODhZ9+SPwG+VEDFqlzU6yuPhaN2GjXeykh5NFplSee+KeY8Y05AUHZJaQdk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCxVNoh/zAthScSkmZd788VpqfWuHZuqXsRzHz4YKCilVW3B1+
	VTc5yUnUdnvKDC0C9XvarmZahtDK3D4RL9cxRV1oUWivFIZLOtLP
X-Gm-Gg: ASbGncuWLIrjf+cQkSsXO3fS+TG5zb9jwsX6oVRzEMVBAVO04uOoPhSweiVTiT/Tllf
	bKc7cH3EvNtSmZcF6ax1YjO2R/3aM3R4A9ZrURrRsb8TuVuEOjhVdYc+nKTKzNo8/ph791yFqwV
	OkaXCURoahEFTv7I/3rusK0r7rgPsW3wl317S7zqfaJrEqb4DSAhIi4RbYpiRMztgEj4OX1c7/W
	w0Or9rYXiGipBQ4gsQuG7no5HrldRR7NxP3c6XxX+oNs68TRorsniqV2gYYXM11qYegvtWJJGvU
	DqOVjvUfh506onL8oA3uoShKxohC5yppBDjrMGmgQ1BSFXXkxa83VMC7r21l7VoeC44lWSaIyR6
	QtA==
X-Google-Smtp-Source: AGHT+IEV2XIR0LN/wAE2n62Y1VoOctpEVbSfU4OWKQUPEpcCeuWBTEhGGJZ77uLyoEnBh82Q9kZt3g==
X-Received: by 2002:a05:6e02:3c85:b0:3d3:d994:e92e with SMTP id e9e14a558f8ab-3d5e09db5d3mr173946165ab.17.1743615741560;
        Wed, 02 Apr 2025 10:42:21 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 10:42:21 -0700 (PDT)
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
Subject: [PATCH v3 08/54] dyndbg: reduce verbose/debug clutter
Date: Wed,  2 Apr 2025 11:41:10 -0600
Message-ID: <20250402174156.1246171-9-jim.cromie@gmail.com>
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

currently, for verbose=3, these are logged (blank lines for clarity):

 dyndbg: query 0: "class DRM_UT_CORE +p" mod:*
 dyndbg: split into words: "class" "DRM_UT_CORE" "+p"

 dyndbg: op='+'
 dyndbg: flags=0x1
 dyndbg: *flagsp=0x1 *maskp=0xffffffff

 dyndbg: parsed: func="" file="" module="" format="" lineno=0-0 class=...
 dyndbg: no matches for query
 dyndbg: no-match: func="" file="" module="" format="" lineno=0-0 class=...
 dyndbg: processed 1 queries, with 0 matches, 0 errs

That is excessive, so this patch:
 - shrinks 3 lines of 2nd stanza to single line
 - drops 1st 2 lines of 3rd stanza
   3rd line is like 1st, with result, not procedure.
   2nd line is just status, retold in 4th, with more info.

New output:

 dyndbg: query 0: "class DRM_UT_CORE +p" mod:*
 dyndbg: split into words: "class" "DRM_UT_CORE" "+p"
 dyndbg: op='+' flags=0x1 *flagsp=0x1 *maskp=0xffffffff
 dyndbg: no-match: func="" file="" module="" format="" lineno=0-0 class=...
 dyndbg: processed 1 queries, with 0 matches, 0 errs

Also reduce verbose=3 messages in ddebug_add_module

When modprobing a module, dyndbg currently logs/says "add-module", and
then "skipping" if the module has no prdbgs.  Instead just check 1st
and return quietly.

no functional change

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
-v2 squash several verbose cleanups together
---
 lib/dynamic_debug.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 55df35df093b..c609ff873224 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -264,9 +264,6 @@ static int ddebug_change(const struct ddebug_query *query,
 	}
 	mutex_unlock(&ddebug_lock);
 
-	if (!nfound && verbose)
-		pr_info("no matches for query\n");
-
 	return nfound;
 }
 
@@ -499,7 +496,6 @@ static int ddebug_parse_flags(const char *str, struct flag_settings *modifiers)
 		pr_err("bad flag-op %c, at start of %s\n", *str, str);
 		return -EINVAL;
 	}
-	v3pr_info("op='%c'\n", op);
 
 	for (; *str ; ++str) {
 		for (i = ARRAY_SIZE(opt_array) - 1; i >= 0; i--) {
@@ -513,7 +509,6 @@ static int ddebug_parse_flags(const char *str, struct flag_settings *modifiers)
 			return -EINVAL;
 		}
 	}
-	v3pr_info("flags=0x%x\n", modifiers->flags);
 
 	/* calculate final flags, mask based upon op */
 	switch (op) {
@@ -529,7 +524,7 @@ static int ddebug_parse_flags(const char *str, struct flag_settings *modifiers)
 		modifiers->flags = 0;
 		break;
 	}
-	v3pr_info("*flagsp=0x%x *maskp=0x%x\n", modifiers->flags, modifiers->mask);
+	v3pr_info("op='%c' flags=0x%x maskp=0x%x\n", op, modifiers->flags, modifiers->mask);
 
 	return 0;
 }
@@ -539,7 +534,7 @@ static int ddebug_exec_query(char *query_string, const char *modname)
 	struct flag_settings modifiers = {};
 	struct ddebug_query query = {};
 #define MAXWORDS 9
-	int nwords, nfound;
+	int nwords;
 	char *words[MAXWORDS];
 
 	nwords = ddebug_tokenize(query_string, words, MAXWORDS);
@@ -557,10 +552,7 @@ static int ddebug_exec_query(char *query_string, const char *modname)
 		return -EINVAL;
 	}
 	/* actually go and implement the change */
-	nfound = ddebug_change(&query, &modifiers);
-	vpr_info_dq(&query, nfound ? "applied" : "no-match");
-
-	return nfound;
+	return ddebug_change(&query, &modifiers);
 }
 
 /* handle multiple queries in query string, continue on error, return
@@ -1234,11 +1226,10 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 {
 	struct ddebug_table *dt;
 
-	v3pr_info("add-module: %s.%d sites\n", modname, di->num_descs);
-	if (!di->num_descs) {
-		v3pr_info(" skip %s\n", modname);
+	if (!di->num_descs)
 		return 0;
-	}
+
+	v3pr_info("add-module: %s %d sites\n", modname, di->num_descs);
 
 	dt = kzalloc(sizeof(*dt), GFP_KERNEL);
 	if (dt == NULL) {
-- 
2.49.0

