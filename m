Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717696FBF;
	Sun,  1 Jun 2025 22:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748816334; cv=none; b=AU8ZGPZ/Jad7WtF3b1liwgq952N4O8kU2JkOH5ZEE/iC3082YAIslwyRweUO9S+ReUZYy8XisuTbV6VpnxKcW3c+ysUm6urXiKedJPeN8EVeuQcbE1nG2gOVTC9BLEo0Y5MoZ/YI3QueBGV3lGyUgLOjZz3ORDmxfGO/5MdPDpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748816334; c=relaxed/simple;
	bh=q5bj5dHeAF0jw1D9B79SOZIYQ/2vhai+oYehV5QXNxk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LuYjIsMRH6ugs7Sn5wSJ+pWaI7I4kOh4oausenIUpZzniNI4OsZ7Pd++Nyot0er9fyB+oe+Q3KA02gyqjQ6/5fFX8PLrmhho+M4oewE33jdNoNZG2u+eHFgfCLXfTgu1INDK6y0EQWi7cgR2wXKuYuj8cqcQQ6SRUVT1zvkRMqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fandLP8Q; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fandLP8Q"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7d0976776dcso355116185a.2;
        Sun, 01 Jun 2025 15:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748816331; x=1749421131; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ASuAMgM5DsTFJTj9WldWE2aobhWhSAfKBSNCSHlRwfs=;
        b=fandLP8QL8Z87QpfDJQiUUuOV3AGQf3IxmE+XZZSTbkgZSXZrPEv8mDIoYDkzQqThl
         rW9hj41AnVlNAIKY22V/ztnMWWERGKVKCd8oXR+NFXNzbKs0q2XwZpiYDADGCz6Tq7rV
         G0uZ7JgJpFDRd4B5GcJM9pK+S0YUjV2FvRDkERhxMawLN1q75itxlIrSe8T+jlR7ofrV
         QwzSgWlt5kdWhlY2DgIRP0tntNwdmYu8ea+dtMgsnFsT05PMWq6zokbewAb6AkyFq2M+
         jPDISeSY2+EHokAfJXzSnAwDsRIh4y9kD+5x28yPSJ3r5nQffL/V1nE/uSXQMCvaO8YA
         5BRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748816331; x=1749421131;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ASuAMgM5DsTFJTj9WldWE2aobhWhSAfKBSNCSHlRwfs=;
        b=eJ+Je7ECkOIqZ0hpfRwqwn9KmG2AH8dTUFdMtuRf8iUCDbOLLBTvYBr6AqGnrZyal7
         XKL6fe2B5e/vPkVfoQgrRhdl1zT8C8XhOnpQGwTRdr3TFxGPEIFMl3DWr+L8DS+Gf9KB
         ziB5M7v22G5okdPqyPw+aicJ92NGl926ccQACinb79ZQNQAb7StFoQ9PIwpsmk70Yjh5
         W2cuGsb1TIVzKg9gpWmVOgtced+ebXt4+ftZpQnBxgCGgb1YAYLfhMPe8w9I3lrmzXiu
         GmDpuM4PFk0Qai5l+WLlVVAIMNtiBY467Fz4TRfF5mccDq0jOWsVzm+nGe27arG0MbcJ
         xP5A==
X-Forwarded-Encrypted: i=1; AJvYcCUyxHH2YJbgwoooIcfJtu0bZ205h44BI/OCNWnr6EwSdgKkiGrVpOwEPiZsSUbU3zottuyTIKmP27g=@vger.kernel.org, AJvYcCVSt83SrcntSsk5PAu3esYW3uPmzq8B55rFEQZ7VDpbukHjJnwqaX3Bs5v/No9Y2xEbTsWQSK50/UdABUM/@vger.kernel.org
X-Gm-Message-State: AOJu0YxyU6SponIBU/JxkTsCOSOliPQmXwzAGHXw0FjKblhfMV06uT9D
	BhMhvtc2mk0tQ8OH8yGqdnYg5rkF3p1R7FEyafkfkZFIwo2LIE9cA1lP
X-Gm-Gg: ASbGncs6q6pu4abQfYMi0uW6n2yrxSXtciQzyd43vDgI4eFzRLlPgE1gsxZYt1W90Dv
	anXkoYKXxK8krGUmsiVHUsukH9TOqCVvQRGjY/yA/U/3PkhaJS9CI+hXRT096RKdeiwuabkWErh
	jDmuueATmmdEqwvffWf6P9IyMQ8t3lWYDYyIrxGXb9Zq76+QJWyHG/QhR23Xw7iUDBX58MZGmcj
	XXkhqwNZnawGQYIQ7rMeJEEmCWoQQS6NCVHybMJ/I/FATkfwcd7hv1CPrGQarx0W0jzKwKJ6jFA
	pSq5Vw2P9pB7YpE1zF91ILQRLSe0DGwsg1tc/oDY0uFSpfZO6Q9rWlh2mTxptVbtAA==
X-Google-Smtp-Source: AGHT+IFvrmdqb1Jbez/1pqAFUzOD1aoANA/UWpASTj5vWXRE59vvCBBQj7T26GKh6jtI6UAtH/NggQ==
X-Received: by 2002:a05:620a:458b:b0:7c5:65ab:5002 with SMTP id af79cd13be357-7d0eaccf947mr1097655685a.49.1748816331192;
        Sun, 01 Jun 2025 15:18:51 -0700 (PDT)
Received: from [10.0.0.88] ([2607:fea8:bad7:5400:5458:c6fd:17d9:9820])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a1951casm536030285a.68.2025.06.01.15.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 15:18:49 -0700 (PDT)
From: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
Date: Sun, 01 Jun 2025 18:18:47 -0400
Subject: [PATCH v4] drm: add overview diagram for drm stack
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250601-drm-doc-updates-v4-1-e7c46821e009@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMbRPGgC/3XNwQ6CMBAE0F8hPbum3VJAT/6H8YDsFpqIkBaJh
 vDvFk5E4nEmeTOTCOwdB3FOJuF5dMF1zxjSQyKqpnzWDI5iFijRSIMI5FugroJXT+XAAXRWZDa
 jtFCIIqres3XvdfF6i7lxYej8Zz0Y1dL+3xoVKCDFlkyap/JOl7ot3eNYda1Ytkbcer33CBLYq
 JysMljZ7Nfrrc/3Xsd/U/ApLwutSOqtn+f5CyLdqyguAQAA
X-Change-ID: 20250522-drm-doc-updates-3686f6d48122
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748816329; l=3417;
 i=abdulrasaqolawani@gmail.com; s=20250522; h=from:subject:message-id;
 bh=q5bj5dHeAF0jw1D9B79SOZIYQ/2vhai+oYehV5QXNxk=;
 b=sjsMrBAa7gu2PoEDTIe+RBXPWGT4CuRLEafyGtWYHvOlDONiQzwpYYmo5l0FI/+XGq+fkjsus
 pSEv0WevVJoBsq2PwUBQZtAeEHuTadQ3flbJV7IY2822TGRCzWuLpqn
X-Developer-Key: i=abdulrasaqolawani@gmail.com; a=ed25519;
 pk=LCvBseqd+rEj8B1vNEnSSfNcqQwMsfWx1DGDT1LYddo=

Add an overview diagram of Linux DRM architecture for
graphics and compute to introduction.rst

Signed-off-by: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
---
Changes in v4:
- Ensure patch description describe diff adding overview diagram.
- Link to v3: https://lore.kernel.org/r/20250527-drm-doc-updates-v3-1-58e97a831d03@gmail.com

Changes in v3:
- revert the promotion of the overview diagram header
- Link to v2: https://lore.kernel.org/r/20250523-drm-doc-updates-v2-0-e517df152cf6@gmail.com

Changes in v2:
- Update the overview diagram to display correctly by putting in a literal block.
- Also update the overview section diagram to a higher order.
- Ensured docs are successfully rendering by building for htmldocs and pdfdocs.
- Rendered pages are okay on html and pdf.
- Link to v1: https://lore.kernel.org/r/20250522-drm-doc-updates-v1-1-d1efd54740bd@gmail.com
---
 Documentation/gpu/introduction.rst | 40 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/Documentation/gpu/introduction.rst b/Documentation/gpu/introduction.rst
index 3cd0c8860b949408ed570d3f9384edd5f03df002..a8d3f953a470180b395ec52a45d0f3f4561424e0 100644
--- a/Documentation/gpu/introduction.rst
+++ b/Documentation/gpu/introduction.rst
@@ -14,7 +14,45 @@ including the TTM memory manager, output configuration and mode setting,
 and the new vblank internals, in addition to all the regular features
 found in current kernels.
 
-[Insert diagram of typical DRM stack here]
+Overview of the Linux DRM Architecture
+--------------------------------------
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
+
 
 Style Guidelines
 ================

---
base-commit: 4d07f5440d7afee27dada528aaf5230e760531cb
change-id: 20250522-drm-doc-updates-3686f6d48122

Best regards,
-- 
Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>

