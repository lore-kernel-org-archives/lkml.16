Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58E61FC7D1
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743615771; cv=none; b=O8j9eutkgW4Gk5tCXvRuNmlEEGnJDs3LUR2KuvFJ1wNX1Q/2bCPz/NAckKACmsjLFR7cebWjy92VdSnR1cmUhzeAoePJRIPoQjR8bae66BpuQJYDqXuiSCn/3nws1hcMaZrJSK0YmKkbCUsQZLKZ6L5b3IHT+jPINlZGXo5IIwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743615771; c=relaxed/simple;
	bh=eTgXCMSuJATKpfTpuzAijyJ89AI9F1a/QFA5ixRxZRU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VqBSTqLoTRnbTyCsFX3HZbO5mPhx21WfDrxy8ZtVDsqB9u1sC9DarhujdovTHg/phfC6dgGJt11XdcpKIS7bSkfr08lgBpRcfPeavxI/HE8WjYL5OSORCaVkCcvrsIuvzQmb1D2HRNrmDkEepgkKuAGZKopJVWGuStU0YZMwfFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NOs4zeYA; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NOs4zeYA"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3ce87d31480so493285ab.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 10:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743615769; x=1744220569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UexT083kjVXSMtfjeXG2YLxPBGob4DA2kkNTE3v1uqE=;
        b=NOs4zeYACnKuLMdQZ24uRSyThSCCQnABjECCt79esBQ4+kjcSHuX0tc0dP5RhdNpdr
         nSAtSHEy+HAfarcjAjI0a+OSHd3TrwanUCwoPi35ydxNspFvPoFvxls9oyBb1XieRr3J
         E9W+03PdfMOeHUGDmFo85kmJTMBh/elJDoj3dt92BGOfnfRskFOxerpzWok5WSJNiyfT
         wA7cBuBJslvJbNlDSXOLG+sMdnnf9VBliEqb95dF3FLbSgJJ6nUXIDNKGahBghsl+iGD
         0TLG45aM7UJsjn30z9UFF4m4PKX1cjCclEktoHTR9wMDbo2exfAdhDKAIzsajKDZZ3k0
         GV3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743615769; x=1744220569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UexT083kjVXSMtfjeXG2YLxPBGob4DA2kkNTE3v1uqE=;
        b=v30s1cSC3cQ3Q6zeKRny6kORpG0xn0QULoorDSTo38TGz4hMGZ1kbyh/+U/8xbMFEI
         d9qHYMouiwa5ZBwUotBlGR+F2vc5NmNqeFGpbR4wHTBSzMYyVY+PlkDCodTpmQMNJVBv
         hOrvEqsGlOF+x1flkXpycnFkuKYyEUGC4s+rxxFF73uJR7sDoyJZGL8xmOwWIlWJuZgY
         y/5UCi8HN2wJfBm3/KrNeSyHYRhYlMFF8mdRpyWRJaZTC8X3i4PCDUxiJw/fSm7Jpoef
         Zz3z8jk75awqV1VWkwtVPTRkowdQLwLJFrGU0g8SkYdOKkZf+IYBPS+fvellXI5Ct4pu
         zgiw==
X-Forwarded-Encrypted: i=1; AJvYcCUmweFvgUfbqwWSL3nQLFduHxwYwIecunwSYocft/2fTRn88sisD/lwRjpVqy0T1lJsE2TW1SCeOfNn0XU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgZIqtUtOWWUDl2DnMx1fvu3RSEAlFE6LZXkFuP7SauZa+dvp2
	oOvr4sdVEv/n+hltiqRo2+3uIduGNqlfA7CjgxO/8HbHyigPz8lg
X-Gm-Gg: ASbGnctg6TXQhEqY5bRc/Z9G/j1XmbMggBV5ZdrisnCJOp721RUFIGhUFSc1OBCbPYu
	jiQi9KOf2Bm3ZqP6QWKY8tX90AVI/LOe5+CaOzimsoiSG0YtscXEL+wTQ398Uxwx9MkgfOL5PA1
	B9UbeXUV5wGpUhxH8yhkJquzqKXu677STCnhB91MdZQijxAVEY91duj6YreYc0Ty2FZnIMuWNZg
	rCYQtVUSRjdENJABGLISGMq9DR759hxplCi8a1cDz5oIhnmXzjJP94Mx5k0g9e9t7PKkYQsoTT7
	EqcNZ00DABD28WnexKRbkkK7rNAnhx3vJGbf/BE+btjElF5R+P5HgvALsWujJ/7Cd0hPYSxZlLO
	xTg==
X-Google-Smtp-Source: AGHT+IG2+BK5PK9DVFs/ltNR0E73frvh29ivhJ5H3WwGU3GpDmZNKKN6o+UboVJzXIf7Z+nQdkxLrQ==
X-Received: by 2002:a05:6e02:184e:b0:3d0:4e57:bbda with SMTP id e9e14a558f8ab-3d5e08eacfbmr222774665ab.1.1743615768727;
        Wed, 02 Apr 2025 10:42:48 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 10:42:48 -0700 (PDT)
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
Subject: [PATCH v3 35/54] drm-dyndbg: DRM_CLASSMAP_USE in i915 driver
Date: Wed,  2 Apr 2025 11:41:37 -0600
Message-ID: <20250402174156.1246171-36-jim.cromie@gmail.com>
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

Following the dyndbg-api-fix, replace DECLARE_DYNDBG_CLASSMAP with
DRM_CLASSMAP_USE.  This refs the defined & exported classmap, rather
than re-declaring it redundantly, and error-prone-ly.

This resolves the appearance of "class:_UNKNOWN_" in the control file
for the driver's drm_dbg()s.

Fixes: f158936b60a7 ("drm: POC drm on dyndbg - use in core, 2 helpers, 3 drivers.")

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/i915/i915_params.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
index 37746dd619fd..2dc0e2c06e09 100644
--- a/drivers/gpu/drm/i915/i915_params.c
+++ b/drivers/gpu/drm/i915/i915_params.c
@@ -29,17 +29,7 @@
 #include "i915_params.h"
 #include "i915_drv.h"
 
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
+DRM_CLASSMAP_USE(drm_debug_classes);
 
 #define i915_param_named(name, T, perm, desc) \
 	module_param_named(name, i915_modparams.name, T, perm); \
-- 
2.49.0

