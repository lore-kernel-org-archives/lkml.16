Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952A81EFFBB
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 16:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744302371; cv=none; b=a8NJFEFSxfpNDfJioXkiWT3Tl/sb9t/YRT0wj7ZDxrZjBsWS/b4wXuPNjHZ6T9BhcIIsOP/xQ7sCGsHsd6qcZPv1/9gtwhQXiL8YtFYJxtRB3eTR0eUD6AzutXkUhCvbEtOa5aUKPaysfIPy71ZQoD/9/wAIM26Ei5haxg+7hMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744302371; c=relaxed/simple;
	bh=9PCvs9P6B1VLBwwN2/UobvwV9zXfs2G+o6tRB1P5yYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gLo08U0CY2LqJjWefRkCp84J01XLHekbzcJXy+iDemBKQwvKQw332yFeYf6X4Hts71qOag1d5VqTjfo/5+HmbaH5+mZYdlGqAuZJOiJlMCpcV9VH9Gtt6WTqupO4gc4LtpENNFP0Hlh9FyOgYTNwrnIz2nmyQEl8nVky4EbETVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d3PZTOVi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d3PZTOVi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A99EC4CEDD;
	Thu, 10 Apr 2025 16:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744302371;
	bh=9PCvs9P6B1VLBwwN2/UobvwV9zXfs2G+o6tRB1P5yYo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d3PZTOVitzDasUBIfd1RzehwxgU0oR45jn2wYzchnEXh4Wc4yd1njRKdoEs2Wyc9o
	 H3Z1qd3Ad43OV3BKGesokKniiW1nuWlWxHUjkwoFa4rIoIigN+u9StxpgK6P7NpXdX
	 gyFkxEMMLQTgnCeSMn4iI5bHbUB7NTp5abxoTsolKJ0vMGlh5YrZk1do7X79kF0OpM
	 VBoO0zX5mOOaD8RlW81kM6nmhRti07hqEfqqHUHJuFjF+J0xE/edDfoRnpO/U3ublp
	 0/nWqSfjV2ELc+I+06Xei52dj73zBycO3E2QcGbKmWFFLMFZ99YfnfM12eDDFR0Q1R
	 HtIYxHxqt5sHQ==
Date: Thu, 10 Apr 2025 09:26:08 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: David Kaplan <david.kaplan@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
	Peter Zijlstra <peterz@infradead.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
	Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, 
	Brendan Jackman <jackmanb@google.com>, Derek Manwaring <derekmn@amazon.com>
Subject: Re: [PATCH v4 11/36] x86/bugs: Restructure spectre_v2_user mitigation
Message-ID: <o3ceiexzywuw4udvxf3fcxyjqlff4kpvepjr2jii67oghkyai2@6dok6fljt2vs>
References: <20250310164023.779191-1-david.kaplan@amd.com>
 <20250310164023.779191-12-david.kaplan@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250310164023.779191-12-david.kaplan@amd.com>

On Mon, Mar 10, 2025 at 11:39:58AM -0500, David Kaplan wrote:
>  static inline bool spectre_v2_in_ibrs_mode(enum spectre_v2_mitigation mode)
> @@ -1446,10 +1436,10 @@ static inline bool spectre_v2_in_ibrs_mode(enum spectre_v2_mitigation mode)
>  	return spectre_v2_in_eibrs_mode(mode) || mode == SPECTRE_V2_IBRS;
>  }
>  
> +

Extra newline here.

>  	case SPECTRE_V2_USER_CMD_SECCOMP:
> -	case SPECTRE_V2_USER_CMD_SECCOMP_IBPB:
>  		if (IS_ENABLED(CONFIG_SECCOMP))
> -			mode = SPECTRE_V2_USER_SECCOMP;
> +			spectre_v2_user_ibpb = SPECTRE_V2_USER_SECCOMP;
>  		else
> -			mode = SPECTRE_V2_USER_PRCTL;
> +			spectre_v2_user_ibpb = SPECTRE_V2_USER_PRCTL;
> +		spectre_v2_user_stibp = spectre_v2_user_ibpb;
> +		break;
> +	case SPECTRE_V2_USER_CMD_SECCOMP_IBPB:
> +		spectre_v2_user_ibpb = SPECTRE_V2_USER_STRICT;
> +		spectre_v2_user_stibp = SPECTRE_V2_USER_PRCTL;
>  		break;
>  	}

For SPECTRE_V2_USER_CMD_SECCOMP_IBPB, shouldn't spectre_v2_user_stibp
be SPECTRE_V2_USER_SECCOMP if CONFIG_SECCOMP?

Also I think spectre_v2_user_ibpb needs to be cleared here if
X86_FEATURE_IBPB isn't set.  And similar for spectre_v2_user_stibp and
X86_FEATURE_STIBP.

> -	/* Initialize Indirect Branch Prediction Barrier */
> -	if (boot_cpu_has(X86_FEATURE_IBPB)) {
> -		static_branch_enable(&switch_vcpu_ibpb);
> +	/*
> +	 * At this point, an STIBP mode other than "off" has been set.
> +	 * If STIBP support is not being forced, check if STIBP always-on
> +	 * is preferred.
> +	 */
> +	if (spectre_v2_user_stibp != SPECTRE_V2_USER_STRICT &&
> +	    boot_cpu_has(X86_FEATURE_AMD_STIBP_ALWAYS_ON))
> +		spectre_v2_user_stibp = SPECTRE_V2_USER_STRICT_PREFERRED;

Instead of checking for !SPECTRE_V2_USER_STRICT it would probably be
better to check for SPECTRE_V2_USER_PRCTL or SPECTRE_V2_USER_SECCOMP
directly.

Then the returns added to the SPECTRE_V2_USER_CMD_AUTO case in
"x86/bugs: Add attack vector controls for spectre_v2_user" can be
converted to breaks, which simplifies the control flow and also allows
the above-suggested X86_FEATURE_IBPB/X86_FEATURE_STIBP checks to keep
working.

-- 
Josh
