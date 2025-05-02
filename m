Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2BD269833;
	Fri,  2 May 2025 17:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746205708; cv=none; b=se27+DpRsozJVN6xyen6hPrGwAYlOJ3uO36QrRtoeU1PJXowj2J1Yt2UZ29sYkmAy4SMgExXz6LZGfUj5W1VgF3/ObwISL/SBgNENc9PoiaL5SdobvPZrfLi3se2YQpDh9NPNXAlVYiBBbcUYLUuZ+p4jgaZPTR1oaegY1wZ21s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746205708; c=relaxed/simple;
	bh=MHsz2Fi2k9mv6IeTOC5g4/8EDZf7CKvhbnjjpQI7eu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lt3q6vfMETuZHCzg8dLY7m0IcmFrqPYEFiwxvTOeU7aFK4TNR1SwRkM+rgL+Mn0/PsVBvau+CpPLYO1UEz+Rixhd62v50pMNYKRV2GK8Posn1rrXyk4tbZsuDn3KC9/9h6oZ5fmvv74Ln4Gq+apxY4E4rn6/Sdj7MFjjgiM0L64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3984C4CEF2;
	Fri,  2 May 2025 17:08:23 +0000 (UTC)
Date: Fri, 2 May 2025 18:08:21 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>, Peter Collingbourne <pcc@google.com>
Cc: will@kernel.org, broonie@kernel.org, anshuman.khandual@arm.com,
	joey.gouly@arm.com, yury.khrustalev@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, frederic@kernel.org,
	shmeerali.kolothum.thodi@huawei.com, james.morse@arm.com,
	mark.rutland@arm.com, huangxiaojia2@huawei.com,
	akpm@linux-foundation.org, surenb@google.com, robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, nd@arm.com
Subject: Re: [PATCH v3 2/3] arm64/mm/fault: use original FAR_EL1 value when
 ARM64_MTE_FAR is supported
Message-ID: <aBT8BWqoljvcAU_w@arm.com>
References: <20250410074721.947380-1-yeoreum.yun@arm.com>
 <20250410074721.947380-3-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410074721.947380-3-yeoreum.yun@arm.com>

+ Peter Collingbourne as he added the SA_EXPOSE_TAGBITS flag.

On Thu, Apr 10, 2025 at 08:47:20AM +0100, Yeoreum Yun wrote:
> Use the original FAR_EL1 value when an MTE tag check fault occurs,
> if ARM64_MTE_FAR is supported.
> This allows reports to include not only the logical tag (memory tag)
> but also the address tag information.
> 
> Applications that require this information should install a signal handler with
> the SA_EXPOSE_TAGBITS flag.
> While this introduces a minor ABI change,
> most applications do not set this flag and therefore will not be affected.

It is indeed a minor ABI in that a tag check fault resulting in a
signal will report the bits 63:60 as well, not just 59:56 of the address
(if the signal handler was registered with SA_EXPOSE_TAGBITS).

I don't think user-space would notice but asking Peter.

> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  arch/arm64/mm/fault.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> index ec0a337891dd..f21d972f99b1 100644
> --- a/arch/arm64/mm/fault.c
> +++ b/arch/arm64/mm/fault.c
> @@ -837,9 +837,12 @@ static int do_tag_check_fault(unsigned long far, unsigned long esr,
>  	/*
>  	 * The architecture specifies that bits 63:60 of FAR_EL1 are UNKNOWN
>  	 * for tag check faults. Set them to corresponding bits in the untagged
> -	 * address.
> +	 * address if ARM64_MTE_FAR isn't supported.
> +	 * Otherwise, bits 63:60 of FAR_EL1 are KNOWN.
>  	 */
> -	far = (__untagged_addr(far) & ~MTE_TAG_MASK) | (far & MTE_TAG_MASK);
> +	if (!cpus_have_cap(ARM64_MTE_FAR))
> +		far = (__untagged_addr(far) & ~MTE_TAG_MASK) | (far & MTE_TAG_MASK);
> +
>  	do_bad_area(far, esr, regs);
>  	return 0;
>  }
> -- 
> LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
