Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20EAC2EF
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744009648; cv=none; b=rPFXVimlgi+tjLZicCPu2E7WwjBXZS8sagIxM3FyOBfC3s5PYOhNOwc9IHDwU00cL4wKYbPh/YzMUmLVLX0jtCl2bq51KVjjigpO2HIJbEl9LFktFUqrGMR3Q8Q7kexBv75T8a1hbguy+/yFnL+pQ4IvbwUhSz9aQujXFTnR6eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744009648; c=relaxed/simple;
	bh=OPZXRFuI5uzN707xyLASfygRwfYY/xEScjSG9fL5FtI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tcp4juDp7iNJBgAW3qzzSiRxhjXI2Wdg51o1HjYf5oV8zcBYsaD4sgrDMV9Js7a9AS+wJtF0O2pNWia6wOt5OUqBkxKurtytO5maPdh0p1/L2jmqCwVCND9lZX4/akZdSFXJk9607IgQ63OV6Kj7anoag3Sq6JuKPan3k8z0E+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sINAG7xn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sINAG7xn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87205C4CEE8;
	Mon,  7 Apr 2025 07:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744009647;
	bh=OPZXRFuI5uzN707xyLASfygRwfYY/xEScjSG9fL5FtI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sINAG7xnyWMM7KuoQ3b66O3ahLdy8/9el1HbYr4a5KONOaRk5uQjGx4iYl7iqcnIl
	 EvR0aSRCLFHERW58gWf9zHJ4y9AmBeP9nJB4HSfyNDf5CizVPXwzjHsEsPFExHjLNU
	 e8kmf0lev3gZZKxwwAkQHSwpg08dJ6xTEoJfsf8vmb7Dcbr+2UxC5/98fHkoZwkMFi
	 6IWYN5aMDWP5N8ahxQZIDmqIRMyaD+FR0ImPUcdZOwdL/ANkaUGMTO3U54UxyiM3ds
	 2nCsZ1MUyum7qQlhZZqofdvHdB6are4QOqsqob5VKyMnKT7xJE9jIjvbEOtjiLtyu3
	 U8kk4w50Q1yoQ==
Date: Mon, 7 Apr 2025 10:07:18 +0300
From: Mike Rapoport <rppt@kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Sauerwein, David" <dssauerw@amazon.de>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	David Hildenbrand <david@redhat.com>, Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mike Rapoport <rppt@linux.ibm.com>, Will Deacon <will@kernel.org>,
	kvmarm@lists.cs.columbia.edu, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [RFC PATCH v2 4/7] mm: Optimise SPARSEMEM implementation of
 for_each_valid_pfn()
Message-ID: <Z_N5ps86xJmewe_P@kernel.org>
References: <20250404155959.3442111-1-dwmw2@infradead.org>
 <20250404155959.3442111-4-dwmw2@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404155959.3442111-4-dwmw2@infradead.org>

On Fri, Apr 04, 2025 at 04:59:56PM +0100, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> There's no point in checking the section and subsection bitmap for *every*
> PFN in the same section; they're either all valid or they aren't.

Don't you want to merge this with the previous commit?
 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>  include/linux/mmzone.h | 39 +++++++++++++++++++++++++++++----------
>  1 file changed, 29 insertions(+), 10 deletions(-)
> 
> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index 67cdf675a4b9..0da1b0ba5d9f 100644
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -2154,21 +2154,20 @@ static inline int pfn_valid(unsigned long pfn)
>  	return ret;
>  }
>  
> -static inline bool first_valid_pfn(unsigned long *p_pfn)
> +/* Returns -1 (an invalid PFN) if no valid PFN remaining */
> +static inline unsigned long first_valid_pfn(unsigned long pfn, unsigned long end_pfn)
>  {
> -	unsigned long pfn = *p_pfn;
>  	unsigned long nr = pfn_to_section_nr(pfn);
>  
>  	rcu_read_lock_sched();
>  
> -	while (nr <= __highest_present_section_nr) {
> +	while (nr <= __highest_present_section_nr && pfn < end_pfn) {
>  		struct mem_section *ms = __pfn_to_section(pfn);
>  
>  		if (valid_section(ms) &&
>  		    (early_section(ms) || pfn_section_first_valid(ms, &pfn))) {
> -			*p_pfn = pfn;
>  			rcu_read_unlock_sched();
> -			return true;
> +			return pfn;
>  		}
>  
>  		/* Nothing left in this section? Skip to next section */
> @@ -2177,14 +2176,34 @@ static inline bool first_valid_pfn(unsigned long *p_pfn)
>  	}
>  
>  	rcu_read_unlock_sched();
> +	return (unsigned long)-1;
> +}
>  
> -	return false;
> +static inline unsigned long next_valid_pfn(unsigned long pfn, unsigned long end_pfn)
> +{
> +	pfn++;
> +
> +	if (pfn >= end_pfn)
> +		return (unsigned long)-1;
> +
> +	/*
> +	 * Either every PFN within the section (or subsection for VMEMMAP) is
> +	 * valid, or none of them are. So there's no point repeating the check
> +	 * for every PFN; only call first_valid_pfn() the first time, and when
> +	 * crossing a (sub)section boundary (i.e. !(pfn & ~PFN_VALID_MASK)).
> +	 */
> +	if (pfn & (IS_ENABLED(CONFIG_SPARSEMEM_VMEMMAP) ?
> +		   PAGE_SUBSECTION_MASK : PAGE_SECTION_MASK))
> +		return pfn;
> +
> +	return first_valid_pfn(pfn, end_pfn);
>  }
>  
> -#define for_each_valid_pfn(_pfn, _start_pfn, _end_pfn)	       \
> -	for ((_pfn) = (_start_pfn);			       \
> -	     first_valid_pfn(&(_pfn)) && (_pfn) < (_end_pfn);  \
> -	     (_pfn)++)
> +
> +#define for_each_valid_pfn(_pfn, _start_pfn, _end_pfn)			\
> +	for ((_pfn) = first_valid_pfn((_start_pfn), (_end_pfn));	\
> +	     (_pfn) != (unsigned long)-1;				\
> +	     (_pfn) = next_valid_pfn((_pfn), (_end_pfn)))
>  
>  #endif
>  
> -- 
> 2.49.0
> 

-- 
Sincerely yours,
Mike.
