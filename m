Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFC02A1D8
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 17:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738949040; cv=none; b=DM043QOagiOMQKX6Nso9KNOVmiIJS507eosY55oTWQssz07dTWs45UBn9UdAIc/yF+GuzECQdUfc4qZ841pjH1/OxqAQAhkUuuio2iheEw8IXExBwbODNpyKlaaXvLXGx7MTd6MYzq3hALoxkt9jSdHK9lP0RIjjIp+bqiHTU5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738949040; c=relaxed/simple;
	bh=J+eAmSpGaLnyDFtlo6hN/Hf4BYkn99aJa+bATAH90S0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vca4soO/hS8zwG6tGwUDr0YK1UijiAaH5ULb+J5KJApIvYuhhDR1W7eQElGB39cQLtByjhFKhppfLxehaCmZQAiWKIkX2lB3+B6Q8FGBBR6iaQJSMyxVbrrLWsZ7Ld1uduXDGuFa9Xl41Gtu0G7NLasvcIP0cdSrro4cUzr5UZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F6E1qd1C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F6E1qd1C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80ED1C4CEDF;
	Fri,  7 Feb 2025 17:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738949040;
	bh=J+eAmSpGaLnyDFtlo6hN/Hf4BYkn99aJa+bATAH90S0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F6E1qd1CdQ2B11+T9gX+sFyrpPEnZ3qERhdLlDZSQ1VyKEVr3tlYC9UZNrUhhzteS
	 sYJO9WUL0uNARG/5EPl3IoDHM/J2VKHquyvozORyIwc0yaEMsx7I+CHdSR+L0TsZQt
	 k/ps8FHn4DicFZbRtTcTjHMvFi7gxiZ2v9HFq5zwvULVAWiB/A0GPxyQJMDH63X3LI
	 5Qp6bJlN2Vwap+43KZliGrqyvjksATOwNrlz9ACSErdmOI/3lD5bCbq2GhBjT4SfOv
	 3SY6hOJbpZCPszpDyJ4ag+N3QA0nlyuT3YRQFvIXEp+j9+P+w2Bd7y0LI29SbuzEJ6
	 HKIF1ZvmeclNQ==
Date: Fri, 7 Feb 2025 09:23:57 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, alyssa.milburn@intel.com,
	scott.d.constable@intel.com, joao@overdrivepizza.com,
	andrew.cooper3@citrix.com, jose.marchesi@oracle.com,
	hjl.tools@gmail.com, ndesaulniers@google.com,
	samitolvanen@google.com, nathan@kernel.org, ojeda@kernel.org,
	kees@kernel.org, alexei.starovoitov@gmail.com, mhiramat@kernel.org
Subject: Re: [PATCH 06/11] x86/alternative: Simplify callthunk patching
Message-ID: <20250207172357.ycl7rajhjqwdn544@jpoimboe>
References: <20250207121529.222723073@infradead.org>
 <20250207122546.617187089@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250207122546.617187089@infradead.org>

On Fri, Feb 07, 2025 at 01:15:35PM +0100, Peter Zijlstra wrote:
> +++ b/arch/x86/kernel/alternative.c
> @@ -1697,14 +1697,14 @@ void __init alternative_instructions(voi
>  	apply_retpolines(__retpoline_sites, __retpoline_sites_end);
>  	apply_returns(__return_sites, __return_sites_end);
>  
> -	apply_alternatives(__alt_instructions, __alt_instructions_end);
> -
>  	/*
> -	 * Now all calls are established. Apply the call thunks if
> -	 * required.
> +	 * Adjust all CALL instructions to point to func()-10, including
> +	 * those in .altinstr_replacement.

Clarify 10 is hex: "func()-0x10" ?

-- 
Josh
