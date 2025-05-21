Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5682450276
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 19:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747856397; cv=none; b=OEr+UQEw5Gjq/BFT4xuthWknmwliuQZf+bBjj2qMXt590pCq1EhyGo2rABbOgxlhj0CxrKcZv5PXeRkLo3RTzNdY+WYPLVI4UNegOC2tVGC0X1Oy/oyRQ/6Yocu6v8Sh9NJxSHmqvKolC4FLlfBs8rezLEEJ45Myp4DjhRjeC94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747856397; c=relaxed/simple;
	bh=3F4V6Kk5yfSrfxV1Xk6aG9kELD/+rYisOBq19yOkN6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CB+FS+1lnH/TDCIzGFDaByP4wbFGnu3BD5YzMk55EXwMkyyjCziBEUe+TI68qb5xWTVsKEg/ZFxG507Q34Mu0YRa4NTU1HKHOKWIqsxZtiAsEZIPfQ6+dJrJNTnYmBDMXH3jrAe/EK413PJv1pJheUcYkpqfUerIo83Wvo+e9II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=kjFMCH/j; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="kjFMCH/j"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id DC46140E0239;
	Wed, 21 May 2025 19:39:52 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id DxCjkhgYBK3e; Wed, 21 May 2025 19:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1747856389; bh=7Wv82UlKiO32xVOUId3a1M/WlN7MlP+8Xbq94XNWyQU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kjFMCH/jXkH3MkCtSn51dWtij/fA+lwbuchPkn6Fxmzwk7zqbYmZeRQV59I26xkiD
	 RGDJhdm9vmMX8Fwg9LWPB5cP1rWGMZd/biAEBoompdMaWVZQ76V6VgRHTK0/crp6iR
	 AhEAv/6CKSTo5hPh2vCp022+ybELNQ+Inly8MU5iuP1vEBAymqswYr3CzVx4duno6i
	 6+1inoNJkfVO8AKI0wWXANKA+F1U0J6M8YYgwdedFw4EC+aqFhhtNDuqs+b7GbIFx5
	 f2/7VWJ5WvsstaNdLF+LPEg/jyR2Y+zmHXlFT39L6M5ZC0+64y0YDbtsiNfDjdTYRs
	 rFH8oE9TdrFcq7JOcfUDwnW26+vtbg00Aa+fOgbvVjgW6mwC/LYt27mnkyIoy+tjd7
	 SlC7Kz9tXwU0mLKdNKKPsNtYmU8QLHObtaZNhfPhzXuRVojOwPt6YlIF9Yr2mczUkn
	 NH4gIvDKNXpHJZnfD1m+vXEuSZiOSrCLT8IUaB/4bT7wbF3UPUgHG5pQLCzABHut7S
	 j4gT4Pp5hk2imReftLFw4X6mERtWv6OAt1hYY/agkQ5Lh+eqUYEYjue1VrBOuBo60c
	 G91a8+e8/D5llE7xJk5WWRuTA/SwPB/xHv4r0c9dJT92qnMbmwyVqOB3s+p4P2MKr+
	 eE41aG3u+MKeZkNKsCibgIeU=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 47BAB40E01FA;
	Wed, 21 May 2025 19:39:35 +0000 (UTC)
Date: Wed, 21 May 2025 21:39:34 +0200
From: Borislav Petkov <bp@alien8.de>
To: Rik van Riel <riel@surriel.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
	kernel-team@meta.com, dave.hansen@linux.intel.com, luto@kernel.org,
	peterz@infradead.org, tglx@linutronix.de, mingo@redhat.com,
	hpa@zytor.com, nadav.amit@gmail.com, Rik van Riel <riel@fb.com>,
	Yu-cheng Yu <yu-cheng.yu@intel.com>
Subject: Re: [RFC v2 4/9] x86/mm: Introduce X86_FEATURE_RAR
Message-ID: <20250521193934.GFaC4r9h38nCeHbt26@fat_crate.local>
References: <20250520010350.1740223-1-riel@surriel.com>
 <20250520010350.1740223-5-riel@surriel.com>
 <20250521115343.GCaC2-x8LsmMApUkjQ@fat_crate.local>
 <cb657cabbc3c87e0a821c7c3fcc16e62b7d854f4.camel@surriel.com>
 <20250521145339.GCaC3o87kpaouLZ_3D@fat_crate.local>
 <bdf83ab6f5149678ba08cfc52ef806ed705aa283.camel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bdf83ab6f5149678ba08cfc52ef806ed705aa283.camel@surriel.com>

On Wed, May 21, 2025 at 12:06:59PM -0400, Rik van Riel wrote:
> On Wed, 2025-05-21 at 16:53 +0200, Borislav Petkov wrote:
> > On Wed, May 21, 2025 at 09:57:52AM -0400, Rik van Riel wrote:
> > > I had the same thought, and tried that already.
> > > 
> > > It didn't work.
> > 
> > Care to share why?
> > 
> It resulted in RAR not being properly initialized,
> and the system hanging when trying to use RAR to
> flush the TLB.
> 
> I don't remember exactly what sequence of events
> was happening here, maybe something with the
> boot CPU per-cpu RAR initialization being called
> (or not, due to X86_FEATURE_RAR not being set)
> before the systemwide initialization?

I'm asking you to move it from this path to

                if (this_cpu->c_early_init)
                        this_cpu->c_early_init(c);

or

                if (this_cpu->c_bsp_init)
                        this_cpu->c_bsp_init(c);

a couple of lines above.

This doesn't change anything: you're still running it on the BSP once. So
I don't see how any of the above confusion would happen.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
