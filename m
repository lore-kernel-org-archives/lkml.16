Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31F61FBEAF
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743615770; cv=none; b=Q8Cfb6M7CiA46nYi3pBAocV+Hbo6uFEMYo/HHkOhB4gLUwNsdJ8PGvlzongQgoltZRP00cvzImDwQPmm94ClhdKDBjik21k7BHB6hR6FeS/3/DURX4CIEbkNbP4VNZmEQur/RQtDHsIx5rZWRQwNMBUwPqP8G0pwDfneIOq+cEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743615770; c=relaxed/simple;
	bh=z4vyrj+RoPLsf/4XIHodKfOKwm2p5okFB2+tsOyDjuY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vw7KvZyKQZGHseCA9moHGnDAKKYWWdAOI1kKa8MjC37scIivFIWSFW/QkN3DOI8EMRRTUamyNGj+Enjf2dmWhJ7kKEif/FQbPM0mnhnBGVQYklimB2zc+y9nkQKNAnplv0IKHw5VSyOremt7Ayj31O8FQO8u747XGr4onJiwGp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bSsFCYnS; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bSsFCYnS"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3cda56e1dffso522165ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 10:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743615768; x=1744220568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w02wgtcHHGYOO+gmdOwu7/FsZrX0ILEdqRJTa3eES9s=;
        b=bSsFCYnSpuo1tHt1BpbUlI+unc3hLd+mBX8zjiirj++IEkTfEQV4UIAzTmSZayT8l6
         VCP9geC4Cd0LTiGKxOh+o6Zy4Dct9eGqWBuB5EGpI3MIY/MMkMxAtYdpnZrdT2vFjNsV
         vtxfUTLARpDq+U4DxklASBHLxacL0isRyWCPqk9HmCdmsQKJ/fv6ynY6QRCepthqxb0G
         UJkw2nIifqE7LQRXTjCp0lxQURO3EHnyCFfc2VQH2/Z/CfQzib3IPBA7m5XjUBGf3aEg
         AILvQWMt7XIOBHapoUjYAb4nDTYi3dlTUzttiNTqJ95EYU8ju57w4rJOzgCWXeyi7oF3
         /I4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743615768; x=1744220568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w02wgtcHHGYOO+gmdOwu7/FsZrX0ILEdqRJTa3eES9s=;
        b=rOB3sP4liysH2HZvDeu5F/b1QHhfQxMseN/X0jwswCF0eGIoLw3h0heO+SQcSHTM/P
         tuI+r2ZUEt11GuQ58ywDPYtwa038b6lU64vJTgU4JZpYODMO3X91E0yTFNtE7HdURaBT
         K2fQyNbjSoQHynIlCql2fsRS4GcvhTP04ks/gR485iiaxKJku+9o+4edQWNtyIXr3HIy
         Y1I3Ze1Ry66WLzrjksJv6c7jWOCFjwOPGzWXtpYS/6uOPxM1VDE+fxpQRdr3YKtPeJF/
         aQkYwSt0W3qq7HWKZ0ZTWXXI4noTLuwItHk13bHKMW7Z/2PpjrwvwuV7VAhZd1Mt8ibO
         quUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVphoBL7Qs+odAvM4WJy3uib0YJxzfITsYx42cb1XwLuLmXMx3uzcTGxLd9q8U+bNNLiq+gchkDJZleu8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwWcLgU86SajfrbVMjW6m2rubxV2GE3GmPsbN0S+ONOJKUbnyG
	xAjY3RTpneAX5ATvvZeOJGai/Q3y+7qvSKZS6vmDH5Lujk8lLd+J
X-Gm-Gg: ASbGnctGslzoSnmCg3HRdRc08c3EidWM3zyBXDDc7xmlCfdoaedxYm1NTjIKoKCzaDm
	U4oyNBY5Si7943ckRCzHaf8SIah7Xp+NUUrKTqVczH/gjkxG/sAyYg+lHoXFqo+V+H2wQ96Askq
	BvMvGZyOByb5c3NVk/439TmZvavaCzO6xMPD5CgyA5AVTQRBnXb/JiSYdcs08SWfNVkIV46ce1N
	0jGL59VP2T4qweTIpUJTAZ8oYAkV4z9I0bNHyuRGXpSPHNlRxOh1Wjn3fbAkd8kfDO/X34nrB2e
	jrWPqDboWl0hFsbALSjIpv5F0p6MwITokieWrkn+K5nLOQTjcx/BTkyuTS9BT3cSemhstTXl7DH
	MDA==
X-Google-Smtp-Source: AGHT+IF1HLIFdbvBCtWhlGzPwTstv1cbLvUICq16go06Bgug7/wjFdTjKb45EA502/WLzrR1pH3YCg==
X-Received: by 2002:a05:6e02:3c82:b0:3cf:c7d3:e4b with SMTP id e9e14a558f8ab-3d5e0a09a11mr204521865ab.21.1743615767925;
        Wed, 02 Apr 2025 10:42:47 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 10:42:47 -0700 (PDT)
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
Subject: [PATCH v3 34/54] drm-dyndbg: DRM_CLASSMAP_USE in amdgpu driver
Date: Wed,  2 Apr 2025 11:41:36 -0600
Message-ID: <20250402174156.1246171-35-jim.cromie@gmail.com>
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index c0ddbe7d6f0b..e1367f66c4d2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -234,17 +234,7 @@ int amdgpu_wbrf = -1;
 int amdgpu_damage_clips = -1; /* auto */
 int amdgpu_umsch_mm_fwlog;
 
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
 
 struct amdgpu_mgpu_info mgpu_info = {
 	.mutex = __MUTEX_INITIALIZER(mgpu_info.mutex),
-- 
2.49.0

