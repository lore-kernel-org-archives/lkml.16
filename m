Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193ED2DCC0C
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 02:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748311383; cv=none; b=Xz0MHzJ/VUK/Qd0/7IbC9iJJ8G4e6A4Sz7XyBJODlC8exxiYe7oQ11jKWlb4a2GOzcRvrkZlC8WlkybER//sF0lzDYRbqi++3NVcFyna9SA4QfixZ6Vqbho8zonzYbFXU+PNJBPgmIWGfQHy/1/gOIAOoWOVdt9qJ0QdHjVOKDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748311383; c=relaxed/simple;
	bh=k0VlJouqpFg5AoS8DlI1Yy2aaJD4wzwFPEPkKT6KMrk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CD4G7OWcocMU8CAzMwU13Y96OH5Ew2X2nsupM2nHaDWHRuV49T1ffq7yt2pknMubDqYnteZq4JDDiL16Nl2CPBgYyTkxcB2wFDmZWrqANLGlqQslKUHd3wiHDsGdn+SrqFzcI3IQi+HPISeFCjPEoCLZXb2dNUYooJTSPbi6Hak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TYHqc9mV; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TYHqc9mV"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7376dd56f8fso2917372b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 19:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748311381; x=1748916181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VU3rcYrt9V7b3tuNavcz7mARYGV+yCHpl4BwvA8qfzQ=;
        b=TYHqc9mVYoWmDWB/UAi7jUcTmGMxw2SN17CALD9VvWSgUVSB0b3EHI/43aQuOBIVZ3
         bycyqC+l+ZVKCXC6MlvT2tPjf/X+kIWQ8jDTFEdg8ZNd0v5QcsFraVGVwjiYKC3dDuWN
         Qw8Ip/0XyyPZalJbQM0lHzwM8UOcNlt9/OjedvNdZA3FQ/gSG9eA0XKUubcXZaMRCerz
         i7BQpTgVEQccESu/LE72VB4QcWrFqSzG8BG83oqbV006y+2TsJsv4fY8Kkb2ZfJ8lQfj
         B9vNfl+GdKy/DriyREMbxKH8bbVGd2vUM8tk6+QuL9vlpHaTYjaRIubFBqqfsKVPi9Hj
         BN5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748311381; x=1748916181;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VU3rcYrt9V7b3tuNavcz7mARYGV+yCHpl4BwvA8qfzQ=;
        b=C6ERzOXbhLv2LBseysj3+qhWy5Oy73pk+AtZdAOk0TyZfNZFXcNlYByLKcbXSE/Vwp
         vW/V/sGJh27KVZTde6letOdGjXajhYIzQC4EXcadPukR6AE9WyESAHcChd2Zbde7UmvN
         hRVaqYdjNk+IAMu3wStmug0qvyWnWJBO0BzygLwUx6A4UthkJ+l9QIhAJ272sZkacvoR
         y6zNCPsqfBtak6RgXr3TEoHdcfzQqayQqhDlU1Tz4rdIPvt4ZaFzm7vZwXp4ypbVthF2
         xPQFaZSu+cvSu4hiKt5HeWaRy5ytGltTotWnb8VqaWZ0gzkR4ys2ELb5H8XV0lhiLYGg
         s+qQ==
X-Forwarded-Encrypted: i=1; AJvYcCW963V3VzNTRgkeypdSYkVD87Opm9J4IDI1/N+RXgjJJdDHckYP40jfDrh55L8zDZXxaaTjZBzB1/PvQyo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyobi2xndHnnodS71JeFpvK9K/sZnhu/fPRFThFQylmRMZ9TyqB
	4WYtCL2AkUGp6cFQLRqpiCtJxgMM4auixvfxO6AOHHbwsjLjKyuUD7sK
X-Gm-Gg: ASbGncuqNNyk6tsnpjKwC9zQkei6kZ5qzIFkiWdsnxQqO8IVb5NsveCnSsoXq675YAI
	BKGAMIurn1TqVF0E0eeIgQlrroJmgoCN4pwLtcr2xrUscHeVLXG+IrUial6L2dNSizhVSsx5/DL
	69XaWz7+U/P7Vj3h+dTEm0ec7rqkvd5OG4VTiMdq2dr5zNHj4rVLaxtgPouUbRPWJEaGGyQ9hJ9
	X6mp30rRh/4IBMQCYeZtDTxdHfVKzZvJtTsd+h7sS5Zs75KXCBRk03ka1Fhm4RQFhVvB+9hb0e4
	oQzaTVfjxC7qKonyrZIMsi65g3S2PnS6zXcOyZ+vTH0HX+3TivydzXtKGuOu
X-Google-Smtp-Source: AGHT+IEZceU3+9AxJ6n3g1AfDmvP8L3RN4h2wu4QWAqavRyO52oi1El9EVCUVuqXxiuKU8A2VdDTIA==
X-Received: by 2002:a05:6a00:9154:b0:746:227c:a808 with SMTP id d2e1a72fcca58-746227ca91dmr3907055b3a.24.1748311381036;
        Mon, 26 May 2025 19:03:01 -0700 (PDT)
Received: from EBJ9932692.tcent.cn ([103.88.46.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7461c3e5892sm1703974b3a.40.2025.05.26.19.02.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 May 2025 19:03:00 -0700 (PDT)
From: Lance Yang <ioworker0@gmail.com>
X-Google-Original-From: Lance Yang <lance.yang@linux.dev>
To: peterz@infradead.org
Cc: mingo@redhat.com,
	will@kernel.org,
	boqun.feng@gmail.com,
	longman@redhat.com,
	linux-kernel@vger.kernel.org
Subject: [WARN] LOCKDEP: MAX_LOCKDEP_CHAIN_HLOCKS too low
Date: Tue, 27 May 2025 10:02:52 +0800
Message-ID: <20250527020252.43684-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lance Yang <lance.yang@linux.dev>

Hi all,

With CONFIG_LOCKDEP on, I got this warning during kernel builds:

[Tue May 27 00:22:59 2025] BUG: MAX_LOCKDEP_CHAIN_HLOCKS too low!
[Tue May 27 00:22:59 2025] turning off the locking correctness validator.
[Tue May 27 00:22:59 2025] CPU: 56 UID: 0 PID: 3362352 Comm: cc1 Kdump: loaded Tainted: G S                  6.15.0-rc6 #5 PREEMPT(voluntary)
[Tue May 27 00:22:59 2025] Tainted: [S]=CPU_OUT_OF_SPEC
[Tue May 27 00:22:59 2025] Hardware name: New H3C Technologies Co., Ltd. H3C UniServer R4900 G5/RS35M2C16SB, BIOS 5.69 10/18/2023
[Tue May 27 00:22:59 2025] Call Trace:
[Tue May 27 00:22:59 2025]  <TASK>
[Tue May 27 00:22:59 2025]  show_stack+0x4d/0x60
[Tue May 27 00:22:59 2025]  dump_stack_lvl+0x72/0xa0
[Tue May 27 00:22:59 2025]  dump_stack+0x14/0x1a
[Tue May 27 00:22:59 2025]  add_chain_cache+0x304/0x330
[Tue May 27 00:22:59 2025]  __lock_acquire+0x7d3/0xfd0
[Tue May 27 00:22:59 2025]  lock_acquire.part.0+0xb4/0x210
[Tue May 27 00:22:59 2025]  ? bad_range+0xa6/0x320
[Tue May 27 00:22:59 2025]  ? mark_usage+0x68/0x130
[Tue May 27 00:22:59 2025]  lock_acquire+0x62/0x120
[Tue May 27 00:22:59 2025]  ? bad_range+0xa6/0x320
[Tue May 27 00:22:59 2025]  seqcount_lockdep_reader_access+0x3d/0xa0
[Tue May 27 00:22:59 2025]  ? bad_range+0xa6/0x320
[Tue May 27 00:22:59 2025]  bad_range+0xa6/0x320
[Tue May 27 00:22:59 2025]  ? __kasan_check_write+0x18/0x20
[Tue May 27 00:22:59 2025]  expand+0x91/0x3c0
[Tue May 27 00:22:59 2025]  ? __del_page_from_free_list+0x82/0x4b0
[Tue May 27 00:22:59 2025]  rmqueue_bulk+0x13a/0xc00
[Tue May 27 00:22:59 2025]  ? lock_acquire.part.0+0xb4/0x210
[Tue May 27 00:22:59 2025]  __rmqueue_pcplist+0x4a7/0x8f0
[Tue May 27 00:22:59 2025]  rmqueue_pcplist+0xcc/0x2a0
[Tue May 27 00:22:59 2025]  rmqueue.isra.0+0xd26/0x1470
[Tue May 27 00:22:59 2025]  ? stack_trace_save+0x96/0xd0
[Tue May 27 00:22:59 2025]  ? __pfx_stack_trace_save+0x10/0x10
[Tue May 27 00:22:59 2025]  ? stack_depot_save_flags+0x41/0x6a0
[Tue May 27 00:22:59 2025]  ? lock_acquire.part.0+0xb4/0x210
[Tue May 27 00:22:59 2025]  get_page_from_freelist+0x262/0x11a0
[Tue May 27 00:22:59 2025]  ? kasan_save_stack+0x3e/0x50
[Tue May 27 00:22:59 2025]  ? kasan_save_stack+0x2f/0x50
[Tue May 27 00:22:59 2025]  ? __call_rcu_common.constprop.0+0xc4/0x950
[Tue May 27 00:22:59 2025]  ? commit_merge+0x634/0x1100
[Tue May 27 00:22:59 2025]  __alloc_frozen_pages_noprof+0x30e/0x6c0
[Tue May 27 00:22:59 2025]  ? __pfx___alloc_frozen_pages_noprof+0x10/0x10
[Tue May 27 00:22:59 2025]  ? __lock_acquire+0x3dc/0xfd0
[Tue May 27 00:22:59 2025]  ? mark_usage+0x68/0x130
[Tue May 27 00:22:59 2025]  ? policy_nodemask+0x21d/0x350
[Tue May 27 00:22:59 2025]  alloc_pages_mpol+0x163/0x460
[Tue May 27 00:22:59 2025]  ? __pfx_alloc_pages_mpol+0x10/0x10
[Tue May 27 00:22:59 2025]  ? ___slab_alloc+0xe3/0x10f0
[Tue May 27 00:22:59 2025]  ? find_held_lock+0x31/0x90
[Tue May 27 00:22:59 2025]  alloc_frozen_pages_noprof+0x4b/0x130
[Tue May 27 00:22:59 2025]  allocate_slab+0x23a/0x380
[Tue May 27 00:22:59 2025]  ___slab_alloc+0x985/0x10f0
[Tue May 27 00:22:59 2025]  ? find_held_lock+0x31/0x90
[Tue May 27 00:22:59 2025]  ? xfs_buf_item_init+0x7b/0x660 [xfs]
[Tue May 27 00:22:59 2025]  ? xfs_buf_item_init+0x7b/0x660 [xfs]
[Tue May 27 00:22:59 2025]  ? lock_release.part.0+0x20/0x60
[Tue May 27 00:22:59 2025]  ? fs_reclaim_acquire+0x83/0x120
[Tue May 27 00:22:59 2025]  ? xfs_buf_item_init+0x7b/0x660 [xfs]
[Tue May 27 00:22:59 2025]  kmem_cache_alloc_noprof+0x1ed/0x430
[Tue May 27 00:22:59 2025]  ? kmem_cache_alloc_noprof+0x1ed/0x430
[Tue May 27 00:22:59 2025]  xfs_buf_item_init+0x7b/0x660 [xfs]
[Tue May 27 00:22:59 2025]  ? xfs_imap_to_bp+0x10b/0x2b0 [xfs]
[Tue May 27 00:22:59 2025]  ? __pfx_xfs_buf_read_map+0x10/0x10 [xfs]
[Tue May 27 00:22:59 2025]  ? xfs_file_buffered_write+0x14c/0xa50 [xfs]
[Tue May 27 00:22:59 2025]  _xfs_trans_bjoin+0x45/0x130 [xfs]
[Tue May 27 00:22:59 2025]  xfs_trans_read_buf_map+0x38c/0x840 [xfs]
[Tue May 27 00:22:59 2025]  ? __pfx_xfs_trans_read_buf_map+0x10/0x10 [xfs]
[Tue May 27 00:22:59 2025]  ? lock_acquire.part.0+0xb4/0x210
[Tue May 27 00:22:59 2025]  xfs_imap_to_bp+0x10b/0x2b0 [xfs]
[Tue May 27 00:22:59 2025]  ? __pfx_xfs_imap_to_bp+0x10/0x10 [xfs]
[Tue May 27 00:22:59 2025]  ? __kasan_check_read+0x15/0x20
[Tue May 27 00:22:59 2025]  ? do_raw_spin_unlock+0x5d/0x1f0
[Tue May 27 00:22:59 2025]  xfs_inode_item_precommit+0x538/0xc10 [xfs]
[Tue May 27 00:22:59 2025]  ? __pfx_xfs_inode_item_precommit+0x10/0x10 [xfs]
[Tue May 27 00:22:59 2025]  __xfs_trans_commit+0x2a3/0xba0 [xfs]
[Tue May 27 00:22:59 2025]  ? __pfx___xfs_trans_commit+0x10/0x10 [xfs]
[Tue May 27 00:22:59 2025]  ? ktime_get_coarse_real_ts64_mg+0x61/0x1d0
[Tue May 27 00:22:59 2025]  ? __kasan_check_read+0x15/0x20
[Tue May 27 00:22:59 2025]  xfs_trans_commit+0xce/0x150 [xfs]
[Tue May 27 00:22:59 2025]  ? xfs_trans_ijoin+0xcf/0x170 [xfs]
[Tue May 27 00:22:59 2025]  ? __pfx_xfs_trans_commit+0x10/0x10 [xfs]
[Tue May 27 00:22:59 2025]  xfs_vn_update_time+0x1fc/0x440 [xfs]
[Tue May 27 00:22:59 2025]  ? __pfx_xfs_vn_update_time+0x10/0x10 [xfs]
[Tue May 27 00:22:59 2025]  ? __kasan_check_read+0x15/0x20
[Tue May 27 00:22:59 2025]  kiocb_modified+0x1a6/0x240
[Tue May 27 00:22:59 2025]  xfs_file_write_checks.constprop.0+0x451/0x860 [xfs]
[Tue May 27 00:22:59 2025]  xfs_file_buffered_write+0x14c/0xa50 [xfs]
[Tue May 27 00:22:59 2025]  ? __pfx_xfs_file_buffered_write+0x10/0x10 [xfs]
[Tue May 27 00:22:59 2025]  ? ovl_other_xattr_get+0xee/0x160 [overlay]
[Tue May 27 00:22:59 2025]  ? find_held_lock+0x31/0x90
[Tue May 27 00:22:59 2025]  ? __pfx_ovl_other_xattr_get+0x10/0x10 [overlay]
[Tue May 27 00:22:59 2025]  ? mark_usage+0x68/0x130
[Tue May 27 00:22:59 2025]  xfs_file_write_iter+0x553/0x830 [xfs]
[Tue May 27 00:22:59 2025]  do_iter_readv_writev+0x422/0x910
[Tue May 27 00:22:59 2025]  ? lock_acquire.part.0+0xb4/0x210
[Tue May 27 00:22:59 2025]  ? backing_file_write_iter.part.0+0x4ee/0x7e0
[Tue May 27 00:22:59 2025]  ? __pfx_do_iter_readv_writev+0x10/0x10
[Tue May 27 00:22:59 2025]  ? selinux_file_permission+0x389/0x470
[Tue May 27 00:22:59 2025]  ? lock_is_held_type+0xa8/0x120
[Tue May 27 00:22:59 2025]  vfs_iter_write+0x17b/0x7a0
[Tue May 27 00:22:59 2025]  backing_file_write_iter.part.0+0x4ee/0x7e0
[Tue May 27 00:22:59 2025]  ? ovl_real_file+0x16a/0x1b0 [overlay]
[Tue May 27 00:22:59 2025]  backing_file_write_iter+0xc8/0x110
[Tue May 27 00:22:59 2025]  ovl_write_iter+0x2cc/0x450 [overlay]
[Tue May 27 00:22:59 2025]  ? __pfx_ovl_write_iter+0x10/0x10 [overlay]
[Tue May 27 00:22:59 2025]  ? __pfx_ovl_file_end_write+0x10/0x10 [overlay]
[Tue May 27 00:22:59 2025]  ? lock_is_held_type+0xa8/0x120
[Tue May 27 00:22:59 2025]  vfs_write+0x5c1/0x1050
[Tue May 27 00:22:59 2025]  ? __pfx_vfs_write+0x10/0x10
[Tue May 27 00:22:59 2025]  ? ktime_get_coarse_real_ts64+0x44/0xd0
[Tue May 27 00:22:59 2025]  ? lockdep_hardirqs_on_prepare.part.0+0xa3/0x140
[Tue May 27 00:22:59 2025]  ksys_write+0x109/0x200
[Tue May 27 00:22:59 2025]  ? __lock_release.isra.0+0x60/0x160
[Tue May 27 00:22:59 2025]  ? __pfx_ksys_write+0x10/0x10
[Tue May 27 00:22:59 2025]  ? __audit_syscall_entry+0x2ef/0x540
[Tue May 27 00:22:59 2025]  ? irqentry_exit_to_user_mode+0x7d/0x290
[Tue May 27 00:22:59 2025]  ? irqentry_exit+0x6f/0xa0
[Tue May 27 00:22:59 2025]  __x64_sys_write+0x76/0xb0
[Tue May 27 00:22:59 2025]  x64_sys_call+0x28a/0x1d70
[Tue May 27 00:22:59 2025]  do_syscall_64+0x77/0x180
[Tue May 27 00:22:59 2025]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[Tue May 27 00:22:59 2025] RIP: 0033:0x7f56cbac9687
[Tue May 27 00:22:59 2025] Code: 48 89 fa 4c 89 df e8 58 b3 00 00 8b 93 08 03 00 00 59 5e 48 83 f8 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44 24 10 0f 05 <5b> c3 0f 1f 80 00 00 00 00 83 e2 39 83 fa 08 75 de e8 23 ff ff ff
[Tue May 27 00:22:59 2025] RSP: 002b:00007ffe65c16880 EFLAGS: 00000202 ORIG_RAX: 0000000000000001
[Tue May 27 00:22:59 2025] RAX: ffffffffffffffda RBX: 00007f56cba39440 RCX: 00007f56cbac9687
[Tue May 27 00:22:59 2025] RDX: 0000000000001000 RSI: 0000000004735f60 RDI: 0000000000000003
[Tue May 27 00:22:59 2025] RBP: 0000000004735f60 R08: 0000000000000000 R09: 0000000000000000
[Tue May 27 00:22:59 2025] R10: 0000000000000000 R11: 0000000000000202 R12: 0000000000001000
[Tue May 27 00:22:59 2025] R13: 00000000046ecad0 R14: 00007f56cbc1fe80 R15: 0000000000000028
[Tue May 27 00:22:59 2025]  </TASK>

$ cat .config|grep CONFIG_LOCKDEP
CONFIG_LOCKDEP_SUPPORT=y
CONFIG_LOCKDEP=y
CONFIG_LOCKDEP_BITS=15
CONFIG_LOCKDEP_CHAINS_BITS=16
CONFIG_LOCKDEP_STACK_TRACE_BITS=19
CONFIG_LOCKDEP_STACK_TRACE_HASH_BITS=14
CONFIG_LOCKDEP_CIRCULAR_QUEUE_BITS=12

Is it safe? Or could this be a real locking issue?

Thanks,
Lance
