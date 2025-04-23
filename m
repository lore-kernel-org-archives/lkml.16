Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F9C189F57
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745414522; cv=none; b=ZQS6NwBEMWfzjcW58sHLkysO//AuRRUheoJU46FfsVwL7ub8iOEcy0kHzAwfTAWRYD5XUAWrMW71BKfoxAEK294AzMAAS/vEtwS8SfDMNj/lyYkxwF6Dyi+PE8+QgT7yqAl9Ru/NM20/vOCqQo0v1BmzvstqQfsEu8qHkRbbWNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745414522; c=relaxed/simple;
	bh=Kows0XL7gKJe1i0pLaRBE/Sn74cJUIQtD6WutoBDJ4w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bPEB6TRX8woIt86S2/jZeM0nfBs0mC04LE3bWIN2dNGn0iR+WdVD+FaZTTfM1un/YZriQsSDX7JvbSSRaWZNnxEz/54RxUDxxEMfF8097orF1B1T81UzMw2EUZSl5EaJUvsaW/hDF0svk4t7PmJ3Q1g2PSA5kAko+Jr4rbXDE1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=S9xDLQNp; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="S9xDLQNp"
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3d6d162e516so50140275ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 06:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1745414518; x=1746019318; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yFxbUqe4x1e+3vHnnMvSYfdGB6uDRsaUIx6ClI9ClLM=;
        b=S9xDLQNpEUIHmOMZiW//GTUUsvSii7NrHzNYOFwiGC6L/56nmMF8Vh1yS6+l8VpyUc
         Nit3U6vRiOH+bIC8BI+tAlVIpH11WzKe0ISppzJ0crKo5wvhsAdJllS1QXOVIM25a1ej
         253xFJLcGmLXTt8KUzMIg0GX2dEkIsosNQsh1zJDoM01Lspz5GmVFsIJCCQhdlUhIjW3
         ixG+SQQnY5kWkfeNRjUaszVXoTeUtv2kv6q2L8MdErhYyaHErP6sTdlQsRts/AiZQTpR
         0jusBQ31oo5xPeTfMjY1Y53mMPPHAPm0e+xHTXhp9B4jDOj/7PXKwn28CUqKzpHtuMGA
         Xu8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745414518; x=1746019318;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yFxbUqe4x1e+3vHnnMvSYfdGB6uDRsaUIx6ClI9ClLM=;
        b=MZ/gckUJf+9/GIXbAX00IwyD/q0X4I+3nBCgO15gj5QxP1Kg6bk1qBb679akdaxkmi
         0D7HDo4cymP3Je8ZkKxQQ3zxreZAeug0UCc9soVSkc/iDNL9TMhSSzYGq9mcUIiwG8eN
         JtBv+ICi44pvtoRGNQU9h5NZLRUN2P/cX+3s5pSCpfxeXVNSMzrq8BaQRBaLeLDYdWIh
         eU+J49LHSCQLeJ6UbwS63eFBKN/cJg7+hXy2Bl5qtqlq6uTyZa+gmprGx31UBTHQAXNn
         weg9bwdd392OfoLrSfgK++JFWoANavAQPtXDTxOO8AzHA11L7qXbv2jgk+A+UTASamDN
         hhGg==
X-Forwarded-Encrypted: i=1; AJvYcCXalr8doXE+OF7oZOyC1GOOH4XdPcS3W2FaLROGG1NKXNnOCTpNXB3My1QFliufKqe4+5AQEDg6BGNZdRc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhfBSn2Ud93ikdkREwQp9KLvKMnbLiqzK5B0DpKpA0sTUyoJ2T
	Rj2W3I+RRBeCoHZ9dmDxq5nmYOKJZVZjQqfWomLzd3nKmGlWL+/ep43Uocc+UmhC2J8Ic7w3GIn
	g
X-Gm-Gg: ASbGnctCHqrxLmYXxp5CRZzzVlIjoDeRLf2ZJL5wxm+4lgkJM01AngtEcT5YJIAIq1Q
	guuf48ijT0hJfPpG8lWoHhqYUPUWKjcyAEdUYfpd9YrdwRFCR30ibLisCJuwmJjes3xCGMdEqXD
	a9UM54JldqDFUBUVIdjoynkbWsP5HrqP4iNuudb5UyknkodfMgGL1M+V8MsDZvhNzxjUqJqYWIP
	gbpCi619v9xmyZEXbLicf/RtNookHCJGfcADs7zTXJfhXqb4i6jQ/uvECHE30Gw96Y3BV4oPhj+
	UCLtFVSV3LRnqgw4k4kK3Jkkq4kZngQZqmm8+Lefvs9BesEY
X-Google-Smtp-Source: AGHT+IGTVEkt9W2JltunyBersFyZ6wDo6AvaUWgTrYHtS8zxIbIrUCUZrDuNaD9JWWXTO8zilUtOtA==
X-Received: by 2002:a05:6e02:17cd:b0:3d3:f6ee:cc4c with SMTP id e9e14a558f8ab-3d889047eb1mr178691565ab.0.1745414517912;
        Wed, 23 Apr 2025 06:21:57 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f6a3806326sm2806031173.42.2025.04.23.06.21.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 06:21:57 -0700 (PDT)
Message-ID: <09bde11c-a3f3-4c5a-91ed-74bfd2e0f61d@kernel.dk>
Date: Wed, 23 Apr 2025 07:21:56 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] nvme/pci: PRP list DMA pool partitioning
To: Caleb Sander Mateos <csander@purestorage.com>,
 Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, Andrew Morton <akpm@linux-foundation.org>
Cc: Kanchan Joshi <joshi.k@samsung.com>, linux-nvme@lists.infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250422220952.2111584-1-csander@purestorage.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20250422220952.2111584-1-csander@purestorage.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/22/25 4:09 PM, Caleb Sander Mateos wrote:
> NVMe commands with more than 4 KB of data allocate PRP list pages from
> the per-nvme_device dma_pool prp_page_pool or prp_small_pool. Each call
> to dma_pool_alloc() and dma_pool_free() takes the per-dma_pool spinlock.
> These device-global spinlocks are a significant source of contention
> when many CPUs are submitting to the same NVMe devices. On a workload
> issuing 32 KB reads from 16 CPUs (8 hypertwin pairs) across 2 NUMA nodes
> to 23 NVMe devices, we observed 2.4% of CPU time spent in
> _raw_spin_lock_irqsave called from dma_pool_alloc and dma_pool_free.
> 
> Ideally, the dma_pools would be per-hctx to minimize
> contention. But that could impose considerable resource costs in a
> system with many NVMe devices and CPUs.
> 
> As a compromise, allocate per-NUMA-node PRP list DMA pools. Map each
> nvme_queue to the set of DMA pools corresponding to its device and its
> hctx's NUMA node. This reduces the _raw_spin_lock_irqsave overhead by
> about half, to 1.2%. Preventing the sharing of PRP list pages across
> NUMA nodes also makes them cheaper to initialize.
> 
> Allocating the dmapool structs on the desired NUMA node further reduces
> the time spent in dma_pool_alloc from 0.87% to 0.50%.

Looks good to me:

Reviewed-by: Jens Axboe <axboe@kernel.dk>

-- 
Jens Axboe

