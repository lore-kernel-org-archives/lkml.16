Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEE727C86F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 11:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745322497; cv=none; b=TgErUEUnf+WOI7vD1VL+WjJGqofRNbchUglyO8cz61G+K6BZ4/jFBLSFINTmIA5jyhPhpfIwqRnLHc8Pzj/Rw6qbqPNkDq4JjJy9jACeazyKn+pvA35i4swJw38WINwAkbz5E4nrOSDQGwN0+sMJOxOlO9y7w2a+LzDydm6Rgp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745322497; c=relaxed/simple;
	bh=mfVE6V6xZdPQ5PVjy4OEKx90XteIh3s8VquUxI4cKgw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cFrhj2TyOmkcxCT/weGGFUyU5qSGivew/eS1nvmpUyqvKxd9Zhjiw6pAuZE3wBlJVAZPVNPsdRojjrgTfc+0a8vPCj1UlMYAwByVYK2hZe2hwBgKdj4TqrRVNg7UrOQzp2XYwDJDXJ+IOU9b5DDYGOPUE/RSZq03O5SMDNTtuV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso37044455e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 04:48:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745322494; x=1745927294;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rd9mpww30KfCTr7fFwwzdbYpEpm9V77w7Sk1CvWbaAc=;
        b=LBR56Mf+tjXjiuRnAlmFLZ4IOvbtW9Ax5gbMJeB7fwjlZZu6AUdY8ZnKc8iOitHyxt
         0lf6OeYsGj1WeMqcQltyF7NG7qoU1qftZftve9EAPBrKoytE1NxmnEjuQtctzzLJYUk1
         jOX0hWQ5YnOaxSDaWAmjgkSCJaLPRXFZWeqlsjpXNURVPeYsRe3MeAmaCgp/cWDiozDF
         QV22bNJ5hwTh1io3kwaPDZBbC8FuJcyXWYlodx/NsPndWurJgOoz3VaIc4Q6WU7YNp9G
         M1VKq0P/q9ta0+N0FYxRnmB9xddaGRfdUw3/5qNjazRNTdjgqWJ3NsT71xUSpicKALea
         Pyeg==
X-Forwarded-Encrypted: i=1; AJvYcCU47c8a7n5OQg+VYLARFGTLc4oP44vY7/Im6i1RPjb2XuUKhks8t2Zz1kFt2cj6fMk3bwcylhqmHH/hd2I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwelIC3K6XbvhMCwjtE+kj4xlIYFRc0cZspiIuFPW2UabqUSbqC
	kQXVrcCw6O3iAujYqTjVIh4l/9hLVCC82yysyG8jDGvM08OGvC5y
X-Gm-Gg: ASbGncvUfDn/X+9yr2uLRASv6CWslhHHLanMJ5db3f1V9aFeyIfvPUOtD01Ny4IYjeZ
	HZwa4onNN+FBaGx9OW/36JL+p44YntygQGtwIVIZg4mPNqP7GkG37JQKwCGC0NrJbB6J02b4Hvl
	TOzXtE/DuvBXVXT5Dy/yqMc2ejhuOoiYHxhkq9H2pbWxqHiqi+6ZB8d7i9W+hVTFFH0nM51WEMn
	z5pbX3tjIbvV4NZuMFxq3mWUqlaCYVpiESHOjic7I7TjqY+yBpEVNTD3tq7uKQE2SgSc2NWKpHO
	0iHmLXeOXvD8eSgkARIi5hk4atpgmh6zziz2zgTHlD7WOJ9M7dWPk7BFDS3xg9wKYGMcGk4lUjm
	80Mw1tg==
X-Google-Smtp-Source: AGHT+IEKsk0gnKO/XC4zScRVkpX1Ie7Ny5ViJQfVzCiVrieXqCEHQly9ujKORgiytv0YRGPXmAbOrg==
X-Received: by 2002:a05:600c:1c8f:b0:43c:f44c:72b7 with SMTP id 5b1f17b1804b1-4406ab981c5mr135046415e9.14.1745322493645;
        Tue, 22 Apr 2025 04:48:13 -0700 (PDT)
Received: from [10.50.5.11] (bzq-84-110-32-226.static-ip.bezeqint.net. [84.110.32.226])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d6dfed6sm170150065e9.35.2025.04.22.04.48.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 04:48:13 -0700 (PDT)
Message-ID: <4cf8af38-419e-4d7c-95f7-7248faf3c7bb@grimberg.me>
Date: Tue, 22 Apr 2025 14:48:12 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] nvme/pci: make PRP list DMA pools per-NUMA-node
To: Caleb Sander Mateos <csander@purestorage.com>,
 Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@lst.de>
Cc: Kanchan Joshi <joshi.k@samsung.com>, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250421165525.1618434-1-csander@purestorage.com>
 <20250421165525.1618434-3-csander@purestorage.com>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20250421165525.1618434-3-csander@purestorage.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 21/04/2025 19:55, Caleb Sander Mateos wrote:
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
> Link: https://lore.kernel.org/linux-nvme/CADUfDZqa=OOTtTTznXRDmBQo1WrFcDw1hBA7XwM7hzJ-hpckcA@mail.gmail.com/T/#u
> Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
> ---
>   drivers/nvme/host/pci.c | 144 +++++++++++++++++++++++-----------------
>   1 file changed, 84 insertions(+), 60 deletions(-)
>
> diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
> index 642890ddada5..7d86d1ec989a 100644
> --- a/drivers/nvme/host/pci.c
> +++ b/drivers/nvme/host/pci.c
> @@ -16,10 +16,11 @@
>   #include <linux/kstrtox.h>
>   #include <linux/memremap.h>
>   #include <linux/mm.h>
>   #include <linux/module.h>
>   #include <linux/mutex.h>
> +#include <linux/nodemask.h>
>   #include <linux/once.h>
>   #include <linux/pci.h>
>   #include <linux/suspend.h>
>   #include <linux/t10-pi.h>
>   #include <linux/types.h>
> @@ -110,21 +111,24 @@ struct nvme_queue;
>   
>   static void nvme_dev_disable(struct nvme_dev *dev, bool shutdown);
>   static void nvme_delete_io_queues(struct nvme_dev *dev);
>   static void nvme_update_attrs(struct nvme_dev *dev);
>   
> +struct nvme_prp_dma_pools {
> +	struct dma_pool *large;
> +	struct dma_pool *small;
> +};
> +
>   /*
>    * Represents an NVM Express device.  Each nvme_dev is a PCI function.
>    */
>   struct nvme_dev {
>   	struct nvme_queue *queues;
>   	struct blk_mq_tag_set tagset;
>   	struct blk_mq_tag_set admin_tagset;
>   	u32 __iomem *dbs;
>   	struct device *dev;
> -	struct dma_pool *prp_page_pool;
> -	struct dma_pool *prp_small_pool;
>   	unsigned online_queues;
>   	unsigned max_qid;
>   	unsigned io_queues[HCTX_MAX_TYPES];
>   	unsigned int num_vecs;
>   	u32 q_depth;
> @@ -160,10 +164,11 @@ struct nvme_dev {
>   	struct nvme_host_mem_buf_desc *host_mem_descs;
>   	void **host_mem_desc_bufs;
>   	unsigned int nr_allocated_queues;
>   	unsigned int nr_write_queues;
>   	unsigned int nr_poll_queues;
> +	struct nvme_prp_dma_pools prp_pools[];
>   };
>   
>   static int io_queue_depth_set(const char *val, const struct kernel_param *kp)
>   {
>   	return param_set_uint_minmax(val, kp, NVME_PCI_MIN_QUEUE_SIZE,
> @@ -189,10 +194,11 @@ static inline struct nvme_dev *to_nvme_dev(struct nvme_ctrl *ctrl)
>    * An NVM Express queue.  Each device has at least two (one for admin
>    * commands and one for I/O commands).
>    */
>   struct nvme_queue {
>   	struct nvme_dev *dev;
> +	struct nvme_prp_dma_pools prp_pools;
>   	spinlock_t sq_lock;
>   	void *sq_cmds;
>   	 /* only used for poll queues: */
>   	spinlock_t cq_poll_lock ____cacheline_aligned_in_smp;
>   	struct nvme_completion *cqes;
> @@ -395,18 +401,67 @@ static int nvme_pci_npages_prp(void)
>   	unsigned max_bytes = (NVME_MAX_KB_SZ * 1024) + NVME_CTRL_PAGE_SIZE;
>   	unsigned nprps = DIV_ROUND_UP(max_bytes, NVME_CTRL_PAGE_SIZE);
>   	return DIV_ROUND_UP(8 * nprps, NVME_CTRL_PAGE_SIZE - 8);
>   }
>   
> +static struct nvme_prp_dma_pools *
> +nvme_setup_prp_pools(struct nvme_dev *dev, unsigned numa_node)
> +{
> +	struct nvme_prp_dma_pools *prp_pools;
> +	size_t small_align = 256;
> +
> +	prp_pools = &dev->prp_pools[numa_node < nr_node_ids ? numa_node : 0];

I'm assuming you are checking numa_node == NUMA_NO_NODE ?
Perhaps it is better to check that explicitly?

Otherwise, looks good
Reviewed-by: Sagi Grimberg <sagi@grimberg.me>

