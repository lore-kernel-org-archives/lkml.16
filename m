Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D06186A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 03:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749612794; cv=none; b=s/xB5A/xbmWBNjO7FmirH1WxtJkDVNeyDKKuf7HyyAjtLxrrZE5cJopP9paQ9F83Aj4pMNYcGC5FppBBXp9KGvjxTZ8TGICcw1MXFoDY3CD/cd0cHjsKNj3f2/VyogAmLXDNp/ud+0WAEFOuTdK+ufdikQIrMNaaO235KK9iYAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749612794; c=relaxed/simple;
	bh=NQHQJvOSYCt8Cpz1y9moJUqKuT4AgQFA9yUAGnMNGxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VzWRZyvhQBcgd7jMIdM4Uq6SEokOymSAqceWp4UcjvQEoNbWvUfDjm0e+m30MQILt7gY+pQfuXnxxPQEbO35yDH3uoZA9eliLuQoKWxYJC0//zpVjSuW/Tx2XxZQoJLt7syOdvIbbZgoa5OAZ5x6eQox9+oxtGa9f9p8l8H3zY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZJBu8pbD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZJBu8pbD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749612791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LjhWuRqG4Vf2vK8i68w6rrFsWSfkC5uO+M7mBT5HrjI=;
	b=ZJBu8pbDVMV9SrF/ff+cioKbV4mdY2TZCfS0tD2NNS7O9nD3NtlFdWBwIJii8bx+24oxQa
	gtr8ZGBn4XkWkhjthztgsExe570pTZed5RWfSdFA5Ozl58tDZ7BMnLa06thB1Coyjf7yEM
	IEeGFn47ekf7FbaVBQsZ4JWuc+9PUlU=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-76-5U5kZEH1Ms6i82wFkQNpDg-1; Tue,
 10 Jun 2025 23:33:09 -0400
X-MC-Unique: 5U5kZEH1Ms6i82wFkQNpDg-1
X-Mimecast-MFC-AGG-ID: 5U5kZEH1Ms6i82wFkQNpDg_1749612787
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D4FBE195608A;
	Wed, 11 Jun 2025 03:33:06 +0000 (UTC)
Received: from localhost (unknown [10.72.112.181])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4499219560A3;
	Wed, 11 Jun 2025 03:33:04 +0000 (UTC)
Date: Wed, 11 Jun 2025 11:33:00 +0800
From: Baoquan He <bhe@redhat.com>
To: Kairui Song <kasong@tencent.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
	Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Chris Li <chrisl@kernel.org>, Nhat Pham <nphamcs@gmail.com>,
	Barry Song <baohua@kernel.org>, Usama Arif <usamaarif642@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mm/shmem, swap: fix softlockup with mTHP swapin
Message-ID: <aEj47L/qO+llWcvH@MiWiFi-R3L-srv>
References: <20250610181645.45922-1-ryncsn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250610181645.45922-1-ryncsn@gmail.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

On 06/11/25 at 02:16am, Kairui Song wrote:
> From: Kairui Song <kasong@tencent.com>
> 
> Following softlockup can be easily reproduced on my test machine with:
> 
> echo always > /sys/kernel/mm/transparent_hugepage/hugepages-64kB/enabled
> swapon /dev/zram0 # zram0 is a 48G swap device
> mkdir -p /sys/fs/cgroup/memory/test
> echo 1G > /sys/fs/cgroup/test/memory.max
> echo $BASHPID > /sys/fs/cgroup/test/cgroup.procs
> while true; do
>     dd if=/dev/zero of=/tmp/test.img bs=1M count=5120
>     cat /tmp/test.img > /dev/null
>     rm /tmp/test.img
> done
> 
> Then after a while:
> watchdog: BUG: soft lockup - CPU#0 stuck for 763s! [cat:5787]
> Modules linked in: zram virtiofs
> CPU: 0 UID: 0 PID: 5787 Comm: cat Kdump: loaded Tainted: G             L      6.15.0.orig-gf3021d9246bc-dirty #118 PREEMPT(voluntary)·
> Tainted: [L]=SOFTLOCKUP
> Hardware name: Red Hat KVM/RHEL-AV, BIOS 0.0.0 02/06/2015
> RIP: 0010:mpol_shared_policy_lookup+0xd/0x70
> Code: e9 b8 b4 ff ff 31 c0 c3 cc cc cc cc 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 66 0f 1f 00 0f 1f 44 00 00 41 54 55 53 <48> 8b 1f 48 85 db 74 41 4c 8d 67 08 48 89 fb 48 89 f5 4c 89 e7 e8
> RSP: 0018:ffffc90002b1fc28 EFLAGS: 00000202
> RAX: 00000000001c20ca RBX: 0000000000724e1e RCX: 0000000000000001
> RDX: ffff888118e214c8 RSI: 0000000000057d42 RDI: ffff888118e21518
> RBP: 000000000002bec8 R08: 0000000000000001 R09: 0000000000000000
> R10: 0000000000000bf4 R11: 0000000000000000 R12: 0000000000000001
> R13: 00000000001c20ca R14: 00000000001c20ca R15: 0000000000000000
> FS:  00007f03f995c740(0000) GS:ffff88a07ad9a000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007f03f98f1000 CR3: 0000000144626004 CR4: 0000000000770eb0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> PKRU: 55555554
> Call Trace:
>  <TASK>
>  shmem_alloc_folio+0x31/0xc0
>  shmem_swapin_folio+0x309/0xcf0
>  ? filemap_get_entry+0x117/0x1e0
>  ? xas_load+0xd/0xb0
>  ? filemap_get_entry+0x101/0x1e0
>  shmem_get_folio_gfp+0x2ed/0x5b0
>  shmem_file_read_iter+0x7f/0x2e0
>  vfs_read+0x252/0x330
>  ksys_read+0x68/0xf0
>  do_syscall_64+0x4c/0x1c0
>  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> RIP: 0033:0x7f03f9a46991
> Code: 00 48 8b 15 81 14 10 00 f7 d8 64 89 02 b8 ff ff ff ff eb bd e8 20 ad 01 00 f3 0f 1e fa 80 3d 35 97 10 00 00 74 13 31 c0 0f 05 <48> 3d 00 f0 ff ff 77 4f c3 66 0f 1f 44 00 00 55 48 89 e5 48 83 ec
> RSP: 002b:00007fff3c52bd28 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
> RAX: ffffffffffffffda RBX: 0000000000040000 RCX: 00007f03f9a46991
> RDX: 0000000000040000 RSI: 00007f03f98ba000 RDI: 0000000000000003
> RBP: 00007fff3c52bd50 R08: 0000000000000000 R09: 00007f03f9b9a380
> R10: 0000000000000022 R11: 0000000000000246 R12: 0000000000040000
> R13: 00007f03f98ba000 R14: 0000000000000003 R15: 0000000000000000
>  </TASK>
> 
> The reason is simple, readahead brought some order 0 folio in swap cache,
> and the swapin mTHP folio being allocated is in confict with it, so
                                                  ^^^typo, conflict

> swapcache_prepare fails and causes shmem_swap_alloc_folio to return
> -EEXIST, and shmem simply retries again and again causing this loop.
> 
> Fix it by applying a similar fix for anon mTHP swapin.
> 
......snip...

