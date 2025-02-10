Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B94872528F9
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 18:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739212880; cv=none; b=L/pESORUgvjRorZh/eihYgjvl85nJUcinkc2Ae+1b8qvnC1O5KXQjFxpX2clAzvmzALW/iEb1WCqiF0xWmyBtourcaopJq1WydQECNIgwaH1Wkv1DyySa7A8scYW9S+HG3z85KtWkUFeboMbrAhuxmMDu1YJqF9N+zaAwUsqkb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739212880; c=relaxed/simple;
	bh=kNSwPL7KyAAiTOlFqBEiiaeLM0crEAss0+h7d2h4P0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LTvy6KhaO6EG0QDIAhtqOmHaGsdRum3ej6ffB6aOlP8HGYJmTrJSxPleyHwB917nrgKXDHwqRIqzMlXqiFkbrKx0mYHr5Yk8J09hBHlXZD9Li+Uktksw0EvlUKoAota9lKS6qIvZIBQGB3q7Yvum3qS9y+7kG+KLIZhKxAVaX+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B1DD31477;
	Mon, 10 Feb 2025 10:41:38 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E83BD3F58B;
	Mon, 10 Feb 2025 10:41:15 -0800 (PST)
Date: Mon, 10 Feb 2025 18:41:09 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: Add missing registrations of SF8MMx hwcaps
Message-ID: <Z6pHPKXXnQ1whg57@J2N7QTR9R3>
References: <20250210-arm64-fix-2024-dpisa-v1-1-d77f43c7b253@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210-arm64-fix-2024-dpisa-v1-1-d77f43c7b253@kernel.org>

On Mon, Feb 10, 2025 at 05:49:33PM +0000, Mark Brown wrote:
> Commit 819935464cb2 ("arm64/hwcap: Describe 2024 dpISA extensions to
> userspace") added definitions for HWCAP_F8MM8 and HWCAP_F8MM4 but did
> not include the crucial registration in arm64_elf_hwcaps.  Add it.

Looking again, it looks like KERNEL_HWCAP_FPRCVT also isn't wired up?

I did a quick check for suspects in that commit with:

| [mark@lakrids:~/src/linux]% git show 819935464cb2 | grep '^+\s' | grep -o 'KERNEL_HWCAP_[A-Z0-9_]\+' | sort | uniq -c | sort -n
|       1 KERNEL_HWCAP_F8MM4
|       1 KERNEL_HWCAP_F8MM8
|       1 KERNEL_HWCAP_FPRCVT
|       1 KERNEL_HWCAP_SME_SF8MM4
|       1 KERNEL_HWCAP_SME_SF8MM8
|       2 KERNEL_HWCAP_CMPBR
|       2 KERNEL_HWCAP_SME2P2
|       2 KERNEL_HWCAP_SME_AES
|       2 KERNEL_HWCAP_SME_SBITPERM
|       2 KERNEL_HWCAP_SME_SFEXPA
|       2 KERNEL_HWCAP_SME_SMOP4
|       2 KERNEL_HWCAP_SME_STMOP
|       2 KERNEL_HWCAP_SVE2P2
|       2 KERNEL_HWCAP_SVE_AES2
|       2 KERNEL_HWCAP_SVE_BFSCALE
|       2 KERNEL_HWCAP_SVE_ELTPERM
|       2 KERNEL_HWCAP_SVE_F16MM

... and while KERNEL_HWCAP_SME_SF8MM4 and KERNEL_HWCAP_SME_SF8MM8 are
gone now, KERNEL_HWCAP_FPRCVT is still around AFAICT.

Checking against a tree based on v6.14-rc1, it superficially looks like
we're not missing any other KERNEL_HWCAP_* bits per a coarse search,
which shows three missing entries in cpufeature.c:

| [mark@lakrids:~/src/linux]% git grep -oh 'KERNEL_HWCAP_[A-Z0-9_]\+' -- arch/arm64/include/asm/hwcap.h | wc -l              
| 112
| [mark@lakrids:~/src/linux]% git grep -oh 'KERNEL_HWCAP_[A-Z0-9_]\+' -- arch/arm64/include/asm/hwcap.h | sort | uniq | wc -l
| 112
| [mark@lakrids:~/src/linux]% git grep -oh 'KERNEL_HWCAP_[A-Z0-9_]\+' -- arch/arm64/kernel/cpuinfo.c | sort | uniq | wc -l
| 112
| [mark@lakrids:~/src/linux]% git grep -oh 'KERNEL_HWCAP_[A-Z0-9_]\+' -- arch/arm64/kernel/cpufeature.c | sort | uniq | wc -l
| 109

... but maybe that misses something, and I haven't checked
COMPAT_HWCAP(*) or COMPAT_HWCAP2(*).

Could you please go check if there's anything else missing more generally?

Mark.

> Fixes: 819935464cb2 ("arm64/hwcap: Describe 2024 dpISA extensions to userspace")
> Reported-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm64/kernel/cpufeature.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index f0910f20fbf8c18fbeb63bcee18abf13371b1d5e..2cde1e6e309a1b840e0e8dc3a5a55f07f0aadd82 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -3190,6 +3190,8 @@ static const struct arm64_cpu_capabilities arm64_elf_hwcaps[] = {
>  	HWCAP_CAP(ID_AA64FPFR0_EL1, F8FMA, IMP, CAP_HWCAP, KERNEL_HWCAP_F8FMA),
>  	HWCAP_CAP(ID_AA64FPFR0_EL1, F8DP4, IMP, CAP_HWCAP, KERNEL_HWCAP_F8DP4),
>  	HWCAP_CAP(ID_AA64FPFR0_EL1, F8DP2, IMP, CAP_HWCAP, KERNEL_HWCAP_F8DP2),
> +	HWCAP_CAP(ID_AA64FPFR0_EL1, F8MM8, IMP, CAP_HWCAP, KERNEL_HWCAP_F8MM8),
> +	HWCAP_CAP(ID_AA64FPFR0_EL1, F8MM4, IMP, CAP_HWCAP, KERNEL_HWCAP_F8MM4),
>  	HWCAP_CAP(ID_AA64FPFR0_EL1, F8E4M3, IMP, CAP_HWCAP, KERNEL_HWCAP_F8E4M3),
>  	HWCAP_CAP(ID_AA64FPFR0_EL1, F8E5M2, IMP, CAP_HWCAP, KERNEL_HWCAP_F8E5M2),
>  #ifdef CONFIG_ARM64_POE
> 
> ---
> base-commit: 21fed7c223e20e694b91dbf25936d922a50c8b19
> change-id: 20250207-arm64-fix-2024-dpisa-635a5961609c
> 
> Best regards,
> -- 
> Mark Brown <broonie@kernel.org>
> 
