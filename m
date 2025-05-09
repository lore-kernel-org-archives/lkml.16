Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B0D4685
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 17:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746812109; cv=none; b=IG0oi9lhXjuyopzkcMAhwLhO0bPyINioGOgOBWHOX5POqa9e4+sEw0CCm5DQ/9MxZf14HXamSodwu7hMYINNFDhHG4YEj9lFyj6yFuh8cr2yFqT5GCi4gCmUoFw9+oiYpbUrkXhBI8k45h6140cY/5uSx3nVetg82dV22BBz0EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746812109; c=relaxed/simple;
	bh=nFA8q/7k4rbuXOOCNFlFZrISvXfNRK3RSo/BZ+UAKqs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZkRGssbZDPrmpXcb+vAKtcN73sY9Spw3+xY0LZmhjQwD7eUISjC+PjVLczjI0gRoghqJ4eP9uPUR/hQ3x3HOjuBWUNQPVsDRkVn+Fm6biOVeI77Prj8eHDnLoe35mo1yHdBLHvAiXWzsT0ASZCJk0dxO0YFXkXNziUjoPEC1UDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SCxR92vO; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SCxR92vO"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4774611d40bso18111cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 10:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746812104; x=1747416904; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CIkCe9tXdEfgYVe9tLomnSmEe3kS+xmHSnDX7Y3SnYM=;
        b=SCxR92vO5+r6u279SCsLUbwtuyFuIXLRISU2y+n8kLhUtIfU30N8jGgrrF9tydQSPD
         oi8wm+w9fPpxTMt6NQLnxMwnv22dgBfzZVAedfjzCSyoD7tqhjVOpJeCYgTHVTI4LS0m
         ZD+yQlIOFjoAk5LYunT5rbE5TgJ7tcjdSsJiI6PDV2QPB4J+ll0UDZzVg9UA+K83n71E
         CodH+jfDDXAGNvX+vAclBUM1v1iAe+MgG0BY6TZZ3pcpRQFpeCr1ym4HUfjFazNMtSYV
         8dqARBiSiPTq4ovu9LX4bhQQH5T33DXmD4+x4hQErPH7ifF7hzJsKOKUpu40WcfgLU9Y
         gOJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746812104; x=1747416904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CIkCe9tXdEfgYVe9tLomnSmEe3kS+xmHSnDX7Y3SnYM=;
        b=g50VDSz38kZOK6c6oOxA33n7ZzMrybrjCaTVb09KWp0BDRugnjYjpy9DYtVFFxiGpQ
         xyTh8YUKWZuY5yarsYvLtjNd4iua45+m+mj6EFYA0bMKnauDBYvyi6EdOpolOmBxHkWr
         hR6HCNwx7cDejI4ga4yyXuSEds973r5BrPpYHe4IbrCOL4Q7pFfuj2ndFb0QPSNjZMKe
         dtvVYq0k+D1MXqoSS7qmb0qI7gzrOTaX0mAZxMjpwkOhSc5vhBxD8X3ytUG+VK5MC8yN
         9F/EeWcglY8SjQVWjaLnCFjxJDDc7i6gfSIqVzEwpYfAzEMXsv1aY6J4eZyu5mKebQfe
         Bl4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVJZ7Cd/1sjsgegHeCzpKX71VtHsarJv7qvnzMXl0dg2luKLpdC/QDplNwMvIP1TABS9UCfBF06Rl+pPKo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJp4OOMlveLKm0zreop3oiOGT3I3SUbyoGpQf78HPitEpn2uVF
	ivEfIEBafT/7G8ticUWGGRcq0hsqZKZOx0eCCc4UUrXpqkrd/RqrGsXot/VWe6gxiJy0Lx+FGqJ
	PpwwHj65WrmJ4qQ17KkPwI94903NBPdN8KLDJ
X-Gm-Gg: ASbGncsZGAOXoD61WVXSxvaoj5269mT7NUxQsgqobzX5FeKgFCdnl8c+THYB0Y8cL1o
	p8eJoUMicTF51QMlnWikVNRniiz4PRHFpctzEzowPPzni0msmWvdckpVUO1S0EXTDQbnT1IvKMw
	MDEFL3W+30qx64FClaf37q
X-Google-Smtp-Source: AGHT+IH8Xy2HBEJ82GMCKTkv/CJFKbtHGcCHeTxlfIi1y+HIKKLDQPCnKjy8d4byjPN+TnQ6yRviiUQEKT470Rnq+sE=
X-Received: by 2002:ac8:5791:0:b0:467:84a1:df08 with SMTP id
 d75a77b69052e-49453cc119amr4308291cf.23.1746812103452; Fri, 09 May 2025
 10:35:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507175500.204569-1-00107082@163.com> <20250509055313.922707-1-00107082@163.com>
In-Reply-To: <20250509055313.922707-1-00107082@163.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 9 May 2025 10:34:52 -0700
X-Gm-Features: AX0GCFsrftStf3N1kFowX3FDWZVqX0vh6hL2IafetFBZ5KCFRTaNPIArfw3BkWQ
Message-ID: <CAJuCfpFVdg5HkW03ZLFTyPHghW7cmYX=mA1TDajqRy8A4as42A@mail.gmail.com>
Subject: Re: [PATCH 2/2] alloc_tag: keep codetag iterator cross read() calls
To: David Wang <00107082@163.com>
Cc: kent.overstreet@linux.dev, akpm@linux-foundation.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 8, 2025 at 10:53=E2=80=AFPM David Wang <00107082@163.com> wrote=
:
>
> When reading /proc/allocinfo, for each read syscall, seq_file would
> invoke start/stop callbacks. In start callback, a memory is alloced
> to store iterator and the iterator would start from beginning to
> walk to current read position.
>
> seq_file read() takes at most 4096 bytes, even if read with a larger
> user space buffer, meaning read out all of /proc/allocinfo, tens of read
> syscalls are needed. For example, a 306036 bytes allocinfo files need
> 76 reads:
>
>  $ sudo cat /proc/allocinfo  | wc
>     3964   16678  306036
>  $ sudo strace -T -e read cat /proc/allocinfo
>  ...
>  read(3, "        4096        1 arch/x86/k"..., 131072) =3D 4063 <0.00006=
2>
>  ...
>  read(3, "           0        0 sound/core"..., 131072) =3D 4021 <0.00015=
0>
>  ...
> For those n=3D3964 lines, each read takes about m=3D3964/76=3D52 lines,
> since iterator restart from beginning for each read(),
> it would move forward
>    m  steps on 1st read
>  2*m  steps on 2nd read
>  3*m  steps on 3rd read
>  ...
>    n  steps on last read
> As read() along, more iterator steps make read() calls slower and
> slower.  Adding those up, codetag iterator moves about O(n*n/m) steps,
> making data structure traversal take significant part of the whole readin=
g.
> Profiling when stress reading /proc/allocinfo confirms it:
>
>  vfs_read(99.959% 1677299/1677995)
>      proc_reg_read_iter(99.856% 1674881/1677299)
>          seq_read_iter(99.959% 1674191/1674881)
>              allocinfo_start(75.664% 1266755/1674191)
>                  codetag_next_ct(79.217% 1003487/1266755)  <---
>                  srso_return_thunk(1.264% 16011/1266755)
>                  __kmalloc_cache_noprof(0.102% 1296/1266755)
>                  ...
>              allocinfo_show(21.287% 356378/1674191)
>              allocinfo_next(1.530% 25621/1674191)
> allocinfo_start() takes about 75% of seq_read().
>
> A private data alloced at open() time can be used to carry iterator
> alive across read() calls, and avoid the memory allocation and
> iterator reset for each read(). This way, only O(1) memory allocation
> and O(n) steps iterating, and `time` shows performance improvement
> from ~7ms to ~4ms.
> Profiling with the change:
>
>  vfs_read(99.865% 1581073/1583214)
>      proc_reg_read_iter(99.485% 1572934/1581073)
>          seq_read_iter(99.846% 1570519/1572934)
>              allocinfo_show(87.428% 1373074/1570519)
>                  seq_buf_printf(83.695% 1149196/1373074)
>                  seq_buf_putc(1.917% 26321/1373074)
>                  _find_next_bit(1.531% 21023/1373074)
>                  ...
>                  codetag_to_text(0.490% 6727/1373074)
>                  ...
>              allocinfo_next(6.275% 98543/1570519)
>              ...
>              allocinfo_start(0.369% 5790/1570519)
>              ...
> allocinfo_start taks less than 1%.
>
> Signed-off-by: David Wang <00107082@163.com>

I think you will be posting another version to address comments in the
first patch, but for this patch feel free to add:

Acked-by: Suren Baghdasaryan <surenb@google.com>

Thanks!

> ---
>  lib/alloc_tag.c | 29 ++++++++++-------------------
>  1 file changed, 10 insertions(+), 19 deletions(-)
>
> diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
> index 25ecc1334b67..fdd5887769a6 100644
> --- a/lib/alloc_tag.c
> +++ b/lib/alloc_tag.c
> @@ -45,21 +45,16 @@ struct allocinfo_private {
>  static void *allocinfo_start(struct seq_file *m, loff_t *pos)
>  {
>         struct allocinfo_private *priv;
> -       struct codetag *ct;
>         loff_t node =3D *pos;
>
> -       priv =3D kzalloc(sizeof(*priv), GFP_KERNEL);
> -       m->private =3D priv;
> -       if (!priv)
> -               return NULL;
> -
> -       priv->print_header =3D (node =3D=3D 0);
> +       priv =3D (struct allocinfo_private *)m->private;
>         codetag_lock_module_list(alloc_tag_cttype, true);
> -       priv->iter =3D codetag_get_ct_iter(alloc_tag_cttype);
> -       while ((ct =3D codetag_next_ct(&priv->iter)) !=3D NULL && node)
> -               node--;
> -
> -       return ct ? priv : NULL;
> +       if (node =3D=3D 0) {
> +               priv->print_header =3D true;
> +               priv->iter =3D codetag_get_ct_iter(alloc_tag_cttype);
> +               codetag_next_ct(&priv->iter);
> +       }
> +       return priv->iter.ct ? priv : NULL;
>  }
>
>  static void *allocinfo_next(struct seq_file *m, void *arg, loff_t *pos)
> @@ -76,12 +71,7 @@ static void *allocinfo_next(struct seq_file *m, void *=
arg, loff_t *pos)
>
>  static void allocinfo_stop(struct seq_file *m, void *arg)
>  {
> -       struct allocinfo_private *priv =3D (struct allocinfo_private *)m-=
>private;
> -
> -       if (priv) {
> -               codetag_lock_module_list(alloc_tag_cttype, false);
> -               kfree(priv);
> -       }
> +       codetag_lock_module_list(alloc_tag_cttype, false);
>  }
>
>  static void print_allocinfo_header(struct seq_buf *buf)
> @@ -249,7 +239,8 @@ static void __init procfs_init(void)
>         if (!mem_profiling_support)
>                 return;
>
> -       if (!proc_create_seq(ALLOCINFO_FILE_NAME, 0400, NULL, &allocinfo_=
seq_op)) {
> +       if (!proc_create_seq_private(ALLOCINFO_FILE_NAME, 0400, NULL, &al=
locinfo_seq_op,
> +                                    sizeof(struct allocinfo_private), NU=
LL)) {
>                 pr_err("Failed to create %s file\n", ALLOCINFO_FILE_NAME)=
;
>                 shutdown_mem_profiling(false);
>         }
> --
> 2.39.2
>
