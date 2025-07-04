Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CACF255E30
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 06:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751610432; cv=none; b=XO1TBZhuivbFZukFF/k1aG47zYn1/DYDaTHrjCxCaB/wHMm5YTVsxX1Ai7LD6OM+w3/SVlXaLot/kAiWHDLekmbOKoFwgxnurFxJjG8N4UjpAS59H7lQHFqTqdYXZd0rpNZS0KrOaknBm4WTtxKSrYuN+KZ9bFYz+ZbiZRNxpYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751610432; c=relaxed/simple;
	bh=rnNdiZd6S9Ifs9xRwSIe2HZJaDOtznG3EYvdYdrT1TU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oLwX8Be9YSstHTgjzhKgarLOztC7aPID//F1qdc4OZGHDDOqiVAxRM3RcJR/wUmalTQM/u7owWt+xuSfFI6zDoK+d4XLtGwPWo8a/50NOtoeDRD6Y9pG4NYzzOy/G+ShxvqGKOsNC3CvkeX0p7yBunQXl6MP1aqcu24hZHcQvfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Vbis5qIC; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Vbis5qIC"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-73c17c770a7so906698b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 23:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1751610430; x=1752215230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CssPMht2RNCT6oHZnq2lcog7NRiakEoMHIsMI/+GOsw=;
        b=Vbis5qICrohdxM74gq2+DLjmDRR4SJnJIcdTuGavTqeAVqfNIpmCGDWXEk9j1V50WD
         JyIVQoCjC/zM3486i/nLrG+7EzOTnnpQ239lZ35NHi1Ka1yqhWeFxYIPUyOzc5YMAHF6
         D5Jiv7NefMK2GJpUH5Yvdlq0mW3NjQdQpSEYCef4eXQvB4nOrwi8Nxi4xJgnYyr8zOAs
         qbp7lloOhPBaUYJME+eCK8idlGP1hE/A+i0MumykXwQTR2c4MCjv3UxLz/0gf44S/eWf
         z7boAqjS2iUu27K62JguBxgnsmp1QnI02f+JN0lCgr3+cZbgyE8fUnXsFRgV0Jh/+giI
         Lezg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751610430; x=1752215230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CssPMht2RNCT6oHZnq2lcog7NRiakEoMHIsMI/+GOsw=;
        b=S8IhhB+LUqytWxTmZoWsyWsLhh42VGwLi7Vcgtc/dbhTI0H3iZql43gIzO0oeIShwO
         PI//Vrc2gdPT/hyaWFcN3/O6Oc+8eMiIpmZ5P6HWVvk7Mrj5ZymM/xV+VDL85ntVvAAQ
         zejmksgAbgQRo6T1gZtexLufn0Zm6+kHUgrUtN150GH4dTCTtK+3d+5bzaZ1L/Mz000y
         CVwOuF8YJFt2K0Paqfnf3TPpwjkHdeYg3f1LgdoTjaqe+d4F5ZQm8S/gSfaV8BKNKi8O
         Qn4SAjf87pC+hJoS9Z6EUPqLZrbenNSOpb4Nstov+yzmOMNyIl99nWMqYYkt2oHKDQ3S
         CdKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuTxWYex5iKfZZ5ziIseqtyyz4JpABBck/NH74W/BsH14MPzqA1+xv6B8z8OMiPpuNlpf+G+mm8X4g5xM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnHa36dQzVYrT9V0I7UPzaXMKIwF/4ktaR3VSf3DmUazAtokyI
	FFsxzLwYmTyJRH22FgqLnRTgEmdyv4/JkoXg5Io9SY/QZeLeffMNAfGlJ0iKBMHFYno=
X-Gm-Gg: ASbGnctW2wcwQ2Wy5T7cLvaehS291hOgSPt2Q3GqwStCcAvHFEgToPGnXHDdCEKUDfQ
	hNmAONPN1b1KNT4K/Mqv7/G/lzC1kXpIQK3YQnLOzdETLVhlGYTxjBX1P6gx664j/WCcGGX4VdZ
	Eax54aaLjLjV7k00CmhGOcQNDZlHS308nn1Cd5G/gukDp+ZutJFJpOQSYupzL8hCEVKZHK1ndXz
	f2BdyrIbsn2LQPwBO3TU6UKnuMvdvJVms6t19aXzDBIpraGVgG7DjfaumajX5ZtR3QffksDTg3F
	ENu98+Qu8I99QU6pYnye0KawWF7N0y90U3AHiUxXMq83b5+YjQHdqbquEXmz0L5j77wORVd7oI/
	6muJ5K9uhakQZ
X-Google-Smtp-Source: AGHT+IHAZZUJlbwPG8pSg0jZDLcpYtT864xhpoOT0kytf9EjZhBe/0eDYndqrOdf/jc7iu5owyQo+A==
X-Received: by 2002:a05:6a20:3ca6:b0:225:c286:5907 with SMTP id adf61e73a8af0-2260a0a362bmr1393632637.3.1751610429935;
        Thu, 03 Jul 2025 23:27:09 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee5f643dsm1183240a12.37.2025.07.03.23.27.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Jul 2025 23:27:09 -0700 (PDT)
From: lizhe.67@bytedance.com
To: alex.williamson@redhat.com,
	akpm@linux-foundation.org,
	david@redhat.com,
	peterx@redhat.com,
	jgg@ziepe.ca
Cc: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lizhe.67@bytedance.com
Subject: [PATCH v2 5/5] vfio/type1: optimize vfio_unpin_pages_remote()
Date: Fri,  4 Jul 2025 14:26:02 +0800
Message-ID: <20250704062602.33500-6-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250704062602.33500-1-lizhe.67@bytedance.com>
References: <20250704062602.33500-1-lizhe.67@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Li Zhe <lizhe.67@bytedance.com>

When vfio_unpin_pages_remote() is called with a range of addresses that
includes large folios, the function currently performs individual
put_pfn() operations for each page. This can lead to significant
performance overheads, especially when dealing with large ranges of pages.

It would be very rare for reserved PFNs and non reserved will to be mixed
within the same range. So this patch utilizes the has_rsvd variable
introduced in the previous patch to determine whether batch put_pfn()
operations can be performed. Moreover, compared to put_pfn(),
unpin_user_page_range_dirty_lock() is capable of handling large folio
scenarios more efficiently.

The performance test results for completing the 16G VFIO IOMMU DMA
unmapping are as follows.

Base(v6.16-rc4):
./vfio-pci-mem-dma-map 0000:03:00.0 16
------- AVERAGE (MADV_HUGEPAGE) --------
VFIO UNMAP DMA in 0.135 s (118.6 GB/s)
------- AVERAGE (MAP_POPULATE) --------
VFIO UNMAP DMA in 0.312 s (51.3 GB/s)
------- AVERAGE (HUGETLBFS) --------
VFIO UNMAP DMA in 0.136 s (117.3 GB/s)

With this patchset:
------- AVERAGE (MADV_HUGEPAGE) --------
VFIO UNMAP DMA in 0.045 s (357.0 GB/s)
------- AVERAGE (MAP_POPULATE) --------
VFIO UNMAP DMA in 0.288 s (55.6 GB/s)
------- AVERAGE (HUGETLBFS) --------
VFIO UNMAP DMA in 0.045 s (353.9 GB/s)

For large folio, we achieve an over 66% performance improvement in
the VFIO UNMAP DMA item. For small folios, the performance test
results appear to show a slight improvement.

Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
---
 drivers/vfio/vfio_iommu_type1.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index 13c5667d431c..3971539b0d67 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -792,17 +792,29 @@ static long vfio_pin_pages_remote(struct vfio_dma *dma, unsigned long vaddr,
 	return pinned;
 }
 
+static inline void put_valid_unreserved_pfns(unsigned long start_pfn,
+		unsigned long npage, int prot)
+{
+	unpin_user_page_range_dirty_lock(pfn_to_page(start_pfn), npage,
+					 prot & IOMMU_WRITE);
+}
+
 static long vfio_unpin_pages_remote(struct vfio_dma *dma, dma_addr_t iova,
 				    unsigned long pfn, unsigned long npage,
 				    bool do_accounting)
 {
 	long unlocked = 0, locked = vpfn_pages(dma, iova, npage);
-	long i;
 
-	for (i = 0; i < npage; i++)
-		if (put_pfn(pfn++, dma->prot))
-			unlocked++;
+	if (dma->has_rsvd) {
+		long i;
 
+		for (i = 0; i < npage; i++)
+			if (put_pfn(pfn++, dma->prot))
+				unlocked++;
+	} else {
+		put_valid_unreserved_pfns(pfn, npage, dma->prot);
+		unlocked = npage;
+	}
 	if (do_accounting)
 		vfio_lock_acct(dma, locked - unlocked, true);
 
-- 
2.20.1

