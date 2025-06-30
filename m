Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8080286D7C
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 19:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751311669; cv=none; b=M7pgD7uc4ssT1AG3Zr8BF4rQsB0v4vzlzvgN0POcqSOKSjV7QEs/OVBE68cnL+4mvnwOtdErxtGRUjSwfwrIe2g8TDGymYU4OTY9gGP0Mw4maDrS/aEGYp7pShBrMOs3PAX72pM2zyFohwwnXLvztm5b3ZxON9K8ViGmBPBxMmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751311669; c=relaxed/simple;
	bh=/5v9+Oem/sa90XF+iXlgpHPKclkh5N4FEXm0lw14B2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SreZZoVi9phHHliVUplXm5yGJXJgLnziwBoQHLE04DPi6u/HsBO/T0+tJ3cwQ4uwQy8Xnj24tSFKVh82Ok6U5Maa6vxMqPHDQ8TrZ3miNVRWXOOaqS13D2iUX5rOMAs7JBK5LOaE1SfNjVcpyuR+CWIV3PrQjqPdiiSWUQwbewg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=iueSnIjU; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="iueSnIjU"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 707B940E0198;
	Mon, 30 Jun 2025 19:27:43 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id eZg4ToE6zv2C; Mon, 30 Jun 2025 19:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1751311659; bh=JwMp4PEKSVdwIntK+K5Mg38tpT3bbDtNm7jOkNtENtc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iueSnIjUt++7R3TXmOwnR2eJpVsum3n19Xw/fckJ80mL+XHaBbCoaZvtKIbQN1lWz
	 GC8itO+csVyVD41EJU9bUqTFdInUEYQ7DhtQ8ietZNZzmb/1bkTD7DZZ7hnlXhMlp6
	 5dxhltvOVLesW4hN6Qj17RJJrOJeD/pTED4ieBqMIkW/4+krQ8lz/SZa8cMwJxCajF
	 gWRTS3DKvMXZAyoLaBQYwext/hSCphgxtIGgmEeZ/lfAzoz7ZIReMIJ2G/hR3dMIhI
	 xcOVQrm0vAHAjfy5XID4BK6mOLmhWirZPVTu8RKH8R0yUUO987KJby/07qDWw6wXCM
	 OfvmXaPwH8IGOdw2Pg/blvwfycvLl3AmqfarD0X2qtFHlbRyJnn057Ie4155VxOjJq
	 T2V3BH9aLG7S9S/3vig6Wv4X/EjNGVNJgbfJQ84eeOA5wXC7FaxViNA/jtxg9rVyx4
	 YSwves7amsPRIty4/qT83huTf8cNfIOX8u30c787Gk3eMXisE1YATOUrU0JQM3nMxM
	 0e05faH3eMKvbS5h7BFWWKNuwY3pX4MieM89iHImSpCXIaLH4WfFnTYssTDeXno2iT
	 vRrr2QQP8GwKT+SldPtCEp52hKynHwkOYRKcTVjJhLzHCQO/ZD36H01wW4fUqwlDmx
	 5txIzz3VD0Vc4UWgqzyHvDQw=
Received: from zn.tnic (p57969c58.dip0.t-ipconnect.de [87.150.156.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E15A040E015E;
	Mon, 30 Jun 2025 19:27:32 +0000 (UTC)
Date: Mon, 30 Jun 2025 21:27:26 +0200
From: Borislav Petkov <bp@alien8.de>
To: kernel test robot <lkp@intel.com>
Cc: Nikunj A Dadhania <nikunj@amd.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org
Subject: Re: [tip:x86/urgent 1/1] arch/x86/coco/sev/core.c:2170:30: warning:
 variable 'dummy' set but not used
Message-ID: <20250630192726.GBaGLlHl84xIopx4Pt@fat_crate.local>
References: <202507010218.3O5Ge0Xt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202507010218.3O5Ge0Xt-lkp@intel.com>

On Tue, Jul 01, 2025 at 02:43:31AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/urgent
> head:   4a35d2b5254af89595fd90dae9ee0c8f990a148d
> commit: 4a35d2b5254af89595fd90dae9ee0c8f990a148d [1/1] x86/sev: Use TSC_FACTOR for Secure TSC frequency calculation
> config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250701/202507010218.3O5Ge0Xt-lkp@intel.com/config)
> compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)

Pff, doesn't fire with clang-19.

That damn compiler.

gcc used to complain about those but they fixed their interprocedural analysis
or whatnot.

clang is simply complaining more.

/facepalm 1

And the 0day bot - because it doesn't have anything better to do - is doing
W=1 builds. I did complain about that waste of resources in the past but
nothing happened.

/facepalm 2

> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250701/202507010218.3O5Ge0Xt-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202507010218.3O5Ge0Xt-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> arch/x86/coco/sev/core.c:2170:30: warning: variable 'dummy' set but not used [-Wunused-but-set-variable]
>     2170 |         unsigned long tsc_freq_mhz, dummy;
>          |                                     ^
>    1 warning generated.
> 
> 
> vim +/dummy +2170 arch/x86/coco/sev/core.c
> 
>   2167	
>   2168	void __init snp_secure_tsc_init(void)
>   2169	{
> > 2170		unsigned long tsc_freq_mhz, dummy;

And it is actually my damn fault because even if that dummy crap variable was
bugging me, I thought we want to "harmonize".

/facepalm 3

Which is a total nonsense because that code doesn't build in 32-bit.

So this should've stayed like this:

diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
index 47d10d9a28e9..36c167333d04 100644
--- a/arch/x86/coco/sev/core.c
+++ b/arch/x86/coco/sev/core.c
@@ -2167,8 +2167,8 @@ static unsigned long securetsc_get_tsc_khz(void)
 
 void __init snp_secure_tsc_init(void)
 {
-	unsigned long tsc_freq_mhz, dummy;
 	struct snp_secrets_page *secrets;
+	unsigned long tsc_freq_mhz;
 	void *mem;
 
 	if (!cc_platform_has(CC_ATTR_GUEST_SNP_SECURE_TSC))
@@ -2183,7 +2183,7 @@ void __init snp_secure_tsc_init(void)
 	secrets = (__force struct snp_secrets_page *)mem;
 
 	setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
-	rdmsr(MSR_AMD64_GUEST_TSC_FREQ, tsc_freq_mhz, dummy);
+	rdmsrq(MSR_AMD64_GUEST_TSC_FREQ, tsc_freq_mhz);
 	/* Extract the GUEST TSC MHZ from BIT[17:0], rest is reserved space */
 	tsc_freq_mhz = tsc_freq_mhz & GENMASK_ULL(17, 0);
 	snp_tsc_freq_khz = SNP_SCALE_TSC_FREQ(tsc_freq_mhz * 1000, secrets->tsc_factor);

What a f*cking mess. I don't have enough room on my face anymore from
facepalms.

Oh boy.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
