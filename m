Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702291E5B7E
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 01:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746061504; cv=none; b=se2ydKBWcKFTNQLwsn7FHoHtPlXyI7/qcNutIYXB30el35h5YLwGoIDaP3yog8kSdrrorrUvSVYIOjr16WErSEforkPDftoVXXiICtr9zbuNphuHb6Jb/Lk3KCNQCsKk6EHZTjtejHcojfYniKHOClMKnbbVApgelaZ8shchwVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746061504; c=relaxed/simple;
	bh=WMl28Lmu+2TczryI0+p8liM6J7TY6ZIfB94iMb+TTfs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MNJwdgtW7hVNaP7xjXr9wtZTHatXP5h5WiQew7vGmOzQjpkab3F5KSAi5EQRTSnHeoxbTTXBm/Q8FA/VyvYBYadenximoH4VdQQ1s7N6HGvi0T3qG4eXjTb5N1gJciDjRaoo/Y5WKc4JIyIAMbXy3URtkNPeheSvHk8FNssQnfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Z5tJBsCe; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Z5tJBsCe"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id B8EEC25D64;
	Thu,  1 May 2025 03:04:54 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z5JDQRzBTFpD; Thu,  1 May 2025 03:04:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1746061494; bh=WMl28Lmu+2TczryI0+p8liM6J7TY6ZIfB94iMb+TTfs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z5tJBsCe9xHmfY09Yh2wjCyaryrltJGkptjJWqi+RC3jXb02u/hjN6++tBnO/mpdW
	 RxeNiZqagFcBwSGiu3WeKyLI6zcqD0cDe5DGsYn4BhotbEO+sofPL3xgGQH3D/NJCz
	 oDSdFqvRXdolrQ8WGxC164aRSsEQ5LAWA1DQz3g+XgkRVPKcC58m3F2fG2S2ZPDYEC
	 /fSKPzEc6zGTt1/9BBnLCfN676FmWLbcA884k/kTGm+j/uEjnowXqlZP+GB/bKtgdu
	 3WUBxpVmt7ZTW1Dzzx319YiH9AYJJXJJJRq6thPRHTwpl64aE7TjLkWFHJoXmWotBJ
	 MkjoMpgeolLDw==
Date: Thu, 1 May 2025 01:04:20 +0000
From: Yao Zi <ziyao@disroot.org>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>, Thomas Gleixner <tglx@linutronix.de>,
	Tianyang Zhang <zhangtianyang@loongson.cn>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Jianmin Lv <lvjianmin@loongson.cn>, loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org, Mingcong Bai <jeffbai@aosc.io>,
	Kexy Biscuit <kexybiscuit@aosc.io>
Subject: Re: [PATCH] LoongArch: Use a fallback CPU model when IOCSR-based
 model probing fails
Message-ID: <aBLIlNAWLbZ1hBv0@pie>
References: <20250430054042.24333-2-ziyao@disroot.org>
 <CAAhV-H7t8NJYEA=JqSVVFPRZauuqc4pyj6bgNCDRjWcDqR2dqg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAhV-H7t8NJYEA=JqSVVFPRZauuqc4pyj6bgNCDRjWcDqR2dqg@mail.gmail.com>

On Wed, Apr 30, 2025 at 03:48:25PM +0800, Huacai Chen wrote:
> Hi, Yao Zi,
> 
> On Wed, Apr 30, 2025 at 1:41 PM Yao Zi <ziyao@disroot.org> wrote:
> >
> > Reading vendor and cpuname IOCSRs yields 0x258000fff00 instead of
> > human-readable model strings on Loongson 2K0300 SoC, which messes up
> > format of /proc/cpuinfo since it represents as an empty string.
> CPUNAME IOCSR is filled by firmware and readed by kernel. If you read
> some garbage, that means you need to modify your firmware.

Thanks for the hint, I'll take a look in my firmware instead.

> And if there is completely no CPUNAME register, you need to fill it by
> FDT, see init_cpu_fullname() in arch/loongarch/kernel/env.c.
> 
> Huacai

Best regards,
Yao Zi

> >
> > Let's consider IOCSR-based model probing fails if the result model is an
> > empty string. A fallback model name is set in such cases.
> >
> > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > ---
> >  arch/loongarch/kernel/cpu-probe.c | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/loongarch/kernel/cpu-probe.c b/arch/loongarch/kernel/cpu-probe.c
> > index fedaa67cde41..785513d43696 100644
> > --- a/arch/loongarch/kernel/cpu-probe.c
> > +++ b/arch/loongarch/kernel/cpu-probe.c
> > @@ -270,12 +270,13 @@ static inline void cpu_probe_loongson(struct cpuinfo_loongarch *c, unsigned int
> >         if (!cpu_has_iocsr)
> >                 return;
> >
> > -       if (!__cpu_full_name[cpu])
> > -               __cpu_full_name[cpu] = cpu_full_name;
> > -
> >         *vendor = iocsr_read64(LOONGARCH_IOCSR_VENDOR);
> >         *cpuname = iocsr_read64(LOONGARCH_IOCSR_CPUNAME);
> >
> > +       if (!__cpu_full_name[cpu])
> > +               __cpu_full_name[cpu] = cpu_full_name[0] ? cpu_full_name :
> > +                                                         "Loongson-Unknown";
> > +
> >         config = iocsr_read32(LOONGARCH_IOCSR_FEATURES);
> >         if (config & IOCSRF_CSRIPI)
> >                 c->options |= LOONGARCH_CPU_CSRIPI;
> > --
> > 2.49.0
> >
> >
