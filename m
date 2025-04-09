Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CFF25DD17
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 11:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744197237; cv=none; b=ubOwraH2XGGw5sadYjKcoyRQbLcBz+oTrgQKLPjf7jcVx14IXc01d7oZkzehd0CjbeiAHLo4Zaa2caW7tXyqdyIZIC20U25zALRp/3AHSDQ4D/1OkbX6kHGA/CBAsancf1O82to8xFdIkXlvRx32/lKGz7dab7Acqml2M6F4YSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744197237; c=relaxed/simple;
	bh=irPkddcl4pFObPk7qkg7MigXFgzvZCovZUOJcpGQdDs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PHNIfZ+mLPQYzv2IgGi0KFWRR4w5Rc30x817fqde/s2y0F7mzn0WAKX7TLbOGTq2c5O70CR78TbZlUnp1ySMgaal5J8xy2e/iaz9q0Vmc6TMmx6X/AhKZUNwlmO6gLcjp9P1n/D2xq63p/7X8L1g5rcLm9q4WyYk6PRICjBYnjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ul2sa/bm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ul2sa/bm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 275F9C4CEE3;
	Wed,  9 Apr 2025 11:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744197236;
	bh=irPkddcl4pFObPk7qkg7MigXFgzvZCovZUOJcpGQdDs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ul2sa/bmReApoaPP+p5rT3iJ9yU/ytY58lZKc49bC9qMsIP3zD2h7Pwwq+M2plsxb
	 b9UnKv2vmXI8BhWv6WAQc6i6CP/CRqjSRUzMvWG0sGHNGexSxa9tpEzqFLUn6oRCJs
	 4jOwi3sjQBoximySG2LB9O7aI/qgHZfXBqwcYyQ1MLWE+CKyUm1qH1A/BR2wJ/yAu2
	 j8MGKP0iHe3RRScIutOtKLPwhrNrab3Fx0QXiNadawJruhVyZG/P5iKxnpjnsG3ZqS
	 ySBVsThLZMhrBpc4KCV56bbyRfwMcxi4meSaPGN+h/D1qEB/wIDkNbQaZONTYcizzL
	 NZMJDwDxiQQ1Q==
Message-ID: <de04dc00-f01d-4c27-a6f8-873398bf8d4a@kernel.org>
Date: Wed, 9 Apr 2025 13:13:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2][PATCH 4/5] x86/cpu: Move AMD erratum 1386 table over to
 'x86_cpu_id'
To: Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org
Cc: x86@kernel.org, tglx@linutronix.de, bp@alien8.de,
 kan.liang@linux.intel.com
References: <20241213185127.F38B6EE9@davehans-spike.ostc.intel.com>
 <20241213185132.07555E1D@davehans-spike.ostc.intel.com>
Content-Language: en-US
From: Jiri Slaby <jirislaby@kernel.org>
Autocrypt: addr=jirislaby@kernel.org; keydata=
 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
In-Reply-To: <20241213185132.07555E1D@davehans-spike.ostc.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I noted this on IRC...

On 13. 12. 24, 19:51, Dave Hansen wrote:
> From: Dave Hansen <dave.hansen@linux.intel.com>
> 
> The AMD erratum 1386 detection code uses and old style 'x86_cpu_desc'
> table. Replace it with 'x86_cpu_id' so the old style can be removed.
> 
> I did not create a new helper macro here. The new table is certainly
> more noisy than the old and it can be improved on. But I was hesitant
> to create a new macro just for a single site that is only two ugly
> lines in the end.
> 
> Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
> ---
> 
>   b/arch/x86/kernel/cpu/amd.c |    9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff -puN arch/x86/kernel/cpu/amd.c~amd-x86_cpu_id arch/x86/kernel/cpu/amd.c
> --- a/arch/x86/kernel/cpu/amd.c~amd-x86_cpu_id	2024-12-13 10:47:55.714076132 -0800
> +++ b/arch/x86/kernel/cpu/amd.c	2024-12-13 10:47:55.718076292 -0800
> @@ -795,10 +795,9 @@ static void init_amd_bd(struct cpuinfo_x
>   	clear_rdrand_cpuid_bit(c);
>   }
>   
> -static const struct x86_cpu_desc erratum_1386_microcode[] = {
> -	AMD_CPU_DESC(0x17,  0x1, 0x2, 0x0800126e),
> -	AMD_CPU_DESC(0x17, 0x31, 0x0, 0x08301052),
> -	{},

If I am to tell, the {} is needed, otherwise you touch the array OOB (at 
least with the "m->flags & X86_CPU_ID_FLAG_ENTRY_VALID" test -- if the 
bit is set in the memory, then much more than that...).

> +static const struct x86_cpu_id erratum_1386_microcode[] = {
> +	X86_MATCH_VFM_STEPS(VFM_MAKE(X86_VENDOR_AMD, 0x17, 0x01), 0x2, 0x2, 0x0800126e),
> +	X86_MATCH_VFM_STEPS(VFM_MAKE(X86_VENDOR_AMD, 0x17, 0x31), 0x0, 0x0, 0x08301052),
>   };
>   
>   static void fix_erratum_1386(struct cpuinfo_x86 *c)
> @@ -814,7 +813,7 @@ static void fix_erratum_1386(struct cpui
>   	 * Clear the feature flag only on microcode revisions which
>   	 * don't have the fix.
>   	 */
> -	if (x86_cpu_has_min_microcode_rev(erratum_1386_microcode))
> +	if (x86_match_min_microcode_rev(erratum_1386_microcode))
>   		return;
>   
>   	clear_cpu_cap(c, X86_FEATURE_XSAVES);

thanks,
-- 
js
suse labs

