Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20FD27EC80
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 11:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744631550; cv=none; b=IuNENyDq8rzGS1/AY/Sugna4Zy7ZD9BikFrBzJLfVy2TA10h4W+aGtaHx/CT5r7xPZZYrKzcFYs6rvdz7aF3dCNipTf1HutfpMDEk1/hj7CxuXMhql+iwCThY7cAeDhf3VdvfwKE6+jSgGIJTSwJvkk3Sx2sVYan8cM6iJq2/MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744631550; c=relaxed/simple;
	bh=KfKOhUHvwKii5VUYlMOmSKI4Vkykx2nDvcDbKrinrHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ogmcb/mRLA0LHBjjYV4Ls7Wm4T79DptSuIRwmb3yUMDEG6ECrqnD3FWv0I1YtBAEvFrdUNFy651bfMXOEMrdKgc4AAYTZ/Ut0YvuJ8UBsa2uAju1A74wYXZrk2EU2By1Ha+vel+C+GpXChM/Vs2tWXe21+00eJhSbpzt7ZOXd7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=CSraY4xo; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="CSraY4xo"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 4F54B40E0246;
	Mon, 14 Apr 2025 11:52:25 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id QPbqfxEoeayK; Mon, 14 Apr 2025 11:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1744631541; bh=V8lmSW+1+g0mbX8G/iVIf8KmlDPKAruKJi28jrUhXGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CSraY4xoHC7UqV+pMRstlujLqOuUjF5T8fC6KYy84negx5nc8kRplIQVGzyKZbMPC
	 MbjbGpjcl5gJ/FI4F9bUnYEcU8BsaWJ8bDUQgZXKWouEgWLEfLMxMNGUEFBQIVY0it
	 uL8t1sOpUL0XwpPmXvT4SfsNZ66YrFLkEMR31LGHWcVK43ZOoRScqtAhHiY7S9M2r0
	 9GCzEyGO7cwKDwoNVP1Z/a3ph3JSHZi0wwyol9Mfm/6xvE6n/NPSE9dFVOV3Ii7S+5
	 nOE7m15yxHiZuixFLFcaCdsTVpLOGwyykNstZ+5/gEYpcqYYgDY7bHdjhtCY7+e9sa
	 JfJho91UtnlFz5oL7bLOMURkwqQ456XGFSPizG+MS7vqzgN6Xq9z40glBg7ih43Y9j
	 cAysifZIWVgA4K+n1qytmKIxVCV6bUoWFifu6afDCq+mEQCDSMvnue44DovpNdRGDO
	 2K7oMGwntRMHYdrlsUXuQk7oYW0ZcJgFNs4iyUZZs466y1a4KunlPKQAhjEDcPW1jH
	 EI0LGW2yiuuNvA5cr/ujuW0FDiYFG3ZuLzdW/t3dA9BGLhsgTdiESdja4tUBdrterU
	 pMHKiM4uBB+mz3mJ+R9Zk8XcV6dOsj0w6ws5BqbLI/ly+eJpujSkE6PYbAjEOshuQI
	 8MM0CEzJnNWNKbGutXV8hqS4=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 6BE6640E0247;
	Mon, 14 Apr 2025 11:52:15 +0000 (UTC)
Date: Mon, 14 Apr 2025 13:52:08 +0200
From: Borislav Petkov <bp@alien8.de>
To: Mikhail Paulyshka <me@mixaill.net>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] x86/rdrand: implement sanity check for RDSEED
Message-ID: <20250414115208.GCZ_z26G-_udwdX8JD@fat_crate.local>
References: <20250312123130.8290-1-me@mixaill.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250312123130.8290-1-me@mixaill.net>

On Wed, Mar 12, 2025 at 03:31:28PM +0300, Mikhail Paulyshka wrote:
> On the AMD Cyan Skillfish (Family 0x17 Model 0x47 Stepping 0x0), which 
> is a Zen2-based APU found on the AMD BC-250 board, there is a situation 
> where RDRAND works fine, but RDSEED generates FF. This leads to some 

Ok, sorry, it took a bit longer than expected.

Your patch should simply disable RDSEED in CPUID on that family, model,
stepping CPUs. No need for the RDSEED sanity check.

So feel free to send v2.

I was gonna say, for extra points you could use CPUID faulting and completely
shield off userspace from that RDSEED but your CPU doesn't support it.

:-)

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
