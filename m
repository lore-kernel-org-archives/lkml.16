Received: from fallback3.i.mail.ru (fallback3.i.mail.ru [79.137.243.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFD214B06C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 08:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743753691; cv=none; b=non22J4PF4uNT2bg64EjXlTHWOEpV2W3z34j9ahUJCP4ew59ljRsjz9uBNxrcFYHAXzcUCzM1gOTZHiARgvdykCZFSLHtUvhHZUyRImHyj7kjpqOtoBGyWHnT4+nHYibnyvqvg9SYTHAHAYnmEj3THs6P/E2hzkSXl2kWrffJa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743753691; c=relaxed/simple;
	bh=O/AB8GdDMNfijTa89CzHe/5fC/ZXCDPaSKc3Yco5+4w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DW4WO72qOdoDX3ke6uZGkcMbP2f4Ja7Qi5xZgbT8lLux/aMMuLP3kc8Tk/jZ8c8yx+rSzie20ndF5ZC5DrwwMjO7tLCKpl8pIyx0shQnXtQH/mY1hgB3+jKlVGoTzjRJ9bKmGqiNPR53NbJLWRn4Jm35Hd9M2Y13b5cdtB+fbsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mail.ru; spf=pass smtp.mailfrom=mail.ru; dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b=xGEnBR+f; dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b=tCPlCvm4; dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b=oEt8DAQK; arc=none smtp.client-ip=79.137.243.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mail.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b="xGEnBR+f";
	dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b="tCPlCvm4";
	dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b="oEt8DAQK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru; s=mail4;
	h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=JLfcT4B5byL9Mg1z7cT5O0wpUEYkgKd84ZUGPYd1e7s=;
	t=1743753687;x=1743843687; 
	b=xGEnBR+fIvuMOG4S2KPJVNULT6Q+XqUPvivafLznipVXKUcTmhcxKvZJCx5PSEYmE8gd2kPGJ4rcRR8eYvktES0K+VAd3ZxqgaPAv7N4i5GAqJwSVE9BbeqBwE4BuorMTtE/8YANWuTviJe/PWGB478JMD8zCXJNEXgE8CeCK0S/56ewO1J6Dx4ReKXIcNXgc9mAceezK35XEgiXYY05cz04/+0RExa01vWSKoaUGhdJfDpWx1NSyKbj5wrcB0BaQIHJjuEQTonnL8PWBhPayChe+/gCMf0qhmgWmlcg1CchYcGhmAhoo7TDGgXgmUU3yO+8FVyCw2qukebTFvBWZw==;
Received: from [10.113.193.64] (port=45936 helo=send101.i.mail.ru)
	by fallback3.i.mail.ru with esmtp (envelope-from <rabbelkin@mail.ru>)
	id 1u0bzL-001JVr-Pf
	for linux-kernel@vger.kernel.org; Fri, 04 Apr 2025 11:01:19 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
	s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive:X-Cloud-Ids;
	bh=JLfcT4B5byL9Mg1z7cT5O0wpUEYkgKd84ZUGPYd1e7s=; t=1743753679; x=1743843679; 
	b=tCPlCvm4dzxyJwW/6c4DG4+Bt3jybOSC/Xaw9UoPogWEbDgkc5BmQxdSnQeSrfjFx57KTD5deSm
	hK22wkEyaATaXNM3Q+W6lHNuaoDxurPJksRN1mQpxlMKrvw7aEE3FNaSzNTdS+71gOqzBCr3QFDKz
	6GE5OCHEBofprpWjCLI7n5oiJ92b9iv6DPZu+zAKcXfKbwzKf/fppvvw5NninI+F0/gkM1X8p774r
	CbBzNN4bCFYvb7Chf9nIN1Kabg91EPe0O57AR5qvxtQOT9t3Qt2ui1KjJJcmrJIVNSSMloEcLITUN
	8euCOmCgqTXzyYMXtdCPmYjYcTDvoUTxTPKw==;
Received: from [10.113.119.154] (port=55956 helo=send265.i.mail.ru)
	by exim-fallback-7687f6b856-6np22 with esmtp (envelope-from <rabbelkin@mail.ru>)
	id 1u0bzD-00000000MGt-3ZoX
	for linux-kernel@vger.kernel.org; Fri, 04 Apr 2025 11:01:12 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
	s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
	To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=JLfcT4B5byL9Mg1z7cT5O0wpUEYkgKd84ZUGPYd1e7s=; t=1743753671; x=1743843671; 
	b=oEt8DAQKOahlhKHby0NhoeuGJcrDhA0EDaSenXKyb/b2kGowC3sTYfC8svAtsX3RlfUaGUZWsQ7
	QtD1mNm2G0OGWNdru/ZWZZIDSW+7Lpza5y2HTqMUZJ2bhGrhSt41fjnXLxQgCqUEGKSMkfFTWkZ+V
	JAqaRqEXICXXWyaHyNs4ofptIMtLPc/W6ahBbHvFf9jQ1nZNcCp7nc28+0/fBBcBfk78WulmpaqZQ
	l6oXkUqy/HLZN/mEQrbW3VUM0iLg2LYdwKstODqEcAOYqrXeRnsvM/FoPWFqikkyGEsKafPEzVq4w
	hEp4Sz61y+NvglL/z+2Gp+Ed9/bbycCGkYVQ==;
Received: by exim-smtp-895bd549-lgxtj with esmtpa (envelope-from <rabbelkin@mail.ru>)
	id 1u0bz1-000000004YK-1Xev; Fri, 04 Apr 2025 11:00:59 +0300
From: Ilya Shchipletsov <rabbelkin@mail.ru>
To: linux-mtd@lists.infradead.org
Cc: Ilya Shchipletsov <rabbelkin@mail.ru>,
	David Woodhouse <dwmw2@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	Nikita Marushkin <hfggklm@gmail.com>,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH] jffs2: silence lockdep warning on evict path
Date: Fri,  4 Apr 2025 08:00:18 +0000
Message-ID: <20250404080018.2472-3-rabbelkin@mail.ru>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD97BB0EF39AD2B33D523A7FFAD75F10FCEB3CC1372F4B8BB7E182A05F5380850409F60379EA5D3BCE43DE06ABAFEAF67059CBC1F60448DC854BDE44E4FF9B272FDC8A1163FE0F36968
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE780DF8B060B28AA3EEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637AC83A81C8FD4AD23D82A6BABE6F325AC2E85FA5F3EDFCBAA7353EFBB553375669E7A8FB0630A8A262975CBBD8A34B7ABE52387CACCA5797F8DF8B35F5C94F71A8EEF46B7454FC60B9742502CCDD46D0D744B801E316CB65FF6B57BC7E64490618DEB871D839B73339E8FC8737B5C22499F5E362153655AB1A471835C12D1D9774AD6D5ED66289B52BA9C0B312567BB23117882F44604297287769387670735207B96B19DC4093321C26CFBAC0749D213D2E47CDBA5A96583BA9C0B312567BB2376E601842F6C81A19E625A9149C048EE26055571C92BF10FAD7EC71F1DB884274AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C3FD59DAE6580CC3C376E601842F6C81A1F004C906525384303E02D724532EE2C3F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7C56E9C6A84874E69D43847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: 0D63561A33F958A58A473A14B657CA095002B1117B3ED69630D53A91875FC920CA7E60A991436CA2823CB91A9FED034534781492E4B8EEAD21D4E6D365FE45D1C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF863AB27E63E34ECF5BADB193CE4529F6067E832F66E58762D666058611B8D338C7834276CD052397B288EBB6A9CD0D56736D6EAEB8E2B405A2EB606E1A743F32C819E14356790D909FDC11CE098E8E5C913E6812662D5F2AADA346991DAA3C067974C754CD52CAF3964550E41902C4E4
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVZ8CcAyMfNWTeG420IOKKgo=
X-Mailru-Sender: 520A125C2F17F0B129A91D4D2C73336D7F3A1BF66CC4DB123DE06ABAFEAF67059CBC1F60448DC85487BBD21BC54961EB7D4011A27D7B18D45A92E71CC7C3152D768DA86FCF4447625FD6419AF7853D25851DE5097B8401C6C89D8AF824B716EB3E16B1F6FB27E47C394C4C78ECC52E263DDE9B364B0DF289AE208404248635DF
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B46E61CDDA35D5C24823C47167D7D275A370FD660D2521784C049FFFDB7839CE9E35FFF2E34BDEBBBFD7ADE4AEE4A8A4145A2CA7F97F4A1C99A46A07AB189D3E25572F6726639A3A93
X-7FA49CB5: 0D63561A33F958A5EF653C19C99365A55002B1117B3ED69607BA82F6B5ECEB4B477B8DB6B08738FF02ED4CEA229C1FA827C277FBC8AE2E8B54F520D093A0DF28
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZv8+WdjMXKmve33wsC06V5A==
X-Mras: Ok
X-7564579A: 78E4E2B564C1792B
X-77F55803: 6242723A09DB00B46E61CDDA35D5C24823C47167D7D275A377007E68BCC2BB69049FFFDB7839CE9E35FFF2E34BDEBBBFB687443891DD3207F6EB6017B50B2A6493AE118917C04983
X-7FA49CB5: 0D63561A33F958A5872D296EC1A99C25323CD609B515D0B0E182D1AD23DD7EA6CACD7DF95DA8FC8BD5E8D9A59859A8B69E49AEAF44F0814C
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZv8+WdjMXKmvIasNW20hTxQ==
X-Mailru-MI: 20000000000000800
X-Mras: Ok

Syzkaller detected a possible deadlock in jffs2_do_clear_inode that happens
in kswapd's evict path. This is however a false positive because in
jffs2_evict_inode we are the only holder of inode and nobody else should be
touching any locks of such inode.

WARNING: possible circular locking dependency detected
6.1.128-syzkaller-00157-gf31f96bd278e #0 Not tainted
------------------------------------------------------
kswapd0/72 is trying to acquire lock:
ffff8880945d6998 (&f->sem){+.+.}-{3:3}, at: jffs2_do_clear_inode+0x56/0x570 fs/jffs2/readinode.c:1419

but task is already holding lock:
ffffffff8a68b100 (fs_reclaim){+.+.}-{0:0}, at: balance_pgdat+0xa15/0x1510 mm/vmscan.c:7173

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #1 (fs_reclaim){+.+.}-{0:0}:
       __fs_reclaim_acquire mm/page_alloc.c:4719 [inline]
       fs_reclaim_acquire+0x100/0x150 mm/page_alloc.c:4733
       might_alloc include/linux/sched/mm.h:271 [inline]
       slab_pre_alloc_hook mm/slab.h:710 [inline]
       slab_alloc_node mm/slub.c:3318 [inline]
       slab_alloc mm/slub.c:3406 [inline]
       __kmem_cache_alloc_lru mm/slub.c:3413 [inline]
       kmem_cache_alloc+0x43/0x360 mm/slub.c:3422
       jffs2_do_read_inode+0x300/0x510 fs/jffs2/readinode.c:1372
       jffs2_iget+0x1bb/0xcb0 fs/jffs2/fs.c:276
       jffs2_do_fill_super+0x449/0xa60 fs/jffs2/fs.c:575
       jffs2_fill_super+0x27e/0x370 fs/jffs2/super.c:290
       mtd_get_sb+0x16f/0x220 drivers/mtd/mtdsuper.c:80
       mtd_get_sb_by_nr drivers/mtd/mtdsuper.c:111 [inline]
       get_tree_mtd+0x5ff/0x750 drivers/mtd/mtdsuper.c:164
       vfs_get_tree+0x8e/0x300 fs/super.c:1573
       do_new_mount fs/namespace.c:3056 [inline]
       path_mount+0x6a6/0x1e90 fs/namespace.c:3386
       do_mount fs/namespace.c:3399 [inline]
       __do_sys_mount fs/namespace.c:3607 [inline]
       __se_sys_mount fs/namespace.c:3584 [inline]
       __x64_sys_mount+0x283/0x300 fs/namespace.c:3584
       do_syscall_x64 arch/x86/entry/common.c:51 [inline]
       do_syscall_64+0x35/0x80 arch/x86/entry/common.c:81
       entry_SYSCALL_64_after_hwframe+0x6e/0xd8

-> #0 (&f->sem){+.+.}-{3:3}:
       check_prev_add kernel/locking/lockdep.c:3090 [inline]
       check_prevs_add kernel/locking/lockdep.c:3209 [inline]
       validate_chain kernel/locking/lockdep.c:3825 [inline]
       __lock_acquire+0x2a29/0x5320 kernel/locking/lockdep.c:5049
       lock_acquire kernel/locking/lockdep.c:5662 [inline]
       lock_acquire+0x194/0x4b0 kernel/locking/lockdep.c:5627
       __mutex_lock_common kernel/locking/mutex.c:603 [inline]
       __mutex_lock+0x14c/0x19f0 kernel/locking/mutex.c:747
       jffs2_do_clear_inode+0x56/0x570 fs/jffs2/readinode.c:1419
       evict+0x32c/0x810 fs/inode.c:705
       dispose_list+0xd7/0x1a0 fs/inode.c:738
       prune_icache_sb+0xe7/0x150 fs/inode.c:941
       super_cache_scan+0x38a/0x590 fs/super.c:106
       do_shrink_slab+0x412/0xa00 mm/vmscan.c:853
       shrink_slab+0x178/0x670 mm/vmscan.c:1013
       shrink_node_memcgs mm/vmscan.c:6147 [inline]
       shrink_node+0x957/0x1fb0 mm/vmscan.c:6176
       kswapd_shrink_node mm/vmscan.c:6968 [inline]
       balance_pgdat+0x8ed/0x1510 mm/vmscan.c:7158
       kswapd+0x5d4/0xb80 mm/vmscan.c:7418
       kthread+0x2e1/0x3a0 kernel/kthread.c:376
       ret_from_fork+0x22/0x30 arch/x86/entry/entry_64.S:295

other info that might help us debug this:

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(fs_reclaim);
                               lock(&f->sem);
                               lock(fs_reclaim);
  lock(&f->sem);

 *** DEADLOCK ***

Fix this false positive by using mutex_trylock instead of mutex_lock to
avoid creating a false locking dependency.

jffs2_do_crccheck_inode also calls this function, with local mutex,
which should be safe, but to be extremely sure and to make code more
future-proof WARN_ON_ONCE was used.

Found by Linux Verification Center (linuxtesting.org) with Syzkaller.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Co-developed-by: Nikita Marushkin <hfggklm@gmail.com>
Signed-off-by: Nikita Marushkin <hfggklm@gmail.com>
Signed-off-by: Ilya Shchipletsov <rabbelkin@mail.ru>
---
 fs/jffs2/readinode.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
index 03b4f99614be..3d2b2e5fc2c5 100644
--- a/fs/jffs2/readinode.c
+++ b/fs/jffs2/readinode.c
@@ -1416,7 +1416,17 @@ void jffs2_do_clear_inode(struct jffs2_sb_info *c, struct jffs2_inode_info *f)
 	int deleted;
 
 	jffs2_xattr_delete_inode(c, f->inocache);
-	mutex_lock(&f->sem);
+
+	/*
+	 * We should be the only ones having a reference to this struct
+	 * jffs2_inode_info. So the locking is actually unnecessary. Besides,
+	 * lockdep triggers a false-positive warning on &f->sem here about
+	 * reclaim circular dependency. Play it safe and bump a warning if
+	 * this doesn't hold true.
+	 */
+	if (WARN_ON_ONCE(!mutex_trylock(&f->sem)))
+		return;
+
 	deleted = f->inocache && !f->inocache->pino_nlink;
 
 	if (f->inocache && f->inocache->state != INO_STATE_CHECKING)
-- 
2.43.0

