Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BA921771B
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 16:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743094355; cv=none; b=Y7B0aEl7pW8i4GRodRBg6H0F87kgpptrhp0sy08jythSwUq856Lg4Pmij/AnxnHYm12U7Ru1KMPYOnFcTw783SW2P5uk9DirPUF0u1tYkVcd6HFzNWMCVMomZNHMf54Sl2v/FgNORT70H2OClND8IoSUN75OZ+oplWHGN8d6auY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743094355; c=relaxed/simple;
	bh=npltxgttpo1lkWP1P63iOA4NbK9EQqk6O1sMC4SUz9Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GNrRFaxDehiPZKyWj1y7kDoWtiQytGqIXevnFf/yra4hs8y8TDJFAI+MNHuSFqIouHg/RYqQanTovHMRr8IEQ+EH9qSlg7gRl0Mg1F83BIMrdX36MhicNnMH2yiOvQ94IIjaRNm8dGUJCmzH9QFPmGu6BWrPnWBEr4F1w71+e6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VCoPx+DN; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VCoPx+DN"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-51eb18130f9so592920e0c.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 09:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743094352; x=1743699152; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0U9geEjGC1dSN0o/JPxh2M8Qsd9akqfHr698kSw5Itk=;
        b=VCoPx+DNVKisYv4h3+qnBPumULYsBSOM7cTi/0Q614TOosdUhZRW7cZJzySk/MCeMS
         FRf9D6SSRT6HR9BRBUQL2Zh/a99kZ9LZssT0Rn5Q/y1ZPN2FWRbUWD/0wliRzSqpY+Vs
         btLEshpM+Q7+0MSeGE1d02ijCnctVCHL6oCgyiKJoK4ylLrTGENj7AutHScwTF2EaUP4
         KYyfj76ExsY9dUeSaulmKw1H7hEwbd5PeAsSbn/9OkyxtBDqDSZPfXs8K6avh0KIrMcv
         Kea5Ka49BBaIyqoeGynSKqbGs0SGnkUvXBiUrodJGFr1unqRwZbMEQ6SauafBlrwd3ty
         pPaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743094352; x=1743699152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0U9geEjGC1dSN0o/JPxh2M8Qsd9akqfHr698kSw5Itk=;
        b=miH9vRvn8aBmUNr1gCwMcSgmvRVvZzoDxZaiZvRdjG6+dvXWcFEF+hv2ZVmkiykAuI
         3Wpc4fnqu4rne/6XCopgTDtIbQ4MHYkWWxnHD1vLdQv8ntxZcXQO224BoLMjLfy7ZhAG
         xq7Y3ftizvwHEFPCxAP1MXZmx6MehzQuWmZ456SPAxMGmY4OhRn/EzxDDrtr/omTxJ1a
         Xmm4Hw9hmdeHjW9SzpZDWgm9zT5mVhqMy7iMQ9TiLofZrR4d/TMPLLgfV5JLXiuGX8jV
         H3Wcg4lRNEPj0usC7evxQWNhFEeK+0Ua50e5qc7fUowA392Ju/tRcuwS7HXjUSEXPTkK
         UlRg==
X-Forwarded-Encrypted: i=1; AJvYcCXXEAZdXDLzRm9p5UgYGSRtANNjoYrCl3JXHgUPW24ZtZW/MwvR7pQchJFVNe97M5IjBPqLTv2qf4AsSpc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAdVohsFzHEfChVGbZklBn+EDd8N5gFQyyysy1SWwDpV6lhQ8D
	+pVpZhkKGPwMxoX9bnURzGP4euey5MQwlD3mGaj0WBXKWn5EaPs8R0NbDmnUxAugwNPZZmYZfLd
	W9IhOSU7BeBcAiVuQHOLWDPlBwfc=
X-Gm-Gg: ASbGncvOMo9ITfoLFpwklIE2C/oOnl7sHTQG6cf34lxe0mh64GFsqkM9jGQRTNsLziA
	dunMyAThJaTNmbDioEOZRfSSdoYXdVhrYqqumMhCcBvYCCOHtBuWHvfiHiYfgJ7kJGNm17WFrb8
	JJZaRKnve1SANinVQK6fKnBo07tTbbA1DZIM3oVyjtBU1mdBNomkDo0PrX
X-Google-Smtp-Source: AGHT+IGCz09iVTGSPqqF1CqBF3FJzQoNxDVcp1tO6jR5cZdlkxww/y+iDYhvmDIwk3NkuwM2baffknsAxRnZftPJMyQ=
X-Received: by 2002:a05:6122:3907:b0:520:51a4:b84f with SMTP id
 71dfb90a1353d-52600920c2cmr3889239e0c.4.1743094352260; Thu, 27 Mar 2025
 09:52:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327055607.3829954-1-chao@kernel.org>
In-Reply-To: <20250327055607.3829954-1-chao@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Thu, 27 Mar 2025 09:52:21 -0700
X-Gm-Features: AQ5f1JpoKRV12elFxx8bZoDusEy8_a4__lIWxXI51QMV49qwD_J8Hp6i152yLOg
Message-ID: <CACOAw_y1n9+_FmMZv20hNbP8pBWm4adC3qKQQom4_Wsx1qryrg@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to set atomic write status more clear
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, Zhiguo Niu <zhiguo.niu@unisoc.com>, 
	Daeho Jeong <daehojeong@google.com>, linux-kernel@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 26, 2025 at 10:59=E2=80=AFPM Chao Yu via Linux-f2fs-devel
<linux-f2fs-devel@lists.sourceforge.net> wrote:
>
> 1. After we start atomic write in a database file, before committing
> all data, we'd better not set inode w/ vfs dirty status to avoid
> redundant updates, instead, we only set inode w/ atomic dirty status.
>
> 2. After we commit all data, before committing metadata, we need to
> clear atomic dirty status, and set vfs dirty status to allow vfs flush
> dirty inode.
>
> Cc: Daeho Jeong <daehojeong@google.com>
> Reported-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/inode.c   | 4 +++-
>  fs/f2fs/segment.c | 6 ++++++
>  fs/f2fs/super.c   | 4 +++-
>  3 files changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> index 5c8634eaef7b..f5991e8751b9 100644
> --- a/fs/f2fs/inode.c
> +++ b/fs/f2fs/inode.c
> @@ -34,7 +34,9 @@ void f2fs_mark_inode_dirty_sync(struct inode *inode, bo=
ol sync)
>         if (f2fs_inode_dirtied(inode, sync))
>                 return;
>
> -       if (f2fs_is_atomic_file(inode))
> +       /* only atomic file w/ FI_ATOMIC_COMMITTED can be set vfs dirty *=
/
> +       if (f2fs_is_atomic_file(inode) &&
> +                       !is_inode_flag_set(inode, FI_ATOMIC_COMMITTED))
>                 return;
>
>         mark_inode_dirty_sync(inode);
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index dc360b4b0569..7c113b446f63 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -376,7 +376,13 @@ static int __f2fs_commit_atomic_write(struct inode *=
inode)
>         } else {
>                 sbi->committed_atomic_block +=3D fi->atomic_write_cnt;
>                 set_inode_flag(inode, FI_ATOMIC_COMMITTED);
> +
> +               /*
> +                * inode may has no FI_ATOMIC_DIRTIED flag due to no writ=
e
> +                * before commit.
> +                */
>                 if (is_inode_flag_set(inode, FI_ATOMIC_DIRTIED)) {
> +                       /* clear atomic dirty status and set vfs dirty st=
atus */
>                         clear_inode_flag(inode, FI_ATOMIC_DIRTIED);
>                         f2fs_mark_inode_dirty_sync(inode, true);
>                 }
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 9a42a1323f42..a5cc9f6ee16a 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -1532,7 +1532,9 @@ int f2fs_inode_dirtied(struct inode *inode, bool sy=
nc)
>         }
>         spin_unlock(&sbi->inode_lock[DIRTY_META]);
>
> -       if (!ret && f2fs_is_atomic_file(inode))
> +       /* if atomic write is not committed, set inode w/ atomic dirty */
> +       if (!ret && f2fs_is_atomic_file(inode) &&
> +                       !is_inode_flag_set(inode, FI_ATOMIC_COMMITTED))
>                 set_inode_flag(inode, FI_ATOMIC_DIRTIED);
>
>         return ret;
> --
> 2.49.0
>

Reviewed-by: Daeho Jeong <daehojeong@google.com>

Thanks.

>
>
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
