Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1624D1F4616;
	Wed,  2 Apr 2025 17:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743615759; cv=none; b=Ih2rqe1qkVoS3rE1aMK85pTMIDxN8SzYRsSAoyOAxuTYcAqALSv0h9O6nHRamxtaIx0SA0+HtpwkY8+bR39awhuX56Omt1z0Mo5vbY5zMl9+46bU42kEOmuR11gp06f2JEy0Sp/PUkdzM9UAczC47vt0gZFpDkoZXrGAkHijksU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743615759; c=relaxed/simple;
	bh=G0DkUw2t0sb7ZGmbX1UWQ4E666F0Fx2idAvGhbKi5Eo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BMx66c037/4FgNvMVT+5fJZqOULJ1/NXzrK8tWQ08zW+towS/qnJvj52ewgx9GyIiV0FdsrytTAVAcCe1CVCJuf+3focMjY+GxSCIqNN5TvjTSidxA+Isse+BqOlnjgBeZnmtm4SEjNr7C/eTPw2s/UikAFqNv2eoGUEXrfnu3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZkJPzNV1; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZkJPzNV1"
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-854a682d2b6so2272739f.0;
        Wed, 02 Apr 2025 10:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743615756; x=1744220556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UQGLHVjI88a07yAcVp1fF8AgBymHOsN5Q+DW04b0Y4E=;
        b=ZkJPzNV1ZvkJbaw9W1rkCTnQDVolQLzA1zaIVCbmKkVelIMGYrpEBiw5ZGHxSd1zCT
         O8n0RVVj58b3S8XpWllz9OeA8avpPrJ5X6N92ubMEV5Vrw+Cjl+Vs92KvjGdnivI5cUa
         rfEm/+zz+gAArUA7aBijc3GGHaHTGg5chwuANrmBafkBRajrz2Uujj6y9yjA2viDGXFA
         WNNpKKSMTcvEnVsvxqIZtasptKhYbut83yRZAHYivHw0JQCp4WLdhCw6A7hSCcUHO5Ra
         Jo55dRaK5Vm327UUYn3l16VYx89Dh5LgyEwcOtyvIRAC5EyMh41FbZr+O7qT+efUBH38
         3Y7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743615756; x=1744220556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UQGLHVjI88a07yAcVp1fF8AgBymHOsN5Q+DW04b0Y4E=;
        b=VzvDqEVE99ilwcxXbSmnRRDhmPcUB6tSt1PmW3DPYW8ZwaGBnxz4A0qr7rB0tR/R55
         2e2WXcZK5nG+sjdSjtFgtMPgsdMXkdW8WfPoAC9y5gXVCsDMiNlG+sxK/3XWDi0bODoS
         lvvNvb/fsbNWm3PVhNznKpFHPIsfmSYYSv52VdghipXpobDNKefibJM+WfIM0IUoEXiI
         IkQwQU4Vfdb9r96E005qoFXqDuzmks+NTMI/J+jN/MeA0SionczHObGYiGP3lZYvfnRG
         b32SVXew3DfguId7zjUuThSFfZrGeG4aYLiYqcWnAiHu4QDXuxU4UxASoUqRhPKXfIyq
         9Tgw==
X-Forwarded-Encrypted: i=1; AJvYcCV47p7Q++Gy2YuPCH8tc1btOYL5Y0ati/YeSIsPFbXS2ajQz43bH/iBg0io9o0ZiA7EhkxUrbylXh0=@vger.kernel.org, AJvYcCXbi9pFusFifLW+iiHigkrT0Ic8TAjRGkQngae4vMIgdk18Yvpz9Ycjl7xzp6yK9qFRvyszTXJgCZOB5Zpp@vger.kernel.org
X-Gm-Message-State: AOJu0YyqGZpSEhjYMHlwZCGIljtJbc1dH9Xq3BshzsM3/VIU5meb0Sa2
	N021mjSyCSwCT/omtVazKP/NPAwf15wq3QZGPqf4MBA5ru0oCsZ/
X-Gm-Gg: ASbGnctkGhBQgif1SlBrrHAara3ZG2gbr6soWnVxXALNG9zh7hAuTOwY0ONpQ6szckl
	NHCO8ZUA1IPMWUKU3OtTDKxUC+ajTnvL+f8seb8FzIJ31h02RUhbpI73+f9UIEErDJmAzJfHSn0
	m7HvXVMfsKw5pI5fil0g1o/5PLrrqkmSgCRyA1HZ5Yc/TH76eUv3JZoq4BFO6BnxpGAoD7v1E/7
	nOhiJJFCh3l/cTFXC9QaoeAJ4ycmbtr9CmotYUZnmYYoTooZNmWTNeWAR3PKHOwIgXBfiD/f4LT
	TTjSSqBnWljjvm6/4MJsV8CDaBQ3N5wX9saFOG0gG1jdYz3YXpQ6eyydM2ZxyVgyB/ydRIClke3
	6cw==
X-Google-Smtp-Source: AGHT+IGg2nO72mRBabW+fR6wte152C7ysM+DnzAttS5d7C7TncYYuHpSkTrIvw9MuJ6wmrNNEvVwNQ==
X-Received: by 2002:a05:6e02:1f0c:b0:3d4:e6:d872 with SMTP id e9e14a558f8ab-3d5e0908ce4mr198618635ab.9.1743615756093;
        Wed, 02 Apr 2025 10:42:36 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 10:42:35 -0700 (PDT)
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
	Jim Cromie <jim.cromie@gmail.com>,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 22/54] dyndbg-API: promote DYNAMIC_DEBUG_CLASSMAP_PARAM to API
Date: Wed,  2 Apr 2025 11:41:24 -0600
Message-ID: <20250402174156.1246171-23-jim.cromie@gmail.com>
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

move the DYNAMIC_DEBUG_CLASSMAP_PARAM macro from test-dynamic-debug.c into
the header, and refine it, by distinguishing the 2 use cases:

1.DYNAMIC_DEBUG_CLASSMAP_PARAM_REF
    for DRM, to pass in extern __drm_debug by name.
    dyndbg keeps bits in it, so drm can still use it as before

2.DYNAMIC_DEBUG_CLASSMAP_PARAM
    new user (test_dynamic_debug) doesn't need to share state,
    decls a static long unsigned int to store the bitvec.

__DYNAMIC_DEBUG_CLASSMAP_PARAM
   bottom layer - allocate,init a ddebug-class-param, module-param-cb.

Modify ddebug_sync_classbits() argtype deref inside the fn, to give
access to all kp members.

Also clean up and improve comments in test-code, and add
MODULE_DESCRIPTIONs.

cc: linux-doc@vger.kernel.org
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---

-v9
 - fixup drm-print.h  add PARAM_REF forwarding macros
   with DYNAMIC_DEBUG_CLASSMAP_PARAM_REF in the API, add DRM_ variant
---
 include/linux/dynamic_debug.h   | 38 +++++++++++++++++++++
 lib/dynamic_debug.c             | 60 ++++++++++++++++++++++-----------
 lib/test_dynamic_debug.c        | 47 ++++++++++----------------
 lib/test_dynamic_debug_submod.c |  9 ++++-
 4 files changed, 104 insertions(+), 50 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 4941ef2adb46..ce221a702f84 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -211,6 +211,44 @@ struct _ddebug_class_param {
 	const struct _ddebug_class_map *map;
 };
 
+/**
+ * DYNAMIC_DEBUG_CLASSMAP_PARAM - control a ddebug-classmap from a sys-param
+ * @_name:  sysfs node name
+ * @_var:   name of the classmap var defining the controlled classes/bits
+ * @_flags: flags to be toggled, typically just 'p'
+ *
+ * Creates a sysfs-param to control the classes defined by the
+ * exported classmap, with bits 0..N-1 mapped to the classes named.
+ * This version keeps class-state in a private long int.
+ */
+#define DYNAMIC_DEBUG_CLASSMAP_PARAM(_name, _var, _flags)		\
+	static unsigned long _name##_bvec;				\
+	__DYNAMIC_DEBUG_CLASSMAP_PARAM(_name, _name##_bvec, _var, _flags)
+
+/**
+ * DYNAMIC_DEBUG_CLASSMAP_PARAM_REF - wrap a classmap with a controlling sys-param
+ * @_name:  sysfs node name
+ * @_bits:  name of the module's unsigned long bit-vector, ex: __drm_debug
+ * @_var:   name of the (exported) classmap var defining the classes/bits
+ * @_flags: flags to be toggled, typically just 'p'
+ *
+ * Creates a sysfs-param to control the classes defined by the
+ * exported clasmap, with bits 0..N-1 mapped to the classes named.
+ * This version keeps class-state in user @_bits.  This lets drm check
+ * __drm_debug elsewhere too.
+ */
+#define DYNAMIC_DEBUG_CLASSMAP_PARAM_REF(_name, _bits, _var, _flags)	\
+	__DYNAMIC_DEBUG_CLASSMAP_PARAM(_name, _bits, _var, _flags)
+
+#define __DYNAMIC_DEBUG_CLASSMAP_PARAM(_name, _bits, _var, _flags)	\
+	static struct _ddebug_class_param _name##_##_flags = {		\
+		.bits = &(_bits),					\
+		.flags = #_flags,					\
+		.map = &(_var),						\
+	};								\
+	module_param_cb(_name, &param_ops_dyndbg_classes,		\
+			&_name##_##_flags, 0600)
+
 /*
  * pr_debug() and friends are globally enabled or modules have selectively
  * enabled them.
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 56b503af0b31..0d603caadef8 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -666,6 +666,30 @@ static int ddebug_apply_class_bitmap(const struct _ddebug_class_param *dcp,
 
 #define CLASSMAP_BITMASK(width) ((1UL << (width)) - 1)
 
+static void ddebug_class_param_clamp_input(unsigned long *inrep, const struct kernel_param *kp)
+{
+	const struct _ddebug_class_param *dcp = kp->arg;
+	const struct _ddebug_class_map *map = dcp->map;
+
+	switch (map->map_type) {
+	case DD_CLASS_TYPE_DISJOINT_BITS:
+		/* expect bits. mask and warn if too many */
+		if (*inrep & ~CLASSMAP_BITMASK(map->length)) {
+			pr_warn("%s: input: 0x%lx exceeds mask: 0x%lx, masking\n",
+				KP_NAME(kp), *inrep, CLASSMAP_BITMASK(map->length));
+			*inrep &= CLASSMAP_BITMASK(map->length);
+		}
+		break;
+	case DD_CLASS_TYPE_LEVEL_NUM:
+		/* input is bitpos, of highest verbosity to be enabled */
+		if (*inrep > map->length) {
+			pr_warn("%s: level:%ld exceeds max:%d, clamping\n",
+				KP_NAME(kp), *inrep, map->length);
+			*inrep = map->length;
+		}
+		break;
+	}
+}
 static int param_set_dyndbg_module_classes(const char *instr,
 					   const struct kernel_param *kp,
 					   const char *mod_name)
@@ -684,26 +708,15 @@ static int param_set_dyndbg_module_classes(const char *instr,
 		pr_err("expecting numeric input, not: %s > %s\n", instr, KP_NAME(kp));
 		return -EINVAL;
 	}
+	ddebug_class_param_clamp_input(&inrep, kp);
 
 	switch (map->map_type) {
 	case DD_CLASS_TYPE_DISJOINT_BITS:
-		/* expect bits. mask and warn if too many */
-		if (inrep & ~CLASSMAP_BITMASK(map->length)) {
-			pr_warn("%s: input: 0x%lx exceeds mask: 0x%lx, masking\n",
-				KP_NAME(kp), inrep, CLASSMAP_BITMASK(map->length));
-			inrep &= CLASSMAP_BITMASK(map->length);
-		}
 		v2pr_info("bits:0x%lx > %s.%s\n", inrep, mod_name ?: "*", KP_NAME(kp));
 		totct += ddebug_apply_class_bitmap(dcp, &inrep, *dcp->bits, mod_name);
 		*dcp->bits = inrep;
 		break;
 	case DD_CLASS_TYPE_LEVEL_NUM:
-		/* input is bitpos, of highest verbosity to be enabled */
-		if (inrep > map->length) {
-			pr_warn("%s: level:%ld exceeds max:%d, clamping\n",
-				KP_NAME(kp), inrep, map->length);
-			inrep = map->length;
-		}
 		old_bits = CLASSMAP_BITMASK(*dcp->lvl);
 		new_bits = CLASSMAP_BITMASK(inrep);
 		v2pr_info("lvl:%ld bits:0x%lx > %s\n", inrep, new_bits, KP_NAME(kp));
@@ -1171,15 +1184,24 @@ static const struct proc_ops proc_fops = {
 static void ddebug_sync_classbits(const struct kernel_param *kp, const char *modname)
 {
 	const struct _ddebug_class_param *dcp = kp->arg;
+	unsigned long new_bits;
 
-	/* clamp initial bitvec, mask off hi-bits */
-	if (*dcp->bits & ~CLASSMAP_BITMASK(dcp->map->length)) {
-		*dcp->bits &= CLASSMAP_BITMASK(dcp->map->length);
-		v2pr_info("preset classbits: %lx\n", *dcp->bits);
+	ddebug_class_param_clamp_input(dcp->bits, kp);
+
+	switch (dcp->map->map_type) {
+	case DD_CLASS_TYPE_DISJOINT_BITS:
+		v2pr_info("  %s: classbits: 0x%lx\n", KP_NAME(kp), *dcp->bits);
+		ddebug_apply_class_bitmap(dcp, dcp->bits, 0UL, modname);
+		break;
+	case DD_CLASS_TYPE_LEVEL_NUM:
+		new_bits = CLASSMAP_BITMASK(*dcp->lvl);
+		v2pr_info("  %s: lvl:%ld bits:0x%lx\n", KP_NAME(kp), *dcp->lvl, new_bits);
+		ddebug_apply_class_bitmap(dcp, &new_bits, 0UL, modname);
+		break;
+	default:
+		pr_err("bad map type %d\n", dcp->map->map_type);
+		return;
 	}
-	/* force class'd prdbgs (in USEr module) to match (DEFINEr module) class-param */
-	ddebug_apply_class_bitmap(dcp, dcp->bits, ~0, modname);
-	ddebug_apply_class_bitmap(dcp, dcp->bits, 0, modname);
 }
 
 static void ddebug_match_apply_kparam(const struct kernel_param *kp,
diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index 4a3d2612ef60..78cf5420770a 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Kernel module for testing dynamic_debug
+ * Kernel module to test/demonstrate dynamic_debug features,
+ * particularly classmaps and their support for subsystems like DRM.
  *
  * Authors:
  *      Jim Cromie	<jim.cromie@gmail.com>
@@ -62,24 +63,6 @@ module_param_cb(do_prints, &param_ops_do_prints, NULL, 0600);
 
 #define CLASSMAP_BITMASK(width, base) (((1UL << (width)) - 1) << (base))
 
-/* sysfs param wrapper, proto-API */
-#define DYNAMIC_DEBUG_CLASSMAP_PARAM_(_model, _flags, _init)		\
-	static unsigned long bits_##_model = _init;			\
-	static struct _ddebug_class_param _flags##_##_model = {		\
-		.bits = &bits_##_model,					\
-		.flags = #_flags,					\
-		.map = &map_##_model,					\
-	};								\
-	module_param_cb(_flags##_##_model, &param_ops_dyndbg_classes,	\
-			&_flags##_##_model, 0600)
-#ifdef DEBUG
-#define DYNAMIC_DEBUG_CLASSMAP_PARAM(_model, _flags)		\
-	DYNAMIC_DEBUG_CLASSMAP_PARAM_(_model, _flags, ~0)
-#else
-#define DYNAMIC_DEBUG_CLASSMAP_PARAM(_model, _flags)		\
-	DYNAMIC_DEBUG_CLASSMAP_PARAM_(_model, _flags, 0)
-#endif
-
 /*
  * Demonstrate/test DISJOINT & LEVEL typed classmaps with a sys-param.
  *
@@ -110,12 +93,15 @@ enum cat_disjoint_bits {
 /* numeric verbosity, V2 > V1 related.  V0 is > D2_DRM_RES */
 enum cat_level_num { V0 = 16, V1, V2, V3, V4, V5, V6, V7 };
 
-/* recapitulate DRM's multi-classmap setup */
+/*
+ * use/demonstrate multi-module-group classmaps, as for DRM
+ */
 #if !defined(TEST_DYNAMIC_DEBUG_SUBMOD)
 /*
- * In single user, or parent / coordinator (drm.ko) modules, define
- * classmaps on the client enums above, and then declares the PARAMS
- * ref'g the classmaps.  Each is exported.
+ * For module-groups of 1+, define classmaps with names (stringified
+ * enum-symbols) copied from above. 1-to-1 mapping is recommended.
+ * The classmap is exported, so that other modules in the group can
+ * link to it and control their prdbgs.
  */
 DYNAMIC_DEBUG_CLASSMAP_DEFINE(map_disjoint_bits, DD_CLASS_TYPE_DISJOINT_BITS,
 			      D2_CORE,
@@ -134,11 +120,13 @@ DYNAMIC_DEBUG_CLASSMAP_DEFINE(map_level_num, DD_CLASS_TYPE_LEVEL_NUM,
 			      V0, "V0", "V1", "V2", "V3", "V4", "V5", "V6", "V7");
 
 /*
- * now add the sysfs-params
+ * for use-cases that want it, provide a sysfs-param to set the
+ * classes in the classmap.  It is at this interface where the
+ * "v3>v2" property is applied to DD_CLASS_TYPE_LEVEL_NUM inputs.
  */
 
-DYNAMIC_DEBUG_CLASSMAP_PARAM(disjoint_bits, p);
-DYNAMIC_DEBUG_CLASSMAP_PARAM(level_num, p);
+DYNAMIC_DEBUG_CLASSMAP_PARAM(p_disjoint_bits,	map_disjoint_bits, p);
+DYNAMIC_DEBUG_CLASSMAP_PARAM(p_level_num,	map_level_num, p);
 
 #ifdef FORCE_CLASSID_CONFLICT
 /*
@@ -149,12 +137,10 @@ DYNDBG_CLASSMAP_DEFINE(classid_range_conflict, 0, D2_CORE + 1, "D3_CORE");
 #endif
 
 #else /* TEST_DYNAMIC_DEBUG_SUBMOD */
-
 /*
- * in submod/drm-drivers, use the classmaps defined in top/parent
- * module above.
+ * the +1 members of a multi-module group refer to the classmap
+ * DEFINEd (and exported) above.
  */
-
 DYNAMIC_DEBUG_CLASSMAP_USE(map_disjoint_bits);
 DYNAMIC_DEBUG_CLASSMAP_USE(map_level_num);
 
@@ -229,6 +215,7 @@ static void __exit test_dynamic_debug_exit(void)
 module_init(test_dynamic_debug_init);
 module_exit(test_dynamic_debug_exit);
 
+MODULE_DESCRIPTION("test/demonstrate dynamic-debug features");
 MODULE_AUTHOR("Jim Cromie <jim.cromie@gmail.com>");
 MODULE_DESCRIPTION("Kernel module for testing dynamic_debug");
 MODULE_LICENSE("GPL");
diff --git a/lib/test_dynamic_debug_submod.c b/lib/test_dynamic_debug_submod.c
index 672aabf40160..3adf3925fb86 100644
--- a/lib/test_dynamic_debug_submod.c
+++ b/lib/test_dynamic_debug_submod.c
@@ -1,6 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Kernel module for testing dynamic_debug
+ * Kernel module to test/demonstrate dynamic_debug features,
+ * particularly classmaps and their support for subsystems, like DRM,
+ * which defines its drm_debug classmap in drm module, and uses it in
+ * helpers & drivers.
  *
  * Authors:
  *      Jim Cromie	<jim.cromie@gmail.com>
@@ -12,3 +15,7 @@
  */
 #define TEST_DYNAMIC_DEBUG_SUBMOD
 #include "test_dynamic_debug.c"
+
+MODULE_DESCRIPTION("test/demonstrate dynamic-debug subsystem support");
+MODULE_AUTHOR("Jim Cromie <jim.cromie@gmail.com>");
+MODULE_LICENSE("GPL");
-- 
2.49.0

