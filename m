Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0374F1C2437;
	Wed, 30 Apr 2025 15:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746026345; cv=none; b=bM3IrU3jdMbun+w8Himu8qobUElmuVY1+zWizGmewL2MleqsLnMMP7YzZRUu9p50W9AoNcBsiWTpbDVp8bRSKmupVCuMgZjcqytg05n/XNtVoKVA0CzCWFcSvltmmDtVbpUcU272xaE8IG3EZ8wSH+g6AnvRvQ+WHCrdEHVPxU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746026345; c=relaxed/simple;
	bh=B6zlRgYwaeYfdtMHlof62UGUmnIkYfwM2CVLuHfDnyg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aPa+X6kpU208b8KdRIW6E9LU3tX8R56w3ruc0ts65hs487I4VsNOo5oNeJBU8q1YYj5hJgGtndkwq/OLnrfqyV+b91AdTHCkUErwi4HTqiyEJzHeV6DmuK4bGnrzdoqwdoh5eP+P5AbPx2Y0F+OLAh9lkSsBUygv3OLwMPbyUa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RHOBEfdS; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RHOBEfdS"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so67681555e9.1;
        Wed, 30 Apr 2025 08:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746026342; x=1746631142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XXK8bvaCytItNT9ajRVYbpjpuh3Pnz4jGeM0l/N4gcc=;
        b=RHOBEfdSEcW2Gay+ZpO9KuaLA/ADXvbN+M6yn+2iEoeTeIfhC4k68LG4EZViY3tasa
         xk1OgdWKoCoV2UPL22Szw80IP9V7FSa5gMCqwDr2MkP68toJCi1k2oMbJzD5nWsDNvGe
         dECeqs13RevCJa1qhdqQbho/4MeU5L0yrnl0cNC0cp4KZqKxrXVJ3ahh+VJCkS6zzFv/
         LryAQ/73SggpITSJI3tdy4a6bPLqPBN3RBkXhgHIAf0eK2wXydCppuHOIpoumucZpS5g
         DZz4pnVTfAtHa4qkUOUdRjp35Ybm/21JjXLt4seiWPRuvp5FMr+FdVQPabCybYmXNjqM
         XBaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746026342; x=1746631142;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XXK8bvaCytItNT9ajRVYbpjpuh3Pnz4jGeM0l/N4gcc=;
        b=M4fBc/hzvIqDiHMeKkXxEPUcVcHZR7u+ifF6QfUaI0KC/7IFdEgDYLpVg/ZbT1J0vK
         63vYO3CtlhWF1LPzIWXUod/LfYWJ4HBhETuljGbha46yBo+OpV+cmOA5JVsqPcXzUR+4
         DI27HjGXEuNyW1Pf8mej27lIPORGn0XnwQhR5PtqgkIFfZGBqfBvRwA3SNgeF5hVzGXs
         L+/AAyr1n2Y7RTNNmpj4Pvfss0eCsQcNUFSaBR5EWW4JkNXxzaRLU5wSPF4thFJEBx0W
         nbbo+yrXAfpzwqO5hvg5k9qgUnln05/AO3y1GHN1Gf6u2hVPDZcxf66N1acN57P7yGjB
         f0Hw==
X-Forwarded-Encrypted: i=1; AJvYcCVElby5IeKUrwbLcu2+97rs0hhYF02BcDUKP8dum4/xrTES2Qf7FnoPlOB9goDGLLn8KIZRT11cYsHfV9o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqO3gZRZeEB+sFYV7+GKqVBNJgZzHG4550XBYLBM1AG9YTzrqZ
	FKrtN1/hPrNXOmPJM8yzMA1GWGYLxzm5peeAcpIQwuwts0Bb1dJ4NL2M3Qm6voI=
X-Gm-Gg: ASbGncu70hGkbPWFp6QmWQBBsuRhUkX349hHpS7ECZBeCL9/PGwUEPlcuelgzz3KKGa
	L56xgPIAqpXDZXQQP3moNiEkpXPfbRrg6OIbxhOZuZKajMvDt4MCTbCiGIFM0Fzac48jYTSBzgS
	M/56YXuiBCuJ7nivnJuYq05tfW7n9v167bOLrJvhEfwaKoopPMJD6Pdzj8o+mWjMP+UcSiz8CQh
	KmaBuCELW7oQYQr3+T+r4sYaEPXCrGmebIO8pnrF4rTUBX6hBmpsBkVDDXcV3DQSFL2R6gKHRfd
	YFstV/kmh6QhYIu1vBCTnaWaHEHwWXxFYkL/Z5yjjg==
X-Google-Smtp-Source: AGHT+IG5yLDIazGKaXeNaIe5P/3I0dJ19S1HBF6Ews+DjSapkFmQX8lg5ffFzK8P21Kj9uOTim/K8w==
X-Received: by 2002:a05:600c:511b:b0:43d:fa59:bcee with SMTP id 5b1f17b1804b1-441b1f61df3mr28185545e9.33.1746026342104;
        Wed, 30 Apr 2025 08:19:02 -0700 (PDT)
Received: from localhost ([194.120.133.25])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b2b28796sm28242845e9.33.2025.04.30.08.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 08:19:01 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	iommu@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] iommu/fsl_pamu: remove trailing space after \n
Date: Wed, 30 Apr 2025 16:18:53 +0100
Message-ID: <20250430151853.923614-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is an extraenous space after \n in a pr_debug message. Remove it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/iommu/fsl_pamu_domain.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/fsl_pamu_domain.c b/drivers/iommu/fsl_pamu_domain.c
index 30be786bff11..5f08523f97cb 100644
--- a/drivers/iommu/fsl_pamu_domain.c
+++ b/drivers/iommu/fsl_pamu_domain.c
@@ -64,7 +64,7 @@ static int update_liodn_stash(int liodn, struct fsl_dma_domain *dma_domain,
 	spin_lock_irqsave(&iommu_lock, flags);
 	ret = pamu_update_paace_stash(liodn, val);
 	if (ret) {
-		pr_debug("Failed to update SPAACE for liodn %d\n ", liodn);
+		pr_debug("Failed to update SPAACE for liodn %d\n", liodn);
 		spin_unlock_irqrestore(&iommu_lock, flags);
 		return ret;
 	}
-- 
2.49.0

