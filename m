Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6CF1917C2
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743615751; cv=none; b=NypfvqIxaJMi5WUaSNDrMJ3V6ox2d12j4/3YQKnDl2v3FjMPdH4jfZfOqLfGwxgWsk6nyG7xXso1+ce651wNftqrGoYXT+FKOqkHYQ0ndQ+ZyaHevlY0E5YYLROOzkoNWGnYcbN4/mp7ixaYoU2GKPLTWsy16kNluM6Y9Ac5gK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743615751; c=relaxed/simple;
	bh=4woGSZYOrznBRvkilPFccYpLgJPqYRQwY1WKYsAheYA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MaRdYlDm/Udb5HlyQgx/Kd05IPmWxwXrrMuf/VImJkr+P+Tv0Xvar5Jsth3K5ym5abjKzMrgf1RM0Y8Gc87T9v0QIhdfra2qV+XryVHG3lRu/knXs70xh1ivVIfnnJXImhRqArcTSOatjaLmZZBlL3v/I2yNfCSPc8MQ1FHUzAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C/FUjnPy; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C/FUjnPy"
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-85b44094782so356939f.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 10:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743615748; x=1744220548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zBPCp4iUxXvE3TA/4gPCbhy4jLrWUE5M6DM69pi7RG8=;
        b=C/FUjnPyFdGosJitdjtK0xNLkOmWYPo2epN05Y9pjeLm5P2b8HmaS+PkjRK9v71R+F
         cUtioHRxnK4rUv2QU79DZiJCepNWygmhAcHPq0a58dOpIzXH82CXL8EF7kE7ZMcABqTc
         75x5jZoSabBx3RnAlQePvZhbRS14BNr4D3AgsDxZxj2SDRb7kyUbtkgSt0uGvhSO4mMB
         d2Zl9z41xb+4GtWt5N1f2lgO49CBL+HG5cckLbXxpwBTVaWl2Fb38R1wcWoRrgM+0vGz
         9SyRGdhq1s/RTL8ZMUhfUpro6+MoL0n3VBxdnnX+JFl3vQJ9NGCSthRvYhPyoF54IEQg
         W1Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743615748; x=1744220548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zBPCp4iUxXvE3TA/4gPCbhy4jLrWUE5M6DM69pi7RG8=;
        b=MFgTlaM+/TrE1v+0yVKD7JPf3tv/X7jL9ziREEy+q64kdHr+wE/4AAlG6C/Z6vMsbZ
         bAY0u9zHGfdEmCE3wRyUc6eMluNXatmjs5GodBqTaba3q+wGm23xjs7B7Cpaxxx5YQB/
         tjitsxn8oiFzPlkFXZ+oajHLu4UaNMNwVMgEbcm8ovXY+u3XRVyhbLE2WuBkqQclMVDD
         4IuE/5Bpqo9BT7fmYNbJy9DBuG1HVXyWXvbYee/MgOJKYyvFdUvTD7Z+lWYXqd6Vt3ZF
         yMH2hkIWpIhS3Sk/+XTu1kvzoLqaA7+81agQIUDYmx77SDgXuq/39K+e0pezOqPmi/qU
         5WGA==
X-Forwarded-Encrypted: i=1; AJvYcCViGaf3MCImgE3d3MaGEw/+oIsW9Ha/3HzLSDYz+6J/ERwXq1wg/kdXab4vfVNKdAgtCfDVpriYVxiLvoQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZgVedLJY7MMWL7iEyXKYVEL2qfm9K0wypux4iPL/sWtc00uJA
	4D33r6zkXbUu3cLs5KI7Bt6O2x5jZc+ys6cb2IYdVqZAmauZjyCr
X-Gm-Gg: ASbGncu9eJvbaUXqdK5KaPk4CTdvDxfjQuV7Q58gLuxeFZ9epfO1J1BzNu7ZP/v27M9
	diybffpqQ9ioY+rtrsbmWwpsCyuG2/QnPCJIuhYhrI2mY+gHtvwROFYmFzudrSLnSeABKgKDqFq
	lh9yr8FRRv+TPExgNiL0DjS212VF796gRuhBYQIhV9vqhTM/m2IgSLKDiam42DAnO+qtcx/Bya6
	fgV8yHF8qES0r/N+XAkkFi+OCv/jrC/EFzIj9L1WBIr2pIcEdsrEdWLVtuNqh5zpmZ8x1iBHt+y
	SEPHimNZasjFfBKowawm70EPF9otV8JuzZdwsaLXQxKuAWLUeBIynDodn4SZfPCI5BdOHR9Owyv
	T4w==
X-Google-Smtp-Source: AGHT+IFHChRxUe/CFyGHCRhXSPTcNQNWMaUOrrxlaidGh2Iwl93M3Pr4TEsfbA6/T4Q/FDzWSFKJ3g==
X-Received: by 2002:a05:6e02:1a67:b0:3d0:21aa:a752 with SMTP id e9e14a558f8ab-3d5e08eaf0emr82482825ab.2.1743615748358;
        Wed, 02 Apr 2025 10:42:28 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 10:42:28 -0700 (PDT)
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
Subject: [PATCH v3 15/54] dyndbg: ddebug_table.mod_name down to _ddebug_info
Date: Wed,  2 Apr 2025 11:41:17 -0600
Message-ID: <20250402174156.1246171-16-jim.cromie@gmail.com>
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

struct _ddebug_info already has most of dyndbg's info for a module;
push debug_table.mod_name down into it, finishing the encapsulation.

This allows refactoring several callchains, passing &_ddebug_info
instead of &ddebug_table, and hoisting the "&dt->info" deref up.

ddebug_table contains a _ddebug_info member, so its users keep access
to mod_name, just now with "->info." added in.

In static ddebug_add_module(&di), reinforce the cursor-model by
dropping the modname arg, and setting di->mod_name at each caller.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
-v3 more s/dt/di/ internal interface changes
---
 include/linux/dynamic_debug.h |  1 +
 lib/dynamic_debug.c           | 45 ++++++++++++++++++-----------------
 2 files changed, 24 insertions(+), 22 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 9d282e2444e1..f4d1d08cd5a7 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -126,6 +126,7 @@ struct _ddebug_class_maps {
 } __packed;
 
 struct _ddebug_info {
+	const char *mod_name;
 	struct _ddebug_descs descs;
 	struct _ddebug_class_maps maps;
 } __packed;
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 046c4ffb38f8..aff254d39c36 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -46,7 +46,6 @@ extern struct _ddebug_class_map __stop___dyndbg_class_maps[];
 
 struct ddebug_table {
 	struct list_head link;
-	const char *mod_name;
 	struct _ddebug_info info;
 };
 
@@ -201,7 +200,7 @@ static int ddebug_change(const struct ddebug_query *query,
 
 		/* match against the module name */
 		if (query->module &&
-		    !match_wildcard(query->module, dt->mod_name))
+		    !match_wildcard(query->module, dt->info.mod_name))
 			continue;
 
 		if (query->class_string) {
@@ -269,7 +268,7 @@ static int ddebug_change(const struct ddebug_query *query,
 #endif
 			v4pr_info("changed %s:%d [%s]%s %s => %s\n",
 				  trim_prefix(dp->filename), dp->lineno,
-				  dt->mod_name, dp->function,
+				  dt->info.mod_name, dp->function,
 				  ddebug_describe_flags(dp->flags, &fbuf),
 				  ddebug_describe_flags(newflags, &nbuf));
 			dp->flags = newflags;
@@ -1133,12 +1132,12 @@ static void *ddebug_proc_next(struct seq_file *m, void *p, loff_t *pos)
 #define class_in_range(class_id, map)					\
 	(class_id >= map->base && class_id < map->base + map->length)
 
-static const char *ddebug_class_name(struct ddebug_table *dt, struct _ddebug *dp)
+static const char *ddebug_class_name(struct _ddebug_info *di, struct _ddebug *dp)
 {
 	struct _ddebug_class_map *map;
 	int i;
 
-	for_subvec(i, map, &dt->info, maps)
+	for_subvec(i, map, di, maps)
 		if (class_in_range(dp->class_id, map))
 			return map->class_names[dp->class_id - map->base];
 
@@ -1166,13 +1165,13 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
 
 	seq_printf(m, "%s:%u [%s]%s =%s \"",
 		   trim_prefix(dp->filename), dp->lineno,
-		   iter->table->mod_name, dp->function,
+		   iter->table->info.mod_name, dp->function,
 		   ddebug_describe_flags(dp->flags, &flags));
 	seq_escape_str(m, dp->format, ESCAPE_SPACE, "\t\r\n\"");
 	seq_putc(m, '"');
 
 	if (dp->class_id != _DPRINTK_CLASS_DFLT) {
-		class = ddebug_class_name(iter->table, dp);
+		class = ddebug_class_name(&iter->table->info, dp);
 		if (class)
 			seq_printf(m, " class:%s", class);
 		else
@@ -1224,7 +1223,7 @@ static const struct proc_ops proc_fops = {
 
 static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug_info *di)
 {
-	vpr_info("module:%s attached %d classes\n", dt->mod_name, dt->info.maps.len);
+	vpr_info("module:%s attached %d classes\n", dt->info.mod_name, dt->info.maps.len);
 }
 
 /*
@@ -1241,7 +1240,7 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
 #define dd_mark_vector_subrange(_i, _dst, _sp, _box, _vec) ({		\
 	int nc = 0;							\
 	for_subvec(_i, _sp, _box, _vec) {				\
-		if (!strcmp((_sp)->mod_name, (_dst)->mod_name)) {	\
+		if (!strcmp((_sp)->mod_name, (_dst)->info.mod_name)) {	\
 			if (!nc++)					\
 				(_dst)->info._vec.start = (_sp);	\
 		} else {						\
@@ -1256,7 +1255,7 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
  * Allocate a new ddebug_table for the given module
  * and add it to the global list.
  */
-static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
+static int ddebug_add_module(struct _ddebug_info *di)
 {
 	struct ddebug_table *dt;
 	struct _ddebug_class_map *cm;
@@ -1265,20 +1264,19 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 	if (!di->descs.len)
 		return 0;
 
-	v3pr_info("add-module: %s %d sites\n", modname, di->descs.len);
+	v3pr_info("add-module: %s %d sites\n", di->mod_name, di->descs.len);
 
 	dt = kzalloc(sizeof(*dt), GFP_KERNEL);
 	if (dt == NULL) {
-		pr_err("error adding module: %s\n", modname);
+		pr_err("error adding module: %s\n", di->mod_name);
 		return -ENOMEM;
 	}
 	/*
-	 * For built-in modules, name lives in .rodata and is
-	 * immortal. For loaded modules, name points at the name[]
-	 * member of struct module, which lives at least as long as
-	 * this struct ddebug_table.
+	 * For built-in modules, name (as supplied in di by its
+	 * callers) lives in .rodata and is immortal. For loaded
+	 * modules, name points at the name[] member of struct module,
+	 * which lives at least as long as this struct ddebug_table.
 	 */
-	dt->mod_name = modname;
 	dt->info = *di;
 
 	INIT_LIST_HEAD(&dt->link);
@@ -1292,7 +1290,7 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 	list_add_tail(&dt->link, &ddebug_tables);
 	mutex_unlock(&ddebug_lock);
 
-	vpr_info("%3u debug prints in module %s\n", di->descs.len, modname);
+	vpr_info("%3u debug prints in module %s\n", di->descs.len, di->mod_name);
 	return 0;
 }
 
@@ -1355,7 +1353,7 @@ static int ddebug_remove_module(const char *mod_name)
 
 	mutex_lock(&ddebug_lock);
 	list_for_each_entry_safe(dt, nextdt, &ddebug_tables, link) {
-		if (dt->mod_name == mod_name) {
+		if (dt->info.mod_name == mod_name) {
 			ddebug_table_free(dt);
 			ret = 0;
 			break;
@@ -1375,7 +1373,8 @@ static int ddebug_module_notify(struct notifier_block *self, unsigned long val,
 
 	switch (val) {
 	case MODULE_STATE_COMING:
-		ret = ddebug_add_module(&mod->dyndbg_info, mod->name);
+		mod->dyndbg_info.mod_name = mod->name;
+		ret = ddebug_add_module(&mod->dyndbg_info);
 		if (ret)
 			WARN(1, "Failed to allocate memory: dyndbg may not work properly.\n");
 		break;
@@ -1473,7 +1472,8 @@ static int __init dynamic_debug_init(void)
 			mod_ct++;
 			di.descs.len = mod_sites;
 			di.descs.start = iter_mod_start;
-			ret = ddebug_add_module(&di, modname);
+			di.mod_name = modname;
+			ret = ddebug_add_module(&di);
 			if (ret)
 				goto out_err;
 
@@ -1484,7 +1484,8 @@ static int __init dynamic_debug_init(void)
 	}
 	di.descs.len = mod_sites;
 	di.descs.start = iter_mod_start;
-	ret = ddebug_add_module(&di, modname);
+	di.mod_name = modname;
+	ret = ddebug_add_module(&di);
 	if (ret)
 		goto out_err;
 
-- 
2.49.0

