Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE4F1F3FC8
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743615755; cv=none; b=HkzE7V2NWcv9vzfUobXn4T2qeI3Y1qgvF2/vqASB58+4WZSqHpbP4Zvwiz1cwWKIRqyDvXUlIdQRfEbZMbIcOUXdavQXp0oM5nynmMAK6GIGmgyjzEOBwp0WtM/pGHzpGyYUKCQewP1c3iRmFMpQgsiKmcFTAUsO7/66XuuSyTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743615755; c=relaxed/simple;
	bh=H+/2ithY6j2ZBPMixJhFYAc5PzZpu1sLtiZj7dmdhNk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nQTVB6NnYmWfQse7NNMtf8Kde7W4rHiCIhRZOkA2sdS9ZsNYVETyrDe9Q4YPqJMlsf+EqXNdnP1T7UUbTWHyofzhrWDIajcoOhly9AAHrLujXebrw48XK1PRD2y4pDweRGXzQCPzyGKhNr/wPHPlkOc+kHrnvPspJd1q2gcq+Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N9qYAoFn; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N9qYAoFn"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3d445a722b9so627405ab.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 10:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743615753; x=1744220553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KeKTBGUd8WybmXrxvv7lQQBEsMgzjZkVTc12353wK+U=;
        b=N9qYAoFnAd7NOKfX0MNN8HIu8c4/hziGqCrCDCdJ8B8I90J71/nYW1yG8aklQIkmt3
         BfHxoB0x56EqXuJLo2AmTjmWj+htSzTPvWRSGP4HF2I1z1uzmqZrxgi9j3g7qEZEZSlv
         0FsLtLDfwV5c0s41dwB/wK67YI93cAZjujXkHbq2MO09MNoh7JbTgm0SOun0Sf5QVFub
         g0q+UmvWlGRu0NPbvIFe5rWHsba/jIjNSMs7yLiLOIisVaMEtTLj8HmhqqUw+bxj/AJp
         Qs2ImW9yAAOoeNKEMvYGC36UiHjL3dalY5z9POzG0nqsF6Fpg6P1qWhJVGKao3bw+BUb
         N9FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743615753; x=1744220553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KeKTBGUd8WybmXrxvv7lQQBEsMgzjZkVTc12353wK+U=;
        b=NpikjD2FaqSfpYoLjgu1+dqcFoKQlYZ/ZJiPQ5gRwJgg/X6MVdAyO9YQFBIthb8kFs
         D+GFE9vTsB95JwX0Jmufi0zICFw56EDYofolIXhPJ3FK43mvcH60IcuNUMop8/7AEk/L
         PhRwJHgpmwFCQt8M6S2qKCNTTcBU8jACQlUYVTr7kkm10B6sggEtFy1l/FKBsW8tcu6C
         VGbPSiHJYJuuyHpWbji0MCOEVGBq5k/yHKKRat0oSCSFE1eDp3KtX3Iyhv9tbNLkXdbg
         HK5mAZbyKXWBnrDnBBUEUUuu4+KI1vIIn93jqSHR/62yO1qPf0egqmxQe8XmQ8LBF3Zs
         G74A==
X-Forwarded-Encrypted: i=1; AJvYcCVdj48vLJt9rEu0zDyrtluIUZAaKYo+PkgOR4UKynozLcNbMEH3sOv29TpFH7BjoalfcqNC0hRU4cAW5AA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUN5+yJekKAR1AHRp/Od77xFuJ+KLzvxtjeql7fJ0hahPvRGiF
	ecSrxa5P0yg3z6IkUn2A7bR0iHhGl1zm9eMn4Ox49EoeAGEjLmGw
X-Gm-Gg: ASbGncvTxEy0ZFBSAfKLrPUzL+2JdTerGjr9QkbxKktl1ph0/TV5RXQNuixNx6YikTr
	Y5nDCG/fLXMiZJqwN6s9lMUMjIfG2P3Z3jTxNlce8m8N6F9zkl3lRQp61780czjjOl1rL1I0CW7
	c2n37pfCTIN0KD0SIAMiYppc2updWCN8sUOVLyx24FabVm2DgoKDDYwYEJAHwBIGkAZb65cExnI
	HcFIUyoJ/7snvL43ny87W4XDWLlOtEg685ddRGd1Y/wW9F22yLMZivLfqN+tXNzSKdweSc1I663
	zW070swK48Tu3dprNEU9H8ujt5baKestNVtXXpS4Zzq/+vau9KFUFvuzhr2lwjF9gUkoeTrZjGR
	hxg==
X-Google-Smtp-Source: AGHT+IFaC1YYyq2aq/rDOr7nftMb5mtnPTvXusfBx4cINuze69wt5nZYDtolFZPQAPv6upZ4KaK1zw==
X-Received: by 2002:a05:6e02:3c82:b0:3cf:c7d3:e4b with SMTP id e9e14a558f8ab-3d5e0a09a11mr204507425ab.21.1743615753003;
        Wed, 02 Apr 2025 10:42:33 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 10:42:32 -0700 (PDT)
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
Subject: [PATCH v3 19/54] dyndbg: detect class_id reservation conflicts
Date: Wed,  2 Apr 2025 11:41:21 -0600
Message-ID: <20250402174156.1246171-20-jim.cromie@gmail.com>
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

If a module _DEFINEs + _USEs 2 or more classmaps, it must devise them
to share the per-module 0..62 class-id space; ie their respective
base,+length reservations cannot overlap.

To detect conflicts at modprobe, add ddebug_class_range_overlap(),
call it from ddebug_add_module(), and WARN and return -EINVAL when
they're detected.

test_dynamic_debug.c:

If built with -DFORCE_CLASSID_CONFLICT, the test-modules get 2 bad
DYNDBG_CLASS_DEFINE declarations, into parent and the _submod.  These
conflict with one of the good ones in the parent (D2_CORE..etc),
causing the modprobe(s) to warn

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
---
 lib/dynamic_debug.c      | 29 +++++++++++++++++++++++++++++
 lib/test_dynamic_debug.c |  8 ++++++++
 2 files changed, 37 insertions(+)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 53e261dbf81e..56b503af0b31 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1267,6 +1267,22 @@ static void ddebug_apply_class_users(const struct _ddebug_info *di)
 	(_dst)->info._vec.len = nc;					\
 })
 
+static int __maybe_unused
+ddebug_class_range_overlap(struct _ddebug_class_map *cm,
+			   u64 *reserved_ids)
+{
+	u64 range = (((1ULL << cm->length) - 1) << cm->base);
+
+	if (range & *reserved_ids) {
+		pr_err("[%d..%d] on %s conflicts with %llx\n", cm->base,
+		       cm->base + cm->length - 1, cm->class_names[0],
+		       *reserved_ids);
+		return -EINVAL;
+	}
+	*reserved_ids |= range;
+	return 0;
+}
+
 /*
  * Allocate a new ddebug_table for the given module
  * and add it to the global list.
@@ -1276,6 +1292,7 @@ static int ddebug_add_module(struct _ddebug_info *di)
 	struct ddebug_table *dt;
 	struct _ddebug_class_map *cm;
 	struct _ddebug_class_user *cli;
+	u64 reserved_ids = 0;
 	int i;
 
 	if (!di->descs.len)
@@ -1301,6 +1318,13 @@ static int ddebug_add_module(struct _ddebug_info *di)
 	dd_mark_vector_subrange(i, dt, cm, di, maps);
 	dd_mark_vector_subrange(i, dt, cli, di, users);
 
+	for_subvec(i, cm, &dt->info, maps)
+		if (ddebug_class_range_overlap(cm, &reserved_ids))
+			goto cleanup;
+	for_subvec(i, cli, &dt->info, users)
+		if (ddebug_class_range_overlap(cli->map, &reserved_ids))
+			goto cleanup;
+
 	if (dt->info.maps.len)
 		ddebug_apply_class_maps(&dt->info);
 
@@ -1313,6 +1337,11 @@ static int ddebug_add_module(struct _ddebug_info *di)
 
 	vpr_info("%3u debug prints in module %s\n", di->descs.len, di->mod_name);
 	return 0;
+cleanup:
+	WARN_ONCE("dyndbg multi-classmap conflict in %s\n", di->mod_name);
+	kfree(dt);
+	return -EINVAL;
+
 }
 
 /* helper for ddebug_dyndbg_(boot|module)_param_cb */
diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index 1070107f74f1..e42916b08fd4 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -128,6 +128,14 @@ DYNAMIC_DEBUG_CLASSMAP_DEFINE(map_level_num, DD_CLASS_TYPE_LEVEL_NUM,
 DYNAMIC_DEBUG_CLASSMAP_PARAM(disjoint_bits, p);
 DYNAMIC_DEBUG_CLASSMAP_PARAM(level_num, p);
 
+#ifdef FORCE_CLASSID_CONFLICT
+/*
+ * Enable with -Dflag on compile to test overlapping class-id range
+ * detection.  This should warn on modprobes.
+ */
+DYNDBG_CLASSMAP_DEFINE(classid_range_conflict, 0, D2_CORE + 1, "D3_CORE");
+#endif
+
 #else /* TEST_DYNAMIC_DEBUG_SUBMOD */
 
 /*
-- 
2.49.0

