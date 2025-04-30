Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48726224AFA
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 13:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746018034; cv=none; b=OdVB23MpFlzCe2jJGRGm5AAvqvPoUwVtZDCbSePNyTX2bbwGlHTpC/k2z2Gd6Ws5QazpOseZp7pN6KKxw/rojcWqnhA2+ciuBKOmY5wYgFqAQ4jA4io5aMrTNq/oowDXaDvXdMcchaeXYGbyUkGwO3sHg0ErU48wl3y0OlfuFvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746018034; c=relaxed/simple;
	bh=/sC3mezOh/HScYyAfhDsbkqRdSSIpnnCJ4mzorawo0o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pX1u9LeVZeGbXVYg2M6Tcybde7nSwXm6YbOQSx+YrnZK1qDaO/PZ3G6oD6FzToyYolZnEAVqR28QevjSfvgxBhWm9TsBwx8IFi7JRT0GXkQ3t4NeKVr8EG75+teNQ13Amlv4Qy56+ya1wIz3xeOSTU+ZPBKkq5W8XenDtR8KG6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WWL/k4yE; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WWL/k4yE"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-2d4e91512b4so4490321fac.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 06:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746018031; x=1746622831; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CnzE9LJSB9eDmDnjiyyOnm2Ka7IjVIS31O3Z/WOAwPw=;
        b=WWL/k4yETC9qDJ+aDNX/QgfU637qbfjscgXKgzMIoPEDaRiX2vzMj2A7B9HfOapMkH
         6qrAK7MyxGB0UoIdEaWmcaWbl7GHKAhLAxZa+HLbdS1pVhK1iIbdS32VR19vKetIiZ+n
         y5Pko9ztf6NS0lLOQjXajd7urlulL3rb7nKQhPf4wfg4AYfao9ArGbmHYP5l423/LGyM
         nvUWb8YJ4AJnyMiUwgEkDRjH5+DYKnIUyT8SiwQZf2rWvP3sSYaOKoO1SHaSz+d6amCX
         7eS5jgAGOAPR+aU1sP9LxZlMAvX6PHS/Hj24Ddjxsb6S1EhCKu+/KIU7jE6V8mqH8AeH
         P2UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746018031; x=1746622831;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CnzE9LJSB9eDmDnjiyyOnm2Ka7IjVIS31O3Z/WOAwPw=;
        b=QX8k93U0hOpNFRlSuQEzAEpNVLZWECCjSycacNtuGthDFNlw32eIvUe+8TR3az07sm
         1UdoAwMV8ZQO7nnRWgBwKhusFILfdKjyKW5iIMaLYuR4zME53GOzEe5xJGDd1Uo1Ha0A
         KwyA/OsN/CjTSj54768adQIq2ZYxMzWbEffbMZqEIMncRtkNIDvKdlEShMU/c+QEaWYX
         IhbwrwvAbOodWg8iHs4N4Ksy39TgFthrQMqeQmakT6sZRA4mebxOrthFSf2r3oDnM6Nd
         7hGELPZYOl0UbvyrSC7HaUvmzBUjAEyHF1bBWpCSaMYbco/h7kKZpd6IRWYAJ6sWXaZm
         A+sw==
X-Forwarded-Encrypted: i=1; AJvYcCVlqX58mf4X1M55s8MMFXXa/39FVtj+BHQ6L5S+xDZJSqaDMJWUP0lImOnSC+hRqpCbP77ck/L+3MWDMaQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4noqc08EJDkfGDS3LvNy+ajm2thLBDkdnptJRt9pa40VGX8IP
	Uin1bI+2ceHQIfVX/rzklcTLQyVoY9/T33rV9mhGNp2DonnOKbaBtikIaS2mM+6Yba52ogocH1C
	a5a+xzt8mk0F609fsLtWNoxKlS4ndhvAc98Dgow==
X-Gm-Gg: ASbGncuvyY4rqmH4d0ds86hSZLYjjTMRZ0JPnwjLSPoHNPEO+y3y7LQXnQG079F2nKD
	K49Ej10RSfjoqlqzHonJ0D1Y4KIpu5r3ZDAv4XypwdVVlhuzDnRdPrnaOtXO9bL3gj9EDsPQryO
	OpVl+k5hQqI70vPZBTOR1MEw4TmM/oe19w6AKGki0EA6cL+faRQsmSJ1Kf
X-Google-Smtp-Source: AGHT+IGTWWe7qVXQD7wV88L24Yhy6cwazMiFj500otm7IwCN50T/NsK3DqA4VUHqjlN8ydwy3fLOO/lZvLvPkKf3fdI=
X-Received: by 2002:a05:6870:88a4:b0:2d4:ce45:6987 with SMTP id
 586e51a60fabf-2da6cd29f14mr1389605fac.9.1746018030779; Wed, 30 Apr 2025
 06:00:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428-tee-sizecheck-v1-1-5c3c25a2fa79@google.com>
 <CAHUa44E_JZdYnGrReP0zWCP1wdu2BdJ9DSZZ3a2OiobRj61ThQ@mail.gmail.com> <CAK8z29XWCujUdLXcHz075+xcix8HV2Mp3EtxxX9GB7vGjwi3HA@mail.gmail.com>
In-Reply-To: <CAK8z29XWCujUdLXcHz075+xcix8HV2Mp3EtxxX9GB7vGjwi3HA@mail.gmail.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 30 Apr 2025 15:00:19 +0200
X-Gm-Features: ATxdqUHBfc7BMkuQTDmfSTfiM4Rk3eu_g24QSbzjwX9_G4xSJg09xggUMpn2caE
Message-ID: <CAHUa44GDwSVwwk0RsyDZAf1Jd6Lbf1sUOzbW0kV3Ehr2MNkYdA@mail.gmail.com>
Subject: Re: [PATCH] tee: Prevent size calculation wraparound on 32-bit kernels
To: Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: Jann Horn <jannh@google.com>, Sumit Garg <sumit.garg@kernel.org>, 
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 2:12=E2=80=AFPM Rouven Czerwinski
<rouven.czerwinski@linaro.org> wrote:
>
> Hi,
>
> On Wed, 30 Apr 2025 at 13:53, Jens Wiklander <jens.wiklander@linaro.org> =
wrote:
> >
> > On Mon, Apr 28, 2025 at 3:06=E2=80=AFPM Jann Horn <jannh@google.com> wr=
ote:
> > >
> > > The current code around TEE_IOCTL_PARAM_SIZE() is a bit wrong on
> > > 32-bit kernels: Multiplying a user-provided 32-bit value with the
> > > size of a structure can wrap around on such platforms.
> > >
> > > Fix it by using saturating arithmetic for the size calculation.
> > >
> > > This has no security consequences because, in all users of
> > > TEE_IOCTL_PARAM_SIZE(), the subsequent kcalloc() implicitly checks
> > > for wrapping.
> > >
> > > Signed-off-by: Jann Horn <jannh@google.com>
> > > ---
> > > Note that I don't have a test device with a TEE; I only compile-teste=
d
> > > the change on an x86-64 build.
> > > ---
> > >  drivers/tee/tee_core.c | 11 ++++++-----
> > >  1 file changed, 6 insertions(+), 5 deletions(-)
> >
> > Looks good, I'm picking up this.
> >
> > Thanks,
> > Jens
> >
> > >
> > > diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> > > index d113679b1e2d..acc7998758ad 100644
> > > --- a/drivers/tee/tee_core.c
> > > +++ b/drivers/tee/tee_core.c
> > > @@ -10,6 +10,7 @@
> > >  #include <linux/fs.h>
> > >  #include <linux/idr.h>
> > >  #include <linux/module.h>
> > > +#include <linux/overflow.h>
> > >  #include <linux/slab.h>
> > >  #include <linux/tee_core.h>
> > >  #include <linux/uaccess.h>
> > > @@ -19,7 +20,7 @@
> > >
> > >  #define TEE_NUM_DEVICES        32
> > >
> > > -#define TEE_IOCTL_PARAM_SIZE(x) (sizeof(struct tee_param) * (x))
> > > +#define TEE_IOCTL_PARAM_SIZE(x) (size_mul(sizeof(struct tee_param), =
(x)))
> > >
> > >  #define TEE_UUID_NS_NAME_SIZE  128
> > >
> > > @@ -487,7 +488,7 @@ static int tee_ioctl_open_session(struct tee_cont=
ext *ctx,
> > >         if (copy_from_user(&arg, uarg, sizeof(arg)))
> > >                 return -EFAULT;
> > >
> > > -       if (sizeof(arg) + TEE_IOCTL_PARAM_SIZE(arg.num_params) !=3D b=
uf.buf_len)
> > > +       if (size_add(sizeof(arg), TEE_IOCTL_PARAM_SIZE(arg.num_params=
)) !=3D buf.buf_len)
> > >                 return -EINVAL;
> > >
> > >         if (arg.num_params) {
> > > @@ -565,7 +566,7 @@ static int tee_ioctl_invoke(struct tee_context *c=
tx,
> > >         if (copy_from_user(&arg, uarg, sizeof(arg)))
> > >                 return -EFAULT;
> > >
> > > -       if (sizeof(arg) + TEE_IOCTL_PARAM_SIZE(arg.num_params) !=3D b=
uf.buf_len)
> > > +       if (size_add(sizeof(arg), TEE_IOCTL_PARAM_SIZE(arg.num_params=
)) !=3D buf.buf_len)
> > >                 return -EINVAL;
> > >
> > >         if (arg.num_params) {
> > > @@ -699,7 +700,7 @@ static int tee_ioctl_supp_recv(struct tee_context=
 *ctx,
> > >         if (get_user(num_params, &uarg->num_params))
> > >                 return -EFAULT;
> > >
> > > -       if (sizeof(*uarg) + TEE_IOCTL_PARAM_SIZE(num_params) !=3D buf=
.buf_len)
> > > +       if (size_add(sizeof(*uarg), TEE_IOCTL_PARAM_SIZE(num_params))=
 !=3D buf.buf_len)
> > >                 return -EINVAL;
> > >
> > >         params =3D kcalloc(num_params, sizeof(struct tee_param), GFP_=
KERNEL);
> > > @@ -798,7 +799,7 @@ static int tee_ioctl_supp_send(struct tee_context=
 *ctx,
> > >             get_user(num_params, &uarg->num_params))
> > >                 return -EFAULT;
> > >
> > > -       if (sizeof(*uarg) + TEE_IOCTL_PARAM_SIZE(num_params) > buf.bu=
f_len)
> > > +       if (size_add(sizeof(*uarg), TEE_IOCTL_PARAM_SIZE(num_params))=
 > buf.buf_len)
> > >                 return -EINVAL;
> > >
> > >         params =3D kcalloc(num_params, sizeof(struct tee_param), GFP_=
KERNEL);
> > >
> > > ---
> > > base-commit: b4432656b36e5cc1d50a1f2dc15357543add530e
> > > change-id: 20250428-tee-sizecheck-299d5eff8fc7
> > >
> > > --
> > > Jann Horn <jannh@google.com>
> > >
>
> I ran this through the arm32 qemu virt machine to test my new development=
 setup,
> so:
>
> Tested-by: Rouven Czerwinski <rouven.czerwinski@linaro.org>

Thanks for testing.

Cheers,
Jens

>
> Best regards,
> Rouven
