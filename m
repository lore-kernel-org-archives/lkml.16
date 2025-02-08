Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49391F17E0
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 16:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739031648; cv=none; b=FVvEjVhNOyNoptGtLVogcSFQ4+NCdggpHImFE6GcaQe1MwuB0OdsjiCPZRITd9C5mM57zDXVSmNw3K3vm8Ox83cs9FjVhBCfzKEYb1IsBysq1YDpvMh+oMBlY/S9FFMgjCV6TmhJNSuHbrdgJZ20zcKs+4HQGX6KCi5jJyJv+Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739031648; c=relaxed/simple;
	bh=vDFeDQ7+2K21nCLy7gkYnfP24y8ixMrABpp+NIuK9hY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XZ6+gN7lE4dOKW17wzyU+txMJdtWuPoUjiM8klpb8i6gNYpWbM/1ZE6OMqGpU0FGSud1Q3rfKlTA1a78vgYxKFOokfXnfBmxdQL2pHhGMGZPluQ2nDht5L0z7098QbwHmIIld6kD+r1XCIZp7nTi92GTgFwVq62Fqd6XpZGx+lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HIePghE0; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HIePghE0"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21f53ad05a0so26480265ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 08:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1739031646; x=1739636446; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8gxCfCD/oSvRlqzifauQ0Bz5xeogduqqad4wOITmlkI=;
        b=HIePghE0O0mzyOC+T1lFRW52TcFDyNfL1JLgjBrDJsA0KssCWHZftBPBN6vigwWMjV
         nM2EmjgC0LGNMZfBZgKEduzcWgawJpGBq4wvDEwnakJXyjAQyu9XTtpuguYhwxKJP48E
         LhVqyu6Rw6mvj/rVdflcxU2se8ENchH29zBFw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739031646; x=1739636446;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8gxCfCD/oSvRlqzifauQ0Bz5xeogduqqad4wOITmlkI=;
        b=OLX7cQzb+o0b6JrybTls+xRaUGNud8vfJQKxDemfUAH7hd31W5nwpWEroI+RdksfWw
         Ce6usDudL19VQ35lr822z6nD8KP9VyVKFGS2ItctFv8EMjsCVmtrBiLCNR0ubp+FQQDD
         Aj1GOj4gZ+1e7Hbe2MiGmYe9rHRZWlsP3SJEtwW74ydAUy+qhY8Cw8zbRPGjOURmGxKx
         Dp73ToLs8rcRqKPZLSy5w98glO5egnMnLP73z59DPov6LYxr70apgdzNB5C9eHRHgdNQ
         LMpi3EQ2cJAS2FBE1PODzrx0X2DRZlrpnNbO7rf2R1dvLewJu8DHlchBt3R7t19ml7fl
         5dqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCmopUyoWrRYU7fJ7oci1jdn6zes1fxMsu4CN4FftJ6rMmFxPCwPn3jtaDD0J1lqC/NFBUUz+cTDD9D/Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4gKXvBU5e+LcS2l+mlBG0dRdYF3lPImHx0cQ7Cggab72qKzTw
	gk1LoWBbzjncNi0rdQcXyGzRIDgCIp1HMYJEFNHdLNEhyciGFmPkbLithxLgmA==
X-Gm-Gg: ASbGnct9E1vXYsaINLrfBI29faw3LqN6iqnozMVrTQ5maQxLgf/5aiwisoFA928yEvI
	AuMgjYYYvASBDuKjE8+rCffmDcX3FwUFtih+B3gW0Dnpcal66AV5OBsxoLtbHfyGuCpP4H6A51T
	58SsfEOevwAhp84eWOzTyS0dxTlukqHXoYc/2UFiJ3MW/sBKwQk4EwoEegTlIdIx5x5MNbW/2wp
	bTgnuFc1LOvG8EYDHtn3T3z4miS/fwqst5KUZAVplQLRhP0SvJsfCBFl4+CEGnk612io2z0Sy2g
	8hP7biYUd4QGlBJc0w==
X-Google-Smtp-Source: AGHT+IH5JDQHTOwc/ydkzjRw6duT0ZbB/HdjVdwcr6PYSRvcvT1wAkerhyj7opLT6CLf1OJw9o18+g==
X-Received: by 2002:a17:902:ea0c:b0:215:89a0:416f with SMTP id d9443c01a7336-21f4e6fa15emr101449135ad.30.1739031645972;
        Sat, 08 Feb 2025 08:20:45 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:139a:254:3216:daad])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f36561251sm48166065ad.94.2025.02.08.08.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 08:20:45 -0800 (PST)
Date: Sun, 9 Feb 2025 01:20:39 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Kairui Song <ryncsn@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv4 02/17] zram: do not use per-CPU compression streams
Message-ID: <kaprll3vfmf4vxy4zigkooytykz7my2pyf4jajyxf2m7fpygyl@wgs735yktho5>
References: <20250131090658.3386285-1-senozhatsky@chromium.org>
 <20250131090658.3386285-3-senozhatsky@chromium.org>
 <CAMgjq7BFUrUY5Xq5Eks4ibqbWgJcca1vqB4kq=otQVyG=23FRw@mail.gmail.com>
 <ryc3rgu567q44d3ck4un5itf77i2os4rqx3ruohivaqscn3rrt@ms5xoipyi72q>
 <CAMgjq7DKveiCJVb4ACSaLFV0Q1_Yd+sbL_X2dgXz6QGYwuNRTw@mail.gmail.com>
 <ysqyikz2jhnvjkhmkgwekbmz6dykvjssut6n3t746tpsscursu@zc6rg5xgk6sp>
 <Z6TgSaYIf1DnOszP@google.com>
 <n3k4c6qurl7vuqenxhmtxtitkeszohrcpauobwxxc4cpgbfujg@jxrinduvof6p>
 <u2o6c2zgtsol4uc53tnvi6xeksmhjjgo7xwrs4vg4wade52mbk@3iss25tlosau>
 <Z6Z1_XxcoBnM9E2o@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6Z1_XxcoBnM9E2o@google.com>

On (25/02/07 21:07), Yosry Ahmed wrote:
> I assume this problem is unique to zram and not zswap because zram can
> be used with normal IO (and then recurse through reclaim), while zswap
> is only reachable thorugh reclaim (which cannot recurse)?

I think I figured it out.  It appears that the problem was in lockdep
class key.  Both in zram and in zsmalloc I made the keys static:

 static void zram_slot_lock_init(struct zram *zram, u32 index)
 {
 #ifdef CONFIG_DEBUG_LOCK_ALLOC
       static struct lock_class_key key;

        lockdep_init_map(&zram->table[index].lockdep_map, "zram-entry->lock",
                        &key, 0);
 #endif
 }

Which would put the locks to the same class from lockdep point of
view.  And that means that chains of locks from zram0 (mounted ext4)
and chains of locks from zram1 (swap device) would interleave, leading
to reports that made no sense.  Like ext4 writeback and blkdev_read and
handle_mm_fault->do_swap_page() would be parts of the same lock-chain *.

So I moved lockdep class keys to per-zram device and per-zsmalloc pool
to separate the lockdep chains.  Looks like that did the trick.


*

[ 1714.787676] [    T172] ======================================================
[ 1714.788905] [    T172] WARNING: possible circular locking dependency detected
[ 1714.790114] [    T172] 6.14.0-rc1-next-20250207+ #936 Not tainted
[ 1714.791150] [    T172] ------------------------------------------------------
[ 1714.792356] [    T172] kworker/u96:4/172 is trying to acquire lock:
[ 1714.793421] [    T172] ffff888114cf0598 (ptlock_ptr(ptdesc)#2){+.+.}-{3:3}, at: page_vma_mapped_walk+0x5c0/0x960
[ 1714.795174] [    T172]
                          but task is already holding lock:
[ 1714.796453] [    T172] ffffe8ffff981cf8 (&zstrm->lock){+.+.}-{4:4}, at: zcomp_stream_get+0x20/0x40 [zram]
[ 1714.798098] [    T172]
                          which lock already depends on the new lock.

[ 1714.799901] [    T172]                                                                                                                                                                                                                                                                                   the existing dependency chain (in reverse order) is:
[ 1714.801469] [    T172]
                          -> #3 (&zstrm->lock){+.+.}-{4:4}:
[ 1714.802750] [    T172]        lock_acquire.part.0+0x63/0x1a0
[ 1714.803712] [    T172]        __mutex_lock+0xaa/0xd40
[ 1714.804574] [    T172]        zcomp_stream_get+0x20/0x40 [zram]
[ 1714.805578] [    T172]        zram_read_from_zspool+0x84/0x140 [zram]
[ 1714.806673] [    T172]        zram_bio_read+0x56/0x2c0 [zram]
[ 1714.807641] [    T172]        __submit_bio+0x12d/0x1c0
[ 1714.808511] [    T172]        __submit_bio_noacct+0x7f/0x200
[ 1714.809468] [    T172]        mpage_readahead+0xdd/0x110
[ 1714.810360] [    T172]        read_pages+0x7a/0x1b0
[ 1714.811182] [    T172]        page_cache_ra_unbounded+0x19a/0x210
[ 1714.812215] [    T172]        force_page_cache_ra+0x92/0xb0
[ 1714.813161] [    T172]        filemap_get_pages+0x11f/0x440
[ 1714.814098] [    T172]        filemap_read+0xf6/0x400
[ 1714.814945] [    T172]        blkdev_read_iter+0x66/0x130
[ 1714.815860] [    T172]        vfs_read+0x266/0x370
[ 1714.816674] [    T172]        ksys_read+0x66/0xe0
[ 1714.817477] [    T172]        do_syscall_64+0x64/0x130
[ 1714.818344] [    T172]        entry_SYSCALL_64_after_hwframe+0x4b/0x53
[ 1714.819444] [    T172]
                          -> #2 (zram-entry->lock){+.+.}-{0:0}:
[ 1714.820769] [    T172]        lock_acquire.part.0+0x63/0x1a0
[ 1714.821734] [    T172]        zram_slot_free_notify+0x5c/0x80 [zram]
[ 1714.822811] [    T172]        swap_entry_range_free+0x115/0x1a0
[ 1714.823812] [    T172]        cluster_swap_free_nr+0xb9/0x150
[ 1714.824787] [    T172]        do_swap_page+0x80d/0xea0
[ 1714.825661] [    T172]        __handle_mm_fault+0x538/0x7a0
[ 1714.826592] [    T172]        handle_mm_fault+0xdf/0x240
[ 1714.827485] [    T172]        do_user_addr_fault+0x152/0x700
[ 1714.828432] [    T172]        exc_page_fault+0x66/0x1f0
[ 1714.829317] [    T172]        asm_exc_page_fault+0x22/0x30
[ 1714.830235] [    T172]        do_sys_poll+0x213/0x260
[ 1714.831090] [    T172]        __x64_sys_poll+0x44/0x190
[ 1714.831972] [    T172]        do_syscall_64+0x64/0x130
[ 1714.832846] [    T172]        entry_SYSCALL_64_after_hwframe+0x4b/0x53
[ 1714.833949] [    T172]
                          -> #1 (&cluster_info[i].lock){+.+.}-{3:3}:
[ 1714.835354] [    T172]        lock_acquire.part.0+0x63/0x1a0
[ 1714.836307] [    T172]        _raw_spin_lock+0x2c/0x40
[ 1714.837194] [    T172]        __swap_duplicate+0x5e/0x150
[ 1714.838123] [    T172]        swap_duplicate+0x1c/0x40
[ 1714.838980] [    T172]        try_to_unmap_one+0x6c4/0xd60
[ 1714.839901] [    T172]        rmap_walk_anon+0xe7/0x210
[ 1714.840774] [    T172]        try_to_unmap+0x76/0x80
[ 1714.841613] [    T172]        shrink_folio_list+0x487/0xad0
[ 1714.842546] [    T172]        evict_folios+0x247/0x800
[ 1714.843404] [    T172]        try_to_shrink_lruvec+0x1cd/0x2b0
[ 1714.844382] [    T172]        lru_gen_shrink_node+0xc3/0x190
[ 1714.845335] [    T172]        do_try_to_free_pages+0xee/0x4b0
[ 1714.846292] [    T172]        try_to_free_pages+0xea/0x280
[ 1714.847208] [    T172]        __alloc_pages_slowpath.constprop.0+0x296/0x970
[ 1714.848391] [    T172]        __alloc_frozen_pages_noprof+0x2b3/0x300
[ 1714.849475] [    T172]        __folio_alloc_noprof+0x10/0x30
[ 1714.850422] [    T172]        do_anonymous_page+0x69/0x4b0
[ 1714.851337] [    T172]        __handle_mm_fault+0x557/0x7a0
[ 1714.852265] [    T172]        handle_mm_fault+0xdf/0x240
[ 1714.853153] [    T172]        do_user_addr_fault+0x152/0x700
[ 1714.854099] [    T172]        exc_page_fault+0x66/0x1f0
[ 1714.854976] [    T172]        asm_exc_page_fault+0x22/0x30
[ 1714.855897] [    T172]        rep_movs_alternative+0x3a/0x60
[ 1714.856851] [    T172]        _copy_to_iter+0xe2/0x7a0
[ 1714.857719] [    T172]        get_random_bytes_user+0x95/0x150
[ 1714.858712] [    T172]        vfs_read+0x266/0x370
[ 1714.859512] [    T172]        ksys_read+0x66/0xe0
[ 1714.860301] [    T172]        do_syscall_64+0x64/0x130
[ 1714.861167] [    T172]        entry_SYSCALL_64_after_hwframe+0x4b/0x53
[ 1714.862270] [    T172]
                          -> #0 (ptlock_ptr(ptdesc)#2){+.+.}-{3:3}:
[ 1714.863656] [    T172]        check_prev_add+0xeb/0xca0
[ 1714.864532] [    T172]        __lock_acquire+0xf56/0x12c0
[ 1714.865446] [    T172]        lock_acquire.part.0+0x63/0x1a0
[ 1714.866399] [    T172]        _raw_spin_lock+0x2c/0x40
[ 1714.867258] [    T172]        page_vma_mapped_walk+0x5c0/0x960
[ 1714.868235] [    T172]        folio_referenced_one+0xd0/0x4a0
[ 1714.869205] [    T172]        __rmap_walk_file+0xbe/0x1b0
[ 1714.870119] [    T172]        folio_referenced+0x10b/0x140
[ 1714.871039] [    T172]        shrink_folio_list+0x72c/0xad0
[ 1714.871975] [    T172]        evict_folios+0x247/0x800
[ 1714.872851] [    T172]        try_to_shrink_lruvec+0x1cd/0x2b0
[ 1714.873842] [    T172]        lru_gen_shrink_node+0xc3/0x190
[ 1714.874806] [    T172]        do_try_to_free_pages+0xee/0x4b0
[ 1714.875779] [    T172]        try_to_free_pages+0xea/0x280
[ 1714.876699] [    T172]        __alloc_pages_slowpath.constprop.0+0x296/0x970
[ 1714.877897] [    T172]        __alloc_frozen_pages_noprof+0x2b3/0x300
[ 1714.878977] [    T172]        __alloc_pages_noprof+0xa/0x20
[ 1714.879907] [    T172]        alloc_zspage+0xe6/0x2c0 [zsmalloc]
[ 1714.880924] [    T172]        zs_malloc+0xd2/0x2b0 [zsmalloc]
[ 1714.881881] [    T172]        zram_write_page+0xfc/0x300 [zram]
[ 1714.882873] [    T172]        zram_bio_write+0xd1/0x1c0 [zram]
[ 1714.883845] [    T172]        __submit_bio+0x12d/0x1c0
[ 1714.884712] [    T172]        __submit_bio_noacct+0x7f/0x200
[ 1714.885667] [    T172]        ext4_io_submit+0x20/0x40
[ 1714.886532] [    T172]        ext4_do_writepages+0x3e3/0x8b0
[ 1714.887482] [    T172]        ext4_writepages+0xe8/0x280
[ 1714.888377] [    T172]        do_writepages+0xcf/0x260
[ 1714.889247] [    T172]        __writeback_single_inode+0x56/0x350
[ 1714.890273] [    T172]        writeback_sb_inodes+0x227/0x550
[ 1714.891239] [    T172]        __writeback_inodes_wb+0x4c/0xe0
[ 1714.892202] [    T172]        wb_writeback+0x2f2/0x3f0
[ 1714.893071] [    T172]        wb_do_writeback+0x227/0x2a0
[ 1714.893976] [    T172]        wb_workfn+0x56/0x1b0
[ 1714.894777] [    T172]        process_one_work+0x1eb/0x570
[ 1714.895698] [    T172]        worker_thread+0x1d1/0x3b0
[ 1714.896571] [    T172]        kthread+0xf9/0x200
[ 1714.897356] [    T172]        ret_from_fork+0x2d/0x50
[ 1714.898214] [    T172]        ret_from_fork_asm+0x11/0x20
[ 1714.899142] [    T172]
                          other info that might help us debug this:

[ 1714.900906] [    T172] Chain exists of:
                            ptlock_ptr(ptdesc)#2 --> zram-entry->lock --> &zstrm->lock

[ 1714.903183] [    T172]  Possible unsafe locking scenario:

[ 1714.904463] [    T172]        CPU0                    CPU1
[ 1714.905380] [    T172]        ----                    ----
[ 1714.906293] [    T172]   lock(&zstrm->lock);
[ 1714.907006] [    T172]                                lock(zram-entry->lock);
[ 1714.908204] [    T172]                                lock(&zstrm->lock);
[ 1714.909347] [    T172]   lock(ptlock_ptr(ptdesc)#2);
[ 1714.910179] [    T172]
                           *** DEADLOCK ***

[ 1714.911570] [    T172] 7 locks held by kworker/u96:4/172:
[ 1714.912472] [    T172]  #0: ffff88810165d548 ((wq_completion)writeback){+.+.}-{0:0}, at: process_one_work+0x433/0x570
[ 1714.914273] [    T172]  #1: ffffc90000683e40 ((work_completion)(&(&wb->dwork)->work)){+.+.}-{0:0}, at: process_one_work+0x1ad/0x570
[ 1714.916339] [    T172]  #2: ffff88810b93d0e0 (&type->s_umount_key#28){++++}-{4:4}, at: super_trylock_shared+0x16/0x50
[ 1714.918141] [    T172]  #3: ffff88810b93ab50 (&sbi->s_writepages_rwsem){.+.+}-{0:0}, at: do_writepages+0xcf/0x260
[ 1714.919877] [    T172]  #4: ffffe8ffff981cf8 (&zstrm->lock){+.+.}-{4:4}, at: zcomp_stream_get+0x20/0x40 [zram]
[ 1714.921573] [    T172]  #5: ffff888106809900 (&mapping->i_mmap_rwsem){++++}-{4:4}, at: __rmap_walk_file+0x161/0x1b0
[ 1714.923347] [    T172]  #6: ffffffff82347d40 (rcu_read_lock){....}-{1:3}, at: ___pte_offset_map+0x26/0x1b0
[ 1714.924981] [    T172]
                          stack backtrace:
[ 1714.925998] [    T172] CPU: 6 UID: 0 PID: 172 Comm: kworker/u96:4 Not tainted 6.14.0-rc1-next-20250207+ #936
[ 1714.926005] [    T172] Workqueue: writeback wb_workfn (flush-251:0)
[ 1714.926009] [    T172] Call Trace:
[ 1714.926013] [    T172]  <TASK>
[ 1714.926015] [    T172]  dump_stack_lvl+0x57/0x80
[ 1714.926018] [    T172]  print_circular_bug.cold+0x38/0x45
[ 1714.926021] [    T172]  check_noncircular+0x12e/0x150
[ 1714.926025] [    T172]  check_prev_add+0xeb/0xca0
[ 1714.926027] [    T172]  ? add_chain_cache+0x10c/0x480
[ 1714.926029] [    T172]  __lock_acquire+0xf56/0x12c0
[ 1714.926032] [    T172]  lock_acquire.part.0+0x63/0x1a0
[ 1714.926035] [    T172]  ? page_vma_mapped_walk+0x5c0/0x960
[ 1714.926036] [    T172]  ? page_vma_mapped_walk+0x5c0/0x960
[ 1714.926037] [    T172]  _raw_spin_lock+0x2c/0x40
[ 1714.926040] [    T172]  ? page_vma_mapped_walk+0x5c0/0x960
[ 1714.926041] [    T172]  page_vma_mapped_walk+0x5c0/0x960
[ 1714.926043] [    T172]  folio_referenced_one+0xd0/0x4a0
[ 1714.926046] [    T172]  __rmap_walk_file+0xbe/0x1b0
[ 1714.926047] [    T172]  folio_referenced+0x10b/0x140
[ 1714.926050] [    T172]  ? page_mkclean_one+0xc0/0xc0
[ 1714.926051] [    T172]  ? folio_get_anon_vma+0x220/0x220
[ 1714.926052] [    T172]  ? __traceiter_remove_migration_pte+0x50/0x50
[ 1714.926054] [    T172]  shrink_folio_list+0x72c/0xad0
[ 1714.926060] [    T172]  evict_folios+0x247/0x800
[ 1714.926064] [    T172]  try_to_shrink_lruvec+0x1cd/0x2b0
[ 1714.926066] [    T172]  lru_gen_shrink_node+0xc3/0x190
[ 1714.926068] [    T172]  ? mark_usage+0x61/0x110
[ 1714.926071] [    T172]  do_try_to_free_pages+0xee/0x4b0
[ 1714.926073] [    T172]  try_to_free_pages+0xea/0x280
[ 1714.926077] [    T172]  __alloc_pages_slowpath.constprop.0+0x296/0x970
[ 1714.926079] [    T172]  ? __lock_acquire+0x3d1/0x12c0
[ 1714.926081] [    T172]  ? get_page_from_freelist+0xd9/0x680
[ 1714.926083] [    T172]  ? match_held_lock+0x30/0xa0
[ 1714.926085] [    T172]  __alloc_frozen_pages_noprof+0x2b3/0x300
[ 1714.926088] [    T172]  __alloc_pages_noprof+0xa/0x20
[ 1714.926090] [    T172]  alloc_zspage+0xe6/0x2c0 [zsmalloc]
[ 1714.926092] [    T172]  ? zs_malloc+0xc5/0x2b0 [zsmalloc]
[ 1714.926094] [    T172]  ? __lock_release.isra.0+0x5e/0x180
[ 1714.926096] [    T172]  zs_malloc+0xd2/0x2b0 [zsmalloc]
[ 1714.926099] [    T172]  zram_write_page+0xfc/0x300 [zram]
[ 1714.926102] [    T172]  zram_bio_write+0xd1/0x1c0 [zram]
[ 1714.926105] [    T172]  __submit_bio+0x12d/0x1c0
[ 1714.926107] [    T172]  ? jbd2_journal_stop+0x145/0x320
[ 1714.926109] [    T172]  ? kmem_cache_free+0xb5/0x3e0
[ 1714.926112] [    T172]  ? lock_release+0x6b/0x130
[ 1714.926115] [    T172]  ? __submit_bio_noacct+0x7f/0x200
[ 1714.926116] [    T172]  __submit_bio_noacct+0x7f/0x200
[ 1714.926118] [    T172]  ext4_io_submit+0x20/0x40
[ 1714.926120] [    T172]  ext4_do_writepages+0x3e3/0x8b0
[ 1714.926122] [    T172]  ? lock_acquire.part.0+0x63/0x1a0
[ 1714.926124] [    T172]  ? do_writepages+0xcf/0x260
[ 1714.926127] [    T172]  ? ext4_writepages+0xe8/0x280
[ 1714.926128] [    T172]  ext4_writepages+0xe8/0x280
[ 1714.926130] [    T172]  do_writepages+0xcf/0x260
[ 1714.926133] [    T172]  ? find_held_lock+0x2b/0x80
[ 1714.926134] [    T172]  ? writeback_sb_inodes+0x1b8/0x550
[ 1714.926136] [    T172]  __writeback_single_inode+0x56/0x350
[ 1714.926138] [    T172]  writeback_sb_inodes+0x227/0x550
[ 1714.926143] [    T172]  __writeback_inodes_wb+0x4c/0xe0
[ 1714.926145] [    T172]  wb_writeback+0x2f2/0x3f0
[ 1714.926147] [    T172]  wb_do_writeback+0x227/0x2a0
[ 1714.926150] [    T172]  wb_workfn+0x56/0x1b0
[ 1714.926151] [    T172]  process_one_work+0x1eb/0x570
[ 1714.926154] [    T172]  worker_thread+0x1d1/0x3b0
[ 1714.926157] [    T172]  ? bh_worker+0x250/0x250
[ 1714.926159] [    T172]  kthread+0xf9/0x200
[ 1714.926161] [    T172]  ? kthread_fetch_affinity.isra.0+0x40/0x40
[ 1714.926163] [    T172]  ret_from_fork+0x2d/0x50
[ 1714.926165] [    T172]  ? kthread_fetch_affinity.isra.0+0x40/0x40
[ 1714.926166] [    T172]  ret_from_fork_asm+0x11/0x20
[ 1714.926170] [    T172]  </TASK>

