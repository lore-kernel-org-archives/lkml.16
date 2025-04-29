Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E79212F94
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 11:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745927592; cv=none; b=aT0lLEPYQAyh0HdWZGOIr05b9j8ggUsFrEgL4wWepM7RVuurBsoouNe2tvJNfy9jRznQr+eP7+FWXOX+3w/PT+2XEu5YQbWLkb/J0VYKe0zHzKKHK1Li2b+NOkvr4nIxOMLjOvAlUyuLnlYMvH21ZJOxxd10vMfFcMda8Gtjn9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745927592; c=relaxed/simple;
	bh=dOs92CKf0JhMagJiyIOByRh4TMYp16+L6S0KbSvHqB8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HOdRtAVt0uuhZ1mTO93cO527BBgV7RoRj5lLVwTf/bbwN2gLYSVI8n079eDFhmYjk5jx/yceVUX1+xX6PT/7Va7XC2ShJrP2rdLA2R04OufUmJlmOJZMOF7HEQIUW7RenBWOTtiCqmmVdg97OPZb/cIIdrGpNMO7nMfBuRND6yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jdnx5YVa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jdnx5YVa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED381C4CEED
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 11:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745927592;
	bh=dOs92CKf0JhMagJiyIOByRh4TMYp16+L6S0KbSvHqB8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Jdnx5YVa8iTnPm4OVQaPtsNbH/eFhsv1mdPn+laK8veqx8RFTlOYKnIRrXxQcb2IH
	 +WT6eWSb0OspWYUio/YT63ArpFsHuL2MDe8D/fPkYkXRJEkQQrYlXCghr8sGn8ND/N
	 YNFKoBY+igMTRFi8Qxqe0m6h4YDhxD0LmH37wzmgtUakLa8TAbZE+rfKJ1whShQ74e
	 SKmjP5hrexVF2FpMeypZgSD4cN+REtDBBqUMsSOh+205W3WkPmCJfGlhjpIgPhnb8A
	 q3WMVmUZdwWtGw5mdLV20PtVVON4P2fXkPlgad+OSesewX5+occxfaOeNr95pHQ5OZ
	 NLFc4ugACrghw==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac3b12e8518so996774466b.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 04:53:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVYOLicbdhMIUasXQXTe3hGwgNyOc6hA+RUCfoYHxpLszbsWAX/ZlSSacHrJg1Khw8x5sr4+9t0WXkyBK4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ8XFj9uG8TfJzeelt+anzLBxKcJv4JfN3wcI4f4RZRDJdcYnd
	bcWKCcckd7f/h4lRFdkq8gILU6BMKF0UQqpAECV5EzAKjoQdVxgW5LF3vB/FH1JjphNIdXmhTku
	Do34RgjSrAmkr6rlF5nffFDrZcg0=
X-Google-Smtp-Source: AGHT+IEOc0slPQQuRPi+/t75tAzM7Kw+t3BjM1qUAK0bLzbKgCW9Ard89lg2K2P8XBa8OYHMFV6WKJ5Dqgb836X68W4=
X-Received: by 2002:a17:907:3f9a:b0:ac7:c688:9fd7 with SMTP id
 a640c23a62f3a-ace848f7749mr1229208766b.18.1745927590527; Tue, 29 Apr 2025
 04:53:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429113356.17929-1-zhangtianyang@loongson.cn> <f0d7965a0016f458bb06e2968c15d8eb46be296e.camel@xry111.site>
In-Reply-To: <f0d7965a0016f458bb06e2968c15d8eb46be296e.camel@xry111.site>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 29 Apr 2025 19:52:59 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7BejoBtsGWP8tn99Pa93M0ij=yXg_E+GJKLETYWhCt3A@mail.gmail.com>
X-Gm-Features: ATxdqUHO0eWqPX9CX9I_BHbVYAeYG8YI1PTfS3hUPzH80g1GxIrTZ8PAqX5drT0
Message-ID: <CAAhV-H7BejoBtsGWP8tn99Pa93M0ij=yXg_E+GJKLETYWhCt3A@mail.gmail.com>
Subject: Re: [PATCH] LoongArch:support CONFIG_SCHED_MC
To: Xi Ruoyao <xry111@xry111.site>
Cc: Tianyang Zhang <zhangtianyang@loongson.cn>, kernel@xen0n.name, wanghongliang@loongson.cn, 
	yangtiezhu@loongson.cn, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 7:44=E2=80=AFPM Xi Ruoyao <xry111@xry111.site> wrot=
e:
>
> On Tue, 2025-04-29 at 19:33 +0800, Tianyang Zhang wrote:
> > From: wanghongliang <wanghongliang@loongson.cn>
> >
> > In order to achieve more reasonable load balancing behavior,
> > support for SCHED_MC has been added.
> > The LLC distribution of Loongarch now is consistent with numa-node,
> > the balancing domain of SCHED_MC can effectively reduce the situation
> > where processes are awakened to smt_slibing
> >
> > Co-developed-by: wanghongliang <wanghongliang@loongson.cn>
> > Signed-off-by: wanghongliang <wanghongliang@loongson.cn>
> > Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
> > ---
> >  arch/loongarch/Kconfig                |  9 ++++++
> >  arch/loongarch/include/asm/smp.h      |  1 +
> >  arch/loongarch/include/asm/topology.h |  8 +++++
> >  arch/loongarch/kernel/smp.c           | 46 +++++++++++++++++++++++++++
> >  4 files changed, 64 insertions(+)
> >
> > diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> > index 1a2cf012b..72a142a85 100644
> > --- a/arch/loongarch/Kconfig
> > +++ b/arch/loongarch/Kconfig
> > @@ -493,6 +493,15 @@ config NR_CPUS
> >         This allows you to specify the maximum number of CPUs which thi=
s
> >         kernel will support.
> >
> > +config SCHED_MC
> > +     def_bool y
> > +     prompt "Multi-core scheduler support"
> > +     depends on SMP
> > +     help
> > +       Multi-core scheduler support improves the CPU scheduler's decis=
ion
> > +       making when dealing with multi-core CPU chips at a cost of slig=
htly
> > +       increased overhead in some places. If unsure say N here.
>
> To me it's puzzling to say "if unsure say N here" while setting the
> default to y.
It seems copied from x86, I suggest to modify to

+config SCHED_MC
+ bool "Multi-core scheduler support"
+ depends on SMP
+ default y
+ help
+  Multi-core scheduler support improves the CPU scheduler's decision
+  making when dealing with multi-core CPU chips at a cost of slightly
+  increased overhead in some places.

And put it after SCHED_SMT.

Huacai


>
> --
> Xi Ruoyao <xry111@xry111.site>
> School of Aerospace Science and Technology, Xidian University
