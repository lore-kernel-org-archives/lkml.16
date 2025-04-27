Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C9B1ABEC5
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 08:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745741790; cv=none; b=HMKJn3sxYaxYvvtfkMMM2hRd7yDmVAqLN/rDfgc4qD1F48wy38XO113hI1uRcYzrIMHBWgpGcdLjDHYgSIgQjgBgNrhBfV0txD4+JpbbUAfpkiehTgRn3MccObeV7UYHlaWYqkZVDlp/X3MuRZtdBjwK7mWp6XxE3pCTLkYTZAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745741790; c=relaxed/simple;
	bh=jJcSQ2vAr8YR0cCbb8BI6h+fgvUJ8h87tk10K3e7KoE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UDWqYq1hvb54icHmDThY5a/N1Mn92TaL+4EYWsNE1RgCRkeWSAWX6Vnk9hGVYlnGvr6Si+jBi62c9yzVPP+nsRlmT5c+Kdt+ggeTOwmOdVzQvtwjVByAy+est8N0/k3x1r9bPeYhsUWEojd3KAsVFdGbWia4WVru4fhWrcHZKak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MHgeWA7G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MHgeWA7G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28093C4CEE3;
	Sun, 27 Apr 2025 08:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745741789;
	bh=jJcSQ2vAr8YR0cCbb8BI6h+fgvUJ8h87tk10K3e7KoE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MHgeWA7GUFmS4sv/HjHwgIo1o+G7en+rMigASUUzPzPQPoWKm2MR2wwvecNevQGYk
	 l7LrrYAS5BJ6SQRhGBQzFAKURqAGH/BB2GubHZbRdjt5ITcBJ1kByfiJf1CoWFEV73
	 PSmcJ2hZj8b3RIOHL/bWTszv5ffvb+0OLDED/g38ESRa2Ta9hZQODNZExk8onancGO
	 bee26LKx6fbTbVMyReVBY2ibf7M6X+stbkHdjgOoWqbXyzuY5UBSrAwmuhVzcFKINJ
	 zu51vi8q8bYtUsf0EXV77DZkPOAYDnHpDZI/WQklQW4a0D10e5/Ru1HfCLBD6hscsH
	 xgLK01qba/Tsg==
Date: Sun, 27 Apr 2025 10:15:54 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kernel@vger.kernel.org, "Ahmed S . Darwish" <darwi@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Ard Biesheuvel <ardb@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 13/15] x86/cpu: Make CONFIG_X86_CX8 unconditional
Message-ID: <aA3numuKnE6lCLyn@gmail.com>
References: <20250425084216.3913608-1-mingo@kernel.org>
 <20250425084216.3913608-14-mingo@kernel.org>
 <956412a3-43c2-4d6e-bea2-2573c98233ae@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <956412a3-43c2-4d6e-bea2-2573c98233ae@app.fastmail.com>


* Arnd Bergmann <arnd@kernel.org> wrote:

> On Fri, Apr 25, 2025, at 10:42, Ingo Molnar wrote:
> > @@ -257,7 +256,7 @@ config X86_MINIMUM_CPU_FAMILY
> >  	int
> >  	default "64" if X86_64
> >  	default "6" if X86_32 && (MPENTIUM4 || MPENTIUMM || MPENTIUMIII || 
> > MPENTIUMII || M686 || MVIAC3_2 || MVIAC7 || MEFFICEON || MATOM || MK7)
> > -	default "5" if X86_32 && X86_CX8
> > +	default "5" if X86_32
> >  	default "4"
> > 
> 
> I just noticed this one: the final 'default "4"' is no longer 
> possible here and can be removed. All the remaining CPUs report 
> family "5" or higher.

Right, I've applied the fix below and backmerged it into the series.

Thanks,

	Ingo

==========================>
 arch/x86/Kconfig.cpu | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/x86/Kconfig.cpu b/arch/x86/Kconfig.cpu
index 6f1e8cc8fe58..b3772d384fa0 100644
--- a/arch/x86/Kconfig.cpu
+++ b/arch/x86/Kconfig.cpu
@@ -257,7 +257,6 @@ config X86_MINIMUM_CPU_FAMILY
 	default "64" if X86_64
 	default "6" if X86_32 && (MPENTIUM4 || MPENTIUMM || MPENTIUMIII || MPENTIUMII || M686 || MVIAC3_2 || MVIAC7 || MEFFICEON || MATOM || MK7)
 	default "5" if X86_32
-	default "4"
 
 config X86_DEBUGCTLMSR
 	def_bool y
