Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7099C202F90
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743615786; cv=none; b=Ug1Q+U5R1R11HxXltFNuYw1TO1l/5lDWvFYyCPZgGxGBIV4cygRBgU5viRVKJQIaNJ5XwERfOuJ7sVr+bAlPDTgFBv3x5tuKjfFb5ZFFmapxyvWVpkFtV7+Bi5NRRAdPQQuOEd8X5ilD4ecGd7rNoL+zW4/e07Mskvu89w8nDCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743615786; c=relaxed/simple;
	bh=jtmuGtEYcaPHI+wbnujDHwf0zLuAr7ob6sebW7yeKAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ModTSL3JYleEqG16YC4FA4/EX8uKsFmQ+2mMpKi3gka03NvWmtsvhASv7f+27+cnpE4ahQlZqlP395hVOBH2xNc1rU8XQGE8iSgWJPu1a5n2uz7n1BOhrnHWFEwu6z8AS7ppcHPvVjJcUZ1pyl7ZxJFt7GvgIL6R2z36GFZ1jlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HmpX38z7; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HmpX38z7"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3d46fddf357so513745ab.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 10:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743615783; x=1744220583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v1ua5S//H69kDLjZ/ereYDRSGWaurp/ZUyrfcdHp8ig=;
        b=HmpX38z72OWvTZXS2vnOqABuRbVsZOTHqr2kKuaV3fnmzdaOI1Q4zZMssww6A6GJk+
         LHCZhTHFjyEAfr6mj0Y6ixH+AsV3u9Gp7jATxbb+gczjuHi/9gxvjGzH+P5cJ9xPyBvm
         DekP6Uv0NG63OTQDOLd8iGIQ4IC0ppC9+cjgCQL9u+dEMHvbBAvhM0aySc6fDic4/HoV
         zXwaP2yB5tKbjfSv0OIfGqqWNE/VOu/DvoD416L4V79dZn+9VkLNKPQ2KOhmFVh7M9e/
         08hh2R6+VPxfChRD7jnsRd0FrjHpSnEW9wjldpU7Lwlk/7s/BNy2dFkOP1OF/gtg/xKq
         e6Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743615783; x=1744220583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v1ua5S//H69kDLjZ/ereYDRSGWaurp/ZUyrfcdHp8ig=;
        b=DX7G0O2TALWLz4kPxV0ASRDgGOXUEWq1JwAurQkL48dL5rzdERa/SnTJXcSnBRw6b/
         UpsZu0fWBJuT6PpONrIAonB17d7e3N6lPg1FkdxgdglrAd0WbET2UabXps0RetshEg/L
         ZIfNUwdK/4e1nBF9/hZfhFAKCgs4hyIU9dtVfgoYR+RA6iztMvfTT4YUDahjXl7CL4QS
         mhrpdFaEZqPflMpS6K8I9n/YM/eSh853FepH6CEilceo3B8apAg+6aQIieRx7WhCBWq5
         YMfVItx3OK104McDT4zR42st1J/lMWC9MXW9cWQ/69GRufv5CeP3F6Y8emQCHe6/sAHV
         9GIw==
X-Forwarded-Encrypted: i=1; AJvYcCWCPoCOpbaR+E2Vi/hIqZo5ypod7kGPo1ocvhANivwoA2Kp7HPJEZBsmLL7OLxwlxB8RZkBs/kVuksZWJ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdLhjAGodmPlKaHlMNeCdiN7NFdUYwcrJARXfW+XUYDWGVG7+E
	BE1V18g1LmCX4W4mrX2F7PVup92Eer7bH0a1TH+QlZ4Vbg68xkTA
X-Gm-Gg: ASbGncuCFKk6WRQn8+91Zu52ONkK6kbKPiTSONiv+fojFIVwDNoNTNUQOvcCVrNiqWp
	LVO1uonS7UA3xyTPADgepZH37fFyKbhEOCAWzjZZ1EgKSPicTUG6re0w4P5BiASpxz3+HBCcBut
	k3GxVyaqVVSK1GY9tszx/8V1DDV1fos7lVfTqKhgn57IEKYpAv49OGnF2N/YZ1HpZ1DxO4ZLTTB
	P8YpSBfIE+CDWwP55AGyqBYmrSnPP522hS/DOam/B4qYM/uVmvxEKAqrXfKBB9ivQ3rJchvLBTb
	h6zLyZOpn5f5yv53PRfmoMko4CqeKRsmgrH+6GHXNCEu7sGjL859Be8Dm++lhhuq9SMeXQedjp/
	zCw==
X-Google-Smtp-Source: AGHT+IFNbSL/mGRZnpcJ5fpN82ueS3a1gUICe3xx8i7wsRjblgimnfxJciryAt1b8LRjBn5RrhWasA==
X-Received: by 2002:a05:6e02:12cf:b0:3d5:8937:f419 with SMTP id e9e14a558f8ab-3d5e093c0e0mr170520315ab.13.1743615783315;
        Wed, 02 Apr 2025 10:43:03 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 10:43:03 -0700 (PDT)
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
Subject: [PATCH v3 51/54] drm-dyndbg: add DRM_CLASSMAP_USE to the qxl driver
Date: Wed,  2 Apr 2025 11:41:53 -0600
Message-ID: <20250402174156.1246171-52-jim.cromie@gmail.com>
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

The qxl driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/qxl/qxl_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
index 417061ae59eb..c18577a3153d 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.c
+++ b/drivers/gpu/drm/qxl/qxl_drv.c
@@ -66,6 +66,8 @@ module_param_named(modeset, qxl_modeset, int, 0400);
 MODULE_PARM_DESC(num_heads, "Number of virtual crtcs to expose (default 4)");
 module_param_named(num_heads, qxl_num_crtc, int, 0400);
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 static struct drm_driver qxl_driver;
 static struct pci_driver qxl_pci_driver;
 
-- 
2.49.0

