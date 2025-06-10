Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E694A246BAC
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 16:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749572547; cv=none; b=uVi7RUO90UfhvpBD61/BpwOF7qCyJBj2AnOOxsyMi3cwulhq7AhsOVk8bARDjmK1CdO5Srqn6DvVpdUNw9WPJTRUOQsfaaqOGlzHVw4o7RhOipVd8uNz/q1G/NSD0EprEDVaivWMRo1RqqwZI6PpqPWG2hL2fGG0g/QjyKZSQd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749572547; c=relaxed/simple;
	bh=TeFie7XpjefR9/hzLKNgwm5I8vYcioSUn0q/Z5IJ6Ao=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MvLMBWm91tv07r33zSKgCLlbMmOAL4BL6p2N12UzhguMVeewZ0uTBmtX789YWT4gxVYvFlWHIihIbjdXzsWlxbrId6rzwq/+idt0SpERQzldCvBIDMpjkty+q12lbQKZdPF9HXDtDomVV2N7UPW8BrCZa8QOljGYssa62fUl7uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QQDEhiWN; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QQDEhiWN"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-47e9fea29easo419191cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749572545; x=1750177345; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V8y4bUGFW3ER8Vec5YaUnTQ0YiLvoztT4ZyhgoavBc4=;
        b=QQDEhiWN8kvNC/gnl5zkJU8F4nWUBBLgNUTStIT3eIWvXOswtW4nn620VkcEihrvwH
         JSSnXoZfSzSfdldYpuNq/0fs9HOmgMWO7Pgg8xs+bwPCBPi3KUmkDB1QxC7Mq391jBUV
         veLUs3TEs9pHUbWC0z8nzzoVykfDARNU0+kmbzyItEu/smjDy/yqlRB/4nY8uaywkR3F
         mEL8M03ChfUZoji6ML67sSMtAb1CYo8y6ztCIdl31+l77Xk6IYigQ76ePwkY0KUT+oQj
         T16flEGyWjmJPM4JUaOsKb5CyqlALV89c2Ia0yNjQdwFUleeVZSeQwJA8mJ7nv2m2dTf
         uLBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749572545; x=1750177345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V8y4bUGFW3ER8Vec5YaUnTQ0YiLvoztT4ZyhgoavBc4=;
        b=RZWtdOsJiaHDsRSrjc9RudzJ2vP0rySpaFfeHs/+ynx/rXH1BxHg0/wWrR7QjAZ8YZ
         Zx3HDzuNa1u4JpdSbzWcTI1Kv/PSDB48zzV37VSP4lVbouSjZcLS0CMrNmP16bQWcptD
         SZKVuk9QIW5IHZGNviQBdSz26NBOcU5iwVGul+BVUti1+4/Z1NCuN9mNjJ7j+UGoE9sh
         MzY98KE/N23gqZx2kTnCWD9hfxsUcPlqCkJxs/9IndlKOr39GxQ7c7Ony9lIrSIEqPuI
         G1GZXRXdPeqwcr+QxHPOQZOTl37BNQqaVlFosiszsJgYBJ/MglQtCW3dhGbTjMHeM0O9
         FrUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoTsbcW2lWikozexy6+ejM9/0TUxdsMAABN2V342pZwRQI7ihBB6ZFDUa+iTjouHF+OMgYgAsbPZ2vhHg=@vger.kernel.org
X-Gm-Message-State: AOJu0YytVW9uXERIEvvL5S0uLDDZx51iUV7NlqmVoEyK6uTSAaZUUqIw
	5y2EoozSkWTbRRx37by9t1nhTFMl2kuSP3+VyjTd1GBbD2FUAT2xH6BFFicZ2FgP8nEsfS1KX18
	koBPlwA9s0s/hNQ5XrzToYdUePlruyZ+igEwNZLt6
X-Gm-Gg: ASbGncvg6vMc5LTUwbVqZ9Sw47VMCCBDpOdByfO8gbWVwz3oZQ2G8ox1iYbTPV5bsch
	5zmclm+mrATDAa/wCzOgYmm8LuJ7ijeyjnT7MWcBvX9DQdY9AN8dSf0aSDXBCMkN9NhbDo32YDv
	9Whcpualub47ei7zMxn2MHQAMw8uZojt1KKPGeQkaoV09YrFwoaxLrmTJzjN6KiD5hjr4Wnulwj
	g==
X-Google-Smtp-Source: AGHT+IErqFeDSfBZgs8bU2k70ckNfvJj8r98YJGIecrFAiCd/rN4CexeGxiuaspBoLxn01MG7UEu78n55YDsLpKNYDw=
X-Received: by 2002:a05:622a:2cf:b0:47b:3a5:8380 with SMTP id
 d75a77b69052e-4a71390e6b9mr160671cf.28.1749572544328; Tue, 10 Jun 2025
 09:22:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJuCfpE670s5=QAbuqCLB3XuOkfL=L44r93cwJdrhHn=bYNd-Q@mail.gmail.com>
 <20250609064408.112783-1-00107082@163.com>
In-Reply-To: <20250609064408.112783-1-00107082@163.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 10 Jun 2025 09:22:13 -0700
X-Gm-Features: AX0GCFvQjuVvloaCP37nnFWiDtpxNgvRqAVEa1oqWuQZZ3ju_aP_G8H3rYFscV4
Message-ID: <CAJuCfpGEGnR=4C1T2bH=QcY24cH+RQa+n5Yn41NHtnJF9Mfspg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] alloc_tag: keep codetag iterator active between read()
To: David Wang <00107082@163.com>
Cc: tim.c.chen@linux.intel.com, kent.overstreet@linux.dev, 
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 8, 2025 at 11:44=E2=80=AFPM David Wang <00107082@163.com> wrote=
:
>
> When reading /proc/allocinfo, for each read syscall, seq_file would
> invoke start/stop callbacks. In start callback, a memory is alloced
> to store iterator and the iterator would start from beginning to
> walk linearly to current read position.
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
> As read() along, those linear seek steps make read() calls slower and
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
> codetag_next_ct() takes major part.
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
> Now seq_buf_printf() takes major part.
>
> Signed-off-by: David Wang <00107082@163.com>

Acked-by: Suren Baghdasaryan <surenb@google.com>


> ---
> Changes since v2:
> Rebase to 6.16-rc1, resolve conflicts.
> ---
>  lib/alloc_tag.c | 29 ++++++++++-------------------
>  1 file changed, 10 insertions(+), 19 deletions(-)
>
> diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
> index d48b80f3f007..ac7e50b41b6a 100644
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
> @@ -811,7 +801,8 @@ static int __init alloc_tag_init(void)
>                 return 0;
>         }
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
>                 return -ENOMEM;
> --
> 2.39.2
>
