Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A682156230
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 08:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744013726; cv=none; b=qUYAQ1xfaaG2loPCy2jmscRIOcmYKz5u9mkejPG/RF7ctnyceYCJqH8bdsqxISBDBUpq4GhelL9l0jlgEqEK0cXNNhLOkqM/p/AHs2Bm4SF+lbFg8mLkJcqKiXCPpiTRdjqGl/PtxtDQwwgezd0pXyF76ZjbG5M/wA+ljukL/bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744013726; c=relaxed/simple;
	bh=7eKwR+8NelLDqbmRwgY2SrOwJJmgSMiDGnzt6L51nLU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I5pvv2SFFCHZ3yr2YxOR9N+ItCBfHLSoT/1kp7i7gsbF8pTWXRUGKaw+oUUCTx9gNbVBGyBJr/X0HWVsDatNZSiuMDiyJx7g0yrNyzRSXJSrUczByG6NoXVYQl0hqSrghjDFnCEIGaSmr+5E/pOEXoJU0wLYVNFg+IDT9zoX+gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=YYwi1oc0; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="YYwi1oc0"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e5b6f3025dso5917585a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 01:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744013722; x=1744618522; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rxhNXhmOXrXU9cn3uuap3d3f1w/9DGD5pG/vOAg+GCU=;
        b=YYwi1oc0edop/Av6fSOshDK2XvLhHx/X1pdYQfkv3n0Mtd7JUFaxmTBkwfnIgtUINR
         EayPdUV46tfcXzwNS32vprlnmr25IvKLSDb5eEpaINdTlE3nmrv5kw0pfIIpASzfX7vU
         AtP0bwpTELTB0xfR6oG4yLF+v4Cl318a5797Zb78XX4UkcqpBo+bnu+L4lMMBeP9VqOf
         n6eT1JnePywHVn25oQij55/2jVwORFV62hV+NjxQz+ZM0ggcICSQZWMPEX0bOWLA0N3D
         +i9QeX9bncGroT5P+aGd2bhnWGpw5VN2oi1LsaNITE0PQV1pc8MTGBtLJSA9ULPuqUDD
         ID+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744013722; x=1744618522;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rxhNXhmOXrXU9cn3uuap3d3f1w/9DGD5pG/vOAg+GCU=;
        b=h6/KuVufWvusCEwpJ+JZtOCt7IuGB6W3To970tZ8lldO87nMhdhuTuiQqSPXFwielv
         ALM0MuSDWk3XbJ9Plm7xb1hthVK/6GKkEsOkObCUUfdydFg8n3XFREgdg4hjn5L30dnQ
         lpaKzA5FEFKQIB/pr3KMGSgNdEEAnfUtcNZmLaAwNGTOuEmLKW6kQQM5FzuwNO1zC5s/
         SJiiO/FHWM27z6+UFttemjQXLi18HMbkNIZiqwCWRFHc/knt6LyYOjAXLfc+cbg79ZBb
         FUPeCyvchW6sAuOytrnP1KfaSNNbCjBmBSy2QtmQWIrRmkJQ30ZPA+H97a5kuplGEPRo
         gxRg==
X-Forwarded-Encrypted: i=1; AJvYcCXhLhjxNl9n4UnY/4sj6P0ufcQ2Gn8prUCvv+zPr1ruRBN6PyOfx4UehuV8Zx4UBoe+sLVynTSX6m8xQ6E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd++90asiSCYWH+6AkGlCkzErMjia8vC7z0XUt/9dsMov2skEs
	tA8S6qwDGhcDisObYt9jh0IBvNmTdSBqwxriJdsyUdV4G2p/MT+u3tDxesEjfKoWaL5L/u2kDPQ
	SoeRRmyWaxDcCx/9qB/TmlDJCUGStDRau9S6W5N0HXIue+sG/
X-Gm-Gg: ASbGncuVBEo7CsIpuJs/IojlKaoEOVJCt0X/4rBGTzH6haVyyTq4oT/HqwsXIa4WPnv
	ojsNmJERdeLYJt61s2VcfuaQGp7QJlKoVy7yUywa/cmWDripkNnkfLC+SHIwy9tJaynyl3ckjBS
	23lIrQrS7GMubjw8t2uzNhw1ms6b/xIa6JGxhvG1dWLGWrwRZiEivW4tx4
X-Google-Smtp-Source: AGHT+IGgzEsWY+FDt77Og8y5aNWXUnnOo8nRCNX9z9AS6T2kxW12Ew+hSRh5KhztpZghUinGFQgeBKUpUrZ7kM/dDF0=
X-Received: by 2002:a05:6402:3489:b0:5de:c9d0:6742 with SMTP id
 4fb4d7f45d1cf-5f0db80a5ebmr5551794a12.9.1744013722372; Mon, 07 Apr 2025
 01:15:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403134200.385077-1-alexghiti@rivosinc.com>
 <CAMj1kXGzrn6i20LvUBnz_mGi946=GCogNHHUL=mNsv513qYv7A@mail.gmail.com>
 <2874fc20-9135-4b13-b825-43fb350ce552@ghiti.fr> <CAK7LNAT5sDhh1v3U2xUuVnrbhNXp3SJ_ngxSqAgwmZL0E2QGpA@mail.gmail.com>
In-Reply-To: <CAK7LNAT5sDhh1v3U2xUuVnrbhNXp3SJ_ngxSqAgwmZL0E2QGpA@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Mon, 7 Apr 2025 10:15:11 +0200
X-Gm-Features: ATxdqUF5a3kGXRp3r7uxE0Bhe9AOdQ046v-EZyv9hJ2EImaWyVHa56ABPSTHfBg
Message-ID: <CAHVXubgZ+Dwx70vU03R9MZ7BjkzbdR21y-Ort6pBngFmFYs-uw@mail.gmail.com>
Subject: Re: [PATCH v2] scripts: Do not strip .rela.dyn section
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Ard Biesheuvel <ardb@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Charlie Jenkins <charlie@rivosinc.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Masahiro,

On Fri, Apr 4, 2025 at 5:25=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
>
> On Fri, Apr 4, 2025 at 12:45=E2=80=AFAM Alexandre Ghiti <alex@ghiti.fr> w=
rote:
> >
> > Hi Ard,
> >
> > On 03/04/2025 17:11, Ard Biesheuvel wrote:
> > > On Thu, 3 Apr 2025 at 16:42, Alexandre Ghiti <alexghiti@rivosinc.com>=
 wrote:
> > >> riscv uses the .rela.dyn section to relocate the kernel at runtime b=
ut
> > >> that section is stripped from vmlinux. That prevents kexec to
> > >> successfully load vmlinux since it does not contain the relocations =
info
> > >> needed.
> > >>
> > > Maybe explain that .rela.dyn contains runtime relocations, which are
> > > only emitted if they are actually needed - as opposed to the static
> > > relocations that are not emitted as SHF_ALLOC sections, and are not
> > > considered to be part of the runtime image in the first place.
> >
> >
> > Ok I'll do.
> >
> >
> > > It
> > > would be nice if we could use --remove-relocations=3D here, which onl=
y
> > > removes static relocations, but unfortunately, llvm-objcopy does not
> > > support this.
> > >
> > > Also, I wonder if this should apply to all of .rel.dyn, .rela.dyn and
> > > .relr.dyn, as they all carry runtime relocations.
> >
> >
> > Ok, I'll add them to the next version.
> >
> >
> > >
> > > Finally, I'd be curious to know why RISC-V relies on --emit-relocs in
> > > the first place? Is the relocs check really needed? If not, it would
> > > be a nice opportunity to get rid of Makefile.postlink entirely.
> >
> >
> > So I had to check and it happens that this was an issue with the
> > toolchain, I should check if that still happens with newer ones.
> >
> > commit 559d1e45a16dcf1542e430ea3dce9ab625be98d0
> > Author: Alexandre Ghiti <alexghiti@rivosinc.com>
> > Date:   Wed Mar 29 06:53:29 2023 +0200
> >
> >      riscv: Use --emit-relocs in order to move .rela.dyn in init
>
>
>
>
> So,
>
> Fixes: 559d1e45a16d ("riscv: Use --emit-relocs in order to move
> .rela.dyn in init")
>
> Is this the correct tag?

This is the initial culprit yes, but if we use this tag, the fix won't
apply. So I decided to pick Ard's patch so that this fix can be easily
backported to 6.14, and I'll come up with a new version for previous
releases. Is that ok with you?

Thanks,

Alex

>
>
>
>
>
> --
> Best Regards
> Masahiro Yamada
