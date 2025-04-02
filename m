Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3501FE463
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743615775; cv=none; b=lV3KUDhDtzl27XyE0GOxWxliPeBQOx8AO7zXunDfQRS//DIlvQeTGI3tpwcm5GKXpvjeLGd1R8G8IggkFwI1uNKRf5oTAnhlzC8hgflpe8iU9UrVHutYGc1a0l1Bt33BxDdWQ3y2UgyrxDo8aAWYjGIfO/bvf3XcTG9rYYreG68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743615775; c=relaxed/simple;
	bh=Sjq+8vveQ+GMspa86ZhuQnE/poHCKuBjtOobvctgQIg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZlISroMToH1cgFUs31g39RQuwYklsftyb/WMSOSFfcEImc6PLcU5Cooh01Evh0AaiL2kp3JRThvz8WF/AlXdWUi8YLgiN/XgujK5/0LCwFyTEQjg6N5vy3C3CMTQVzpv22H6tbR1nuB0XrrKkll9HxBRuDd12zvk0wOy69oIdb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ShEKb9gC; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ShEKb9gC"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3d6d162e516so932335ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 10:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743615772; x=1744220572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PH1+tp+xqUGCykXZdLvGRvCsZKn18R+wsUvu6RBydR0=;
        b=ShEKb9gC3fjZRqXG/WcSB2q9Tzx8bN3JqA2JldJQFi7HOQdbXE0/E9a4Tq66OI50CW
         exBoymINCuNm68hrRT1rHBbXiF42CoUUw84uDUL+99pOzQzMKEKGSjT2E8TPdgiVuEgP
         WovODYPgYSDqiR9BSIXvzGtaqIoPV0ZpcoMiDj9N6j/0M7dTvhCc21duRb0XdycY8wwP
         lSGWC56LU5gRn9M4IOrRXUpMEQR7NbC2jQl/QT+lqn4upKMFPdqc/v1404/15m6usKZ9
         Jo6K8Fdfflfa8KgitnJbS+HnkIdjDuHLdee8DGTQ3Do1HdKwlLTWMIVqrBAlSCA1vv6+
         MOJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743615772; x=1744220572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PH1+tp+xqUGCykXZdLvGRvCsZKn18R+wsUvu6RBydR0=;
        b=hbg0CgxJfTpWJKS25BhYLzt1b8WVXn87EdhlnmmaQBIaEe2QTX0WsodiSjcS3VJNwr
         QtW/5hMzFZIF34vCGZhb4OqVDUMuPIWHRTIjVxRyJ5iSTRyaR9KhcstWoe2rQC8pXnwq
         Cy7TEd/LAvPITI4Rsa0fG3qwQrvQ/r12v0y/fpPK5reUXzJw+tW7Ze67gDdi7yXy5BeH
         9xyJnPfatefqtux1oJXhQt7uKN6hE/BKJBmBQzyGfaHzx3UX6aAFubw6Vjozz9EOyG0i
         sYDNR7JSrRXCAnVZjYyHAPiKwfkHmCx1A95x5492E78GJRV7mSH0GSDYm2V4FSjLXYb5
         nFTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXH8GFeeudIKIOaQWv8ClcVlGT3Gjgy/ZwxFBsVIKqez++jDvvTs6cWnExo9719EJ997ji8fSlO3cZHtx8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqb/29Q53WLrgG1s+wdnzAge1mIP6foDm4XAvkrylj38INNdDc
	RoqKSAVCnBjn3cugULSSOsT6fLXVMFVMpsJXr2/66gFxOUbffyCf
X-Gm-Gg: ASbGncuHfpTJU0EAGoJo/IMxKxA7VNYWh425tVEyudA1eXl5uaQYL2YY5drTkRpw957
	JpXy11ccHyGrb6j9SSqYwuLFgRhGJo5YAoXBepiYryWP6UGW+pvwLc5RfxcOL27SUmUhyaAI4lF
	+FEWxxVLli0aVgy6KsgKMaJCJuyxozUSBhPPlOEHsJGbVKdWLqs71a4EJf9EuZQRcsKehHr7gjf
	LOk7QVvLLFyWwrbIPIkOKyy8R/X9diyHwY5djbCwE3K8BBBr2tT/LzeFQ74cnHEv5Cz99LFNrJG
	npihd64JB8ZJ6Z2pZ8E5uHqrMPF+9zy/O6bE97SYt7gJpwPo2yDQQf1qrdzhWAsN2lqpU2xYfIv
	nEA==
X-Google-Smtp-Source: AGHT+IFF0Xv42t006bgupPe2j5bd7+HXA5fzPJlKXda74vmLnmw3u7Z/scx8WHUoSwUy3lRWMoi1WQ==
X-Received: by 2002:a05:6e02:1a24:b0:3d5:eb14:9c85 with SMTP id e9e14a558f8ab-3d6d54a1f71mr36768785ab.6.1743615771683;
        Wed, 02 Apr 2025 10:42:51 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 10:42:51 -0700 (PDT)
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
Subject: [PATCH v3 38/54] drm-dyndbg: DRM_CLASSMAP_USE in nouveau
Date: Wed,  2 Apr 2025 11:41:40 -0600
Message-ID: <20250402174156.1246171-39-jim.cromie@gmail.com>
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
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 5664c4c71faf..bdecd27efabf 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -74,17 +74,7 @@
 #include "nouveau_uvmm.h"
 #include "nouveau_sched.h"
 
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
 
 MODULE_PARM_DESC(config, "option string to pass to driver core");
 static char *nouveau_config;
-- 
2.49.0

