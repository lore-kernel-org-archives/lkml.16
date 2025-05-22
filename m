Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B975288C1B
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.167.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747940812; cv=none; b=AcmwRC9/DljsJ1m8ggWpaHBwhrB2T9/8/+9M63YQvEgkByv64Lq1rObBP5inHyy7mCdYC2rkoHgfa6CijyUgqBAowP1fdsCy4G7SZFOnBfC/PKQPTdZWRxyTJqKCr3JH7u/XPzVfplKEjVsTah1/6hgVtkMAF4U10dOuYmT3UDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747940812; c=relaxed/simple;
	bh=bBhYpBnnlJ48DquQjyTd36KeKeZQQqR3HpYL5/M82Ew=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=f9qcZVwlxlLu5Ygi26otRzm81iNFMBbphzKh2ieGD5wvrQFwzW1r1I7Zr9JCiK7ycl9bREHsgApvfs3jQNZ3MHJCbDTOoumjs+VmaTJ62viGpSBRdEwApr8N3beajh2e/q5eLU2YyvNNIG+hDPsb9B6SuvGUI1MwyFbBwxLNVY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; arc=none smtp.client-ip=116.203.167.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 58C6C298562;
	Thu, 22 May 2025 20:58:53 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id UZefIIiQruAo; Thu, 22 May 2025 20:58:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 6F172298565;
	Thu, 22 May 2025 20:58:52 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id tlJbsa5qzCRX; Thu, 22 May 2025 20:58:52 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 4049F298562;
	Thu, 22 May 2025 20:58:52 +0200 (CEST)
Date: Thu, 22 May 2025 20:58:52 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Ilya Shchipletsov <rabbelkin@mail.ru>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, 
	David Woodhouse <dwmw2@infradead.org>, 
	chengzhihao1 <chengzhihao1@huawei.com>, 
	Nikita Marushkin <hfggklm@gmail.com>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	lvc-project <lvc-project@linuxtesting.org>
Message-ID: <1348351513.83509530.1747940332116.JavaMail.zimbra@nod.at>
In-Reply-To: <20250404080018.2472-3-rabbelkin@mail.ru>
References: <20250404080018.2472-3-rabbelkin@mail.ru>
Subject: Re: [PATCH] jffs2: silence lockdep warning on evict path
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF138 (Linux)/8.8.12_GA_3809)
Thread-Topic: jffs2: silence lockdep warning on evict path
Thread-Index: 5mFHifbun1qI6cUBHTj3Qjf8FXuhog==

----- Urspr=C3=BCngliche Mail -----
> Von: "Ilya Shchipletsov" <rabbelkin@mail.ru>
> An: "linux-mtd" <linux-mtd@lists.infradead.org>
> CC: "Ilya Shchipletsov" <rabbelkin@mail.ru>, "David Woodhouse" <dwmw2@inf=
radead.org>, "richard" <richard@nod.at>,
> "chengzhihao1" <chengzhihao1@huawei.com>, "Nikita Marushkin" <hfggklm@gma=
il.com>, "linux-kernel"
> <linux-kernel@vger.kernel.org>, "lvc-project" <lvc-project@linuxtesting.o=
rg>
> Gesendet: Freitag, 4. April 2025 10:00:18
> Betreff: [PATCH] jffs2: silence lockdep warning on evict path

> Syzkaller detected a possible deadlock in jffs2_do_clear_inode that happe=
ns
> in kswapd's evict path. This is however a false positive because in
> jffs2_evict_inode we are the only holder of inode and nobody else should =
be
> touching any locks of such inode.
>=20
> WARNING: possible circular locking dependency detected
> 6.1.128-syzkaller-00157-gf31f96bd278e #0 Not tainted
> ------------------------------------------------------
> kswapd0/72 is trying to acquire lock:
> ffff8880945d6998 (&f->sem){+.+.}-{3:3}, at: jffs2_do_clear_inode+0x56/0x5=
70
> fs/jffs2/readinode.c:1419
>=20
> but task is already holding lock:
> ffffffff8a68b100 (fs_reclaim){+.+.}-{0:0}, at: balance_pgdat+0xa15/0x1510
> mm/vmscan.c:7173
>=20
> which lock already depends on the new lock.
>=20
>=20
> the existing dependency chain (in reverse order) is:
>=20
> -> #1 (fs_reclaim){+.+.}-{0:0}:
>       __fs_reclaim_acquire mm/page_alloc.c:4719 [inline]
>       fs_reclaim_acquire+0x100/0x150 mm/page_alloc.c:4733
>       might_alloc include/linux/sched/mm.h:271 [inline]
>       slab_pre_alloc_hook mm/slab.h:710 [inline]
>       slab_alloc_node mm/slub.c:3318 [inline]
>       slab_alloc mm/slub.c:3406 [inline]
>       __kmem_cache_alloc_lru mm/slub.c:3413 [inline]
>       kmem_cache_alloc+0x43/0x360 mm/slub.c:3422
>       jffs2_do_read_inode+0x300/0x510 fs/jffs2/readinode.c:1372
>       jffs2_iget+0x1bb/0xcb0 fs/jffs2/fs.c:276
>       jffs2_do_fill_super+0x449/0xa60 fs/jffs2/fs.c:575
>       jffs2_fill_super+0x27e/0x370 fs/jffs2/super.c:290
>       mtd_get_sb+0x16f/0x220 drivers/mtd/mtdsuper.c:80
>       mtd_get_sb_by_nr drivers/mtd/mtdsuper.c:111 [inline]
>       get_tree_mtd+0x5ff/0x750 drivers/mtd/mtdsuper.c:164
>       vfs_get_tree+0x8e/0x300 fs/super.c:1573
>       do_new_mount fs/namespace.c:3056 [inline]
>       path_mount+0x6a6/0x1e90 fs/namespace.c:3386
>       do_mount fs/namespace.c:3399 [inline]
>       __do_sys_mount fs/namespace.c:3607 [inline]
>       __se_sys_mount fs/namespace.c:3584 [inline]
>       __x64_sys_mount+0x283/0x300 fs/namespace.c:3584
>       do_syscall_x64 arch/x86/entry/common.c:51 [inline]
>       do_syscall_64+0x35/0x80 arch/x86/entry/common.c:81
>       entry_SYSCALL_64_after_hwframe+0x6e/0xd8
>=20
> -> #0 (&f->sem){+.+.}-{3:3}:
>       check_prev_add kernel/locking/lockdep.c:3090 [inline]
>       check_prevs_add kernel/locking/lockdep.c:3209 [inline]
>       validate_chain kernel/locking/lockdep.c:3825 [inline]
>       __lock_acquire+0x2a29/0x5320 kernel/locking/lockdep.c:5049
>       lock_acquire kernel/locking/lockdep.c:5662 [inline]
>       lock_acquire+0x194/0x4b0 kernel/locking/lockdep.c:5627
>       __mutex_lock_common kernel/locking/mutex.c:603 [inline]
>       __mutex_lock+0x14c/0x19f0 kernel/locking/mutex.c:747
>       jffs2_do_clear_inode+0x56/0x570 fs/jffs2/readinode.c:1419
>       evict+0x32c/0x810 fs/inode.c:705
>       dispose_list+0xd7/0x1a0 fs/inode.c:738
>       prune_icache_sb+0xe7/0x150 fs/inode.c:941
>       super_cache_scan+0x38a/0x590 fs/super.c:106
>       do_shrink_slab+0x412/0xa00 mm/vmscan.c:853
>       shrink_slab+0x178/0x670 mm/vmscan.c:1013
>       shrink_node_memcgs mm/vmscan.c:6147 [inline]
>       shrink_node+0x957/0x1fb0 mm/vmscan.c:6176
>       kswapd_shrink_node mm/vmscan.c:6968 [inline]
>       balance_pgdat+0x8ed/0x1510 mm/vmscan.c:7158
>       kswapd+0x5d4/0xb80 mm/vmscan.c:7418
>       kthread+0x2e1/0x3a0 kernel/kthread.c:376
>       ret_from_fork+0x22/0x30 arch/x86/entry/entry_64.S:295
>=20
> other info that might help us debug this:
>=20
> Possible unsafe locking scenario:
>=20
>       CPU0                    CPU1
>       ----                    ----
>  lock(fs_reclaim);
>                               lock(&f->sem);
>                               lock(fs_reclaim);
>  lock(&f->sem);
>=20
> *** DEADLOCK ***
>=20
> Fix this false positive by using mutex_trylock instead of mutex_lock to
> avoid creating a false locking dependency.
>=20
> jffs2_do_crccheck_inode also calls this function, with local mutex,
> which should be safe, but to be extremely sure and to make code more
> future-proof WARN_ON_ONCE was used.
>=20
> Found by Linux Verification Center (linuxtesting.org) with Syzkaller.
>=20
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Co-developed-by: Nikita Marushkin <hfggklm@gmail.com>
> Signed-off-by: Nikita Marushkin <hfggklm@gmail.com>
> Signed-off-by: Ilya Shchipletsov <rabbelkin@mail.ru>
> ---
> fs/jffs2/readinode.c | 12 +++++++++++-
> 1 file changed, 11 insertions(+), 1 deletion(-)
>=20
> diff --git a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
> index 03b4f99614be..3d2b2e5fc2c5 100644
> --- a/fs/jffs2/readinode.c
> +++ b/fs/jffs2/readinode.c
> @@ -1416,7 +1416,17 @@ void jffs2_do_clear_inode(struct jffs2_sb_info *c,=
 struct
> jffs2_inode_info *f)
> =09int deleted;
>=20
> =09jffs2_xattr_delete_inode(c, f->inocache);
> -=09mutex_lock(&f->sem);
> +
> +=09/*
> +=09 * We should be the only ones having a reference to this struct
> +=09 * jffs2_inode_info. So the locking is actually unnecessary. Besides,
> +=09 * lockdep triggers a false-positive warning on &f->sem here about
> +=09 * reclaim circular dependency. Play it safe and bump a warning if
> +=09 * this doesn't hold true.
> +=09 */
> +=09if (WARN_ON_ONCE(!mutex_trylock(&f->sem)))
> +=09=09return;
> +

Hmm, I thought we have lockdep classes or other annotations to fix such iss=
ues?
Adding a mutex_trylock/return here feels odd.

Thanks,
//richard
