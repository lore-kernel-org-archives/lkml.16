Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6CE23814D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 11:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743593540; cv=none; b=bgJi8OhyKIAmAgMcQG6cyuyVEfSDea+D08Lps0E3WtzGzK0dHcjKRvYbZYmLgFL4MBY+GB/Xj5P2A6/qE+pzkboiwEUujcqVnm8sjYIelP12ZRA9ZdidiSW/anQpeFxW2iN4ldhRy1X6Cql42WP/Wtjbee6OI81dLffjHzHNp6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743593540; c=relaxed/simple;
	bh=LOeha8JnM6j/2lraRrsmhBtaJNpDdb8TcHHFT6ZBwgA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XOZTQzalX0UXWDlnK80Gox3sooGvg78Wl3D+3WkGWL4j5DEHVsgH9SUqDVgNS+jZQj9kF7DHtOzKZlwFg45i2kDShQiN1dqnPXFO6OAe981RKhiWe/69dNYMkzCIahcjpPNuysc1JItH1sTKd/5m9KxXpSuOHgxWYGXFxb9ckVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com; spf=pass smtp.mailfrom=fromorbit.com; dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b=FCtpzpqw; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b="FCtpzpqw"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-af589091049so10299a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 04:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1743593538; x=1744198338; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LXwOcJIfsNDmkh8KBv4r5tSOmCSgR5wa5mtpqDG75es=;
        b=FCtpzpqw4PdMQKAPuTYZ9UkBkhqlpbAfHn4PWQmHEkdWf7UFloLYsfZxsLZauphQOq
         2q8RNVU2xe9TPlKiziVKIZH1nzx/JFKGkWvj+7GfDOnMD1TRwclHEYAxs2+o5nNpRRap
         OdWr4wHLEL3JBK5vESQTv/SH9lgaUmCX9KuHTw9XDxYmtfFs/atI2wdDHTfe7peDOA0g
         st8+PYqNmyh/rsThKskVCdxJ1h5c4mw6JxJtqKaDWhAMkP8kC29ObhEfnwdLbzdyrwmw
         nKyj4aeX9N9Ry6bL46qsnhqw/jdR4zEJdZTGDL84QDT5xbeKygzJmvdOl9sk7hIk/Axn
         zI1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743593538; x=1744198338;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LXwOcJIfsNDmkh8KBv4r5tSOmCSgR5wa5mtpqDG75es=;
        b=mcGaNGHYtKQns+QkTZWmGiwvHljwz5iUom2csUUCh5Up/MzIG17UF8KDrYCWadbAGN
         5Xv27uSobYW7V5yTcQ30jzKjVEwmLhDqkL2s0z/R4DKA/gKiz+WI9YLTHTWBBMHSAPf4
         yRRx9qqB6YIOW4meDJrn4CzZvdot+2q0l3X9BOPodSTEWRY/1bSSDcCqctbCVZPlEUqP
         ZGXKuKACpuMm1neui0Rqcsp1Na9QZ/iaiEz2DZ7CmJk1hFNv+KYA1hDf1lrGi5mAjnxZ
         Sl4u8zu55lWjJvVZkVcgE/BA0ySQ+r+0GFqLgPVBF4SGEKAqTLvCL/wbtVR25Hns1vcF
         JD5g==
X-Forwarded-Encrypted: i=1; AJvYcCWcAXPnt4mV+XeHA/dsRr/qKXliqB/aehga9yncmaa5i+aV1toiqEPZGNKMBbVHOON6nZRTGLdkl/lp+mI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm+TT07nZg+Eepqg5orgEeIqYxuqrWaIOwtQK7tzNSLPWOzV6f
	PnN8PzqyE3dM6OtUmCCXg8Sv9ZVK6R900uZVC+VjEfRy0RdUk5cnTyRmbQEmpaMCM09Hjt1NcTq
	p
X-Gm-Gg: ASbGnctn2VCuRPjBj9azcj2O5YT8KeirDhET1G3nnzVH63Z41dlwwQr7xhD1G4Eqdo4
	V8LwRY8IlXKNyP7pWSkFXcIomoysMVp8kdXsMxMQSymhJjQ0FFxiIdTUfCzNZsEksZsUqEQxmKx
	imWX2s0/E03dEiSFDzWpHzzstqysrjuuHbxF+57/QdwklwXqCMpubEe7KffYlekMHFmqmlD9/PZ
	JhxlVTAiAVtk+2KiMNsEb0tOzdJ4/By0v+rj52m1DeI2wnz7OYD4BUAAfYwQ04uADVf6BUccoki
	2f0/WcdKk0D2S7TDZwbU9NO6VAfcNrqqk6ujXbM9carLSzEWbTbqlU8CD5LiQE0N9Bv4D6yiI3a
	aQIaaGWUwrY6MhyzoOg==
X-Google-Smtp-Source: AGHT+IEW0RkUkaqsfmHCYcslKY/K1pIkzGv7tJkMVsZIwP9qMwmTC4V+xh/sZ6DBeQUvji7VXgaIWQ==
X-Received: by 2002:a17:90b:1344:b0:2ff:6788:cc67 with SMTP id 98e67ed59e1d1-3056096950cmr7891522a91.34.1743593538155;
        Wed, 02 Apr 2025 04:32:18 -0700 (PDT)
Received: from dread.disaster.area (pa49-181-60-96.pa.nsw.optusnet.com.au. [49.181.60.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3056f8d6c17sm1335390a91.41.2025.04.02.04.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 04:32:17 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.98)
	(envelope-from <david@fromorbit.com>)
	id 1tzwKM-00000003WFl-0iwn;
	Wed, 02 Apr 2025 22:32:14 +1100
Date: Wed, 2 Apr 2025 22:32:14 +1100
From: Dave Chinner <david@fromorbit.com>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: Harry Yoo <harry.yoo@oracle.com>, Kees Cook <kees@kernel.org>,
	joel.granados@kernel.org, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
	linux-mm@kvack.org, Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH] proc: Avoid costly high-order page allocations when
 reading proc files
Message-ID: <Z-0gPqHVto7PgM1K@dread.disaster.area>
References: <20250401073046.51121-1-laoar.shao@gmail.com>
 <3315D21B-0772-4312-BCFB-402F408B0EF6@kernel.org>
 <Z-y50vEs_9MbjQhi@harry>
 <CALOAHbBSvMuZnKF_vy3kGGNOCg5N2CgomLhxMxjn8RNwMTrw7A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALOAHbBSvMuZnKF_vy3kGGNOCg5N2CgomLhxMxjn8RNwMTrw7A@mail.gmail.com>

On Wed, Apr 02, 2025 at 04:42:06PM +0800, Yafang Shao wrote:
> On Wed, Apr 2, 2025 at 12:15 PM Harry Yoo <harry.yoo@oracle.com> wrote:
> >
> > On Tue, Apr 01, 2025 at 07:01:04AM -0700, Kees Cook wrote:
> > >
> > >
> > > On April 1, 2025 12:30:46 AM PDT, Yafang Shao <laoar.shao@gmail.com> wrote:
> > > >While investigating a kcompactd 100% CPU utilization issue in production, I
> > > >observed frequent costly high-order (order-6) page allocations triggered by
> > > >proc file reads from monitoring tools. This can be reproduced with a simple
> > > >test case:
> > > >
> > > >  fd = open(PROC_FILE, O_RDONLY);
> > > >  size = read(fd, buff, 256KB);
> > > >  close(fd);
> > > >
> > > >Although we should modify the monitoring tools to use smaller buffer sizes,
> > > >we should also enhance the kernel to prevent these expensive high-order
> > > >allocations.
> > > >
> > > >Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> > > >Cc: Josef Bacik <josef@toxicpanda.com>
> > > >---
> > > > fs/proc/proc_sysctl.c | 10 +++++++++-
> > > > 1 file changed, 9 insertions(+), 1 deletion(-)
> > > >
> > > >diff --git a/fs/proc/proc_sysctl.c b/fs/proc/proc_sysctl.c
> > > >index cc9d74a06ff0..c53ba733bda5 100644
> > > >--- a/fs/proc/proc_sysctl.c
> > > >+++ b/fs/proc/proc_sysctl.c
> > > >@@ -581,7 +581,15 @@ static ssize_t proc_sys_call_handler(struct kiocb *iocb, struct iov_iter *iter,
> > > >     error = -ENOMEM;
> > > >     if (count >= KMALLOC_MAX_SIZE)
> > > >             goto out;
> > > >-    kbuf = kvzalloc(count + 1, GFP_KERNEL);
> > > >+
> > > >+    /*
> > > >+     * Use vmalloc if the count is too large to avoid costly high-order page
> > > >+     * allocations.
> > > >+     */
> > > >+    if (count < (PAGE_SIZE << PAGE_ALLOC_COSTLY_ORDER))
> > > >+            kbuf = kvzalloc(count + 1, GFP_KERNEL);
> > >
> > > Why not move this check into kvmalloc family?
> >
> > Hmm should this check really be in kvmalloc family?
> 
> Modifying the existing kvmalloc functions risks performance regressions.
> Could we instead introduce a new variant like vkmalloc() (favoring
> vmalloc over kmalloc) or kvmalloc_costless()?

We should fix kvmalloc() instead of continuing to force
subsystems to work around the limitations of kvmalloc().

Have a look at xlog_kvmalloc() in XFS. It implements a basic
fast-fail, no retry high order kmalloc before it falls back to
vmalloc by turning off direct reclaim for the kmalloc() call.
Hence if the there isn't a high-order page on the free lists ready
to allocate, it falls back to vmalloc() immediately.

For XFS, using xlog_kvmalloc() reduced the high-order per-allocation
overhead by around 80% when compared to a standard kvmalloc()
call. Numbers and profiles were documented in the commit message
(reproduced in whole below)...

> > I don't think users would expect kvmalloc() to implictly decide on using
> > vmalloc() without trying kmalloc() first, just because it's a high-order
> > allocation.

Right, but users expect kvmalloc() to use the most efficient
allocation paths available to it.

In this case, vmalloc() is faster and more reliable than
direct reclaim w/ compaction. Hence vmalloc() should really be the
primary fallback path when high-order pages are not immediately
available to kmalloc() when called from kvmalloc()...

-Dave.
-- 
Dave Chinner
david@fromorbit.com

commit 8dc9384b7d75012856b02ff44c37566a55fc2abf
Author: Dave Chinner <dchinner@redhat.com>
Date:   Tue Jan 4 17:22:18 2022 -0800

    xfs: reduce kvmalloc overhead for CIL shadow buffers

    Oh, let me count the ways that the kvmalloc API sucks dog eggs.

    The problem is when we are logging lots of large objects, we hit
    kvmalloc really damn hard with costly order allocations, and
    behaviour utterly sucks:

         - 49.73% xlog_cil_commit
             - 31.62% kvmalloc_node
                - 29.96% __kmalloc_node
                   - 29.38% kmalloc_large_node
                      - 29.33% __alloc_pages
                         - 24.33% __alloc_pages_slowpath.constprop.0
                            - 18.35% __alloc_pages_direct_compact
                               - 17.39% try_to_compact_pages
                                  - compact_zone_order
                                     - 15.26% compact_zone
                                          5.29% __pageblock_pfn_to_page
                                          3.71% PageHuge
                                        - 1.44% isolate_migratepages_block
                                             0.71% set_pfnblock_flags_mask
                                       1.11% get_pfnblock_flags_mask
                               - 0.81% get_page_from_freelist
                                  - 0.59% _raw_spin_lock_irqsave
                                     - do_raw_spin_lock
                                          __pv_queued_spin_lock_slowpath
                            - 3.24% try_to_free_pages
                               - 3.14% shrink_node
                                  - 2.94% shrink_slab.constprop.0
                                     - 0.89% super_cache_count
                                        - 0.66% xfs_fs_nr_cached_objects
                                           - 0.65% xfs_reclaim_inodes_count
                                                0.55% xfs_perag_get_tag
                                       0.58% kfree_rcu_shrink_count
                            - 2.09% get_page_from_freelist
                               - 1.03% _raw_spin_lock_irqsave
                                  - do_raw_spin_lock
                                       __pv_queued_spin_lock_slowpath
                         - 4.88% get_page_from_freelist
                            - 3.66% _raw_spin_lock_irqsave
                               - do_raw_spin_lock
                                    __pv_queued_spin_lock_slowpath
                - 1.63% __vmalloc_node
                   - __vmalloc_node_range
                      - 1.10% __alloc_pages_bulk
                         - 0.93% __alloc_pages
                            - 0.92% get_page_from_freelist
                               - 0.89% rmqueue_bulk
                                  - 0.69% _raw_spin_lock
                                     - do_raw_spin_lock
                                          __pv_queued_spin_lock_slowpath
               13.73% memcpy_erms
             - 2.22% kvfree

    On this workload, that's almost a dozen CPUs all trying to compact
    and reclaim memory inside kvmalloc_node at the same time. Yet it is
    regularly falling back to vmalloc despite all that compaction, page
    and shrinker reclaim that direct reclaim is doing. Copying all the
    metadata is taking far less CPU time than allocating the storage!

    Direct reclaim should be considered extremely harmful.

    This is a high frequency, high throughput, CPU usage and latency
    sensitive allocation. We've got memory there, and we're using
    kvmalloc to allow memory allocation to avoid doing lots of work to
    try to do contiguous allocations.

    Except it still does *lots of costly work* that is unnecessary.

    Worse: the only way to avoid the slowpath page allocation trying to
    do compaction on costly allocations is to turn off direct reclaim
    (i.e. remove __GFP_RECLAIM_DIRECT from the gfp flags).

    Unfortunately, the stupid kvmalloc API then says "oh, this isn't a
    GFP_KERNEL allocation context, so you only get kmalloc!". This
    cuts off the vmalloc fallback, and this leads to almost instant OOM
    problems which ends up in filesystems deadlocks, shutdowns and/or
    kernel crashes.

    I want some basic kvmalloc behaviour:

    - kmalloc for a contiguous range with fail fast semantics - no
      compaction direct reclaim if the allocation enters the slow path.
    - run normal vmalloc (i.e. GFP_KERNEL) if kmalloc fails

    The really, really stupid part about this is these kvmalloc() calls
    are run under memalloc_nofs task context, so all the allocations are
    always reduced to GFP_NOFS regardless of the fact that kvmalloc
    requires GFP_KERNEL to be passed in. IOWs, we're already telling
    kvmalloc to behave differently to the gfp flags we pass in, but it
    still won't allow vmalloc to be run with anything other than
    GFP_KERNEL.

    So, this patch open codes the kvmalloc() in the commit path to have
    the above described behaviour. The result is we more than halve the
    CPU time spend doing kvmalloc() in this path and transaction commits
    with 64kB objects in them more than doubles. i.e. we get ~5x
    reduction in CPU usage per costly-sized kvmalloc() invocation and
    the profile looks like this:

          - 37.60% xlog_cil_commit
            16.01% memcpy_erms
          - 8.45% __kmalloc
             - 8.04% kmalloc_order_trace
                - 8.03% kmalloc_order
                   - 7.93% alloc_pages
                      - 7.90% __alloc_pages
                         - 4.05% __alloc_pages_slowpath.constprop.0
                            - 2.18% get_page_from_freelist
                            - 1.77% wake_all_kswapds
    ....
                                        - __wake_up_common_lock
                                           - 0.94% _raw_spin_lock_irqsave
                         - 3.72% get_page_from_freelist
                            - 2.43% _raw_spin_lock_irqsave
          - 5.72% vmalloc
             - 5.72% __vmalloc_node_range
                - 4.81% __get_vm_area_node.constprop.0
                   - 3.26% alloc_vmap_area
                      - 2.52% _raw_spin_lock
                   - 1.46% _raw_spin_lock
                  0.56% __alloc_pages_bulk
          - 4.66% kvfree
             - 3.25% vfree
                - __vfree
                   - 3.23% __vunmap
                      - 1.95% remove_vm_area
                         - 1.06% free_vmap_area_noflush
                            - 0.82% _raw_spin_lock
                         - 0.68% _raw_spin_lock
                      - 0.92% _raw_spin_lock
             - 1.40% kfree
                - 1.36% __free_pages
                   - 1.35% __free_pages_ok
                      - 1.02% _raw_spin_lock_irqsave

    It's worth noting that over 50% of the CPU time spent allocating
    these shadow buffers is now spent on spinlocks. So the shadow buffer
    allocation overhead is greatly reduced by getting rid of direct
    reclaim from kmalloc, and could probably be made even less costly if
    vmalloc() didn't use global spinlocks to protect it's structures.

    Signed-off-by: Dave Chinner <dchinner@redhat.com>
    Reviewed-by: Allison Henderson <allison.henderson@oracle.com>
    Reviewed-by: Darrick J. Wong <djwong@kernel.org>
    Signed-off-by: Darrick J. Wong <djwong@kernel.org>
