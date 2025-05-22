Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00FC28D854
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.167.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747940739; cv=none; b=FXB9J/xSgzZA2fpe64CNkTd4PsCNWWv0KYf2eFaa4jSOOczuIErXiqGzfkirtaB+ggef8mb/UMxwsxrl+vVXRrofBMTKj+lBqeMU8CEFfutXpuBVqkGNUlZRfCPEWW4/Df9zXDn1tPmeis0r+wE2XaH+EWpGhQEJn4YWbqFT4Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747940739; c=relaxed/simple;
	bh=H/1vGhVZ5EI3Oju0SmXklImYosX/mrv0L2Z9wFDIlY0=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=rc2V6swZfzkPEAqL8NdQOlNX/6Aod/wOGQ7kQZ79aSJ/vnJ6RFqTpr99Rka0DYkM3LVGNKkScoF7XBJBZnS0sldwwrgBas9/IRZgupgLITU6XZrsk7Y9J9ouxJBG7xH3iNOi+zAgFZbJsPME5JwIPoUoeBkQXKpGd5CR6UCd0PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; arc=none smtp.client-ip=116.203.167.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id AD761298565;
	Thu, 22 May 2025 21:05:32 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id v07nohqir7qv; Thu, 22 May 2025 21:05:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 08803298566;
	Thu, 22 May 2025 21:05:31 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 1LVLdbTPUxEc; Thu, 22 May 2025 21:05:30 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id D62E0298565;
	Thu, 22 May 2025 21:05:30 +0200 (CEST)
Date: Thu, 22 May 2025 21:05:30 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Leonid Arapov <arapovl839@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, 
	Ferenc Havasi <havasi@inf.u-szeged.hu>, tglx <tglx@linutronix.de>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <805192433.83579512.1747940730785.JavaMail.zimbra@nod.at>
In-Reply-To: <20250423193209.5811-1-arapovl839@gmail.com>
References: <20250423193209.5811-1-arapovl839@gmail.com>
Subject: Re: [PATCH] jffs2: Decrease xattr length limit to avoid summary
 write error
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF138 (Linux)/8.8.12_GA_3809)
Thread-Topic: jffs2: Decrease xattr length limit to avoid summary write error
Thread-Index: 5lo8AZNICDt9g8QiKbMyFbwAJPCU4Q==

----- Urspr=C3=BCngliche Mail -----
> Von: "Leonid Arapov" <arapovl839@gmail.com>
> An: "David Woodhouse" <dwmw2@infradead.org>
> CC: "Leonid Arapov" <arapovl839@gmail.com>, "richard" <richard@nod.at>, "=
Ferenc Havasi" <havasi@inf.u-szeged.hu>, "tglx"
> <tglx@linutronix.de>, "linux-mtd" <linux-mtd@lists.infradead.org>, "linux=
-kernel" <linux-kernel@vger.kernel.org>
> Gesendet: Mittwoch, 23. April 2025 21:32:05
> Betreff: [PATCH] jffs2: Decrease xattr length limit to avoid summary writ=
e error

> When fuzzing, the following error is observed:
>=20
> jffs2: warning: (1096) jffs2_sum_write_sumnode: Empty summary info!!!
> ------------[ cut here ]------------
> kernel BUG at fs/jffs2/summary.c:865!
> invalid opcode: 0000 [#1] PREEMPT SMP KASAN NOPTI
> CPU: 1 PID: 1096 Comm: syz-executor340 Not tainted
> 6.1.108-syzkaller-00007-g86fb5a1a71c9 #0
> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.12.0-1
> 04/01/2014
> RIP: 0010:jffs2_sum_write_sumnode.cold+0x195/0x43b fs/jffs2/summary.c:865
> Call Trace:
> jffs2_do_reserve_space+0xa18/0xd60 fs/jffs2/nodemgmt.c:388
> jffs2_reserve_space+0x55f/0xaa0 fs/jffs2/nodemgmt.c:197
> do_jffs2_setxattr+0x212/0x1570 fs/jffs2/xattr.c:1117
> __vfs_setxattr+0x118/0x180 fs/xattr.c:182
> __vfs_setxattr_noperm+0x125/0x600 fs/xattr.c:216
> __vfs_setxattr_locked+0x1d3/0x260 fs/xattr.c:277
> vfs_setxattr+0x13f/0x340 fs/xattr.c:309
> setxattr+0x14a/0x160 fs/xattr.c:617
> path_setxattr+0x19b/0x1d0 fs/xattr.c:636
> __do_sys_setxattr fs/xattr.c:652 [inline]
> __se_sys_setxattr fs/xattr.c:648 [inline]
> __x64_sys_setxattr+0xc0/0x160 fs/xattr.c:648
> do_syscall_64+0x35/0x80 arch/x86/entry/common.c:81
>=20
> The error occurs when trying to create a new attribute of a file by xattr
> syscall. Size and name of the attribure are set by user. Current limit of
> total size of an attribute is equal to free size in a clean block and it
> doesn't include space needed for summary data structures. So it is
> possible to create an attribute whose size doesn't exceed the limit but
> the total size of attribute and its summary data does. If requested size
> of an attribute satisfies this condition, it leads to the following
> behavior:
>=20
> jffs2_do_reserve_space tries to reserve requested size for an attribute
> and its summary. It fails to do so because even a clean block doesn't hav=
e
> enough free space. Then it writes existing summary to the current block
> and proceeds to the next block. Summary data is linked to a specific eras=
e
> block so it needs to be written to the current block before selecting
> a new one.
>=20
> Then this function is called again to reserve space in a new block.
> It fails again and tries to write summary as the first time but at this
> point collected summary for the block is empty and it leads to BUG() in
> jffs2_summary_write_sumnode.
>=20
> Decrease maximum allowed size of xattr buffer.
>=20
> Found by Linux Verification Center (linuxtesting.org) with Syzkaller.
>=20
> Fixes: e631ddba5887 ("[JFFS2] Add erase block summary support (mount time
> improvement)")
> Signed-off-by: Leonid Arapov <arapovl839@gmail.com>
> ---
> fs/jffs2/xattr.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/fs/jffs2/xattr.c b/fs/jffs2/xattr.c
> index defb4162c3d5..7380f32e6d0f 100644
> --- a/fs/jffs2/xattr.c
> +++ b/fs/jffs2/xattr.c
> @@ -1110,7 +1110,8 @@ int do_jffs2_setxattr(struct inode *inode, int xpre=
fix,
> const char *xname,
> =09=09return rc;
>=20
> =09request =3D PAD(sizeof(struct jffs2_raw_xattr) + strlen(xname) + 1 + s=
ize);
> -=09if (request > c->sector_size - c->cleanmarker_size)
> +=09if (request > c->sector_size - c->cleanmarker_size -
> +=09    JFFS2_SUMMARY_XATTR_SIZE - JFFS2_SUMMARY_FRAME_SIZE)
> =09=09return -ERANGE;

What about systems without summary support and existing filesystems?
We need to be super careful with such changes.

Thanks,
//richard
