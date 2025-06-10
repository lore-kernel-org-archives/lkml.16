Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B109325334B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 17:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749576210; cv=none; b=hmha/EQfD4j9Xcmg6KQUCzliQJ17y8lWN+QT4gTOnlYjZfuwbU+bLwLsq8VCtizvKf44PxYbMj9EFL4VKfukZkBMTe6JuJLb1PPukxFWd6Qat9sECs0Mb8dt8qz7SuChxml5MfI9FzSZ7XTIh61AT1bsNFZHnsqFNCoRO5tvd3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749576210; c=relaxed/simple;
	bh=kRkAcePNPx6B6qpYiCu2+Rnyo5tQTlwg9U8nK+kBPkQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ST8JxTl1HWadDlQJlBEamkteMrbqBiSHRDrM2TC2CVrkw9hcpkxZFxPNf7C9KiR45r1NQd8NhJLJtFvZiAP1cxp5TrUG6DX2qx4V67HcF0bd7n4C9rgsZvBDJpX0mxKd361qZ8xjwR6nYntpPQ0WdejYielLdoch+JRJH4mz9Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=ylFyyhtq; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="ylFyyhtq"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3ddda14b56cso10479515ab.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 10:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1749576207; x=1750181007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GgQQVuRtKE3jAXbKM+l0+1YF9/lRi89dLzlILxcJj9g=;
        b=ylFyyhtqTJtN8hm0hYL7KwOvTRce9oH1VM/lI8JP9oertgVKcumCbdDOvm96XMi62D
         gnomSjttTZi00QQPAqz7LnaWzWmAgypZBVTAU3hfPrgaMD+sfJF6SzPnq86H/OnOGWxd
         Z2jlIQcLwwxPdI3eltjRFrZ16p8/NX/DeQm27jdUuR9Y4L582nieT0btV5aCzF43jZYX
         uP5VYnu8IGg3QQq6s5kfg9aVFUs/brj9ck8ieAnznVrIpTbvW7BkNIAt//fTSdGEIOnt
         gNg60jchbyYia1OmaivRv2usQRxXeVdCvkRfwwbNCy6D803QszMbW5eSPFcg0SRZD/tp
         F4VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749576207; x=1750181007;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GgQQVuRtKE3jAXbKM+l0+1YF9/lRi89dLzlILxcJj9g=;
        b=FJpLSHS4CmWKBIigE4xzN8+aCM1+RWrU88OKUhfkZaZp/XKQuk5J9MKG4zDGAbKoTJ
         vn3AotlPofxC1QeXuwluZoPKOex279EF/pXThMVckOZFOXVSBurrojB6qQVx3taSvUPh
         Xd6y9m2k+dHHZ/7ixkd22gFCBN0jWumyIxtuozdUQChqlPYuNa1HFmpZl6B/eOLZy91D
         4A7ZpvUHvsrL3w5OjaNds7N5qnDgd5mGlpj8xcHEbKjz36UfsWo8sz1DHxMjLjlKUnso
         FTe53WCuJHdjkFMNVFapTfmnVt7cnvWl9QENFY8NFzVApazU4lZNZr5JuY6P9s1ydD0T
         8hsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpi+8gxt6W7MKYamh8ArUvHrgvZ/XATn/a/U8sNYDdrjklkJr1Jxk35cQB4ret8sGQaooXw9UU+gWs/5g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDWCfZOtBsJXMiFlzgYtzjjz+NeQnv6fQokYqK6mmKHqBRylzn
	HrBfZ6H3+nSQRCxFZ6y3/wqkNqvNWCSjPgW6blooWveeWMDflqcuvDz88cZ+m75Y38/KsKsntld
	MY5Yz
X-Gm-Gg: ASbGncvr9hTOo+MmNX1JE99p/XX6Aj/R+ctHAI9ymH92aPuGsj6YZ7w0gVRDRxpI4JZ
	LLZWEFliqKcPVposGCRo7NrqlB84QyYohluoFYjpcSgMDOcLRy71fkrYCaARe7Z9BEHoC5f94dB
	8Tw33/hCOrI1MDjrPr+r2clq1fgUhV1gZfeBSAWCxYJYcC1eOHdz9dvEKQNEM85afB2x3c5dC4Y
	uck7EH9lfTBVXZS/9Ae66LrWdEaUiAogjwWe62kGOGKhnTH1jyhGmQrAaXv3YqjPYOvjX1OwiMP
	seUfcD3f0GOB5Y4alnU0Xq1nlejdkMcKOpsNtT44MDJwzr15uheoQQ==
X-Google-Smtp-Source: AGHT+IE0/Ye4lkQfGLJvYl/ZLOYdK2FFEZ4cRpe/KimRXtDj2jyft0p8wwGMYncOvaevW0r4Xq/leA==
X-Received: by 2002:a05:6e02:2587:b0:3dc:7df8:c830 with SMTP id e9e14a558f8ab-3ddf423919emr652905ab.7.1749576206634;
        Tue, 10 Jun 2025 10:23:26 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5012a90bb22sm1946173.15.2025.06.10.10.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 10:23:26 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Penglei Jiang <superman.xpt@gmail.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org, 
 syzbot+531502bbbe51d2f769f4@syzkaller.appspotmail.com
In-Reply-To: <20250610171801.70960-1-superman.xpt@gmail.com>
References: <20250610171801.70960-1-superman.xpt@gmail.com>
Subject: Re: [PATCH v2] io_uring: fix use-after-free of sq->thread in
 __io_uring_show_fdinfo()
Message-Id: <174957620590.185003.13986443341794227523.b4-ty@kernel.dk>
Date: Tue, 10 Jun 2025 11:23:25 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-7b9b9


On Tue, 10 Jun 2025 10:18:01 -0700, Penglei Jiang wrote:
> [BUG]
> 
> [   84.375406] ==================================================================
> [   84.378543] BUG: KASAN: slab-use-after-free in getrusage+0x1109/0x1a60
> [   84.381058] Read of size 8 at addr ffff88810de2d2c8 by task a.out/304
> [   84.382977]
> [   84.383767] CPU: 0 UID: 0 PID: 304 Comm: a.out Not tainted 6.16.0-rc1 #1 PREEMPT(voluntary)
> [   84.383788] Hardware name: QEMU Ubuntu 24.04 PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> [   84.383819] Call Trace:
> [   84.383841]  <TASK>
> [   84.383842]  dump_stack_lvl+0x53/0x70
> [   84.383957]  print_report+0xd0/0x670
> [   84.384008]  ? __pfx__raw_spin_lock_irqsave+0x10/0x10
> [   84.384057]  ? getrusage+0x1109/0x1a60
> [   84.384060]  kasan_report+0xce/0x100
> [   84.384063]  ? getrusage+0x1109/0x1a60
> [   84.384066]  getrusage+0x1109/0x1a60
> [   84.384070]  ? __pfx_getrusage+0x10/0x10
> [   84.384073]  __io_uring_show_fdinfo+0x9fe/0x1790
> [   84.384117]  ? ksys_read+0xf7/0x1c0
> [   84.384133]  ? do_syscall_64+0xa4/0x260
> [   84.384144]  ? vsnprintf+0x591/0x1100
> [   84.384155]  ? __pfx___io_uring_show_fdinfo+0x10/0x10
> [   84.384157]  ? __pfx_vsnprintf+0x10/0x10
> [   84.384175]  ? mutex_trylock+0xcf/0x130
> [   84.384185]  ? __pfx_mutex_trylock+0x10/0x10
> [   84.384198]  ? __pfx_show_fd_locks+0x10/0x10
> [   84.384219]  ? io_uring_show_fdinfo+0x57/0x80
> [   84.384222]  io_uring_show_fdinfo+0x57/0x80
> [   84.384224]  seq_show+0x38c/0x690
> [   84.384257]  seq_read_iter+0x3f7/0x1180
> [   84.384279]  ? inode_set_ctime_current+0x160/0x4b0
> [   84.384296]  seq_read+0x271/0x3e0
> [   84.384298]  ? __pfx_seq_read+0x10/0x10
> [   84.384300]  ? __pfx__raw_spin_lock+0x10/0x10
> [   84.384303]  ? __mark_inode_dirty+0x402/0x810
> [   84.384313]  ? selinux_file_permission+0x368/0x500
> [   84.384385]  ? file_update_time+0x10f/0x160
> [   84.384388]  vfs_read+0x177/0xa40
> [   84.384393]  ? __pfx___handle_mm_fault+0x10/0x10
> [   84.384440]  ? __pfx_vfs_read+0x10/0x10
> [   84.384443]  ? mutex_lock+0x81/0xe0
> [   84.384446]  ? __pfx_mutex_lock+0x10/0x10
> [   84.384449]  ? fdget_pos+0x24d/0x4b0
> [   84.384452]  ksys_read+0xf7/0x1c0
> [   84.384455]  ? __pfx_ksys_read+0x10/0x10
> [   84.384458]  ? do_user_addr_fault+0x43b/0x9c0
> [   84.384486]  do_syscall_64+0xa4/0x260
> [   84.384489]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> [   84.384528] RIP: 0033:0x7f0f74170fc9
> [   84.384560] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 8
> [   84.384563] RSP: 002b:00007fffece049e8 EFLAGS: 00000206 ORIG_RAX: 0000000000000000
> [   84.384588] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f0f74170fc9
> [   84.384611] RDX: 0000000000001000 RSI: 00007fffece049f0 RDI: 0000000000000004
> [   84.384613] RBP: 00007fffece05ad0 R08: 0000000000000000 R09: 00007fffece04d90
> [   84.384615] R10: 0000000000000000 R11: 0000000000000206 R12: 00005651720a1100
> [   84.384617] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
> [   84.384619]  </TASK>
> [   84.384620]
> [   84.461314] Allocated by task 298:
> [   84.462019]  kasan_save_stack+0x33/0x60
> [   84.462598]  kasan_save_track+0x14/0x30
> [   84.463213]  __kasan_slab_alloc+0x6e/0x70
> [   84.463853]  kmem_cache_alloc_node_noprof+0xe8/0x330
> [   84.465483]  copy_process+0x376/0x5e00
> [   84.466798]  create_io_thread+0xab/0xf0
> [   84.468355]  io_sq_offload_create+0x9ed/0xf20
> [   84.470323]  io_uring_setup+0x12b0/0x1cc0
> [   84.471830]  do_syscall_64+0xa4/0x260
> [   84.473255]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> [   84.474952]
> [   84.475758] Freed by task 22:
> [   84.476878]  kasan_save_stack+0x33/0x60
> [   84.478400]  kasan_save_track+0x14/0x30
> [   84.479709]  kasan_save_free_info+0x3b/0x60
> [   84.480777]  __kasan_slab_free+0x37/0x50
> [   84.481299]  kmem_cache_free+0xc4/0x360
> [   84.481945]  rcu_core+0x5ff/0x19f0
> [   84.483038]  handle_softirqs+0x18c/0x530
> [   84.485407]  run_ksoftirqd+0x20/0x30
> [   84.487146]  smpboot_thread_fn+0x287/0x6c0
> [   84.488552]  kthread+0x30d/0x630
> [   84.489856]  ret_from_fork+0xef/0x1a0
> [   84.491239]  ret_from_fork_asm+0x1a/0x30
> [   84.492366]
> [   84.493099] Last potentially related work creation:
> [   84.495175]  kasan_save_stack+0x33/0x60
> [   84.496416]  kasan_record_aux_stack+0x8c/0xa0
> [   84.498060]  __call_rcu_common.constprop.0+0x68/0x940
> [   84.499326]  __schedule+0xff2/0x2930
> [   84.499970]  __cond_resched+0x4c/0x80
> [   84.501305]  mutex_lock+0x5c/0xe0
> [   84.502374]  io_uring_del_tctx_node+0xe1/0x2b0
> [   84.504251]  io_uring_clean_tctx+0xb7/0x160
> [   84.505377]  io_uring_cancel_generic+0x34e/0x760
> [   84.507126]  do_exit+0x240/0x2350
> [   84.508667]  do_group_exit+0xab/0x220
> [   84.509927]  __x64_sys_exit_group+0x39/0x40
> [   84.511223]  x64_sys_call+0x1243/0x1840
> [   84.512795]  do_syscall_64+0xa4/0x260
> [   84.514044]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> [   84.515792]
> [   84.516374] The buggy address belongs to the object at ffff88810de2cb00
> [   84.516374]  which belongs to the cache task_struct of size 3712
> [   84.521449] The buggy address is located 1992 bytes inside of
> [   84.521449]  freed 3712-byte region [ffff88810de2cb00, ffff88810de2d980)
> [   84.524996]
> [   84.525514] The buggy address belongs to the physical page:
> [   84.527383] page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x10de28
> [   84.530907] head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
> [   84.533573] flags: 0x200000000000040(head|node=0|zone=2)
> [   84.535366] page_type: f5(slab)
> [   84.536410] raw: 0200000000000040 ffff8881001acdc0 dead000000000122 0000000000000000
> [   84.538807] raw: 0000000000000000 0000000000080008 00000000f5000000 0000000000000000
> [   84.542033] head: 0200000000000040 ffff8881001acdc0 dead000000000122 0000000000000000
> [   84.545121] head: 0000000000000000 0000000000080008 00000000f5000000 0000000000000000
> [   84.547663] head: 0200000000000003 ffffea0004378a01 00000000ffffffff 00000000ffffffff
> [   84.549959] head: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000000
> [   84.552180] page dumped because: kasan: bad access detected
> [   84.554098]
> [   84.554798] Memory state around the buggy address:
> [   84.556798]  ffff88810de2d180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> [   84.559258]  ffff88810de2d200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> [   84.562112] >ffff88810de2d280: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> [   84.564710]                                               ^
> [   84.567076]  ffff88810de2d300: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> [   84.569900]  ffff88810de2d380: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> [   84.573018] ==================================================================
> 
> [...]

Applied, thanks!

[1/1] io_uring: fix use-after-free of sq->thread in __io_uring_show_fdinfo()
      commit: ac0b8b327a5677dc6fecdf353d808161525b1ff0

Best regards,
-- 
Jens Axboe



