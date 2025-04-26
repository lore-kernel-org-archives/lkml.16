Received: from mail-pl1-f228.google.com (mail-pl1-f228.google.com [209.85.214.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB623C0C
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 02:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745633278; cv=none; b=QzFfDSO11lrhihAvCz6/EX5CRjhhyX6OWTKeRpWZSvKapap4+cHEvaKTLmeV3juuFMCi+mkghOLSX4S4kLjLmSqyoSTp313KHWFMIXzQolt8eOX3uBAEvHb1EbNv7mlmzfgxO0EeqFwqDGAgi6Z1pwHPtzENDowIFZxaURYoQ2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745633278; c=relaxed/simple;
	bh=+s7dlgsCJG6+RpbfUGIZ4g0L9QkJkvw0bWRAEAOhKFM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SHnBK0MWokMmjvddJ0j7jM875ycRk6rkxdzO19glnJYmmTq9ksnaYOr0mcf2+Y+DrSdvzEKCzxEC8xxxu5YLp7V1fNtxsNbapbdNI9Q6E5AnLgySVKvq6vQY0ttzG+PuvoTxlQG3PVF+uBMG7arp+4rbAArlhWrBhFIao/GIMYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=QLkHEvLm; arc=none smtp.client-ip=209.85.214.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="QLkHEvLm"
Received: by mail-pl1-f228.google.com with SMTP id d9443c01a7336-22409402574so6206905ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1745633275; x=1746238075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sPxqdCfTuK69NF/+HUMCbay3LkIJWJ0+Y27AGW3mB5w=;
        b=QLkHEvLmJ2qCqWxVzrGVkFizezVqYYdSzH/g64DCsOSnsvW5hWsUAmv2t+OW0p+wV+
         +86smBqOsA2CrL9HRm6Kql81GoCorcKITDuOVYTMm9symx/FrQR4FsjbSEwlqdeawLvN
         6kSXzTWAqBrnOWuPckPBwKviGkDxln9t3rOm6jjgCNu9wofFA86YFiR/rD6I89E8kJ+Y
         sgfSXO7FrltpP+GbtmH9iPL7au5tVmslQ6cUABLhL7bQLwrc3+mzgoUHR5r/y/8AFKMq
         nKrg617kNh6zv7/uELpVZcA9aylfZlbEk9Prg7mX3l12VAO+QYMW6LnkWKNksAW8Ojla
         xIGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745633275; x=1746238075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sPxqdCfTuK69NF/+HUMCbay3LkIJWJ0+Y27AGW3mB5w=;
        b=Q2cQ/69EM8P4j7BidhqxNLiCRKluxFaklBs1iJXh9NCqAdnOPDgyEzdamlzS0H/ciz
         s1QEbzk+hdFpBJuOgOfc+bW7zdrSIJGFHyydnyJm7ZUXdB6ex03CZYzSW3Ik2daIfw5z
         pvOGWwIf+rivAMLw4vLh1nkg0x26NqwjGnpdYrXwIc987oG2a0ca8BENhJiKm+M6CVg5
         vBs0s8eSpReaBBWCNzpXNwRBV8jkzGBJukTnCCED768byIF0bjurZaWnbtY47yOSyueE
         AlztR/cxqG16SIRg52s/Cu9lU46wZZSh2pAdYg862CmGUadRm+3mtcrUaR0gVc8lSXif
         Tr8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWh1xRnxwozf5L6gPPE4ySdMMZy/jLlkpgR7ivs1tjlLIfLz5HwSH0aibrMx41xwV90ONiVQwDbQAxcTS8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbGQ/R+cCftGQhP4iOFo8ni7ouTeXwlMif7PZKDXfmT5l74JQk
	PJBc8GVrh2B2QkD7KyKiw546jNnxpMR1n3yCYFyj4RYWXqPf5IouwekwKTH8EqJdxP5sZp3lqmF
	uK1Kc9tAwr2KvkBztytr2y8WyHWF+B2szahD/n9MIVogidiSQ
X-Gm-Gg: ASbGncsYpfoTN6FZbVKgDtxX9p0Pv3avBTCOH13u08bvwKwo6pN8ynVtZv1n0q7VEXY
	8Kg84rpLjGpfBPuEaPtuhuyGmKIRh3N43uPKKIpJpmk1wTlhEoUZWNpNeIRXUMwfq2aIM69OtOC
	ackg6JZRoo1l/0GrbY8ZvPSqY+5QgmiQcy5e52PEq9PTRlGnzZRuBtIrcKuRJaex+/sAaTIMHWX
	CUPl4aqmGUq2TlaWlMhDZx31fU7rNiTu1jzTyul/kWKnq/yUQls4DDC/VxMO7u958sw22z8zLhE
	TLzfvBbL9K5Pmlk52tRisW6ci5pFIg==
X-Google-Smtp-Source: AGHT+IFJ+vxaCgBpvVNBnx5B9FTFi2A9sP3f/GstK6F+GJAg/un/9eKqg76budhFn0fn15Cyl/ImHI7SsnmI
X-Received: by 2002:a17:903:2a88:b0:223:28a8:610b with SMTP id d9443c01a7336-22dbf740e51mr24627175ad.14.1745633275567;
        Fri, 25 Apr 2025 19:07:55 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-22db4d9ffb9sm2054505ad.4.2025.04.25.19.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 19:07:55 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [10.7.70.37])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id E4FCB340231;
	Fri, 25 Apr 2025 20:07:54 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id DF47EE41C66; Fri, 25 Apr 2025 20:07:54 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Kanchan Joshi <joshi.k@samsung.com>,
	linux-nvme@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH v6 0/3] nvme/pci: PRP list DMA pool partitioning
Date: Fri, 25 Apr 2025 20:06:33 -0600
Message-ID: <20250426020636.34355-1-csander@purestorage.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

NVMe commands with over 8 KB of discontiguous data allocate PRP list
pages from the per-nvme_device dma_pool prp_page_pool or prp_small_pool.
Each call to dma_pool_alloc() and dma_pool_free() takes the per-dma_pool
spinlock. These device-global spinlocks are a significant source of
contention when many CPUs are submitting to the same NVMe devices. On a
workload issuing 32 KB reads from 16 CPUs (8 hypertwin pairs) across 2
NUMA nodes to 23 NVMe devices, we observed 2.4% of CPU time spent in
_raw_spin_lock_irqsave called from dma_pool_alloc and dma_pool_free.

Ideally, the dma_pools would be per-hctx to minimize contention. But
that could impose considerable resource costs in a system with many NVMe
devices and CPUs.

As a compromise, allocate per-NUMA-node PRP list DMA pools. Map each
nvme_queue to the set of DMA pools corresponding to its device and its
hctx's NUMA node. This reduces the _raw_spin_lock_irqsave overhead by
about half, to 1.2%. Preventing the sharing of PRP list pages across
NUMA nodes also makes them cheaper to initialize.

Allocating the dmapool structs on the desired NUMA node further reduces
the time spent in dma_pool_alloc from 0.87% to 0.50%.

Caleb Sander Mateos (2):
  nvme/pci: factor out nvme_init_hctx() helper
  nvme/pci: make PRP list DMA pools per-NUMA-node

Keith Busch (1):
  dmapool: add NUMA affinity support

 drivers/nvme/host/pci.c | 171 +++++++++++++++++++++++-----------------
 include/linux/dmapool.h |  17 +++-
 mm/dmapool.c            |  16 ++--
 3 files changed, 121 insertions(+), 83 deletions(-)

v6:
- Clarify description of when PRP list pages are allocated (Christoph)
- Add Reviewed-by tags

v5:
- Allocate dmapool structs on desired NUMA node (Keith)
- Add Reviewed-by tags

v4:
- Drop the numa_node < nr_node_ids check (Kanchan)
- Add Reviewed-by tags

v3: simplify nvme_release_prp_pools() (Keith)

v2:
- Initialize admin nvme_queue's nvme_prp_dma_pools (Kanchan)
- Shrink nvme_dev's prp_pools array from MAX_NUMNODES to nr_node_ids (Kanchan)

-- 
2.45.2

