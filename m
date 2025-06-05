Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869911876
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 06:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749105412; cv=none; b=eAJSdtmx5gVoQ071daKT2uov0Na3TO662hklAss42wV6w/Uhq23VdFDyQIgfj2XsR2dPOEQnpfasjS8yXoZCAwnB82nytsD8JTjh7sNrFffQSb0hMERKwNSFr3iYxJ9ueUP7odqvx19ohs8WEo0TpH44HxSQiwDf/mL0hlM6Amo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749105412; c=relaxed/simple;
	bh=lexn+3RvTYohQzS2vm1pNRLFzrcMJVmP0yTe8m0a7eQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VT28Wb3nf/cw5v96vn6GQd80OxwFVYSE2JOXxipH+jF9wa7myPswJEuRVdhOub/BFOO8I1Jny0WfdeOwKjmY6ZzlCUmBqnQCsYVHuDNKm4+ftf6GyoDOSouY3A85KMqs+q1E97QKS3r2NdlsEh3XPq6iOIfRjvfq98d7Ct+wfHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c1zmh8cK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c1zmh8cK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 609C5C4CEE7;
	Thu,  5 Jun 2025 06:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749105412;
	bh=lexn+3RvTYohQzS2vm1pNRLFzrcMJVmP0yTe8m0a7eQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c1zmh8cK3yfu4BaW+JXF+XxG4WJymnndlXcaPg//PPRYuItmYoX3DSLV6tAslJN1V
	 lS59assDhKUuUq6M2hE/0u5f6Q/LmtsniUdNfDFv2GXYrtA+OLMD0I9laIYE4SR9Uj
	 QAvq4FuwmeVWoZdQ3aSvVfmC9Hx3xTFvpIbNTr7HBxC98VlQJBzOb+KQBw4oyjeeJJ
	 niQXV4JfQo3x/s7OaJkigJ3jsPIbM8kDg0E3KYDFhXrHRrdhlNix6wNBvI5/tQm5gy
	 bruvUwxYI2jzIHzzjX4xAWZf1i0+hllcRJUjEZTr8xt9uDIfJQGqUEGfOMi05YMphz
	 wc2H2eMN2ER4w==
Date: Thu, 5 Jun 2025 08:36:45 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Em Sharnoff <sharnoff@neon.tech>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, linux-mm@kvack.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
	Oleg Vasilev <oleg@neon.tech>,
	Arthur Petukhovsky <arthur@neon.tech>,
	Stefan Radig <stefan@neon.tech>, Misha Sakhnov <misha@neon.tech>
Subject: Re: [PATCH] x86/mm: Handle alloc failure in phys_*_init()
Message-ID: <aEE6_S2a-1tk1dtI@gmail.com>
References: <9f4c0972-a123-4cc3-89f2-ed3490371e65@neon.tech>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f4c0972-a123-4cc3-89f2-ed3490371e65@neon.tech>


* Em Sharnoff <sharnoff@neon.tech> wrote:

> tl;dr:
> 
> * When setting up page table mappings for physical addresses after boot,
>   alloc_low_page() uses GFP_ATOMIC, which is allowed to fail.
> * This isn't currently handled, and results in a null pointer
>   dereference when it occurs.
> * This allocation failure can happen during memory hotplug.
> 
> To handle failure, change phys_pud_init() and similar functions to
> return zero if allocation failed (either directly or transitively), and
> convert that to -ENOMEM in arch_add_memory().

> +		/*
> +		 * Bail only after updating pgd/p4d to keep progress from p4d across retries.
> +		 */
> +		if (!paddr_last)
> +			return 0;
> +
>  		pgd_changed = true;

> -	init_memory_mapping(start, start + size, params->pgprot);
> +	if (!init_memory_mapping(start, start + size, params->pgprot))
> +		return -ENOMEM;

I agree that it makes total sense to fix all this (especially since you 
are actively triggering it), but have you tried also changing it away 
from GFP_ATOMIC? There's no real reason why it should be GFP_ATOMIC 
AFAICS, other than some historic inertia that nobody bothered to fix.

Plus, could you please change the return flow from this zero 
special-case over to something like ERR_PTR(-ENOMEM) and IS_ERR()?

*Technically* zero is a valid physical address, although we 
intentionally never use it in the kernel AFAIK and wouldn't ever put a 
page table there either. ERR_PTR()/IS_ERR() is much easier on the eyes 
than the zero special-case.

Finally, could you make this a 2-patch fix series: first one to fix the 
error return path to not crash, and the second one to change it away 
from GFP_ATOMIC?

Thanks,

	Ingo
