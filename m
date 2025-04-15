Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD744296D06
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 14:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744728069; cv=none; b=D61Yu1Fa6MlBvMhBK8pwai16EyuZXhd6tAQIZP+zBclj0eygeAFeBABhKebD5MeHRLW9j5jXZgLadcTg90F4J5hrcr7dxBhT6OJHl39YmgW/kKASN1njqC2rIeKxW8nhAtW3lw8Glg0fyZZ2WsrwBeZ/+ow9tFLbI0Mt0QMHXSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744728069; c=relaxed/simple;
	bh=x5b9bXTROINdeXk1seqdB1Qn+LEuqRYwpMzuZk4ROMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lB1LCMwIoEgUB9JKWnGvi20GrkyhUEuIWgs24zhFt1LLBV5etXGPzWpEfYvl5Y3RZ8sk+oUZUZzQpKG4Ko7Sw3mgJWp0z3jzZ8YW+nu7Ugf4w0beNbv1dpqNF0tx3DxNdSFaoM7JUVZlJ9jILgdPiVbblQb6yH7lluhIFM+vfrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f+hGmL7R; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f+hGmL7R"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3012a0c8496so4325646a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 07:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744728067; x=1745332867; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x5b9bXTROINdeXk1seqdB1Qn+LEuqRYwpMzuZk4ROMw=;
        b=f+hGmL7RCoGYmWnIqnosJ1K0rvnF1KUr4E/qgAZ9gWGHVvPafbjmUxph0dIuTvB/Ws
         vkZU/RYTcF5MtRUFHXeFJrcq/w8SHng4J86XpjczLYuVT7yhHVpSAp8etihV1uQEpYeU
         55uDed0VcdtKFft2RAJvE10PpMq0HEa2W3NCwxBGU+LkJZT7fI1k3YHOOd5C5ph9xAlu
         +adgv3rQitnAIzdYDbdLw7417f/xl79symzmgLMpuhw3KuY1FasS7S1JKMBLynw0gKew
         rjwtZOdqas4xd4jHCKbZ6uv7em+faAoTt84Dc7g6D8tgXIxucXB5QB8LicXFxdbRrJMC
         rmbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744728067; x=1745332867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x5b9bXTROINdeXk1seqdB1Qn+LEuqRYwpMzuZk4ROMw=;
        b=ETMzI+CKHUHeMXWBFidK5djETPVi9eqLUwI0+rzOFUNPoXITK71PLv8aPOHfl2jyLS
         1Go68S7xbAXfcELwWipKq3m0J1wXzxFz1MmcAno2f+yRukMeOisB7ovkqsfYAzW2TS3f
         kr8I3KPIMUxKhCri7I46dmmK8pdzA8qof77m3jDU5BRAnQfwiBEw+/9cSICelD+17kmk
         OIFmcdnhimzHa1Rvs+8vgwPJ+SU6NQuxp6b74F2HmqkKWw2Ej1481THtySZPOp5xg5up
         FEe8Oia7cqJoDMgGzvoW1btQqj2t+O+j2FJ5l3gY+CEwKxl+QifOMZSeJvWKUiW1nMuW
         pb8w==
X-Forwarded-Encrypted: i=1; AJvYcCXHI8JTJHfLhBmEvgtuwpwg05K2bN9O4G70oxI62ML3J7ps7BJidf6AYclZPuxGVfWbwoId6RcdZM3muQI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzakZENoMghSUKbyEDdRAx+/dX7/YxH1QE70BjPYKh9SNW8guVX
	jl7BJMFb+hqS4XKd/Q4J1Ft+HZG5lpvgbmkB8D5oMNunwxyelg2HQJLCJB0w4mfJxwqc9QIyA//
	9Dijw2V+fkaDJj7IWF6FNjQZen8pIh5RCmhC6
X-Gm-Gg: ASbGncu6D6y5384pRAW5UdUvtv70H8Kfkw3OBdsMXfRgABgenzMjgmph/88Mf7Zvje6
	y9pA/vWRXk1QIxAKNxb5nLq5pvY8n/v03HMiGisFGLpAZMCMw04tgFWBWlEoVYBxi8dFld5huHm
	6Lp6gDQl6/ZNMG3dvCDbZ8wbb9fdvuMytAawhoNWEPFiCK+kwnRSCG
X-Google-Smtp-Source: AGHT+IEEuxZ9Ez7Pf5xxXYr095dz+gXGePFitbmr+YgBxVP/x8bp7n0djoupHSFJ7sU9w8VeRATFXDQaIim1FemxDEk=
X-Received: by 2002:a17:90b:51cc:b0:2ee:f440:53ed with SMTP id
 98e67ed59e1d1-30823680b7amr22912689a91.31.1744728066884; Tue, 15 Apr 2025
 07:41:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANp29Y4FmGDXm3LWvW6D+JR8CWf=fvuiAseFb1h2HQSDjFKO2A@mail.gmail.com>
 <20250414151611.GA3404099@ax162>
In-Reply-To: <20250414151611.GA3404099@ax162>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Tue, 15 Apr 2025 16:40:55 +0200
X-Gm-Features: ATxdqUHED0agX36CFPDCX7wOV3Y-ridV6j5zFeIUFybXnI-dGsik_IS1V6kGSKI
Message-ID: <CANp29Y4GGCkaW+YHAeGtvTA0XQh6c+5FaiXTvZcZtXH1D0G4WA@mail.gmail.com>
Subject: Re: Latest clang versions fail to compile CONFIG_X86_X32_ABI=y
To: Nathan Chancellor <nathan@kernel.org>, thomas.weissschuh@linutronix.de
Cc: llvm@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>, 
	syzkaller <syzkaller@googlegroups.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Alexander Potapenko <glider@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas and Nathan,

Thank you for your very quick replies!
I've tried to run "make LLVM=3D1" instead of passing CC=3D and LD=3D, and i=
t
worked well.

On Mon, Apr 14, 2025 at 5:16=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> On Mon, Apr 14, 2025 at 04:11:15PM +0200, Aleksandr Nogikh wrote:
> > Hi,
> >
> > I've been trying to build a Linux kernel using newer llvm toolchain
> > versions (18, 19, 20), but it consistently fails with the following
> > errors:
> >
> > ld.lld: error: arch/x86/entry/vdso/vgetrandom-x32.o:(.note.gnu.property=
+0x0):
> > data is too short
> > ld.lld: error: arch/x86/entry/vdso/vgetcpu-x32.o:(.note.gnu.property+0x=
0):
> > data is too short
> > ld.lld: error: arch/x86/entry/vdso/vclock_gettime-x32.o:(.note.gnu.prop=
erty+0x0):
> > data is too short
> >
> > The steps to reproduce:
> > $ git checkout v6.15-rc2
> > $ make defconfig
> > $ ./scripts/config -e X86_X32_ABI
> > $ make CC=3Dclang LD=3Dld.lld -j48
> >
> > The versions used:
> > $ clang --version
> > Debian clang version 20.1.2
> > (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97)
> > $ ld.lld --version
> > Debian LLD 20.1.2 (compatible with GNU linkers)
> >
> > Is this a known clang/Linux issue?
>
> I am not aware of this but it is likely because as Thomas pointed out,
> this invocation is only using clang/the integrated assembler and ld.lld,
> not the entire LLVM toolchain, which is generally what we encourage
> people to use unless there is a problem with doing so.
>
> > There's a kernel commit that addresses a similar problem:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3Daaeed6ecc1253ce1463fa1aca0b70a4ccbc9fa75
> >
> > but the error is slightly different there and the added Kconfig
> > condition apparently did not kick in.
>
> What version of binutils is being used here ('objcopy --version')? I can
> try and look into this and see if the Kconfig checks should be expanded
> to include other tools/versions. I highly doubt anyone building with
> LLVM would notice lack of x32 support, as I believe only Debian and
> Gentoo have support for it and some x86 folks have tried to put it on
> the chopping block before.

$ objcopy --version
GNU objcopy (GNU Binutils for Debian) 2.40

I'd say that the lack of x32 support is not a big problem by itself;
it was more of a surprise to figure out that the compilation failed
for the combination of newer clang versions + the syzbot kernel
configs. It worked well with clang-15.

We'll switch to LLVM=3D1, so it will hopefully prevent such problems in
the future.

--=20
Best,
Aleksandr

>
> Cheers,
> Nathan
