Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053D01A073F
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 13:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748440500; cv=none; b=MvCF0ddGf8wvYVBElmrTJlyUfaoCqwcMkQeHAdzKpdsZNdNIRB6wsQHI6QN7UHbp6W2hIA6xgzGVNZEsy6+LDkqM/MK8XNfKJGPQDY3BAmL+FB96dpF2PHd7xJSnjuShyPnRlIwuatdpIcbZhtRVxxjJoZ4qW9lABkl96lqnq0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748440500; c=relaxed/simple;
	bh=k97NcxBl4V7jw/PvcH6y9RiaFq021QEAdtz1/8OVZ2U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ovUPkGFhrAEhHbH4FzFVykJexCuw9s+5ktyFJ3L7I4lWKSjIx10t6SUMO/qHt9z2aomYD7M+mrHa5wmbqZyhuf7Je/5sGcP40eJqB64C0S3PnDdUjxlALe6LXGUJPgjpLhpIMuBP0bW6lM0H9y+FUa3JGieP8iayH3ND78bpvKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vor7yCXb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vor7yCXb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88F6BC4AF0B
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 13:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748440499;
	bh=k97NcxBl4V7jw/PvcH6y9RiaFq021QEAdtz1/8OVZ2U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Vor7yCXbUII3CJMh3yiK8Ji+X7/nRgSwsVbGgKIeau3fsDhwBvllBrG0NOn45Nb2O
	 WE/WwfvlwwQ8Qn1Ihff94T07cw8EnjVz94BkDLK6EUcl/f85WRd69yGFxTSQ9+Okd0
	 YfGo1DfDUPWj5xVwdL7/+hEA2yD2UObAaycctd9pTkxIx8WqiRQN1kSChJCVLxuAs4
	 gcaV/pFSr+bn1MnP7pXI4uIGu2kAVX6GwsG6Zpu1N411rGfN7O/06KVlPhMNWTtmZe
	 F6j0kRQ07HMdLnyf7Q8x9vBi6FmDraVclfoc1qH9ORh7cQfQ9pkoj9KaqzkWAok4KO
	 DofQhJt3M752w==
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-602039559d8so8975797a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 06:54:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUeeLcYySj3sR1bce8rn0ySaPXR4z9TIScqoD/TH69mE97ll1/6TyXfg+x4ADgNZAtQSDjWSQRexkiCQEU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4FUFNJfHYV9QxX8pZEN2IcFshco0xNIi4eTz0UJQv+KN3iVk5
	qIEt/qQ2mr/MCMFFCCfXbucyID5GeysNAwxB1AiLRtXvyWVcTsEp+NDNFMRlZ6K7caNQLUfsSAO
	uK8WZ0LJzZXzuhZ2akwQtJ0zzGc4gcyM=
X-Google-Smtp-Source: AGHT+IEEuH8vRL+51mbmcyHxCEMeNyKwMN7QxI+1DOg59ySqj2dvrjBCrMYw1ofvYnVrmpTtEve02p2f+n5x+8YfqEs=
X-Received: by 2002:a05:6402:d45:b0:602:ef0a:cef8 with SMTP id
 4fb4d7f45d1cf-602ef29d3cfmr11484327a12.18.1748440498076; Wed, 28 May 2025
 06:54:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520064936.32291-1-yangtiezhu@loongson.cn>
 <e005dd551aec8bea185b3d37295876bd75d7b3e4.camel@xry111.site>
 <a918b221-b7f3-9994-9a7a-d10345aa30df@loongson.cn> <19f4722d5cdb90a207129ee675c7278423cd328c.camel@xry111.site>
In-Reply-To: <19f4722d5cdb90a207129ee675c7278423cd328c.camel@xry111.site>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 28 May 2025 21:54:45 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5GEZu=r=gX4afNB2F4w_LpXa1FwuWdyDE=+pGJNnqxww@mail.gmail.com>
X-Gm-Features: AX0GCFtlAzfumS6XolzoJ0MKPafRHvauugEExtVKJnN5aI2CpQXMkQBN4tLLIfg
Message-ID: <CAAhV-H5GEZu=r=gX4afNB2F4w_LpXa1FwuWdyDE=+pGJNnqxww@mail.gmail.com>
Subject: Re: [RFC PATCH] LoongArch: Do not include larchintrin.h
To: Xi Ruoyao <xry111@xry111.site>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 11:47=E2=80=AFAM Xi Ruoyao <xry111@xry111.site> wro=
te:
>
> On Tue, 2025-05-27 at 11:17 +0800, Tiezhu Yang wrote:
> > On 2025/5/21 =E4=B8=8B=E5=8D=881:41, Xi Ruoyao wrote:
> > > On Tue, 2025-05-20 at 14:49 +0800, Tiezhu Yang wrote:
> > > > larchintrin.h is a system header of compiler, include it in the
> > > > kernel header may lead to the fatal error "'larchintrin.h' file
> > > > not found".
> > > >
> > > > There are two related cases so far:
> > > >
> > > > (1) When compiling samples/bpf, it has been fixed in the latest
> > > > kernel [1].
> > > >
> > > > (2) When running bcc script, it has been fixed in the latest
> > > > bcc [2] [3], like this:
> > > >
> > > > $ /usr/share/bcc/tools/filetop
> > > > In file included from <built-in>:4:
> > > > In file included from /virtual/include/bcc/helpers.h:54:
> > > > In file included from arch/loongarch/include/asm/page.h:7:
> > > > In file included from arch/loongarch/include/asm/addrspace.h:9:
> > > > arch/loongarch/include/asm/loongarch.h:11:10: fatal error:
> > > > 'larchintrin.h' file not found
> > > >     11 | #include <larchintrin.h>
> > > >        |          ^~~~~~~~~~~~~~~
> > > > 1 error generated.
> > > >
> > > > Maybe there are same errors for the other unknown projects, it is
> > > > annoyance to add the include path each time. In order to avoid
> > > > such
> > > > errors once and for all, do not include larchintrin.h, just use
> > > > the
> > > > builtin functions directly.
> > >
> > > Sorry, but in GCC those builtin functions are not documented and may
> > > subject to change in the future.  Only the larchintrin.h interface
> > > is
> > > documented.
> >
> > AFAICT, the LoongArch Base Built-in Functions are listed in the GCC
> > documentation [1], they will not be changed easily and frequently in
> > my opinion.
> >
> > __builtin_loongarch_cpucfg()
> > __builtin_loongarch_csrrd_w()
> > __builtin_loongarch_csrrd_d()
> > __builtin_loongarch_csrwr_w()
> > __builtin_loongarch_csrwr_d()
> > __builtin_loongarch_csrxchg_w()
> > __builtin_loongarch_csrxchg_d()
> > __builtin_loongarch_iocsrrd_w()
> > __builtin_loongarch_iocsrrd_d()
> > __builtin_loongarch_iocsrwr_w()
> > __builtin_loongarch_iocsrwr_d()
> >
> > > Thus if you don't want to rely on GCC for those operations, you may
> > > need
> > > to write inline asm...
> >
> > so these builtin functions can be used directly and safely.
>
> Oops, I mistakenly believed they were like __builtin_lsx_* which are not
> documented.
>
> So yes they can be used directly.
I don't think so.

1. csr & iocsr can be only used in kernel mode, if the kernel doesn't
use the convenient short names, then the short names are totally
useless.
2. We get larchintrin.h included by "KBUILD_CFLAGS +=3D -isystem $(shell
$(CC) -print-file-name=3Dinclude)", and this manner is also used by
other architectures.
3. I don't think there will be many projects that need to be modified.


Huacai

>
> --
> Xi Ruoyao <xry111@xry111.site>
> School of Aerospace Science and Technology, Xidian University
