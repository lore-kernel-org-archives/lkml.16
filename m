Received: from mail-pf1-f225.google.com (mail-pf1-f225.google.com [209.85.210.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD5C199252
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 16:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745338815; cv=none; b=XdyRRpEp7l1mNDonclu/XkK5joY+A25mpRMEWFYAPTVhmR1xAEgfyqCLVsi2yDl/zjEQqlN+ZG5oS9Bu5DuqKz5TP+M9esL+A+hkbtOCvNT7cxK9/zdtT5j7RacpWiuKrkFMNfO2ZviiVnCkHORZNMk2GU5nJX3kiUI+YCrrB+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745338815; c=relaxed/simple;
	bh=aePUfguoagPSxYwq1nJdQs+Esxkqrsl7O2KGFmJ5r3E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PaCwXnJI48K8uJ1Pq0ZxWWnJJb07TRQ1kh0vZfv4pDWDpmhk2Zy8OXW/XD8usZrOEYHYWif5yEBe94HO4xYSrcbvHb70GSMCzLItXQRhe4frLBwDqU0xPetHPFbJHerD/zHsUPV/8vmdQVeLj1a1dCLdc5ngxanN9IynN6G2cgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=Rlq/SytP; arc=none smtp.client-ip=209.85.210.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="Rlq/SytP"
Received: by mail-pf1-f225.google.com with SMTP id d2e1a72fcca58-73b71a9a991so345349b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 09:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1745338812; x=1745943612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oNVBb0MqY9bnizbNO6iQSnsW/ylB3mD8UiOtg+2Ac/Q=;
        b=Rlq/SytPxa6OEav5H5mpRYhtYL9+Q/noji1DV58EvzP60QmtNCrSHfAVuxosDf3yt0
         mj+IXqPntqlHQ/ePaiV/wPMDb38aV50RJAt2uOZJ9hYIN5m9oQMKJ8x5ijRoOwoKk7K6
         Mf2q0giCaP5mRhC+zbcE3C7IBnw38iAZ2KtvSiTnnenXppW6y5T+HIVASNp5U/Y+dJZr
         l657FJ7RtWVfnCtnnkSeqY8cGZTpPbvlTAi44ayuTWYHdZ8xA92EOdL0Syg3yoWDqScK
         NnR/3EmadXKfIHwjzzGsQ4MZyNJ/ByAfWEJlBOn6I/YKSXywXFobXOuuAajitspJdFtL
         BbPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745338812; x=1745943612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oNVBb0MqY9bnizbNO6iQSnsW/ylB3mD8UiOtg+2Ac/Q=;
        b=jKK8XwtxWNuFAJdkXMC3+UND5IjJrVQdfa98fm7a66MUnNPz2Yqm4yfCZQ84mZyLJC
         LAik5o9A397WyM1TysVlKn3m+ADNl58nolKBZSI3h50q3NBG6O4t5JWExwWMyjEHGIoj
         0XayEPWPNGcwP+2g332pVVSKr6nwJLK9tZZ9RQUP8NTcdDE3q+1iSMz+Aw9fwGmYDJ7I
         /FSsmAwS/Pp125uY/Tgo7m3zCFMttQT2JTGPyhqKR+yLs+2nHpQjHfrMb3vNOlKcFV+L
         w9rP2YnHb38A8mGt16K91efeZhEeXCI3x5N7FZhqqjJZOH1TqTqotG3mfC1k177Rxt7t
         4NPg==
X-Forwarded-Encrypted: i=1; AJvYcCVwWFsjtfKe/sRdlmaT2DyUKLaJjiI2dQKFjWikj8dDUR8te7aXBVNfW1ioQ2tOYLDYVsqzMisRxA96IYs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx4GAxHBx4hXSxxMc0FRweRic1OrYXBbVUvOY0Co9GOOAwQHY5
	eGzJ9zGw8UJduwcSiX7DtrgzKWO65rxe3vyEz+rcBDJXtbrlI6lIeePlaXalpQSTFn3wA6EA8f5
	prifI6/X03V3gUabZgEIakINOrho+9DwTjssns6+KA2ptFXKy
X-Gm-Gg: ASbGnct+/0xPaJW9nxWpW6aJkZFCWy5V3oi87tGdA0TWwnKy14JWciFvIWPdDOtcMnW
	/ioR1xFwO/pBysto1SCSGwOisdSq4TCDYDusavoEfe6zZ0/e9GSaj5kr6ecuO6fPXyfYNx5NrSR
	mAAfmYaWWpXPsHQkx/CTuhyESbLHhdi1BL0CO0AJtFXGRN2nWF7UWW078k+WmDIrP05ufhJYYJf
	U3FqRSO4rKcjpSLdaziiZtwVpnv9Wwm+QRW1yzqUarSAGz9FwIidQbAgKDJOiMRslb3OOSaDJjj
	RSK8sw7mVX+vTXTdL5YJirxKzT4P4A==
X-Google-Smtp-Source: AGHT+IFqneHEUyLWKxuV3RY8bdak0hnOR4vOHEeFKusLA5+sXmlOc6nAnL/VHqjyoo2JhAD3vCqEFwmeSZnZ
X-Received: by 2002:aa7:88cc:0:b0:736:442d:6310 with SMTP id d2e1a72fcca58-73dc1610237mr7975003b3a.6.1745338812486;
        Tue, 22 Apr 2025 09:20:12 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-73dbf8c0b4fsm513932b3a.2.2025.04.22.09.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 09:20:12 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [10.7.70.37])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id C11E8340363;
	Tue, 22 Apr 2025 10:20:11 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id BB140E41D06; Tue, 22 Apr 2025 10:20:11 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: Kanchan Joshi <joshi.k@samsung.com>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH v4 0/2] nvme/pci: PRP list DMA pool partitioning
Date: Tue, 22 Apr 2025 10:19:57 -0600
Message-ID: <20250422161959.1958205-1-csander@purestorage.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

NVMe commands with more than 4 KB of data allocate PRP list pages from
the per-nvme_device dma_pool prp_page_pool or prp_small_pool. Each call
to dma_pool_alloc() and dma_pool_free() takes the per-dma_pool spinlock.
These device-global spinlocks are a significant source of contention
when many CPUs are submitting to the same NVMe devices. On a workload
issuing 32 KB reads from 16 CPUs (8 hypertwin pairs) across 2 NUMA nodes
to 23 NVMe devices, we observed 2.4% of CPU time spent in
_raw_spin_lock_irqsave called from dma_pool_alloc and dma_pool_free.

Ideally, the dma_pools would be per-hctx to minimize
contention. But that could impose considerable resource costs in a
system with many NVMe devices and CPUs.

As a compromise, allocate per-NUMA-node PRP list DMA pools. Map each
nvme_queue to the set of DMA pools corresponding to its device and its
hctx's NUMA node. This reduces the _raw_spin_lock_irqsave overhead by
about half, to 1.2%. Preventing the sharing of PRP list pages across
NUMA nodes also makes them cheaper to initialize.

Caleb Sander Mateos (2):
  nvme/pci: factor out nvme_init_hctx() helper
  nvme/pci: make PRP list DMA pools per-NUMA-node

 drivers/nvme/host/pci.c | 170 +++++++++++++++++++++++-----------------
 1 file changed, 97 insertions(+), 73 deletions(-)

v4:
- Drop the numa_node < nr_node_ids check (Kanchan)
- Add Reviewed-by tags

v3: simplify nvme_release_prp_pools() (Keith)

v2:
- Initialize admin nvme_queue's nvme_prp_dma_pools (Kanchan)
- Shrink nvme_dev's prp_pools array from MAX_NUMNODES to nr_node_ids (Kanchan)

-- 
2.45.2

