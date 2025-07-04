Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B5324678F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 06:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751610427; cv=none; b=WGrrZAOGlgbOn5kbEN1NW0gflggOjthi9r4Fy7McR0elWUYeohKLWuE/HnNW0dXaMTOVOktt6c5lvJgIx0nJXVU1aFXPF4o01/q15KM9fCU73urKwVZgWEmMIVCj00QGQ6CivElzQa2mbQ1i85QIU3Bt/ioYmriHSFXyMaxd7vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751610427; c=relaxed/simple;
	bh=eqnxbsj14Y9W2BV2T0VsO5bpIYVtD7sCrCgDaNmvUzY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T3WW+PJVTwVZJXbuyvIcXi9bsMvw4Jy9CnsDUcdPq46gn2aOk1kLtKnlTIQ/niX3mmtyo0ePxvZi3XU6M03jQzUFFWsn7F5wAQPzU7IByEcNREJpqssxo9jz0aNIL5b4G6Xox50zahZINWQmyrAn5n9FVFZjeFZFKyhRJAYN9yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=aShmA0qo; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="aShmA0qo"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7481600130eso970889b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 23:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1751610425; x=1752215225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2/oMFootAUhR4O6zt87edsWksnJ6wDOqtWn4lJQpVn0=;
        b=aShmA0qoMQEmPCIoWDrBKAxKBFI8EzaOP8HY/6JTQ9LjLWLJzCRWHnHC+hDpVpItV1
         AADMK6hbmeFQNmkgx0SBJ7XblU+TcZlZsYRiKIM5XLpxmOFSt4g4rkVThkUyh4XrMNca
         owfQY+pJ+Sgvb7zoKf0TSKZschT/U7pD8uIUNRbQqqrV+SuCkLlfSzkDc6zfSCoAa8s0
         LhTnHg+2jkvQbkEAe6FZP1qxNlG4WzfdPHD8CyMmhTpSKmAUL4aZE9yVUsaTp/gp7xtA
         40jWUe+RFBnyqaGk0hi5rCAmPtVRZ3T6WQenaTHzzycFsB6P33guaM5hGLgNHcoLPvrJ
         holw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751610425; x=1752215225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2/oMFootAUhR4O6zt87edsWksnJ6wDOqtWn4lJQpVn0=;
        b=aM73scjuyHthp7CiB3qR9bJHMgMGId4WfX0L6s3Y5v2xbAQDsNSyhOIbvzGjesNC0K
         IQaDre/65fS2F+FKS5S6QH9kLnnq4wXoJvWVMEN7o5I0zg0bAtj7VPj3eQsh/cZAjOJm
         njZWP3dCOrCqPS5sARkmHp2e6uisHYf7toLlFSKCOKDsnj7HoWK/LUk/fGNEn4gTcJC1
         kuv/03xdtxGTr84j5cOZI8btBuDi5IMUwR7Z2+T0G0zkngpmmEqsQ69vS4n+K/S2mdZu
         46J4Cbf7uuACz6hzMegq3rWIejfLcXxTK9bjCOb7MSnX6pTQeCvHxDg0eUqWpfO2iGTt
         7GqA==
X-Forwarded-Encrypted: i=1; AJvYcCWSVWK5Qodaw1FrZ0OaFw19ncrkV0Z20Xul1lydImqtJLD7ze0XaXx1HjdxJZ8HAJmfIgvY7bxpUvuvYPE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzpyt7qvAqVOTTd6Ebh4A6ffxk2cUC31Ge2QPr+SPdiHNzw7jNm
	Dbxedfk6TgzioT3d5lV8yjwC92sm+vcajH8xJdjRRSXK9QAV6dD5Es7JaD3svH2wcYo=
X-Gm-Gg: ASbGncvJ95P0InmBuvkxhhDtwHVL5Qf67dTULnZWR+NgU79fHtdmSDXciTrlWQlGQAX
	5Q/LGP9wqsf8GecrvRNMhInEzWmvnOqSuB1ZyuQ4yQw/yDD9YN3GtHmt9s8aGbuUeg4krPA7z1H
	b9Gif8+ucma1lNGw7LjNSOQgE7bGcWd84NGsuUKtDHHtCIBUDMXn2XkDVZBdqBdq6H8oNkWbMSV
	BwZThBTL1XEiKsgxt7xYY8pWHMu7JIW5NcaPqrX4GQX36/unaLhTd6QpEuzb0u47zU3au5oZStZ
	12CMkxSEW3W1SsyiqWOtLelapHUA0mMsLkeQk+3+zVdii//JbA/JQ+PIIs5XfgBrqDpVcoMtHvk
	5Ue3I5NIp65CS
X-Google-Smtp-Source: AGHT+IG7T3GkhpHyXokGGwnbLUIOIE+bDXBFA0sb55px9wI3AAa5v6JbBWaMLj5Gi0BMN4In5dKGIw==
X-Received: by 2002:a05:6a21:6b02:b0:215:d611:5d9b with SMTP id adf61e73a8af0-225b85f3f18mr2349868637.12.1751610425169;
        Thu, 03 Jul 2025 23:27:05 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee5f643dsm1183240a12.37.2025.07.03.23.27.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Jul 2025 23:27:04 -0700 (PDT)
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
Subject: [PATCH v2 4/5] vfio/type1: introduce a new member has_rsvd for struct vfio_dma
Date: Fri,  4 Jul 2025 14:26:01 +0800
Message-ID: <20250704062602.33500-5-lizhe.67@bytedance.com>
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
index b770eb1c4e07..13c5667d431c 100644
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
@@ -774,6 +775,7 @@ static long vfio_pin_pages_remote(struct vfio_dma *dma, unsigned long vaddr,
 	}
 
 out:
+	dma->has_rsvd |= rsvd;
 	ret = vfio_lock_acct(dma, lock_acct, false);
 
 unpin_out:
-- 
2.20.1

