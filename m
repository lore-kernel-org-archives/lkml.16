Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C721C259CBB
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 12:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746015163; cv=none; b=OK6WZ2n8qS0PcMf7f8FzSCgpnxFuG3CF1nfeJ4k5FtVBWRhxmzqSCThjH0W8IwQabiv6UzibHFz+EV5iUL6gi4x+g1O5qkSX5p9Qx5MBiSI36ZiXt/oiEBVnwlnbzag9PxenQNuXk+fjbnimo/yXsw56G4YHxFKjWxXlWlYsK4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746015163; c=relaxed/simple;
	bh=QiFE57zyx6kmjXiSN4/oHw9/UfRS+tfM4wy66RCOdrs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OjX8JI31jUzVpZfBhJ/f3YlxEdG1ZazZ2Hgr1LTlLZFoqBcOMwQI2K4h32pjzGlpcy5d2J+Ky9bWAj+ElFPrUYUqMR6N8bV/n5i+0Sno3R9NxnQV1uow7jyKMUJbTReajSopVcnJ7doFaMB1bVMLrt7oiCxFm8Jypg86Gube6HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C+3JpQdK; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C+3JpQdK"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac25d2b2354so1094853266b.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 05:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746015160; x=1746619960; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bw5vuERICCQaAaztVYNub3Fq870dmKKXz2A+Vw1GzLE=;
        b=C+3JpQdKyNMU8tqXWq7fJIrOosbPBqu2wn6HfO8ikS3fZ4SaxiWaXlKwYQjWcVqxvW
         2gB0cQzz8QS7sUBJC7tC0vhQ+SBt2BA9zBXPC9bOUNHY7Gx8iRAPi+M0FI7lFybaZ5e9
         H7x98Feuv1BAu7CLMGl0QSzgwPdzxbYMngUUsetIBBq/xyTq66mTTiJXr+gmd+FTnIzk
         HUF/lCcE7209kXTYQMlim30My/3LYXtTHGnVVI0LnUK7LAZkLbx5F3120OGN/jHpRHmm
         IZsCipzGyDzwT2BE/wRU81CLO+1uMYkb292sRlDpYpvjFULMDwPUvp4FyPQmRYGFWDS8
         nNFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746015160; x=1746619960;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bw5vuERICCQaAaztVYNub3Fq870dmKKXz2A+Vw1GzLE=;
        b=Ki7FagO9kOVWTH1QJlnSZPJdfUGfuZlQnNFuUbbcbsxjW/Rb9i3Z9GRxcyXwKydd8G
         ILdyzKAhg3BQdeqgQocblA32+QzLjEanEt6ANA7ZkoFyGG2/mBoRwajTwYB8qhwZJfaT
         fRl8/5iIr+P51SFeYl5X3Qx4XTuLDhi3Vh1s08o5L6vonToOB03lnz5ueKGxk2B/Ph1n
         pjDT4oW8a9hXEZ5evA8BkTk1zo7LGest2RHZksfR47ZVSe5TnWYdOPmo46f+ttxtPH2H
         6IlB/NSIMt5ZfMhXUTV0YsKiml3JhztK34ViRuArE/AeZ7An84172EHS3w34LJHaYNZ3
         CUDg==
X-Forwarded-Encrypted: i=1; AJvYcCXEr6C+0pAmMs5gFH6Ni5s55nhBYgm+2SNSoKug/U0qb46CUjVTYcg74Qw+s1Qp9pVRuRigS5LP4r15Co4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhSagWkEl8L0kGMGY6N68Fd0QNW2N3bAX2wFKui+BXrhyx/Vjo
	dlfINYRn/XWFQw8JpawMG93PA2gTNBrI7x/k8CwJXjji8MAX5MxApw+dWOL0ABKKknPt3jojzHq
	Z08A7+yGJcmQ7iTfPpaPEBM2kwfGzs1GsXmDPnQ==
X-Gm-Gg: ASbGncuKSfBrv7ZScIUiXAeFskAK54eRcrxnxAXCozqpp+Szv+QZiPrJ5GV1f//2AGN
	bMuEAsj66WC5uA2Plfa3uiMFZp+jrdXQKpClEPe9i7KZiGip6IbKYNEccwcJvzCd+Iiib7/qk2d
	eHje6AqFho2hmDBUhPUHnk7gVCGz59avaUxwjE4s242KmTTlRn7kKpMg==
X-Google-Smtp-Source: AGHT+IEBVMXhh9O68BsmwiGuVRDwFqgaRwRx3WWJWKtbEdBnrWBtuHEntXm1t41yUiPtsDukCLWcJeDZW/ap4XicZtU=
X-Received: by 2002:a17:907:7d86:b0:ac7:3817:d8da with SMTP id
 a640c23a62f3a-acedc762e3bmr301811066b.52.1746015159919; Wed, 30 Apr 2025
 05:12:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428-tee-sizecheck-v1-1-5c3c25a2fa79@google.com> <CAHUa44E_JZdYnGrReP0zWCP1wdu2BdJ9DSZZ3a2OiobRj61ThQ@mail.gmail.com>
In-Reply-To: <CAHUa44E_JZdYnGrReP0zWCP1wdu2BdJ9DSZZ3a2OiobRj61ThQ@mail.gmail.com>
From: Rouven Czerwinski <rouven.czerwinski@linaro.org>
Date: Wed, 30 Apr 2025 14:12:28 +0200
X-Gm-Features: ATxdqUGnAbXl5wqnE5WEVJ_UQiM-RMiem7NwvrC5SiRxCziM9qBoRHZIDqAo6Pc
Message-ID: <CAK8z29XWCujUdLXcHz075+xcix8HV2Mp3EtxxX9GB7vGjwi3HA@mail.gmail.com>
Subject: Re: [PATCH] tee: Prevent size calculation wraparound on 32-bit kernels
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: Jann Horn <jannh@google.com>, Sumit Garg <sumit.garg@kernel.org>, 
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, 30 Apr 2025 at 13:53, Jens Wiklander <jens.wiklander@linaro.org> wr=
ote:
>
> On Mon, Apr 28, 2025 at 3:06=E2=80=AFPM Jann Horn <jannh@google.com> wrot=
e:
> >
> > The current code around TEE_IOCTL_PARAM_SIZE() is a bit wrong on
> > 32-bit kernels: Multiplying a user-provided 32-bit value with the
> > size of a structure can wrap around on such platforms.
> >
> > Fix it by using saturating arithmetic for the size calculation.
> >
> > This has no security consequences because, in all users of
> > TEE_IOCTL_PARAM_SIZE(), the subsequent kcalloc() implicitly checks
> > for wrapping.
> >
> > Signed-off-by: Jann Horn <jannh@google.com>
> > ---
> > Note that I don't have a test device with a TEE; I only compile-tested
> > the change on an x86-64 build.
> > ---
> >  drivers/tee/tee_core.c | 11 ++++++-----
> >  1 file changed, 6 insertions(+), 5 deletions(-)
>
> Looks good, I'm picking up this.
>
> Thanks,
> Jens
>
> >
> > diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> > index d113679b1e2d..acc7998758ad 100644
> > --- a/drivers/tee/tee_core.c
> > +++ b/drivers/tee/tee_core.c
> > @@ -10,6 +10,7 @@
> >  #include <linux/fs.h>
> >  #include <linux/idr.h>
> >  #include <linux/module.h>
> > +#include <linux/overflow.h>
> >  #include <linux/slab.h>
> >  #include <linux/tee_core.h>
> >  #include <linux/uaccess.h>
> > @@ -19,7 +20,7 @@
> >
> >  #define TEE_NUM_DEVICES        32
> >
> > -#define TEE_IOCTL_PARAM_SIZE(x) (sizeof(struct tee_param) * (x))
> > +#define TEE_IOCTL_PARAM_SIZE(x) (size_mul(sizeof(struct tee_param), (x=
)))
> >
> >  #define TEE_UUID_NS_NAME_SIZE  128
> >
> > @@ -487,7 +488,7 @@ static int tee_ioctl_open_session(struct tee_contex=
t *ctx,
> >         if (copy_from_user(&arg, uarg, sizeof(arg)))
> >                 return -EFAULT;
> >
> > -       if (sizeof(arg) + TEE_IOCTL_PARAM_SIZE(arg.num_params) !=3D buf=
.buf_len)
> > +       if (size_add(sizeof(arg), TEE_IOCTL_PARAM_SIZE(arg.num_params))=
 !=3D buf.buf_len)
> >                 return -EINVAL;
> >
> >         if (arg.num_params) {
> > @@ -565,7 +566,7 @@ static int tee_ioctl_invoke(struct tee_context *ctx=
,
> >         if (copy_from_user(&arg, uarg, sizeof(arg)))
> >                 return -EFAULT;
> >
> > -       if (sizeof(arg) + TEE_IOCTL_PARAM_SIZE(arg.num_params) !=3D buf=
.buf_len)
> > +       if (size_add(sizeof(arg), TEE_IOCTL_PARAM_SIZE(arg.num_params))=
 !=3D buf.buf_len)
> >                 return -EINVAL;
> >
> >         if (arg.num_params) {
> > @@ -699,7 +700,7 @@ static int tee_ioctl_supp_recv(struct tee_context *=
ctx,
> >         if (get_user(num_params, &uarg->num_params))
> >                 return -EFAULT;
> >
> > -       if (sizeof(*uarg) + TEE_IOCTL_PARAM_SIZE(num_params) !=3D buf.b=
uf_len)
> > +       if (size_add(sizeof(*uarg), TEE_IOCTL_PARAM_SIZE(num_params)) !=
=3D buf.buf_len)
> >                 return -EINVAL;
> >
> >         params =3D kcalloc(num_params, sizeof(struct tee_param), GFP_KE=
RNEL);
> > @@ -798,7 +799,7 @@ static int tee_ioctl_supp_send(struct tee_context *=
ctx,
> >             get_user(num_params, &uarg->num_params))
> >                 return -EFAULT;
> >
> > -       if (sizeof(*uarg) + TEE_IOCTL_PARAM_SIZE(num_params) > buf.buf_=
len)
> > +       if (size_add(sizeof(*uarg), TEE_IOCTL_PARAM_SIZE(num_params)) >=
 buf.buf_len)
> >                 return -EINVAL;
> >
> >         params =3D kcalloc(num_params, sizeof(struct tee_param), GFP_KE=
RNEL);
> >
> > ---
> > base-commit: b4432656b36e5cc1d50a1f2dc15357543add530e
> > change-id: 20250428-tee-sizecheck-299d5eff8fc7
> >
> > --
> > Jann Horn <jannh@google.com>
> >

I ran this through the arm32 qemu virt machine to test my new development s=
etup,
so:

Tested-by: Rouven Czerwinski <rouven.czerwinski@linaro.org>

Best regards,
Rouven
