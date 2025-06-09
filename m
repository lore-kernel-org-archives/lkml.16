Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822AF19258E
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 18:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749492984; cv=none; b=mBfk7ZVuLal0ZfJd855OyNr98UGZPBorWInIOnHXaTsGZ8gtqtgwrlhIk/zqpPieemyCo9NdrJnyqFTaIvWwP1LnSfLg4bBHvpxQFOoDV8IGLGoObnHstG7/M7wTZ5p0y01PfjoJXWtoOquacPl4+dMwQw1OvGhOAkMAfM7i5aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749492984; c=relaxed/simple;
	bh=sGhfwGYyYdQvfj6EAOg8KWGMmATTU6lYzbCqTY1L0Zw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WmLecRAm6K6osu1+iZMm83Tq6179Ycw3MP2yD9h33sOPrFxdPFhXIFVXFGGS0R2LedWeUBG7Cc9iSVubFH0zmms/5ocKxJx48xxB6yLKM8sjOrGIAgsk8fd/pAINGaQokjCbzEcMBNgfGwAv/w2kfCSc63yU8ZDmClEcEcf9+2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V7it6JAv; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V7it6JAv"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6fb0a05b56cso59023896d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 11:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749492981; x=1750097781; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YPGW08WeH45/g43t9jU88CXRE8r+aGzCSBoKpipNZjg=;
        b=V7it6JAvEthblejKr7XSC4c86cKRNCVYsEyNFVKxDXEWUfSfag2rnKHQlUtYrR6aCS
         xXcVD3pLy8EqhSZFDraGYgSiG9n/yAqGV8JiivmCyNZdQ8zXjMBafkUiAOhqE8yunAlK
         WFNuaW0cO6ym04+fTpvMOlnJ9+D2Xmenkd9WvcxnQSP6buJk8omRHZ1bGj94VFoJgHs/
         8lFe/DNL8z7BNeBFFWTOMTy5Cv/41yu89r/yjpeaMY5P8nx2AReJs35I5qPe38VhHYEs
         jN9HT8A//m2RKegHRbidcaQvIrfgIIYHwcsvdCTO3cR5Gh0Li94Prq0RLTNJqfuMrTfT
         xTjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749492981; x=1750097781;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YPGW08WeH45/g43t9jU88CXRE8r+aGzCSBoKpipNZjg=;
        b=R9g4KJ89M2BE6CXNXi0pGvDHU5cRNknUmRrEUbSvrFpADFGQRZQrZRi6SwmSqrkRP+
         X5Oj2ZAzZGkDcLHNj5iifTs0Y+T71NVoEC3TgIxABuXLMxxlCKIBh12liCXU3N9cK96H
         ie9Nm8ZoFISUi7SLdQZJqn+82E4lJOtFYCmP0bp/XBK8BmsJCZJkiq0XDDRjv29nxwcY
         RVGyTAtVK2k0NzGE1g0tUVjo9Skyt6NMDGkPRUBYXuXxQQSd59FdgYhNZtdleqUIDQ3u
         DCAtcV/5/4fPE071unZCORoF6FuNyB8Fo8eTuttx9QK1LFnvC6n1reWCPsApsM/nnXqj
         ARKg==
X-Forwarded-Encrypted: i=1; AJvYcCVcMLh99tOmk/GvO5h+9PCN3cHiSk/XWZn5sxuCu28jyY2Owew3+TGZEbaSetwKuafWKjcQ6leyj5NeExw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw72trLrK3dwApRf54HjR8agf5kt0AdUEmdC5zC1PTOlqLyvET5
	NvvJfQU8buaxEeLF++42kXkkzNhj2XtCJ3c2USmrYJzNBGx8f3VQtZBewAtXln06gdbaGQqPOBV
	uwEm3wpSILe6g9ftJG9ZGlekG6B8525RrQPnF
X-Gm-Gg: ASbGncvjCAS3A6rtqbfhog2bdgPcg464xUgp7mZvX4LiS7noaGZtuOkinpdnbgK+MkX
	Zje0hwDNlydXOwjQMKlxfwv+vWCnV66A6ubR7uaQc0R0CLPptqkl8i/xdhzYQ7C9wU+dLqGK1kL
	Etl4Ysyo/rUnqfeKEW8G2KaaRXbE1iaO16PqeeSVX5dnak
X-Google-Smtp-Source: AGHT+IE1U/ltvMwieopOmj2GkLnR345XofulrqvlHIdL963prRjDQBxfnvE+8Qaj5KpOXBHnHtpDLdKlMYcRq7GdOUE=
X-Received: by 2002:a05:6214:240c:b0:6fa:c41e:ccee with SMTP id
 6a1803df08f44-6fb08ff60c2mr243161376d6.19.1749492981077; Mon, 09 Jun 2025
 11:16:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609171751.36305-1-ryncsn@gmail.com>
In-Reply-To: <20250609171751.36305-1-ryncsn@gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Mon, 9 Jun 2025 11:16:10 -0700
X-Gm-Features: AX0GCFtwlx6RmFBq-z1AXu-QCRbvDPHjFlgbcB1X1ZKZ9oqA4BY53KUWkXxNuvE
Message-ID: <CAKEwX=Pz7kbvvgfBmspS8L5XKHv6cQ3B1Yvx=Tm1metQXEEW+A@mail.gmail.com>
Subject: Re: [PATCH v2] mm/shmem, swap: fix softlockup with mTHP swapin
To: Kairui Song <kasong@tencent.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Chris Li <chrisl@kernel.org>, 
	Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, Usama Arif <usamaarif642@gmail.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 9, 2025 at 10:18=E2=80=AFAM Kairui Song <ryncsn@gmail.com> wrot=
e:
>
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
>     dd if=3D/dev/zero of=3D/tmp/test.img bs=3D1M count=3D5120
>     cat /tmp/test.img > /dev/null
>     rm /tmp/test.img
> done
>
> Then after a while:
> watchdog: BUG: soft lockup - CPU#0 stuck for 763s! [cat:5787]
> Modules linked in: zram virtiofs
> CPU: 0 UID: 0 PID: 5787 Comm: cat Kdump: loaded Tainted: G             L =
     6.15.0.orig-gf3021d9246bc-dirty #118 PREEMPT(voluntary)=C2=B7
> Tainted: [L]=3DSOFTLOCKUP
> Hardware name: Red Hat KVM/RHEL-AV, BIOS 0.0.0 02/06/2015
> RIP: 0010:mpol_shared_policy_lookup+0xd/0x70
> Code: e9 b8 b4 ff ff 31 c0 c3 cc cc cc cc 90 90 90 90 90 90 90 90 90 90 9=
0 90 90 90 90 90 90 66 0f 1f 00 0f 1f 44 00 00 41 54 55 53 <48> 8b 1f 48 85=
 db 74 41 4c 8d 67 08 48 89 fb 48 89 f5 4c 89 e7 e8
> RSP: 0018:ffffc90002b1fc28 EFLAGS: 00000202
> RAX: 00000000001c20ca RBX: 0000000000724e1e RCX: 0000000000000001
> RDX: ffff888118e214c8 RSI: 0000000000057d42 RDI: ffff888118e21518
> RBP: 000000000002bec8 R08: 0000000000000001 R09: 0000000000000000
> R10: 0000000000000bf4 R11: 0000000000000000 R12: 0000000000000001
> R13: 00000000001c20ca R14: 00000000001c20ca R15: 0000000000000000
> FS:  00007f03f995c740(0000) GS:ffff88a07ad9a000(0000) knlGS:0000000000000=
000
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
> Code: 00 48 8b 15 81 14 10 00 f7 d8 64 89 02 b8 ff ff ff ff eb bd e8 20 a=
d 01 00 f3 0f 1e fa 80 3d 35 97 10 00 00 74 13 31 c0 0f 05 <48> 3d 00 f0 ff=
 ff 77 4f c3 66 0f 1f 44 00 00 55 48 89 e5 48 83 ec
> RSP: 002b:00007fff3c52bd28 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
> RAX: ffffffffffffffda RBX: 0000000000040000 RCX: 00007f03f9a46991
> RDX: 0000000000040000 RSI: 00007f03f98ba000 RDI: 0000000000000003
> RBP: 00007fff3c52bd50 R08: 0000000000000000 R09: 00007f03f9b9a380
> R10: 0000000000000022 R11: 0000000000000246 R12: 0000000000040000
> R13: 00007f03f98ba000 R14: 0000000000000003 R15: 0000000000000000
>  </TASK>
>
> The reason is simple, readahead brought some order 0 folio in swap
> cache, and the swapin mTHP folio being allocated is in confict with it,
> so swapcache_prepare fails and causes shmem_swap_alloc_folio to return
> -EEXIST, and shmem simply retries again and again causing this loop.
>
> Fix it by applying a similar fix for anon mTHP swapin.
>
> The performance change is very slight, time of swapin 10g zero folios
> with shmem (test for 12 times):
> Before:  2.47s
> After:   2.48s
>
> Fixes: 1dd44c0af4fa1 ("mm: shmem: skip swapcache for swapin of synchronou=
s swap device")
> Signed-off-by: Kairui Song <kasong@tencent.com>

LGTM.
Acked-by: Nhat Pham <nphamcs@gmail.com>

>
> ---
>
> V1: https://lore.kernel.org/linux-mm/20250608192713.95875-1-ryncsn@gmail.=
com/
> Updates:
> - Move non_swapcache_batch check before swapcache_prepare, I was
>   expecting this could improve the performance, turns out it barely
>   helps and may even cause more overhead in some cases. [ Barry Song ]
> - Remove zero map check, no need to do that for shmem [ Barry Song,
>   Baolin Wang ]
> - Fix build bot error.
>
>  mm/memory.c | 20 --------------------
>  mm/shmem.c  |  4 +++-
>  mm/swap.h   | 23 +++++++++++++++++++++++
>  3 files changed, 26 insertions(+), 21 deletions(-)
>
> diff --git a/mm/memory.c b/mm/memory.c
> index 9ead7ab07e8e..3845ed068d74 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -4313,26 +4313,6 @@ static struct folio *__alloc_swap_folio(struct vm_=
fault *vmf)
>  }
>
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> -static inline int non_swapcache_batch(swp_entry_t entry, int max_nr)
> -{
> -       struct swap_info_struct *si =3D swp_swap_info(entry);
> -       pgoff_t offset =3D swp_offset(entry);
> -       int i;
> -
> -       /*
> -        * While allocating a large folio and doing swap_read_folio, whic=
h is
> -        * the case the being faulted pte doesn't have swapcache. We need=
 to
> -        * ensure all PTEs have no cache as well, otherwise, we might go =
to
> -        * swap devices while the content is in swapcache.
> -        */
> -       for (i =3D 0; i < max_nr; i++) {
> -               if ((si->swap_map[offset + i] & SWAP_HAS_CACHE))
> -                       return i;
> -       }
> -
> -       return i;
> -}
> -
>  /*
>   * Check if the PTEs within a range are contiguous swap entries
>   * and have consistent swapcache, zeromap.
> diff --git a/mm/shmem.c b/mm/shmem.c
> index 73182e904f9c..a4fdfbd086f1 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -2256,6 +2256,7 @@ static int shmem_swapin_folio(struct inode *inode, =
pgoff_t index,
>         folio =3D swap_cache_get_folio(swap, NULL, 0);
>         order =3D xa_get_order(&mapping->i_pages, index);
>         if (!folio) {
> +               int nr_pages =3D 1 << order;
>                 bool fallback_order0 =3D false;
>
>                 /* Or update major stats only when swapin succeeds?? */
> @@ -2271,7 +2272,8 @@ static int shmem_swapin_folio(struct inode *inode, =
pgoff_t index,
>                  * to swapin order-0 folio, as well as for zswap case.

nit: maybe update the above comment?

>                  */
>                 if (order > 0 && ((vma && unlikely(userfaultfd_armed(vma)=
)) ||
> -                                 !zswap_never_enabled()))
> +                                 !zswap_never_enabled() ||
> +                                 non_swapcache_batch(swap, nr_pages) !=
=3D nr_pages))
>                         fallback_order0 =3D true;
>
>                 /* Skip swapcache for synchronous device. */
> diff --git a/mm/swap.h b/mm/swap.h
> index e87a0f19a0ee..911ad5ff0f89 100644
> --- a/mm/swap.h
> +++ b/mm/swap.h
> @@ -108,6 +108,25 @@ static inline int swap_zeromap_batch(swp_entry_t ent=
ry, int max_nr,
>                 return find_next_bit(sis->zeromap, end, start) - start;
>  }
>
