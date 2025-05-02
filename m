Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7706818AFC
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 16:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746204512; cv=none; b=pAbT9ohB+7byoL2TlqQmXC6Yov6OItjgykR+dY4/gG49iywdgGWzWVGUUVZcQxcEZf/6aU4uL+X/fOYK4axDP+dws6fa+0xGrdejsXJCa2umztfILglhwWttW82XgjC1tW7nzJT6cD2AFw9hjxu8kVl+9dUm9qtdRR1nJXkdKqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746204512; c=relaxed/simple;
	bh=7Wtl/0k4edSNeaRM9UF4+BkTFPky3KHUzYFwAT4nyLE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YAGoCh6sIfE82X2u50oC1x16WY6NbiZF1dMawyJdIG2vSKFCKQBJlZhGyRDD+khPha3f1p8isGwMaXEwPJRVE5NFMnxhz6x3jWUBbgoEiMzL+AeP0fkDZdZZxQdZzmgvra3bsjUyrnQ78kDcdtvsBkDukz0ZTXNfChRGU6onYMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=NjYbUR0V; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="NjYbUR0V"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-309f26c68b8so273248a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 09:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1746204509; x=1746809309; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FGKG+bqqtU1mFVGRnDFZ9YvbYaqYm4zslqMRs/wrJK4=;
        b=NjYbUR0V76zGp24orzLttT4ol5jv/CuOwQfUtUw+NKDYxP5XWpAjIJ6Q7+nZyq8b8l
         ph1cjRJjjMUmGyQVeHyBcOvNzsy3juFW2kGyxWiipwJQj1gmWLnSU/UGYwuS81f6QDKg
         pt40XlLsC8ss7r/5ZEOsWagqbY697glPQ/VD/srEmtYavD5lLXqCvqI+Ri+e9jxcYlgz
         72ghScTAEJHUVXAECiyPXRe1esAludvQgJ5/FkUMwKUApApJAHujEqhvbB4IY84g+hNs
         6FSF260gwz7q/tM7sewr+JP5tx+Xt5LX2ZsN5EoRy3YZ1ZBPkSsciInbCENfOMLepppn
         mHmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746204509; x=1746809309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FGKG+bqqtU1mFVGRnDFZ9YvbYaqYm4zslqMRs/wrJK4=;
        b=Xf6wvlQi8I6H/6DkqtQr02P9AFf4Nh5r4irssyDQ6TARS7KvKZI61luNv87lsW0Zql
         S4VCP6lHuufvUQGaY+7N37bnZD6vVYe+2IEqV2drYvaVAWBEMyGEPlImk51MlR/UybNK
         33gQ6oAq1kbVhwfzAiZ+O8PdtEFwtfd/V88ieo4/hAnNwH7vfrjEEvuRdUOrfDuNGUP/
         Jy2h4tWcX2wSFHzuymkk4dcKMMRcMDPhKXfwfwawdgd8O/vmFQbTP/8cXnibVPvm8/T2
         0BgFO3qGQ7ctmtH+In+LXpTtT/s7NwZSY53KnmP/Q2hzSOPyhq5mWgBg3ArAkwbgAQ+a
         Sarw==
X-Forwarded-Encrypted: i=1; AJvYcCVt+9yM8nJu9wlldr0ZX4KTaQw+EFoOixAENL2RCEm7Ef0c3CtNHCNBidkUCjJe7p7S1bOYFOOGRlEMboA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPwxC4bmjK8Mjl/rNli3dPMFI5h5kyQfWaIoB0gONZ9wHm8HGs
	awAtU4OP1k6mUpp2kAJDbromppRcAIG4TqhfjUCi2VX2bit8z7nb3hRA7ZJLwZB8ZjBDp3FGK56
	jaToZHiIefrRdmJQ1YHJ5yVGx/1IaemVvmzCzPQ==
X-Gm-Gg: ASbGnctJGukJDxQ9nzM61KqCwBYQKOzg9odPAlP0hfkXjhbGtuc41n/xLNEZrPZWekb
	fPopGVfSJ5W3GNxpaci1Xaeq9g4N/bJ1T2klG0xOe08Cvk30j9+/wbpv8Ape8P7/nAbE76G/KI9
	OzkQXM65jE4c8/d/xva5Jd
X-Google-Smtp-Source: AGHT+IEELL9u72c1Fg2kejI58mub1eHMZr6Gpc7Bc6hBIFC204l0EKzL5sGiaFODbZX/MTt3DAVSgDpVZmluKrqjuK4=
X-Received: by 2002:a17:90b:38c3:b0:305:5f31:6c63 with SMTP id
 98e67ed59e1d1-30a4e6f7e74mr2199297a91.6.1746204509624; Fri, 02 May 2025
 09:48:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250426020636.34355-1-csander@purestorage.com>
In-Reply-To: <20250426020636.34355-1-csander@purestorage.com>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Fri, 2 May 2025 09:48:17 -0700
X-Gm-Features: ATxdqUHt_RY6WlfG-cFs204ON7jneR73r_rcAj43sEs6pcYPHQ6F77sRjndgWok
Message-ID: <CADUfDZr=OWv-bt+rzNQZ7zii9JyNxmkYCJxXCiCNsoHhT5UcYw@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] nvme/pci: PRP list DMA pool partitioning
To: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, 
	Sagi Grimberg <sagi@grimberg.me>, Andrew Morton <akpm@linux-foundation.org>
Cc: Kanchan Joshi <joshi.k@samsung.com>, linux-nvme@lists.infradead.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,
It seems like there is consensus on this series and all patches have
multiple reviews. Would it be possible to queue it up for 6.16? The
NVMe tree seems like it would make sense, though maybe the dmapool
patch needs to go through the mm tree?

Thanks,
Caleb

On Fri, Apr 25, 2025 at 7:07=E2=80=AFPM Caleb Sander Mateos
<csander@purestorage.com> wrote:
>
> NVMe commands with over 8 KB of discontiguous data allocate PRP list
> pages from the per-nvme_device dma_pool prp_page_pool or prp_small_pool.
> Each call to dma_pool_alloc() and dma_pool_free() takes the per-dma_pool
> spinlock. These device-global spinlocks are a significant source of
> contention when many CPUs are submitting to the same NVMe devices. On a
> workload issuing 32 KB reads from 16 CPUs (8 hypertwin pairs) across 2
> NUMA nodes to 23 NVMe devices, we observed 2.4% of CPU time spent in
> _raw_spin_lock_irqsave called from dma_pool_alloc and dma_pool_free.
>
> Ideally, the dma_pools would be per-hctx to minimize contention. But
> that could impose considerable resource costs in a system with many NVMe
> devices and CPUs.
>
> As a compromise, allocate per-NUMA-node PRP list DMA pools. Map each
> nvme_queue to the set of DMA pools corresponding to its device and its
> hctx's NUMA node. This reduces the _raw_spin_lock_irqsave overhead by
> about half, to 1.2%. Preventing the sharing of PRP list pages across
> NUMA nodes also makes them cheaper to initialize.
>
> Allocating the dmapool structs on the desired NUMA node further reduces
> the time spent in dma_pool_alloc from 0.87% to 0.50%.
>
> Caleb Sander Mateos (2):
>   nvme/pci: factor out nvme_init_hctx() helper
>   nvme/pci: make PRP list DMA pools per-NUMA-node
>
> Keith Busch (1):
>   dmapool: add NUMA affinity support
>
>  drivers/nvme/host/pci.c | 171 +++++++++++++++++++++++-----------------
>  include/linux/dmapool.h |  17 +++-
>  mm/dmapool.c            |  16 ++--
>  3 files changed, 121 insertions(+), 83 deletions(-)
>
> v6:
> - Clarify description of when PRP list pages are allocated (Christoph)
> - Add Reviewed-by tags
>
> v5:
> - Allocate dmapool structs on desired NUMA node (Keith)
> - Add Reviewed-by tags
>
> v4:
> - Drop the numa_node < nr_node_ids check (Kanchan)
> - Add Reviewed-by tags
>
> v3: simplify nvme_release_prp_pools() (Keith)
>
> v2:
> - Initialize admin nvme_queue's nvme_prp_dma_pools (Kanchan)
> - Shrink nvme_dev's prp_pools array from MAX_NUMNODES to nr_node_ids (Kan=
chan)
>
> --
> 2.45.2
>
