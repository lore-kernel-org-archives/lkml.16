Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2B05661;
	Sun, 27 Apr 2025 02:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745721432; cv=none; b=djuX8R2TRbLf2bUXIANBRQUIbl9UQ/ThaAPQlKS3WZkXBPaYzfc8tZ/w8Z2WlEx65t8pV5GGva8gWXJuf32TFWAbX+WyTTZfZ4OyxSrRU0JkHZ6Hz9Hl3xV4dsKQFUQqmdnzeqLge23pPSJSqK2iogl/MNsS6d6KzBcnLYxPIAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745721432; c=relaxed/simple;
	bh=rK+u9vJhz3zpOrwMOXrVbGhSFwLMiih9GqsN16Vu+8s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eHUVFZB+YwmhiaRKmyAf+cHyy8kv3ItgD+qrQcEkjRXrAMOLV9J3zV6uyYVQB+ffQt/gHGWWqU0CZiMVSRfbfeBGYsnNbao13iSd9dMkzJDa0C0kCimOHeNd1dmWUaFChpTgUDGNwRm6tCuAy6PfwJT4McNlrKsGCWWPmK0lsQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zo7WK6Nm; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zo7WK6Nm"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2241053582dso56194405ad.1;
        Sat, 26 Apr 2025 19:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745721429; x=1746326229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sGhmxhSrOG99ny8cfzHBCSn4oPUOL2LGUGAF5QgBGIw=;
        b=Zo7WK6Nmmx+jr/MQjfdytFTqysc8NZepv/M+qTieyiYmronNAQv+DYw+8OMHzMMNE3
         yOvnRV7WF1vGFZxkDjdTYVJy7uPmOpEbXJoP0dvqCopzdUOqw5+sN48yGVOXFaxsWUfn
         +6O1DC75hDCRhe0GAVVKBw5XKJ3Hz8CF2hkzWtKl4ZsFX+vTfQQx3VQcVS4c9U/s5MDz
         aFNfPYdJA0GBfkMDMzSzGsCCuiJA8rCSr4iUuDJzC0Wi27WFfLXX4745oqZRzaBRnSGn
         f/Rrzd2KhYa4eKqDZuLwKzjsbt264iKtDjzg13w7gK6vOi3/Kt43pZZ2z1cVk6sMONf9
         JRgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745721430; x=1746326230;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sGhmxhSrOG99ny8cfzHBCSn4oPUOL2LGUGAF5QgBGIw=;
        b=AnDkOTp8MaXsabv2wPBEBRYEnozXLMZdlAwCbhSXgPfKt4Q07l0QoTMOXVKyQDcXbS
         bsNVi5+8N0SckCl3OttJYx8F6vNrIl9NsZP8VFpybMngOOC+mbKG2FjqDy72EkKRyfPt
         sk7Tb6V7z4gSproEyIX/1A1OKLGnCnoqfaJhz9pcsV2V7hAbgB9ebrUajE0+lEeJ1b7X
         q9BfEQ7uPADhbPSZQjSlq7X4KkDrn9CPRWWnAKBfezfwNXoBbQ/8vkQp4v/ElQvAiFLL
         LyzT5HXpGk1tHJifUzkbjHHpiSSHViHiPqw8dRb/lRLMdBcFrE6MqTUWDzNzCNDoADmc
         n19A==
X-Forwarded-Encrypted: i=1; AJvYcCXBLRUJ8ctdWTHM7VuKyqX5Eq4zkW4Y/lUGHa80tdnH1SYCz3bmXOJzM7YPNAWozrD1kGKSsFuBA6U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgEE/QiNwANQC9LJSpVSY7pnRDkDGvUn2wOQ+sFfhEZvX4HS7B
	sCK2EplPVBExo9slz3sY+OTXkAKrN/EAhi9jDM8xAWMUlH+09xix
X-Gm-Gg: ASbGncsimKxU/FG6kDKTHd7tyEQeoXlr/fPpzdxCv6JXHlddWN8Mxq/rfh03iSshibs
	P6FSq4rScy73zoCkfX7IMIcf88pqST4forlI43/S2ikOLI8VMy1mmviwxO1gQZD8YZxgOREwPvg
	dZaNYIEV7h26cJ8SxsqBoJy3mQ+Db43Piz2ffNp8IKfjjnugZhpLHmEU+xO12Z3iAI8hjqfdtPZ
	Ob3198UG+MpYK7V/ZgBYmxgS9GuMW3N33cqx5n+5BmtlIetoAQ6smBrXPO0lwywuWrbQsmmDYmY
	G7QV6JJGjTAY4i7S++QWoYuo4lsAMvAsqeKslnT+
X-Google-Smtp-Source: AGHT+IHORZxRoCwJgkxTIznfaV7sWbHLw+4c1AAkdhkWHc2dCqwboQ1cj9cnhpySTMZq7KnyUv6y+Q==
X-Received: by 2002:a17:903:1b26:b0:21f:564:80a4 with SMTP id d9443c01a7336-22dc6a6852amr69641655ad.33.1745721429362;
        Sat, 26 Apr 2025 19:37:09 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d74c93sm56570415ad.11.2025.04.26.19.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 19:37:08 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 0AE584208F70; Sun, 27 Apr 2025 09:37:04 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux AMDGPU <amd-gfx@lists.freedesktop.org>,
	Linux DRI Development <dri-devel@lists.freedesktop.org>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Lijo Lazar <lijo.lazar@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	=?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Ramesh Errabolu <Ramesh.Errabolu@amd.com>,
	Arvind Yadav <Arvind.Yadav@amd.com>,
	Sunil Khatri <sunil.khatri@amd.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] drm/amdgpu/userq: fix user_queue parameters list
Date: Sun, 27 Apr 2025 09:36:26 +0700
Message-ID: <20250427023625.14327-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1905; i=bagasdotme@gmail.com; h=from:subject; bh=rK+u9vJhz3zpOrwMOXrVbGhSFwLMiih9GqsN16Vu+8s=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBm801606YS91/42J91SNohletaKPw1KmtNYn19wEVjq2 vrqkJNuRykLgxgXg6yYIsukRL6m07uMRC60r3WEmcPKBDKEgYtTACZyK4KR4cOB5FrhC3KymaEl DxbEmN6Yf/ioboVi+vInemYRTs3deYwMS59Y6YpzNLeK8PPsShB5nN6ULXNG96RTdn3a5VcvFq7 mBgA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Sphinx reports htmldocs warning:

Documentation/gpu/amdgpu/module-parameters:7: drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c:1119: ERROR: Unexpected indentation. [docutils]

Fix the warning by using reST bullet list syntax for user_queue
parameter options, separated from preceding paragraph by a blank
line.

Fixes: fb20954c9717 ("drm/amdgpu/userq: rework driver parameter")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/linux-next/20250422202956.176fb590@canb.auug.org.au/
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index b9a1ef343c79cf..ec8057597c5aad 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1115,11 +1115,12 @@ module_param_named(rebar, amdgpu_rebar, int, 0444);
 
 /**
  * DOC: user_queue (int)
- * Enable user queues on systems that support user queues.
- * -1 = auto (ASIC specific default)
- *  0 = user queues disabled
- *  1 = user queues enabled and kernel queues enabled (if supported)
- *  2 = user queues enabled and kernel queues disabled
+ * Enable user queues on systems that support user queues. Possible values:
+ *
+ * - -1 = auto (ASIC specific default)
+ * -  0 = user queues disabled
+ * -  1 = user queues enabled and kernel queues enabled (if supported)
+ * -  2 = user queues enabled and kernel queues disabled
  */
 MODULE_PARM_DESC(user_queue, "Enable user queues (-1 = auto (default), 0 = disable, 1 = enable, 2 = enable UQs and disable KQs)");
 module_param_named(user_queue, amdgpu_user_queue, int, 0444);

base-commit: 127e612bf16726620e431b6e0f771424916492be
-- 
An old man doll... just what I always wanted! - Clara

