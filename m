Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A502900B8
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 14:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745333971; cv=none; b=r8VmK3irc2Ne2GC2Cye3D0WIFA12s9yqfeWAed9GpPWde6x29k9vyoK/sKT21rQQ/fM+5nDlIZ38KuTGOxNnPVcyQ8RjJOs4Acm3CQeeR5vbzOboBXCxPqYJ1xsB/4GolxC4Wfnz8PtpetY0pzBO3mZDAVMC+/jjQ5gRvTQVAu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745333971; c=relaxed/simple;
	bh=QWsuGSrV0jBviRJ5z4yTu4Oqodj0PgaVYZ4TbaGeH84=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=crzhkDwisWiba7jWti7NUwq99+VFrMfcFyd7Wqghvj2pfCNTxol1rwh4HUHMZ5e711fPk3G3i8N7+SgxJF8OhKwxZA4koqF5cCa15BUptCGS/m2+FMvm5jXAZ6QUTkmayMZb0/AZ8DIKmOu50D8Jyv7jtCkEYnF3+vCxP1aZf+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=gdUEso98; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="gdUEso98"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22403c99457so8623495ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 07:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1745333968; x=1745938768; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=izolhSLfhzwZrQK7PfhoIMtyHLECubQLEJRViHMUUBg=;
        b=gdUEso98MCJfA+fLdLEMpyS4kqLEI3INTJ/n5LB5GUmMzhpw4OsY2LRWcJWrxbZK/y
         kMPyoM9oMG6jh8/76OJ4ZvaZlOJvIfA35joDvGLPb7uc7apK2NnyyQHjOWIpuUngY1QA
         /CNVdgU0maiYSJd7DAFfBBzndGyRCU9PHW8X82dvtld6lZ5CDK+tMSyA0nf/A4gL78ps
         LUMrViAontv3+ewD2yMZUhlcnvQkkWkObRIuA69UJlWKyHh7dYCjX8feRGj1zUmBziH6
         tkte1d9H7KtDoY9PJ/IY333xABFd4vteqzot6yfV4D1uR33t116RCHTf6j8jnvppnD9c
         7bKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745333968; x=1745938768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=izolhSLfhzwZrQK7PfhoIMtyHLECubQLEJRViHMUUBg=;
        b=ptodiFN6Je7L1fV8TIgffhbAbNuzTxp9Zd3PH/Xewjfi0oh/YYJuLxoTL84RXVdu+L
         5wyyeFi+NgemCb5Ns4t55I9IejbEa2HoSiqlJU9gLzSUSByxJXmqcL4oP7ZxHqHD2+UN
         vYmEcttOQ7zyIOQNhvHqaHkQUUn7ML2nXFzG4axCS3oDtVOHPL6csLaf1t6eFkhuzj9n
         KNywaQvjRzC/VMZ8d3tksFhFR5HxkbLtnGT1fceNWNMPIGRcjDkc/CwlZDbhI1CL6d6A
         MHMuowxRtJPOIPojd2E5Iw9npm5RSHsdNiKnJ4eAW6PN858pVMndWgYprj91mMpW6fC2
         m2Kw==
X-Forwarded-Encrypted: i=1; AJvYcCWh6G8hw2Dq6XZ3tpdgImwztnQoK3iqeHLnTvd/0R3PxJvJtVb9hTLabnv6q3P7RcLq5rXURMRt+49rMFY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjBMZb763Fu/Y9vT1DX1kETCZ/ce4QDuMcVTqignsxyx006YqS
	7Yue4ZdaSlqkg4f8jSGEIZ8OLCZr5xtfSBgo4KbPI/hZT9S9QF8oagey/WfS2eMRocS1ycKLsI4
	r3N/wWeYyO06lWgD7DhGwiiBu6g492W5hit7L8A==
X-Gm-Gg: ASbGncuKtG1VltBB6Xnz/Lrg015R64WIsDdabE3qsAyazM99pBy9QG62i8m3I/7EMG0
	liIxxnvtSMqWvqxK4VOLASGlS1IvQzoPrNfkZXy8+JUBRP5mKaKaC4fvphx+PLgtnscm41WmfRj
	TFFS2EdlEsU4jkIdus9caO
X-Google-Smtp-Source: AGHT+IFUBS5IUsBu+10X4ca16j0Ntg3JLwzmjLbsVTHDlU6zPvzWH8OTHReFUT3I2Aj8cS1yr9Q2aEROrGRTkMy2Jnc=
X-Received: by 2002:a17:903:22d1:b0:21f:1365:8bcf with SMTP id
 d9443c01a7336-22c53605b60mr86126535ad.10.1745333968421; Tue, 22 Apr 2025
 07:59:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250421165525.1618434-1-csander@purestorage.com>
 <20250421165525.1618434-3-csander@purestorage.com> <4cf8af38-419e-4d7c-95f7-7248faf3c7bb@grimberg.me>
In-Reply-To: <4cf8af38-419e-4d7c-95f7-7248faf3c7bb@grimberg.me>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Tue, 22 Apr 2025 07:59:16 -0700
X-Gm-Features: ATxdqUFa7hpMhqNeBArzW1f7_U-MXLOc0R42TakRSbVP4GANnHTXCxIfw7jUpCY
Message-ID: <CADUfDZoJixufDq4wfdtmNpqNOxmByj6Tekw=e-5G_Yc5y5XaBw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] nvme/pci: make PRP list DMA pools per-NUMA-node
To: Sagi Grimberg <sagi@grimberg.me>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, 
	Kanchan Joshi <joshi.k@samsung.com>, linux-nvme@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 4:48=E2=80=AFAM Sagi Grimberg <sagi@grimberg.me> wr=
ote:
>
>
>
> On 21/04/2025 19:55, Caleb Sander Mateos wrote:
> > NVMe commands with more than 4 KB of data allocate PRP list pages from
> > the per-nvme_device dma_pool prp_page_pool or prp_small_pool. Each call
> > to dma_pool_alloc() and dma_pool_free() takes the per-dma_pool spinlock=
.
> > These device-global spinlocks are a significant source of contention
> > when many CPUs are submitting to the same NVMe devices. On a workload
> > issuing 32 KB reads from 16 CPUs (8 hypertwin pairs) across 2 NUMA node=
s
> > to 23 NVMe devices, we observed 2.4% of CPU time spent in
> > _raw_spin_lock_irqsave called from dma_pool_alloc and dma_pool_free.
> >
> > Ideally, the dma_pools would be per-hctx to minimize
> > contention. But that could impose considerable resource costs in a
> > system with many NVMe devices and CPUs.
> >
> > As a compromise, allocate per-NUMA-node PRP list DMA pools. Map each
> > nvme_queue to the set of DMA pools corresponding to its device and its
> > hctx's NUMA node. This reduces the _raw_spin_lock_irqsave overhead by
> > about half, to 1.2%. Preventing the sharing of PRP list pages across
> > NUMA nodes also makes them cheaper to initialize.
> >
> > Link: https://lore.kernel.org/linux-nvme/CADUfDZqa=3DOOTtTTznXRDmBQo1Wr=
FcDw1hBA7XwM7hzJ-hpckcA@mail.gmail.com/T/#u
> > Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
> > ---
> >   drivers/nvme/host/pci.c | 144 +++++++++++++++++++++++----------------=
-
> >   1 file changed, 84 insertions(+), 60 deletions(-)
> >
> > diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
> > index 642890ddada5..7d86d1ec989a 100644
> > --- a/drivers/nvme/host/pci.c
> > +++ b/drivers/nvme/host/pci.c
> > @@ -16,10 +16,11 @@
> >   #include <linux/kstrtox.h>
> >   #include <linux/memremap.h>
> >   #include <linux/mm.h>
> >   #include <linux/module.h>
> >   #include <linux/mutex.h>
> > +#include <linux/nodemask.h>
> >   #include <linux/once.h>
> >   #include <linux/pci.h>
> >   #include <linux/suspend.h>
> >   #include <linux/t10-pi.h>
> >   #include <linux/types.h>
> > @@ -110,21 +111,24 @@ struct nvme_queue;
> >
> >   static void nvme_dev_disable(struct nvme_dev *dev, bool shutdown);
> >   static void nvme_delete_io_queues(struct nvme_dev *dev);
> >   static void nvme_update_attrs(struct nvme_dev *dev);
> >
> > +struct nvme_prp_dma_pools {
> > +     struct dma_pool *large;
> > +     struct dma_pool *small;
> > +};
> > +
> >   /*
> >    * Represents an NVM Express device.  Each nvme_dev is a PCI function=
.
> >    */
> >   struct nvme_dev {
> >       struct nvme_queue *queues;
> >       struct blk_mq_tag_set tagset;
> >       struct blk_mq_tag_set admin_tagset;
> >       u32 __iomem *dbs;
> >       struct device *dev;
> > -     struct dma_pool *prp_page_pool;
> > -     struct dma_pool *prp_small_pool;
> >       unsigned online_queues;
> >       unsigned max_qid;
> >       unsigned io_queues[HCTX_MAX_TYPES];
> >       unsigned int num_vecs;
> >       u32 q_depth;
> > @@ -160,10 +164,11 @@ struct nvme_dev {
> >       struct nvme_host_mem_buf_desc *host_mem_descs;
> >       void **host_mem_desc_bufs;
> >       unsigned int nr_allocated_queues;
> >       unsigned int nr_write_queues;
> >       unsigned int nr_poll_queues;
> > +     struct nvme_prp_dma_pools prp_pools[];
> >   };
> >
> >   static int io_queue_depth_set(const char *val, const struct kernel_pa=
ram *kp)
> >   {
> >       return param_set_uint_minmax(val, kp, NVME_PCI_MIN_QUEUE_SIZE,
> > @@ -189,10 +194,11 @@ static inline struct nvme_dev *to_nvme_dev(struct=
 nvme_ctrl *ctrl)
> >    * An NVM Express queue.  Each device has at least two (one for admin
> >    * commands and one for I/O commands).
> >    */
> >   struct nvme_queue {
> >       struct nvme_dev *dev;
> > +     struct nvme_prp_dma_pools prp_pools;
> >       spinlock_t sq_lock;
> >       void *sq_cmds;
> >        /* only used for poll queues: */
> >       spinlock_t cq_poll_lock ____cacheline_aligned_in_smp;
> >       struct nvme_completion *cqes;
> > @@ -395,18 +401,67 @@ static int nvme_pci_npages_prp(void)
> >       unsigned max_bytes =3D (NVME_MAX_KB_SZ * 1024) + NVME_CTRL_PAGE_S=
IZE;
> >       unsigned nprps =3D DIV_ROUND_UP(max_bytes, NVME_CTRL_PAGE_SIZE);
> >       return DIV_ROUND_UP(8 * nprps, NVME_CTRL_PAGE_SIZE - 8);
> >   }
> >
> > +static struct nvme_prp_dma_pools *
> > +nvme_setup_prp_pools(struct nvme_dev *dev, unsigned numa_node)
> > +{
> > +     struct nvme_prp_dma_pools *prp_pools;
> > +     size_t small_align =3D 256;
> > +
> > +     prp_pools =3D &dev->prp_pools[numa_node < nr_node_ids ? numa_node=
 : 0];
>
> I'm assuming you are checking numa_node =3D=3D NUMA_NO_NODE ?
> Perhaps it is better to check that explicitly?

Yeah, I wasn't sure whether that was a possible value of
hctx->numa_node. The field is defined as an unsigned and NUMA_NO_NODE
is defined as -1, so I guess it shouldn't ever be set to NUMA_NO_NODE?
I can replace this with just numa_node.

Thanks,
Caleb
