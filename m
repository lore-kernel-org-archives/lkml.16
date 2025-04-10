Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F52D1EE00B
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 16:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744302282; cv=none; b=per2Z7SIOJUC/B8AVcfB0+i4YM9MgUUQyMUI2qMq6m64BCNdYNab/2tYLC0pVQ/LxrMKDktcCWLMWHBfHcrsJDJcGYil/YWYA7aXLXsNr4pnzLD1b8GOqXmE8mzN4Lkhd3M8gTIQgPUfxR4BlMrFd2oWt+rlAW24PMVfi6Ze0Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744302282; c=relaxed/simple;
	bh=YGpwzKfYl48444/K4CsRVapPu48lxoWEQgss5OPipVs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G5QY7JNeH/LG6Xz4j7ZCY/z4qLjFJZmB9iJ088px2LmvoYw/v1rj5B0FgA10JGEUSte9YX/FrtkryrskbInfksid84i34J5Rk/XgTp3QCyLdgTmpQ7L5Vw3I9HKRP+5DnbH8/nZUiFNS/OGpkuEOAh1Yq6ZXF+R6oHT2rA+b5BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EtIy/rBh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EtIy/rBh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61580C4CEE9;
	Thu, 10 Apr 2025 16:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744302281;
	bh=YGpwzKfYl48444/K4CsRVapPu48lxoWEQgss5OPipVs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EtIy/rBhkzbZfEU3PrFh+ovQ3behZF12BzIwCWh2k0wnDBzbBdxeZMuZt+3aC+9il
	 AmovD0NcsRQ4X57x9QT1zEBaN8bYtJIidnPCRPXoyxs9p64uwZF1UxRgIh6IKA4c+3
	 E33AObjANMHM23zBi6w777CQjZ4dhmlyl82MFk6TIPcfM8dMvWvG174WUlgBAnAcac
	 cNb0uIuZzm7CQWIlZ/5uJ9REAkFDpvuVQ2OZzk8vzK1xVC4dRR1jFEWMzek1/E3lSc
	 s3arcgPQPSwUN28wY2p1Bhizv3TTA3ZYjxmi+fHTY7gDeVLlss+PwrXCqQesUKWWcR
	 +cYhVOawafUzA==
Date: Thu, 10 Apr 2025 09:24:38 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: David Kaplan <david.kaplan@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
	Peter Zijlstra <peterz@infradead.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
	Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, 
	Brendan Jackman <jackmanb@google.com>, Derek Manwaring <derekmn@amazon.com>
Subject: Re: [PATCH v4 04/36] x86/bugs: Restructure rfds mitigation
Message-ID: <h7p644ejmyef2x6jau7wonbqufrtknyifza5ey2fjmz3bqfvas@xh5olvfqktg5>
References: <20250310164023.779191-1-david.kaplan@amd.com>
 <20250310164023.779191-5-david.kaplan@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250310164023.779191-5-david.kaplan@amd.com>

On Mon, Mar 10, 2025 at 11:39:51AM -0500, David Kaplan wrote:
>  static void __init rfds_select_mitigation(void)
>  {
>  	if (!boot_cpu_has_bug(X86_BUG_RFDS) || cpu_mitigations_off()) {
>  		rfds_mitigation = RFDS_MITIGATION_OFF;
>  		return;
>  	}
> -	if (rfds_mitigation == RFDS_MITIGATION_OFF)
> -		return;

The removal of this RFDS_MITIGATION_OFF check can cause
verw_mitigation_selected to get wrongly enabled below if it was
RFDS_MITIGATION_OFF to begin with.

I think it's only a bisection issue, that gets re-added later with
"x86/bugs: Add attack vector controls for rfds".

>  
>  	if (rfds_mitigation == RFDS_MITIGATION_AUTO)
>  		rfds_mitigation = RFDS_MITIGATION_VERW;
>  
> -	if (x86_arch_cap_msr & ARCH_CAP_RFDS_CLEAR)
> +	if (rfds_has_ucode())
> +		verw_mitigation_selected = true;
> +}

-- 
Josh
