Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B47A26FA51;
	Thu, 22 May 2025 22:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747952432; cv=none; b=AsTLK6AFOEiVJ7FH5pD2sY/xskRM5sFfdKOZORTERvsa8LhWXy/DzvRvnRokuYZlpMcKD6053XUmL/GVa2w8TMbcsMcnwHfsO1QuiAl8aN7k6C925qGwk96LJFWnIsyWUcEzGDsjjrh3h1ZVQ6MQ80dBhwnlGRUUntUakc+9GbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747952432; c=relaxed/simple;
	bh=ZYhfgkctRlGBztjQSjU09xCbZ+lb0KOYsCwJ4dRgW7Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Ia9/DomAQAJDsju3VWzkZU7rNhco+ElGQ90WJUeU1KbkEUqmELY7zyRE6zpTcNw4qqV+nioApK8YRH93IF7dyvrJt/PBKLVeN8ElbIaKOY8Ikt6ASMZrZfKjMZIjJfBvcahybQmoaYmQrOBCyZCVRm4f4JaDW55wloTsiaybAKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KpKmnZsr; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KpKmnZsr"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4769f3e19a9so57904461cf.0;
        Thu, 22 May 2025 15:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747952430; x=1748557230; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5UQYzm0ZJraz8sXKO0wiUzEndPZK9OYi59VPMyNIk0w=;
        b=KpKmnZsr7YmcD97q5TBmZGZvaMJ2AOVU6c9t7SMge/pSg4FO6U6oI+MED0BboD7UKS
         jIKW0GX1ML858GwgUqmuV+RREUACTNnTKpXVZ5MUBrLXTuNyrYTMmAZxOc4p2VSTVKld
         9V1/8rVckdMfftOSTB+HHUZkvLo3HZRGs155hApp6FouAPkO7KmabglmHwQlipu7Zj9U
         RvwmfSsw+d1+lw7lYEl754BgNosWXvbwe3iobdmcUmUES6RWorp6V8b7UEMpMHSacO2v
         TPsPjpGX1rffaohpjT+k1It8hKVe8rdjR3W36e4+8zMc5B2qmtp0p1if7v5qgqss+Ncq
         hLVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747952430; x=1748557230;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5UQYzm0ZJraz8sXKO0wiUzEndPZK9OYi59VPMyNIk0w=;
        b=tJIhJiY3Knsed6HtqxfSNqFDLlEax7+Qqt7x/FRIcFe/kNJBMAphyC0hvETL5sE1sB
         Y6vbCiJ29lZjUp2robS6gSN3xKc8DTcmI6LMEx8m9RH+GQi3zrY4ZsPPhDxJJ9xh6BTF
         vSbQUrn/sI48kliOicpXXSS8iuTzMFWdx5Tz4UzjUwAx4P7kF5FWfshhHUzmjDrXi9CZ
         qw4rVnTsyZOdozq/VbCRqbTQnZrfxtnGad+B46PKYTnUigK7jbqd+LthnKMiwe32OsDu
         nb2e0xIDdHOpUIKjKe+8G49ucGP5LA8/xNhjyhkacpbGyMNbyabLd476Ac5aBKz9qchT
         BhgA==
X-Forwarded-Encrypted: i=1; AJvYcCU70oPmXz0HpcI31SQIti1Lc2M4Nhz1ZnvIxWo1BwbaJFR/XKMz+QKH2QKNI3uBkEb05wTAfmO67BObSxT4@vger.kernel.org, AJvYcCUXcATsAYxuJb/XhGAQgXZ2I1hZdUGeCnrAeaQtb6KBxP7tetu4cI6Y94cWcU1iy2yuudghDyrXgJw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwF+CqRT5iLviCSwtd9jEL7qtWyDRBpyzQFY+kxlOaSgBhhf7dY
	qmQ4XzbARnjAq4sQbEWlqqPCyAXmw2DY21fBQrruIuHgRILFNeQbH16VkXIlfoJPhSk=
X-Gm-Gg: ASbGncswymLkJz4Vi2p5qFWRjsqcnun7qRzogYqVeKmK8/mKYoKi+VGwA+dKVWoXF7F
	EJlTuOWdvg6Z42bg4DR6T+3mj1S5Xhe04kKHYqf9VAEZA59UmeGHgVbS+zMyZXD2sFpVmprlw8f
	QRg+2mLsSXH+0mfvlq5WAcBqUCasCXM0mVabu/JOnMM+I1ljCckXRo2poNgcgG+M/IWr74zgXHT
	20jt3IQ30H+GOFw2kCojELegovOR4GgAlQmKRY6jAXwvgAkTAZYOdb/IFwZ9IA7G7ezSDx/KnOC
	2JmM2NjV6xTHQXo78dTSRn5m8ALzh3t6dhZRllnFp4GQ60ivMGfWQW6FV42Ycq1Bjg==
X-Google-Smtp-Source: AGHT+IEGKhSwA1k4ZU8DE7NGlukAyFisFUtMYh2J09r/PQ37dVzjG4nN82sPMWZr0i6vtMJ9GqccaA==
X-Received: by 2002:ac8:5d53:0:b0:494:b258:abbf with SMTP id d75a77b69052e-49e1f89fe0cmr10113391cf.52.1747952430059;
        Thu, 22 May 2025 15:20:30 -0700 (PDT)
Received: from [10.0.0.88] ([2607:fea8:bad7:5400:1d7c:4b6f:e2f5:660b])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494ae4ff75esm103652241cf.59.2025.05.22.15.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 15:20:29 -0700 (PDT)
From: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
Date: Thu, 22 May 2025 18:20:27 -0400
Subject: [PATCH] drm: add overview diagram for drm stack
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-drm-doc-updates-v1-1-d1efd54740bd@gmail.com>
X-B4-Tracking: v=1; b=H4sIACqjL2gC/x3MPQqAMAxA4atIZgM12iJeRRzEpJrBH1oVoXh3i
 +M3vJcgSlCJ0BUJgtwadd8yqrKAaRm3WVA5G8iQNZYIOazI+4TXweMpEWvXOu+4aSsiyNURxOv
 zH/vhfT/Z6DzIYQAAAA==
X-Change-ID: 20250522-drm-doc-updates-3686f6d48122
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747952429; l=2433;
 i=abdulrasaqolawani@gmail.com; s=20250522; h=from:subject:message-id;
 bh=ZYhfgkctRlGBztjQSjU09xCbZ+lb0KOYsCwJ4dRgW7Y=;
 b=qc/IsRH9KqrApyEmH1EEjMxejZ10GrXbPhCG8fcGAi5w8QfBZ/qRLRDFu0LKoSPXggn+mXjHQ
 tL3gJRwbyAxBn7/1bgSi6DfRkVtOm5UsGXRuLGQHbhjqaHwIO+aBriA
X-Developer-Key: i=abdulrasaqolawani@gmail.com; a=ed25519;
 pk=LCvBseqd+rEj8B1vNEnSSfNcqQwMsfWx1DGDT1LYddo=

Add an overview diagram of Linux DRM architecture for
graphics and compute to introduction.rst

---
Signed-off-by: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
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

---
base-commit: 4d07f5440d7afee27dada528aaf5230e760531cb
change-id: 20250522-drm-doc-updates-3686f6d48122

Best regards,
-- 
Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>

