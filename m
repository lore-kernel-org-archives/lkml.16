Received: from pku.edu.cn (mx18.pku.edu.cn [162.105.129.181])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1719D1DF991
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 09:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.105.129.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745400996; cv=none; b=RJf08XtgRnpMweagPXAeoPlxtBzXsuIQ07W6ZX2Hcwmh1EJWqdl3I/YCXSCPYUyNLmnquDWJAEwfgmmCwJ3Oly5hdFjNw+GqAwRp1BtkNeYm66pa/txKVaGNYu+1RqzH7IbZIg1v0x3/plAXXGYRIU9XhyN7K14Q1tGkF1Jh2ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745400996; c=relaxed/simple;
	bh=0dR0EijiOHXFl07su04lllbvHZAPZc3bXqJYbVskCm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ekJdwShbGKF8ydarnXjLC0+A5/lsPflGty1jErM5ldJaz0hN98b0iF2OPnMlXjNWTEs2xp8x/NLThzsXO+XkRWucP8gQ6Ma/rPOsJEUWCWcM+0cblurkQvQsUqN5pBCwGtfqeIUeo72167jq1Y7hze8HpyU6Tl7LaBNdqXmM1/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=pku.edu.cn; spf=pass smtp.mailfrom=pku.edu.cn; dkim=pass (1024-bit key) header.d=pku.edu.cn header.i=@pku.edu.cn header.b=R6v5uWdF; arc=none smtp.client-ip=162.105.129.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=pku.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pku.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pku.edu.cn header.i=@pku.edu.cn header.b="R6v5uWdF"
Received: from pku.edu.cn (unknown [10.7.63.12])
	by mtasvr (Coremail) with SMTP id _____7Dw+MyAtAhoV+RkAA--.6301S3;
	Wed, 23 Apr 2025 17:36:01 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pku.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
	Message-ID:References:MIME-Version:Content-Type:
	Content-Disposition:In-Reply-To; bh=sWIxzkYySooPZyA3CWFH2ZhlRFHE
	L2R7O9gzuhQ4Mr8=; b=R6v5uWdFLnycZ2Hf2rjtf13GADCiUyaKMWCk8hSTyXRt
	KqZdJCzCQoOHkhBHE/PmWlNWYbaY723xxw4aTOj8/W4BIJIN54wiARiHyHV2J0ZY
	WCXE73xb28BmzgvmZD49896z9puzaTkDYYPEJjxQhXJ1mij11J5pop232E9M3as=
Received: from localhost (unknown [10.7.63.12])
	by front01 (Coremail) with SMTP id 5oFpogBHHsh2tAhokn2BAA--.54773S2;
	Wed, 23 Apr 2025 17:35:58 +0800 (CST)
Date: Wed, 23 Apr 2025 17:35:49 +0800
From: Ruihan Li <lrh2000@pku.edu.cn>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Mike Rapoport <rppt@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, "Sauerwein, David" <dssauerw@amazon.de>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, David Hildenbrand <david@redhat.com>, 
	Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Mike Rapoport <rppt@linux.ibm.com>, Will Deacon <will@kernel.org>, kvmarm@lists.cs.columbia.edu, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v3 7/7] mm/mm_init: Use for_each_valid_pfn() in
 init_unavailable_range()
Message-ID: <rp7ftbfx7kbdh4xe3ptrzx2dakwjjo3npn6b6l4wjn5zj3n5t6@cij3nx67r3av>
References: <20250423081828.608422-1-dwmw2@infradead.org>
 <20250423081828.608422-8-dwmw2@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423081828.608422-8-dwmw2@infradead.org>
X-CM-TRANSID:5oFpogBHHsh2tAhokn2BAA--.54773S2
X-CM-SenderInfo: yssqiiarrvmko6sn3hxhgxhubq/1tbiAgEIBWf35XUDOwAssa
X-CM-DELIVERINFO: =?B?69lGqaaAH6dYjNjDbLdWX9VB7ttaQFyXTaecYZzOeDisy/krtsX5TsLkpeAzENeCPc
	0+BDdXjm5Mlm64oODP/CxX7CdEvht9JHZwC6hFgN7SfXBn/8Fy5FcUojCT9CoM+EEp/rxb
	J1TmFLOdWa1Zk7IYwibDsajPQlM5qU+Ubz9/W9nmylWX+/i+jTphvck2O7OCbg==
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

Hi David,

On Wed, Apr 23, 2025 at 08:52:49AM +0100, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Currently, memmap_init initializes pfn_hole with 0 instead of
> ARCH_PFN_OFFSET. Then init_unavailable_range will start iterating each
> page from the page at address zero to the first available page, but it
> won't do anything for pages below ARCH_PFN_OFFSET because pfn_valid
> won't pass.
> 
> If ARCH_PFN_OFFSET is very large (e.g., something like 2^64-2GiB if the
> kernel is used as a library and loaded at a very high address), the
> pointless iteration for pages below ARCH_PFN_OFFSET will take a very
> long time, and the kernel will look stuck at boot time.
> 
> Use for_each_valid_pfn() to skip the pointless iterations.
> 
> Reported-by: Ruihan Li <lrh2000@pku.edu.cn>
> Suggested-by: Mike Rapoport <rppt@kernel.org>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---

Thanks! I have confirmed that this worked in my scenario and fixed the
problem I reported earlier.

Tested-by: Ruihan Li <lrh2000@pku.edu.cn>

>  mm/mm_init.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index 41884f2155c4..0d1a4546825c 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -845,11 +845,7 @@ static void __init init_unavailable_range(unsigned long spfn,
>  	unsigned long pfn;
>  	u64 pgcnt = 0;
>  
> -	for (pfn = spfn; pfn < epfn; pfn++) {
> -		if (!pfn_valid(pageblock_start_pfn(pfn))) {
> -			pfn = pageblock_end_pfn(pfn) - 1;
> -			continue;
> -		}
> +	for_each_valid_pfn(pfn, spfn, epfn) {
>  		__init_single_page(pfn_to_page(pfn), pfn, zone, node);
>  		__SetPageReserved(pfn_to_page(pfn));
>  		pgcnt++;
> -- 
> 2.49.0

Thanks,
Ruihan Li

