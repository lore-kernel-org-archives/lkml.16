Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0251F4616
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 08:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746435601; cv=none; b=auWZv1qaXoLEnMurEwIZT26QFRFmNgtbKQ+fTJd9KJMqPowrP/Qj1jBs7L0VOaf5HT3f1Wj/BnJDAqjeOGYvfvBUjWQTX1eYyPr2igpt0ZHGqouwVOcPHE7LuwwHF2rp5UxcbVekiu4aRMiU9MKcItJHdQr2sMEh4gqu9ZG0/94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746435601; c=relaxed/simple;
	bh=sjhErN8ONkfCqIGOTbBvg7YELbUIF3vZ82Dti970nCg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jv87aq6zidp7JwneOdeIiPsbawjXMpU0rHOKmIXzPfXKtoGvzWEOnTOXy/xRyq8yhZbW5lb/H+rMy7FUunfQCzZl272eM8Q8q3nRMzJI14dGpp2DfK2MMgKDUlS7P6tZsobKZLrP6QaZc8OxYQzyrYtBY3LSxfJmYblzNL+Hjxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hnGvAxIc; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hnGvAxIc"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-441c99459e9so5964645e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 01:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746435597; x=1747040397; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6RkMkpBzcyjYKHLAajmFVhljeyOe8/zIRKVfPqj3cNg=;
        b=hnGvAxIcUmDx7y0+E5OHIj5h6RH2ijtzl3tfCbSdIl6kc/UbgyJMy5JnmNel2oDfFA
         AVlJqB+O7FUnHCJRZ+JJuOO0euj+HWr0AT4/48Sgxb+F5/kK7kLhebo/0YExg4fb+13G
         v8rdvECZ0UfC/Drstq1bsJ34JTOXxkid2mc1bYR/7Ngld/ZYH1TQPC3OP6xkyUrtIhJT
         oZsF2mbDaHcdJXejk5LwEwHWQxiLDf1ggYNor23daB8WtnXM2u6eNCcSXJgnvOO207wA
         3+KOztbWDVjJn0EZbTvcpl5HfkcY2+0U6uGHJK2DqOCu4Sy7Ym5TJKZ28gdEv7jLRF6e
         OQ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746435597; x=1747040397;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6RkMkpBzcyjYKHLAajmFVhljeyOe8/zIRKVfPqj3cNg=;
        b=BfklXV7C2qfaEoPkGtfTVFvko9WVICqly+abpDQq9ATbjGZU6kTb3mc/bUWvFj22TG
         2zX+HmW6bkZD0hncKFKVh/BuUFxpYZw99mLCfd6eLz0pqw3m2a0tneoLoQDA3pUv4Azt
         4qNZXhgSHkq3GSzEjwQU+jfcYqUARwVogWQBo6zb+TWmZgG1mMN7ES4q7du+uVE7wi06
         Jm2NgTSghkK/A5Hs3hepbZ3bRNhpv3SkMdN6hthe2+ulU/mQ/O3VY0t8zCTg47pJ5C1M
         vdxetAnJe5QpQchlJrEom7EzGxJmYHzDnOjyIphoG6GoleObYxL8jzTaUEOqdsJVXW2e
         DdwQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8R7i+nbIz5/H2DelfyOedp8B15c+kl6tCDR8u4RVcslcK5SLw344pBDTiQv1fdMGyyisGrRBlx5p7pyw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBH8a4fO/aEa7Kx968Zxq1lEvMfLXE3VIABb426Wt1SdkzAoLQ
	N1c3s2ogxgMRnOMq4Bm51AG30zeqFUDRyMqc5zJ1Q6XyZwRmQW4xzXKGNP7wcak=
X-Gm-Gg: ASbGncuc32khnPmzStIt0mai6GLLF9neqO6aE77VZ41DjfdSOAJYIsFihoP4Nuq40YP
	+8sgpO1DucADkue//ewAO/w/n3EbHBWtLUUhx8LjEDl9/JrXNFGXyqb5Cx79Tfjyea6fBGfxOo/
	DriwttvJdiVWMbc412g/0n+JHr7XYlLdSld+H8nzwrxer6Fm/LvFSqQDIZ3SvmsXWKo11ItWpTm
	IOF4cLQrbHo9jG+WxZvIWlgSKSKBp2aBH4fJDWeXbNXVKmKj8BvDacMOSz2KnhP7Bas5GowIlE7
	Ov4npiVrJZ9INgjcyjg+tvkIGaTx7X2HBrDxTvOj669Tl8/kIMZkCdrJx9iAjKzxk/Oz0HeLSjQ
	eeHo+
X-Google-Smtp-Source: AGHT+IGz03kxWiSqV9ePHTaEbXPJFvgSx8RYWlEikxqBVx5QFRHF98Oz1fX+szduVQOs2J05BoLuWw==
X-Received: by 2002:a05:600c:1987:b0:43d:49eb:963f with SMTP id 5b1f17b1804b1-441bbf33b31mr92931135e9.24.1746435597433;
        Mon, 05 May 2025 01:59:57 -0700 (PDT)
Received: from [127.0.1.1] (adsl-186.37.6.163.tellas.gr. [37.6.163.186])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2b28045sm170432475e9.35.2025.05.05.01.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 01:59:57 -0700 (PDT)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: [PATCH 0/3] virtgpu: fix memory leak on device removal
Date: Mon, 05 May 2025 11:59:13 +0300
Message-Id: <20250505-virtgpu-queue-cleanup-v1-v1-0-810923da2b1e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOF9GGgC/x2MQQqAIBAAvyJ7biEND/aV6GC21UKYaUoQ/T2JO
 c1h5oFEkSlBLx6IVDjx4avIRoDbrF8Jea4OqlW6rWDheK0h45kpE7qdrM8Bi8SuM8oY7eykF6h
 5iLTw/a+H8X0/UBzqqWoAAAA=
X-Change-ID: 20250505-virtgpu-queue-cleanup-v1-3392995cab5f
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>
Cc: =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, dri-devel@lists.freedesktop.org, 
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1478;
 i=manos.pitsidianakis@linaro.org; h=from:subject:message-id;
 bh=sjhErN8ONkfCqIGOTbBvg7YELbUIF3vZ82Dti970nCg=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FLQVhjcHgzQi9mZ
 25RQWNzbVlnQm9HSDRMNVJZZVc0VW84d0ZUemw5MXpVb3UwRGxLCk5JT21sQmpCc1p4aGJUdU01
 Z2VKQWpNRUFBRUtBQjBXSVFUTVhCdE9SS0JXODRkd0hSQjNLY2R3ZjM0SjBBVUMKYUJoK0N3QUt
 DUkIzS2Nkd2YzNEowSGkzRC85aHdCZ2NOR3RsNHJGVDFPa0NxMDlLRDc0aU1FYW5Ec0J0eUlaMQ
 p0OTVJK2hVVmFsL3UyZDYydTgwZUFObzRYMmdKb3V6enRPSjRtMUUyYW9JWWt5Mzl5cW82QTJqV
 XJKQXBCQ21WCm1ld1cwQ2NmNVpaS0VaYy9jUU8raFExalgxbC9xclA0MGRERDBWdWhHY2NEQkpl
 QkJ5QTRIZFlqS1RIZDUzYlMKVHBKZ256ZFFBWVlkT214U2J3em5RT0FhbEV0RmJqUk1SU01QZjB
 LWkJ2T09wTGprOEhUQktMQURRVTVqMW93dQpTYzlXRFU4dy9uS3hCTU90ZmdraElTUTc0emlKRW
 ZGdjRTd29BMVFsM0NaZ213TTRDdkg0dXZFZ25nQnIxakVFCm96WGVlRFZHcFdJaURCT1ZUdnRud
 zM2YUdPOTl4SUFrVmMwV1BFV3lKVk1QcUlCd0FXRWF3Vlh0SFVMY25jb0oKWUJ5YXVCUS9JdEd0
 R2hBNzhvcDFpZXNkRTZXajJHbUtYd3pRNjFNeG4rWTlOWHordE4wNE0xK3V3UmJ3bkFUUgo0RjF
 tRGF1MnRUa3ZCcld0NXR4L2VpMGtwRGJka3Z4bXllWVRMaWFHQm9CUEY1QmJQckxmbW00d3FVcl
 VqY0x3CnNnVGR5emZGRzBsYlhSS1RGcm9OUUZtWmVGNkJzemJJQmZtSWFGUndBNVNYTnVURXdze
 ExlakhsSFFia0dheWwKRjg5RHNabG5JZG1hNU1XTWNnNWJtMXR4dG05NGNyejhLbElERXorSXZG
 Y3JwK1UwVXYyK3ZramMvWlpXS1AwTwp5c2xVVWs5SG9DbWpVODJhd0s0NEdGaW00SEcxVTZON3J
 kcWtGZ2RtUS8zcGJtQmlUaVVuc0xMM1FCZWdvVS9RCjk2STlOZz09Cj04MU4vCi0tLS0tRU5EIF
 BHUCBNRVNTQUdFLS0tLS0K
X-Developer-Key: i=manos.pitsidianakis@linaro.org; a=openpgp;
 fpr=7C721DF9DB3CC7182311C0BF68BC211D47B421E1

When a VIRTIO GPU device is removed, it cleans up any command buffers
that the VIRTIO frontend has responded to. It however ignores commands
that have yet to be replied to, which still reside in the avail rings of
the virt queues. This leaks two type of objects:

- VIRTIO command buffers
- Fences

Furthermore, if the virtio config has num_capsets > 0, the capsets field
of the device is also leaked.

These memory leaks are reported by:

- /sys/kernel/debug/kmemleak
- slab debug options "BUG virtio-gpu-vbufs: Objects remaining in
  virtio-gpu-vbufs on __kmem_cache_shutdown()"
- drm:drm_mm_takedown "Memory manager not clean during takedown."

This patch series adds cleanup logic in virtio_gpu_deinit(), after
calling virtio_reset_device(), to free any such allocations.

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
Manos Pitsidianakis (3):
      virtgpu: add virtio_gpu_queue_cleanup()
      virtgpu: add virtio_gpu_fence_cleanup()
      virtgpu: deallocate capsets on device deinit

 drivers/gpu/drm/virtio/virtgpu_drv.h   |  2 ++
 drivers/gpu/drm/virtio/virtgpu_fence.c | 12 ++++++++
 drivers/gpu/drm/virtio/virtgpu_kms.c   |  6 ++++
 drivers/gpu/drm/virtio/virtgpu_vq.c    | 55 ++++++++++++++++++++++++++++++++++
 4 files changed, 75 insertions(+)
---
base-commit: ad10b82c2bcac7f87ac6eaecfca33378b43425ee
change-id: 20250505-virtgpu-queue-cleanup-v1-3392995cab5f

--
γαῖα πυρί μιχθήτω

