Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E623F230D0D
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 09:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744794712; cv=none; b=XkUgkiTbXJTlkTWviWwynPEN4TtIKUy4CGFQqTzV+I/EY7vBDtF1HZE/3d2pu2XcjjgRV8ANvvY0SxF2SxMVDZFCJMUoo53xBOO+HgosUeosaTLjmfYf8Gcr2LfeCs3axcdvDio1mi2xfBnWi0xs7ROJSSSzGwfdH5et/Oa3Uik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744794712; c=relaxed/simple;
	bh=gkAo5MIFO8GbCVIJ5pFW/+k7mTGtz2ehPwg7DRupRkg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ia26a+68h7Q5+fFe/jH5dpGBjhElK56dWzGTdRoqWP9H2x7teWdnIffZJ/9A7ryCHyeuuIAM4gyOpJYSFx7gCh1T25mWgUYLJi9JvzU31QWnZsYpWiyd8wLqVS25i+J6NqCp5Bz52heL6Yfwzo2ijk01my/mkayA2aebMWkIHi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PC84Y8HX; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PC84Y8HX"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22622ddcc35so87960415ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 02:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744794710; x=1745399510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3ijzgK4iv6W9/SkZI5SFAq7Ny3NSkdxIDk62807ZYl0=;
        b=PC84Y8HX7tDE0yvcNpA+TjXUZkf2zZ2J5LZz3OmbfCS3m/efaFa5JqKlZflOnvO06t
         e8xVLra/BYaBF4XhiEl6w6ouBZ3A5Wj9serf4PcT0zOVYCy6XtwDjKf7lxE6QYTPdKXL
         RSbu2Yj2I33efR0C4BB49NI5pbeRMF1hfWSIVObMBGif0hOY/SGd84/klJrRp5iNaFmb
         tDnKC2JCqIRDkOStyhKG4B0ylq7G+1F4xb8X+XDL+ZTFN82iXc3P64DluHGL8wWcNhXE
         2sB9727YdSoZAhByhaHaVPB3MuzT2KS7loESt478XbClpFKcujIWtp4T68EaB5ppz4VD
         uo4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744794710; x=1745399510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ijzgK4iv6W9/SkZI5SFAq7Ny3NSkdxIDk62807ZYl0=;
        b=ciec6aJOBZKXBtRpb3ONlqvychZ/zXr47nWDvqJfq0DRvq44O8v6Jv3jOIpEcnl+Pp
         q/sQjzR+2jo6g/JiAc0ar203cdI3MBuAPWSfLwSXEDmCX0bde9wPZVgQTV94rJUXOmj0
         D6QyOLZlc3nG1mgEee+MH/ufQpIKwCmWuXFWARdUQF7Femo+hVSXOb4Np3PI8623rkGp
         ZGkDWnY3S02rj9uFXj6gY2zdBPRmBFiMTkWGHWT+RjR7qVgh44zGTIGtcCYmLgG+K5RJ
         pizExq0Mo4sqQ8SUgCJmEgY4phFLhxy4XKRieBLIdrMv7E3n9TgPH/GBb3Tl+G1eqiYa
         QX5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWdqcrPw5RB38qF1TV9M+WtdV09tn49s6Fb5H5S+8ifNHJcKVrBiiOxQ6h+ybVxtgT+xRegVq7SqqSD5UQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVpe05xRA/2TPVoPrEy5LIlvWrjE2C86miHE9f9NWB99GKRlqT
	/Li7WDAGYY2HJs451qBvgs7eLeFdu+FKAaKTjK/VPH1ZaynMU50=
X-Gm-Gg: ASbGncurngKtrPwIHUQ0b3uA6SYa3lSukjkXubqdGZ0a1gKZ5crgFkawk9a0SzvlTXV
	mw8B+F4tjZRJtmA0CONEw1V1yft9MWhQV6V0XzuaRkGgQZmQq9hIKGmKgLKr9nXBvRqx+a0WUdL
	tNn2MRotulJNnvd5Xd67scvkqlRAkEgEk54V8iLgVek+m51f6qKcCm42KRngNl2MhMkEXj2K1hC
	nK7jPl9iuskxeWKot/bK34YmCgW/dE7SQ5q9k2lA3P2GjrRTIt5k8Cme7XRsVO5AohVKdu0Wo0M
	bTHgIcswYCkPc/Zjedfbf3u6rd0oLN7eoRmpfcQhbRz/A5h/5QVY4okp4iwLKXN5mEzXuib2TP5
	8HI3UjohH2wtN
X-Google-Smtp-Source: AGHT+IHDqfPMPJDX6LvxJT/QXWmU2cwXxlIuD/lorTF2upHPyZaXQWfeUnGYg7CHwP7bV4uUaeb+XA==
X-Received: by 2002:a17:902:d2c7:b0:220:ff3f:6cba with SMTP id d9443c01a7336-22c3596b9dcmr21242515ad.38.1744794709972;
        Wed, 16 Apr 2025 02:11:49 -0700 (PDT)
Received: from mac.lan (syn-066-215-112-203.res.spectrum.com. [66.215.112.203])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33ef0f41sm9185545ad.41.2025.04.16.02.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 02:11:49 -0700 (PDT)
From: Luke Hofstetter <ldhofstetter@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sunil Khatri <sunil.khatri@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Aurabindo Pillai <aurabindo.pillai@amd.com>,
	Boyuan Zhang <boyuan.zhang@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Dominik Kaszewski <dominik.kaszewski@amd.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Luke Hofstetter <ldhofstetter@gmail.com>
Subject: [PATCH] drm/amd/include: fix kernel-doc formatting in amd_shared.h
Date: Wed, 16 Apr 2025 02:11:40 -0700
Message-ID: <20250416091143.67704-1-ldhofstetter@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

when doing make htmldocs, Sphinx complained about in-line documentation
in enum DC_DEBUG_MASK, so reformatted documentation to define each
member in kernel-doc comment above the enum instead.

Signed-off-by: Luke Hofstetter <ldhofstetter@gmail.com>
---
 drivers/gpu/drm/amd/include/amd_shared.h | 124 ++++++-----------------
 1 file changed, 32 insertions(+), 92 deletions(-)

diff --git a/drivers/gpu/drm/amd/include/amd_shared.h b/drivers/gpu/drm/amd/include/amd_shared.h
index 4c95b885d1d0..7074ec3b467f 100644
--- a/drivers/gpu/drm/amd/include/amd_shared.h
+++ b/drivers/gpu/drm/amd/include/amd_shared.h
@@ -255,120 +255,60 @@ enum DC_FEATURE_MASK {
 
 /**
  * enum DC_DEBUG_MASK - Bits that are useful for debugging the Display Core IP
+ * @DC_DISABLE_PIPE_SPLIT: If set, disable pipe-splitting
+ * @DC_DISABLE_STUTTER: If set, disable memory stutter mode
+ * @DC_DISABLE_DSC: If set, disable display stream compression
+ * @DC_DISABLE_CLOCK_GATING: If set, disable clock gating optimizations
+ * @DC_DISABLE_PSR: If set, disable Panel self refresh v1 and PSR-SU
+ * @DC_FORCE_SUBVP_MCLK_SWITCH: If set, force mclk switch in subvp, even
+ *	 							if mclk switch in vblank is possible
+ * @DC_DISABLE_MPO: If set, disable multi-plane offloading
+ * @DC_ENABLE_DPIA_TRACE: If set, enable trace logging for DPIA
+ * @DC_ENABLE_DML2: If set, force usage of DML2, even if the DCN version
+ *	 				does not default to it.
+ * @DC_DISABLE_PSR_SU: If set, disable PSR SU
+ * @DC_DISABLE_REPLAY: If set, disable Panel Replay
+ * @DC_DISABLE_IPS: If set, disable all Idle Power States, all the time.
+ *	 				If more than one IPS debug bit is set, the lowest bit takes
+ *	 				precedence. For example, if DC_FORCE_IPS_ENABLE and
+ *	 				DC_DISABLE_IPS_DYNAMIC are set, then DC_DISABLE_IPS_DYNAMIC takes
+ *	 				precedence.
+ * @DC_DISABLE_IPS_DYNAMIC: If set, disable all IPS, all the time,
+ *	 						*except* when driver goes into suspend.
+ * @DC_DISABLE_IPS2_DYNAMIC: If set, disable IPS2 (IPS1 allowed) if
+ *	 						there is an enabled display. Otherwise, enable all IPS.
+ * @DC_FORCE_IPS_ENABLE: If set, force enable all IPS, all the time.
+ * @DC_DISABLE_ACPI_EDID: If set, don't attempt to fetch EDID for
+ *	 					  eDP display from ACPI _DDC method.
+ * @DC_DISABLE_HDMI_CEC: If set, disable HDMI-CEC feature in amdgpu driver.
+ * @DC_DISABLE_SUBVP: If set, disable DCN Sub-Viewport feature in amdgpu driver.
+ * @DC_DISABLE_CUSTOM_BRIGHTNESS_CURVE: If set, disable support for custom brightness curves
+ * @DC_HDCP_LC_FORCE_FW_ENABLE: If set, use HDCP Locality Check FW
+ *	 					        path regardless of reported HW capabilities.
+ * @DC_HDCP_LC_ENABLE_SW_FALLBACK: If set, upon HDCP Locality Check FW
+ *	                              path failure, retry using legacy SW path.
  */
 enum DC_DEBUG_MASK {
-	/**
-	 * @DC_DISABLE_PIPE_SPLIT: If set, disable pipe-splitting
-	 */
 	DC_DISABLE_PIPE_SPLIT = 0x1,
-
-	/**
-	 * @DC_DISABLE_STUTTER: If set, disable memory stutter mode
-	 */
 	DC_DISABLE_STUTTER = 0x2,
-
-	/**
-	 * @DC_DISABLE_DSC: If set, disable display stream compression
-	 */
 	DC_DISABLE_DSC = 0x4,
-
-	/**
-	 * @DC_DISABLE_CLOCK_GATING: If set, disable clock gating optimizations
-	 */
 	DC_DISABLE_CLOCK_GATING = 0x8,
-
-	/**
-	 * @DC_DISABLE_PSR: If set, disable Panel self refresh v1 and PSR-SU
-	 */
 	DC_DISABLE_PSR = 0x10,
-
-	/**
-	 * @DC_FORCE_SUBVP_MCLK_SWITCH: If set, force mclk switch in subvp, even
-	 * if mclk switch in vblank is possible
-	 */
 	DC_FORCE_SUBVP_MCLK_SWITCH = 0x20,
-
-	/**
-	 * @DC_DISABLE_MPO: If set, disable multi-plane offloading
-	 */
 	DC_DISABLE_MPO = 0x40,
-
-	/**
-	 * @DC_ENABLE_DPIA_TRACE: If set, enable trace logging for DPIA
-	 */
 	DC_ENABLE_DPIA_TRACE = 0x80,
-
-	/**
-	 * @DC_ENABLE_DML2: If set, force usage of DML2, even if the DCN version
-	 * does not default to it.
-	 */
 	DC_ENABLE_DML2 = 0x100,
-
-	/**
-	 * @DC_DISABLE_PSR_SU: If set, disable PSR SU
-	 */
 	DC_DISABLE_PSR_SU = 0x200,
-
-	/**
-	 * @DC_DISABLE_REPLAY: If set, disable Panel Replay
-	 */
 	DC_DISABLE_REPLAY = 0x400,
-
-	/**
-	 * @DC_DISABLE_IPS: If set, disable all Idle Power States, all the time.
-	 * If more than one IPS debug bit is set, the lowest bit takes
-	 * precedence. For example, if DC_FORCE_IPS_ENABLE and
-	 * DC_DISABLE_IPS_DYNAMIC are set, then DC_DISABLE_IPS_DYNAMIC takes
-	 * precedence.
-	 */
 	DC_DISABLE_IPS = 0x800,
-
-	/**
-	 * @DC_DISABLE_IPS_DYNAMIC: If set, disable all IPS, all the time,
-	 * *except* when driver goes into suspend.
-	 */
 	DC_DISABLE_IPS_DYNAMIC = 0x1000,
-
-	/**
-	 * @DC_DISABLE_IPS2_DYNAMIC: If set, disable IPS2 (IPS1 allowed) if
-	 * there is an enabled display. Otherwise, enable all IPS.
-	 */
 	DC_DISABLE_IPS2_DYNAMIC = 0x2000,
-
-	/**
-	 * @DC_FORCE_IPS_ENABLE: If set, force enable all IPS, all the time.
-	 */
 	DC_FORCE_IPS_ENABLE = 0x4000,
-	/**
-	 * @DC_DISABLE_ACPI_EDID: If set, don't attempt to fetch EDID for
-	 * eDP display from ACPI _DDC method.
-	 */
 	DC_DISABLE_ACPI_EDID = 0x8000,
-
-	/**
-	 * @DC_DISABLE_HDMI_CEC: If set, disable HDMI-CEC feature in amdgpu driver.
-	 */
 	DC_DISABLE_HDMI_CEC = 0x10000,
-
-	/**
-	 * @DC_DISABLE_SUBVP: If set, disable DCN Sub-Viewport feature in amdgpu driver.
-	 */
 	DC_DISABLE_SUBVP = 0x20000,
-	/**
-	 * @DC_DISABLE_CUSTOM_BRIGHTNESS_CURVE: If set, disable support for custom brightness curves
-	 */
 	DC_DISABLE_CUSTOM_BRIGHTNESS_CURVE = 0x40000,
-
-	/**
-	 * @DC_HDCP_LC_FORCE_FW_ENABLE: If set, use HDCP Locality Check FW
-	 * path regardless of reported HW capabilities.
-	 */
 	DC_HDCP_LC_FORCE_FW_ENABLE = 0x80000,
-
-	/**
-	 * @DC_HDCP_LC_ENABLE_SW_FALLBACK If set, upon HDCP Locality Check FW
-	 * path failure, retry using legacy SW path.
-	 */
 	DC_HDCP_LC_ENABLE_SW_FALLBACK = 0x100000,
 };
 
-- 
2.49.0

