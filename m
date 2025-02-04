Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 136F035947
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 04:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738642899; cv=none; b=n103wBpUQew8iUJ06uM+v/gONPqPEPXKqyik2j7gHzX7ZOBXaKGpIMurSBrv0s8CuSumG6HXYPw1HOjsoEEHeZlkdpAtc2IbPLD5k7HZ9e1ARxRwXR0s1gao9eDLstW4yx3aFHt4j466egjCNBQomU/+6AivPQaLPTvIhc4bFJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738642899; c=relaxed/simple;
	bh=bkNLdrUhxf+asfdiBct8uF1+vJ/T6K29UpyYxA7DXcM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mw1xjG4B2P5gzm8POO8kPDVKCXp2ItWqjWxbtN6mv53zfF5XFdJukO0GaRVLsUHp31VnlqGjgPFbvcVja81cW5oir0qd4rD/F09s/rm1eWv2PcURrP0KZ6UCrAOqEbC1A2miHOTQlxhriIAYsDuNlRDnWNf8Q8h6+cjsrPa85rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A687511FB;
	Mon,  3 Feb 2025 20:21:53 -0800 (PST)
Received: from [10.163.33.56] (unknown [10.163.33.56])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 09A203F63F;
	Mon,  3 Feb 2025 20:21:25 -0800 (PST)
Message-ID: <0eb00e14-937d-4e84-9ca3-4239ce614ea3@arm.com>
Date: Tue, 4 Feb 2025 09:51:23 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] arm64/sysreg: Fix unbalanced closing block
To: James Clark <james.clark@linaro.org>,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org, broonie@kernel.org,
 maz@kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Oliver Upton <oliver.upton@linux.dev>,
 James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org
References: <20250115162600.2153226-1-james.clark@linaro.org>
 <20250115162600.2153226-2-james.clark@linaro.org>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250115162600.2153226-2-james.clark@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/15/25 21:55, James Clark wrote:
> This is a sysreg block so close it with one. This doesn't make a
> difference to the output because the script only matches on the
> beginning of the word to close blocks which is correct by coincidence
> here.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

> ---
>  arch/arm64/tools/sysreg | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index 762ee084b37c..bbe7df69da9c 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -2074,7 +2074,7 @@ EndEnum
>  Res0	4:2
>  Field	1	ExTRE
>  Field	0	E0TRE
> -EndSysregFields
> +EndSysreg
>  
>  Sysreg	SMPRI_EL1	3	0	1	2	4
>  Res0	63:4
