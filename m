Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF09824E4C3
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 16:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739291945; cv=none; b=hKN/KynWL3/PoCMFxtXn81wRV17hLw4fYbvQkRKR5IfkKVEfjnX/YSlhPn7076tZx84U2mTK0kcccuUx67QGD57sUU7Dl6ac7xntMtl+aRrBpTrj0ONBLcaDhFKS9J9rD6axqhc+wKSA5GKtm3hbZvU71/LtCtwVmlARswM6T6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739291945; c=relaxed/simple;
	bh=pe1XKuEnAIy9pjfkdKn1BjQf9osmT8zDXOU8dQcDWvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z3e2eqbfdD0rHIQ1prNZ4XxDRz2KlR4dnewsGdrDT/QCyEXQp+7d4PVwFlcv0wWXkUm3F5CMpTCccy/61ejts3G89xqMHTdAzxNmvLn1QntUQY8w42tG0G6nBGE5/LuziBxUC4cgHxzCUfn4qPcnz2xkDieajXmcpzrjoP9fdpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VX2RLKz1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VX2RLKz1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63BFEC4CEDD;
	Tue, 11 Feb 2025 16:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739291945;
	bh=pe1XKuEnAIy9pjfkdKn1BjQf9osmT8zDXOU8dQcDWvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VX2RLKz1Qb07eQr92V5FT07j8T9YAyF2Bfg0FoiEaFHWMDvhsuJOqpLzSxPcISXGC
	 EBNspJePTQcvvpFKWuHPCIOIeTCqq3d+FW1IBFkOcKggdTn15C0Qq59T9NE7w6lo52
	 NvSmfEuU41uVqvo24VDUOO15j6mJ2K2LHKbl6JP08cW+y8leR2q292YUeTONgEQx9x
	 TlmC5z/NvtdpZHuw6U26QBiXu9NRsJWG/sXtXFAZfVCwH4ryVMz7lwkHE3uMeYH8JF
	 syjq0hxljEL0P8o8KwJmEuYV+ANzI0wLkAcbm15w11qCXmcY4FQ1QEsbIfEiFeBdk3
	 mPqxE8IYZjdVw==
Date: Tue, 11 Feb 2025 08:39:01 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: David Kaplan <david.kaplan@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 18/35] x86/bugs: Restructure srso mitigation
Message-ID: <20250211163901.kt4if7r7xehq3hqo@jpoimboe>
References: <20250108202515.385902-1-david.kaplan@amd.com>
 <20250108202515.385902-19-david.kaplan@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250108202515.385902-19-david.kaplan@amd.com>

On Wed, Jan 08, 2025 at 02:24:58PM -0600, David Kaplan wrote:
> @@ -2749,98 +2741,98 @@ static void __init srso_select_mitigation(void)
>	if (has_microcode) {
>		/*
>		 * Zen1/2 with SMT off aren't vulnerable after the right
>		 * IBPB microcode has been applied.
>		 *
>		 * Zen1/2 don't have SBPB, no need to try to enable it here.
>		 */

This second paragraph no longer applies here since enablement isn't done
in this function anyway.

>		if (boot_cpu_data.x86 < 0x19 && !cpu_smt_possible()) {
>			setup_force_cpu_cap(X86_FEATURE_SRSO_NO);
>			return;
>		}

This should also set 'srso_mitigation = SRSO_MITIGATION_NONE', otherwise
it will end up applying the mitigation.


> +	switch (srso_mitigation) {
> +	case SRSO_MITIGATION_MICROCODE:
>  		break;

The switch statement has a default case so this one isn't needed.

>  
> +	case SRSO_MITIGATION_SAFE_RET:
> +	case SRSO_MITIGATION_SAFE_RET_UCODE_NEEDED:
> +		if (!IS_ENABLED(CONFIG_MITIGATION_SRSO))
>  			pr_err("WARNING: kernel not compiled with MITIGATION_SRSO.\n");
> -		}
> +		else if (boot_cpu_has(X86_FEATURE_SRSO_USER_KERNEL_NO))
> +			srso_mitigation = SRSO_MITIGATION_IBPB_ON_VMEXIT;

This misses the below SRSO_MITIGATION_IBPB_ON_VMEXIT check for
CONFIG_MITIGATION_SRSO.

Though, that doesn't make any sense.  What they really need to be
checking for is CONFIG_MITIGATION_IBPB_ENTRY.

> +	case SRSO_MITIGATION_IBPB_ON_VMEXIT:
> +		if (!IS_ENABLED(CONFIG_MITIGATION_SRSO))
>  			pr_err("WARNING: kernel not compiled with MITIGATION_SRSO.\n");
> -                }
> +		break;

This is an existing bug, but as mentioned above this should be checking
for CONFIG_MITIGATION_IBPB_ENTRY instead of CONFIG_MITIGATION_SRSO.

> +static void __init srso_update_mitigation(void)
> +{
> +	/* If retbleed is using IBPB, that works for SRSO as well */
> +	if (retbleed_mitigation == RETBLEED_MITIGATION_IBPB)
> +		srso_mitigation = SRSO_MITIGATION_IBPB;

Another dependency on retbleed_update_mitigation().

> +	if (srso_mitigation != SRSO_MITIGATION_NONE)
> +		pr_info("%s\n", srso_strings[srso_mitigation]);
> +}

For consistency with others this should probably be something like

	if (boot_cpu_has_bug(X86_BUG_SRSO) && !cpu_migitations_off())
		pr_info("%s\n", srso_strings[srso_mitigation]);

> +		setup_clear_cpu_cap(X86_FEATURE_RSB_VMEXIT);
>  		break;
>  	default:
>  		break;
>  	}
>  
> -out:
> -	pr_info("%s\n", srso_strings[srso_mitigation]);
>  }

Extra whitespace.

-- 
Josh
