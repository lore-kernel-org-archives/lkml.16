Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5E2217654
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 20:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745006627; cv=none; b=sQj8ccQ8TDRTNJjAh031BVLaJWKgUcCvFqmYaxtq6DDXkrC14BhGMv/zwaBFh/UzjWJGn+ak5riEaiekZI+sinxi3eOGwV7YWd3uaUbDd7nXXOshm73cwIIXbO8o3KgAybzWVmJgtZvPAWtC2ZqvhXv5sb1EWK/WYEl0o8x7b7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745006627; c=relaxed/simple;
	bh=WnwjcR+NbDgggX8XLQ1x4hgavKpbU7ZSEn3bAGipbyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ES9cnSaeXDhMFSHGRZaxma+gXQ/nuAfwRTeAP9Ezf1B2MpCKdmr2epv79n7ZJJG9QwfmpIoOpSa4RhY+uPwUWJr7pvBZ6yDSarC/eeJyUbGD9O+yPmmvTGkVQObYNjs601lU8D9bQzl7ZrYAH42omoXQSqev7Gmg459RVRWgJ5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Po0CPx4u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Po0CPx4u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9104C4CEE2;
	Fri, 18 Apr 2025 20:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745006626;
	bh=WnwjcR+NbDgggX8XLQ1x4hgavKpbU7ZSEn3bAGipbyI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Po0CPx4uwTf1TjK5R+ESkW2oE3ewE/rJu6k/FLEDfLk1jZDZxbYdgZ+0f52higJPA
	 6/WTMAJZFqoXEgrJOEC4FJnIZmawUgx7bUklqBDUKFTIY5GvOSUkds9UQiiMjLkmz9
	 u4hnnvb2Z4xs+VAWV6KpetnbPsu9GtPmskP9BcCevB5sqQDo1BLvvs5t9isGuMg0UJ
	 Ni5VQJalNJY2400kc/1l0yOd4S7ayZ6LGVYYbXb3BKJ50hdsJiupimuJZLmUPfMz64
	 /uapyeIKguemLQAqZBqVTwHyAPqCcnp0/PW35fLDFoNL/vEVVnrFZNaKowd/eK77w9
	 EicQOZcLHSgxQ==
Date: Fri, 18 Apr 2025 22:03:42 +0200
From: Ingo Molnar <mingo@kernel.org>
To: David Kaplan <david.kaplan@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 00/16] Attack vector controls (part 1)
Message-ID: <aAKwHvLTDfyM2UfS@gmail.com>
References: <20250418161721.1855190-1-david.kaplan@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418161721.1855190-1-david.kaplan@amd.com>


* David Kaplan <david.kaplan@amd.com> wrote:

> This is an updated version of the first half of the attack vector series
> which focuses on restructuring arch/x86/kernel/cpu/bugs.c.
> 
> For more info the attack vector series, please see v4 at
> https://lore.kernel.org/all/20250310164023.779191-1-david.kaplan@amd.com/.
> 
> These patches restructure the existing mitigation selection logic to use a
> uniform set of functions.  First, the "select" function is called for each
> mitigation to select an appropriate mitigation.  Unless a mitigation is
> explicitly selected or disabled with a command line option, the default
> mitigation is AUTO and the "select" function will then choose the best
> mitigation.  After the "select" function is called for each mitigation,
> some mitigations define an "update" function which can be used to update
> the selection, based on the choices made by other mitigations.  Finally,
> the "apply" function is called which enables the chosen mitigation.
> 
> This structure simplifies the mitigation control logic, especially when
> there are dependencies between multiple vulnerabilities.
> 
> This is mostly code restructuring without functional changes, except where
> noted.
> 
> Compared to v4 this only includes bug fixes/cleanup. 
> 
> David Kaplan (16):
>   x86/bugs: Restructure MDS mitigation
>   x86/bugs: Restructure TAA mitigation
>   x86/bugs: Restructure MMIO mitigation
>   x86/bugs: Restructure RFDS mitigation
>   x86/bugs: Remove md_clear_*_mitigation()
>   x86/bugs: Restructure SRBDS mitigation
>   x86/bugs: Restructure GDS mitigation
>   x86/bugs: Restructure spectre_v1 mitigation
>   x86/bugs: Allow retbleed=stuff only on Intel
>   x86/bugs: Restructure retbleed mitigation
>   x86/bugs: Restructure spectre_v2_user mitigation
>   x86/bugs: Restructure BHI mitigation
>   x86/bugs: Restructure spectre_v2 mitigation
>   x86/bugs: Restructure SSB mitigation
>   x86/bugs: Restructure L1TF mitigation
>   x86/bugs: Restructure SRSO mitigation
> 
>  arch/x86/include/asm/processor.h |    1 +
>  arch/x86/kernel/cpu/bugs.c       | 1112 +++++++++++++++++-------------
>  arch/x86/kvm/vmx/vmx.c           |    2 +
>  3 files changed, 644 insertions(+), 471 deletions(-)

So I really like this cleanup & restructuring.

A namespace suggestion.

Instead of _op_mitigation postfixes:

 static void __init spectre_v1_select_mitigation(void);
 static void __init spectre_v1_apply_mitigation(void);
 static void __init spectre_v2_select_mitigation(void);
 static void __init retbleed_select_mitigation(void);
 static void __init retbleed_update_mitigation(void);
 static void __init retbleed_apply_mitigation(void);
 static void __init spectre_v2_user_select_mitigation(void);
 static void __init spectre_v2_user_update_mitigation(void);
 static void __init spectre_v2_user_apply_mitigation(void);
 static void __init ssb_select_mitigation(void);
 static void __init ssb_apply_mitigation(void);
 static void __init l1tf_select_mitigation(void);
 static void __init l1tf_apply_mitigation(void);
 static void __init mds_select_mitigation(void);
 static void __init mds_update_mitigation(void);
 static void __init mds_apply_mitigation(void);
 static void __init taa_select_mitigation(void);
 static void __init taa_update_mitigation(void);
 static void __init taa_apply_mitigation(void);
 static void __init mmio_select_mitigation(void);
 static void __init mmio_update_mitigation(void);
 static void __init mmio_apply_mitigation(void);
 static void __init rfds_select_mitigation(void);
 static void __init rfds_update_mitigation(void);
 static void __init rfds_apply_mitigation(void);
 static void __init srbds_select_mitigation(void);
 static void __init srbds_apply_mitigation(void);
 static void __init l1d_flush_select_mitigation(void);
 static void __init srso_select_mitigation(void);
 static void __init srso_update_mitigation(void);
 static void __init srso_apply_mitigation(void);
 static void __init gds_select_mitigation(void);
 static void __init gds_apply_mitigation(void);
 static void __init bhi_select_mitigation(void);
 static void __init bhi_update_mitigation(void);
 static void __init bhi_apply_mitigation(void);

Wouldn't it be nicer to have mitigation_op_ prefixes, like most kernel 
subsystems use for their function names:

 static void __init mitigation_select_spectre_v1(void);
 static void __init mitigation_enable_spectre_v1(void);
 static void __init mitigation_select_spectre_v2(void);
 static void __init mitigation_select_retbleed(void);
 static void __init mitigation_update_retbleed(void);
 static void __init mitigation_enable_retbleed(void);
 static void __init mitigation_select_spectre_v2_user(void);
 static void __init mitigation_update_spectre_v2_user(void);
 static void __init mitigation_enable_spectre_v2_user(void);
 static void __init mitigation_select_ssb(void);
 static void __init mitigation_enable_ssb(void);
 static void __init mitigation_select_l1tf(void);
 static void __init mitigation_enable_l1tf(void);
 static void __init mitigation_select_mds(void);
 static void __init mitigation_update_mds(void);
 static void __init mitigation_enable_mds(void);
 static void __init mitigation_select_taa(void);
 static void __init mitigation_update_taa(void);
 static void __init mitigation_enable_taa(void);
 static void __init mitigation_select_mmio(void);
 static void __init mitigation_update_mmio(void);
 static void __init mitigation_enable_mmio(void);
 static void __init mitigation_select_rfds(void);
 static void __init mitigation_update_rfds(void);
 static void __init mitigation_enable_rfds(void);
 static void __init mitigation_select_srbds(void);
 static void __init mitigation_enable_srbds(void);
 static void __init mitigation_select_l1d_flush(void);
 static void __init mitigation_select_srso(void);
 static void __init mitigation_update_srso(void);
 static void __init mitigation_enable_srso(void);
 static void __init mitigation_select_gds(void);
 static void __init mitigation_enable_gds(void);
 static void __init mitigation_select_bhi(void);
 static void __init mitigation_update_bhi(void);
 static void __init mitigation_enable_bhi(void);

(Note that I changed '_apply' to '_enable', to get three 6-letter verbs. ;-)

We already do this for the Kconfig knobs:

 CONFIG_MITIGATION_PAGE_TABLE_ISOLATION=y
 CONFIG_MITIGATION_RETPOLINE=y
 CONFIG_MITIGATION_RETHUNK=y
 CONFIG_MITIGATION_UNRET_ENTRY=y
 CONFIG_MITIGATION_CALL_DEPTH_TRACKING=y
 CONFIG_MITIGATION_IBPB_ENTRY=y
 CONFIG_MITIGATION_IBRS_ENTRY=y
 CONFIG_MITIGATION_SRSO=y
 CONFIG_MITIGATION_SLS=y
 CONFIG_MITIGATION_GDS=y
 CONFIG_MITIGATION_RFDS=y
 CONFIG_MITIGATION_SPECTRE_BHI=y
 CONFIG_MITIGATION_MDS=y
 CONFIG_MITIGATION_TAA=y
 CONFIG_MITIGATION_MMIO_STALE_DATA=y
 CONFIG_MITIGATION_L1TF=y
 CONFIG_MITIGATION_RETBLEED=y
 CONFIG_MITIGATION_SPECTRE_V1=y
 CONFIG_MITIGATION_SPECTRE_V2=y
 CONFIG_MITIGATION_SRBDS=y
 CONFIG_MITIGATION_SSB=y

and in particular when these functions are used in blocks (as they 
often are), it looks much cleaner and more organized:

# Before:

        /* Select the proper CPU mitigations before patching alternatives: */
        spectre_v1_select_mitigation();
        spectre_v2_select_mitigation();
        retbleed_select_mitigation();
        spectre_v2_user_select_mitigation();
        ssb_select_mitigation();
        l1tf_select_mitigation();
        mds_select_mitigation();
        taa_update_mitigation();
        taa_select_mitigation();
        mmio_select_mitigation();
        rfds_select_mitigation();
        srbds_select_mitigation();
        l1d_flush_select_mitigation();
        srso_select_mitigation();
        gds_select_mitigation();
        bhi_select_mitigation();

# After:

	/* Select the proper CPU mitigations before patching alternatives: */
	mitigation_select_spectre_v1();
	mitigation_select_spectre_v2();
	mitigation_select_retbleed();
	mitigation_select_spectre_v2_user();
	mitigation_select_ssb();
	mitigation_select_l1tf();
	mitigation_select_mds();
	mitigation_update_taa();
	mitigation_select_taa();
	mitigation_select_mmio();
	mitigation_select_rfds();
	mitigation_select_srbds();
	mitigation_select_l1d_flush();
	mitigation_select_srso();
	mitigation_select_gds();
	mitigation_select_bhi();

Right?

Bonus quiz: I've snuck a subtle bug into the code sequence above. In 
which block is it easier to find visually? :-)

Thanks,

	Ingo
