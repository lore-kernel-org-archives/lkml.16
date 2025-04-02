Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3E11EB182
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743615745; cv=none; b=hqGt23hx/Zk/th1loKI2W2nnU420lkTdiojAuwell+Q5OFB0NWYlxImlW3yHl0ibm2SacAOYpzK5btY6WbJIj5y1/hPPbLg7VH8kMbaFtQ4Zc+ZjuiNDOG2U4CvtzTGBRD/tncQHxFCxbOwTbR2jrYupfwNC46Mm/7BxjPYXvLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743615745; c=relaxed/simple;
	bh=Mg4sgky6TIcj8q0mQMDknRACjH0yuXBrzolkI8PnkNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D1Pr5zccmfqC6gOIUisJsdlP8FlNsDU73/TZpVMHv/BVCAA46oFcaFeRADkUP1s1gp9oukEfGWFQdOlS9AKbahKLN2BzlzPoD1m15EBesPcCsZSxH9qpJQbRAusBJ/JvyRQCGrQkDgLapdux1mHinRHfRJzWsmrRwwyYv3yiQ5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fh2Fz+VV; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fh2Fz+VV"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3ce886a2d5bso1034295ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 10:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743615742; x=1744220542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M14gZKfhH3KugOXUlz//RUWXY3n2mU5NyLnRML1fEas=;
        b=fh2Fz+VVmp7oZJXN7IqziPDjlNnEWpJYAen9rCsdJvw9coqOMLuPEUUpTEGWejqstz
         nDRAmIJeQ3FrjKr/vXYBAngNTehJZkxeDIHFJObZD7B3R8RLTRufd4gkafqeYu46bLak
         UxR1usiiKyR+4ltu/tYzFKeDVhnzbcollraE/9Xn7gfgbQhG7jcEMNLyGI+PeoEjRKxO
         ygZn0vPHAP7I7X+N+r9JjGCxyW0qYvGzEU6XaH2Z5nlGZa85xP5CTYqsos7QgyVW0ZgK
         ocJuVhYRihUXp5zMNVXcKrkOrvQuYtY5XndwB5VUouFsz55QZiIIAu2B8Whj6WwFRATl
         4hJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743615742; x=1744220542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M14gZKfhH3KugOXUlz//RUWXY3n2mU5NyLnRML1fEas=;
        b=tF+oX0n3HLjcNU2UBu9A5R0R3U6jSoWkYzFJ6VJpTXOTrxUg+UP4P4zYSvYzw+mRSF
         uRb6YJ2oKTdte40uZjaRLuNaLz2AKL4CYIGOON53TcWGWG9fuQIr+vc0pPIw5ZDZrJuN
         q4D1TFh/tkkHsYB41AccT1N1Ik3QXcTEOn3xM5Z+HCD6BzvO9cq1yIYoov/nkQLxyCGN
         ZAk/SBJ+K2/aHEgTR+wyow3WN5YezwRp+YfYAR78Lnx4PqISlmp9L4090OoMgCZhkpzk
         jyh5g4c7CeYLidnXI2KsZtds2NP9RFe0qLJXkxJtfGLIWhHnH0HFIm4TeBwl6z8CctXK
         phfQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/pG1m11v81jy7FAnWdC71PU2OvsWuPU9EpKoN1JDaaSnyXOc3saSZA7Lu7m0+MfJTyiBqiGC1XHOeVNU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt7cZwqhx4yUvEpQOLWX6PzMMVdkMbP0fUINkfcOclv3ht8T9p
	ZI+NSBhL04LfglTFUq+jsQb3vkKOTSbXbp+l6p6W3VOSL4Yi/RII
X-Gm-Gg: ASbGncvUGti43jfc1Z062vvOJflFv7YxEcuumuanMV/vCwLdAvwVtnHf3jBy9adKrAJ
	5fpDxC/b4I5u54vqQBtJHwwQ2IHWNGPj/o5B6pW1TL86ejbDcwFyC0q23REYolEqYUgLTUUfVvD
	xQ+DVbWoEriZsW+XW1qJ0Uz/8Rv1opQ905cR8YEWnVGXx6cSA0p1HVcLSjzCuvw/FobF4r3x98s
	BjzToLjSuxFpSSQCZPzdktIJfIgoK8r7xLP4rx6WBKWX0iiOX0GcylqrGRGTDRWYKrjQamZ5ADQ
	n8sNpXGASn2hGYuDl8IZYjTOHLTM+oASX2CXEpSjYPcbRN+s2CVeSIFVJKTTauVHmSGecG8Sqve
	axg==
X-Google-Smtp-Source: AGHT+IEHyX3rih30b1ivp2/YdoiUvkQ7tiETAKcxWC1uHIaX7eknjSc/IG5d+B4mXjukEeK8ZBu1iA==
X-Received: by 2002:a05:6e02:98c:b0:3d6:d3f7:8827 with SMTP id e9e14a558f8ab-3d6d3f7c864mr38169645ab.22.1743615742512;
        Wed, 02 Apr 2025 10:42:22 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 10:42:22 -0700 (PDT)
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
Subject: [PATCH v3 09/54] dyndbg: refactor param_set_dyndbg_classes and below
Date: Wed,  2 Apr 2025 11:41:11 -0600
Message-ID: <20250402174156.1246171-10-jim.cromie@gmail.com>
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

Refactor callchain below param_set_dyndbg_classes(1) to allow mod-name
specific settings.  Split (1) into upper/lower fns, adding modname
param to lower, and passing NULL in from upper.  Below that, add the
same param to ddebug_apply_class_bitmap(), and pass it thru to
_ddebug_queries(), replacing NULL with the param.

This allows the callchain to update the classmap in just one module,
vs just all as currently done.  While the sysfs param is unlikely to
ever update just one module, the callchain will be used for modprobe
handling, which should update only that just-probed module.

In ddebug_apply_class_bitmap(), also check for actual changes to the
bits before announcing them, to declutter logs.

No functional change.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
v3 s/modnm/mod_name/g
---
 lib/dynamic_debug.c | 65 ++++++++++++++++++++++++++++-----------------
 1 file changed, 40 insertions(+), 25 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index c609ff873224..3ad2e38c9ae2 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -593,9 +593,10 @@ static int ddebug_exec_queries(char *query, const char *modname)
 	return nfound;
 }
 
-/* apply a new bitmap to the sys-knob's current bit-state */
+/* apply a new class-param setting */
 static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
-				     unsigned long *new_bits, unsigned long *old_bits)
+				     unsigned long *new_bits, unsigned long *old_bits,
+				     const char *query_modname)
 {
 #define QUERY_SIZE 128
 	char query[QUERY_SIZE];
@@ -603,7 +604,9 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
 	int matches = 0;
 	int bi, ct;
 
-	v2pr_info("apply: 0x%lx to: 0x%lx\n", *new_bits, *old_bits);
+	if (*new_bits != *old_bits)
+		v2pr_info("apply bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits,
+			  *old_bits, query_modname ?: "'*'");
 
 	for (bi = 0; bi < map->length; bi++) {
 		if (test_bit(bi, new_bits) == test_bit(bi, old_bits))
@@ -612,12 +615,16 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
 		snprintf(query, QUERY_SIZE, "class %s %c%s", map->class_names[bi],
 			 test_bit(bi, new_bits) ? '+' : '-', dcp->flags);
 
-		ct = ddebug_exec_queries(query, NULL);
+		ct = ddebug_exec_queries(query, query_modname);
 		matches += ct;
 
 		v2pr_info("bit_%d: %d matches on class: %s -> 0x%lx\n", bi,
 			  ct, map->class_names[bi], *new_bits);
 	}
+	if (*new_bits != *old_bits)
+		v2pr_info("applied bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits,
+			  *old_bits, query_modname ?: "'*'");
+
 	return matches;
 }
 
@@ -672,7 +679,7 @@ static int param_set_dyndbg_classnames(const char *instr, const struct kernel_pa
 				continue;
 			}
 			curr_bits ^= BIT(cls_id);
-			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, dcp->bits);
+			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, dcp->bits, NULL);
 			*dcp->bits = curr_bits;
 			v2pr_info("%s: changed bit %d:%s\n", KP_NAME(kp), cls_id,
 				  map->class_names[cls_id]);
@@ -682,7 +689,7 @@ static int param_set_dyndbg_classnames(const char *instr, const struct kernel_pa
 			old_bits = CLASSMAP_BITMASK(*dcp->lvl);
 			curr_bits = CLASSMAP_BITMASK(cls_id + (wanted ? 1 : 0 ));
 
-			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, &old_bits);
+			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, &old_bits, NULL);
 			*dcp->lvl = (cls_id + (wanted ? 1 : 0));
 			v2pr_info("%s: changed bit-%d: \"%s\" %lx->%lx\n", KP_NAME(kp), cls_id,
 				  map->class_names[cls_id], old_bits, curr_bits);
@@ -696,18 +703,9 @@ static int param_set_dyndbg_classnames(const char *instr, const struct kernel_pa
 	return 0;
 }
 
-/**
- * param_set_dyndbg_classes - class FOO >control
- * @instr: string echo>d to sysfs, input depends on map_type
- * @kp:    kp->arg has state: bits/lvl, map, map_type
- *
- * Enable/disable prdbgs by their class, as given in the arguments to
- * DECLARE_DYNDBG_CLASSMAP.  For LEVEL map-types, enforce relative
- * levels by bitpos.
- *
- * Returns: 0 or <0 if error.
- */
-int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
+static int param_set_dyndbg_module_classes(const char *instr,
+					   const struct kernel_param *kp,
+					   const char *mod_name)
 {
 	const struct ddebug_class_param *dcp = kp->arg;
 	const struct ddebug_class_map *map = dcp->map;
@@ -744,8 +742,8 @@ int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
 				KP_NAME(kp), inrep, CLASSMAP_BITMASK(map->length));
 			inrep &= CLASSMAP_BITMASK(map->length);
 		}
-		v2pr_info("bits:%lx > %s\n", inrep, KP_NAME(kp));
-		totct += ddebug_apply_class_bitmap(dcp, &inrep, dcp->bits);
+		v2pr_info("bits:0x%lx > %s.%s\n", inrep, mod_name ?: "*", KP_NAME(kp));
+		totct += ddebug_apply_class_bitmap(dcp, &inrep, dcp->bits, mod_name);
 		*dcp->bits = inrep;
 		break;
 	case DD_CLASS_TYPE_LEVEL_NUM:
@@ -758,7 +756,7 @@ int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
 		old_bits = CLASSMAP_BITMASK(*dcp->lvl);
 		new_bits = CLASSMAP_BITMASK(inrep);
 		v2pr_info("lvl:%ld bits:0x%lx > %s\n", inrep, new_bits, KP_NAME(kp));
-		totct += ddebug_apply_class_bitmap(dcp, &new_bits, &old_bits);
+		totct += ddebug_apply_class_bitmap(dcp, &new_bits, &old_bits, mod_name);
 		*dcp->lvl = inrep;
 		break;
 	default:
@@ -767,16 +765,33 @@ int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
 	vpr_info("%s: total matches: %d\n", KP_NAME(kp), totct);
 	return 0;
 }
+
+/**
+ * param_set_dyndbg_classes - classmap kparam setter
+ * @instr: string echo>d to sysfs, input depends on map_type
+ * @kp:    kp->arg has state: bits/lvl, map, map_type
+ *
+ * enable/disable all class'd pr_debugs in the classmap. For LEVEL
+ * map-types, enforce * relative levels by bitpos.
+ *
+ * Returns: 0 or <0 if error.
+ */
+int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
+{
+	return param_set_dyndbg_module_classes(instr, kp, NULL);
+}
 EXPORT_SYMBOL(param_set_dyndbg_classes);
 
 /**
- * param_get_dyndbg_classes - classes reader
+ * param_get_dyndbg_classes - classmap kparam getter
  * @buffer: string description of controlled bits -> classes
  * @kp:     kp->arg has state: bits, map
  *
- * Reads last written state, underlying prdbg state may have been
- * altered by direct >control.  Displays 0x for DISJOINT, 0-N for
- * LEVEL Returns: #chars written or <0 on error
+ * Reads last written state, underlying pr_debug states may have been
+ * altered by direct >control.  Displays 0x for DISJOINT classmap
+ * types, 0-N for LEVEL types.
+ *
+ * Returns: ct of chars written or <0 on error
  */
 int param_get_dyndbg_classes(char *buffer, const struct kernel_param *kp)
 {
-- 
2.49.0

