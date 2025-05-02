Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5144A32
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 17:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746206698; cv=none; b=ug+Y1C9q3dQ/FmDDRzI41KsfS3AcyoPzyCE0bWkVEOde8jvhQA2s4BcZisF1pVsGmABbCF+ufa82qj5YfRbEh4hIeRwpGKIvNiDSm+frUpkqH+afhwc4tc0ztA+lfdLmX8xRb87UaUjYIF7dyBYDnAIivDcomYa3HacNQRCg1zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746206698; c=relaxed/simple;
	bh=X2SFf30WCpXeM4fGliKW+NxrpR+LiV18G+3eGitk4Dk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oFWkQVMDQLav56knW37ecQRzkF+Q/k6vjfU1RgETmRaHXeJkA6fqwNeYVzv/9DwvXakr8KqLCUCY5uEbcBDjYxgU0OIDHJPl3YXSSZl35J58azqkAqBGehStopenjznySlxEObrY+wSnvRyKtYv9Ri2KRLrt4M3Beozili2COp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87E7DC4CEE4;
	Fri,  2 May 2025 17:24:53 +0000 (UTC)
Date: Fri, 2 May 2025 18:24:51 +0100
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
	linux-kernel@vger.kernel.org, nd@arm.com,
	Peter Collingbourne <pcc@google.com>
Subject: Re: [PATCH v3 1/4] arm64/feature: add MTE_STORE_ONLY feature
Message-ID: <aBT_4xNOL436-jJR@arm.com>
References: <20250410080723.953525-1-yeoreum.yun@arm.com>
 <20250410080723.953525-2-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410080723.953525-2-yeoreum.yun@arm.com>

(adding Peter C again, please keep him on cc for future versions; and
you can probably avoid others that don't have an interest in MTE ;))

On Thu, Apr 10, 2025 at 09:07:20AM +0100, Yeoreum Yun wrote:
> add MTE_STORE_ONLY feature and HWCAP.
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>

Please briefly describe what the feature is in the commit log.

> diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
> index e2b13454e38a..40f85ec01fe4 100644
> --- a/arch/arm64/kernel/cpuinfo.c
> +++ b/arch/arm64/kernel/cpuinfo.c
> @@ -161,6 +161,7 @@ static const char *const hwcap_str[] = {
>  	[KERNEL_HWCAP_SME_STMOP]	= "smestmop",
>  	[KERNEL_HWCAP_SME_SMOP4]	= "smesmop4",
>  	[KERNEL_HWCAP_MTE_FAR]		= "mte_far",
> +	[KERNEL_HWCAP_MTE_STORE_ONLY]	= "mte_store_only",

Nit: "mtestoreonly"

-- 
Catalin
