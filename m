Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DA02441A7;
	Fri,  2 May 2025 17:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746205966; cv=none; b=EM+HSoNXW9qGZ/HlifBmUblubV/ZCvzm8KItL0J8yOV0qsRzczD1oGdPDwo6EarCOS5+IKpbORo8l3IXAydliLkqAjuecLbaOPQIHDtMDqs3Rpcg8bcMvjj3kDx5dqlBsrgBaL1sJeNHGcnTFoVUExRKbClg35TrMOzbAWhL3ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746205966; c=relaxed/simple;
	bh=fqXQ9jgI/VklvA+2TRXRDHIqkX08QUCBhCzCjmghMVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p5Sj1s4kHyiOtxacJbeLGxtKuIaDDghcvY2EKKrwsnqLLmU/ucKCpeWrext/RCUbnq99279TmYJrCwYYz1YEHD3ZHP8fWT7qv028p4vZwC7BHIJb0cbUjwyyrG6N/RU6qChVODJKyRqoSk6u+WM0ziLKH7imcDxtNqWtYrx7xgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75993C4CEE4;
	Fri,  2 May 2025 17:12:42 +0000 (UTC)
Date: Fri, 2 May 2025 18:12:40 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: will@kernel.org, broonie@kernel.org, anshuman.khandual@arm.com,
	joey.gouly@arm.com, yury.khrustalev@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, frederic@kernel.org,
	shmeerali.kolothum.thodi@huawei.com, james.morse@arm.com,
	mark.rutland@arm.com, huangxiaojia2@huawei.com,
	akpm@linux-foundation.org, surenb@google.com, robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, nd@arm.com,
	Peter Collingbourne <pcc@google.com>
Subject: Re: [PATCH v3 1/3] arm64: add FEAT_MTE_TAGGED_FAR feature
Message-ID: <aBT9CA7vnlfszTDw@arm.com>
References: <20250410074721.947380-1-yeoreum.yun@arm.com>
 <20250410074721.947380-2-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410074721.947380-2-yeoreum.yun@arm.com>

On Thu, Apr 10, 2025 at 08:47:19AM +0100, Yeoreum Yun wrote:
> Add FEAT_MTE_TAGGED_FAR cpucap which makes FAR_ELx report
> all non-address bits on a synchronous MTE tag check fault since Armv8.9
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Acked-by: Yury Khrustalev <yury.khrustalev@arm.com>
[...]
> @@ -3191,6 +3199,7 @@ static const struct arm64_cpu_capabilities arm64_elf_hwcaps[] = {
>  #ifdef CONFIG_ARM64_MTE
>  	HWCAP_CAP(ID_AA64PFR1_EL1, MTE, MTE2, CAP_HWCAP, KERNEL_HWCAP_MTE),
>  	HWCAP_CAP(ID_AA64PFR1_EL1, MTE, MTE3, CAP_HWCAP, KERNEL_HWCAP_MTE3),
> +	HWCAP_CAP(ID_AA64PFR2_EL1, MTEFAR, IMP, CAP_HWCAP, KERNEL_HWCAP_MTE_FAR),

Nitpick: from a theoretical bisectability perspective, I'd move the
hwcap exposing to the following patch. The rest, feature detection etc
can stay in this file. Otherwise, one can apply this patch, see the
hwcap but not get the actual behaviour.

>  #endif /* CONFIG_ARM64_MTE */
>  	HWCAP_CAP(ID_AA64MMFR0_EL1, ECV, IMP, CAP_HWCAP, KERNEL_HWCAP_ECV),
>  	HWCAP_CAP(ID_AA64MMFR1_EL1, AFP, IMP, CAP_HWCAP, KERNEL_HWCAP_AFP),
> diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
> index 285d7d538342..e2b13454e38a 100644
> --- a/arch/arm64/kernel/cpuinfo.c
> +++ b/arch/arm64/kernel/cpuinfo.c
> @@ -160,6 +160,7 @@ static const char *const hwcap_str[] = {
>  	[KERNEL_HWCAP_SME_SFEXPA]	= "smesfexpa",
>  	[KERNEL_HWCAP_SME_STMOP]	= "smestmop",
>  	[KERNEL_HWCAP_SME_SMOP4]	= "smesmop4",
> +	[KERNEL_HWCAP_MTE_FAR]		= "mte_far",

Personal preference: "mtefar" (no underscore), mostly because there's no
other underscore in the hwcap strings yet ;).

-- 
Catalin
