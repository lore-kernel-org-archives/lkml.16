Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9CD1DED5C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 03:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750389853; cv=none; b=VaRj72QzmUXWeKq3Jr9w55dxbG9jIOW//GknQCvjLybGErUHLryRLwbMo577UCdtjpsDXiIW6X3qqa3MbBNOwAopjrYrh8Tg+QSkBeZXIzcW/xfY0tlbuN5YC1timbD15Ik8ZdNscTJTntdAL/DKc/7nOJGQhnXEWLBSjncLzRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750389853; c=relaxed/simple;
	bh=uV3cHhXrkTvBqdB8VYyLYO8kapwhTK0/BJjfokGJUfw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rR9QBplp+AJmE18019htkIBVIW7caqoGSxzT/WEOE9layh1hUhf3uWb0je+XYsjYj2rjlO2gIfbGqbMKg6cnpyi1JTihucjtm0AdnPtNS/UfSmnbQBSSQpOnueipLmoxCuY0EHuU5nfBlvR3fpD6tsAjWyr/614ttjwnW2Io/Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Ej4mijS4; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Ej4mijS4"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-74264d1832eso1725181b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 20:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1750389850; x=1750994650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DSlkXQNydyRdWXir99epy9/y/pcz1kH+JURzeIlDKkA=;
        b=Ej4mijS4RguUTdUbbaLOvuxEsljl/l/1iHRMlpTICXszE6evvhFc5rsBHh5A0GDPIy
         rm30X/nF6cpOgmAVbZOfUy2xoCWIiiggtWnXEeh8PdTPABjM76pYy43n1M04Xw8Cc3NV
         VwfYxOyODA2MN58ml6vts3HfRjJUN14dyO23MrdXi0KaLtCArihoIbu89ZtqphCUPa5l
         Ujto4oLw3XUKrgO9qS68Ml8VCkpO/JyJSAb+D/PREvvZXWMvcfRBWyc4L4Gb/x4lmx+7
         oYFNBV/zWQ8dRYVIQ7AxXh7im/dMQw8rgt4e1ghPrOzZFFwZ2LT5U5yGLA6pHzuze2y7
         6MbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750389850; x=1750994650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DSlkXQNydyRdWXir99epy9/y/pcz1kH+JURzeIlDKkA=;
        b=WsHdl4ySoHg8eVa7coDsl1tC04Z8Ghw9bUCWqW2WETPET9VfkU/4CFnpFMPxEQxMKr
         KQF/sidbGN2xbXdyd7QLET1qA3LC6xtLG29HKnchiziufdpPZY9Xmvl5mdLbpfBOy4ru
         32vNKZ7Q6SMi8XxSNG6AzGMdNZUlWrJrAbYr6093PWCq41mf00/hshq0yQ7WTNfn0WQR
         eVkR5oHJHXtGp9a5WJa1Qkhf2gv2ES1dtLFFBwFWSKjYHSw+6blvizqNFkr4J8bxwayP
         ZiDCVvBLc5rFUdbaA/Szc4SgWZhoPB946ftBr9Tj9sy60dZI7NfaUfF0L1C8qBHZOWhM
         IZQw==
X-Forwarded-Encrypted: i=1; AJvYcCVtQWkBLRjRjD4AR5Jtc57Z0UOQ5voLkqSRbBRzGznbGesnMxYiok5A+FhukFJJNzdGirWaVsIS+QZKzsA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2zSXmnzCO/BE/XCFtaKBO13qORUBUH6LBDUkqeho854S6Jx4z
	3TOCmU6e7QrsKKgv/UGujkkTAhS1hxdy7gieCUX5F3r2x8tcdHEp6331BBMgO022zl8=
X-Gm-Gg: ASbGnctl644HTbbO/cbSxY/qj/SdWTgkxxYVIwiDmH6Q/MStTV//cowFX9IVjIkYzrz
	lXM3xrM20da56b9+QvUc7bmt4zFpFKiZJzMA3UZ2mrpDmQRIU8LkQVPdJ9+kW9EXpFfS9LpAWVn
	EWgIyDJiIUDBmZ9jVnb/zCUdjcdZh6Nh7+odklNVudrwYN5u/Mua9VtW4t3IfBXu7F7ypoR1XVQ
	TshV/viXGvt2k3aXrAkhQVRsDoTG/g+rtWx4i/wNxcUw58PpimoW/ZEYbkfNZk179Qb03uUndct
	JTjszXGomAAxn91AcuwsLfBux1RONYP+XTbaVQEvt/lKWehj72hB8DABxEp+yVmtFiMkDZde/DY
	kG4Jz612vkFLr5YCW3jfAiIw=
X-Google-Smtp-Source: AGHT+IEsXcfjbayevRNoihfpHC+h/sIDZOjdQav72EKNFmITtaUo3YN4YHLpYj329boEKbDYcfD4jg==
X-Received: by 2002:a05:6a20:a10c:b0:204:4573:d854 with SMTP id adf61e73a8af0-22026d58631mr2053781637.9.1750389850193;
        Thu, 19 Jun 2025 20:24:10 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f12423e3sm490565a12.47.2025.06.19.20.24.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Jun 2025 20:24:09 -0700 (PDT)
From: lizhe.67@bytedance.com
To: alex.williamson@redhat.com,
	jgg@ziepe.ca,
	david@redhat.com
Cc: peterx@redhat.com,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lizhe.67@bytedance.com
Subject: [PATCH v5 1/3] vfio/type1: batch vfio_find_vpfn() in function vfio_unpin_pages_remote()
Date: Fri, 20 Jun 2025 11:23:42 +0800
Message-ID: <20250620032344.13382-2-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250620032344.13382-1-lizhe.67@bytedance.com>
References: <20250620032344.13382-1-lizhe.67@bytedance.com>
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

