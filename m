Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E281421CC7B
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 07:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751268396; cv=none; b=CQtRATEREIitShFnbN+vTbTbUvLizDbDStyuy/ogKKkOtsgvHiBARjrTzBI1vm89CrYW9pe/G3DpLiQSfC71KmdAYg94aHvBLAtBgnkEN+T8Ab/7sDlvAWzEDwcsCXrK0PayRq1ibwriS73pljD8fhog605UYag5DUB63RbR9WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751268396; c=relaxed/simple;
	bh=OXOAdqxVIp9HtLsu1MvyrpEwHF6RN9H7pCkvmJZLspY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e27vLwLSh7dngrxeHg9DSRObU59pEjCCJyJNxINw3jKo6MuqHzkaxa0czil9hRCtCfZdMD8LEPRbcnhLjz2LW/3FieK0/1n59VdmC7qtf8yHYNPChGBNzYhXPiX4P6AGlAuwUUbbwtTg4oE8suuoawuJOUoyyfMm2Bh2yYyN3Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=NRpG5mHQ; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="NRpG5mHQ"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-23694cec0feso38446345ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 00:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1751268394; x=1751873194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3/hNQa9KjFyMpC2ihH2SV+iZEz4QS98Qql4RbXjx0BM=;
        b=NRpG5mHQEzq/dAot1ADX0cryiQcBGIOi4f/9WXSuazrMYPIHb6bcBkKwafmDaIHza2
         3SL6prn28028s0RgCbiQF6v+2MqriZ2v4oYfoFxjyqVirWfuvPLY4QPb26X34nMezqu8
         dnOF/YSvYIvbevEt+2S/kMn6D7MVxGdWnjzL4+Y3KuZ7yJKX74iZVHmRC8FH8qgk2WM+
         iI0A5MNsBFE1aLBtRc7n+FDjN4J6U07NtXLj3wd7qt/F/KWfZaSqqdPWhua2oYgfAWHe
         diHZ7zn11XHgIzyKF/wTA3McVmbMAAfhnRQvwR0vRKyMDZi5ajBoFqTFjbguAuJBj1jO
         eOqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751268394; x=1751873194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3/hNQa9KjFyMpC2ihH2SV+iZEz4QS98Qql4RbXjx0BM=;
        b=rsAD4tQV///JFZq+9C0S8qTh1DD0kLkLpWToDIMMZ2j3TOsoUlqNFRMlp3GBxL3frZ
         R3w5K+tv2QYynaMXgcpXp0Lgt+iqjSdW15MpKf3he35vVS7OCqoHdzjDad0MrGJhUl5d
         BIkma0hrXvRHA+tx8qg3kOd9r15trj7hvSqPUUMgkF2Eu8f53kZxVbtDMMXPqJPl3yZZ
         /JNAIdIPP7vSmtzQITuNtu56q+e7vCtkVEGeCZUy+uQz3LeK96jKGdDqdRut+y2r2ijr
         oYdRrqSkJxQPp0DH5XAwkAAaQ/PMPP7uxS8ToCqEl6Sa+wZXy40GkLXOVtQ8sq27XfeS
         B/hA==
X-Forwarded-Encrypted: i=1; AJvYcCWK7VISNcfYvQ3xkjZstl1Nqlnzcix1xOY6dos0mn2sq7z1Z2AyXrtC18xu99v0cPRJQr5meZZ7jdlSKtM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEM4ULHieqs9saJmJjckVISAmSyggPuxH/jp/Mi/ye3jXorYmW
	NR85RVmH4yX+MzfcCdYsQYWtgo+rPo4HdjUGWYNWGYg0tk3dxoWe22m+Vth+VKR09B8=
X-Gm-Gg: ASbGnct5bL3kDiAkKyt/ySG3D4oI90edI6QVDFcMU3TzMvmPXH2Uwyr+jGIWEhVs4cM
	/Tm2bT5u62jrqH3sKA0mXNLbAN/IPEfn/dwz1eYAhmAEPYMTGxS9X51kZxN8zlm43aQ6dcj4uT8
	/UkExxWI2WtSKcjzt4HSO1IYOtBfgmVeFfYhQVlZhQapN7ywIJn3wmaGrRAcpvvOhjh5NsViR+k
	dutJ2FYgHPxD96A1T446/Smy3cLiQFKOYFGoPzOwH7URuXpagUzsxYqopwcgsMtCuFi0da33hX5
	8hdlaC7gRxfFKBXQz7xWSWu1PsOOMb4zczdgDod7yweD23w0aKJ5+aR2J0wza+RYdTg5uliD8QZ
	8VSeWWxjLqb1KyQ==
X-Google-Smtp-Source: AGHT+IGAD20yxGlVCMQbeNZIjI7hSWnCpaZJZIRII2/DKq9LAZjm63OyWH2Q4nV6p6WIReEmgJrW+g==
X-Received: by 2002:a17:902:f745:b0:220:ea90:191e with SMTP id d9443c01a7336-23ac3cf5451mr169718755ad.4.1751268394203;
        Mon, 30 Jun 2025 00:26:34 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2f17f5sm77237555ad.62.2025.06.30.00.26.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 30 Jun 2025 00:26:33 -0700 (PDT)
From: lizhe.67@bytedance.com
To: alex.williamson@redhat.com,
	jgg@ziepe.ca,
	david@redhat.com,
	peterx@redhat.com
Cc: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lizhe.67@bytedance.com
Subject: [PATCH 3/4] vfio/type1: introduce a new member has_rsvd for struct vfio_dma
Date: Mon, 30 Jun 2025 15:25:17 +0800
Message-ID: <20250630072518.31846-4-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250630072518.31846-1-lizhe.67@bytedance.com>
References: <20250630072518.31846-1-lizhe.67@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Li Zhe <lizhe.67@bytedance.com>

Introduce a new member has_rsvd for struct vfio_dma. This member is
used to indicate whether there are any reserved or invalid pfns in
the region represented by this vfio_dma. If it is true, it indicates
that there is at least one pfn in this region that is either reserved
or invalid.

Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
---
 drivers/vfio/vfio_iommu_type1.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index 330fff4fe96d..a02bc340c112 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -92,6 +92,7 @@ struct vfio_dma {
 	bool			iommu_mapped;
 	bool			lock_cap;	/* capable(CAP_IPC_LOCK) */
 	bool			vaddr_invalid;
+	bool			has_rsvd;	/* has 1 or more rsvd pfns */
 	struct task_struct	*task;
 	struct rb_root		pfn_list;	/* Ex-user pinned pfn list */
 	unsigned long		*bitmap;
@@ -784,6 +785,7 @@ static long vfio_pin_pages_remote(struct vfio_dma *dma, unsigned long vaddr,
 	}
 
 out:
+	dma->has_rsvd |= rsvd;
 	ret = vfio_lock_acct(dma, lock_acct, false);
 
 unpin_out:
-- 
2.20.1

