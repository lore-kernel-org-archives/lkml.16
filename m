Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC57248F73
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 06:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751610422; cv=none; b=G7wG0l+OZvG0jcMI2DQG//b4gFiUpa+i39XW2qE9/u2T6JP3sMFAFoZXbEtIm1fuWkjxHt8RLHm0eZJqNfLPgvhwVNnGe5R8JICMbk/9bKO8xc4NuLtSY+hlXziTR74BibUw87OuQhhfJUMbuxndz/HP9z+vfpvoxmFNl6XV8u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751610422; c=relaxed/simple;
	bh=2Ck7da429bj6tPACUdRedQc7kvHlhF/GdsKaHEkLWBk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cgNso0m7pzU5DSIABqML0kcMftvXDUzmPoOr2vjZo97fhiqmEKHQlvknDzwRkX5lPfJHvWx2ZKQtZPhPn2d61LAjjDAn5Mu6er4NXj2vevyQ/ROmYsqGdg3J89tS+NRgk6Jk2eNzLsr1fCacpj27cj37GV6frBYWR8CTwCOzWvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=arY4hajF; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="arY4hajF"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-235d6de331fso8989495ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 23:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1751610420; x=1752215220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QiHfvwOVI0/DzO8i0IezA1Z19+xb67OoONslKakPCGo=;
        b=arY4hajFESXaQEwzEyNLZeMh6o5+kMlYtLy3wdGrRrm1gmPg1PoSDJ1WhCGA2hDxAV
         9U+n4+TgNX/alA3fZHaKUFoXUMsuFsf5ZzVJ29gx7eMueUUOxaFWqHCF35rZDWe20Jfr
         z5ZMcfQ6oz8fnuUphcxMRB7ePKzByXvU/y1u4hlreEEt++u+VTdXkwmEifbl2xOUUV2T
         FTGNZZnK7vvUtFXuJZDgaDSmsazcNbKv+xN0AeaY927S4GrDI6VNXzNP1wc3n6rjMxcL
         3dnen0UP7QNA6Xa4pu+CvGZpCRgSrH1ArPImhhMwQpVoPSwIWI/BweL8jnn0Q8a5FGa/
         3lbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751610420; x=1752215220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QiHfvwOVI0/DzO8i0IezA1Z19+xb67OoONslKakPCGo=;
        b=DRVkJUn7KhbGzvQqDYtej3PSo3V3GWqCDdjztytsufN9Tbk72t8hZ3IerJGtVg6QAQ
         ARIRQZupMsk3pTPj/mLLltj5ju74CrjvcLBItZ+aSI3h9YOth4cfX7I+AzkOCW5sQsyE
         6bY1iv+Lh5/63zNSmsBRcX9iRYaYh3Yz+ANpsNt+Zm6NoUt7q4SiK5+1/PlfB5mVLfiF
         MOKQqj9uh7E/VokIYDLUvIHRqY0KZbNwbr39g5JZ1eP/HAGkbRDweDzgo3PMW4CwPW+e
         nPG7YOPe6218XJXGhNck7O/ZY+2l7r9q6xNWBCVTJtMfZOWBSrMNYhcsM8qlvvLtsVej
         ECsA==
X-Forwarded-Encrypted: i=1; AJvYcCULzWz2MXGwFxxxXclKymcM5ZtWylvSmSTO9Ejdzcf5Zoj6AauJ1Ro+51Wrpyh/pN4trJr6bpo+1TiScJE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIymkoxO8saJlPECGCql6RwiPSNKrqfXG6e+brS779gWr1RuRp
	7VVifnXQD8bTtPSoEMg3++lYODbWCpe0CqXsRGgP+QoRq+pCU2pcyrvXf4njtz3O3rE=
X-Gm-Gg: ASbGncuvFsOEoNtvaXfq74fAPs6KtDYxD1tOkOjb0Tgs+EJuw11kWEp95yYk+vGnH6I
	m4XL79kEvYOKc63KbPM3GMhuPTkZfUBTLSqpavFn3s/Hr4AdxspoJrk39w1oEcgpkansMA5A5Kd
	pSUo0rtg6p6U39OIevUjO40+fwQchLMdGF0GwAvNLUwfz2ULWrYFngU0jjrW/kE4w836wiMNwqu
	IZRijcI5A2FYGgKZOAT3ipvVYb/nrkBScZzM89aPYQzu8z7Y5F3D9txVtAo4g3+SpYAgTa0MJqS
	eCfVV71IG0YVTrGp313ilZIfjYn+ZbYgPdWw7MmOBwLS04jiS9QWhVR1N7TFeRNK1OiLR37Swi4
	C3m4ueB+iB0Am
X-Google-Smtp-Source: AGHT+IFXOrpM+FeRqzRx01wW+29lMpHFGQ2PU6Rtc5xxE9IkYr1rATfhqAIwp0ljrPlZY65KFR/JyQ==
X-Received: by 2002:a17:902:d592:b0:235:799:eca5 with SMTP id d9443c01a7336-23c85eb051dmr27110365ad.44.1751610420130;
        Thu, 03 Jul 2025 23:27:00 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee5f643dsm1183240a12.37.2025.07.03.23.26.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Jul 2025 23:26:59 -0700 (PDT)
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
Subject: [PATCH v2 3/5] vfio/type1: batch vfio_find_vpfn() in function vfio_unpin_pages_remote()
Date: Fri,  4 Jul 2025 14:26:00 +0800
Message-ID: <20250704062602.33500-4-lizhe.67@bytedance.com>
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

The function vpfn_pages() can help us determine the number of vpfn
nodes on the vpfn rb tree within a specified range. This allows us
to avoid searching for each vpfn individually in the function
vfio_unpin_pages_remote(). This patch batches the vfio_find_vpfn()
calls in function vfio_unpin_pages_remote().

Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
---
 drivers/vfio/vfio_iommu_type1.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index 03fce54e1372..b770eb1c4e07 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -794,16 +794,12 @@ static long vfio_unpin_pages_remote(struct vfio_dma *dma, dma_addr_t iova,
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

