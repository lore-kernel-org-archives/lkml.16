Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54257201100
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743615783; cv=none; b=UIGK25MCDv2Y0cLD4AaI/IWq5JkENyThpu1YE8mg9b4oUK8rkz5VgWMV1ENjtR3gNhwf3hw2fsmw3EeZa4V1Rxx+Q0S2Z48aYIIKHU92EByNC92tPiil3FFfASyrx44FFkZZANnbF1LgDn2yDQ2ajT+G2m+hitCByx2Wz7s973k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743615783; c=relaxed/simple;
	bh=N9BDlQuttJ/CG7/8erFPoatDdgkmwr3Xfmvi/9L/ya8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m5ewr8sNS+pjWcjXurgwPi+KaqaVI7mcWeh6tX68Llr+FCRGiKkP0xEUJjLB/fCh4OFNx6r3R6aFNHiI9KKEMObNvuZCOT3oFE9HWrjYiPGNlqYjad5E0een9WuD8iBNM/S2ZTjZCQkXO7/fdE4dymmVejHvjAgpEFewdvqNsMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MR86VPva; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MR86VPva"
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3d5ebc2459fso907485ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 10:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743615781; x=1744220581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=av5O5WnsuBn1uC/IGfMHk77btJQzrlTi1UNrBIeIfGA=;
        b=MR86VPvaJbCmDmY0iC9fnTLi0JW2rdE18L5K7/RhZHI2+jg9KCeg9pR7gyblkyzG4/
         TnSCIEGi0nHdVczY6HL+cxZyzlR0DyIJVqg0hUA+rbHNYTD7vILrC1OZVCexeaw7yHUe
         HvZvT9qnUcgXSMOCD+aPlsZVnCrfBnuGQS/0lhv9G81DbgLveXVQUTrK2zyyK6fMorKa
         kTPdPEghjNxMsj4PHCoUe2NemTq3vUK7wn9sWJYYf3Z57J4l253R263yKT+2nelDboQ7
         g+5UV4s7wIRKraOd6E+Y4mU3UwuLKF5ux8LnS3Jrk9XvKViIyQTZR2Hs5q/jO28o4pnw
         B2Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743615781; x=1744220581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=av5O5WnsuBn1uC/IGfMHk77btJQzrlTi1UNrBIeIfGA=;
        b=MMK2DNgYsvFzq8yiwBDnT8sgLtjIRuTuL3Zf1u8oTu/XS3HVQPnT1ndN1JgZfZ5jCO
         UD4TR06sxd8l5iwhJy1gC/abxitUCHlIP5bw1goeiTts7U5r7QIvH8Lv18u+6wkfgqJ7
         MiQ123TiNvuEEKyLI+gz/EIIGkUA7SRNR5lsjrw1S1QyuNt43Jqzvf5xNyPACoAGZQMg
         G/PFsiLEbq4cJ3+8Vtgdq5CLgCBu3vDIm8i6m6xl2ooocWFAYcA4Rp+hPFJj749c/5io
         CU3aRSciMZMqTvOehp+ZsuIWAQbi8eALWyEOCCUmSzVHkRV9U1yNa3yJx9shPXCH2edh
         fUGg==
X-Forwarded-Encrypted: i=1; AJvYcCW8xzViJ2MNlrwIA2EIEexesHMSmNpA0QHMfJgTzUcfR3r5giQyBRJumy+XsX6QFAL+z9dTEyiOm63aLEA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2dfrhacic64hBtO6XlSKqPHmg9hlXhvX/W6+Ohtgj/bV89UJz
	JgJJAn1Jj7bYBU+Y2bruCXNozOKgW9CYRhVojn9HJ/PnTFGs2+MY
X-Gm-Gg: ASbGnct04n012pH1P+RwWjWU4ce3cK4zUq+dao70f4Nf3tASr5QolacH0irft7/4HwW
	96aNEBBCczdX2B2TNh5cFFyV1TKf0f2l6HCFWn8s7FLZi74YKETaYhR7DVpwQ0PAweMZlrZx+HA
	89UkMPfo3JQlblbXcQV5prUd4qW+emm5QsFV9x4dYcQfzDBTTb/xrgJZ2h71IvcWvBznxKli9nI
	b9+56DxfTp4JTCJIQv9W9CoGGZnCfCj/ECHMPHHYDhwGUqrz2Zpu1fsK9nREJ7s5d6IIUNEHn3H
	GvuJ80nSF6k3f4QnbCZc8D7i5vkD5gNwZEg03UEG9ePQHGsgXz1JTxhISeO2f4QT6YugW36oNz8
	FOQ==
X-Google-Smtp-Source: AGHT+IG8XSmNVp+q/PMUM7nI1VXleBCEFjeSE8gGJHee5Xa3olHDY+LWA8eCwUT1fL6HdiRQkmnU2w==
X-Received: by 2002:a05:6e02:12cd:b0:3d5:deaf:b443 with SMTP id e9e14a558f8ab-3d5e08e251emr222409015ab.3.1743615781696;
        Wed, 02 Apr 2025 10:43:01 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 10:43:01 -0700 (PDT)
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
Subject: [PATCH v3 49/54] drm-dyndbg: add DRM_CLASSMAP_USE to mgag200 driver
Date: Wed,  2 Apr 2025 11:41:51 -0600
Message-ID: <20250402174156.1246171-50-jim.cromie@gmail.com>
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

The mgag200 driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/mgag200/mgag200_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index 069fdd2dc8f6..5b6ec1550da3 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -27,6 +27,8 @@ static int mgag200_modeset = -1;
 MODULE_PARM_DESC(modeset, "Disable/Enable modesetting");
 module_param_named(modeset, mgag200_modeset, int, 0400);
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 int mgag200_init_pci_options(struct pci_dev *pdev, u32 option, u32 option2)
 {
 	struct device *dev = &pdev->dev;
-- 
2.49.0

