Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218DA2E06EF;
	Wed, 18 Jun 2025 12:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750251587; cv=none; b=hVnos8KxI5UNRR3FEoO8FQBaU4JgO1BOG40RO7wFSfwezShI9Bvu225aFYgHlJfNNYRBH7+nZyyQJuNLO+VrXJdLNBtiiJhi3pXNn8h3nvH4mKbLw/jPlv8S7zhItHdODQ+3Zfy8efs5SyQSNfpxm9q0HvpvFRENfSzXtf6PMbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750251587; c=relaxed/simple;
	bh=jpls8L+8uQegmdKvyIFRZ1rhINWMqc49kXdsyT/MuEM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f+t6z620BrTSY79tidmmv3ueyZVQW334+jNov4RuvAqqle6pnzEmOyRaJC4sL/ZIAZrzgTfI2hJh5CJqk4LkAdawyfay+5esvVGUqptWmsaQAim3EKEZsx3YXd2fR3gk0iUgP9yvtUjepw8XSM0qwQ470dmVmgy4toqgFQUU+d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e0u449kP; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e0u449kP"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-60789b450ceso13403243a12.2;
        Wed, 18 Jun 2025 05:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750251583; x=1750856383; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qq2+/adGDB0VmTZ24qXNIpW4sZc4xuYs5fBPLMCb+Oo=;
        b=e0u449kPlhWDmlo9WxcjKTN9PYldz92l0aREj7nxBLiPCt1AcoyjDnBiarWpFhdCF/
         r0tprPxLQJKDb0efxDMbOrZXCsN+5c5tXUE2kBotmYmYDjpHEpaJ74wAydb+7r/aLZ92
         WYzlXms2v7gM5+M/BJupDbOqecAVyLXPdwjiYNKmGfp97VRWzn46wSVl9ujVLWCsXGHT
         bsQkWSAsSh8gE1RcojqPNF1XUZbvsT6Y7dKR+7MCQH3OUnJYcp8DR8it+GimEKRoTUNf
         AmxCpPyVF6V1sYEjLy+awLbBf0iDtX5fV6JZBDotircuDohaxRHEjTDrvgn/KKnx8xWb
         3x6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750251583; x=1750856383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qq2+/adGDB0VmTZ24qXNIpW4sZc4xuYs5fBPLMCb+Oo=;
        b=EBytCqwsa93sdsDeSHr9KXO0Dm5NuHTH9D316pOVEZmFmaMdLFB35WxuGYcQCI1F3y
         wJY6ZStY5BOzxHEYpzCzPPPxbkJdh//tDok1cSaRM69Tek1QCD/JRE80d+gSXJShNvak
         szm0gBaq3ZLUudLHNS8LS87DUbJdDLRPsBJxm4K1hzDyM+rHa//DRX6s4WkZygy7tfG5
         vun+MH9EAxnYjTtkCECsjJxV717AXT4WnT1wxh3bqwGn1tWnKtVGeBctnakpMSAIMGvt
         JAqJ6SorX6wrLQIG4OfbG5Bb9HmvPAJWovOvx14dcK4ZNcrPGTcxvgbkywkZq1FJ0q07
         02Dw==
X-Forwarded-Encrypted: i=1; AJvYcCUkt2ed1L0zm6EqNpuGNIKpXxyx77BOghmyeIHI6vfv853pdddmco18Tj9wSL6hXedNm1s9D+HU4o1STG1f@vger.kernel.org, AJvYcCWXUAt2y33kVtnTr/DGkhANGwMrsEjeJAvCCWVVeiKgyUyTNGEKFGPEizWEK11RlcrPAb5OM/CjlWs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvPqr2vytdtTghHL66JZbpseUQ5qlhYakIfhRif+92x00jpNNg
	51l0AgIjaowSTznGZiucDkeH7aywHblUiGn/g9Xsupi4S/KNH7jmnQQZa+p/LueWtEBOsHflXZ3
	/7vmm5TfkPS30+fGhxTOan3Orh1mFw9A=
X-Gm-Gg: ASbGncu7OuQ0H/nqq4p0Y/naxUh9XcspLOgfGVV3G/9jTFf7OxK+E+6WpU3mYO+sdWz
	FEr/4vBzOA+rXI8CxdmLMiN+iX3FVweH7jC5r8yuQI3d7N655AMatpaWFixv2i95Buaz3VMiFsr
	dn7AbwkEssuy4lDSyF7DCQ41x9T7b23W11vVugH+TykI0=
X-Google-Smtp-Source: AGHT+IGyUhM+KgyxTIvqWyOzWLTSsKgqaGyZQ0JDk5kKAJf/zyENpJ2QvU/cjisgddEXfxSCX5AYb7vh3YtGwUDxnvY=
X-Received: by 2002:a05:6402:50cc:b0:5fa:fcda:bf57 with SMTP id
 4fb4d7f45d1cf-608d09bfb1bmr16933764a12.17.1750251582919; Wed, 18 Jun 2025
 05:59:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616134003.3981866-1-dzm91@hust.edu.cn> <9aa4278e-0f43-420b-b6b5-78a32263d7ec@linux.dev>
In-Reply-To: <9aa4278e-0f43-420b-b6b5-78a32263d7ec@linux.dev>
From: Alex Shi <seakeel@gmail.com>
Date: Wed, 18 Jun 2025 20:59:05 +0800
X-Gm-Features: AX0GCFtrwa1LBBshh64SHqQgycceaj7zSQ9yLJ2KdpypAVaeG1GqkzsXjVfJVdE
Message-ID: <CAJy-Amn99xopAHTwc0ZUFfGKDmjq9Oo==Shy5Jn-YC6XcgE5zg@mail.gmail.com>
Subject: Re: [PATCH] docs/zh_CN: update git command examples in how-to.rst
To: Yanteng Si <si.yanteng@linux.dev>
Cc: Dongliang Mu <dzm91@hust.edu.cn>, Alex Shi <alexs@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied! Thanks!

Yanteng Si <si.yanteng@linux.dev> =E4=BA=8E2025=E5=B9=B46=E6=9C=8817=E6=97=
=A5=E5=91=A8=E4=BA=8C 09:44=E5=86=99=E9=81=93=EF=BC=9A
>
>
> =E5=9C=A8 6/16/25 9:40 PM, Dongliang Mu =E5=86=99=E9=81=93:
> > This patch leverages `checkout -b` to shorten branch & checkout
> > and fix the missing checkout.
> >
> > Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
>
> Acked-by: Yanteng Si <si.yanteng@linux.dev>
>
>
> Thanks,
>
> Yanteng
>
> > ---
> >   Documentation/translations/zh_CN/how-to.rst | 5 ++---
> >   1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/translations/zh_CN/how-to.rst b/Documentatio=
n/translations/zh_CN/how-to.rst
> > index 569b0209385a..0896f13d8b8d 100644
> > --- a/Documentation/translations/zh_CN/how-to.rst
> > +++ b/Documentation/translations/zh_CN/how-to.rst
> > @@ -177,8 +177,7 @@ git=E5=92=8C=E9=82=AE=E7=AE=B1=E9=85=8D=E7=BD=AE
> >   =E8=AF=B7=E6=89=A7=E8=A1=8C=E4=BB=A5=E4=B8=8B=E5=91=BD=E4=BB=A4=EF=BC=
=8C=E6=96=B0=E5=BB=BA=E5=BC=80=E5=8F=91=E5=88=86=E6=94=AF::
> >
> >       git checkout docs-next
> > -     git branch my-trans
> > -     git checkout my-trans
> > +     git checkout -b my-trans
> >
> >   =E8=AF=91=E6=96=87=E6=A0=BC=E5=BC=8F=E8=A6=81=E6=B1=82
> >   ------------
> > @@ -286,7 +285,7 @@ warning =E4=B8=8D=E9=9C=80=E8=A6=81=E8=A7=A3=E5=86=
=B3::
> >   =E7=84=B6=E5=90=8E=E6=89=A7=E8=A1=8C=E4=BB=A5=E4=B8=8B=E5=91=BD=E4=BB=
=A4=E4=B8=BA=E8=A1=A5=E4=B8=81=E8=BF=BD=E5=8A=A0=E6=9B=B4=E6=94=B9::
> >
> >       git checkout docs-next
> > -     git branch test-trans
> > +     git checkout -b test-trans-new
> >       git am 0001-xxxxx.patch
> >       ./scripts/checkpatch.pl 0001-xxxxx.patch
> >       =E7=9B=B4=E6=8E=A5=E4=BF=AE=E6=94=B9=E6=82=A8=E7=9A=84=E7=BF=BB=
=E8=AF=91
