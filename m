Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357AC1EB9E5
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 08:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743497847; cv=none; b=n/lonOgXdMlP6xKesqaC72mOWZKY2A+hDKSrar6z8LQXfU/OZiTDPV+Lm9vD6Zv5yCGzqqvsyoRPBfBbD9t0A3j1NijRlXet0BCMyaFYASU6CzAzULawsw5e4tDMCepLWn474cRrAgc2K0KqJ/i2tYVx1KHstHe0NUeNn4zs58o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743497847; c=relaxed/simple;
	bh=1ZDHa8xMFuforAyzyMY8vZ8H4SGmm+I4WcNl1Yw9OR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lvj7RUYgy3S98WCUoTGeT1leaKN1HTHmRSzdlVsEbjeQR2F8A4r2ygAzO5zWUSz9SY+HdFYfQUyFDwPYY3UUfOaUXhTbjKdDRcX6OfjHVDW5RCUOzdg+1oGJRTBjJAiJtGcCN6agVXNr9AEIEgXYOIAhzj6EV79dzmM3Qd+xRJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OWu1LFC3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OWu1LFC3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99CCDC4CEE4;
	Tue,  1 Apr 2025 08:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743497846;
	bh=1ZDHa8xMFuforAyzyMY8vZ8H4SGmm+I4WcNl1Yw9OR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OWu1LFC3W7SVp3zgadYSZ0GGsbD2LoAtqmVnyAOv+EkDs3qaTgQYdxuVD/o2GcBt4
	 hgvOqhCTHKNgSkZ469mF4jebn5CkhCHCwdvw/Qkn4MGZp+xP096Vt2d0ox8ChCVnPM
	 HvrZlFU6xWNxvzpMbrE8kUsX7TQh4S5rjVaRJX7m9M42rGx1LJ7crkL7N/EWOPUR6k
	 HGk79DtVjrbRvNDuy14MeC8sVhSBURcWa1uH/B8q2OwC+dZKgkF0QkBYZ4hnoSYFr6
	 hiaG4aT0PwNGFWkSErAvy0uELePHyS4yBAAnkltfc9gv4S2sBY/v/k7iUhuQN3qBiN
	 q8oX2tpXAnztg==
Date: Tue, 1 Apr 2025 10:57:21 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Balbir Singh <balbirs@nvidia.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Kees Cook <kees@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Andy Lutomirski <luto@kernel.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Bert Karwatzki <spasswolf@web.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] arch/x86: memory_hotplug, do not bump up max_pfn for
 device private pages
Message-ID: <Z-uqcSYvRD6ZPPQs@gmail.com>
References: <20250401000752.249348-1-balbirs@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401000752.249348-1-balbirs@nvidia.com>


* Balbir Singh <balbirs@nvidia.com> wrote:

>  arch/x86/mm/init_64.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
> index dce60767124f..cc60b57473a4 100644
> --- a/arch/x86/mm/init_64.c
> +++ b/arch/x86/mm/init_64.c
> @@ -970,9 +970,18 @@ int add_pages(int nid, unsigned long start_pfn, unsigned long nr_pages,
>  	ret = __add_pages(nid, start_pfn, nr_pages, params);
>  	WARN_ON_ONCE(ret);
>  
> -	/* update max_pfn, max_low_pfn and high_memory */
> -	update_end_of_memory_vars(start_pfn << PAGE_SHIFT,
> -				  nr_pages << PAGE_SHIFT);
> +	/*
> +	 * add_pages() is called by memremap_pages() for adding device private
> +	 * pages. Do not bump up max_pfn in the device private path. max_pfn
> +	 * changes affect dma_addressing_limited. dma_addressing_limited
> +	 * returning true when max_pfn is the device's addressable memory,
> +	 * can force device drivers to use bounce buffers and impact their
> +	 * performance
> +	 */
> +	if (!params->pgmap)
> +		/* update max_pfn, max_low_pfn and high_memory */
> +		update_end_of_memory_vars(start_pfn << PAGE_SHIFT,
> +					  nr_pages << PAGE_SHIFT);

So given that device private pages are not supposed to be mapped 
directly, not including these PFNs in max_pfn absolutely sounds like 
the correct fix to me.

But wouldn't the abnormally high max_pfn also cause us to create a too 
large direct mapping to cover it, or does something save us there? Such 
an overly large mapping would increase kernel page table size rather 
substantially on non-gbpages systems, AFAICS.

Say we create a 16TB mapping on a 16GB system - 1024x larger: to map 16 
TB with largepages requires 8,388,608 largepage mappings (!), which 
with 8-byte page table entries takes up ~64MB of unswappable RAM. (!!)

Is my math off, or am I misunderstanding something here?

Anyway, I've applied your fix to tip:x86/urgent with a few edits to the 
comments and the changelog, but I've also expanded the Cc: list of the 
commit liberally, in hope of getting more reviews for this fix. :-)

Thanks,

	Ingo
