Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B103C3C
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 00:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739232647; cv=none; b=XAzIvv7oJg6XkP0+5ltUnD2HqOB+b+Lz1p419ZiI6f2zaExql5iQ99EV2TfyUthTGm6jvzIq1vlnUHk883wI9y82olmixrC+/rg3HqP9Q/m4lH6NPHicCRhY+WrOgK3GVdO4EwYOVxRHzdfgxXLIc3E5B32sx8D171uFL7OHGTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739232647; c=relaxed/simple;
	bh=Y2zattz5yWvZeJBBywJMvINAIvnynaJjbl/+tOCQngQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dfinG0CtrbUvJOCKfVqty3ROwDqtjLvJS8qeZwNTWaJDCNnPUuOjwipSlgsZW+S2N8GBZRpE+me7LkAEbtFyxkQz08/JBvpdvvCkcPqNpigYZ68tKSANrEohREO3X1x+l6h2p07yCcLbala7Ftcrb6BJAgFlXqoLBy2tv2mKPqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GTLLXTuC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GTLLXTuC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A1DCC4CED1;
	Tue, 11 Feb 2025 00:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739232646;
	bh=Y2zattz5yWvZeJBBywJMvINAIvnynaJjbl/+tOCQngQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GTLLXTuCREASFpkNmVmVjIgNEBkH0aqb6KnEZad2pkYGNm1V+xtnQAJmNJwAADTRV
	 FfhfUT9bWV0s+e2JmYAvg+sfq/jie+gfLpM84IkbXVZJrQAZCR2BYg8n5Jga4ffPLN
	 ZO+5z9kJp0IS5BdJPvCdG/yorbYsS0SFdZ57lLoropu2NZyC7RtR2R+WnsyJ3MYUux
	 ggqw57x2llVgPC9XKH5P1/Wddv0g/H6QFTCoLDFj7GsyYkHKAPqkz3iUxdwVGSJhAp
	 0o53SVgiqNHATe+ntsE/rX9K+MZ79jLXcoGbHc1PRmwHeoWJp5+gpsjWkzB40xgbRi
	 xfddBPj0PA91g==
Date: Mon, 10 Feb 2025 16:10:44 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: David Kaplan <david.kaplan@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 12/35] x86/bugs: Restructure retbleed mitigation
Message-ID: <20250211001044.o3loayfnpcodvgy6@jpoimboe>
References: <20250108202515.385902-1-david.kaplan@amd.com>
 <20250108202515.385902-13-david.kaplan@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250108202515.385902-13-david.kaplan@amd.com>

On Wed, Jan 08, 2025 at 02:24:52PM -0600, David Kaplan wrote:
> @@ -1254,27 +1269,6 @@ static void __init retbleed_select_mitigation(void)
>  	    (retbleed_nosmt || cpu_mitigations_auto_nosmt()))
>  		cpu_smt_disable(false);
>  
> -	/*
> -	 * Let IBRS trump all on Intel without affecting the effects of the
> -	 * retbleed= cmdline option except for call depth based stuffing
> -	 */
> -	if (boot_cpu_data.x86_vendor == X86_VENDOR_INTEL) {
> -		switch (spectre_v2_enabled) {
> -		case SPECTRE_V2_IBRS:
> -			retbleed_mitigation = RETBLEED_MITIGATION_IBRS;
> -			break;
> -		case SPECTRE_V2_EIBRS:
> -		case SPECTRE_V2_EIBRS_RETPOLINE:
> -		case SPECTRE_V2_EIBRS_LFENCE:
> -			retbleed_mitigation = RETBLEED_MITIGATION_EIBRS;
> -			break;
> -		default:
> -			if (retbleed_mitigation != RETBLEED_MITIGATION_STUFF)
> -				pr_err(RETBLEED_INTEL_MSG);
> -		}
> -	}
> -
> -	pr_info("%s\n", retbleed_strings[retbleed_mitigation]);
>  }

Extra whitespace at end of function.

-- 
Josh
