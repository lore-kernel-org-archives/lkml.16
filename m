Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A68A2AD0B;
	Tue, 13 May 2025 04:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747111860; cv=none; b=OIkNuN5gmEpFFYZz0npse3qilCPCf4pLOWy9mjT4+tRl5x5a+AW0X2IvPV7UeUKvIFrwXRbeWaRcOuDAHDxhohO+iRwU3xeE8NIYtxVN+jrabxQR5quv40MPFwO9m8L4mMZ55cqqOKbyDZV9RB/eZAehhr6FyrXYDczN8qebm/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747111860; c=relaxed/simple;
	bh=Kj9y88vKMk6e9XGSAkxvceBrY7AAK8JqUjxUEgQTuL0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OgdFk21kQ2cDtzkgNP20xW3UMflRU7AS8DA/5PjYR2CbxP0k+UPFRQ/tUeKoIykgld5K/8SinU+vZXjad1S6a732lYycRfZrUVS3wcnQ5cbcnIkljCaluyUsGOumBhYTnJwh5B8ApalW9K5ff1kvyMdYpaU2LLs1BeWeksBW8t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rclJIR89; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rclJIR89"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9554BC4CEE4;
	Tue, 13 May 2025 04:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747111859;
	bh=Kj9y88vKMk6e9XGSAkxvceBrY7AAK8JqUjxUEgQTuL0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rclJIR89DkmG3lgyvIO1p7n9rryTDILBlzj0vZ+mD5ECLRzL76yH6kmgT3ur0Ob5b
	 JAXGQD/ukixeC79W5P/mLPez4UJDLZMgWooDCUjM0wcKrAgW7JfQrd/tzHL2CuKXNw
	 ZaNhGKeGS652M+KTGce9tZ/688Iv4E6PSyi8/GeHSE90llDFJcSclOPQj+LFjFRg6+
	 D4FZJLPQwY2kZ2RoKx9K9ZzxVbMgV8/bTxD9VuEh1+h1FZX/jqnKQqNxLQZxZtjHek
	 rj/XN/6spPE1ZDOltF/1OX5Vw7EtpcrnFkQ2L25yERKNAHUqNnpX2aSA5ppA2t8AzQ
	 CDhkE860rANgw==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54fc61b3ccaso5287044e87.1;
        Mon, 12 May 2025 21:50:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVwPaYv4kT3OeeFVz6WAbt9cSRyujfe23ns2XAQ+7gWmTCPH3uLKxHUmHbhFOo4iNZqMJ6nHbUxSxnrtcMz@vger.kernel.org, AJvYcCWCHZvnv8/U03KlISXrCUx2URantg+raQtMHxYPqcaPy3lbvvHBQRp0t45X41vOq9VQ7v8AFnrJGznX@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn4XOQyDLapKlM6h62W0FGK22x3taH6L3BiEadZM51R1R0gD1Y
	a03E1xXwd5qRH2fAhzxcCq+08Hzko1LzkqGq46xd4Wu/M5TXoERBGSqsBv68P62364Dd5xb/ioG
	AUza3XGdtEFITCzAp6ZHrQK3Xm44=
X-Google-Smtp-Source: AGHT+IGK1g+taeuG7QrcEmqHow6t43QaMNZHDkqVlueTRCH2Gydah1Lc+hhFSbpP+PhvofrmpRRDvHZprff8AIjquqA=
X-Received: by 2002:a2e:b8c9:0:b0:30b:efa3:b105 with SMTP id
 38308e7fff4ca-326c45900ccmr65056151fa.19.1747111858293; Mon, 12 May 2025
 21:50:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250114181359.4192564-1-masahiroy@kernel.org>
 <20250114181359.4192564-4-masahiroy@kernel.org> <CAL_JsqJyNiUF8--wz2DsngUAuSUboq8oqZRxAzqY+iBRM7rkjQ@mail.gmail.com>
 <CAK7LNATCFFQFYenkY2F5HkXx_otub9ebuTHJOD_TLiqCDnYN0w@mail.gmail.com> <b211188e-6c31-49fd-96be-137d3fc3f7bb@monstr.eu>
In-Reply-To: <b211188e-6c31-49fd-96be-137d3fc3f7bb@monstr.eu>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 13 May 2025 13:50:22 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQqR7rtuCSy895q-WeJR-uhVB_0UH1DrGPNLoz1_cRhtg@mail.gmail.com>
X-Gm-Features: AX0GCFsWgAAx3-0dbj6FVKm9OU5vqHdXkH-KM7aRWeBmsq5D2OzLH-PHl7EZM_U
Message-ID: <CAK7LNAQqR7rtuCSy895q-WeJR-uhVB_0UH1DrGPNLoz1_cRhtg@mail.gmail.com>
Subject: Re: [PATCH 4/4] microblaze: remove unnecessary system.dts
To: Michal Simek <monstr@monstr.eu>
Cc: Rob Herring <robh@kernel.org>, "Simek, Michal" <michal.simek@amd.com>, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 8:17=E2=80=AFPM Michal Simek <monstr@monstr.eu> wrot=
e:
>
>
>
> On 2/1/25 04:42, Masahiro Yamada wrote:
> > On Sat, Feb 1, 2025 at 7:25=E2=80=AFAM Rob Herring <robh@kernel.org> wr=
ote:
> >>
> >> On Tue, Jan 14, 2025 at 12:15=E2=80=AFPM Masahiro Yamada <masahiroy@ke=
rnel.org> wrote:
> >>>
> >>> The default image linux.bin does not contain any DTB, but a separate
> >>> system.dtb is compiled.
> >>>
> >>> Michal Simek clearly explained "system.dtb is really old dtb more for
> >>> demonstration purpose and nothing else and likely it is not working o=
n
> >>> any existing board." [1]
> >>>
> >>> The system.dts is not necessary even for demonstration purposes. Ther=
e
> >>> is no need to compile out-of-tree *.dts under arch/microblaze/boot/dt=
s/
> >>> unless it is embedded into the kernel. Users can directly use dtc.
> >>>
> >>> [1]: https://lore.kernel.org/all/d2bdfbfd-3721-407f-991e-566d48392add=
@amd.com/
> >>>
> >>> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> >>> ---
> >>>
> >>>   arch/microblaze/boot/dts/Makefile   |   3 +-
> >>>   arch/microblaze/boot/dts/system.dts | 353 -------------------------=
---
> >>>   2 files changed, 1 insertion(+), 355 deletions(-)
> >>>   delete mode 100644 arch/microblaze/boot/dts/system.dts
> >>>
> >>> diff --git a/arch/microblaze/boot/dts/Makefile b/arch/microblaze/boot=
/dts/Makefile
> >>> index 932dc7550a1b..fa0a6c0854ca 100644
> >>> --- a/arch/microblaze/boot/dts/Makefile
> >>> +++ b/arch/microblaze/boot/dts/Makefile
> >>> @@ -1,8 +1,6 @@
> >>>   # SPDX-License-Identifier: GPL-2.0
> >>>   #
> >>>
> >>> -dtb-y :=3D system.dtb
> >>> -
> >>>   ifneq ($(DTB),)
> >>>   obj-y +=3D linked_dtb.o
> >>>
> >>> @@ -11,6 +9,7 @@ $(obj)/linked_dtb.o: $(obj)/system.dtb
> >>>
> >>>   # Generate system.dtb from $(DTB).dtb
> >>>   ifneq ($(DTB),system)
> >>
> >> Can't this be dropped as setting DTB=3Dsystem.dtb should work if there=
's
> >> not an in-tree system.dts anymore.
> >
> > I believe this ifneq is necessary, just in case
> > a user adds system.dtb to arch/microblaze/boot/dts/.
> >
> > 'system.dtb' is a special name because
> > arch/microblaze/boot/dts/linked_dtb.S wraps it.
> >
> > So, $(DTB) is copied to system.dtb, and then
> > it is wrapped by linked_dtb.S.
> >
> > If $(DTB) is already 'system',
> > we cannot copy system.dtb to itself.
> >
> >
> > See the definition of cmd_copy in scripts/Makefile.lib
> >
> > cmd_copy =3D cat $< > $@
> >
> >
> > "cat system.dtb > system.dtb"
> > would create an empty system.dtb
> >
>
> I have played with this and pretty much this patch is blocking
> simpleImage.system build target.
>
> I have no issue with patches 1-3 and I would keep system.dts as empty and=
 keep
> it in the tree because users (including me) just rewrite system.dts with =
proper
> DTS and call make simpleImage.system.

Why is "system" so special?

You hard-code this line:
    dtb-y :=3D system.dtb


"make simpleImage.system" compiles system.dts to system.dtb


However,

"make simpleImage.foo" does not compile foo.dts to foo.dtb
since "dtb-y :=3D foo.dtb" is missing.
This works only if you drop-in a pre-compiled foo.dtb


"make simpleImage.<name>" works only when <name> is "system".

Is this what you mean?







--=20
Best Regards
Masahiro Yamada
