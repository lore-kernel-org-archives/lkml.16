Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A340520F085
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 07:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750060394; cv=none; b=ZqBXtmmEsy+FDwrqjl2cjK7yg+WEtXhEl1hEZ6BJIZaOqIZmqlVhGalp+ykDuaUUO9z9dpZmSLmNjGl1HI4LSbv3eQRDmOD4qlIeup0eWtyfdAtAWe+QvKvvwiMYY6aAxR+Fdc+gKnrM/Jm6q1ejV3swmW4141HclczbGaxXFmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750060394; c=relaxed/simple;
	bh=uV3cHhXrkTvBqdB8VYyLYO8kapwhTK0/BJjfokGJUfw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aQUM1RJhxEDL89e44THCofrUMKod9tpo+MZIwQ7PfzP0FJzzjQnpIzuP818xdE0FBRZ/r8zjOI8KBuVBv994yteE1c5nbcksP8jX2pBiKvA+LThLAhu3dDD1CylPWsChsaj0Zsnfh+LWFUtET4+Boi3VqX8vmHHJi4iqSJdnlnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=IWJK+0wG; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="IWJK+0wG"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-234d366e5f2so52782135ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 00:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1750060392; x=1750665192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DSlkXQNydyRdWXir99epy9/y/pcz1kH+JURzeIlDKkA=;
        b=IWJK+0wGiTj7Ld36WfheEiPGYvP18BL2EZ97r80p+1e12oHPKDnNF7xg5RY9JE+u8X
         TaYGR925UK3fZix6/fP0LEjI1RhBPPqnGvHRAmRTCdfbO6Qli2wXOCDDoJCJWwW12+m8
         whnKhfjHh72G966uj5fsfPzJhvGtIaG7i8ipTL9JvY+Pk9K1JLM1y2WuzPYm54oq2NeI
         Nw7OJ686e6XIUbYH6LBWLP9O9KQcL0XjLvDyB155ApCF2TLzPbryHUEMM7XDlsB9qfAu
         OmxwggYFn/2Iejr1Yq+7/Tt56IeNLsGPgYpTLZKmWhz9I1wf02UXgJMlcI3+0skb4Q27
         iL6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750060392; x=1750665192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DSlkXQNydyRdWXir99epy9/y/pcz1kH+JURzeIlDKkA=;
        b=I3b5eVc+SrJ94hjlz6kaEvlDXN6E+UWXwoodwUhWObAJUS1mnOrQUT1ifDzS+G1Kdn
         BVB8BhPizwQADvhkOU9lG2jqS07EyhLKObliRgz4V33mqaJwbXLOX+wsIEGndeER0lCE
         F2FOrJx2HrFQAO9PuO1v+8u+Nx+NqJp+UquX/zgwPBpwbndi2HsTWQ7ExmLF0NVREsLH
         JSDurvUwu+EHDVy6LebPUOGRhj1/LMkgf27E/g9N7o0/Y2RNoxExoeiSewaL7XuU+qoK
         GcsQNSFLF5o8D9Ms6x9C6J/tCrjz/vcgPkK2mOfo5j3qeESPS7/ffMf1ssMyrKcXNm/f
         cn4w==
X-Forwarded-Encrypted: i=1; AJvYcCU0HVNsQzgivNYkkGShmnDT9PIWF67A96JEVjTlC2m/WMES46pltcAlvUhCp0PvjpGauUrMmAxTsjJ4AQ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxI3pX8wIlsHG5F53Uise3T3aZcb4WntXhE5uWLs32wR5QuTiQL
	1zutWgks3Dr83fO7udbsTMvhZr/au+N/ulvQ5tTB3WfrotNjUEb4POM7ybzldiHlYxM=
X-Gm-Gg: ASbGncvjoMgZ/nuo02JkIIpbOQymZOmu+NuMdrT326hNDlp9dXt94jja60QVHErSFs2
	IwBoutc3KnWpDTCQxxEr7KiyUct8XXwBKVkPul77xcyJr8ApFE+ShD36PX/OShJYd6UnxEUfgFS
	igxcu1IPsyDqor54qcnyEWSRJDIi3Yfs3Xoj21KYfnaK2jUoeNaoWNTWvRMOHBuE7WS0LxD9T5r
	sV+J7KX1CxGtrtQ9akpMkkc4IQ0Rc3hUPItWCLpnhN04EbYfpaT4/PcwYoWwpoAe4F/TR5qT0i4
	t4Y9LZkSFUZ+jrwScOiLRxpbsjxyIHOTisbe/kt1xoZRmt2J2jaDGceoTtx/p9qd3hAOZGkE34O
	vIuhFCWKMzshoTA==
X-Google-Smtp-Source: AGHT+IFkQq+r+R5vPmo66EJyLVVT4eyNNzFZY8X02FLwCwquyWl/ce/oM9dxva7DNQF336iW+fZi4g==
X-Received: by 2002:a17:903:1c5:b0:235:eb71:a398 with SMTP id d9443c01a7336-2366b3e0352mr136058955ad.53.1750060391791;
        Mon, 16 Jun 2025 00:53:11 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d88be76sm55179045ad.32.2025.06.16.00.53.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Jun 2025 00:53:11 -0700 (PDT)
From: lizhe.67@bytedance.com
To: alex.williamson@redhat.com
Cc: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	david@redhat.com,
	peterx@redhat.com,
	lizhe.67@bytedance.com
Subject: [PATCH v3 1/2] vfio/type1: batch vfio_find_vpfn() in function vfio_unpin_pages_remote()
Date: Mon, 16 Jun 2025 15:52:50 +0800
Message-ID: <20250616075251.89067-2-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250616075251.89067-1-lizhe.67@bytedance.com>
References: <20250616075251.89067-1-lizhe.67@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Li Zhe <lizhe.67@bytedance.com>

This patch is based on patch 'vfio/type1: optimize
vfio_pin_pages_remote() for large folios'[1].

The function vpfn_pages() can help us determine the number of vpfn
nodes on the vpfn rb tree within a specified range. This allows us
to avoid searching for each vpfn individually in the function
vfio_unpin_pages_remote(). This patch batches the vfio_find_vpfn()
calls in function vfio_unpin_pages_remote().

[1]: https://lore.kernel.org/all/20250529064947.38433-1-lizhe.67@bytedance.com/

Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
---
 drivers/vfio/vfio_iommu_type1.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index 28ee4b8d39ae..e952bf8bdfab 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -805,16 +805,12 @@ static long vfio_unpin_pages_remote(struct vfio_dma *dma, dma_addr_t iova,
 				    unsigned long pfn, unsigned long npage,
 				    bool do_accounting)
 {
-	long unlocked = 0, locked = 0;
+	long unlocked = 0, locked = vpfn_pages(dma, iova, npage);
 	long i;
 
-	for (i = 0; i < npage; i++, iova += PAGE_SIZE) {
-		if (put_pfn(pfn++, dma->prot)) {
+	for (i = 0; i < npage; i++)
+		if (put_pfn(pfn++, dma->prot))
 			unlocked++;
-			if (vfio_find_vpfn(dma, iova))
-				locked++;
-		}
-	}
 
 	if (do_accounting)
 		vfio_lock_acct(dma, locked - unlocked, true);
-- 
2.20.1

