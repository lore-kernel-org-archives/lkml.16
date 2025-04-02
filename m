Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8B11EE7C0
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743615747; cv=none; b=dVoQ/fiBfMjHWEzS3MFYg7fePmSqxYVhACZ5mJyf+NHviyyDAVL2/misIPrHeJvQrQ/bCYFcQxAWUZqN/KXbi0zRBsW8WHdqT3nJF/XCP+V2poRt6Npu8mWeeIXx9JBr+S7ci+KrEaVFQU/eMf6FhaW9VzmTW+fvGvz0mUBjkwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743615747; c=relaxed/simple;
	bh=NYkyWk6dAvg8GlO3EbdOfZzM5R5WKGYPLSbB6Gfk2UQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b4CuBJqZmADkLXqAC3DV/cQcExB1jda/2S3FSeubyAn3otpT/p7ajChZV8ua8u1dbzESYC0FwG2N5uD3NOayaNOZaALbFKd84RbZ6a6jgg2xdIjtJNHIUZGupmcIVs/D7GubXg+x05UGyQFlncLP9+0XHjLn86rSb9y//Zeuc9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YUSLs23N; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YUSLs23N"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3d43c972616so330725ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 10:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743615744; x=1744220544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d71I99XtVy4797+iIGr5U+qSA7ZenkLyXc4Q7GcfPmk=;
        b=YUSLs23NHqoa6IEhSPZR3OEvtaOIs3ATyv0euAP4e/jyVGGZFab0FLAlidu6o728by
         x0wWYVXpgWVAUYWkAFrANlIvZ2oTkqbn2mDSqfgzB59rjRoysQyNb/Th7Fuur555Zjww
         SHsUwlpIOd/k++D4krGF8sInIVyDW7/4vyRobNQ4Xi9zvj+qwjrQb6LtITSJKn502nbz
         W3nAFVrZZMpMsCQ5F6pxjdJT9iE/esUQlkFW0lX7A8yYxu3B4fPqFr3I+D2s63flSc93
         d989u+QLoOJjbytdpcRV6vA6yyksAkFpUQk6FDkKsleCwM7if+2aNG2mlhA2ZLVbwahq
         GO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743615744; x=1744220544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d71I99XtVy4797+iIGr5U+qSA7ZenkLyXc4Q7GcfPmk=;
        b=XSIM3c2t6nH+mYj+70veIVj7zxLWIFZLKj00DIeKWRuKLuaDTCEsYulW4xK2OLEtSU
         l3cPJSBn5rJq8t24lcG0V9sKTW97HN5er8a+m3lFKJyHK1hYMQO8ZjGEY23+XMJQNvgH
         ufZlRjQCQaS9CwgVzPR1edJztv3EVc45ST1Zsu/+ye1zhhB3ugUgYCz1bCQidwu1mThf
         AIvXE0RZ1x9hG+FfiRXcUEMrCm3yZNq3qicPxKGsGeH2ZvM5J4EixE25wreQRJ/Yp846
         SSVNiPNqDljvRk78LLC4lRhgt80aGz7P+ewF8KSWzk/dZvz9d7w/b1eu2KLW1H/pXqr1
         qyGA==
X-Forwarded-Encrypted: i=1; AJvYcCXR0URMvSKCQHuTX/7st+lJWZjlDsgXqrsn9GeQixXm+EKneJb5VznFkRagsJtMxFtizsHDw/2n/TEzl2w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyW5e+32dv6QrZVm2XCBgdl8c0WUjV/Ig4GAII+UZnA8w8/uMUb
	kOFYLbfSd558R2QSrje7BuDUK8z8lv4daqkZIj211ImI7JbXGuAN
X-Gm-Gg: ASbGncsB0a7vwxAaCFXyjzzRGx25HIIdJPqeyYrQfI4q6YFGRDXbnl1CZ7mXZeFCkm2
	50uHJWqI5pFu+JgVgUcodDszi5hltDqFfeyxzgaQDeq2IYfJyHx0fL3zI4bBUVa3yUr6DhkhjBa
	7DuM8AqFlU6GoOJhHMO+JMrC3EIf30v2NF+PUwHoCFzrWXM8nnvl7jjTDz9n5FIzcnu4cxck3QB
	A50bxB/3baq+EKXjVsfI86btoEo2RRVK2Y0/YWWs94l+LecpzbHRcPgKZyAOxGmKmTXkiU33yjw
	YpGN4gSsAnLJJAJF/HLwCP9EKsseY5o2cNEcm6ttYZCgoYnCrue1TAwu4+01vUXYQZaURcAghTK
	6Hg==
X-Google-Smtp-Source: AGHT+IG+gSa1soX7/vjnYhv/X0CCHTfdsDvGdVc4Ac6El3VHxHpzKXqSuveJpX56mj/w47JbZdEjVQ==
X-Received: by 2002:a05:6e02:2148:b0:3d3:f15e:8e23 with SMTP id e9e14a558f8ab-3d6dcbc59d4mr6812745ab.10.1743615744434;
        Wed, 02 Apr 2025 10:42:24 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 10:42:24 -0700 (PDT)
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
Subject: [PATCH v3 11/54] dyndbg: replace classmap list with a vector
Date: Wed,  2 Apr 2025 11:41:13 -0600
Message-ID: <20250402174156.1246171-12-jim.cromie@gmail.com>
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

Classmaps are stored in an elf section/array, but currently are
individually list-linked onto dyndbg's per-module ddebug_table for
operation. This is unnecessary.

Just like dyndbg's descriptors, classes are packed in compile order;
so even with many builtin modules employing multiple classmaps, each
modules' maps are packed contiguously, and can be treated as a
array-start-address & array-length.

So this drops the whole list building operation done in
ddebug_attach_module_classes(), and removes the list-head members.
The "select-by-modname" condition is reused to find the start,end of
the subrange.

NOTE: This "filter-by-modname" on classmaps should really be done in
ddebug_add_module(1); ie at least one step closer to ddebug_init(2),
which already splits up pr-debug descriptors into subranges by
modname, then calls (1) on each.  (2) knows nothing of classmaps
currently, and doesn't need to.  For now, just add comment.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
v3- drop __outvar as promising magic it doesnt have
---
 include/linux/dynamic_debug.h |  1 -
 lib/dynamic_debug.c           | 62 ++++++++++++++++++-----------------
 2 files changed, 32 insertions(+), 31 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index ac199293d203..e458d4b838ac 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -83,7 +83,6 @@ enum class_map_type {
 };
 
 struct ddebug_class_map {
-	struct list_head link;
 	struct module *mod;
 	const char *mod_name;	/* needed for builtins */
 	const char **class_names;
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 621e04b1f28c..85b8d32742ec 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -45,10 +45,11 @@ extern struct ddebug_class_map __start___dyndbg_classes[];
 extern struct ddebug_class_map __stop___dyndbg_classes[];
 
 struct ddebug_table {
-	struct list_head link, maps;
+	struct list_head link;
 	const char *mod_name;
-	unsigned int num_ddebugs;
 	struct _ddebug *ddebugs;
+	struct ddebug_class_map *classes;
+	unsigned int num_ddebugs, num_classes;
 };
 
 struct ddebug_query {
@@ -148,12 +149,13 @@ static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
 }
 
 static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table const *dt,
-							  const char *class_string, int *class_id)
+							const char *class_string,
+							int *class_id)
 {
 	struct ddebug_class_map *map;
-	int idx;
+	int i, idx;
 
-	list_for_each_entry(map, &dt->maps, link) {
+	for (map = dt->classes, i = 0; i < dt->num_classes; i++, map++) {
 		idx = match_string(map->class_names, map->length, class_string);
 		if (idx >= 0) {
 			*class_id = idx + map->base;
@@ -164,7 +166,6 @@ static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table cons
 	return NULL;
 }
 
-#define __outvar /* filled by callee */
 /*
  * Search the tables for _ddebug's which match the given `query' and
  * apply the `flags' and `mask' to them.  Returns number of matching
@@ -180,7 +181,7 @@ static int ddebug_change(const struct ddebug_query *query,
 	unsigned int nfound = 0;
 	struct flagsbuf fbuf, nbuf;
 	struct ddebug_class_map *map = NULL;
-	int __outvar valid_class;
+	int valid_class;
 
 	/* search for matching ddebugs */
 	mutex_lock(&ddebug_lock);
@@ -1122,9 +1123,10 @@ static void *ddebug_proc_next(struct seq_file *m, void *p, loff_t *pos)
 
 static const char *ddebug_class_name(struct ddebug_iter *iter, struct _ddebug *dp)
 {
-	struct ddebug_class_map *map;
+	struct ddebug_class_map *map = iter->table->classes;
+	int i, nc = iter->table->num_classes;
 
-	list_for_each_entry(map, &iter->table->maps, link)
+	for (i = 0; i < nc; i++, map++)
 		if (class_in_range(dp->class_id, map))
 			return map->class_names[dp->class_id - map->base];
 
@@ -1208,30 +1210,31 @@ static const struct proc_ops proc_fops = {
 	.proc_write = ddebug_proc_write
 };
 
-static void ddebug_attach_module_classes(struct ddebug_table *dt,
-					 struct ddebug_class_map *classes,
-					 int num_classes)
+static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug_info *di)
 {
 	struct ddebug_class_map *cm;
-	int i, j, ct = 0;
+	int i, nc = 0;
 
-	for (cm = classes, i = 0; i < num_classes; i++, cm++) {
+	/*
+	 * Find this module's classmaps in a subrange/wholerange of
+	 * the builtin/modular classmap vector/section.  Save the start
+	 * and length of the subrange at its edges.
+	 */
+	for (cm = di->classes, i = 0; i < di->num_classes; i++, cm++) {
 
 		if (!strcmp(cm->mod_name, dt->mod_name)) {
-
-			v2pr_info("class[%d]: module:%s base:%d len:%d ty:%d\n", i,
-				  cm->mod_name, cm->base, cm->length, cm->map_type);
-
-			for (j = 0; j < cm->length; j++)
-				v3pr_info(" %d: %d %s\n", j + cm->base, j,
-					  cm->class_names[j]);
-
-			list_add(&cm->link, &dt->maps);
-			ct++;
+			if (!nc) {
+				v2pr_info("start subrange, class[%d]: module:%s base:%d len:%d ty:%d\n",
+					  i, cm->mod_name, cm->base, cm->length, cm->map_type);
+				dt->classes = cm;
+			}
+			nc++;
 		}
 	}
-	if (ct)
-		vpr_info("module:%s attached %d classes\n", dt->mod_name, ct);
+	if (nc) {
+		dt->num_classes = nc;
+		vpr_info("module:%s attached %d classes\n", dt->mod_name, nc);
+	}
 }
 
 /*
@@ -1263,10 +1266,9 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 	dt->num_ddebugs = di->num_descs;
 
 	INIT_LIST_HEAD(&dt->link);
-	INIT_LIST_HEAD(&dt->maps);
 
 	if (di->classes && di->num_classes)
-		ddebug_attach_module_classes(dt, di->classes, di->num_classes);
+		ddebug_attach_module_classes(dt, di);
 
 	mutex_lock(&ddebug_lock);
 	list_add_tail(&dt->link, &ddebug_tables);
@@ -1379,8 +1381,8 @@ static void ddebug_remove_all_tables(void)
 	mutex_lock(&ddebug_lock);
 	while (!list_empty(&ddebug_tables)) {
 		struct ddebug_table *dt = list_entry(ddebug_tables.next,
-						      struct ddebug_table,
-						      link);
+						     struct ddebug_table,
+						     link);
 		ddebug_table_free(dt);
 	}
 	mutex_unlock(&ddebug_lock);
-- 
2.49.0

