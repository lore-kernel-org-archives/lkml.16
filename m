Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F45B186A
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 10:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743072803; cv=none; b=UuG4OVwcJlDlBJJ8gpepsAFdZrer1qzYDp0suiRlbNAj52ADTOfXMX3tawySjT0Kxlgn+sg7n+TYEvKrXdTKG6i//Tub1KiANQkDMgxFsBfNZwzysxZ96ADPwQC6xgFRSquqpZUwyMzh1NH4eZE+sR/TcLseeJayDTslpNvOTmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743072803; c=relaxed/simple;
	bh=Rc5Mxq2TcTjCXS+XzMz/toWf3IRsgO9pO5DY9xPzNxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PiiYSq/EkAd0Ehso8vKKvrLL4U8aiCkWK+rOBM7DQaES3+iXhyL9sRK+o2+Dg/RZgdqyjKYHFvUYUPIyABSQiKqcR9AFNSjnp6oCtLuDTNfbDBQlGE0i0egdZPxkO48+ZyvgNZxe7MMRYExB4Y2KHqkV0ULw+g+jY1WDgIB1m3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VZs1Y/Bg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VZs1Y/Bg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63A79C4CEDD;
	Thu, 27 Mar 2025 10:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743072803;
	bh=Rc5Mxq2TcTjCXS+XzMz/toWf3IRsgO9pO5DY9xPzNxs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VZs1Y/Bg9TzbUqnxAfKTcnAhDWFmYuuFVY1Z6pVv+WMAH4FXKXhzprH5MSBGSEDO2
	 yhUa7jVZfeaLhh7k0366tHZbTsYVR0BU3rrEWlqfeqZngCSvwL1TRvAjx/X5Bp/SK6
	 FApxRp6GyHlQKlIpaktNjCorBy1xb0kmMzfERTPM0blrVhgYM8tImW2KuyAWOVV0lz
	 7BxtvzyRZehR8nRBa7TjcmGbiK3KjX4zrUDubCZBzI/dHIMPk/GrTNlo57M0G6oRBy
	 HUBTHYhBzDikmEOtdfrQkMSlAe72R0d655pvqstduwzJ443+4SNi0bqEJqKfQKRoJv
	 Lj7jyZx58Rz/w==
Date: Thu, 27 Mar 2025 11:53:18 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Balbir Singh <balbirs@nvidia.com>
Cc: Bert Karwatzki <spasswolf@web.de>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Kees Cook <kees@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Andy Lutomirski <luto@kernel.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org
Subject: Re: commit 7ffb791423c7 breaks steam game
Message-ID: <Z-UuHkUPy60e1GWM@gmail.com>
References: <6e8ad3cd27b570aaefd85395810cc90bb3120734.camel@web.de>
 <7cdbe06c-1586-4112-8d27-defa89c368e9@amd.com>
 <b1d72b95-5b5f-4954-923f-8eebc7909c4d@nvidia.com>
 <938c2cbd-c47f-4925-ba82-94eef54d9ebc@amd.com>
 <261e7069-9f65-4a89-95cb-25c224ff04f1@nvidia.com>
 <eb041c610719c8275d321c4c420c0b006d31d9f4.camel@web.de>
 <76672910-423c-4664-a1bd-da5c1d7d6afd@nvidia.com>
 <a9f37e3b-2192-42d2-8d5d-c38c0d3fe509@nvidia.com>
 <79a263b2af01e7ed6594ca5896048bd9d7aae35e.camel@web.de>
 <c6d996b4-5e44-4066-964c-5a2a27dfaa6a@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c6d996b4-5e44-4066-964c-5a2a27dfaa6a@nvidia.com>


* Balbir Singh <balbirs@nvidia.com> wrote:

> > Yes, turning off CONFIG_HSA_AMD_SVM fixes the issue, the strange memory
> > resource 
> > afe00000000-affffffffff : 0000:03:00.0
> > is gone.
> > 
> > If one would add a max_pyhs_addr argument to devm_request_free_mem_region()
> > (which return the resource addr in kgd2kfd_init_zone_device()) one could keep
> > the memory below the 44bit limit with CONFIG_HSA_AMD_SVM enabled.
> > 
> 
> Thanks for reporting the result, does this patch work
> 
> diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
> index 01ea7c6df303..14f42f8012ab 100644
> --- a/arch/x86/mm/init_64.c
> +++ b/arch/x86/mm/init_64.c
> @@ -968,8 +968,9 @@ int add_pages(int nid, unsigned long start_pfn, unsigned long nr_pages,
>  	WARN_ON_ONCE(ret);
>  
>  	/* update max_pfn, max_low_pfn and high_memory */
> -	update_end_of_memory_vars(start_pfn << PAGE_SHIFT,
> -				  nr_pages << PAGE_SHIFT);
> +	if (!params->pgmap)
> +		update_end_of_memory_vars(start_pfn << PAGE_SHIFT,
> +					  nr_pages << PAGE_SHIFT);
>  
>  	return ret;
>  }
> 
> It basically prevents max_pfn from moving when the inserted memory is 
> zone_device.
> 
> FYI: It's a test patch and will still create issues if the amount of 
> present memory (physically) is very high, because the driver need to 
> enable use_dma32 in that case.

So this patch does the trick for Bert, and I'm wondering what the best 
fix here would be overall, because it's a tricky situation.

Am I correct in assuming that with enough physical memory this bug 
would trigger, with and without nokaslr?

I *think* the best approach going forward would be to add the above 
quirk the the x86 memory setup code, but also issue a kernel warning at 
that point with all the relevant information included, so that the 
driver's use_dma32 bug can at least be indicated?

That might also trigger for other systems, because if this scenario is 
so spurious, I doubt it's the only affected driver ...

Thanks,

	Ingo
