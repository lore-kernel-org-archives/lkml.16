Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4121F0E36
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743615750; cv=none; b=NLdt3RrHwyXx7uc7/8WGXTUzQIIxKSvg6/Ctetu9ilhnGJc2BleZS5LWPVPs08gE1TdlRteT4rvHXdtIL3ZLNtxLDPDz2EK76MoX51brrWj012ESfZ8tgAJpYn9/cQ1MAYlC+pA97sNnTqRKtZM1BVF8/EaQrh8odCaVj38Vsp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743615750; c=relaxed/simple;
	bh=GlDskdVm12jjjIQZLhKuKLleuMoQsfmoF9yvGO7BVAU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hRG3CgQuSBSqlbQ/42vp+K1x1ZIRuoUDkzrMj1yksq72Dug95HxFPkbWT6XgEd23mvSzNnEbaJilvJhncVyCL1EyYBv6Bn1gC1m0MqnP366OGNA/RQF38yEMcLc07JKO+hDxVqidxwSTQdoOwYlvwx+swiHG/VI1y/DBXUcBT08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aUKBYhJ7; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aUKBYhJ7"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3d58908c43fso505435ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 10:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743615747; x=1744220547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1HVCxpeKRFzeSI1AhmlyvBuPBqCCJEuta9afFF5qwQI=;
        b=aUKBYhJ75QO/48n+wjqSRBKLsHwQ3wOYqUI1V7taSHW9eZscHHw40iqNBttigxXGkH
         /zUSPh7nSywoyu/NEtgersIUvO24RenSFiSuXZUs8WicgnEkps1ZT5nOJRMIHIu2scRx
         zjZWAH+J5NqvbIFqvsG/6bZaB0/ws9HVZa1EJVe7AeXpHm+Ekw7anWM67FsaEYZNv0/a
         Lk3rAP/8RoJ0LRqUkKiLnCDDQLUPsg+Mx0U9iil1rjQEf+4oxsJxCy2t6x9O/yAu64Wt
         xHjqULVSfy0dO1jsRk6xPkZxHFgQsja/lIKuIxZt7OPHtD9lcAiQIWJ+SX7D1PIJJ70k
         wCtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743615747; x=1744220547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1HVCxpeKRFzeSI1AhmlyvBuPBqCCJEuta9afFF5qwQI=;
        b=bDUh8CqCZKAUlRcVUk7r2rLP3XXq0X7NLCLaaRjNmAv7rsTgG3O9B+srHEkOJBHABY
         UOUoM8IAISG+8gnKZpW1q5x8rSr0ubVQFqqEaVUVZoCPp0Bk0sDazQCj4VPpE73W3mAT
         uceumAzmJwwhuHaRUybm9fVWDG6R+wT84IBi6TSgfoDs7GbURQQUKn+MPH2H1DMymmHb
         99NoARuIs4/Cr8AQb1ANDVf3zKQHO+cBCkMr4wbd7tOCWCB56munXzXLfDNff+ZsaWxC
         8JfL/sx+DZ+EKnfFI1H8D4EWRyivpVs2wXZu0lQWGa0I8fqoLBamr/uvwVB2fD4hn4SB
         amLg==
X-Forwarded-Encrypted: i=1; AJvYcCUXXktpGHLjD4HEaWVPa51ppUe9IMamLkJLMbR59USTmjqO4gaINBzTCWoD76vWbdWBtSWXlnrqFmHDfP0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxR1Gatn5fDDbYHicS1nAgyUvPFQrG48XgsXFyeREDoDVpR+PPJ
	bjhhc6BXogM4lJe6+2dkZzgLYOXNt8ZjLGnq7pIdL8F8z5zxt+Zz
X-Gm-Gg: ASbGncvCmgKdrCssevFqOuIju5M7QbVG3nqHkgaEL4bxmLDoEOmpSYlnk0VsmTM2CNy
	MCUlki0NzE8Asff4By/3SozW9FEiTdZeeQRgzQEshNl+ULiO2210Tp7b31/F8DiCnZtSD7wOO5B
	i9hFQq3WIAkxh8hPHWTh2HEyJnH2MLgXIfFCK8iF+8FV68uRlPb2UMYc46HHfo99PJHuLOk/J9e
	f3sEXxp4dNGN0zfU1NDFO9xooZu+2PqbWStqJUi7Xwi/D0svzYRSfXdi7Vo4sPMAIm2verHkXYg
	VkmkVTs1kIQFOpc+Ay5mRE3NPoxftcz/7JQ2ZclsWTTSrOEL4webv09mfOS8MGY8I0fyNafbFcJ
	Skw==
X-Google-Smtp-Source: AGHT+IGlzPv/lWLR6oQjYV5JPNtW8nNh4plsjoqpQBkDo3jtIwkHZqjbr7e+0JVOkoajzQcuo3mWrg==
X-Received: by 2002:a05:6e02:3c85:b0:3d3:d994:e92e with SMTP id e9e14a558f8ab-3d5e09db5d3mr173949595ab.17.1743615747396;
        Wed, 02 Apr 2025 10:42:27 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 10:42:26 -0700 (PDT)
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
Subject: [PATCH v3 14/54] dyndbg: hoist classmap-filter-by-modname up to ddebug_add_module
Date: Wed,  2 Apr 2025 11:41:16 -0600
Message-ID: <20250402174156.1246171-15-jim.cromie@gmail.com>
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

The body of ddebug_attach_module_classes() is dominated by a
code-block that finds the contiguous subrange of classmaps matching on
modname, and saves it into the ddebug_table's info record.

Implement this block in a macro to accommodate different component
vectors in the "box" (as named in the for_subvec macro).

And hoist its invocation out of ddebug_attach_module_classes() up into
ddebug_add_module().  This moves the filtering step up closer to
dynamic_debug_init(), which effectively does the same for builtin
pr_debug descriptors; segmenting them into subranges by modname.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 56 ++++++++++++++++++++++++++-------------------
 1 file changed, 32 insertions(+), 24 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 104cf8abdf33..046c4ffb38f8 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -161,8 +161,8 @@ static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
 }
 
 static struct _ddebug_class_map *ddebug_find_valid_class(struct ddebug_table const *dt,
-							const char *class_string,
-							int *class_id)
+							 const char *class_string,
+							 int *class_id)
 {
 	struct _ddebug_class_map *map;
 	int i, idx;
@@ -1224,30 +1224,34 @@ static const struct proc_ops proc_fops = {
 
 static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug_info *di)
 {
-	struct _ddebug_class_map *cm;
-	int i, nc = 0;
-
-	/*
-	 * Find this module's classmaps in a subrange/wholerange of
-	 * the builtin/modular classmap vector/section.  Save the start
-	 * and length of the subrange at its edges.
-	 */
-	for_subvec(i, cm, di, maps) {
-		if (!strcmp(cm->mod_name, dt->mod_name)) {
-			if (!nc) {
-				v2pr_info("start subrange, class[%d]: module:%s base:%d len:%d ty:%d\n",
-					  i, cm->mod_name, cm->base, cm->length, cm->map_type);
-				dt->info.maps.start = cm;
-			}
-			nc++;
-		}
-	}
-	if (nc) {
-		dt->info.maps.len = nc;
-		vpr_info("module:%s attached %d classes\n", dt->mod_name, nc);
-	}
+	vpr_info("module:%s attached %d classes\n", dt->mod_name, dt->info.maps.len);
 }
 
+/*
+ * Walk the @_box->@_vec member, over @_vec.start[0..len], and find
+ * the contiguous subrange of elements matching on ->mod_name.  Copy
+ * the subrange into @_dst.  This depends on vars defd by caller.
+ *
+ * @_i:   caller provided counter var, init'd by macro
+ * @_sp:  cursor into @_vec.
+ * @_box: contains member named @_vec
+ * @_vec: an array-ref, with: .start .len fields.
+ * @_dst: an array-ref: to remember the module's subrange
+ */
+#define dd_mark_vector_subrange(_i, _dst, _sp, _box, _vec) ({		\
+	int nc = 0;							\
+	for_subvec(_i, _sp, _box, _vec) {				\
+		if (!strcmp((_sp)->mod_name, (_dst)->mod_name)) {	\
+			if (!nc++)					\
+				(_dst)->info._vec.start = (_sp);	\
+		} else {						\
+			if (nc)						\
+				break; /* end of consecutive matches */ \
+		}							\
+	}								\
+	(_dst)->info._vec.len = nc;					\
+})
+
 /*
  * Allocate a new ddebug_table for the given module
  * and add it to the global list.
@@ -1255,6 +1259,8 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
 static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 {
 	struct ddebug_table *dt;
+	struct _ddebug_class_map *cm;
+	int i;
 
 	if (!di->descs.len)
 		return 0;
@@ -1277,6 +1283,8 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 
 	INIT_LIST_HEAD(&dt->link);
 
+	dd_mark_vector_subrange(i, dt, cm, di, maps);
+
 	if (di->maps.len)
 		ddebug_attach_module_classes(dt, di);
 
-- 
2.49.0

