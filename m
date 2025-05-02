Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0810279D2
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 17:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746208299; cv=none; b=lJVLeM0/YarBAtCyI5DddbCET6ZKwJDn3Fapzw3G5BfsRlUjhc0U9uZhHih/gtotIEvDLqWhHDXTzJSMLiqTygZPiZTwNtgEgkMvZx8bCbIVhOQQe2Wj91xOCYnGA3ryvGMvEcGLhd+2l4FRAD67TWeKnY7dGQlsSm1SbaIIN44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746208299; c=relaxed/simple;
	bh=6aa+tULDC/+lIXH6LuGYdqIhlxkx8qU5yy9LqFQRUY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LB39tLdWzfIZ9ylx3va9iklLaDjn6qHxcr9KEB5vmsfqmnpdb6Og8zqkFG8XHyZRxC4I101sMOb004QmF7iw1S4y/9KOQ0ik1lihGfRN+hd4B/ex+Y30/kdxyW6o5CreqSSgW5C1IsBrOdrEvMCQ+RCtDAFkxFRu51s5MR3OmOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0904AC4CEE4;
	Fri,  2 May 2025 17:51:33 +0000 (UTC)
Date: Fri, 2 May 2025 18:51:31 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: will@kernel.org, broonie@kernel.org, anshuman.khandual@arm.com,
	joey.gouly@arm.com, maz@kernel.org, oliver.upton@linux.dev,
	frederic@kernel.org, james.morse@arm.com,
	hardevsinh.palaniya@siliconsignals.io,
	shameerali.kolothum.thodi@huawei.com, huangxiaojia2@huawei.com,
	mark.rutland@arm.com, samuel.holland@sifive.com,
	palmer@rivosinc.com, charlie@rivosinc.com,
	thiago.bauermann@linaro.org, bgray@linux.ibm.com,
	tglx@linutronix.de, puranjay@kernel.org, david@redhat.com,
	yang@os.amperecomputing.com, mbenes@suse.cz,
	joel.granados@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, nd@arm.com
Subject: Re: [PATCH v3 4/4] tools/kselftest: add MTE_STORE_ONLY feature hwcap
 test
Message-ID: <aBUGI1OaaSUJPGAa@arm.com>
References: <20250410080723.953525-1-yeoreum.yun@arm.com>
 <20250410080723.953525-5-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410080723.953525-5-yeoreum.yun@arm.com>

On Thu, Apr 10, 2025 at 09:07:23AM +0100, Yeoreum Yun wrote:
> add MTE_STORE_ONLY feature hwcap test.
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Reviewed-by: Mark Brown <broonie@kernel.org>
> ---
>  tools/testing/selftests/arm64/abi/hwcap.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tools/testing/selftests/arm64/abi/hwcap.c b/tools/testing/selftests/arm64/abi/hwcap.c
> index a539eeb0bfc0..32385f67498e 100644
> --- a/tools/testing/selftests/arm64/abi/hwcap.c
> +++ b/tools/testing/selftests/arm64/abi/hwcap.c
> @@ -1104,6 +1104,12 @@ static const struct hwcap_data {
>  		.hwcap_bit = HWCAP3_MTE_FAR,
>  		.cpuinfo = "mte_far",
>  	},
> +	{
> +		.name = "MTE_STOREONLY",
> +		.at_hwcap = AT_HWCAP3,
> +		.hwcap_bit = HWCAP3_MTE_STORE_ONLY,
> +		.cpuinfo = "mte_store_only",
> +	},
>  };

Please also add checks to tools/testing/selftests/arm64/mte/ to verify
that read tag check faults are ignored when this is enabled.

-- 
Catalin
