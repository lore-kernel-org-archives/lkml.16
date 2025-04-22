Received: from mail-vk1-f228.google.com (mail-vk1-f228.google.com [209.85.221.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C37127056B
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 22:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745359806; cv=none; b=tqft+nLwgjoUD5G/HKp2sVGiwh2aEpKg5pGRw6cfv4JPfBEXSFnRMn8GUGqvDfGys8It6tibaebkc9D506ToKdD2RU3pSYx9TUu6sNgDdXKM/4v686YIVWVPQiwUKtGdLEWOYeAlLDE5Vuh5AcVH3EqL5uvXvaPW/FGBmwcl0Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745359806; c=relaxed/simple;
	bh=99JxTRLgZjCmHoulfV6B/DMSLqRmfo8mvgyjr4bpb3M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hNhvODXiFbwHmvxNbEXcwB8xoelsnWx9LyqfuHeujV5NlHj39gcfBBeIu4dmM9VAstK4IJ2CN2+BmRrSqBqvlDYTj0gkckjB3DZ01uSwaW0XnmoIqQbELtBTBoBInvgKNCILvMqI3Qu5kKYP9b3/mQjGmxkEMkFtqEztEhSEjXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=O3NYZ6v8; arc=none smtp.client-ip=209.85.221.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="O3NYZ6v8"
Received: by mail-vk1-f228.google.com with SMTP id 71dfb90a1353d-5240d07fee1so130066e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 15:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1745359803; x=1745964603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KwOPiQZIcSoYiJQce8m9Bf0/9Br1sjvbT2lnDAfcS9w=;
        b=O3NYZ6v84M1q3AawtzDDRbDGDQNFwyHCs8gK4Ah2KVHUNBB5N5qyDomgPDVALNuyzK
         ue3mwYuFaEdb9VdFAmUPDCY3SmeO0hFx14O2E7ixc9pmLm5ZLuXZdJiBcHFvDUaOcfZ3
         opivm2piMMY+J/zVwHCe6ish3QjD9ZOh1JNYgYc+S6prxYhH72c66onGCmoYpUO0K4f4
         kjy4UwtaUk/SOA/VRiOY54Rkqu+9VoMlG3LC9G9FYXNGV2T3Jwds0tCXVMiNnsR59/KW
         rVXvYI6JDxIl2s6kd/95VhLA5ZkPKIYBjSjuuuC4zgOvQMse/lxSvO46FDemIT0vKhlH
         ogXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745359803; x=1745964603;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KwOPiQZIcSoYiJQce8m9Bf0/9Br1sjvbT2lnDAfcS9w=;
        b=A+knTPj0+GYZRFWdqsbxka02NYtUSTw8min22Fj9u1TEpQWt+WIDNUZt4pFClrt4pC
         zrq4JeIPBsqFEntP91MUfdNg2x+20tq0plkDqkV7GhaQW5F5ytEN7q2hXvCZCjuO19FZ
         iwBbXPjRD7J544S47votcYwWGkOA06axgFpmjKtkCKYBLZumpljfpVovvMS2mR8qGguE
         5dELsL5whhLUN5S8StkFvp2vJbMbbu1e6p3OAbBZdOxzPBwnbTxqZiWGESQqUC3gv3hK
         ph+MlfYP3nObjSSObUQO6OuVfOPtCj38Farg7GP+fP5/wtbhZzuylZPGBHNiCdpRVmTI
         QzNg==
X-Forwarded-Encrypted: i=1; AJvYcCU6QIfd0mkNRtybPP+OSF0p4U48BQv/4MP0sQCE+IF2+/QZU5rULnU1tWCaSfS6r0po3TEe0IsEHHqWQhk=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywhz406AkHa7SnzdyT37rHkvIGkjYajt77XPhJqHZnv4Utuz330
	88LAvE0oPVb1bP9Ivp0lYAq5qA1LG5XBYsWfDwuerpDvy4HApzrqr4UkiVZzRf9YUuOO47TqTSV
	g0/Cpqo+6Wifccw6ZcpqHpGpH4tYNLS8r
X-Gm-Gg: ASbGncsu4EGHQJ/05eIVyAI/JqbmHdfyqCFB3aqwL5trQUz/n+L+PfzLrFiu0BQ7gZa
	wm5YZ9K0uyEfP1y4E4sHC9h8pN9XOGXiEI4aqgcFMYUUovd38MvkHmTwfiK7IB4z5R5K0ebK5JM
	CT1vmolK9Ok0cb861XWbAdmwzPiy++5Zy9fcjqxE/LrukGXzEQ/htbJOO/D8ttmsGujYQJ7InlT
	bgFx6FG7Q8xUUAV9Q/n/L9iHnHLfv/6ByHezXkU9PV8sqHLvgpq57Qtn5g4AOJwdp8kwmd+sIfE
	45tfrRP8qfYKhG3SUrfsJCd0Dap415IiqEh3YUaawTVd
X-Google-Smtp-Source: AGHT+IFxdjGFL/VvbqbDrlnoQYfdKyqz0v7X9GEE7nLpcx5NH6BX81xcZcT2Wtr3f6QKNmjvv2s/vLJ60LMH
X-Received: by 2002:a05:6122:1051:b0:527:67da:74eb with SMTP id 71dfb90a1353d-529253b58b4mr3568089e0c.1.1745359803082;
        Tue, 22 Apr 2025 15:10:03 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([208.88.159.128])
        by smtp-relay.gmail.com with ESMTPS id 71dfb90a1353d-52922c112ffsm364279e0c.5.2025.04.22.15.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 15:10:03 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (unknown [IPv6:2620:125:9007:640:ffff::418a])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 6653234045E;
	Tue, 22 Apr 2025 16:10:02 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id 60268E41D69; Tue, 22 Apr 2025 16:10:02 -0600 (MDT)
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
Subject: [PATCH v5 0/3] nvme/pci: PRP list DMA pool partitioning
Date: Tue, 22 Apr 2025 16:09:49 -0600
Message-ID: <20250422220952.2111584-1-csander@purestorage.com>
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

