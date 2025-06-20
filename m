Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759F21DD0EF
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 03:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750389859; cv=none; b=KnflWHx77+qrG5rlaiXfjqqUOM5x9TCyWNzXqapdBx0vJZ89ZfUHfb0Kmv0KHZlD4Ga8ciJXuS0iFojpmL0tm6FZLE/dE51fKZRSItxHoSDbP4VEgi5U1yHoNdDQp1t0ZgI6AfOQtQ8LzD5ZBwgbC/yZFoMuXy1RPm+IP4AQc1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750389859; c=relaxed/simple;
	bh=aVi+q7O/crMw2zBHRVPGvYU26xciOHQulJaxqwWbTeo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u/ZWbJji7d8pthUW6/V+y5mPlaA9b8wvAReHIOClNAGRuno1sUV5tYp4KcH5KdPI244cfDbgVubJYfK8TqkgFNW4+5IoO5FN0wSTUlW+YB3XTQo9a6aRKdO7uZ1lpuip3Gx4my8GZJRuXZCa2RHUzFo4yvhrJf1j0TNP6nLSsIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=GEv4zMUu; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="GEv4zMUu"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-747fba9f962so993723b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 20:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1750389855; x=1750994655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nA8lu1ILmrG85n9fJ0bjb2wIucT5x1eh7C3/xgb3MvM=;
        b=GEv4zMUuvMrSyBBMOaakEMNj5WP580hzoZihSL0BZoi9eMFc7Ier6Nj2VfgAEono02
         POHM5fBuRIzL8bh3EzlHuhS9gui+ZWicusAJbACLRPE7hlFICKmcJDuEjNDC4nFry9SC
         7pLQj/WStR41RBkCEyipImiq060HAAWAOjlIAQRDDEmkLW4Fw9s1TN2xCFONa7zBsMgi
         Q8iz68q33oocaxSRYPdJhHb4ucdc5w9B56JvTpO2VABGpOpvdiwrNCX4bQrt6FKiIr3Y
         kTvB/fEvus0n6L6Usu6VwgJOAjIcrs9has8mz89KR7NuJZ6BK0UkaKN5OcFHAF9MHhwm
         /j5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750389855; x=1750994655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nA8lu1ILmrG85n9fJ0bjb2wIucT5x1eh7C3/xgb3MvM=;
        b=lX5oll9RFSVsxG67hbQysbPPg+KRGm21YpC0AMOxStdeuGUmRMiiM2xl25fTKabjD/
         GpFax7JFngUuw7v1kYx70CS70VffZxQzPaeu1NEZBc8LTJP7V1Etb6Se2YjbllVImDLJ
         jt/Y4Ujo/RoO4l/5yaMSRAUC4uDstEP5ACj6ZK9qcUw0JfhhNOOKbTxN7XSfL1xmKMUG
         9vCQ6ros2uQhnF7FM95HhYQQggLKM506QwMxpj0L28lQ+Iwle3nR8Kw9xtJ7QPrujWBd
         6VGBorXXNbI4SZRtKP444ZLQHlhViBIxWOMorTdfo3WKkbS3+gO0S94GC4cIVYDgPihh
         ljiA==
X-Forwarded-Encrypted: i=1; AJvYcCXnpsSaNisuZScFkPqvap7OV6LyhLFqpNJ/c/WJsII3Z3HSbt+vo4NiQMwggtLNFKIfL4oKJhF1uUoeV5A=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq7Wnt+1x9lvErN6HR0dbiV2XM03uvmotxHxikZyhNAbxNu6nX
	4XdrcRHK2RBFsGQupKN6Bmxu2sU0gCiJT0Bsw5XJyfqvkrhEGSBG+Qw0Vrj8TULBhhItJTiAma5
	9tK02
X-Gm-Gg: ASbGncuZAyZmvhuNlifvdUCPdXRM6ZuL1HyOdLFnwMrD+g9H16eTtqZWbRjOQ6z16U3
	5HQ4hP2i1MyF6NhrrrXPklAhaYdzCORFBY+khHi9utntiu+Fs2ZAS80IbMy0tSP4Jv3+TB+4Giy
	iAbQvR3CqmFr3Neo0A0XPhQzWsfpSBBDebYEx29UfawTOxgzv1oEw99blkajJ4CLU7Mlr65c+p6
	mMRniIT1+yVBitzWFhztbra3GgcIkhBkfyZvL/DHSl1ovBX67uzKkVakWV+eD0e/FCb7ZHF44pw
	iOUFRs5L49euf4Ai2Upbw6REl8VKNOK7J3hF1CB6sv2ivy6oIrfTTWZyHiPGmP3Q8RPNbj+g67N
	R+RgaPMNP75dvC/SfLYLVw1s=
X-Google-Smtp-Source: AGHT+IErDrjxvnczjGX7Ziw3nenkBC6Zy/yUAkwXq28ayHDSFAw6u+ds5wFBRcu3M1Dusg9exASQ7g==
X-Received: by 2002:a05:6a00:9496:b0:746:195b:bf1c with SMTP id d2e1a72fcca58-7490f5a435emr1097281b3a.10.1750389854555;
        Thu, 19 Jun 2025 20:24:14 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f12423e3sm490565a12.47.2025.06.19.20.24.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Jun 2025 20:24:14 -0700 (PDT)
From: lizhe.67@bytedance.com
To: alex.williamson@redhat.com,
	jgg@ziepe.ca,
	david@redhat.com
Cc: peterx@redhat.com,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lizhe.67@bytedance.com
Subject: [PATCH v5 2/3] vfio/type1: introduce a new member has_rsvd for struct vfio_dma
Date: Fri, 20 Jun 2025 11:23:43 +0800
Message-ID: <20250620032344.13382-3-lizhe.67@bytedance.com>
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

Introduce a new member has_rsvd for struct vfio_dma. This member is
used to indicate whether there are any reserved or invalid pfns in
the region represented by this vfio_dma. If it is true, it indicates
that there is at least one pfn in this region that is either reserved
or invalid.

Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
---
 drivers/vfio/vfio_iommu_type1.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index e952bf8bdfab..8827e315e3d8 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -93,6 +93,10 @@ struct vfio_dma {
 	bool			iommu_mapped;
 	bool			lock_cap;	/* capable(CAP_IPC_LOCK) */
 	bool			vaddr_invalid;
+	/*
+	 * Any reserved or invalid pfns within this range?
+	 */
+	bool			has_rsvd;
 	struct task_struct	*task;
 	struct rb_root		pfn_list;	/* Ex-user pinned pfn list */
 	unsigned long		*bitmap;
@@ -785,6 +789,7 @@ static long vfio_pin_pages_remote(struct vfio_dma *dma, unsigned long vaddr,
 	}
 
 out:
+	dma->has_rsvd |= rsvd;
 	ret = vfio_lock_acct(dma, lock_acct, false);
 
 unpin_out:
-- 
2.20.1

