Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AA220FA8B;
	Tue, 27 May 2025 07:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748330268; cv=none; b=lD0K28cEwY/dN6W9UaHyA3b2r2yLvH3DNNa0BPZJ/En6OrZdOy9KtfH/mOKwFZHAhdI+uCjCIv/+Wj/6JCKZfi04EtWt7HDKyeWwsq/Q6N57z+53t4hBS5yPVgNR9lAC/fBsA00PzRYU2YQFUY1Rlrx5pKtqc5kKXhUtT0xJxIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748330268; c=relaxed/simple;
	bh=N5M4+8n1PmoUW9waCKKJ4IbGWWLrQGiPXsfkC7Aswag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tas6axxxU27xJWZBUW70CYGRhew89Fa28fguypOFeiARD42l/UWYeX9nlwHzJBVktT3t2VSM7oVAp9s9y/jD/4khchDMA+r81TqpgUw50+8JFXFKgyYe1q6i3sFbSA2Ye5HvprCF3Nfd0SRhLa9scUmpssQwNDCBIJRJJKiQ47I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=INO/9q0n; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="INO/9q0n"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6faa01a3a5cso29732786d6.1;
        Tue, 27 May 2025 00:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748330265; x=1748935065; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lX1E9djvoqZC/1p7fFQRBXo8UbYPgCN+lFFXs6U2lVU=;
        b=INO/9q0n7ruHYoFcNb+7OLpjc0HXIr0SE8g/5J1IH1VvKCCDkdmDVs5AZL557tHt2p
         YrSsk0FLFSt/o0rLLF8M0tBR2CDglMuQMNdyyO3NNzEg7t3Z0jAJQBr8xtnzbnt8tgvG
         PdYy/jcweu14/tO5cxnM5w3+DnbaSZC+31+D0dudRmUZccjPzG7rASrWSnCemKd08LMb
         QtKa1Y2GN6M2cTJ7gRJkkhRGwFiPuXlLGBHQAs1pAmzJSd5/F08CrEtA5sgIugzuLo6I
         FlcQ0m2wT3qSs/qv549y0DMls+1laS84x1kZH81heOfR5HIfQ2r56Pg9H6Um5KJOeeD9
         OqKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748330265; x=1748935065;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lX1E9djvoqZC/1p7fFQRBXo8UbYPgCN+lFFXs6U2lVU=;
        b=Z55Wl33+5qJFCQI6eT03hyKzRxpwUh6kkIS82HJS3pxBmOaPlv7Uzr4EK5W1rR8MpK
         Is/I+su9OXX/0y19lxymYCVi8FOMHzOyt3BsW4e2bCG0nEttxaZHny/enPqI4vbtNt3X
         vFo/eIhAODE2fV9TjOi5j+sA7VNrk4wYz7kaoRh42meED/G8dgdDjPIhrhuJ83QCOqAv
         X0Br1JWJ2V9sXy8uKBT3lTDm13+cPKHddxcFIII2Bv/VqPzoATYrfFCgYZku1yMlUbSx
         5ovoC6c1Mw8aezm0UDt64KP6+9EkN8LtfEqw35bOEjBGE7krYR4gb1zEq8C7FtX0O/ze
         FquA==
X-Forwarded-Encrypted: i=1; AJvYcCUf8az0iibrEEXXZWJXGmFQnX2FbXOwZNureIxA2froB+aXVUiTGPZ2qAPMtJruCjrd0RTv5osZRwk=@vger.kernel.org, AJvYcCUzoHyo2hd9bM60nVtEqY7HbLWM2lDeaq0JQe+gT+JB790RN5Zv6Cfu/ZTwV+6c8lk9HfrpUxlH/2uf2fnR@vger.kernel.org
X-Gm-Message-State: AOJu0YyEuUTkPkWGB/YiJpPn/bGYkDm8H/2tH8f/CGqItHY0MpGLtOOG
	zt/isAIaXRIW6jpnXizlXBuC7ji2/suOx8ykspnGY34qpi+UZljQLfIF/t0Ho/29j4o=
X-Gm-Gg: ASbGnctvkzzO6D6BLG42pTyeEJqyO2HQ8Ds+HAZlAklJRGXviL0pIskdEd1zYYMIw7Y
	MY6Krb94aPuNhfiK7RtcHhnvJEUzq89qaYXFM9qGw/UCzJT9zjacfprW3CT7y+obSa2PYfqN02p
	ckIKlk86DVwNteUvRtYjnRikzT3fh4QlMHl0YSYZAe4HcXufFWysB91SWMjulcGw9q3ESqV7f7H
	9XvytwsqX9KUhV/tUNKjL8CoCT3icr4diWuUUjyGlbrdcH9jLgOyEnA8WpOaXWV714CScfxCiBm
	FHDyRqEZKbQdHsPF1WKC+JJJvMCJ1XFu5kLWzGRMnHW+HdMzBT//ZrOVdAk3B/OYxA==
X-Google-Smtp-Source: AGHT+IHCDSzd/TvfiLGBna/mEsbX0p3R29SQo842HETWpSNPG7weloGHdW6i0AXc7ZLVKDsMECqMDg==
X-Received: by 2002:a05:6214:401b:b0:6ed:1da2:afac with SMTP id 6a1803df08f44-6fa9d2d78aamr219074276d6.32.1748330265127;
        Tue, 27 May 2025 00:17:45 -0700 (PDT)
Received: from [10.0.0.88] ([2607:fea8:bad7:5400:6696:203b:ed6a:dd21])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f951b8e012sm89951266d6.26.2025.05.27.00.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 00:17:44 -0700 (PDT)
From: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
Date: Tue, 27 May 2025 03:17:43 -0400
Subject: [PATCH v3] drm: add overview diagram for drm stack
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-drm-doc-updates-v3-1-58e97a831d03@gmail.com>
X-B4-Tracking: v=1; b=H4sIABZnNWgC/3WNwQqDMBAFf0Vy7pZkNVF66n+UHmw20UA1ktjQI
 v57oyeh9DgPZt7CognORHYpFhZMctH5MUN5Kpju27Ez4CgzQ46SS0SgMAB5Da+J2tlEKFWjrKK
 qEYgsW1Mw1r334u2euXdx9uGzHySxrf9bSYAAEsaSrOqKP+jaDa17nrUf2NZKePTLXx+Bg5GiJ
 iskaquO/rquX5C81ZTuAAAA
X-Change-ID: 20250522-drm-doc-updates-3686f6d48122
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748330264; l=3233;
 i=abdulrasaqolawani@gmail.com; s=20250522; h=from:subject:message-id;
 bh=N5M4+8n1PmoUW9waCKKJ4IbGWWLrQGiPXsfkC7Aswag=;
 b=WlwY1CtivbbI4bn0ylIuUav0HGEaPMCoZw/i/K5Js3gh3NFVPPgWDMsnSQ8ALn8soU71W2t22
 NptewLvG38lA7r+1kW8jjc21VS3kysrtjKC+8KuhXkpjjzpzArVU0cS
X-Developer-Key: i=abdulrasaqolawani@gmail.com; a=ed25519;
 pk=LCvBseqd+rEj8B1vNEnSSfNcqQwMsfWx1DGDT1LYddo=

revert promotion of overview diagram title to that
of previous commit in introduction.rst

Signed-off-by: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
---
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

