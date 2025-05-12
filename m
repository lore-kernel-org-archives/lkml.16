Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F63D383
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 03:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747021652; cv=none; b=fo9dQXj47Z5cJ0/39VVapThHvJrCf3nMHJxKdNIwBgnwAs5ns5pyj6x4Wag4pd+JUoRAgNc6CNZhN5U3Mk0QtRM4VCKKMg5mGJVIEzsd93GYuCivrMRoYRlYUIHN2SDvR8eoWIDTvBZnT0xQs8tZYY6PZkkYf3Rs576949fy/ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747021652; c=relaxed/simple;
	bh=F9g/KaOJFHebwyR4sQga3f8fcOEJYP5XjX5C1xo48aE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=GEqCf10jmkj3lY0/jn9xpIKx1TCi0GiioWOecRapaE4/j8i5sGNx4inh6Wh9XAguUmAlvXsIEpaoJgUd+2O1YTwYHdcHweY5DWxaNwi966K+lX9z9JRbmxUgwLT0ztv6hihkWg07Ko6nbco6js/YL2DA3PFNiOo+83OiwqG+lRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bLNKUgOr; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bLNKUgOr"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e78f528aa8eso3146521276.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 20:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747021650; x=1747626450; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NL+yU8DQX37Je7KjgdKfp+OiEdWzsk8Nawd3p2oxSjc=;
        b=bLNKUgOrCXBitp8H4/916hnNbNim8fF2xmbltnI79zySOFcZHedacseFpR9XDtIBhd
         eIBBdqQkHKK0UU6WnheyqBIT9M2REkzD5lfp7W8vNd3T+31tKi+38sekVb89S7s0iiOx
         VOzJFEEESXMre7VRNMlNBYPR459RZ+xGvVAf4sqiWvg+J9OPdFmgkW1gR0GiJm/VM0hx
         cfMI2MN7n0c9CceHNZY6w3ieYiW1CYVXw47hEN1IF4TjqW6szYyYE1qBFL8cAB7LKGxI
         HrAZNLFP7JzVpFH0lBpmlHyJSuXkmTQmtUGA1EVjZRsMCVnknGIRHps88GPvQTytufvf
         EbVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747021650; x=1747626450;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NL+yU8DQX37Je7KjgdKfp+OiEdWzsk8Nawd3p2oxSjc=;
        b=rwvLUrksnACPw4NC8Smtc+1vxf0rDU08kfLys48UhCdtxAMWO1c169tGYWyRzBmU7v
         s1PXeSMT7AB5vAplDhf2/jdk/weDCW/MfNSyHXlzFwpjdzayrFaOBUU4kjkm2eAQPcVj
         p0i9AxvfidBJIMV+vSr57cwgnzG6Cuqj5P8TSKCttU0SefyjKmRqQucxwBBfWjdb+DeK
         3wM28KEP82mQVFJYk9VPzH6YLEcZF3+4d5fT8/Os3UabkcmMDmIcv6r+CK9D8+smmQX6
         0pMrZfmGj72D1SVaRjhPL4EaTo1RngUDCaBNhFtzz96BI7nj8HoeN/hxMa9ho58ta75+
         Duyg==
X-Forwarded-Encrypted: i=1; AJvYcCW5zPUkuO6vEncW1kdG683gWUK3jYVoSAJ00alFDHt8N1J/X/wMxm3tM1CGQpDDCcdKydJc/mZCZHmXSPE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJKRytnXi6ZaLfpGuF+Av4ot5i86P/kDCkG9yR+an+Xx1Bqrdy
	x0Vy+c3uPltYKKd9coPVG5dI6O64d8eB6zgFMegGg7NfHgi+vj+eOa7dCTP2NyW2deBWpl1pVS6
	VxXFNA2lY/Tm+azT+Oz2CKEQK3wA=
X-Gm-Gg: ASbGncsnq/wMzIJU/OenGR+M50qVQ4idmLfhU8HcOpuCh7MIO1TsrvAxcz1iXbz8R4Z
	4shCMlhvNkqQTF6zCti6MrNFAbMlR8oEooLzGJxobZtjEaamoiajrCHff2PkguKUQQizVHbf1TL
	cdmoX5D9bPc9sTFN8rmKP6imjfejR9KHrlyxvR81Uw
X-Google-Smtp-Source: AGHT+IFPFw+gJ/bQF2EwthAafjiLOofQU+haxcT+mEDKtNeE7L2EguezzCE/O54eia+EP/Bq1tvfjjLJZedEgYEvHLw=
X-Received: by 2002:a05:6902:2085:b0:e78:ed39:f4e3 with SMTP id
 3f1490d57ef6-e78fdd72b54mr15432447276.45.1747021650188; Sun, 11 May 2025
 20:47:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: cen zhang <zzzccc427@gmail.com>
Date: Mon, 12 May 2025 11:47:17 +0800
X-Gm-Features: AX0GCFs8C_LhWlDacxAZHsu0N81IK8AEzzpyvWqGqBP64pef1298kKQjrfTrU70
Message-ID: <CAFRLqsVpY4EtBKoJHwafoeTfd3wF2Q2ga924FTNBG5pVLCBnKw@mail.gmail.com>
Subject: [BUG] Data race on xtSearch about jfs_ip->btindex
To: shaggy@kernel.org
Cc: jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	baijiaju1990@gmail.com, zhenghaoran154@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I would like to report a data race bug detected in
the jfs filesystem on Linux kernel 6.14-rc4.
The issue was discovered by our tools,
which identified unsynchronized concurrent accesses to
`jfs_ip->btindex`.
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D DATARACE =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
Function: xtSearch+0x268c/0x3d60 fs/jfs/jfs_xtree.c:451
Function: xtLookup+0x4d7/0x1490 fs/jfs/jfs_xtree.c:152
Function: jfs_get_block+0x520/0x2130 fs/jfs/inode.c:218
Function: __blockdev_direct_IO+0x1629/0x3e20
Function: jfs_direct_IO+0x304/0x610 include/linux/fs.h:3412
Function: generic_file_read_iter+0x2d2/0x410
Function: vfs_read+0x745/0xaa0
Function: ksys_read+0x116/0x200
Function: do_syscall_64+0xc9/0x1a0
Function: entry_SYSCALL_64_after_hwframe+0x77/0x7f
Function: 0x0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3DOTHER_INFO=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
Function: xtSearch+0x2593/0x3d60 fs/jfs/jfs_xtree.c:446
Function: xtLookup+0x4d7/0x1490 fs/jfs/jfs_xtree.c:152
Function: jfs_get_block+0x520/0x2130 fs/jfs/inode.c:218
Function: block_read_full_folio+0x35e/0x9b0
Function: do_mpage_readpage+0xed3/0x1070
Function: mpage_read_folio+0xb8/0x160
Function: jfs_read_folio+0x3a/0x60 fs/jfs/inode.c:275
Function: filemap_read_folio+0x54/0x140
Function: filemap_get_pages+0x102b/0x14c0
Function: filemap_read+0x34e/0xb90
Function: vfs_read+0x745/0xaa0
Function: ksys_read+0x116/0x200
Function: do_syscall_64+0xc9/0x1a0
Function: entry_SYSCALL_64_after_hwframe+0x77/0x7f
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3DEND=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D

The code locations involved in the data race are:

Read (fs/jfs/jfs_xtree.c):
static int xtSearch(struct inode *ip, s64 xoff, s64 *nextp,
            int *cmpp, struct btstack * btstack, int flag)
{
            ...
            /* init sequential access heuristics */
            btindex =3D jfs_ip->btindex;
            ...
}

Write (fs/jfs/jfs_xtree.c):
static int xtSearch(struct inode *ip, s64 xoff, s64 *nextp,
            int *cmpp, struct btstack * btstack, int flag)
{
            ...
                jfs_ip->btorder =3D BT_RANDOM;
            jfs_ip->btindex =3D base;
            ...
}
I=E2=80=99ve verified that this issue still exists in the latest source tre=
e
Thank you for your attention to this matter.
Best regards,
Cen Zhang
