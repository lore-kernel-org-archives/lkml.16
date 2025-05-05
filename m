Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341BA1F63D9
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 09:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746435606; cv=none; b=a5jq0nf8cOkSIY39EcgHKq6pD4kLWSbyGkUdAsCqa6ea5Jqfhwxqjprxfq1iGex46aRcYfTAO+PEegB6WKD1MLfJIGt25FBAP4HVGYoCermbrzMbLygLbVL5fttDVbw+8diO1EZTLeLdWJQhc+/IdeCyqe6VUWTQt6zfqPESeZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746435606; c=relaxed/simple;
	bh=0gWVNbRB11j6NzQheFtP3AhW2B6FSY8x/IiQjLkDkHA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SWRn2FCBAA709mEFrrzYIJ3N/j+aQkZz98eYsKWNpSbc/vk8P1+toxpMl6E1tNJQQd627vG+UOTBJH9NKmLTz6YQiHLKzF6ZSeg+QzIN8DScDW/FLE5z8kYODOeqSFFCAl5P49Vq+9qOVBin8a0a8s19bXWQXW2P8FsufisvZAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RWcbr5sU; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RWcbr5sU"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43d0782d787so24992155e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 02:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746435602; x=1747040402; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2aENDSHoBUQDncGi75hijmd8KFyNYGfXXoOg+4vaXxg=;
        b=RWcbr5sUp+Uef0fgr4Ax24U8C3u1Epi3ODDCvFI2trhRTXRX2/bLBXzPIkWM3FWknh
         NUgFmYIsWHt9UWZPfKI+VQ4mCbcqpg+hn2a+ZiPnYAC8xcf/QX4xMaOtZJkaXBrwa2sp
         JOifaKT949Y9cJiS41FHN+A5ZQ36y2HOs+D7seauLxS/0oBZMXzO+sFxYU1jNzgizQvd
         4B8DhavghLnZipPwaXVN+u8BGxjpUbjFF2Voc3l8hyvP+vXu41A5+CalU7YHhYXqYFG/
         K9PC5PqRHYZLp8wy/aCZFq+eDnU0qLs9s0T609+mtfVjHlnByqhd5zDbST11AQUwDS+i
         g8HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746435602; x=1747040402;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2aENDSHoBUQDncGi75hijmd8KFyNYGfXXoOg+4vaXxg=;
        b=oZVFlfHtQwN5BN3um+ZXZGIL5dMnPTzvC1+JjHwT7azD2ensq0j3PgW4XWBBYMwLhL
         HDYKL7UZFgf1sdc3P3/eESy1DMQYoGBrpKpMxbNtUKBlN6vpktc4ShrIjmkqEnyvRxtl
         8//yCTBWU1CmbSwki28gM/+k/nGOsJ0BQlnx4l1zdFZj6V5ouZHB3ndeURVbju2wNEzs
         gC+NXYcIJJ/HV2cqsppZqheD04bng54glJVsyQfTFdzIxsHvbDnx4m7lMvdtNjrmJvTx
         7jsYq97O/zsF5mkpNRbR4PjDelRrdtVRTeoaxKnIdCqhmmGA1ifnwSduE5Sk+9XZNAV3
         plyA==
X-Forwarded-Encrypted: i=1; AJvYcCVJD21FiwdnawrOBvy08fyYJzH3FtHq46q7aD71u0kpcr1sRN4r+K+B/PaRWB/qHmVCzj8Ige8pAzS8SJ0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu8t7AEvSYBivhgw6vLsE6aC8ndUpg56/8svvZXXd1PPSCjUpR
	jzHytTdO69FZoo6nj9C/t8ed9oxmdqycSZ4HVc3ttjOXv8RY3bHr21dk/WMZdpJRdLOt2BaA1z/
	FzXU=
X-Gm-Gg: ASbGncsTia+wfn8Gx7YjNogWwgaQYDvpTz0dm2zqcGAgvMX38LI+v0MaEEOP8+SPyKg
	OVgw0pkSakGU96Kz31MQLtfqxjZJBg+Vgf3xjAb4Ff45Apn+0G/ZPTQ5mRrvFRgDBGgkba51EJu
	avbU1KndjXhJ1AX8RlxEbJ6fK3+uAmIEgqrt+dp3DuXm6C1pDKBdE/Nrv9RnflWHiUpcdR4bBLI
	mQ14g34uaysXvcAExa+tfbPdpzB1ZXTMl0hmI8EfqDX893Ci17pwYHxkzmhDt2l63zXnrSoutty
	+vdAWu9SaJ/Hm90j+dsBbBwhNKUT2+tHhxQYGa0X5SbWdHpVKo5fe83vszFHkt20H+pn9arU9oM
	55hcqRoc/EijnB8k=
X-Google-Smtp-Source: AGHT+IGg0Vn+z3bbOg/uzaXcU9oRZ5gyFrNKK7mD8WX6VvRKSYjefILs7xFlLJvJAY/rZ0IGfGWxiA==
X-Received: by 2002:a05:600c:8283:b0:43c:fe5e:f03b with SMTP id 5b1f17b1804b1-441c49483f8mr58600635e9.30.1746435602452;
        Mon, 05 May 2025 02:00:02 -0700 (PDT)
Received: from [127.0.1.1] (adsl-186.37.6.163.tellas.gr. [37.6.163.186])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2b28045sm170432475e9.35.2025.05.05.02.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 02:00:02 -0700 (PDT)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Mon, 05 May 2025 11:59:16 +0300
Subject: [PATCH 3/3] virtgpu: deallocate capsets on device deinit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-virtgpu-queue-cleanup-v1-v1-3-810923da2b1e@linaro.org>
References: <20250505-virtgpu-queue-cleanup-v1-v1-0-810923da2b1e@linaro.org>
In-Reply-To: <20250505-virtgpu-queue-cleanup-v1-v1-0-810923da2b1e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1065;
 i=manos.pitsidianakis@linaro.org; h=from:subject:message-id;
 bh=0gWVNbRB11j6NzQheFtP3AhW2B6FSY8x/IiQjLkDkHA=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FLQVhjcHgzQi9mZ
 25RQWNzbVlnQm9HSDRMbDdqamlhQ3I0b0s2OVo3LzBzKzdVNWx3CmpudkIydlE2b2hCOEdXWElV
 ZzJKQWpNRUFBRUtBQjBXSVFUTVhCdE9SS0JXODRkd0hSQjNLY2R3ZjM0SjBBVUMKYUJoK0N3QUt
 DUkIzS2Nkd2YzNEowTHZSRUFDUkIrdGM4Sk9ENzJTL3lzM2JPWDhFV3RaLzByRWszRm9aSnpWZA
 pTQ0RSem0zL1BKeWZmeWMyYmUzS3o2RDU3SkFjRzV2dERlOFJFbXNxaE5GUmlrdnd6RVZnOGo5N
 2NrNTFsZHR4CnMxdC82TmlXYzFlZmFXMTJNNVprWGFwdVpPSVZ3SVlGUVFwY1N1VDg0REtMV0xQ
 UnBqTG9BcmFSYTE2UndaRk0KWEJWVEl3ZUg4WWI3ekluMzkzMFVKckordDgxaUg4bUFFTlFjVHB
 PVWFxMVFCeWE1U3FHK29aSENWTFV3b21kdwpwS3Z3ajBKMW5MM0VvTVJNOUhLUFZPRTlpVjdzVk
 RvdnlDRHlNM3M3T095OXJ0elk1c0VqYkhxK3ptdWJrU1ZZCmhsRWNKUkRVYk1yVnRBSGI0Zy84d
 GxzMGp0OEluUGhERWg1SmNTeTlJYnpwWjNVQnJxNithNEpxQ2M3bzVzSjYKUUg2YmJJelZYZlkr
 VThvamc3a05VSGd0V0lYc0VNOFozeUhhcG1NWWVzRVhMWDRCTTdjMUxIK2NoT2syRk54UQpjWkx
 HblBlNVl3ZkFQQnYyNkJCUnhMdFhvUGZRNGJqdWd1YnVnTkRsQnNNajFnOHRUQmhBZ3pIMkZ1bX
 VjdDJHCkhBcjVaTVR1N2JUYVlPQ2dHL2ZwNVZzZERWYWd5UTliSGpubjNqS0RlWjR5Z2hFcHlQO
 EtydjdPV0JzVTZpdFEKR1Z5T0RNUi9JeXdycjFuNUVGQUtaOHQrRjk1MmtmWHZlVEFPQkRxZHI1
 WS8ra09OckRpem5iVnptcDZzbmx0OApURFpab1Mxa1d3ZDFEVGR5cm96T3puajRYQ00wdTVRSGZ
 sYWhPQWNhdjJZY0Q0ZVRTcVl4b0hTZFlONkJoZUl5CnluUnNNdz09Cj1MSFJmCi0tLS0tRU5EIF
 BHUCBNRVNTQUdFLS0tLS0K
X-Developer-Key: i=manos.pitsidianakis@linaro.org; a=openpgp;
 fpr=7C721DF9DB3CC7182311C0BF68BC211D47B421E1

virtio_gpu_device's capsets field is allocated with the DRM memory
allocator but never freed. Add the appropriate freeing call inside
virtio_gpu_deinit.

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 drivers/gpu/drm/virtio/virtgpu_kms.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 7b3c4d314f8eee692e2842a7056d6dc64936fc2f..a8b751179332b9ec2fbba1392a6ee0e638a5192e 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -286,6 +286,10 @@ void virtio_gpu_deinit(struct drm_device *dev)
 	flush_work(&vgdev->cursorq.dequeue_work);
 	flush_work(&vgdev->config_changed_work);
 	virtio_reset_device(vgdev->vdev);
+	spin_lock(&vgdev->display_info_lock);
+	drmm_kfree(dev, vgdev->capsets);
+	vgdev->capsets = NULL;
+	spin_unlock(&vgdev->display_info_lock);
 	virtio_gpu_fence_cleanup(vgdev);
 	virtio_gpu_queue_cleanup(vgdev);
 	vgdev->vdev->config->del_vqs(vgdev->vdev);

-- 
2.47.2

