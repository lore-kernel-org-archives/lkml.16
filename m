Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C347D3F4
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 16:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745254555; cv=none; b=kd+nS5VlCjDg+iLxva2Wmk/gIaJ0WzYbwu6oJ1hp2kZY8OGcCGLo6m63hekpe6V5sFP2cDbVtJp8lgypZrZa1lEGuAj/bpCM46eSkcM402mJLF630jnfNlEwQl1uCLRCIf9jJbwgNnT8D55H/8R1Z2SA9zsWgizRXsIQjXExP1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745254555; c=relaxed/simple;
	bh=gEX+O5UW2Z75j+DFBcZysD2JTqUsvj+FynwKucVwP0c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jvz0TQPcKPHF3taAjeCGKE0OQsnuFRU1QmHBDOv2U//wh5JGjCaou1SsuUTx+6GFir8OhimXCCZpY1alAzbanudUOSL8weeQNmBWj3nlDLS0J0NpUdkJkNp2TvbuWA9YogbB590lnA/Ng4F+OCu1Qrf18Q4aL6mZyU4SgevAFnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=W3DQt6O+; arc=none smtp.client-ip=209.85.215.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="W3DQt6O+"
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-af51b57ea41so451782a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 09:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1745254553; x=1745859353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uwb+nOHiz3v41n7Ozb7A7o5HskDoeZoACSb6waE9l20=;
        b=W3DQt6O+VOjZT84RUh6/oQWOyZ63EfrkJTSyldc3HCk91/7LQpeNLR7rz5iGLF9nUs
         XL75rvKW2v4lYdml7QBvL+OouNNROgVojGiUOJkOw4vOrcliTJZ9ZKWqHz13oqGycTmD
         /hpbdLjPbaGoUOgj3KYrO1GiDkTs2FSpedUgFs9/CJhOsE30Dxd0JcFGqqaxCBTuS1sE
         phy9V3Cbx+Ouh6gWgxNE4IKNCAcwmJV74Ut/1iymD9Wa7pW2FF1pDQKLRQsu2x8Yq8I3
         2ZD8GEKH8SkTInIzzvIGXH64gTiA5Upn3NuOr1xDpBKGwkMMPdL4BFhCdS8GiUuVH019
         akzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745254553; x=1745859353;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uwb+nOHiz3v41n7Ozb7A7o5HskDoeZoACSb6waE9l20=;
        b=qK8n/AppVsx6SbsiekSBhmvljSOd6dRa4tY3DITiq9hotiN0bKEkFIViA2dLvZQqbP
         ePYYsVi9JKynW5m8DMnOFXMzLZGTfUbN56INQHZoqXiUt3S/Ka3RPRIE/ORuT8LUXsJp
         wx38FFLUr/xJmqujOgN4vw5+hd76iqc1CZi8Z+dFIh8SL53VbpRzepZQajyzjt6an2GO
         NjtObk7VqRFAmc22Dyi4CiephL8P6JzmQ8B6OCehyfCSmIHxFcW6l6oz0oXj/jeoFC7B
         IhoBJOFvCNeDPpXJ7G0HXhtTfc9BPzP8hbmXxp8msjOKUuWjVcK7GaEdt6ILkWzgFgwc
         KDfw==
X-Forwarded-Encrypted: i=1; AJvYcCVuDRtqmQ4bxYmsY2zc9ngGb/WdDCiHKIgWGVDgIngTUzxs0ZWuqQGvKFmRxxPDZE4szbW0ijtK2Gefn/0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwN34Pa62zCdf+/36pmn25rCE0r9/IM2Ad2e4zzBLTvGIleJwaD
	MbJ8TDQIAzPnB/eqMhbPHhk2bHDyyujs3pB67KpxeX6/5VxR8AMu0nOmk5zVi04QEFCqpnYgYZa
	ud63fZPacZ4jfiYGct0o4Ay8HFJvFwWqg7IxISO/hfgjuFX9Z
X-Gm-Gg: ASbGncsPvccAcM5gKgb7Ro0JlNAcY66GCd8rgo/XLFiiOtGd65AvujsBsxVVYfYDG2s
	GCXNJeQm7N6oeHZZqHpec3FPAuldoJ50OUkcuAIvdpD6OckQX5G7HR0lNTzK4eULQgozo8Nl+hz
	acuFNbxOKYtljjxOuonFTCHBjurOH5VWeUramQtLIAiPH5hUMOIU+t54tW7dmxrO1337ScSjkRj
	oY3RibuU39wHGfTPI1aGjjrYnqENPfwT/LLWO90QfVcH7t2csKjHQWzXcIuDueutFUUnm0ZLvlV
	nsM81oZQ7J93qJv9zVRcY39/kiWfBA==
X-Google-Smtp-Source: AGHT+IG85z2G3DWzfdnI9ROt0oPEDic7f7+JD3nsO3clnZLEeEYh/yLrcOV3fXTUKsric5qazxM88Hpm8ub9
X-Received: by 2002:a17:903:1948:b0:223:5e86:efa9 with SMTP id d9443c01a7336-22c535b4b97mr70058485ad.8.1745254552596;
        Mon, 21 Apr 2025 09:55:52 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-22c50d80d81sm3912055ad.96.2025.04.21.09.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 09:55:52 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [10.7.70.37])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id DAC983401B8;
	Mon, 21 Apr 2025 10:55:51 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id D4F04E4151A; Mon, 21 Apr 2025 10:55:51 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: Kanchan Joshi <joshi.k@samsung.com>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH v3 0/2] nvme/pci: PRP list DMA pool partitioning
Date: Mon, 21 Apr 2025 10:55:23 -0600
Message-ID: <20250421165525.1618434-1-csander@purestorage.com>
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

 drivers/nvme/host/pci.c | 171 +++++++++++++++++++++++-----------------
 1 file changed, 98 insertions(+), 73 deletions(-)

v3: simplify nvme_release_prp_pools() (Keith)

v2:
- Initialize admin nvme_queue's nvme_prp_dma_pools (Kanchan)
- Shrink nvme_dev's prp_pools array from MAX_NUMNODES to nr_node_ids (Kanchan)

-- 
2.45.2

