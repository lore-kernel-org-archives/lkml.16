Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7905F1F30B3
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 09:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745747164; cv=none; b=jckg6klW14hbE+pQVgEQCA4zrO7yPM5Cw2H8Jd/gTdVpbOcn0JGNvJrrZ2L1CrMtJwN0GDUVG4zI7ZhRLC8R425J8oMBHlzWk+PMqi33ZgLRr0TLZCDtQ/0cnADvE4fXUWdBlju5JSb26bxF1fUtGO/xxAytEr/dJIKrHVKAK+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745747164; c=relaxed/simple;
	bh=/FO6yhO05huvKy/pSwZ4uAuIF9UsVQjw2MqIJ/Y44dk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=o3aVPeFvWyEJoXkPaa+j6hggA3JYNZz6WR1WqVSbX1gvz2Y/9wzPm4UZk2tYsJTqyxTX4xRo0H4QyGGt2kWkJNNDtn+AjTDNwZma4S0aekeUR/RYoCd9KEFpgct118FaFNaWON2plBYirVcCZvHojBKtu6ScKFFIxzWrOEWsgQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DeDSY/JE; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DeDSY/JE"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22403c99457so8832805ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 02:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745747163; x=1746351963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+KDTqcMZlGtBruM/CFwkX9atXMGLUR7NjJmS88z9xoA=;
        b=DeDSY/JEPY0nf3mO4cf4pfi7/EYy0U2N66DiktI/lbtEAMDtx/N+oZhR61pInM+BPu
         wSudk7XT9BaK1hvh23qntJEMwDzIY0Vl1ByYSGznlMzzkrXRVEnn58XIlEVQThE0ZjhI
         LX01crFtBcjLWCmu3/S8SQzvMDWwfrkdXVOy58rDcmO4FFQ2DHN0gocVjgQSrgNrO/tx
         d7c5ObuUCt4H7gX+jL30/rt22oQAtstTHh5KjwNIx6VFAR7NRHEyeYUPzRP8+H2EeGVG
         PC+AOS1MvYFrGXLza7IvqTXG1xVsHR4SEoN62TH2Img4WhppxCu1DkYnfTzlavbFO3ty
         jI5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745747163; x=1746351963;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+KDTqcMZlGtBruM/CFwkX9atXMGLUR7NjJmS88z9xoA=;
        b=NqlZTVdeS+681pTLxWOi3StLnexOmZkh6B4K3lrzA3JxfTUAehGNcJHrJohQTOmWYa
         wVLQQ0jpLqaL0mTq9jMhVDCraJsBZcvWguy/K4vh0/TrpknesniTnELczR4b54XN7WP0
         Mbda5zXwe/PV/C3H8UdXQMe1+WtCI0DpyAEq8tBTp5IoG3TUJ+E595zmvuYlrIuTMbtp
         QM8UldqZhkZyL2eW1fUVYks1JrVS6DUg1jx/mlolxAf8QOkOdJBFcnByU0aSXsX6tOuV
         EdqYzK3hR/eOxqJ0UIm9It6N8uVV/ImSZ8Yyv7wnLXewP3RljaIhtSDfpbdt/Weog9Uu
         +Khg==
X-Forwarded-Encrypted: i=1; AJvYcCV+DecS33YPf2034J+a0VxY55Yf3N40+08azQBUz8wo0LgIxHVXCwYAYo9JLDDlPuqbF9qIIFvqZbPjXCE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPwzn/cYkJeV4UZtyE3BKOFzslOLOHlcBMaD3D6J6+QJIbHW4O
	NlU6lOI6IkOLL4kw6Wt1vRnc5qJZxm3em41ghVC/wFsNnexkAqiJ
X-Gm-Gg: ASbGnctK5pUZJO4QlWKDZBEf4D+bDwJc024GPQCezMT3PGM+cqnxu8SHTCJpk/bobVw
	6s3tNLznSLGlBX5Wy/UZotjZebixElBHsn8cIkbOujdP3oDhhSzGsm5wVDlzsAPmjwqSrsePrU4
	j1eRff1VRu/VZpiAxctCu2NbO5EYiZ48k4BtgCMhanw0NPMo0fYURh2eH4s+Fxrw0H9xNZFLE2b
	3ort4n/0BzkEJ3E05bQ5Gjy4qK4TubiklOAIovT/eRYUy2uZo1K6xeJ6yw/G7iJIXppTWABRzDQ
	zEMlUZczXx3yk3EFynICky+EnZUx8R4dJtVRqmZqivVUwQcj5y0=
X-Google-Smtp-Source: AGHT+IFgcciqD50PlJmVfjc1kvZFMb6P1l5O/9ptq2pZnaHuOKXwCR7aBlX0yzuIsyy5e/DKD2Gdyg==
X-Received: by 2002:a17:902:dac2:b0:21f:356:758f with SMTP id d9443c01a7336-22dbf5df830mr46268985ad.3.1745747162689;
        Sun, 27 Apr 2025 02:46:02 -0700 (PDT)
Received: from dev.. ([2402:e280:214c:86:df9f:2e4f:f8a7:6d85])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e7a33sm61557025ad.146.2025.04.27.02.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 02:46:02 -0700 (PDT)
From: R Sundar <prosunofficial@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sunil Khatri <sunil.khatri@amd.com>,
	Tim Huang <Tim.Huang@amd.com>,
	"Jesse . zhang @ amd . com" <Jesse.zhang@amd.com>,
	Boyuan Zhang <boyuan.zhang@amd.com>,
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
	Yang Wang <kevinyang.wang@amd.com>,
	Peyton Lee <peytolee@amd.com>
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	R Sundar <prosunofficial@gmail.com>,
	kernel test robot <lkp@intel.com>,
	Julia Lawall <julia.lawall@inria.fr>
Subject: [PATCH linux-next] drm/amdgpu: use string choice helpers
Date: Sun, 27 Apr 2025 15:15:36 +0530
Message-Id: <20250427094536.353823-1-prosunofficial@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use string choice helpers for better readability.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@inria.fr>
Closes: https://lore.kernel.org/r/202503222049.sUXL3q6w-lkp@intel.com/
Signed-off-by: R Sundar <prosunofficial@gmail.com>
---

Reported in linux repository.

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c:311:49-70: opportunity for str_true_false(vpe -> collaborate_mode)

vim +311 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c

for linux-next:

 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
index 121ee17b522b..442d137e0fed 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
@@ -317,7 +317,7 @@ static int vpe_early_init(struct amdgpu_ip_block *ip_block)
 	vpe_set_ring_funcs(adev);
 	vpe_set_regs(vpe);
 
-	dev_info(adev->dev, "VPE: collaborate mode %s", vpe->collaborate_mode ? "true" : "false");
+	dev_info(adev->dev, "VPE: collaborate mode %s", str_true_false(vpe->collaborate_mode));
 
 	return 0;
 }
-- 
2.34.1

