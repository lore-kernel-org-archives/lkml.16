Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D092571BA
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 21:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751406804; cv=none; b=Y3VWntiVLvQnxyRRvKIybG0Lz1j7OdUO4ILkMmRuSX6lw7ECLeExz4575wAsoqXch7DrEHvHyivuJ1bfQ+f81sCpZiYicRni13fHgQn5CJBFkbYmL+3wSUW4Wsl8oK6BP9CCnkGjPXLFG8Q2xcpO+gl8aJBAlm2nQhtRfoSpvos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751406804; c=relaxed/simple;
	bh=76HcKGmFmNghBO+pMyD+y9llS/oRUsyq25HSfeg328g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EiwIKFGym1wyN2rkw0AqMffZ4J7N6ByuwrKOX4NA3lxdRP4PU9YNvLGZAo7cU7r2cQivX4aHvFo5IXSdFlYJkRo9rHWrgsirEpqetqVGv6OVh6nT0m5ruJZsWw0aG+IxzgxfD3fB9EyA8YMrxNe1/91X2BBB06zjZXn4m6+68wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AsEZnSE6; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AsEZnSE6"
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-87f0ac304f0so1466659241.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 14:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751406801; x=1752011601; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h9Tw5T21oTt8VFmq/0NfB5MMfCxNURL8ZSaWZPOqLE4=;
        b=AsEZnSE6zMHME36FcBn+jkwRR6UgpbVAUySU1ntf+Hwz2jIJIpYIdrAkpyCVoudBUD
         nsDLM7gfX/t7O/uwQcofhL4arRaNcTpTb4fcfy7WOVbLs/YS+8BdiSPEYkkY9ormRDdD
         XP0ejjE2sj6jatctWzarjA4fggBzjFFjj6USxJLjrYouZ3i5wR3L4yxMSNMQ3INTD1fS
         S5SDJsmtRO9BcUOp1m33HKdWzdG8lHsDSRmumBJ3d6CD0OXuwcxz8PmTQaXGFqX28WBn
         t2Y9pa35VPJ3mSkzb4arFlZJzQ0OqXa6Ck3XCmb7xtnPLmrhHdkZRxE1U3TiXQD0hJ9J
         TVLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751406801; x=1752011601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h9Tw5T21oTt8VFmq/0NfB5MMfCxNURL8ZSaWZPOqLE4=;
        b=MN28+qyB8TquxiAen3cpK/JkTr/OHv9HwhoSjU6Ly4EmLtpqLKz6xABIrjlVCI6O+t
         HVJdEWs8rHFXe2/IG1RkiYwDt2J4iaBNwqLFAb2Wql9ZwlX7vibYfmcSuo5lfGdrmaLb
         V3oRuAsy2zG0pcfy1B/PqLwwyVkMZjXzcG9l2iZjjTtGaw2Xzy/ZiYuoVHxJq+RNdxb+
         Rz3bGoZf5s6rp/5UNxu7GwhwDvHReGtWF/uQXfPtbaI30aNeqHNjeTFSj975qka5rEfS
         QnzxJsRNM73EPHBU+7PXkFkfYTIsBBSY8WyNND26iHgkHMhVJJsRLdjW43TfjOkr3pED
         eEwg==
X-Forwarded-Encrypted: i=1; AJvYcCVLUai4ZReNiAwdek7gIo49B/5LlbjzK6Nv49D6m3Y8l9mM42pdms4Uf/2QrU4RrVDt4i8+3Lt6dizimGc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUIpGo1PqENWvr+4Otjr+4AY9te4lGvXOozsxykwr738N119Hr
	TDgQLgqgdEsLS4p6MOtI9iA+1rkSjf6P16eVO4NzKtaYbDWGkN2ndExeOhi686VOPm4PHnGnHHW
	ZCoGe/JBO/vzj5+mI/924OHjiJx+t2A4=
X-Gm-Gg: ASbGnct46Yc+UzRHjltNVclxUDaaGJh53X5Bv9xax/9nrLtSVL4tVXC0KWvH87lf3UC
	+3dzmp13OxUKwBFjwnira3Mgiul08z6R3EM7By8y5uAvyI4RZuOtq/qpoFHyv4IQdooJt3pjHEV
	Esy3M+Wx59X1jydTK40wE+9jTD7fn9tbgO2q/KJjEIK8wr2Extm6KaNVjJpmtp+zmpSLxkZL2Tl
	o7K/Q==
X-Google-Smtp-Source: AGHT+IHgW+audA3TQkHOsNiNO4Y5C7I1as+sT+lATM9JGrS7qA3IEYv2HU03AtfN1AT94Uq8BWvGQ4u89P5wuKzlRag=
X-Received: by 2002:a05:6102:c4d:b0:4e6:67f6:e9af with SMTP id
 ada2fe7eead31-4f161114e02mr109275137.9.1751406801281; Tue, 01 Jul 2025
 14:53:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250629204215.1651573-1-abinashsinghlalotra@gmail.com> <5e67d651-830a-4d99-af37-26f2d0efd640@vates.tech>
In-Reply-To: <5e67d651-830a-4d99-af37-26f2d0efd640@vates.tech>
From: Abinash <abinashlalotra@gmail.com>
Date: Wed, 2 Jul 2025 03:23:09 +0530
X-Gm-Features: Ac12FXxWN99Do6-y4I8RTPnx1rDO_yZT307Qk4LLSGsNZ3LC714vlUwHM9tF1aQ
Message-ID: <CAJZ91LC610AsBZ8X3u8ZxAUhc6QT0FHeffQT0ARmnMgsGrdZQQ@mail.gmail.com>
Subject: Re: [RFC PATCH] xen/gntdev: reduce stack usage by dynamically
 allocating gntdev_copy_batch
To: Tu Dinh <ngoc-tu.dinh@vates.tech>
Cc: jgross@suse.com, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com, 
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
	Abinash Singh <abinashsinghlalotra@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi ,

Thanks for pointing that out.

I haven=E2=80=99t measured the performance impact yet =E2=80=94 my main foc=
us was on
getting rid of the stack usage warning triggered by LLVM due to
inlining. But you're right, gntdev_ioctl_grant_copy() is on a hot
path, and calling kmalloc() there could definitely slow things down,
especially under memory pressure.

I=E2=80=99ll run some benchmarks to compare the current approach with the
dynamic allocation, and also look into alternatives =E2=80=94 maybe
pre-allocating the struct or limiting inlining instead. If you have
any ideas or suggestions on how best to approach this, I=E2=80=99d be happy=
 to
hear them.

Do you have any suggestions on how to test the performance?

Best,
Abinash


On Mon, 30 Jun 2025 at 16:05, Tu Dinh <ngoc-tu.dinh@vates.tech> wrote:
>
> Hi,
>
> On 30/06/2025 06:54, Abinash Singh wrote:
> > While building the kernel with LLVM, a warning was reported due to
> > excessive stack usage in `gntdev_ioctl`:
> >
> >       drivers/xen/gntdev.c:991: warning: stack frame size (1160) exceed=
s limit (1024) in function 'gntdev_ioctl'
> >
> > Further analysis revealed that the large stack frame was caused by
> > `struct gntdev_copy_batch`, which was declared on the stack inside
> > `gntdev_ioctl_grant_copy()`. Since this function was inlined into
> > `gntdev_ioctl`, the stack usage was attributed to the latter.
> >
> > This patch fixes the issue by dynamically allocating `gntdev_copy_batch=
`
> > using `kmalloc()`, which significantly reduces the stack footprint and
> > eliminates the warning.
> >
> > This approach is consistent with similar fixes upstream, such as:
> >
> > commit fa26198d30f3 ("iommu/io-pgtable-arm: dynamically allocate selfte=
st device struct")
> >
> > Fixes: a4cdb556cae0 ("xen/gntdev: add ioctl for grant copy")
> > Signed-off-by: Abinash Singh <abinashsinghlalotra@gmail.com>
> > ---
> > The stack usage was confirmed using the `-fstack-usage`  flag and mannu=
al analysis, which showed:
> >
> >    drivers/xen/gntdev.c:953: gntdev_ioctl_grant_copy.isra   1048 bytes
> >    drivers/xen/gntdev.c:826: gntdev_copy                     56 bytes
> >
> > Since `gntdev_ioctl` was calling the inlined `gntdev_ioctl_grant_copy`,=
 the total
> > frame size exceeded 1024 bytes, triggering the warning.
> >
> > This patch addresses the warning and keeps stack usage within acceptabl=
e limits.
> > Is this patch fine or kmalloc may affect performance ?
> > ---
>
> Have you measured the performance impact? gntdev_ioctl_grant_copy is
> called quite often especially by the backend. I'm afraid calling the
> allocator here may cause even more slowdown than there already is,
> especially when memory is tight.
>
> >   drivers/xen/gntdev.c | 24 +++++++++++++++---------
> >   1 file changed, 15 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/xen/gntdev.c b/drivers/xen/gntdev.c
> > index 61faea1f0663..9811f3d7c87c 100644
> > --- a/drivers/xen/gntdev.c
> > +++ b/drivers/xen/gntdev.c
> > @@ -953,15 +953,19 @@ static int gntdev_grant_copy_seg(struct gntdev_co=
py_batch *batch,
> >   static long gntdev_ioctl_grant_copy(struct gntdev_priv *priv, void __=
user *u)
> >   {
> >       struct ioctl_gntdev_grant_copy copy;
> > -     struct gntdev_copy_batch batch;
> > +     struct gntdev_copy_batch *batch;
> >       unsigned int i;
> >       int ret =3D 0;
> >
> >       if (copy_from_user(&copy, u, sizeof(copy)))
> >               return -EFAULT;
> > -
> > -     batch.nr_ops =3D 0;
> > -     batch.nr_pages =3D 0;
> > +
> > +     batch =3D kmalloc(sizeof(*batch), GFP_KERNEL);
> > +     if (!batch)
> > +             return -ENOMEM;
> > +
> > +     batch->nr_ops =3D 0;
> > +     batch->nr_pages =3D 0;
> >
> >       for (i =3D 0; i < copy.count; i++) {
> >               struct gntdev_grant_copy_segment seg;
> > @@ -971,18 +975,20 @@ static long gntdev_ioctl_grant_copy(struct gntdev=
_priv *priv, void __user *u)
> >                       goto out;
> >               }
> >
> > -             ret =3D gntdev_grant_copy_seg(&batch, &seg, &copy.segment=
s[i].status);
> > +             ret =3D gntdev_grant_copy_seg(batch, &seg, &copy.segments=
[i].status);
> >               if (ret < 0)
> >                       goto out;
> >
> >               cond_resched();
> >       }
> > -     if (batch.nr_ops)
> > -             ret =3D gntdev_copy(&batch);
> > -     return ret;
> > +     if (batch->nr_ops)
> > +             ret =3D gntdev_copy(batch);
> > +     goto free_batch;
> >
> >     out:
> > -     gntdev_put_pages(&batch);
> > +     gntdev_put_pages(batch);
> > +  free_batch:
> > +     kfree(batch);
> >       return ret;
> >   }
> >
>
>
>
> Ngoc Tu Dinh | Vates XCP-ng Developer
>
> XCP-ng & Xen Orchestra - Vates solutions
>
> web: https://vates.tech
>
