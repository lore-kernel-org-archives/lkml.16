Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1462A1F098A
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 09:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745315199; cv=none; b=azvqpmc9pv5FxhuGu4CbxVadCT2+NaKtsLoj7uBhEp4ap2VFIY+f1z1Nf1EQQ009X68jmEhL+b+BISUNEqDRo1FHPq9CKBeaiMQUmndBtHgOyGgdLgTSvjop8kPyGgLNhxtCFGl0w5HXi/Bsu+lRvZ5MtDB4GJ2ivjOjUeuNuHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745315199; c=relaxed/simple;
	bh=i6+35yRKfL6Lxl7buLXu60bziYBpsB445n1R9LO+zEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tt7KJPMEDPLNfEhlQtkQkUuXlAL1VuJi1gssybVaLU7gVIvO+AtlQphuTQHC7DUVrED1upnVlqO29DcW1H6A9gUjanXlcXO/CYvHkpqxD8BTVLLs0+eL0+BhW9qQFHp6n4A6UrclnRGVot0tD/erDhd3Oll+9HLh7n0nBK+TC/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h2KVMWvE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h2KVMWvE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67F7BC4CEEA;
	Tue, 22 Apr 2025 09:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745315198;
	bh=i6+35yRKfL6Lxl7buLXu60bziYBpsB445n1R9LO+zEw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h2KVMWvEY9vOTX6LTAg0NhJZZtDpVd+9mk+dUmcC1aQD2Ogt8hVKGP46nMdviKl/d
	 1dJcKsyLBhKGovJbn5n7UcAE/G4XdQ+YlhgV6fQDTU7mv4hAgNwOQG/6OtWudWKg+T
	 3x2b9tiQSJ4cy356MRLlhtgcGH/A1o+GHNft4wYsVIKZjNqql/fAh/GMKHTwFyhB+7
	 HjSdlOb4Yuf+ISvTdHlhQ0AIn/vw0xumoljrEbZY2yXOW9Da6MaivO/KfHGW7u6g0B
	 SKz52HxP7gkyfvuvILzUeJqrVoG1wnqGS1mMdvrH90zaN8qc1TjhrdvER0I70exsLM
	 wLhczsdLaK9Ow==
Date: Tue, 22 Apr 2025 11:46:33 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: David Kaplan <david.kaplan@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 00/16] Attack vector controls (part 1)
Message-ID: <aAdlefbyU_oqOVIg@gmail.com>
References: <20250418161721.1855190-1-david.kaplan@amd.com>
 <aAKwHvLTDfyM2UfS@gmail.com>
 <20250418213336.GIaALFMKSwKKGw7tTd@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418213336.GIaALFMKSwKKGw7tTd@fat_crate.local>


* Borislav Petkov <bp@alien8.de> wrote:

> On Fri, Apr 18, 2025 at 10:03:42PM +0200, Ingo Molnar wrote:
> > 	/* Select the proper CPU mitigations before patching alternatives: */
> > 	mitigation_select_spectre_v1();
> > 	mitigation_select_spectre_v2();
> > 	mitigation_select_retbleed();
> > 	mitigation_select_spectre_v2_user();
> > 	mitigation_select_ssb();
> > 	mitigation_select_l1tf();
> > 	mitigation_select_mds();
> > 	mitigation_update_taa();
> > 	mitigation_select_taa();
> > 	mitigation_select_mmio();
> > 	mitigation_select_rfds();
> > 	mitigation_select_srbds();
> > 	mitigation_select_l1d_flush();
> > 	mitigation_select_srso();
> > 	mitigation_select_gds();
> > 	mitigation_select_bhi();
> 
> The bad side of that is that you have a whole set of letters
> - "mitigation_select" - before the *actual* name which is the only thing one
> is interested in. With the vectors, one is now interested in the operation too
> - select, update or apply.

I have three counter-arguments:

1)

The above pattern is not a big problem really, as the human brain has 
no trouble ignoring well-structured syntactic repetitions on the left 
side and will focus on the right side column.

Unlike the current status quo, which your reply didn't quote, so I'll 
quote it again:

 static void __init spectre_v1_select_mitigation(void);
 static void __init spectre_v2_select_mitigation(void);
 static void __init retbleed_select_mitigation(void);
 static void __init spectre_v2_user_select_mitigation(void);
 static void __init ssb_select_mitigation(void);
 static void __init l1tf_select_mitigation(void);
 static void __init mds_select_mitigation(void);
 static void __init md_clear_update_mitigation(void);
 static void __init md_clear_select_mitigation(void);
 static void __init taa_select_mitigation(void);
 static void __init mmio_select_mitigation(void);
 static void __init srbds_select_mitigation(void);
 static void __init l1d_flush_select_mitigation(void);
 static void __init srso_select_mitigation(void);
 static void __init gds_select_mitigation(void);

Which is far more visually messy.

2)

As to shortening the function names to reduce (but not eliminate ...) 
the mess:

That extra mitigation_ prefix or _mitigation postfix might sound like 
repetitious when used in mass-calls like above - but it's really useful 
when reading the actual definitions:

> Short, sweet,

... there's such a thing as too short, too sweet, too ambiguous, which 
is why we ended up with the current name of gds_select_mitigation() et 
al to begin with.

But let's see an example. Consider:

	static void __init gds_select(void)
	{
		u64 mcu_ctrl;

What do I select? Some GDS detail? Or the main mitigation itself? 
Nothing really tells me.

While with:

	static void __init mitigation_select_gds(void)
	{
		u64 mcu_ctrl;

It's immediately clear that this is the main function that selects the 
GDS mitigation.

3)

A proper namespace also makes it *much* easier to grep for specific 
primitives.

With your suggested 'gds_select()' naming, if I want to search for all 
gds_ primitives, I get:

	starship:~/tip> git grep gds_ arch/x86/kernel/cpu/bugs.c

	arch/x86/kernel/cpu/bugs.c:static void __init gds_select_mitigation(void);
	arch/x86/kernel/cpu/bugs.c:	gds_select_mitigation();
	arch/x86/kernel/cpu/bugs.c:enum gds_mitigations {
	arch/x86/kernel/cpu/bugs.c:static enum gds_mitigations gds_mitigation __ro_after_init =
	arch/x86/kernel/cpu/bugs.c:static const char * const gds_strings[] = {
	arch/x86/kernel/cpu/bugs.c:bool gds_ucode_mitigated(void)
	arch/x86/kernel/cpu/bugs.c:	return (gds_mitigation == GDS_MITIGATION_FULL ||
	arch/x86/kernel/cpu/bugs.c:		gds_mitigation == GDS_MITIGATION_FULL_LOCKED);
	arch/x86/kernel/cpu/bugs.c:EXPORT_SYMBOL_GPL(gds_ucode_mitigated);
	arch/x86/kernel/cpu/bugs.c:void update_gds_msr(void)
	arch/x86/kernel/cpu/bugs.c:	switch (gds_mitigation) {
	arch/x86/kernel/cpu/bugs.c:static void __init gds_select_mitigation(void)
	arch/x86/kernel/cpu/bugs.c:		gds_mitigation = GDS_MITIGATION_HYPERVISOR;
	arch/x86/kernel/cpu/bugs.c:		gds_mitigation = GDS_MITIGATION_OFF;
	arch/x86/kernel/cpu/bugs.c:		if (gds_mitigation == GDS_MITIGATION_FORCE) {
	arch/x86/kernel/cpu/bugs.c:			 * here rather than in update_gds_msr()
	arch/x86/kernel/cpu/bugs.c:			gds_mitigation = GDS_MITIGATION_UCODE_NEEDED;
	arch/x86/kernel/cpu/bugs.c:	if (gds_mitigation == GDS_MITIGATION_FORCE)
	arch/x86/kernel/cpu/bugs.c:		gds_mitigation = GDS_MITIGATION_FULL;
	arch/x86/kernel/cpu/bugs.c:		if (gds_mitigation == GDS_MITIGATION_OFF)
	arch/x86/kernel/cpu/bugs.c:		 * but others are then update_gds_msr() will WARN() of the state
	arch/x86/kernel/cpu/bugs.c:		 * mismatch. If the boot CPU is locked update_gds_msr() will
	arch/x86/kernel/cpu/bugs.c:		gds_mitigation = GDS_MITIGATION_FULL_LOCKED;
	arch/x86/kernel/cpu/bugs.c:	update_gds_msr();
	arch/x86/kernel/cpu/bugs.c:	pr_info("%s\n", gds_strings[gds_mitigation]);
	arch/x86/kernel/cpu/bugs.c:static int __init gds_parse_cmdline(char *str)
	arch/x86/kernel/cpu/bugs.c:		gds_mitigation = GDS_MITIGATION_OFF;
	arch/x86/kernel/cpu/bugs.c:		gds_mitigation = GDS_MITIGATION_FORCE;
	arch/x86/kernel/cpu/bugs.c:early_param("gather_data_sampling", gds_parse_cmdline);
	arch/x86/kernel/cpu/bugs.c:static ssize_t gds_show_state(char *buf)
	arch/x86/kernel/cpu/bugs.c:	return sysfs_emit(buf, "%s\n", gds_strings[gds_mitigation]);
	arch/x86/kernel/cpu/bugs.c:		return gds_show_state(buf);

Or, if I limit this to function calls only:

	arch/x86/kernel/cpu/bugs.c:static void __init gds_select_mitigation(void);
	arch/x86/kernel/cpu/bugs.c:	gds_select_mitigation();
	arch/x86/kernel/cpu/bugs.c:bool gds_ucode_mitigated(void)
	arch/x86/kernel/cpu/bugs.c:void update_gds_msr(void)
	arch/x86/kernel/cpu/bugs.c:static void __init gds_select_mitigation(void)
	arch/x86/kernel/cpu/bugs.c:			 * here rather than in update_gds_msr()
	arch/x86/kernel/cpu/bugs.c:		 * but others are then update_gds_msr() will WARN() of the state
	arch/x86/kernel/cpu/bugs.c:		 * mismatch. If the boot CPU is locked update_gds_msr() will
	arch/x86/kernel/cpu/bugs.c:	update_gds_msr();
	arch/x86/kernel/cpu/bugs.c:static int __init gds_parse_cmdline(char *str)
	arch/x86/kernel/cpu/bugs.c:static ssize_t gds_show_state(char *buf)
	arch/x86/kernel/cpu/bugs.c:		return gds_show_state(buf);

Versus a targeted, obvious, untuitive search for all mitigation_ 
functions related to GDS:

	starship:~/tip> git grep -E 'mitigation_.*_gds' arch/x86/kernel/cpu/bugs.c 

	arch/x86/kernel/cpu/bugs.c:static void __init mitigation_select_gds(void);
	arch/x86/kernel/cpu/bugs.c:     mitigation_select_gds();
	arch/x86/kernel/cpu/bugs.c:static void __init mitigation_select_gds(void)

Because a proper namespace is a far more easier to search.

Hierarchical lexicographic organization of function names is basically 
a code organization 101 concept, and I didn't think it would be 
particularly controversial. :-)

Thanks,

	Ingo
