Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850DA1F09AA
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 17:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744305936; cv=none; b=m4eoQwl424jJPuaN8yDEZ9ItxwNzqG7aZz3+vqNDl9klGU0gSXeYTU2nWs4EaMXCAIWvD13t/qxZJzf+x1MfgREwMRIOlMDpCy4rUp4OeKNCZfJlVCUKH+CvU54WN8fdjjamNEAFOwCqmAY3hDw80ZscOE+BDnEbMxiQ+3ztLXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744305936; c=relaxed/simple;
	bh=23d8nmbRUst1PfzBKswy8av7tQ6IK6Kkqq9MAhFStTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AFwzAXqaVxodFmCQ4eqjSQwZJRFAnAWfTMqw9w0XAHmx+av+9pfzg/bU5+IjBaTHOCvtijjA05Oa1E0x8cn99FOc6+X4V2xMfurA3w97l0/RuixXEQov0QykGqdhdY5VhFiLMZnryHEGVrWkOy3xkjHBmDzv2wCaFlQBFov++A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=capGqXvP; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="capGqXvP"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id AC49F40E0244;
	Thu, 10 Apr 2025 17:25:29 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id bVykJKfg0E3O; Thu, 10 Apr 2025 17:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1744305925; bh=501ci1LsN0GUHGa/v9cW2D3L67ygwvMzy6QfcuojzeQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=capGqXvP4Fzj91G40NbmSXtGvem3OlYtuxiXBaZkQqIo+AULTcg6xGt+YvpQfDJaz
	 yMhUyK5SfEoF6wihQhgzcJYKIHdFvUAFBX0zEgoDeeceVsJbIJdBdTuJs29bAYoFtA
	 ssIzHHiTc6Q2pkMIWvf6SnmRzUimU+wa3SW8Gqp7uX2wE2c0m/4jJlwAV5ssv2WIPB
	 KA/ju9Vl2E1oakQpE7mAUcdMPLW036/PsMuCzgT+iaYD8BkR9GKOc3cBCf+dTSMFch
	 cCJZLwJWtBWMQppncG7j0CBKf1CCgusqnTDboMtVzFI4aVgSSG8T3nXEEX7nqWlhEl
	 UiPm5+T9edliypmNhDzljf66cbSUsO9vqgelu32lQW4ZuKgnU73xSIFaKXMZm74wwQ
	 eiUg2gydKOfvNyn0TYNzgtkPbS3Z7UeLNro5a7soV7CJ/CzqLuDMpYLXXJkBmuM+2n
	 wnXjG+Tx9wAH8YHJkqXtadI85km6eBNWCZ3/Yn2OZXr/EuOuXb3QDv7bLP5LCPn/DS
	 HovGgghJh0OHVg6zGzNOpwhwTKE113UZe+qMfKqkKq4VLUmC46CZXmF2bTNW8f7yvh
	 iLryK1fWNC9eWUdFClojMqmgwgxJK/i+ez/vPVxzRgl1UF9sejnBppyavCqCu3U3ne
	 /OI4Ovz9I7zoVLbiKhBUXJcY=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 60DD940E0196;
	Thu, 10 Apr 2025 17:25:21 +0000 (UTC)
Date: Thu, 10 Apr 2025 19:25:14 +0200
From: Borislav Petkov <bp@alien8.de>
To: Xin Li <xin@zytor.com>
Cc: Borislav Petkov <bp@kernel.org>, X86 ML <x86@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] x86/cpufeatures: Clean up formatting
Message-ID: <20250410172514.GFZ_f--kaKKxF-Y6WZ@fat_crate.local>
References: <20250410165434.20648-1-bp@kernel.org>
 <a8782d3a-9c22-48c3-916f-29babc58db5f@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a8782d3a-9c22-48c3-916f-29babc58db5f@zytor.com>

On Thu, Apr 10, 2025 at 10:11:56AM -0700, Xin Li wrote:
> On 4/10/2025 9:54 AM, Borislav Petkov wrote:
> > @@ -477,10 +477,10 @@
> >   #define X86_FEATURE_BHI_CTRL		(21*32+ 2) /* BHI_DIS_S HW control available */
> >   #define X86_FEATURE_CLEAR_BHB_HW	(21*32+ 3) /* BHI_DIS_S HW control enabled */
> >   #define X86_FEATURE_CLEAR_BHB_LOOP_ON_VMEXIT (21*32+ 4) /* Clear branch history at vmexit using SW loop */
> > -#define X86_FEATURE_AMD_FAST_CPPC	(21*32 + 5) /* Fast CPPC */
> > -#define X86_FEATURE_AMD_HETEROGENEOUS_CORES (21*32 + 6) /* Heterogeneous Core Topology */
> > -#define X86_FEATURE_AMD_WORKLOAD_CLASS	(21*32 + 7) /* Workload Classification */
> > -#define X86_FEATURE_PREFER_YMM		(21*32 + 8) /* Avoid ZMM registers due to downclocking */
> > +#define X86_FEATURE_AMD_FAST_CPPC	(21*32+ 5) /* Fast CPPC */
> > +#define X86_FEATURE_AMD_HETEROGENEOUS_CORES (21*32+ 6) /* Heterogeneous Core Topology */
> > +#define X86_FEATURE_AMD_WORKLOAD_CLASS	(21*32+ 7) /* Workload Classification */
> > +#define X86_FEATURE_PREFER_YMM		(21*32+ 8) /* Avoid ZMM registers due to downclocking */
> 
> Ha, I did a similar cleanup with adding the immediate MSR instruction
> support (you asked to use scattered):
> 
> https://lore.kernel.org/lkml/20250331082251.3171276-9-xin@zytor.com/

Except you're moving the numbers one column to the right while the other
columns remain at that indentation.

Instead of re-tabulating that whole file, I think we should simply shorten
those

X86_FEATURE_AMD_HETEROGENEOUS_CORES and X86_FEATURE_CLEAR_BHB_LOOP_ON_VMEXIT

straddlers.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
