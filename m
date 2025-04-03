Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB4C1DFF7
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 06:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743661452; cv=none; b=Ei53un763icLP0q57cjm3KqHbQNcgflEUtyxbTmgclIfZrE0Y5tBAoRZjStn/RH0aWSnVFeUh6OeWg0lbMiLnOJyu++1r/HiMBZN4Dk1T4lpMThijT3A5RPix3jEcU+Xq4g7CWJpPEP+oHTvzzdZ+wgIUM5SULsYW/JcFt+tw5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743661452; c=relaxed/simple;
	bh=GFvYpsXQvk6dxCYwoiQKJ2z5FTbh5QigoUHrYN255FY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hpkXO0ccA2IKjvs73wFam6S0Iea0niIxBaltmOrs+i76V13fID+sjSnxE4mPNyia7yLetggi8o3WknMelXnAfRaEJcHgYvhN2PeWU30LBSRmW0ev7pmWhY4/htvztOIQUqre1oz5FSuxobM+tHdMw8viHKIRuGrfHNfbyqx8tm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eZTi5Dzq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eZTi5Dzq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8FC1C4CEE3;
	Thu,  3 Apr 2025 06:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743661452;
	bh=GFvYpsXQvk6dxCYwoiQKJ2z5FTbh5QigoUHrYN255FY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eZTi5DzqiJVNB71Vp/b930nyv5R8JfheUpK2OUGe1zHqos2M5ckAZcuY0uXHL+/jk
	 DSAAIg82wRixkfZy/2bZhUh+HAAZDTqK0vEmPAmIFDiAjRd96Xtx2ls9KkfsPID+oq
	 yDy2IYeCxaPpeVO8BgDj9OlUi6pQCcf1/W0Z/BzTxB0WQ2VuG0AoR97Di3EEjiqSao
	 3UnxDWVvLXaRZ7uIyV+YaV+/A8m8fGzIkYCHF6NIaiQaNstSr2tbbe6ojUUSuralnr
	 RFoqPo9+1Q3ynv4rcDpmUZeo8pqV2XWrpmPAIQtuFxMggirlmwSUAbODKTzgr4/vbo
	 WjKfBlqSGs4UA==
Date: Thu, 3 Apr 2025 09:24:04 +0300
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
Subject: Re: [RFC PATCH 3/3] mm: Implement for_each_valid_pfn() for
 CONFIG_SPARSEMEM
Message-ID: <Z-4phOInXZlxFwk9@kernel.org>
References: <Z-vn-sMtNfwyJ9VW@kernel.org>
 <20250402201841.3245371-1-dwmw2@infradead.org>
 <20250402201841.3245371-3-dwmw2@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402201841.3245371-3-dwmw2@infradead.org>

On Wed, Apr 02, 2025 at 09:18:41PM +0100, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Introduce a pfn_first_valid() helper which takes a pointer to the PFN and
> updates it to point to the first valid PFN starting from that point, and
> returns true if a valid PFN was found.
> 
> This largely mirrors pfn_valid(), calling into a pfn_section_first_valid()
> helper which is trivial for the !CONFIG_SPARSEMEM_VMEMMAP case, and in
> the VMEMMAP case will skip to the next subsection as needed.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

with a small nit below

> +static inline bool first_valid_pfn(unsigned long *p_pfn)
> +{
> +	unsigned long pfn = *p_pfn;
> +	unsigned long nr = pfn_to_section_nr(pfn);
> +	struct mem_section *ms;
> +	bool ret = false;
> +
> +	ms = __pfn_to_section(pfn);
> +
> +	rcu_read_lock_sched();
> +
> +	while (!ret && nr <= __highest_present_section_nr) {

This could be just for(;;), we anyway break when ret becomes true or we get
past last present section.

> +		if (valid_section(ms) &&
> +		    (early_section(ms) || pfn_section_first_valid(ms, &pfn))) {
> +			ret = true;
> +			break;
> +		}
> +
> +		nr++;
> +		if (nr > __highest_present_section_nr)
> +			break;
> +
> +		pfn = section_nr_to_pfn(nr);
> +		ms = __pfn_to_section(pfn);
> +	}
> +
> +	rcu_read_unlock_sched();
> +
> +	*p_pfn = pfn;
> +
> +	return ret;
> +}
> +
> +#define for_each_valid_pfn(_pfn, _start_pfn, _end_pfn)	       \
> +	for ((_pfn) = (_start_pfn);			       \
> +	     first_valid_pfn(&(_pfn)) && (_pfn) < (_end_pfn);  \
> +	     (_pfn)++)
> +
>  #endif
>  
>  static inline int pfn_in_present_section(unsigned long pfn)
> -- 
> 2.49.0
> 

-- 
Sincerely yours,
Mike.
