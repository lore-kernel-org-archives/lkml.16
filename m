Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20297264FAB;
	Fri,  2 May 2025 17:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746206161; cv=none; b=nNA4D4FMkD5vY5KtqiyIfBH7Fq9HGv4hZGdiEdwuq9iJVRjW8BJMJFx4V9wC+Lr3ZqTkOBB4gEEBlA6hEm4Mgq03b+XMwxjXayaM1UW/GflnkRfpTRdTmRgSKzrXmwDoxxk/TSS2nRZPjO8e8k7SkjSChGf+qmxDiUurFO/60Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746206161; c=relaxed/simple;
	bh=yg+DZV/18zSXUzvuqa27Vp7oCrRkx8T56YEvilHcQoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e83iVj+23NnrPqKm4KkpE27FmHYrF5UgMikQb+fzl+Ngam65t6UB4ltYo7G3/o2QcWnZbbwOuwqO1NN4mZW7vW/XALgdVPi641Sn0zRee9I/ROghhgEaBbDC1tIBQsIchXs3CLtnsscyU4xjvb64f9uI8DpWZStlaGNy/G8zNP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28702C4CEEF;
	Fri,  2 May 2025 17:15:57 +0000 (UTC)
Date: Fri, 2 May 2025 18:15:54 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: will@kernel.org, broonie@kernel.org, anshuman.khandual@arm.com,
	joey.gouly@arm.com, yury.khrustalev@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, frederic@kernel.org,
	shmeerali.kolothum.thodi@huawei.com, james.morse@arm.com,
	mark.rutland@arm.com, huangxiaojia2@huawei.com,
	akpm@linux-foundation.org, surenb@google.com, robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, nd@arm.com
Subject: Re: [PATCH v3 3/3] tools/kselftest: add MTE_FAR hwcap test
Message-ID: <aBT9yiaLF9LisLR6@arm.com>
References: <20250410074721.947380-1-yeoreum.yun@arm.com>
 <20250410074721.947380-4-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410074721.947380-4-yeoreum.yun@arm.com>

On Thu, Apr 10, 2025 at 08:47:21AM +0100, Yeoreum Yun wrote:
> diff --git a/tools/testing/selftests/arm64/abi/hwcap.c b/tools/testing/selftests/arm64/abi/hwcap.c
> index 35f521e5f41c..a539eeb0bfc0 100644
> --- a/tools/testing/selftests/arm64/abi/hwcap.c
> +++ b/tools/testing/selftests/arm64/abi/hwcap.c
> @@ -1098,6 +1098,12 @@ static const struct hwcap_data {
>  		.sigill_fn = hbc_sigill,
>  		.sigill_reliable = true,
>  	},
> +	{
> +		.name = "MTE_FAR",
> +		.at_hwcap = AT_HWCAP3,
> +		.hwcap_bit = HWCAP3_MTE_FAR,
> +		.cpuinfo = "mte_far",
> +	},
>  };

This is all good but I'd also like to see a test to check the FAR_EL1
bits are actually exposed to the signal handler when the hwcap is
present.

-- 
Catalin
