Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550A11DDC1B
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 09:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749719632; cv=none; b=J2SZc7wjyt7PVyGE6/0S5yGXK7wQ4N2tgiD3oh95t71zT2XVTGR/gZUupA0EMhWciCCkoTGBNw1fUCG54ncozNIiZUugtM1T+uzVc7FbTqsmj9tUidgr0tGpSqnn0MbpKIce9n0fVMe1/30I7N5jPhDg8ik6Kq8ftzuus8Kv5nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749719632; c=relaxed/simple;
	bh=RKZx5CM/VNU/6GWOKeAKT+S43Z1V2RNN9OO4yaOUwOw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=o1Y6mDIcpxwoaBF8u04Ubl3+EiYXgxUsmcO/1Oj1Ja3fmDCDsvumHHXN94/5uJAglhEl7z8aeSfbeKUvDGkeZy9t/kXYxXTWyYSJ9VulEGAGyp9ZqTiA2HTOeD6xj5DaEdqj3AjM9pE7xS5M64N2ub3TcP4hwnNARQQ/XGIlxQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NU5OEfqu; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NU5OEfqu"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-23633a6ac50so9554885ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 02:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749719628; x=1750324428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gfnJu6FBfjOUzTU9SGHbhPYpMSIgolpLY8mjQIuOQhc=;
        b=NU5OEfquh0gkCEctSZK5Gh1DQF9fSl4jmZ10Q36U5b9Cvyt/5D+eCNLAFPlUE6oCe2
         m+t69q6dy4inhDI6m6N4xFRVMzEMttGWga+zC8vlKDN9GUUWfpLD7ECn7wvyibc60y//
         MA+sUpyT+yz5dPG5chQquyPlZ7+9nSCkLmCWq31DoEw1F9yHSsJeknTYWcoa3PG0EDP6
         MpfpfgnspTwEma5k7YhMKbkWqtLiDVG8xa9+bYIsX11wXtIKPas6BLvPe9PJH5LkBqql
         UnHDd3YgJOF7kY5WtYAvGBYeB8SMfDmqbJGQhOCfwIBm0MEe1Ha92v0EKno/vO7e2Xmv
         bH4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749719628; x=1750324428;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gfnJu6FBfjOUzTU9SGHbhPYpMSIgolpLY8mjQIuOQhc=;
        b=U/br5gDEXa/+yd340YIM+0c4gkcu2hefG5C6flz92M0Wt+2UnjLkddKd9cxF8CmNxg
         gp0cHf9uLCHvBRJ5aznwcoU8JsEMcnewkurG+TSWaVzPlDegJKHFGDvqA4eU4/Wba558
         jpxlJJPUhAk5knjA+ItgQAO+/O8WMAwXpBGDXZFteJl59L/8djKu7Ucm7Q85pKQ8SfFu
         NO08GK85zUmP2rQ/7dX/w8A+LNBqCEDm0/4FX7Ds6LBFLOAwngkzojIE5CqfLXBZJFkT
         Yunzw8qnMvnPywujwUghiQJyic+cSjeOSf954+O6EysmI6m/PXkL65071hf0K4nj1luz
         cZug==
X-Forwarded-Encrypted: i=1; AJvYcCVdxvYJ1gxX9H9gv55R1+FuoYPSrNMkMa1Y2TaSUrIgl4Xrwc8IlDqs6zbVjmpGWxTsdM6ShIuT7KuvQ9M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhwEwA/ChYTKEG8OJ5k13tZYjWaim2m2W2rNp4i815ZBVgkKqD
	Cw7iQeejEt0x70U/tdocOdaLwMfMG6CDQlI8Tc+aMLomO971cRNdGd/b
X-Gm-Gg: ASbGncul/08KU56kE5oOmReLNr+Ag34JUSroRd/SSs6j30NRNyqhK48XHAQOyuCsLyo
	Bka5J8A/1AhxZsCa5PIIBTVMZX8gL4zi8b5iAL4LbTiflt6iobga5ziUCfwwugcOv0bfeUoaLUs
	nmn/nzVFCMevGV+Js7OjA4XKhrjx0gixDYcLjIsOPYh6M4iFc1PGqLPtqze1Re451HpLSISWOjk
	32QoXb7pbftv+RqeDJ+A098Wz2KV8G1EHvFyAAUuVvgynZ5Oxh72mGsEejsAX9rj4HjrpbX6bys
	NAS+sfmaP9kFFTN2bLlvOKmp+Fq815lu3Ad2IcQpACym6Vc4yKT9C17BOxpXe70P+SanzV+/NH/
	NzQ==
X-Google-Smtp-Source: AGHT+IH5B4WttxxRU+tnlLXUWpwJKMyoK9VSqrXBTiL0SbSG+sOPE86VpdHFBeYk5SMdcmtq68Ku2w==
X-Received: by 2002:a17:903:4b4c:b0:234:e8db:432d with SMTP id d9443c01a7336-23641b28dfamr100699535ad.39.1749719628579;
        Thu, 12 Jun 2025 02:13:48 -0700 (PDT)
Received: from sie-luc.localdomain ([113.142.69.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2364e61b5acsm9391915ad.5.2025.06.12.02.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 02:13:48 -0700 (PDT)
From: onion0709@gmail.com
X-Google-Original-From: luc@sietium.com
To: dri-devel@lists.freedesktop.org
Cc: Luc Ma <luc@sietium.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/doc: Fix doc in drm_file
Date: Thu, 12 Jun 2025 17:12:37 +0800
Message-Id: <20250612091237.14425-1-luc@sietium.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luc Ma <luc@sietium.com>

Add missing type of variable in the example

Signed-off-by: Luc Ma <luc@sietium.com>
---
 drivers/gpu/drm/drm_file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 246cf845e2c9..96696fca50a0 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -95,7 +95,7 @@ bool drm_dev_needs_global_mutex(struct drm_device *dev)
  * No other file operations are supported by the DRM userspace API. Overall the
  * following is an example &file_operations structure::
  *
- *     static const example_drm_fops = {
+ *     static const struct file_operations example_drm_fops = {
  *             .owner = THIS_MODULE,
  *             .open = drm_open,
  *             .release = drm_release,
-- 
2.39.2

