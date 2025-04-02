Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3495A1EF0AC
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743615747; cv=none; b=H4DPInpY9KLTlqx1J2SXyWESkN8xy+el0YMNHN/CM6bglwYofsjCGFcrRsP/J2sxRT0VC5fJTKciaaL1O04nCDe/vARmSkxHIlmqPZw85RzDO3PbUbkUGBzUIn6UVBwvSKnDlnu8yHiA8vDR3w5Tegjj9G+R1tjnZNzCLGAfjlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743615747; c=relaxed/simple;
	bh=7mdbeKopbxbrAVT5CV5/juuXEpASgLSbngk3hy14W7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FKx4TrXu0Fu7XwYJeLzJ8neVzfmwp08LRMYrX01SfVxT9VAIOf+oE2V1V92AOovkLKP07f3QrE7oSoR5IQuByEvc2enucf++atPrYcXzjyGvLQ+nqBO1i9Ix4tLjWivN+P2x0RJDusyOgtGDoWs1bBOjfgHkSbZwrlN8evoLAEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hhNNtI6W; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hhNNtI6W"
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3d5e43e4725so474905ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 10:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743615745; x=1744220545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c83dBzoIbcIM0DNfA5gVIyrKxy+OBEXIBjZPEG9Pdjo=;
        b=hhNNtI6WkpTIEuhejFDZgrG7WI6+WEpt5h7EatMNc3SrL60fttD7yg6Ddk9Nmk7cva
         DHRPW9vfii7F33itI+FQ2l3BGud3OMxtlSqN0beDZia9xmkEIDGGHDlAUC8Htcc5MJLF
         VSYTJojE5AH9H46kJBzMUulkQHRzxsKCHafcooBYGk2mjEvLXkxDdKVtXDnHuwR8uJVW
         gEJ6XEpy3LDdnqCFqx3rDv3037IQrGqBlHUKyAzke156LZC+EXjrJiBoQQmt7tfv90qw
         iRHzUripQ94959I73fqgkbNfn7gyo2Smz4wSY00UM0pCfgV6WasI19fAZVtlSLRTT963
         jAmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743615745; x=1744220545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c83dBzoIbcIM0DNfA5gVIyrKxy+OBEXIBjZPEG9Pdjo=;
        b=PmzzhiYw7D5HY2MQ+wcaBb9u0dhI3APRexKh+FCdxpVJ/zoBgW8M0vzlTiZFoC3mtN
         h0vlpDNt5eM2P2FH5TQWzjEkmlzIysLKbi2u66Q8b43y6ZOXacqTYvVoU8mdtGZxqxWH
         10lOR1yIPrIP57cJGukHFjE+vsHcBgpgF1fFRVxRPsjlUbsG15TOfgT+lyI4LTet/SWX
         jPYPZeTX+s8UvF+4hgX72avniK3krv2fJOQ7rUnHQFDLxmZB7Egcl/paTux2iIIUN0Ct
         y/jrJqJcvrzsiakh3Qdf0252G0II9lDxCGt5kvfH5U2DV6uJagzbJ4RIvcB7ls7eEENF
         lWcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwRtZLdUy5AHlpkkQsS3OAWKkCOWC7V1inWR9J24Pb9Dsv3OA8C/hg7n2e9OUlKho2b2gyFWFJ9hgL8UM=@vger.kernel.org
X-Gm-Message-State: AOJu0YznPEsuSVxc0A33Zpge00r+HUlrU/nvCA0WLSTmvSvEuhX7Gqyt
	VpyRKJP+YHJxwlBvG8FnGpcetdXvc1xqubbbRMzaV/DwZejh00Kz
X-Gm-Gg: ASbGncvxy8cfeR0GlYVUqihbPSUYYR+NSz7G6c5gcXUq+x18fEw9LnjXdSlCtIqvhM1
	w/l6zKifKNvGF2VIDWLsf61Y47Ubd03W/Bv/IE/IPg4GVKnIaMQ97Wt50i0ezhnTk5KWlkyjMTG
	vx3SyTz8Ccm+CZuST8BPF5oc/8D81ftEsIaBhnOeGxNOvZ22o+xRaEHIlYBf3Hs6Mnms0I0nRLl
	HGGjsmZExbFSNkFpwmZVoSqRoD3O/BXXJAL1pNDPkl1+w4TIO1WPHrr6aMDuf7vlcxuTTHDSrj+
	hcjESJ5MwRbYcRS07unwxIxg2DLDxSIqsRpP1PVdVQZD1TROc23NskjinV4HawFwYfg2crCUq/D
	u3A==
X-Google-Smtp-Source: AGHT+IG4VkEFZ5GxM5DWtdCptwmL6vD+yFvCbb5TkjAwVoCHsiKcA6mXmOduxT46XIJtI0tZSFL2lA==
X-Received: by 2002:a05:6e02:1848:b0:3d0:443d:a5c3 with SMTP id e9e14a558f8ab-3d6d546a3e6mr38861015ab.3.1743615745299;
        Wed, 02 Apr 2025 10:42:25 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.24
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
Subject: [PATCH v3 12/54] dyndbg: macrofy a 2-index for-loop pattern
Date: Wed,  2 Apr 2025 11:41:14 -0600
Message-ID: <20250402174156.1246171-13-jim.cromie@gmail.com>
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

dynamic-debug has several __sections, each with <vecname>,
num_<vecname>, and it iterates over these with a 2-index for-loop.
These loops are fiddly with the 2 names.

We have only 2 such loops now, but are getting more soon; lets
embed/abstract the fiddlyness in the for_subvec() macro, and avoid
repeating it going forward.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/dynamic_debug.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 85b8d32742ec..253eaf0a9bd6 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -128,6 +128,21 @@ do {								\
 #define v3pr_info(fmt, ...)	vnpr_info(3, fmt, ##__VA_ARGS__)
 #define v4pr_info(fmt, ...)	vnpr_info(4, fmt, ##__VA_ARGS__)
 
+
+/*
+ * simplify a repeated for-loop pattern walking N steps in a T _vec
+ * member inside a struct _box.  It expects int i and T *_sp to be
+ * declared in the caller.
+ * @_i:  caller provided counter.
+ * @_sp: cursor into _vec, to examine each item.
+ * @_box: ptr to a struct containing @_vec member
+ * @_vec: name of a sub-struct member in _box, with array-ref and length
+ */
+#define for_subvec(_i, _sp, _box, _vec)				       \
+	for ((_i) = 0, (_sp) = (_box)->_vec;			       \
+	     (_i) < (_box)->num_##_vec;				       \
+	     (_i)++, (_sp)++)
+
 static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
 {
 	/* trim any trailing newlines */
@@ -155,7 +170,7 @@ static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table cons
 	struct ddebug_class_map *map;
 	int i, idx;
 
-	for (map = dt->classes, i = 0; i < dt->num_classes; i++, map++) {
+	for_subvec(i, map, dt, classes) {
 		idx = match_string(map->class_names, map->length, class_string);
 		if (idx >= 0) {
 			*class_id = idx + map->base;
@@ -1220,8 +1235,7 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
 	 * the builtin/modular classmap vector/section.  Save the start
 	 * and length of the subrange at its edges.
 	 */
-	for (cm = di->classes, i = 0; i < di->num_classes; i++, cm++) {
-
+	for_subvec(i, cm, di, classes) {
 		if (!strcmp(cm->mod_name, dt->mod_name)) {
 			if (!nc) {
 				v2pr_info("start subrange, class[%d]: module:%s base:%d len:%d ty:%d\n",
-- 
2.49.0

