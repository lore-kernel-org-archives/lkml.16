Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969A11FF5F9
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743615779; cv=none; b=WNyWdxvGNSKHKvqBstcAI9ZbbxsXbanaXrWbkZvWj66hOMxPX0TDkb78CRs274NAxjw1t/eAGZMpuX2O5H5NeeiHQjc/CMWHHUcQlLnlTG7/IPtjgrj1B0uIkwOpBD5m8J/FMUBTdZ46zS913Gxq5TIF1j+keU+g38uG3L7kgkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743615779; c=relaxed/simple;
	bh=yjw36Byqp3KNEwgeFnOIp0bP1trgvdUfaThbZm1PYZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ly+layNEeQS6weqwBQL9gk5Vnx2UlFb7PXgHV5qzieKmLj4h0tNocxtfS1moSXDmMMeVZjQjEqvX8JScDQWjRDvnrdu58+CBW7WEGv92KbwZPpW9V1yoOJghGyB8oFK1KdChjE8Gp/P+FdvR9p9HniGPsh43TnAvoCtwQRUH6/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z3yuLIka; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z3yuLIka"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3d45503af24so751855ab.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 10:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743615776; x=1744220576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hj7/OLtj1fDw6OZs5+/lD0ex0mbib1oiHMYEMqtQMQs=;
        b=Z3yuLIka7zcwBBeX5aazanVrXAbb7Ia1GTVNsaWe9eYTmkPooU0oSzPFUkquwlO4v/
         xO49qyWeuga1lqYuSLsKLdDaKYCbMDccfI1HljC3bnQGWU2f76fbv3FTBT3LFXoscm3I
         v0Zm05eWpGhNy6rOnE1pNsOwaMmgQEsyTRXlv98sCXHxI5GMt4pElm6C4bDMu901imyA
         eLQ53QWqwDbw1dbDVqY2aoIpJ7XoVtXH5VmjPp28/dXDBiWEPiylvieOQA0EQul/yEDq
         wazoV1K7UIgEdtAEwBmm6dy84bzHLAMk5zx/HjtWz6cQMLo9i8f8Y/a0212JohB13loL
         EaKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743615776; x=1744220576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hj7/OLtj1fDw6OZs5+/lD0ex0mbib1oiHMYEMqtQMQs=;
        b=YxUk1YKoCZOwQxtfrmFUEASkOfoxIl/ISPv/tTVPe4TtsqaVYUHG5j3JskpkxoRH9x
         r3LiNGmxFYua9KEwhrefzbPxzcwDQAHrqwMI/xaBmth/UoO38+Gbx9kT5pwXm0PogkSA
         o3VdgCzhomLcQkGwe0Q3pHxkoAs5xQAtu3D0C525ADQbkiKZUKfWe4EUxNdey0mmVuej
         kPXxw6YIoOvcrDmL0gU55wMVTnnXmyK9azL99V3AQ6KjqUEwT04MoyV1bsaKf83UTjNO
         OIi+2XdXuef9rK9N3Gi1Ns9Qe5QjGXf0vm2xKE6a/eHvpfKuWpIpQUIjjhAL+nlQilDT
         drUw==
X-Forwarded-Encrypted: i=1; AJvYcCXxWWhS472rntMt4tPjOym0NnX8F98EDH0f7ZIpgCHdrU6pRlch4+cICscOW+Q6vmTj2/4EoJYc5xWxXMM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzivyo5YR9aWFKM/ifGiV4ago9rZyW9EiXMgb4diCwsjkrR4qMT
	1Or2fv+OMgK/+tNud3suTLaB9YT8MZnQXCJAERIkzvu9NfUUStV1sbPq9dUz
X-Gm-Gg: ASbGncsTky2HE74acEYoynmt491ArmDZYibSzsLsV0aKfo5M9gLLUIylY33PjG/Wya5
	37WaFDKPgcXWK83wlFGwtWNWF/Kqf+KRHxYpKgqxqomLGu69RnWd/ailzOHMnP37zn4JPgd/gjE
	cSh2VjyfqHYpbE5OmuttGlJNhisDaxIEzUhXFOWLjGsozG/jbHBN8mh1wYjuGnlI8RM6lMqS9oV
	n3qFt6rc7gG/k3l3qk+AiI1IzfO9/ePe+KA79FdnLmJnC5pwXjiMZoVoTk5w4Od6huUiOSh7OYD
	SdvfKhzWwxqV+K70OBF95D5yyJsxY3T4u5OiYBsKn7St7dB1Z0yY5HgUtU0Aqs5K1Q0z/fD6kqI
	2hQ==
X-Google-Smtp-Source: AGHT+IHkTdxrnWHVM3s8kzejMvdVLgstsz/xh978QvWvn7zXHfoIkU/4gG/Iemvf+jXbraofO9mW5w==
X-Received: by 2002:a05:6e02:2703:b0:3d3:d28e:eae9 with SMTP id e9e14a558f8ab-3d6ca5d16efmr104731125ab.7.1743615765249;
        Wed, 02 Apr 2025 10:42:45 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 10:42:44 -0700 (PDT)
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
Subject: [PATCH v3 31/54] drm-dyndbg: adapt drm core to use dyndbg classmaps-v2
Date: Wed,  2 Apr 2025 11:41:33 -0600
Message-ID: <20250402174156.1246171-32-jim.cromie@gmail.com>
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

dyndbg's CLASSMAP-v1 api was broken; DECLARE_DYNDBG_CLASSMAP tried to
do too much.  Its replaced by DRM_CLASSMAP_DEFINE, which creates &
EXPORTs a classmap (in DRM core), and DRM_CLASSMAP_USE which refers to
the classmap defined elsewhere.

The drivers still use DECLARE_DYNDBG_CLASSMAP for now, so they still
redundantly re-declare the classmap, but we can convert the drivers
later to DYNDBG_CLASSMAP_USE

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
this ignores a checkpatch
 WARNING: Argument 'name' is not used in function-like macro
 #70: FILE: include/drm/drm_print.h:148:
 +#define DRM_CLASSMAP_USE(name)

the macro is empty, and correct. only 1 arg is expected.
---
 drivers/gpu/drm/drm_print.c | 25 +++++++++++++------------
 include/drm/drm_print.h     |  8 ++++++++
 2 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index 79517bd4418f..a3b70d104afa 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -55,18 +55,19 @@ MODULE_PARM_DESC(debug, "Enable debug output, where each bit enables a debug cat
 #if !defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
 module_param_named(debug, __drm_debug, ulong, 0600);
 #else
-/* classnames must match vals of enum drm_debug_category */
-DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
-			"DRM_UT_CORE",
-			"DRM_UT_DRIVER",
-			"DRM_UT_KMS",
-			"DRM_UT_PRIME",
-			"DRM_UT_ATOMIC",
-			"DRM_UT_VBL",
-			"DRM_UT_STATE",
-			"DRM_UT_LEASE",
-			"DRM_UT_DP",
-			"DRM_UT_DRMRES");
+/* classnames must match value-symbols of enum drm_debug_category */
+DRM_CLASSMAP_DEFINE(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS,
+		    DRM_UT_CORE,
+		    "DRM_UT_CORE",
+		    "DRM_UT_DRIVER",
+		    "DRM_UT_KMS",
+		    "DRM_UT_PRIME",
+		    "DRM_UT_ATOMIC",
+		    "DRM_UT_VBL",
+		    "DRM_UT_STATE",
+		    "DRM_UT_LEASE",
+		    "DRM_UT_DP",
+		    "DRM_UT_DRMRES");
 
 static struct ddebug_class_param drm_debug_bitmap = {
 	.bits = &__drm_debug,
diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 9732f514566d..e86ebb716b4c 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -141,6 +141,14 @@ enum drm_debug_category {
 	DRM_UT_DRMRES
 };
 
+#ifdef CONFIG_DRM_USE_DYNAMIC_DEBUG
+#define DRM_CLASSMAP_DEFINE(...)    DYNAMIC_DEBUG_CLASSMAP_DEFINE(__VA_ARGS__)
+#define DRM_CLASSMAP_USE(name)      DYNAMIC_DEBUG_CLASSMAP_USE(name)
+#else
+#define DRM_CLASSMAP_DEFINE(...)
+#define DRM_CLASSMAP_USE(name)
+#endif
+
 static inline bool drm_debug_enabled_raw(enum drm_debug_category category)
 {
 	return unlikely(__drm_debug & BIT(category));
-- 
2.49.0

