Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781641A9B4C;
	Fri, 23 May 2025 19:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748029956; cv=none; b=TPiViG7bdyZi3o3dAjWE/8UZVPotoyX6xZGyiDkmivxWgoE2HowTTMYSkEWYcc+tUKSctoyNTaE2sXbQVnBcaxazj+MWyC1T43vJWEQDojuGg7JooqwxJKYHzJcceV1bDuyUYG0UhMdR88lGC3VCErCX5g4/Vz8k7V1SudqLZ/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748029956; c=relaxed/simple;
	bh=B7ivfgJeKG6ORpMwQ6TTvaIfeyjPMtOvKMOcVgmHwy4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IX3yIv0afbBZqEDaJOshtqH4AGHqvT3ahWrWV+6ow09HFpctSaYq8zYG4SbNhIa6ScUBYZBLPSRxR6I2Kf8EGcIVaJkM+KCcjlxAD9LVzk2Z227nnLHqkER4xQA3NxhZq338ufd3acH6H9xI/Enre7ZcBnWUZ8IP4GoNfNCEZgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l0XBzMPV; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l0XBzMPV"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4769f3e19a9so1537591cf.0;
        Fri, 23 May 2025 12:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748029953; x=1748634753; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nrabLxj8R0+gWSgXlOCfum1YIagrx7v3OcNYJ2wlWMQ=;
        b=l0XBzMPVftKxiuMRhwCfNHjnoF2H0SGB0p2OibDcl1pp4NaKkAfTt9RnWLPwqBJLXJ
         biV1rGvlv2IWzReTOfEaBFzoa+y8Wg0gW1FGNPKeIHplrCgg22j4nAppvv6Q3vz5WB4x
         gTAB03ht9tu726Clwblh3nCADNAUcmQlRu2TJLkhDUsd3YRN0dt8Vox6z8fInjodjg3a
         B0SYxL4JCGzTrAeyKi1WDMRKeHoyJWz6k/9BqdXPn9IUfpoqzBp2KgbQh5byizwubWDs
         GQKHxsuR/yWXWivh0AKJdXU2BBUXlbaW0NJTjUnAWMtWY/SUmmvBZeutorHoip5tNUSg
         uuxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748029953; x=1748634753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nrabLxj8R0+gWSgXlOCfum1YIagrx7v3OcNYJ2wlWMQ=;
        b=D6XBDU4nHYER2FtER28e/Gx1PeXnoC0Mu9p6ldwTjlbTcn1O/dFwnFm2lfqUDMbOY0
         3d/7tnXgnTUeX2nYeIxtYmKubibaFU2pkWUI28dXkt6Y9BEl+M1XqCdWlxro16Rw5LjQ
         qlM/sIkALgdw1/w3a5KtPF7Ba9BVfYQP2JW+Ysm8gmu3MmMq3oUyVd1IMUfGgBU6M7UY
         n3CcG6fdWF+/DGuUYF78jFW8CTXM4rXJc7s0OxQOhdndR0Z6Hls2thtJH0IuA5z5mf/e
         ICdYubZH93NGcvGlZqB7Wz2V9AfZKlIXOGweGWNg5sz5E9OT/IpNQaaUWw510ug9wzVO
         lz0w==
X-Forwarded-Encrypted: i=1; AJvYcCU0Mq3fGYakUkOb7omj9rZwSV+OzrbeoigJgxlv3ILi0Bb872caj0B5hDKxJIt5NAjfqeD6PJgK+fBGjfw4@vger.kernel.org, AJvYcCVr2qN2gPd5wr1GuKZMq1QDmgUDMjugDgSuXTlOdHMjxkDtDH5lGOeAAqnuDKXpEHACfr54JY/SdxQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJH3QNler7NSiyWghQPN8WdHAv9hLRWahseaq/pX9VNlYT80n1
	Z92dV4PdDjfQJxK/+CinyOXkNZKYt4TXx1siuYJ9p3F7MzFQXaUO7nGM
X-Gm-Gg: ASbGncvQysiCjTrcpaXCIosyR3amAfqA4IwTDFB/DpfoalVjaJYBbbv7SC9NVmU3BzB
	fBQ2qW7UMWpupgTOtpWRUMCIm8xstZPzfWbAoU1xOTzN6RQk7vJkRbTrJP3N71Mt32iH/C4nPKb
	8sRbvinRu4tRYy+m1Al9tg5Zrrv27I/rmTjYmwyFnnRcWLNA4FEjrqwH8fda8WxFwv6kG32VtEG
	FGKaXPRQVg89zPRvePTndNOY4tal7mR5ljizAYQZ73DaUWDINi2eghAeF5+GbNYAyHGNQxm90PF
	dwCVnVKdkLz7rjbF5rqob4vWDXntMY+bnbTSSSo0Wgb6SHg5YkhUziBZBg1r1XxSLQ==
X-Google-Smtp-Source: AGHT+IHH0XRRoych4f6+KUaQ0fb+Mv8leaDYEmMTiTyLzMWDwUNEVCbrlUB98Jt4Nl8dDJzI/MYlnw==
X-Received: by 2002:a05:622a:1e0c:b0:48a:c90f:ce6f with SMTP id d75a77b69052e-49f46250cdamr9680311cf.4.1748029953273;
        Fri, 23 May 2025 12:52:33 -0700 (PDT)
Received: from [10.0.0.88] ([2607:fea8:bad7:5400:a4e6:39bc:5bd6:cf8f])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494ae4fd718sm117133001cf.53.2025.05.23.12.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 12:52:32 -0700 (PDT)
From: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
Date: Fri, 23 May 2025 15:52:25 -0400
Subject: [PATCH v2 1/2] drm: add overview diagram for drm stack
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250523-drm-doc-updates-v2-1-e517df152cf6@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748029951; l=2194;
 i=abdulrasaqolawani@gmail.com; s=20250522; h=from:subject:message-id;
 bh=B7ivfgJeKG6ORpMwQ6TTvaIfeyjPMtOvKMOcVgmHwy4=;
 b=qZlRVluYXxiLnxUM+U1LYVofi0MtRbN6PU6B4qsz+sqHVTMjWeu1QbYrt4R8LDBoUY/gzGH39
 hqrge9M3qLTDOnYpaHhjThT8fcXPMXGv0BnW005xAw94fD98yqyGe6X
X-Developer-Key: i=abdulrasaqolawani@gmail.com; a=ed25519;
 pk=LCvBseqd+rEj8B1vNEnSSfNcqQwMsfWx1DGDT1LYddo=

Add an overview diagram of Linux DRM architecture for
graphics and compute to introduction.rst
---
 Documentation/gpu/introduction.rst | 38 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/Documentation/gpu/introduction.rst b/Documentation/gpu/introduction.rst
index 3cd0c8860b949408ed570d3f9384edd5f03df002..91bb0efc96d69921a122c5265b1431fa18110a7a 100644
--- a/Documentation/gpu/introduction.rst
+++ b/Documentation/gpu/introduction.rst
@@ -14,7 +14,43 @@ including the TTM memory manager, output configuration and mode setting,
 and the new vblank internals, in addition to all the regular features
 found in current kernels.
 
-[Insert diagram of typical DRM stack here]
+Overview of the Linux DRM Architecture
+-----------------------------------------------
++-----------------------------+
+|     User-space Apps         |
+| (Games, Browsers, ML, etc.) |
++-----------------------------+
+              |
+              v
++---------------------------------------+
+|    Graphics APIs   |   Compute APIs   |
+|  (OpenGL, Vulkan)  |  (OpenCL, CUDA)  |
++---------------------------------------+
+          |                   |
+          v                   v
++---------------------+  +-----------------------+
+|  User-space Driver  |  |    Compute Runtime    |
+|  (Mesa, AMD/NVIDIA) |  |  (OpenCL, CUDA, ROCm) |
++---------------------+  +-----------------------+
+          |                   |
+          +--------+----------+
+                   |
+                   v
+        +-----------------------+
+        |   libdrm (DRM API)    |
+        +-----------------------+
+                   |
+                   v
++-------------------------------------------+
+|     Kernel DRM/KMS Driver (i915, amdgpu,  |
+|     nouveau, etc.)                        |
++-------------------------------------------+
+        |                       |
+        v                       v
++----------------+     +-------------------+
+| GPU Display HW |     | GPU Compute Units |
++----------------+     +-------------------+
+
 
 Style Guidelines
 ================

-- 
2.43.0

