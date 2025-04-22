Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4457C214236
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 13:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745330309; cv=none; b=DQW14pSg+crit6Xm01jK2Z3iMGVirXLamMOqK3TfK06jMI4oc62y07mwNCP4bE5ulWVARE6wAKNpPO/Hc8EnFybcwTMs/Au8QDcRCNS097lERhOFJXqs+CGi3CiyYafPF1TpVbs/QRFwWqVleBFd82XYuiCuYrHGBW8iPP0jYhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745330309; c=relaxed/simple;
	bh=T5X59jETNWOUTxfV3sgDLkOmhnNuqOXNaAFRFfzpqy0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AYqcijMqD55uRURfeJiEIzLhH5Pm7ruW2P4rXfWadtYX0J34JSPsPQFvudV2dpwGq0nGkx0qhZjE/sl0cZPPabCXaBRd6/R4lLxCPNzmSIMIyT61AgPQF9S+uX7Ctqlvy1tjSrSmconpaGqY6GC2tkrJSyPjU3HXbhWFjbWUtTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=DlIktlcg; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="DlIktlcg"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id D751C40E01FA;
	Tue, 22 Apr 2025 13:58:23 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id RR4citaDM2S3; Tue, 22 Apr 2025 13:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1745330299; bh=t2dYJaGH3R6DDzNKlqeYVwFBXBscr6EUJOaos8RE7Mg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DlIktlcgrLLZzdOFF36c42LmTsDM7WnAmSIX/HBvRBLtdu+5r2u5V+DakV8AA890f
	 R+H/buzVcgMUVTGbbUSRPF7MSSZLpBmcPuchKj/Brt9B8W/djOp3GWHiAiaEbHwDB3
	 saAkFemgM/b7zCVIBXSdk+2WyAPC8a8HT3AJSmhwMAjM78vHaLHyPiFoIAWM7LUpNy
	 GKcqBAymp/YSgf4DLZcKtSxoWWL+Xg6dG7+YdDuy4nt4GFiKBzFV4YJSyJllduNk82
	 cCzwppvLVx2JEKrwdqs7QhxUxhjc5O3HkfA/pov9A/5w6D09+rOVirEvk0AZlghwHa
	 Fg8vfgtp4wQhn9U2FRjqzhBJ7naUCqIcp2IE9oPlIFhOY3iXIN4Ok6s/Syl/v/qyuu
	 texNSNuJoEGbTM4626ztlm0KUJxSlh3YdDSrcyIAT0xh6JdWRXl4a3zQF/3DxjFAxg
	 r5dsTaspLhddZNGeru/GK13uSG/prHhmSZfLt7Du6iQYmgbE4U/MM4D3+oDsVieI/p
	 HbOVIQIe790yWw4bEJmdQpQdlLKmSY69LozM7QsmGFjpXNszZBz6xlEa7VmflNZD5a
	 OUQp2R31LmEWGGAB7trtXQuk6xL0gF/lDGDRICGzays31ZqiQ4Bpp1UAzgVYv6v2VD
	 MT7qkgjE7q3gMMm7LG4ux6Po=
Received: from rn.tnic (unknown [78.130.214.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 30F8640E01CF;
	Tue, 22 Apr 2025 13:58:07 +0000 (UTC)
Date: Tue, 22 Apr 2025 15:59:07 +0200
From: Borislav Petkov <bp@alien8.de>
To: Ingo Molnar <mingo@kernel.org>
Cc: David Kaplan <david.kaplan@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 00/16] Attack vector controls (part 1)
Message-ID: <20250422135907.GAaAegq5YUl1qQhjWM@renoirsky.local>
References: <20250418161721.1855190-1-david.kaplan@amd.com>
 <aAKwHvLTDfyM2UfS@gmail.com>
 <20250418213336.GIaALFMKSwKKGw7tTd@fat_crate.local>
 <aAdlefbyU_oqOVIg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aAdlefbyU_oqOVIg@gmail.com>

On Tue, Apr 22, 2025 at 11:46:33AM +0200, Ingo Molnar wrote:
> The above pattern is not a big problem really, as the human brain has 
> no trouble ignoring well-structured syntactic repetitions on the left 
> side and will focus on the right side column.
> 
> Unlike the current status quo, which your reply didn't quote, so I'll 
> quote it again:
> 
>  static void __init spectre_v1_select_mitigation(void);
>  static void __init spectre_v2_select_mitigation(void);
>  static void __init retbleed_select_mitigation(void);
>  static void __init spectre_v2_user_select_mitigation(void);
>  static void __init ssb_select_mitigation(void);
>  static void __init l1tf_select_mitigation(void);
>  static void __init mds_select_mitigation(void);
>  static void __init md_clear_update_mitigation(void);
>  static void __init md_clear_select_mitigation(void);
>  static void __init taa_select_mitigation(void);
>  static void __init mmio_select_mitigation(void);
>  static void __init srbds_select_mitigation(void);
>  static void __init l1d_flush_select_mitigation(void);
>  static void __init srso_select_mitigation(void);
>  static void __init gds_select_mitigation(void);
> 
> Which is far more visually messy.

That's when those are written in a block together - there the human
brain can selectively ignore.

I mean when the functions are called in succession. See
cpu_select_mitigations(). All this function does is select mitigations.
So there's no need to state the selection of every single mitigation.

> What do I select? Some GDS detail? Or the main mitigation itself? 
> Nothing really tells me.

We're going to have _select(), _update() and apply() function per
mitigation. And this will be documented at the top of bugs.c

In the confines of this file, those functions are special and when you
select, update or apply something in bugs.c, it should always refer to
a mitigation.

We can make that decision here, in that file, for the sanity of everyone
who's looking at it.

> While with:
> 
> 	static void __init mitigation_select_gds(void)
> 	{
> 		u64 mcu_ctrl;
> 
> It's immediately clear that this is the main function that selects the 
> GDS mitigation.

Sorry:

$ git grep -o -i mitigation arch/x86/kernel/cpu/bugs.c | wc -l
714

That's just madness: this file has waaaaay too many "mitigation"s and it
impairs the reading. *Especially* if this file is *all* *about*
mitigations and only about that.

The new scheme is going to tip those scales over 1K...

> 3)
> 
> A proper namespace also makes it *much* easier to grep for specific 
> primitives.
> 
> With your suggested 'gds_select()' naming, if I want to search for all 
> gds_ primitives, I get:

Sorry, this is a bad example: if you want to search for a static
function's uses in the same file, you simply go in your favorite editor
and search for "word-under-cursor".

> Hierarchical lexicographic organization of function names is basically 
> a code organization 101 concept, and I didn't think it would be 
> particularly controversial. :-)

And yet the current naming ain't optimal, IMO, due to the too often
regurgitation of "mitigation". And that's particularly a problem if
it impairs reading of the code - lexicographic organization then is
secondary.

And as said before, you don't need a "mitigation_" prefix for static
functions.

And reading that code properly is the most important thing. *Especially*
*that* code.

So the goal of the bikeshedding here should be optimal reading. I.e.,
what function and variable naming allows for an optimal reading of the
code.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
