Received: from mail-yw1-f227.google.com (mail-yw1-f227.google.com [209.85.128.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B635E1E1A08
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 16:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745252257; cv=none; b=MuKfQg0UXhLkjDWoFy9xjp8TwqtFIEMedgmJpf4Qr0SBJQp0g0o5sCyL0Z4dlrmqD1JVi8yRyoGtwRJVn491qFczJnojzXqnpdEsdDV8P1Ky+yHVbOo2jaJMQCeWr99RGcbmZca6PybkjXw5Dixfg/dflVLTogQqBkquZX5q/+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745252257; c=relaxed/simple;
	bh=E1OiFi1Ri/R4+joSCc1EuZIXTnk7SQ33CimHFvyWh2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=brHhX4zceEzmuCozQB62rASAZrUo04p/IzWHX6ijT4QBerzhgtT7cJ7S0AjeARng1ZpnDWg3CmmtRow0QTdFyZJIjywsvxygIQiW5ZUQHKxdEUH4xFT9s/GVcHmeQQSAfYOf49/M/6GL1QbS7pNNkKPG87akLmjnxmCCfvLOn0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=WEOSqUqS; arc=none smtp.client-ip=209.85.128.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="WEOSqUqS"
Received: by mail-yw1-f227.google.com with SMTP id 00721157ae682-7056e505b12so1743147b3.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 09:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1745252254; x=1745857054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DUxZ7QU0ZXlmoVmoNYzkqFHZEXl8rPwJ/hBKAw0bhQE=;
        b=WEOSqUqStOypbgaBr/vo2C5xaiaLw3pKfnPZp6Jw7tbhb8Z6Lnq//XuxAb2HRy0RRB
         KrTZN9Qu5lUFNcmdlS4On8NLKLd/LglEuY1zR87pXUo964MuzMjC52OPgbkmrGZOvz4c
         RtPvaVQ3R2gzhZ5wPB5imb01ng8jbrgokGotv8hI+0I+c+8LQlvJVn0b/w+7yPXEsDNp
         PzTunYkAC5xzCbhfX9gW0BttLzAjdqHpc0XjoBRRXrGfJhcmxqMcS553fJInD0jy0Nsl
         4VhvvGgmhM09H3elJ/qdMbgPfNQM/Elh9aMJwy57WXgQyYpxuCPo9fbuDtWKfxebG1HI
         csMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745252254; x=1745857054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DUxZ7QU0ZXlmoVmoNYzkqFHZEXl8rPwJ/hBKAw0bhQE=;
        b=Xf997xpV5s10BxwxBRchf94rNWQPJaD5XepwG3a+jD+Yfgqn429HcSiR5tKW1/zggy
         Sw8xAGxXHjmqBUOWVJj3LllqLmY32QV7aRncRtIwFH9v0TXakRlI9H29/xwM6MdWF0h2
         LTrMaVjQWidBaKZ5dkUMr8SylyJd16C/os8TJ8k3SVPbiy2PhkvezgMDqIp4oKvQN3Oq
         SGG0iAbmH0GtmNAiT5XYG3W5bUhLPH0VCsYv+BgTzNIk8EQIfcZ5ASwDpJwYOR2yySh2
         brmxoG3bP3dAChUWEZgx75cK0+yNk+0WxIgzJLJC+2unu0VKxlBxqzQ/RkXlVGHkeJFc
         qlFA==
X-Forwarded-Encrypted: i=1; AJvYcCUkAILgL4TGp8P1miStazcF5Ka+Tg6Yiw8Mjl1uq470NNKXOzrDhVV7tUU0nfYPOB6IKsmV61rck/7qwBw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoOkdG888RT4X0MQhg+SDzdOQ4BDXfkx2MTptVKa7qwvXs927M
	g61tw6iT0/RV8cHMQDL4qo+q9qWTAhziyEwRtbrwhGf/nWERdEUn3pOX2G4Yy5RHZO1o2aBfJte
	PR1iYrOk6/R+ML9YtAzs4nZFaqLNyUTe0dBEeAirqIS5yM1L3
X-Gm-Gg: ASbGncthZaWvpxLSXJAMQKG3dVXs6AyLAx2TtH/XxxAN3ekp/8As8cK/Q0ZNsGgnRrE
	SZNeHMUAvtmINc5w22fpZuTycjdMsfWGwR4hLCV1pIn3W3kH7ReiSNtwU3Or4vwhNiyMsxYnLUJ
	Ywgu534X3NCO7QDjGufu4rtYNYcx44XCXBidaa0g1NpuvdHVveByUxSOepgNEa+3iHSJtRzRoyd
	40+xQAKc2Bs4HnWcfSM/mU87M1K8guRlIc635tBeU/TlwPjDYgomrathbBi8w11KiWgJH0JRJ/A
	Q3CbDhzxYWEmq7F9d3s8O/x1t0iw7Q==
X-Google-Smtp-Source: AGHT+IFfEX42iuZO8gjsOnTfTqyOtwPhA9HRGOGMlq76Al8Bo4QESh6GwJGvRDzU3Xned10EsTlCAb4S50nn
X-Received: by 2002:a05:690c:6891:b0:6ff:8418:5afb with SMTP id 00721157ae682-706cce0cc7cmr69058607b3.5.1745252254618;
        Mon, 21 Apr 2025 09:17:34 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-706ca5ba93esm2541257b3.47.2025.04.21.09.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 09:17:34 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [10.7.70.37])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 0A8D53402B2;
	Mon, 21 Apr 2025 10:17:34 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id 04724E41856; Mon, 21 Apr 2025 10:17:34 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: Kanchan Joshi <joshi.k@samsung.com>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH v2 0/2] nvme/pci: PRP list DMA pool partitioning
Date: Mon, 21 Apr 2025 10:17:23 -0600
Message-ID: <20250421161725.1610286-1-csander@purestorage.com>
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

 drivers/nvme/host/pci.c | 172 +++++++++++++++++++++++-----------------
 1 file changed, 99 insertions(+), 73 deletions(-)

v2:
- Initialize admin nvme_queue's nvme_prp_dma_pools (Kanchan)
- Shrink nvme_dev's prp_pools array from MAX_NUMNODES to nr_node_ids (Kanchan)

-- 
2.45.2

