Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B84D1EE004
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 18:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744308733; cv=none; b=de2SibNro3irGi20hU+9tRd/GlEfTn61ciz7e143UBEQOtMgEfDZvaTAxaA7+yDJJwtcd+2F45N7dmFW0Rrt9kKY/kod1+W5rCuy4gmIk+oRCm8xGCQLRZxmo6V3zAd9dwhQ3LAoX75nA3ZGEMmRjWuBJ9MCNbOwTkll7rdLnpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744308733; c=relaxed/simple;
	bh=5OCXzZ8E7TldpM1RQ3DMguRYZfBFVCCZecIHS29aAy0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ntWLPEx1xFRTitJu1m5d4ywYs9zBFxqQuoXVBcPtmBbSPooRK3f+C0JkvKXpE76281Sp22hUzDFJUdF/KAqQoM9MA6pD8b6v7ezKORFriB4juwHDNziCzPWoWVL6cFTXir0rO0hGxTzaqHT+OOELDnh1C7fd+o5rKB1xeP7Hbks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JXBo0KT+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JXBo0KT+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CA64C4CEE3;
	Thu, 10 Apr 2025 18:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744308733;
	bh=5OCXzZ8E7TldpM1RQ3DMguRYZfBFVCCZecIHS29aAy0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JXBo0KT+Xk7ghjslPtjiCZDScQtVCtipAu8PkCtyT5AFgBbFvN9+6TOgsI/efcsav
	 sNZwisM6jQpcBDZCqaMiUl2bs5m0oVZkYhbpD5ETkCSBjgGo5fYo4PuBqDJNfIlqI4
	 CNGi+CUMvjVQmcQ2EygIWUZXwfrDuVnQP0EnH/QHhQ9AVLUFnm/7ihU+XI+pmHarYT
	 llZ6lI/Na/6cJF+uzxpyykJc6SJDOIhHYrIOkJZ+FTDqtjQU1KtJYfLpNSJKb8jjJK
	 6aLVwB9jGlw4BOi7lEvDfQ/MaZPX8OokuhFBJEDgfIMyE1XU9lHH/nsfZVk0SIen9I
	 4b0CQEJKk6VXA==
Date: Thu, 10 Apr 2025 11:12:09 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: David Kaplan <david.kaplan@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
	Peter Zijlstra <peterz@infradead.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
	Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, 
	Brendan Jackman <jackmanb@google.com>, Derek Manwaring <derekmn@amazon.com>
Subject: Re: [PATCH v4 18/36] cpu: Define attack vectors
Message-ID: <uhfexplln3n736m4yxdrfqg666x4hs5pokxqw6ycnaktastvko@zi2saqxeoidj>
References: <20250310164023.779191-1-david.kaplan@amd.com>
 <20250310164023.779191-19-david.kaplan@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250310164023.779191-19-david.kaplan@amd.com>

On Mon, Mar 10, 2025 at 11:40:05AM -0500, David Kaplan wrote:
> @@ -3178,8 +3179,38 @@ void __init boot_cpu_hotplug_init(void)
>  
>  #ifdef CONFIG_CPU_MITIGATIONS
>  /*
> - * These are used for a global "mitigations=" cmdline option for toggling
> - * optional CPU mitigations.
> + * All except the cross-thread attack vector are mitigated by default.
> + * Cross-thread mitigation often requires disabling SMT which is too expensive
> + * to be enabled by default.

Cross-thread is *partially* mitigated by default (everything except
disabling SMT).

> +bool cpu_mitigate_attack_vector(enum cpu_attack_vectors v)
> +{
> +	if (v < NR_CPU_ATTACK_VECTORS)
> +		return attack_vectors[v];
> +
> +	WARN_ON_ONCE(v >= NR_CPU_ATTACK_VECTORS);

This can be a WARN_ONCE(), v is already known to be invalid here.

>  static int __init mitigations_parse_cmdline(char *arg)
>  {
> -	if (!strcmp(arg, "off"))
> -		cpu_mitigations = CPU_MITIGATIONS_OFF;
> -	else if (!strcmp(arg, "auto"))
> -		cpu_mitigations = CPU_MITIGATIONS_AUTO;
> -	else if (!strcmp(arg, "auto,nosmt"))
> -		cpu_mitigations = CPU_MITIGATIONS_AUTO_NOSMT;
> -	else
> -		pr_crit("Unsupported mitigations=%s, system may still be vulnerable\n",
> -			arg);
> +	char *s, *p;
> +	int len;
> +
> +	len = mitigations_parse_global_opt(arg);
> +
> +	if (cpu_mitigations_off()) {
> +		memset(attack_vectors, 0, sizeof(attack_vectors));
> +		smt_mitigations = SMT_MITIGATIONS_OFF;
> +	} else if (cpu_mitigations_auto_nosmt())
> +		smt_mitigations = SMT_MITIGATIONS_ON;

Kernel coding style wants consistent braces for if-then-else:

	if (cpu_mitigations_off()) {
		memset(attack_vectors, 0, sizeof(attack_vectors));
		smt_mitigations = SMT_MITIGATIONS_OFF;
	} else if (cpu_mitigations_auto_nosmt()) {
		smt_mitigations = SMT_MITIGATIONS_ON;
	}

-- 
Josh
