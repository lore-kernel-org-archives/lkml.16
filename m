Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483251FDE1B
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 12:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739275212; cv=none; b=TVNqLuAiONBa30cXghGQ6vNYBiD8dqg/Ix3xs1L30DCs4vOp6MmbyTRJz8wumPy9hH2GfhSbDEjGa9we4xtenepaHpSyCI8mbB9zubm7bhIwW+gdxNDJgdceZ0fMiqeTP9maAT7HdMX072+eoQtiNmJsBCY7eM6dO9it5t/mwtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739275212; c=relaxed/simple;
	bh=TA/0R93IHQ5a5+EgaK8V4VBeM1CqKJGCSR6MePdrRSI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pegbggzZ+I0zM/h9qBfodrh0oVxL12EmfkIJnIt0E8hBg7rLNnD9+cGvC5VQyjFgO5QNFvB/Bv/AcWu7I7YZZfp7uTyGV2zDt+U6wdwiVkO1nfK2lpo5KMv4cUimEt1HeulMIvLQu31AMS1E+GLORgEkrYv9vtJxTzg4S1kPWA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UJy3YIZ9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UJy3YIZ9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2124C4CEE6
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 12:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739275211;
	bh=TA/0R93IHQ5a5+EgaK8V4VBeM1CqKJGCSR6MePdrRSI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UJy3YIZ9fCzPNCmneEjKfEMaIUNOq291JlFZ7Eaix6faH1/8mlqH+lsCbGLKUFFth
	 5y+/Qf+64SNXGnUuBUdaj6deqjP3B17hVMFzfyfJzEX6UL3xp4qI/i0JdB21I9cibC
	 93YzdS20pHugLhcA/F/F0g1yJoNSR4xP+pPKGmdEbyUYko4bbYYuFzw/EzXUAhrRTI
	 cFbdSe3vlDSDHCRYbRUDvpeFEH3lCY2M5MW1sJzG9Odo+hx0+ICGP4FvXPisZI1vQW
	 rw5uBQM6SDSyDueaNvCKvCX0C6Wq9cWgvKSWEEx02m8B+T5eSnaKXVBWg2tl/UnZem
	 UwdT4DbJJ8JFg==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5de56ff9851so6645245a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 04:00:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWShW1/JDFfXFsa/HQU9de+iW6MaUR10vopctoRv/6rGZgJCzfHUXHYgZvFbKDvkwt4VgLb60BLZOedYzk=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe+kXpi0+cLAqu6/12aG0UEqDqysHQ//Xod41eZ2zviqwWQSsp
	5/HjL9YUb2jf66P6bJYgigHMZdfpzimflfSyaGUx2PfiRy5uXIZJUh+15UfsBJpiMPm6jLBFkzA
	n4V5/Zrs9EYSWVHAShG6zN3Zas94=
X-Google-Smtp-Source: AGHT+IGHNVu0tpCqBhu4Mn6yiKyLBRk68octjzuRqFLITUadZkfqBm0qT5yqHWB/5lCGcOlApRkFsS/UArIYCQrmr1k=
X-Received: by 2002:a05:6402:2381:b0:5dc:1273:63fd with SMTP id
 4fb4d7f45d1cf-5de9a4646eamr2670591a12.20.1739275210215; Tue, 11 Feb 2025
 04:00:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241217010905.13054-1-yangtiezhu@loongson.cn>
 <ef1e3e7c-0117-175c-5a85-091382696748@loongson.cn> <20250115013444.anzoct6gvs56m225@jpoimboe>
 <4612bfd8-442e-fecb-240f-46e735b48540@loongson.cn> <20250210212653.oidcl4aqyrcu3yzi@jpoimboe>
In-Reply-To: <20250210212653.oidcl4aqyrcu3yzi@jpoimboe>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 11 Feb 2025 19:59:57 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7MVDj0CbXfwveb7GDn+D=O4N6oUT6rpGrbGmYPLPpRPg@mail.gmail.com>
X-Gm-Features: AWEUYZm-JyjLlJb0diDoeBFwWO6Ti4dJ5QC9IXpt6JgfAfQvWaJ4NXEm6A9WSfc
Message-ID: <CAAhV-H7MVDj0CbXfwveb7GDn+D=O4N6oUT6rpGrbGmYPLPpRPg@mail.gmail.com>
Subject: Re: [PATCH v6 0/9] Add jump table support for objtool on LoongArch
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, Peter Zijlstra <peterz@infradead.org>, 
	loongarch@lists.linux.dev, amd-gfx@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Josh,

On Tue, Feb 11, 2025 at 5:26=E2=80=AFAM Josh Poimboeuf <jpoimboe@kernel.org=
> wrote:
>
> On Mon, Feb 10, 2025 at 02:07:43PM +0800, Tiezhu Yang wrote:
> > On 01/15/2025 09:34 AM, Josh Poimboeuf wrote:
> > > On Sat, Jan 11, 2025 at 02:57:42PM +0800, Tiezhu Yang wrote:
> > > > Hi Josh and Peter,
> > > >
> > > > On 12/17/2024 09:08 AM, Tiezhu Yang wrote:
> > > > > This version is based on tip/tip.git objtool/core branch [1], add=
 some weak
> > > > > and arch-specific functions to make the generic code more readabl=
e, tested
> > > > > with the latest upstream mainline Binutils, GCC and Clang.
> > > >
> > > > ...
> > > >
> > > > > [1] https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/l=
og/?h=3Dobjtool/core
> > > > >
> > > > > Tiezhu Yang (9):
> > > > >   objtool: Handle various symbol types of rodata
> > > > >   objtool: Handle different entry size of rodata
> > > > >   objtool: Handle PC relative relocation type
> > > > >   objtool: Handle unreachable entry of rodata
> > > > >   objtool/LoongArch: Add support for switch table
> > > > >   objtool/LoongArch: Add support for goto table
> > > > >   LoongArch: Enable jump table for objtool
> > > > >   LoongArch: Convert unreachable() to BUG()
> > > > >   drm/amd/display: Mark dc_fixpt_from_fraction() noinline
> > > >
> > > > Are you OK with the first 8 patches?
> > > > What's the merge plan for this series?
> > >
> > > Sorry, my inbox is still reeling from the holidays.  I will review th=
is
> > > soon.
> >
> > What are the status of the first 8 patches?
> > What is the next step? Is there anything else to be done here?
> > I would really appreciate any advice on how to get this merged.
>
> Please post a new revision rebased on tip/master, with patch 4 dropped,
> and I'll queue them up for -tip.  Thanks for your patience.
You will queue the whole series, or the first 5 patches, or the first 3 pat=
ches?

Huacai

>
> --
> Josh
