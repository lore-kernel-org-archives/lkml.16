Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FF0280CFF
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 17:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744306717; cv=none; b=rKWH2MzdU8dM9504VWCITQBqfwLZw8pjYcLMl9wJ9ZwOmMbZmYpEnOJ1BnIXzIQ6Qg0oiKGDQS/u+MHQG3+zKHK+nd+p1pF6SV3KkS1271YEkuOrjZ3/p9Yjd2X19s3LzgJa4HH9AN8crDEAyrgLKbUq7aRxmHvPATGC/fDIVBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744306717; c=relaxed/simple;
	bh=QhoFF/Rla3fz82DMIHrklOjhlmYVez/wm1U48HlVXR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ahJwkELKG6WFO1NU03h9iFEDgyxe3Ms+cF4z1/u5wgiQ7ZxA39EpW2+EzGNIB79tGsEcfqpDygWfIMzULiLJ0zVGenK13GeNLBvEODEbGLdGPoVpJO8U17bfpt6PG+P2sZOIBUQQbJRWl9n0YMFQUYaRlUT0QiH8dg8pPP6VfEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dRef6Ng8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dRef6Ng8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79941C4CEDD;
	Thu, 10 Apr 2025 17:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744306717;
	bh=QhoFF/Rla3fz82DMIHrklOjhlmYVez/wm1U48HlVXR0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dRef6Ng8bagvL80YQ+WvNNPJ+hhJ+SJvnAm136vwFtz3F3pcarc4iqsgTWeQYtPIU
	 yCw/Ctw3E8XTpp1DRSgHkOWHdZooWe0yhsjzMnXAz+3ELG/GK0ObwkB5BcNj1/eU0Z
	 Zqrz79cu1RywTPQ9Hw1gKq5pIwE78Af2MvG3Fb5ILkjQX/VPya/Zhav9+H4v+Eb9mb
	 Xzcg4QqqBKd+8kl6zw3n1M73jddvcxp0/0NvVzd+C3WzsoGN6eUSgLNN4c+CnHaCrx
	 Uty2zkKO+NS0+253Hk98GHQuksDBHW0gLMlaUjgBVKQPNw219ykNsiUCgzf9wl+eYB
	 QrFCeOtF+e2/A==
Date: Thu, 10 Apr 2025 10:38:33 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: David Kaplan <david.kaplan@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
	Peter Zijlstra <peterz@infradead.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
	Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, 
	Brendan Jackman <jackmanb@google.com>, Derek Manwaring <derekmn@amazon.com>
Subject: Re: [PATCH v4 16/36] x86/bugs: Restructure srso mitigation
Message-ID: <korid5xgajulsxxbxwyyqkhqihulxqbdbucjzcom6ej7tw52xy@doi7d5tejiuj>
References: <20250310164023.779191-1-david.kaplan@amd.com>
 <20250310164023.779191-17-david.kaplan@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250310164023.779191-17-david.kaplan@amd.com>

On Mon, Mar 10, 2025 at 11:40:03AM -0500, David Kaplan wrote:
> @@ -229,6 +226,8 @@ void __init cpu_select_mitigations(void)
>  	taa_update_mitigation();
>  	mmio_update_mitigation();
>  	rfds_update_mitigation();
> +	/* srso_update_mitigation() relies on retbleed_mitigation. */
> +	srso_update_mitigation();

"relies on" -> "depends on" for consistency with the other comments.
Also it's "retbleed_update_mitigation".  Also needs parentheses:

	/* srso_update_mitigation() depends on retbleed_update_mitigation() */

> +	switch (srso_mitigation) {
> +	case SRSO_MITIGATION_SAFE_RET:
> +		if (!IS_ENABLED(CONFIG_MITIGATION_SRSO))
>  			pr_err("WARNING: kernel not compiled with MITIGATION_SRSO.\n");

srso_mitigation should be reset to NONE here?

> -		} else {
> -			pr_err("WARNING: kernel not compiled with MITIGATION_IBPB_ENTRY.\n");

Same here.

-- 
Josh
