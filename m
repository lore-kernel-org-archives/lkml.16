Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11329249F9
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 23:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739230587; cv=none; b=BwWpO9ho09IuUiI64KIHs4PXFC2CDSIHZ2KEgnvReNm8YqZbIjJduxTTuzZuldSJa9dKrVgqfgTiF53efkKFRdJnR/gS4G0gusVGGoNq9QRjLbP8vpsIwLg27kArqpy6p1hzczkJqHbQKV2bLDkRpG96Tcb4ehlefkI5WNTmTGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739230587; c=relaxed/simple;
	bh=4thV8QbJuxQXj977eAQIljPPXEzmJVVuvhh/hFnxAu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M4izwwR+QaQDZ5eKmRaCEB+GPaGxiJVPi7rl4HMa6c6Ls5sg999b0404qrlUjWE04zeCUE7AKLUgv+x6JEggjdWoeWLV6c14w+YQi7XfowyWpM+wBiKxatRx+plwCNFqWFgXlLPRJqPMoVC/8llzVjI++METdVAbuq4KdHDa0l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eyymu/sq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eyymu/sq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26AAFC4CED1;
	Mon, 10 Feb 2025 23:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739230586;
	bh=4thV8QbJuxQXj977eAQIljPPXEzmJVVuvhh/hFnxAu0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eyymu/sqr+1cvX3zrQqvTxU+MBFvSGuCLhyHj1OCEbeWLNLRpGTaWdisi/pTjrqGE
	 vwTO50fqYGAZFIFcy8y1Uaw4mGKGmawwRodnwZDaTOwK2fgIN9WhjGd6KfHIFroAy+
	 xCIkbyfke+ywZAG/UU1Z+boQZ53u0spwbSLD6QBqg7nrVih4MIZK3bpStBZb04KI+d
	 Sle9886rQCiP9Oci1hwMl9O4EzK2IpqEwp0nuzkUFBVBtMqVTsKrmPt2iYOpIwPXie
	 iDjsEUXhxcAGgfvYk4nQNzXWMTrCOR/Ifvh3scLZMIBYlLCyKLMn7nskjgD9/yvwQk
	 mZSQxDedH+c1Q==
Date: Mon, 10 Feb 2025 15:36:24 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: David Kaplan <david.kaplan@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 07/35] x86/bugs: Restructure rfds mitigation
Message-ID: <20250210233624.aj4tmhzhryx5jkmd@jpoimboe>
References: <20250108202515.385902-1-david.kaplan@amd.com>
 <20250108202515.385902-8-david.kaplan@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250108202515.385902-8-david.kaplan@amd.com>

On Wed, Jan 08, 2025 at 02:24:47PM -0600, David Kaplan wrote:
> @@ -627,11 +630,28 @@ static void __init rfds_select_mitigation(void)
>  
>  	if (rfds_mitigation == RFDS_MITIGATION_AUTO)
>  		rfds_mitigation = RFDS_MITIGATION_VERW;

Another superfluous return above this one.

> +static void __init rfds_apply_mitigation(void)
> +{
> +	if (rfds_mitigation == RFDS_MITIGATION_VERW)
>  		setup_force_cpu_cap(X86_FEATURE_CLEAR_CPU_BUF);
> -	else
> -		rfds_mitigation = RFDS_MITIGATION_UCODE_NEEDED;

Hm, unlike the other VERW mitigations, this doesn't even attempt to do
VERW on missing ucode.

Ah well, it was already like that and I doubt anybody cares at this
point.

-- 
Josh
