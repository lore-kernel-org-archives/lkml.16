Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3528E259C87
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 04:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749443542; cv=none; b=Ujxj8qvg1l5JzQi3nqWwEml2ppFETNnLxLylLI2WUfi9JBHjhz2p/Zj2GlzvFfmLS+PoH+4dtdgRUZpdZXCkahOwQMgyWSsxgsYI8Izll8oWv8PzTKCiIqZwH9SHmc6e4lfulVRpxcWHQAFtRMnXx8vKsk2amPH+27yd8jOfxNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749443542; c=relaxed/simple;
	bh=FdZ5xMRsS8L4kCJzdeb0IexN8j+Z1kdYKkOrW/omX28=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OgbyAyEdSofjqGsHYALXkkWf63X2EyI0z3Rv9DAqK7HZsTCGbr0TOl4wPdlzTrBX+kOkZCQwA9NUHuJUcS1efTMF3xOm2B60gNvVUk1ytAWVTfyehPgTZlBA6kaCNIrbCkXSX1oihG4d7QgbUN/oe4OM67djOsimQfFWfWbrhZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YuriH3Sa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YuriH3Sa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2BC5C4CEEB
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 04:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749443541;
	bh=FdZ5xMRsS8L4kCJzdeb0IexN8j+Z1kdYKkOrW/omX28=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YuriH3Sa9tYeBYlGTSaE1WkedTEgEJzMqT11baDtYMf31gTEeg3PB122OHBHdJbfd
	 ZhG+so7etPaoFpdifmKFPn5Tm37WUuUxqOPU3NtfeBqoPXiT2fF6JrwWFnnSPREm2c
	 im4qIyE385UnrkDLN71QwfNQrj7lEb0btVsNMI76FQZ9/EEyzDVzflj5/stpjsYrR1
	 YHTqyYIgPwaNjtzqwa1DAgBns2mrIqa+vnYxXwAONuVbzOMiW3R0/nf8jlOwBwXwMC
	 1DYBNtU3HWys94dIcl9q32i5ZAIg2qYM9c+bE9S8IVyN9Bku9BF5HD/KyilLAqpD5+
	 D8pny3Sr13J2A==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54b10594812so4272967e87.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 21:32:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVaGhcpAjeX/iFkbnNQf3WOtmczB2qSwJH8RwC1yW7Z/wjhkBP+4ZnEBGZL7ZjHn7ejGgYENVQLNAAreXE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yziu5ETutqedsFwN4iDteomd7FkbPtVF0Wxab+uB5lMMesT3NFj
	YYzk1Re65lamT/TZ7mLEPBNuUyWkCLxA8wsoxqIVdEmr+GkYmJ2loxbuKzvrap4YCjkvJCEbfWR
	YQJpOtG5xrGpRLr03aq37iZY/8VMumSQ=
X-Google-Smtp-Source: AGHT+IG/vSoBGoPVnUeGSR5Rgmq9JpmpZbj7EB3bohcDHvEzto0LyLdFDNmCmHJhS0bbAuP7yKY/PQDLMdVpAhRuwqg=
X-Received: by 2002:a05:6512:118c:b0:54e:9066:9af7 with SMTP id
 2adb3069b0e04-55366bea7d1mr2670834e87.27.1749443540466; Sun, 08 Jun 2025
 21:32:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602163302.478765-1-masahiroy@kernel.org> <3cebc3c4-dbaf-41f6-b98d-1d33bea2eeeb@csgroup.eu>
 <CAK7LNAQvRFVOeQhVos1T-R-Uq9ekY9Fo7HS+D=TCZziLo5TpHQ@mail.gmail.com> <8734c9wwvv.fsf@mpe.ellerman.id.au>
In-Reply-To: <8734c9wwvv.fsf@mpe.ellerman.id.au>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 9 Jun 2025 13:31:43 +0900
X-Gmail-Original-Message-ID: <CAK7LNARhhw7pg+ymaSdniXwfBbHUoAkOJiwFzuGVRoN01KhHnw@mail.gmail.com>
X-Gm-Features: AX0GCFtPsQFxjuGHywgztAGrisTJf8QTNS_os0tvyIWPeq0FJaSszxBi_gRlGoE
Message-ID: <CAK7LNARhhw7pg+ymaSdniXwfBbHUoAkOJiwFzuGVRoN01KhHnw@mail.gmail.com>
Subject: Re: [PATCH] powerpc: use always-y instead of extra-y in Makefiles
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 9, 2025 at 10:02=E2=80=AFAM Michael Ellerman <mpe@ellerman.id.a=
u> wrote:
>
> Masahiro Yamada <masahiroy@kernel.org> writes:
> > On Tue, Jun 3, 2025 at 3:50=E2=80=AFPM Christophe Leroy
> > <christophe.leroy@csgroup.eu> wrote:
> >> Le 02/06/2025 =C3=A0 18:32, Masahiro Yamada a =C3=A9crit :
> >> > The extra-y syntax is planned for deprecation because it is similar
> >> > to always-y.
> >> >
> >> > When building the boot wrapper, always-y and extra-y are equivalent.
> >> > Use always-y instead.
> >> >
> >> > In arch/powerpc/kernel/Makefile, I added ifdef KBUILD_BUILTIN to
> >> > keep the current behavior: prom_init_check is skipped when building
> >> > only modular objects.
> >>
> >> I don't understand what you mean.
> >>
> >> CONFIG_PPC_OF_BOOT_TRAMPOLINE is a bool, it cannot be a module.
> >>
> >> prom_init_check is only to check the content of prom_init.o which is
> >> never a module.
> >>
> >> Is always-y to run _after_ prom_init.o is built ?
> >
> > The intent of "make ARCH=3Dpowerpc modules"
> > is to compile objects that are necessary for modules,
> > that is, all built-in objects are skipped.
> >
> > However,
> > always-$(CONFIG_PPC_OF_BOOT_TRAMPOLINE) +=3D prom_init_check
> > would generate prom_init_check regardless,
> > and its prerequisite, prom_init.o as well.
> >
> > With CONFIG_MODULES=3Dy and
> > CONFIG_MODVERSIONS=3Dn,
> > and without ifdef KBUILD_BUILTIN,
> >
> > $ make ARCH=3Dpowerpc CROSS_COMPILE=3Dpowerpc64-linux-gnu-   modules
> >
> > would result in this:
> >
> >
> >   CC [M]  arch/powerpc/kvm/book3s_xive_native.o
> >   CC [M]  arch/powerpc/kvm/book3s_64_vio.o
> >   LD [M]  arch/powerpc/kvm/kvm.o
> >   CC [M]  arch/powerpc/kvm/book3s_hv.o
> >   AS [M]  arch/powerpc/kvm/book3s_hv_interrupts.o
> >   CC [M]  arch/powerpc/kvm/book3s_64_mmu_hv.o
> >   CC [M]  arch/powerpc/kvm/book3s_64_mmu_radix.o
> >   CC [M]  arch/powerpc/kvm/book3s_hv_nested.o
> >   CC [M]  arch/powerpc/kvm/book3s_hv_tm.o
> >   LD [M]  arch/powerpc/kvm/kvm-hv.o
> >   CC [M]  arch/powerpc/kernel/rtas_flash.o
> >   CC      arch/powerpc/kernel/prom_init.o
> >   PROMCHK arch/powerpc/kernel/prom_init_check
> >   CC [M]  kernel/locking/locktorture.o
> >   CC [M]  kernel/time/test_udelay.o
> >   CC [M]  kernel/time/time_test.o
> >   CC [M]  kernel/backtracetest.o
> >   CC [M]  kernel/torture.o
> >   CC [M]  kernel/resource_kunit.o
> >   CC [M]  kernel/sysctl-test.o
> >   CC [M]  fs/ext4/inode-test.o
> >   LD [M]  fs/ext4/ext4-inode-test.o
> >   CC [M]  fs/fat/namei_vfat.o
> >   LD [M]  fs/fat/vfat.o
> >   CC [M]  fs/fat/fat_test.o
> >   CC [M]  fs/nls/nls_ucs2_utils.o
> >   CC [M]  fs/netfs/buffered_read.o
> >   CC [M]  fs/netfs/buffered_write.o
> > ...
> >
> >
> >
> > You can see these two lines:
> >
> >   CC      arch/powerpc/kernel/prom_init.o
> >   PROMCHK arch/powerpc/kernel/prom_init_check
> >
> > are supposed to be skipped when "make modules",
> > but actually compiled without ifdef.
> >
> > So, I added ifdef KBUILD_BUILTIN to preserve
> > the current behavior.
>
> OK, that makes sense.
>
> I don't really ever build just modules, so I wouldn't notice, but some
> folks probably do.
>
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

No rush for this patch.
Please take it to your ppc tree.
Thank you.

--=20
Best Regards
Masahiro Yamada
