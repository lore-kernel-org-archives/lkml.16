Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com [162.62.57.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B591A9B4A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 09:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749462139; cv=none; b=oFbOHGOiJj/AATcwZVG0P9JiaZpj7owiqbuGnKMmEsF3YJl2mJzhsGQRjEg2mG2rc7oGftk9CdrOVzYF26LR+Eots9GC182xapFZ3lOmgY4XIgKhB/bA/PpKGnaXDfXaVo7LxZqOm+4kfY8SRpSRLKXATg+0q6lgcYHLOjV+28E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749462139; c=relaxed/simple;
	bh=J7mLoh1aLU4DUG0BRSUYMk8gBlLVQrv2yNV/Kzdr28w=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=LatJszqJPUuDdkip+vTK2jwxyovBUV2MDuDfxdjGCjD/ocebZJmTunFwITvOMuvK9BpAVeIIUz/b37HDl04bjXXrXT0IfV6rNbBqb0xUDnoMmRK8K7qcsuopyhybzYNq3nCLout52kWCB2lmWxXlDGGKV8/Wb/386BEtqQUt0Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=awaiqv0L; arc=none smtp.client-ip=162.62.57.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="awaiqv0L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1749461825;
	bh=SmniMHqvZWFuqEmiIWWjPLL01AF0Q8ESLGE7t/Sogxg=;
	h=From:To:Cc:Subject:Date;
	b=awaiqv0LLkoQMVxGIPZOZdnh5znT+4wJqhNruWBIyHrgjAzIy3oaeNj1X/Ng2Qpp0
	 6N4SHKgpeERHGraE2hmtfUSPkkdHcUQT2bENF6dD3F02p4O/9BZslwJ634Fa+5D25Z
	 TBjzM6EcvTprcbYSRSZXSKw+N4zP3ytyAgdB6mZY=
Received: from localhost.localdomain ([58.208.27.5])
	by newxmesmtplogicsvrszgpuc5-0.qq.com (NewEsmtp) with SMTP
	id 927B7009; Mon, 09 Jun 2025 17:36:39 +0800
X-QQ-mid: xmsmtpt1749461799troe02dud
Message-ID: <tencent_03FB073FD3015AE02485DD6839D6571EBC06@qq.com>
X-QQ-XMAILINFO: OQac6g2KrvnW0ceRmcxfNhsHzSagz0pC/3jPClfdEiuQtKjOS6oANK6zvhUWk/
	 LLSKJVCrZ6/6JoYrzqUQeapXBgQRtSEOJ6n45Jx7YyP1M2C5E/7JeofNz2sOtaZwV04TUaN34dl1
	 gs7YJ1SxiXd0FKjsIv/8XY3oziX7d1P3ByA8jdrvS+wKwdkX+A4HwhtO0mhyJK75pJzUxKAHbOsE
	 0YaZIctyDxYHbpUezRVLEX976dZbq1+8z4Z9ZfaOrU5CwRYW6Y0x8C1gLw4Wou+QT4MU/szYo2WT
	 4Vtl66SEGapUzYSrBhN35ilWNFyUrFYYUHLrK1YAd7EMJP7tk9LazG4vg8aBUOoHOIg0dYmkbaWt
	 B//3HxX469PmAp7bdKXNsfkin02icxGi0NT/ySA2P9LOEHSaPl0HA71DCw+wVj/bq6RhP5408HkN
	 tPkIUnbs6Y3uyYEPvceq0gs9MGbx+vgcaeehpLPTfz0i6fyfJy67TAEex0FX1KVvjiAzewc8uztW
	 HbvGV4h90ENMNrgHgW/jmVIyZcKmOSCalS1KNQTT90g10AIKgPILhom8RqD8cJM99rB3Vrh80bRo
	 UaZFxe2IlZWf4BoWhNic8SFxEwZntV7GZMQncsSbz83XAZW6vtkd71rCHXOzzCmL24kTfcG7eTC4
	 PKl29XLCBgf81ERGjSss78Gtl31WN60s2tRNNv+9Hfzbmng5ef8Pa+ZpqhUkV66l3uRxSJY+6g7j
	 IBJmdDYjWasW6LbzngAnBib234Tr5S+0cOWOBB7R9dmy6rxgPSLaeRoNsU2ARay2DG9CrxDtIynt
	 8YIPRhrjYJz5zez1snIO+Oxm9+3tlnLuSkKnXswad8cOm6gf3woJvsNXC0HFu+r2RSJlfJaGEy/Z
	 EJ1LOi2wJmFlzSj4s3ETCPDDDZBbXHcf23zBoSRb+Moftn386HhN26AXN1d++kHhgzZkgEXrgZ3d
	 V1EHKU3BZj4yAD5vLus8dHJ4GkEmzgaMBK+fB1TZVmvdtnbxbAW12FMJXB25QV6JrBb5MtiSAkJ1
	 kBuMO/nBcORzUtCWnlS/SOtofPEhJ6/5yXcJgXPn6Psd3OSmnB
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
From: francisco_flynn <francisco_flynn@foxmail.com>
To: Felix.Kuehling@amd.com
Cc: alexander.deucher@amd.com,
	christian.koenig@amd.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	francisco_flynn <francisco_flynn@foxmail.com>
Subject: [PATCH] drm/amdkfd: register HMM dev memory to DMA-able range first
Date: Mon,  9 Jun 2025 17:36:23 +0800
X-OQ-MSGID: <20250609093623.964017-1-francisco_flynn@foxmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HMM device memory is allocated at the top of
iomem_resource, when iomem_resource is larger than
GPU device's dma mask, after devm_memremap_pages,
max_pfn will also be update and exceed device's
dma mask, when there are multiple card on system
need to be init, ttm_device_init would be called
with use_dma32=true, and this is not necessary at
all. let's request dev memory region at DMA-able
range first.

Signed-off-by: francisco_flynn <francisco_flynn@foxmail.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 79251f22b702..3856b9fd2a70 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -1020,6 +1020,7 @@ int kgd2kfd_init_zone_device(struct amdgpu_device *adev)
 	struct amdgpu_kfd_dev *kfddev = &adev->kfd;
 	struct dev_pagemap *pgmap;
 	struct resource *res = NULL;
+	struct resource temp_res = iomem_resource;
 	unsigned long size;
 	void *r;
 
@@ -1042,7 +1043,10 @@ int kgd2kfd_init_zone_device(struct amdgpu_device *adev)
 		pgmap->range.end = adev->gmc.aper_base + adev->gmc.aper_size - 1;
 		pgmap->type = MEMORY_DEVICE_COHERENT;
 	} else {
-		res = devm_request_free_mem_region(adev->dev, &iomem_resource, size);
+		temp_res.end = dma_get_mask(adev->dev);
+		res = devm_request_free_mem_region(adev->dev, &temp_res, size);
+		if (IS_ERR(res))
+			res = devm_request_free_mem_region(adev->dev, &iomem_resource, size);
 		if (IS_ERR(res))
 			return PTR_ERR(res);
 		pgmap->range.start = res->start;
-- 
2.25.1

