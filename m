Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BB0298CC6
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 19:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747336322; cv=none; b=ndH16sFbO+Y1fL7vRs3pC2XnX6lhvIjx/FG3Qioc/LXYIleJYfiohPS2WaM8Yg+k8u8BMFj6X2GUYfcn5p2f37Lv7YoDJJvUqufOsrpbsKX4fbf9KaZw/Z07ufEx9QZtkLHT+vpxHYtdXaDrGvi2YWoL5+52RQNTd9dP6PuQxow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747336322; c=relaxed/simple;
	bh=/tLECysynFXBgDzNfbZf3Iti5mnRyQyTea7FEH6I3mg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R4O1tPHMAlcPVnZIf1/ZncD44AJ4QVX/nxuCAmAw4Ig0q4o5jYM6A5lbwJMQLX7NEtZwhCQL/g6wDD2eAdpUSLcpkZNkkeY4NaEP01TWLFSdiwkOFmFBIvThtw6ec7By7xSPIzeJWN22nw3ePZXTNUAeMcX0uVpte+IfOU6wmzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=JqKrHstI; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="JqKrHstI"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 3F81440E0196;
	Thu, 15 May 2025 19:11:57 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id jScxtF3utbKq; Thu, 15 May 2025 19:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1747336310; bh=ZbVfs7SCvXTcBv7ynDg/xwY9M27U+kJ02/ndKfGETbU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JqKrHstIdcg7oK4BYkYAN+Ly1fYct9lWZf+7FsgSzWzxZfQ4PpGxAajP1/8L0zp9K
	 bcJNzbVilNrhuvw1PEktGaOnumTgow+yupAvh00aZr4h7/w7DIgx8bl/f2QNihroDc
	 dW3maPmyiWBjlY0ToRHRut6l7x4rbQuUhbFdZ1P6b5llygCuZj52KhQZ4IsM5IZN5v
	 QAvisjgdsnjVS5yvMjp6YfZxvseyTQlsLnU6Vn/9TvUpMXZ7xadXB8rzkCUjk2PHLm
	 B+7KPD0v8TLMTorNIObVJ2a1BESGvhlCUYxDTe6S+BaeDe0AS3OTprMWSttc9blyGA
	 A6GoTcADIb/Np/v/FtNoCkb2VfCKvdn/6zQMJGrmkbURMqT59knK4diodeFFd1Y5sC
	 Uv7mmM0JX3RQEbwy6ng99F6ZFzC/OdTXjsmci3/YToc5ok/2iwf/DzE8FhQVgRSlAs
	 5RiaTCpb7aVQwIkBeSdjYVXMenxGWo//pdLUVzJO8HGmjVILEjeXu3WJsuXjB2aoyv
	 yNslbyuMHwyIpsQAAelIqhAc+H9PBHkUC56tOAMCoo0pPDkF0tEpAPW88XK6OcBKjK
	 0LM41ygDohjQydGVdTqhQ4TcGnQzLjqcdfWhXMbd2OudAiyF5N+ElQYL5FZkMdLD0S
	 GSg4+SkKc/3ZNAq8NF21vQz4=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 0EB5A40E016A;
	Thu, 15 May 2025 19:11:37 +0000 (UTC)
Date: Thu, 15 May 2025 21:11:31 +0200
From: Borislav Petkov <bp@alien8.de>
To: Shivank Garg <shivankg@amd.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Brian Gerst <brgerst@gmail.com>,
	"Rao, Bharata Bhasker" <bharata@amd.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v3 1/7] x86/cpu: Use a new feature flag for 5 level paging
Message-ID: <20250515191131.GNaCY8Y7PI44akybDM@fat_crate.local>
References: <20250514104242.1275040-9-ardb+git@google.com>
 <20250514104242.1275040-10-ardb+git@google.com>
 <20250515131120.GCaCXn-E8zQutUqKLn@fat_crate.local>
 <7c315a0d-1508-4310-b584-ecaeaba52296@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7c315a0d-1508-4310-b584-ecaeaba52296@amd.com>

On Thu, May 15, 2025 at 11:50:17PM +0530, Shivank Garg wrote:
> I've re-tested the performance concerns we discussed earlier regarding 5-level paging.
> Recent tests on a current kernel don't show any performance issues:
> 
> AMD EPYC Zen 5 (SMT enabled).
> Linux HEAD 6.15.0-rc6+ 088d13246a46
> 
> lmbench/lat_pagefault:
> numactl --membind=1 --cpunodebind=1 bin/x86_64-linux-gnu/lat_pagefault -N 100 1GB_randomfile
> 
> Output values (50 runs, Mean, 2.5 percentile and 97.5 percentile, in microseconds):
> 
> 4-level (no5lvl option)
> Mean: 0.138876
>      2.5%     97.5%
> 0.1384988 0.1392532
> 
> 4-level (CONFIG_X86_5LEVEL=n)
> Mean: 0.137958
>      2.5%     97.5%
> 0.1376473 0.1382687
> 
> 5-level
> Mean: 0.138904
>      2.5%     97.5%
> 0.1384789 0.1393291
> 
> After repeating the experiments a few times, the observed difference(~1%) in mean values
> is under noise levels.
> I think these results address the performance concerns previously raised[1]. I don't
> foresee any issues in proceeding with the 5-level paging implementation
> simplification efforts[2].
> 
> [1] https://lore.kernel.org/all/80734605-1926-4ac7-9c63-006fe3ea6b6a@amd.com
> [2] https://lore.kernel.org/all/20240621164406.256314-1-kirill.shutemov@linux.intel.com

I guess Kirill could dust off his patchset from [2] and that would get rid of
CONFIG_X86_5LEVEL and likely simplify that aspect considerably...

I'd say.

And then Ard's patches would get even simpler...

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
