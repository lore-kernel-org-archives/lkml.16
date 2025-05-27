Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153C47261A
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 04:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748321311; cv=none; b=n610DilSmh6+qniKHnB9O8LmHlwRwprsb6YgaiX3b5Rf7QSItJPIxGlbCB/qy1+LtRwYv7pPSi6v+xrL0nY51qHHyJZlLDK6V1vaUkUi+voL1wn8D+ajRBiM9mfznOtbAv/rFxup6rynJcY4668TGsCzuYgJ90xJgfoUUwV8xmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748321311; c=relaxed/simple;
	bh=9liY5cqb/O0W8HBy0SAcDCwA3VJ0oWZvuJq0PGZpYtI=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=V5XeBbbY4aqVtP4ce7IMUm4gLKpt+48En0bxIH9ij1tRaO38Ty6O1tsl/T5Auh+ORbkUlqvz0jpzQTpEPg76RiikdlHtfL+9ojE/WFuWY5Py0DPnqmp1nlBTYIwdQPyChAfjrUe5JsZgY0EWFBYl9s7D59/gLGDi0AS50M8n7qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IIBnIqp2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IIBnIqp2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748321307;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A6cZd93utSPw7y6Io+o7Gmqp/MzMi/Cf13vsDw9hfwk=;
	b=IIBnIqp2N009MWEd7DG/FWheLo/qy2sJKwm9Iv8eHyoSDdc4Bs+P/Qh5/jH/+6UmR22DuU
	eZYvuM+FFvEPdqfGCjjqC/FbSIIVISeix80AoV48ZIqMLV2L6foAvGaEBxM41TK9hemGBU
	u0gXRQRXI7zZN3mJUSX+WnM7whN70kY=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-b2Vz-xdMOUmMyOm4Yk4Dqg-1; Tue, 27 May 2025 00:48:24 -0400
X-MC-Unique: b2Vz-xdMOUmMyOm4Yk4Dqg-1
X-Mimecast-MFC-AGG-ID: b2Vz-xdMOUmMyOm4Yk4Dqg_1748321304
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5c9abdbd3so239599285a.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 21:48:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748321304; x=1748926104;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A6cZd93utSPw7y6Io+o7Gmqp/MzMi/Cf13vsDw9hfwk=;
        b=oLQBC9MN/vW9mRcqc/PE6728E+c4Uiuk1T0YVKfaAVs9q+fBvgB24eR0ATtzAr2NPM
         cCuNP08ysRNWt8jbWIGc7SglQ2JC8kWMVJ+i/LM98gE6G548hI5jhKRBmTbBaIre1inY
         S1cg2TCD5AU8ZevJxLdOTjSZCD9AmY66FYLmOSy7qOmbCc8pkeZRKkS52F8IZ4jdsycI
         6X2xysiM2ftdGeRXR15p1fYKYa9PB/LiIYX+CJayGHXdcTBtZA0ntMM+ZXwPjLTh6ppp
         wmjhqtEKAHDVfdqIhew3aECi2CAt2bYsiXJcUQmh5UsnpjKb9LbZ5D4VEoQwP/r6OUA2
         FeHw==
X-Forwarded-Encrypted: i=1; AJvYcCUxixl9BvWUl3bp3vAfXqTbcMFwpA6bamWAGK4cd4FIB9a2JpUZ/WGSbSRd7VwA8SRNJcuwY2xuo6jsE4M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCy8aIb6j36kVEPhP9cBmjjadu+VIAIohCadDh75Sd9+sGrmNm
	6VPT87sA2HffHC6B/OMLVE/IhSqXYy64wmrSP/RPP+MmbQj5mblx8zchcvJUJdmmaukhYqW8uue
	OSaeWLLnbPkDqPRqZPfOxFnY71VXx0eGImOIS1lSljBXrewDz3sB69UjE4H+Ey1gRrw==
X-Gm-Gg: ASbGncvLDffbKofmesqlf98Z+OQ+0DbGct9e+SD0bs7YU2bcVM/eQos3hb/01cD+3ad
	s3JZ0dpags14CEGS/y9xF1YJJ8uE/Joh58NdXuO+hhIabrTwHnoQbJS5ZmrEl4uBS9ZuTcgBEtz
	s5HTQaKczjPyPCxBoUs4Djz9tNxQzP4ZAMNElk3orUn84zeUEvmzmOnue66wp4JCMFfS0KGt70H
	2SHVTcwbF52v/5iUuWFmPNntnU+oFRJMzFvJP5YACPQZji8rsGgyPvrb89JHHj/EEEOD7La3hmD
	sFmS8B+qH6mo
X-Received: by 2002:a05:620a:17ab:b0:7cd:53d7:4f8e with SMTP id af79cd13be357-7ceecb6dc81mr1915163685a.8.1748321303727;
        Mon, 26 May 2025 21:48:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFS/x2Q0MTqlG2b5PJLKQ/woDGyHg5628j5LA3iNcqz82zMxNksQqonuFwsWh2grOOwUdXHSg==
X-Received: by 2002:a05:620a:17ab:b0:7cd:53d7:4f8e with SMTP id af79cd13be357-7ceecb6dc81mr1915161785a.8.1748321303252;
        Mon, 26 May 2025 21:48:23 -0700 (PDT)
Received: from [172.20.4.10] ([50.234.147.137])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd467bc7d1sm1690758885a.1.2025.05.26.21.48.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 21:48:22 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <c0fb67e3-ebe0-45ec-9f61-a8cd5949cc42@redhat.com>
Date: Tue, 27 May 2025 00:48:21 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [WARN] LOCKDEP: MAX_LOCKDEP_CHAIN_HLOCKS too low
To: Lance Yang <ioworker0@gmail.com>, peterz@infradead.org
Cc: mingo@redhat.com, will@kernel.org, boqun.feng@gmail.com,
 linux-kernel@vger.kernel.org
References: <20250527020252.43684-1-lance.yang@linux.dev>
Content-Language: en-US
In-Reply-To: <20250527020252.43684-1-lance.yang@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/26/25 10:02 PM, Lance Yang wrote:
> From: Lance Yang <lance.yang@linux.dev>
>
> Hi all,
>
> With CONFIG_LOCKDEP on, I got this warning during kernel builds:
>
> [Tue May 27 00:22:59 2025] BUG: MAX_LOCKDEP_CHAIN_HLOCKS too low!
> [Tue May 27 00:22:59 2025] turning off the locking correctness validator.
> [Tue May 27 00:22:59 2025] CPU: 56 UID: 0 PID: 3362352 Comm: cc1 Kdump: loaded Tainted: G S                  6.15.0-rc6 #5 PREEMPT(voluntary)
> [Tue May 27 00:22:59 2025] Tainted: [S]=CPU_OUT_OF_SPEC
> [Tue May 27 00:22:59 2025] Hardware name: New H3C Technologies Co., Ltd. H3C UniServer R4900 G5/RS35M2C16SB, BIOS 5.69 10/18/2023
> [Tue May 27 00:22:59 2025] Call Trace:
> [Tue May 27 00:22:59 2025]  <TASK>
> [Tue May 27 00:22:59 2025]  show_stack+0x4d/0x60
> [Tue May 27 00:22:59 2025]  dump_stack_lvl+0x72/0xa0
> [Tue May 27 00:22:59 2025]  dump_stack+0x14/0x1a
> [Tue May 27 00:22:59 2025]  add_chain_cache+0x304/0x330
> [Tue May 27 00:22:59 2025]  __lock_acquire+0x7d3/0xfd0
> [Tue May 27 00:22:59 2025]  lock_acquire.part.0+0xb4/0x210
> [Tue May 27 00:22:59 2025]  ? bad_range+0xa6/0x320
> [Tue May 27 00:22:59 2025]  ? mark_usage+0x68/0x130
> [Tue May 27 00:22:59 2025]  lock_acquire+0x62/0x120
> [Tue May 27 00:22:59 2025]  ? bad_range+0xa6/0x320
> [Tue May 27 00:22:59 2025]  seqcount_lockdep_reader_access+0x3d/0xa0
> [Tue May 27 00:22:59 2025]  ? bad_range+0xa6/0x320
> [Tue May 27 00:22:59 2025]  bad_range+0xa6/0x320
> [Tue May 27 00:22:59 2025]  ? __kasan_check_write+0x18/0x20
> [Tue May 27 00:22:59 2025]  expand+0x91/0x3c0
> [Tue May 27 00:22:59 2025]  ? __del_page_from_free_list+0x82/0x4b0
> [Tue May 27 00:22:59 2025]  rmqueue_bulk+0x13a/0xc00
> [Tue May 27 00:22:59 2025]  ? lock_acquire.part.0+0xb4/0x210
> [Tue May 27 00:22:59 2025]  __rmqueue_pcplist+0x4a7/0x8f0
> [Tue May 27 00:22:59 2025]  rmqueue_pcplist+0xcc/0x2a0
> [Tue May 27 00:22:59 2025]  rmqueue.isra.0+0xd26/0x1470
> [Tue May 27 00:22:59 2025]  ? stack_trace_save+0x96/0xd0
> [Tue May 27 00:22:59 2025]  ? __pfx_stack_trace_save+0x10/0x10
> [Tue May 27 00:22:59 2025]  ? stack_depot_save_flags+0x41/0x6a0
> [Tue May 27 00:22:59 2025]  ? lock_acquire.part.0+0xb4/0x210
> [Tue May 27 00:22:59 2025]  get_page_from_freelist+0x262/0x11a0
> [Tue May 27 00:22:59 2025]  ? kasan_save_stack+0x3e/0x50
> [Tue May 27 00:22:59 2025]  ? kasan_save_stack+0x2f/0x50
> [Tue May 27 00:22:59 2025]  ? __call_rcu_common.constprop.0+0xc4/0x950
> [Tue May 27 00:22:59 2025]  ? commit_merge+0x634/0x1100
> [Tue May 27 00:22:59 2025]  __alloc_frozen_pages_noprof+0x30e/0x6c0
> [Tue May 27 00:22:59 2025]  ? __pfx___alloc_frozen_pages_noprof+0x10/0x10
> [Tue May 27 00:22:59 2025]  ? __lock_acquire+0x3dc/0xfd0
> [Tue May 27 00:22:59 2025]  ? mark_usage+0x68/0x130
> [Tue May 27 00:22:59 2025]  ? policy_nodemask+0x21d/0x350
> [Tue May 27 00:22:59 2025]  alloc_pages_mpol+0x163/0x460
> [Tue May 27 00:22:59 2025]  ? __pfx_alloc_pages_mpol+0x10/0x10
> [Tue May 27 00:22:59 2025]  ? ___slab_alloc+0xe3/0x10f0
> [Tue May 27 00:22:59 2025]  ? find_held_lock+0x31/0x90
> [Tue May 27 00:22:59 2025]  alloc_frozen_pages_noprof+0x4b/0x130
> [Tue May 27 00:22:59 2025]  allocate_slab+0x23a/0x380
> [Tue May 27 00:22:59 2025]  ___slab_alloc+0x985/0x10f0
> [Tue May 27 00:22:59 2025]  ? find_held_lock+0x31/0x90
> [Tue May 27 00:22:59 2025]  ? xfs_buf_item_init+0x7b/0x660 [xfs]
> [Tue May 27 00:22:59 2025]  ? xfs_buf_item_init+0x7b/0x660 [xfs]
> [Tue May 27 00:22:59 2025]  ? lock_release.part.0+0x20/0x60
> [Tue May 27 00:22:59 2025]  ? fs_reclaim_acquire+0x83/0x120
> [Tue May 27 00:22:59 2025]  ? xfs_buf_item_init+0x7b/0x660 [xfs]
> [Tue May 27 00:22:59 2025]  kmem_cache_alloc_noprof+0x1ed/0x430
> [Tue May 27 00:22:59 2025]  ? kmem_cache_alloc_noprof+0x1ed/0x430
> [Tue May 27 00:22:59 2025]  xfs_buf_item_init+0x7b/0x660 [xfs]
> [Tue May 27 00:22:59 2025]  ? xfs_imap_to_bp+0x10b/0x2b0 [xfs]
> [Tue May 27 00:22:59 2025]  ? __pfx_xfs_buf_read_map+0x10/0x10 [xfs]
> [Tue May 27 00:22:59 2025]  ? xfs_file_buffered_write+0x14c/0xa50 [xfs]
> [Tue May 27 00:22:59 2025]  _xfs_trans_bjoin+0x45/0x130 [xfs]
> [Tue May 27 00:22:59 2025]  xfs_trans_read_buf_map+0x38c/0x840 [xfs]
> [Tue May 27 00:22:59 2025]  ? __pfx_xfs_trans_read_buf_map+0x10/0x10 [xfs]
> [Tue May 27 00:22:59 2025]  ? lock_acquire.part.0+0xb4/0x210
> [Tue May 27 00:22:59 2025]  xfs_imap_to_bp+0x10b/0x2b0 [xfs]
> [Tue May 27 00:22:59 2025]  ? __pfx_xfs_imap_to_bp+0x10/0x10 [xfs]
> [Tue May 27 00:22:59 2025]  ? __kasan_check_read+0x15/0x20
> [Tue May 27 00:22:59 2025]  ? do_raw_spin_unlock+0x5d/0x1f0
> [Tue May 27 00:22:59 2025]  xfs_inode_item_precommit+0x538/0xc10 [xfs]
> [Tue May 27 00:22:59 2025]  ? __pfx_xfs_inode_item_precommit+0x10/0x10 [xfs]
> [Tue May 27 00:22:59 2025]  __xfs_trans_commit+0x2a3/0xba0 [xfs]
> [Tue May 27 00:22:59 2025]  ? __pfx___xfs_trans_commit+0x10/0x10 [xfs]
> [Tue May 27 00:22:59 2025]  ? ktime_get_coarse_real_ts64_mg+0x61/0x1d0
> [Tue May 27 00:22:59 2025]  ? __kasan_check_read+0x15/0x20
> [Tue May 27 00:22:59 2025]  xfs_trans_commit+0xce/0x150 [xfs]
> [Tue May 27 00:22:59 2025]  ? xfs_trans_ijoin+0xcf/0x170 [xfs]
> [Tue May 27 00:22:59 2025]  ? __pfx_xfs_trans_commit+0x10/0x10 [xfs]
> [Tue May 27 00:22:59 2025]  xfs_vn_update_time+0x1fc/0x440 [xfs]
> [Tue May 27 00:22:59 2025]  ? __pfx_xfs_vn_update_time+0x10/0x10 [xfs]
> [Tue May 27 00:22:59 2025]  ? __kasan_check_read+0x15/0x20
> [Tue May 27 00:22:59 2025]  kiocb_modified+0x1a6/0x240
> [Tue May 27 00:22:59 2025]  xfs_file_write_checks.constprop.0+0x451/0x860 [xfs]
> [Tue May 27 00:22:59 2025]  xfs_file_buffered_write+0x14c/0xa50 [xfs]
> [Tue May 27 00:22:59 2025]  ? __pfx_xfs_file_buffered_write+0x10/0x10 [xfs]
> [Tue May 27 00:22:59 2025]  ? ovl_other_xattr_get+0xee/0x160 [overlay]
> [Tue May 27 00:22:59 2025]  ? find_held_lock+0x31/0x90
> [Tue May 27 00:22:59 2025]  ? __pfx_ovl_other_xattr_get+0x10/0x10 [overlay]
> [Tue May 27 00:22:59 2025]  ? mark_usage+0x68/0x130
> [Tue May 27 00:22:59 2025]  xfs_file_write_iter+0x553/0x830 [xfs]
> [Tue May 27 00:22:59 2025]  do_iter_readv_writev+0x422/0x910
> [Tue May 27 00:22:59 2025]  ? lock_acquire.part.0+0xb4/0x210
> [Tue May 27 00:22:59 2025]  ? backing_file_write_iter.part.0+0x4ee/0x7e0
> [Tue May 27 00:22:59 2025]  ? __pfx_do_iter_readv_writev+0x10/0x10
> [Tue May 27 00:22:59 2025]  ? selinux_file_permission+0x389/0x470
> [Tue May 27 00:22:59 2025]  ? lock_is_held_type+0xa8/0x120
> [Tue May 27 00:22:59 2025]  vfs_iter_write+0x17b/0x7a0
> [Tue May 27 00:22:59 2025]  backing_file_write_iter.part.0+0x4ee/0x7e0
> [Tue May 27 00:22:59 2025]  ? ovl_real_file+0x16a/0x1b0 [overlay]
> [Tue May 27 00:22:59 2025]  backing_file_write_iter+0xc8/0x110
> [Tue May 27 00:22:59 2025]  ovl_write_iter+0x2cc/0x450 [overlay]
> [Tue May 27 00:22:59 2025]  ? __pfx_ovl_write_iter+0x10/0x10 [overlay]
> [Tue May 27 00:22:59 2025]  ? __pfx_ovl_file_end_write+0x10/0x10 [overlay]
> [Tue May 27 00:22:59 2025]  ? lock_is_held_type+0xa8/0x120
> [Tue May 27 00:22:59 2025]  vfs_write+0x5c1/0x1050
> [Tue May 27 00:22:59 2025]  ? __pfx_vfs_write+0x10/0x10
> [Tue May 27 00:22:59 2025]  ? ktime_get_coarse_real_ts64+0x44/0xd0
> [Tue May 27 00:22:59 2025]  ? lockdep_hardirqs_on_prepare.part.0+0xa3/0x140
> [Tue May 27 00:22:59 2025]  ksys_write+0x109/0x200
> [Tue May 27 00:22:59 2025]  ? __lock_release.isra.0+0x60/0x160
> [Tue May 27 00:22:59 2025]  ? __pfx_ksys_write+0x10/0x10
> [Tue May 27 00:22:59 2025]  ? __audit_syscall_entry+0x2ef/0x540
> [Tue May 27 00:22:59 2025]  ? irqentry_exit_to_user_mode+0x7d/0x290
> [Tue May 27 00:22:59 2025]  ? irqentry_exit+0x6f/0xa0
> [Tue May 27 00:22:59 2025]  __x64_sys_write+0x76/0xb0
> [Tue May 27 00:22:59 2025]  x64_sys_call+0x28a/0x1d70
> [Tue May 27 00:22:59 2025]  do_syscall_64+0x77/0x180
> [Tue May 27 00:22:59 2025]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [Tue May 27 00:22:59 2025] RIP: 0033:0x7f56cbac9687
> [Tue May 27 00:22:59 2025] Code: 48 89 fa 4c 89 df e8 58 b3 00 00 8b 93 08 03 00 00 59 5e 48 83 f8 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44 24 10 0f 05 <5b> c3 0f 1f 80 00 00 00 00 83 e2 39 83 fa 08 75 de e8 23 ff ff ff
> [Tue May 27 00:22:59 2025] RSP: 002b:00007ffe65c16880 EFLAGS: 00000202 ORIG_RAX: 0000000000000001
> [Tue May 27 00:22:59 2025] RAX: ffffffffffffffda RBX: 00007f56cba39440 RCX: 00007f56cbac9687
> [Tue May 27 00:22:59 2025] RDX: 0000000000001000 RSI: 0000000004735f60 RDI: 0000000000000003
> [Tue May 27 00:22:59 2025] RBP: 0000000004735f60 R08: 0000000000000000 R09: 0000000000000000
> [Tue May 27 00:22:59 2025] R10: 0000000000000000 R11: 0000000000000202 R12: 0000000000001000
> [Tue May 27 00:22:59 2025] R13: 00000000046ecad0 R14: 00007f56cbc1fe80 R15: 0000000000000028
> [Tue May 27 00:22:59 2025]  </TASK>
>
> $ cat .config|grep CONFIG_LOCKDEP
> CONFIG_LOCKDEP_SUPPORT=y
> CONFIG_LOCKDEP=y
> CONFIG_LOCKDEP_BITS=15
> CONFIG_LOCKDEP_CHAINS_BITS=16
> CONFIG_LOCKDEP_STACK_TRACE_BITS=19
> CONFIG_LOCKDEP_STACK_TRACE_HASH_BITS=14
> CONFIG_LOCKDEP_CIRCULAR_QUEUE_BITS=12
>
> Is it safe? Or could this be a real locking issue?

The lock chains store the locking order of nested locks. The default 
value of 16 may be too low now as the kernel is becoming more complex in 
term of possible nested locking orders. Anyway, I would suggest upping 
the CONFIG_LOCKDEP_CHAIN_BITS to 17 or even 18 to prevent this kind of 
problem. In fact, the latest RHEL debug kernel sets 
CONFIG_LOCKDEP_CHAINS_BITS to 18.

Cheers,
Longman

