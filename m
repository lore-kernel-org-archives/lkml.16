Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380ED1FE462
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743615779; cv=none; b=SSJZR/lGj8H0EkTxLljerFe28fzP1MbMsdHtoxxVaXxXvONKBJAOLNO1Sz7mQGOrjEwmjXDvv971RM/B5DumFL0FDcKtekyz9jmAfIYdTK5I8z/Pt2U3Qf9JEGmyefvYlL1rMQ2hMbvK1D3PIA+ZP6buyxZVEswv4LNalTrkA+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743615779; c=relaxed/simple;
	bh=pnykpLg2nT1btqisiOtnE7+yyT4IxmtHkmEzKH03RVs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZqPOdvkLgVnCZ49jl6VUrtEeE7jQeQ5xwYD1R6uelhokgSmYf30d/1k3R1XTeu7LQa44y45rY+McwSjiIlTXeebk3hb94SSO2dy2T/YCCDUeuyK7zkR2DoYQ3IxCBWm7dWrHOqmNYhWLs6ZFV62uzsgwl7H1iRXvqj4xsmHyPrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GjEA/rsB; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GjEA/rsB"
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3d442a77a03so429835ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 10:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743615777; x=1744220577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XVuxeJKKK9Rs+v9Dxb1+k9xlxA6UW5kge7MRPvzoPYI=;
        b=GjEA/rsB9Zdd6W40n6htA2oc/AJi6eCnxhu0HLnhxh3pSxvhOATc7z7+brWifGAH8k
         MsMD5vsDICPMlpUw8zaCmVVPGuueRcoaodo9T9L07ErNMjwav6thk0Y4yolXMKWN+tq5
         j/wgVHoGw77rE+F59R+O2+ol68qp+rUHhUojlW5phoSlvEV7M+WKamQ5COUJmSxgFFP9
         8Gqj3Wcw3N8JXLQGeXmGWy39naRYd0dHJ6XDihMUKvyHAp35BICY3Sv5JqcbQ4K8hLPk
         HviCoL0zBpmpJyfKRL7iBfcozqJ44k8hQY8nyILpoOfDVi2WYI2kl8lFsPjMEP6LWIWh
         UrFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743615777; x=1744220577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XVuxeJKKK9Rs+v9Dxb1+k9xlxA6UW5kge7MRPvzoPYI=;
        b=e2E1ZDcO/4oPuzKqPHPCTaQADfCj50N8+ZPW7lbJauqMmdPE7B0uscyQSkQizrsur9
         MHnk+t+eeFR5tg9bkFgFZLAitxuGYUcACtnDfWDkgizjN5Zj08Ldf6cCxMZ1XmBxG5f3
         wglAbbjODKOmd/k9clpbTv1v4pCUnb3JAy34OkkNNBOfE7daIJc/gVArdXUKpBHkjEox
         CIcA32JYmCAhhCjNgMuVyn+ih6jFmni0hd5vyBWljjekwbXtF51LbKIMbAIpeusUD38/
         +3hutJAU4kmp0NJZQE+wq+bMY+WRXr6RkjEE1+20iSNqjKAXWasK7Y0oeMkZMCB0u6Ex
         z/Jg==
X-Forwarded-Encrypted: i=1; AJvYcCXO2k7gmt1zOXqG6k0742ejZowDHUpJznquGHFaN/aMMK6YJJyS/z9sFEJ4Cax4iosQLQBrRjsDTfNDTvI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuFZoQ5zkTjfpdt8obqBiPvXdfPrCSRkily4ZiVRcUcgPueV/3
	foQK9N/DIn08AP0JC6uz/CuhSlsmPz42+kztNh3pPymM7MYIXiVG
X-Gm-Gg: ASbGncsOatHIa1V8DvmXdm2gOvG01GuHoSbSY3A/xkZe0BWaJubEI9mb+W3T4M+ErZC
	ptby8QbmzQVclKeLrFAgYVTjkrrBWn+vTCWLhN4uRbeEWwRHBi9+62RQ28iZisPglX62k8M79FV
	9xDNcx0Fvzq8lXrZxgtt1cNyXzFnmDxGbqTIKR+0r4PLgKGFU+mQaOvULblWnEPyH4dRJSwcE/s
	A/ePe71j3xzDJwl4UVxPYtpuKL63JftHHNlgFQUMi+2P+5f94sv7UgMrYEFAbGUfdlnErujHF0w
	8AAiXHlP9SJ4Y0FVlELuwnDyS8dJTJMVECknjiNspw95+R8nboKlK9w9IuCbA4kaFw/jzkDPyNS
	4Jw==
X-Google-Smtp-Source: AGHT+IHC7Ea8gqOI7SUhdkIs0stRkMgjiR8iRe4Z1Hury5vPgr/hHoKAmFAKEUAuImZWm4ZQOlbLag==
X-Received: by 2002:a05:6e02:2504:b0:3d4:6f37:3724 with SMTP id e9e14a558f8ab-3d5e09e467emr214829515ab.18.1743615777081;
        Wed, 02 Apr 2025 10:42:57 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 10:42:56 -0700 (PDT)
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
Subject: [PATCH v3 44/54] drm-dyndbg: add DRM_CLASSMAP_USE to gma500 driver
Date: Wed,  2 Apr 2025 11:41:46 -0600
Message-ID: <20250402174156.1246171-45-jim.cromie@gmail.com>
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

The gma500 has 126 DRM_UT_* debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg that the module has
class'd debugs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/gma500/psb_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index 85d3557c2eb9..dc72388ed08d 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -40,6 +40,8 @@
 static const struct drm_driver driver;
 static int psb_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent);
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 /*
  * The table below contains a mapping of the PCI vendor ID and the PCI Device ID
  * to the different groups of PowerVR 5-series chip designs
-- 
2.49.0

