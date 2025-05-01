Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E741BF37
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 15:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746114638; cv=none; b=n+Uh512xIPtjKwzqqXz71Xj7ajYHr0iRAyRssd3FADMZzq6WzS6U0Bb8Z/KVsl88KriVwBYY5w/tw26yU8eixAvUszvgjQsvNgu9J9ZFl0iw2pMOHZgNUObUTkasfO4sityEtk3eWsBAL7C+76xr3EMXT2GGlQ4rdfRk/3rEdIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746114638; c=relaxed/simple;
	bh=05nuWxwJrP6ImppPLRwI3J3jYWNxBGDtGXMQ2/2UM68=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oBFNEiZ/Y4Dk6RELFRdi65JKvEA6WLTpdezCjoX29CU0cGjT2FMpjB6FL3Kh5d2wzfqubT2OvNArgu9J0+PfyGWV6M6h067nLwETpktLXD0AysNOD8ENwNFVPe1UEGyAt881S50K0Mk1t7qWwQXghZL2vNbsQmFKafDvwjrAT3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M9eStOQa; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M9eStOQa"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6ecf99dd567so16715836d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 08:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746114635; x=1746719435; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e/gkyM3oFDnDmiC4diCmIxvY145pRyMQi2rIkFSJT9c=;
        b=M9eStOQa44UhzutWGVD/KXLxwC6gCuw0oZI3O4LvGwGoPprJdB0V14jZIIW6/AEGcc
         wRDBqkcCMuj3NYd5wKV6aRGotsyN172vELe00zvoVgiNoH23SVDL2wnW8DPyjxWSb6t2
         gVQH5LiProDE72wNDwzDLg6sMcKYAaTriznDot1AdNgQLoEc6ev1TzzGsjhoTeW1o4LK
         xYk0c9iP3ezLQcC0WCLqezMMQo8yrK6zfah2MivDXcHiLGBf/mvMM1DIZF9GXIW+g7Wl
         nH/4t/ScZJ1Y1YXvS0pLrEQDJL1pkYpS17+MacvFBRfauj3Yn0VbAwQJXk7NCSdFgUG2
         NyQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746114635; x=1746719435;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e/gkyM3oFDnDmiC4diCmIxvY145pRyMQi2rIkFSJT9c=;
        b=pRGwq+Mm95QtYQ5fLD5szLgDl+Ax8eBd26UqjoqCNLTsKCSXF4NJERmVA/JJxpHQdE
         nDlv+2d7+E9jFeG7c8unfSdnupPxBr2E1B4fo4AnSI/KDRp9bpp5mneCdw7uZsFwj0f8
         7DgX2VZZ5bfWiWnxE1TjDzKJ2c02L5y/jASNcoMpoRck/GT5LLh/1cKx29/W7NvKEGXd
         8RzPOJI0QQdAGJBHUJBAgdeHOP1/lr4cQmjTtejeUCvZcFJhjKlIr4x6bIOJMfWilWZm
         hnKfX9PrfI5rJh/LjJVqvRdUuOF3GM+xwvMtaZ+ciCcIbbGvS6Hd40TV4Gf6TaAdx5kP
         Afcg==
X-Forwarded-Encrypted: i=1; AJvYcCXgb5RlPApRH0+rtlG7iOVQHBrPqC5dCLSuthBM2b3qjiv1t8IIzUDzpgJifrRPNgYqTc8CKMA3OBfCRn0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKLnI5aYP9FzLZdIO6lSUhvRhgGxSL0dcETq/iT3oDOPmfvUWb
	Km80H+wEII7POqkHFl3d20lMHoa8gtoSyXOTqhDvvkMlQjqQzpixCsaiRnGsK7lTd+s3sbb3hXe
	PqNHkA4o1Nw3vtNS3FjeilDRmUlg=
X-Gm-Gg: ASbGncsI7NxAUW2CEuPAFsG7yJVKQpmiv98JRtTM1B1DK3JtFCw4P4tVu/iPDvAONMg
	cWVo1qLuW9QVqHNcX1/rMDZlqcWXKCxCw5TuP15QNxtH3+CHPFbWMJit8kYJWAY4hxZKYcZs6wQ
	vJA+dZLrnDTmzFGdhKKlIL864=
X-Google-Smtp-Source: AGHT+IHO/1JjpQlA3vZ2eRSDQvhzoweYMhYgCYf17uHdH7Vil20W5pGnhp9djE4FSIg3al8nnvRqCoV7aBjmQR5yuEs=
X-Received: by 2002:a05:6214:d85:b0:6ed:122c:7da7 with SMTP id
 6a1803df08f44-6f50a8fa520mr51081636d6.5.1746114635123; Thu, 01 May 2025
 08:50:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430082651.3152444-1-qun-wei.lin@mediatek.com>
In-Reply-To: <20250430082651.3152444-1-qun-wei.lin@mediatek.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Thu, 1 May 2025 08:50:24 -0700
X-Gm-Features: ATxdqUGn8eYuPIj4I1IzzOIEq-VCYnYbbowQLijhdEqfyu9by8KrA7NerQXniyA
Message-ID: <CAKEwX=MNVwd_Z1PyBt7swd2VhUVivRN-5E+kHm-3XAPka0d84w@mail.gmail.com>
Subject: Re: [PATCH] mm: Add Kcompressd for accelerated memory compression
To: Qun-Wei Lin <qun-wei.lin@mediatek.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Casper Li <casper.li@mediatek.com>, 
	Chinwen Chang <chinwen.chang@mediatek.com>, Andrew Yang <andrew.yang@mediatek.com>, 
	James Hsu <james.hsu@mediatek.com>, Barry Song <21cnbao@gmail.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kairui Song <ryncsn@gmail.com>, Joshua Hahn <joshua.hahnjy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 1:27=E2=80=AFAM Qun-Wei Lin <qun-wei.lin@mediatek.c=
om> wrote:
>
> This patch series introduces a new mechanism called kcompressd to
> improve the efficiency of memory reclaiming in the operating system.
>
> Problem:
>   In the current system, the kswapd thread is responsible for both scanni=
ng
>   the LRU pages and handling memory compression tasks (such as those
>   involving ZSWAP/ZRAM, if enabled). This combined responsibility can lea=
d
>   to significant performance bottlenecks, especially under high memory
>   pressure. The kswapd thread becomes a single point of contention, causi=
ng
>   delays in memory reclaiming and overall system performance degradation.
>
> Solution:
>   Introduced kcompressd to handle asynchronous compression during memory
>   reclaim, improving efficiency by offloading compression tasks from
>   kswapd. This allows kswapd to focus on its primary task of page reclaim
>   without being burdened by the additional overhead of compression.
>
> In our handheld devices, we found that applying this mechanism under high
> memory pressure scenarios can increase the rate of pgsteal_anon per secon=
d
> by over 260% compared to the situation with only kswapd. Additionally, we
> observed a reduction of over 50% in page allocation stall occurrences,
> further demonstrating the effectiveness of kcompressd in alleviating memo=
ry
> pressure and improving system responsiveness.
>

Oh btw, testing this on a simple kernel building task triggers this:

[  133.349908] WARNING: CPU: 0 PID: 50 at mm/memcontrol.c:5330
obj_cgroup_charge_zswap+0x22e/0x250
[  133.350505] Modules linked in: virtio_net pata_acpi net_failover
failover virtio_rng rng_core ata_piix libata scsi_mod scsi_common
[  133.351366] CPU: 0 UID: 0 PID: 50 Comm: kcompressd0 Not tainted
6.14.0-ge65b549702a5 #218
[  133.351940] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
BIOS rel-1.16.0-0-gd239552ce722-prebuilt.qemu.org 04/01/2014
[  133.352717] RIP: 0010:obj_cgroup_charge_zswap+0x22e/0x250
[  133.353118] Code: d2 ff 85 c0 0f 85 7a fe ff ff be ff ff ff ff 48
c7 c7 88 da f1 91 e8 a1 b4 a3 00 85 c0 0f 85 61 fe ff ff 0f 0b e9 5a
fe ff ff <0f> 0b e9 f5 fd ff ff e8 36 ae a3 00 e9 78 fe ff ff e8 2c ae
a3 00
[  133.354372] RSP: 0018:ffff9f99803bbc00 EFLAGS: 00010246
[  133.354782] RAX: ffff970f42a9a900 RBX: 000000000000013e RCX: 00000000000=
00002
[  133.355269] RDX: 0000000000000000 RSI: 000000000000013e RDI: ffff970f475=
eab40
[  133.355774] RBP: ffff970f475eab40 R08: 0000000000000000 R09: 00000000000=
00000
[  133.356269] R10: ffffffff90a21205 R11: ffffffff90a211ab R12: ffffffff90a=
21205
[  133.356782] R13: ffffc4984041ff40 R14: ffff970f42e66000 R15: 00000000000=
0013e
[  133.357279] FS:  0000000000000000(0000) GS:ffff970fbdc00000(0000)
knlGS:0000000000000000
[  133.357807] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  133.358186] CR2: 00007f33950c5030 CR3: 00000000038ea000 CR4: 00000000000=
006f0
[  133.358656] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 00000000000=
00000
[  133.359121] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 00000000000=
00400
[  133.359597] Call Trace:
[  133.359767]  <TASK>
[  133.359914]  ? __warn+0x94/0x190
[  133.360136]  ? obj_cgroup_charge_zswap+0x22e/0x250
[  133.360476]  ? report_bug+0x168/0x170
[  133.360742]  ? handle_bug+0x53/0x90
[  133.360982]  ? exc_invalid_op+0x18/0x70
[  133.361240]  ? asm_exc_invalid_op+0x1a/0x20
[  133.361536]  ? zswap_store+0x755/0xf80
[  133.361798]  ? zswap_store+0x6fb/0xf80
[  133.362071]  ? zswap_store+0x755/0xf80
[  133.362338]  ? obj_cgroup_charge_zswap+0x22e/0x250
[  133.362661]  ? zswap_store+0x755/0xf80
[  133.362943]  zswap_store+0x7e7/0xf80
[  133.363203]  ? __pfx_kcompressd+0x10/0x10
[  133.363472]  kcompressd+0xb1/0x180
[  133.363724]  ? __pfx_autoremove_wake_function+0x10/0x10
[  133.364082]  kthread+0xef/0x230
[  133.364298]  ? __pfx_kthread+0x10/0x10
[  133.364548]  ret_from_fork+0x34/0x50
[  133.364810]  ? __pfx_kthread+0x10/0x10
[  133.365063]  ret_from_fork_asm+0x1a/0x30
[  133.365321]  </TASK>
[  133.365471] irq event stamp: 18
[  133.365680] hardirqs last  enabled at (17): [<ffffffff914bd0ef>]
_raw_spin_unlock_irqrestore+0x4f/0x60
[  133.366289] hardirqs last disabled at (18): [<ffffffff914b2031>]
__schedule+0x6b1/0xe80
[  133.366824] softirqs last  enabled at (0): [<ffffffff906b1caf>]
copy_process+0x9af/0x2b50
[  133.367366] softirqs last disabled at (0): [<0000000000000000>] 0x0
[  133.367844] ---[ end trace 0000000000000000 ]---

Seems like we're trigger this warning in the zswap cgroup check (see
obj_cgroup_may_zswap() in mm/memcontrol.c for more details):

VM_WARN_ON_ONCE(!(current->flags & PF_MEMALLOC));

Might wanna fix this...
