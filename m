Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A263074A9
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 06:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750834094; cv=none; b=BenIVvYWI9FdS7bCMMT8akcu7ddhR1a0QOPXz/dCn2wguOTSouWi2mbzmpVReu/aG6MUVlCoDBYoMDyFntv1uwz6HHnv+J9ppMgvUs7aTC3uv7sWQI9s2qOSQyl5SmuX4JDbV/3kOzL8bgTUsLHcLCyaKAdvK6Waunsd+huRXhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750834094; c=relaxed/simple;
	bh=YRgTBG6ahEu12RrN56cHbtpyvTptKXyTAvXP+cLX6BA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iXGkz0ghmXGWgTkBLPjBAxUJhAgosmuTUFheB2BBGdLmlfb8HiONezzBdlSF2b/ISzu2CqFRqu9QmJI3fcsYLF4MsZGEiD8cwc+Qsu+egMKY5HI6GoV324dGlrEufHnNaNQ1I8e8AOfs6jNmhx1m+9gWWweB7jAYwfMRVrr+PLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WVwspn4w; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WVwspn4w"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-234f17910d8so13465915ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 23:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750834092; x=1751438892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vDntjPY9BcK8XP41EjKymaWC9cq9DzX53giAwjmriis=;
        b=WVwspn4wdc8NE+qzOrIB4cGNHk/25C9omw8zmHyZUOzKgbCJwITwZzSTAW6LX91mXZ
         8Jj0IwgWapTSgjD8qfXS/vcl1t2Yk5oMKls7cvYwp3lk8ybsCx14LTsB+2iohJ+R4IdU
         PVvk2Uwaz4EG4qZ5I7Ul6w03EmAhIdbtblFz2i59kVyE/o1eqqgJfmqCu8Vvy2cTmzX1
         mGMQGuJRWK0v2znsGDAxuuLmU3UIBp4+G1qjnfd0SdIqJ0uh02jj9Hs8y/zGjIfjqlK7
         kjy4HC9YFi+k7NZw8O6YwuPIB4Wepam2elX0F5L9fzrA1/L3l6j0EebOFMrN//C42cfj
         KLyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750834092; x=1751438892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vDntjPY9BcK8XP41EjKymaWC9cq9DzX53giAwjmriis=;
        b=PTgX3YBu1R2WwptrJBJSvMKNQ+Ud5Cq5HGcr85F1ZLh4pbqfBIpYt0RNY3vBUwQFfT
         TXBdmO2/sftZ0eYY5AcTuV7H4vv/ir4hyy7RjU4j2Zh0MJXyXAk2Z0/vmqx+WMys3R9i
         P9PqYyuDiaxtWcnT6MVXCQcb7dfiYAC04WxUv5ewSA8SgXY+eRbvTwlhnylvDjURSy0c
         XpqbHguj/TDAtiIQCfCVMWbt0UOrTc2yfUzrjOM5GNVOvGWPmyYDxg4WylX7mo5gsD6e
         El6rUNJXA2oHKkpmd6aBCv+spzCK6Zws5RnYJ2q0LV3KHceenB++MjPyurPWJoSilgrD
         t0ow==
X-Forwarded-Encrypted: i=1; AJvYcCUo6ih5hx6LTA5z9azAc39QPMlFamlQOgAu3VQ4HS1/FwRmEDEsfILhQL9hvz1PFg7kRlcB3/iVn0I3ybg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyQLGi6Oq9P5fR3iNegXJQIEuKOrXHfvLTviI0prrrdMooCq5M
	Pi47agnaUPVmUU9y7A9tNSXiTw19Qfrzyu+rsEX2LdMHl/2iIASF0r4BWYKEhElaTzE=
X-Gm-Gg: ASbGncvce8xeHnbcyejCg8/v6vXfM7HyIOclGcOZUZRDUOZG2gK6j0Q7u5U75rg7mEP
	LPW35JKOYJsL3N4gfYOT9ToFpThDi4GRW7PuqexKSQYlqT8wPtQwb8bRElAtdreyFHzbpooxByF
	q96q6YOtoUSbXCYYZptvXZ7BOvc2b9Hpqcqz1uBO6XNZh45SxejzrZkj1pyHRYPqJw4YBgcXsei
	/3Xv1zLXzXdw63lep2Z71RrJKVQwjKJ0QSPhDbg4vhFTSaxM9Agvyed1xLIbvC6VK/GUS6yN2Sr
	8sl5/zMC+H+GQsAgFJP15wUXxz3h52t6NUZNqUpAQVkgayz1FPxlj6EMKa4fksfZe0jb9laGlRK
	+
X-Google-Smtp-Source: AGHT+IHHpkRLh4Fi55uEQqLaLiIKZWApjITR844g5L0jj94q2zh5jkCtC479Nj3Tmpcpwwt3a8pnNA==
X-Received: by 2002:a17:902:d492:b0:234:8c64:7878 with SMTP id d9443c01a7336-2382409e007mr34322915ad.11.1750834092167;
        Tue, 24 Jun 2025 23:48:12 -0700 (PDT)
Received: from tiger.hygon.cn ([112.64.138.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d866b659sm127470495ad.168.2025.06.24.23.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 23:48:11 -0700 (PDT)
From: YangWencheng <east.moutain.yang@gmail.com>
To: east.moutain.yang@gmail.com
Cc: joro@8bytes.org,
	suravee.suthikulpanit@amd.com,
	will@kernel.org,
	robin.murphy@arm.com,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] iommu/amd: clear SME flag for mmio pages
Date: Wed, 25 Jun 2025 14:48:02 +0800
Message-ID: <20250625064802.3640589-1-east.moutain.yang@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If paddr is a mmio address, clear the SME flag. It makes no sense to
set SME bit on MMIO address.
---
 drivers/iommu/amd/io_pgtable.c    | 6 ++++--
 drivers/iommu/amd/io_pgtable_v2.c | 6 +++++-
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/amd/io_pgtable.c b/drivers/iommu/amd/io_pgtable.c
index 4d308c071134..88b204449c2c 100644
--- a/drivers/iommu/amd/io_pgtable.c
+++ b/drivers/iommu/amd/io_pgtable.c
@@ -352,15 +352,17 @@ static int iommu_v1_map_pages(struct io_pgtable_ops *ops, unsigned long iova,
 			updated = true;
 
 		if (count > 1) {
-			__pte = PAGE_SIZE_PTE(__sme_set(paddr), pgsize);
+			__pte = PAGE_SIZE_PTE(paddr, pgsize);
 			__pte |= PM_LEVEL_ENC(7) | IOMMU_PTE_PR | IOMMU_PTE_FC;
 		} else
-			__pte = __sme_set(paddr) | IOMMU_PTE_PR | IOMMU_PTE_FC;
+			__pte = paddr | IOMMU_PTE_PR | IOMMU_PTE_FC;
 
 		if (prot & IOMMU_PROT_IR)
 			__pte |= IOMMU_PTE_IR;
 		if (prot & IOMMU_PROT_IW)
 			__pte |= IOMMU_PTE_IW;
+		if (pfn_valid(__phys_to_pfn(paddr)))
+			__pte = __sme_set(__pte);
 
 		for (i = 0; i < count; ++i)
 			pte[i] = __pte;
diff --git a/drivers/iommu/amd/io_pgtable_v2.c b/drivers/iommu/amd/io_pgtable_v2.c
index b47941353ccb..b301fb8e58fa 100644
--- a/drivers/iommu/amd/io_pgtable_v2.c
+++ b/drivers/iommu/amd/io_pgtable_v2.c
@@ -65,7 +65,11 @@ static u64 set_pte_attr(u64 paddr, u64 pg_size, int prot)
 {
 	u64 pte;
 
-	pte = __sme_set(paddr & PM_ADDR_MASK);
+	if (pfn_valid(__phys_to_pfn(paddr)))
+		pte = __sme_set(paddr & PM_ADDR_MASK);
+	else
+		pte = paddr & PM_ADDR_MASK;
+
 	pte |= IOMMU_PAGE_PRESENT | IOMMU_PAGE_USER;
 	pte |= IOMMU_PAGE_ACCESS | IOMMU_PAGE_DIRTY;
 
-- 
2.43.0

