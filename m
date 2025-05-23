Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1E91B0414;
	Fri, 23 May 2025 19:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748029957; cv=none; b=ZvmhrUydx8KZ+NgeY+/yPGR9BqWiqAJSV5z6jPDbkS74XbK2h7upYC/jVvAROWFrLYE0TfXjCwGo434gW737qqZkUnVWX6Pk107lOv3u8xmCgm5meoM+evRUjm0Ys6kgKsIGPazmrioIS5vogTr2R1Bo9fJPVAq33e7dgW2IwBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748029957; c=relaxed/simple;
	bh=OKaP4B0Xnh5TJoF72fSANLfkmXr2lapzq7QazmotoOE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f2fA6dDL488rhIPkXd0cFW8OcZd3xcrkrxLvdvnwuXrXw/IYI0h6YDBeau7iTqhtxinzIpQxPrb/IA97RXHSuYvqYaDlNl6BDho5MHF4oPhDDZYbLDQ2z7QI85k5tTTxokvMkNtbNXbYxmJ/QlwgoA56sDKc47myWyHKeMiamM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QYJc6+jI; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QYJc6+jI"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7cd0a7b672bso12349585a.2;
        Fri, 23 May 2025 12:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748029954; x=1748634754; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WmPCjoSXFBtyUZwjoj/rRSZyZWME/2nkz3kS++4dL0o=;
        b=QYJc6+jIVwQ+LHix3TdIC/7ir5Z32nnU7IwcgzrCe15zoa/vf69421WPzLxmJY5qOf
         N8oNeMKpID7zQLD+aEWE5bLWenyvUtg/uw2NooansXlXd2qP+LqGNgzbUsREl6YYP69+
         I3D8zcE4R2U06nFpdy1zPV3xLndjJ7qws4ZwkDV/NRnrJ0h4cypspEf9Iv+t7VRX2XAq
         v7EquxIU8PKZ9wNs1hGN/pv+unGtUMZQH7T0zgRlwMfe9ywiLACqQRADOyh3KGKiobNI
         UcxeWxxKQc+sMfBJn+JW41v4RFt9jRNxh+5QHP+QLzYr+giZA8I2VzA+E8mEvPnYX+1/
         zGgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748029954; x=1748634754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WmPCjoSXFBtyUZwjoj/rRSZyZWME/2nkz3kS++4dL0o=;
        b=RJJxM2Gz92/8tYOGyIaMTCP0vLEBggjbf2yUt8Ebl0tnr2kYlahpVDUSBcrj9PtDHs
         78tmd1ogI8arPxYr2hRpQtfQ91yt2b6oTsSKJD17kPDbSZxQFxM775ZXuTv7kMBa7aog
         VDgmdVTg5W1jOx5E7qDETslgMZdVW6zoZD4FSBAm9/LliXPCkdep0W6sUsYBgGim0wzI
         jtMcet6vL9FsdJCgcH6BNGfx29+oqEcGDRWQor2jZqkldPBN9mErELOg/7V8ZkzRCbsY
         CfFiiQSH4C0aF4jkEJ4OS9CTC6mjD9gmEKV/jiiaCmqH1GK5FfCe6d/Rt8WonZnmaErR
         tu8A==
X-Forwarded-Encrypted: i=1; AJvYcCV/RSzkJgVsAahm6sg0fSgJL1VbFT+EJix5h0nQkkp703swXOU8vEmLC7YdKlSJM0GGm05mfhE9rhc=@vger.kernel.org, AJvYcCXBiM6FjFVSjPrluoY4icpcKmV68agLiCN4IqjX8sC5C0yvWB1V7lk046mcGSoVg4wQWPFhT4NejVTVcEx0@vger.kernel.org
X-Gm-Message-State: AOJu0YwNNofKI4sX+9qCVTPXXIPjoHHjHWcLCKufiWC/5awj8PgS/ygl
	hdlMa1AMR76RYFZApYKDLCS8/XmmcJrht3QnRrHlDMyONE0Cvasf1GZR
X-Gm-Gg: ASbGnctGF0wExZkpLVd3AQWGEYXinGeZz2yTlYNj12OGyG1ec/JvNfAe90OEVRHcmZB
	VPTNef4KgqMqAoVLVkaljvUyzbS+HzDJQBbDjShVA0cm6cUJ27Dr4EkWLlPg+pBn9iR80Q+ktaz
	CY1Bb45PqLHOgmv7CDw3GnY/qnJROhtr5Ba1kWz3GlD4yocJegum+MsTn9c5tAvcBFm1wDHRR1+
	jZEpGyB95VwzQuwut2lg00H7KxqbbKDgFJnCQoicp14gnJztc+aSDZhjRbgJJP3O+pU6Domecm2
	M3pre3ZuiWcWS52V7MQqCmVpHMBW11QFLZMdYgrDViutLDvStlcwfFrGHgKSOP1Kvg==
X-Google-Smtp-Source: AGHT+IHEPwBBepU5BOws+80VBNcZYVDCzQXJTxhWGn+7xzZI195OkqyZLZqqugwwVyfoO0lqkMvQpA==
X-Received: by 2002:a05:622a:4c0e:b0:494:af82:7804 with SMTP id d75a77b69052e-49f46e41135mr8653601cf.29.1748029954290;
        Fri, 23 May 2025 12:52:34 -0700 (PDT)
Received: from [10.0.0.88] ([2607:fea8:bad7:5400:a4e6:39bc:5bd6:cf8f])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494ae4fd718sm117133001cf.53.2025.05.23.12.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 12:52:33 -0700 (PDT)
From: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
Date: Fri, 23 May 2025 15:52:26 -0400
Subject: [PATCH v2 2/2] drm: add overview diagram for drm stack
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250523-drm-doc-updates-v2-2-e517df152cf6@gmail.com>
References: <20250523-drm-doc-updates-v2-0-e517df152cf6@gmail.com>
In-Reply-To: <20250523-drm-doc-updates-v2-0-e517df152cf6@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748029951; l=3657;
 i=abdulrasaqolawani@gmail.com; s=20250522; h=from:subject:message-id;
 bh=OKaP4B0Xnh5TJoF72fSANLfkmXr2lapzq7QazmotoOE=;
 b=ykqV2SnKCAiSw0h64hCOwcwDzdGjEq6siC0Lx768zLLib1IaPQvCVP0qmBLUThAToYtOoXtU1
 LnvqueGSk+ZAcOyJ06XsiQUpaQMozq9sjVixalqZn/GupAVctm0gERF
X-Developer-Key: i=abdulrasaqolawani@gmail.com; a=ed25519;
 pk=LCvBseqd+rEj8B1vNEnSSfNcqQwMsfWx1DGDT1LYddo=

Put overview diagram into a literal block
and set its section title to a higher order
---
 Documentation/gpu/introduction.rst | 72 ++++++++++++++++++++------------------
 1 file changed, 37 insertions(+), 35 deletions(-)

diff --git a/Documentation/gpu/introduction.rst b/Documentation/gpu/introduction.rst
index 91bb0efc96d69921a122c5265b1431fa18110a7a..2653048ad4bb0ecbc2b676295440442dddbabae6 100644
--- a/Documentation/gpu/introduction.rst
+++ b/Documentation/gpu/introduction.rst
@@ -15,41 +15,43 @@ and the new vblank internals, in addition to all the regular features
 found in current kernels.
 
 Overview of the Linux DRM Architecture
------------------------------------------------
-+-----------------------------+
-|     User-space Apps         |
-| (Games, Browsers, ML, etc.) |
-+-----------------------------+
-              |
-              v
-+---------------------------------------+
-|    Graphics APIs   |   Compute APIs   |
-|  (OpenGL, Vulkan)  |  (OpenCL, CUDA)  |
-+---------------------------------------+
-          |                   |
-          v                   v
-+---------------------+  +-----------------------+
-|  User-space Driver  |  |    Compute Runtime    |
-|  (Mesa, AMD/NVIDIA) |  |  (OpenCL, CUDA, ROCm) |
-+---------------------+  +-----------------------+
-          |                   |
-          +--------+----------+
-                   |
-                   v
-        +-----------------------+
-        |   libdrm (DRM API)    |
-        +-----------------------+
-                   |
-                   v
-+-------------------------------------------+
-|     Kernel DRM/KMS Driver (i915, amdgpu,  |
-|     nouveau, etc.)                        |
-+-------------------------------------------+
-        |                       |
-        v                       v
-+----------------+     +-------------------+
-| GPU Display HW |     | GPU Compute Units |
-+----------------+     +-------------------+
+======================================
+::
+
+        +-----------------------------+
+        |     User-space Apps         |
+        | (Games, Browsers, ML, etc.) |
+        +-----------------------------+
+                      |
+                      v
+        +---------------------------------------+
+        |    Graphics APIs   |   Compute APIs   |
+        |  (OpenGL, Vulkan)  |  (OpenCL, CUDA)  |
+        +---------------------------------------+
+                |                   |
+                v                   v
+        +---------------------+  +-----------------------+
+        |  User-space Driver  |  |    Compute Runtime    |
+        |  (Mesa, AMD/NVIDIA) |  |  (OpenCL, CUDA, ROCm) |
+        +---------------------+  +-----------------------+
+                |                   |
+                +--------+----------+
+                         |
+                         v
+                +-----------------------+
+                |   libdrm (DRM API)    |
+                +-----------------------+
+                          |
+                          v
+        +-------------------------------------------+
+        |     Kernel DRM/KMS Driver (i915, amdgpu,  |
+        |     nouveau, etc.)                        |
+        +-------------------------------------------+
+                |                       |
+                v                       v
+        +----------------+     +-------------------+
+        | GPU Display HW |     | GPU Compute Units |
+        +----------------+     +-------------------+
 
 
 Style Guidelines

-- 
2.43.0

