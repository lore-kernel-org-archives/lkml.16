Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBC91C3306
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 20:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745008989; cv=none; b=JFa7ykOkMygv7CGz/Ek8Y2REzUyUDfSWjKt8GtBx53MB2PlhQGQZaG0nOyVU5oeQdpL531bXLAGlA/x1/Hq/WpWPIvRAyDVmrKvdK2UdpzlylNZSGhRHaFByAb8bZ4TLvGl67X09duTeorAG2aLJzf9/ULuGBZbc49wohIX0pbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745008989; c=relaxed/simple;
	bh=nknmS7BbFDrg1VHsraKVwkPlsSvV5+J3oBwezNgDbdM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NaHngK2Zlu0T2iQ944MRRwFmvOQ5xxsxJiYxee8nUQft/p9ahC3qZYvNMSP0GPD+7yf6E8BLkc2hQckahG+CMz4PSRTn7qR64USYTTlbyuMmlY9S2Ekp6dnBNa05DMpXjLL2oW773AE02a6NIVtMrz9YYlA7sM97F1ec9PB4AKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=abwq1qFE; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="abwq1qFE"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id BA01340E023A;
	Fri, 18 Apr 2025 20:43:03 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id aqsiljVAmu_m; Fri, 18 Apr 2025 20:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1745008979; bh=TcRfF53/AMHXfcLsbhzBQfFtuxu3Hip3AlkA81OCUCo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=abwq1qFEo5SGimXmBLZXkbJN1zvUcHteptSjdQJNduydfwFGAChOrB3HqrSTNWvpf
	 +t8RR9Txf1BkcYZ+uV4jBhTb1+O9RJ5GPT3rM+l+QZHeOcVmjG9KsObtZd6hkvcKZf
	 uRqZ5kYpx9HQoVUbuUss3pWFj16TAEDIfJFBNL02x3JoXkxWmyjaM47B+XZ5fYTIyK
	 FFUA8gRSpXygxaHls8rBLwuPebHHOHPIGwxFqOWTZYIbcTWOtuz4S3BXFMfbld1bPx
	 KVRT2bJzJVSsrEnaXt7LcCJG6pOARfGMhLvngJQ2laFXmTrxuBzdM+5fIhb85Zvaoj
	 eJkuafHbmzTkoS6Jjpz3lYU2N8dZbfh/48jIgOoqqvbojiQTCVY/gyQF/MsvA+ojcu
	 16deypRS0uf3blGyoY2lTWynO4+nxyol82j9SWt7SzHaJM3eKggvsQGmTs7nupsdb5
	 W/VcKYmC8Wvq1j20ih6t4lLKVoLvVtVq5+CLFL3DhD1BfkS30579qptdbJdQyld9Vo
	 rN4Cx28IUBnoH/n4bjeGjAUg/Ue1F/ZIT1XIsPD225NZU+/0IcGtdviRLKEBf7dy8E
	 fzpz2xG5V6jSVq3OJbbbM9wfXyZeM61j8ap1liI4O00U+yp+deEuB5QuCNfiwsPKOr
	 tsp1L3o2POl0VmYbi18fej/w=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id AC9FC40E0200;
	Fri, 18 Apr 2025 20:42:49 +0000 (UTC)
Date: Fri, 18 Apr 2025 22:42:43 +0200
From: Borislav Petkov <bp@alien8.de>
To: David Kaplan <david.kaplan@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 01/16] x86/bugs: Restructure MDS mitigation
Message-ID: <20250418204243.GQaAK5Q807BYWlABKV@fat_crate.local>
References: <20250418161721.1855190-1-david.kaplan@amd.com>
 <20250418161721.1855190-2-david.kaplan@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250418161721.1855190-2-david.kaplan@amd.com>

On Fri, Apr 18, 2025 at 11:17:06AM -0500, David Kaplan wrote:
> @@ -284,6 +314,9 @@ enum rfds_mitigations {
>  static enum rfds_mitigations rfds_mitigation __ro_after_init =
>  	IS_ENABLED(CONFIG_MITIGATION_RFDS) ? RFDS_MITIGATION_AUTO : RFDS_MITIGATION_OFF;
>  
> +/* Set if any of MDS/TAA/MMIO/RFDS are going to enable VERW. */
> +static bool verw_mitigation_selected __ro_after_init;
> +

Yeah, pls pull that one up - see diff at the end.

>  static void __init mds_select_mitigation(void)
>  {
>  	if (!boot_cpu_has_bug(X86_BUG_MDS) || cpu_mitigations_off()) {
> @@ -294,12 +327,34 @@ static void __init mds_select_mitigation(void)
>  	if (mds_mitigation == MDS_MITIGATION_AUTO)
>  		mds_mitigation = MDS_MITIGATION_FULL;
>  
> +	if (mds_mitigation == MDS_MITIGATION_OFF)
> +		return;
> +
> +	verw_mitigation_selected = true;
> +}
> +
> +static void __init mds_update_mitigation(void)
> +{
> +	if (!boot_cpu_has_bug(X86_BUG_MDS) || cpu_mitigations_off())
> +		return;

Can we simply do

        if (mds_mitigation == MDS_MITIGATION_OFF)
                return;

here?

We already checked the X86_BUG and cpu_mitigations_off() in the select
function.

> +
> +	/* If TAA, MMIO, or RFDS are being mitigated, MDS gets mitigated too. */

A version of that comment is already over verw_mitigation_selected's
definition.

> +	if (verw_mitigation_selected)
> +		mds_mitigation = MDS_MITIGATION_FULL;

So we have this here now:

        if (mds_mitigation == MDS_MITIGATION_OFF)
                return;
                
        if (verw_mitigation_selected)
                mds_mitigation = MDS_MITIGATION_FULL;

or what you have:

	if (!boot_cpu_has_bug(X86_BUG_MDS) || cpu_mitigations_off())
		return;

	/* If TAA, MMIO, or RFDS are being mitigated, MDS gets mitigated too. */
	if (verw_mitigation_selected)
		mds_mitigation = MDS_MITIGATION_FULL;



Now, if the CPU is not affected by MDS, this second branch won't ever get set
because we will return earlier.

Which then means that "If TAA, MMIO, or RFDS are being mitigated, MDS gets
mitigated too" is not really true.

IOW, I'm wondering if this would be the more fitting order:

static void __init mds_update_mitigation(void)
{
        if (verw_mitigation_selected)
                mds_mitigation = MDS_MITIGATION_FULL;

        if (mds_mitigation == MDS_MITIGATION_OFF)
                return;

I.e., if *any* mitigation did set verw_mitigation_selected, even if the CPU is
not affected by MDS, it must set mds_mitigation to FULL too.

Hmmm?

---

All of the changes ontop:

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 4295502ea082..61b9aaea8d09 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -87,6 +87,9 @@ static DEFINE_MUTEX(spec_ctrl_mutex);
 
 void (*x86_return_thunk)(void) __ro_after_init = __x86_return_thunk;
 
+/* Set if any of MDS/TAA/MMIO/RFDS are going to enable VERW. */
+static bool verw_mitigation_selected __ro_after_init;
+
 /* Update SPEC_CTRL MSR and its cached copy unconditionally */
 static void update_spec_ctrl(u64 val)
 {
@@ -314,9 +317,6 @@ enum rfds_mitigations {
 static enum rfds_mitigations rfds_mitigation __ro_after_init =
 	IS_ENABLED(CONFIG_MITIGATION_RFDS) ? RFDS_MITIGATION_AUTO : RFDS_MITIGATION_OFF;
 
-/* Set if any of MDS/TAA/MMIO/RFDS are going to enable VERW. */
-static bool verw_mitigation_selected __ro_after_init;
-
 static void __init mds_select_mitigation(void)
 {
 	if (!boot_cpu_has_bug(X86_BUG_MDS) || cpu_mitigations_off()) {
@@ -324,24 +324,23 @@ static void __init mds_select_mitigation(void)
 		return;
 	}
 
-	if (mds_mitigation == MDS_MITIGATION_AUTO)
-		mds_mitigation = MDS_MITIGATION_FULL;
-
 	if (mds_mitigation == MDS_MITIGATION_OFF)
 		return;
 
+	if (mds_mitigation == MDS_MITIGATION_AUTO)
+		mds_mitigation = MDS_MITIGATION_FULL;
+
 	verw_mitigation_selected = true;
 }
 
 static void __init mds_update_mitigation(void)
 {
-	if (!boot_cpu_has_bug(X86_BUG_MDS) || cpu_mitigations_off())
-		return;
-
-	/* If TAA, MMIO, or RFDS are being mitigated, MDS gets mitigated too. */
 	if (verw_mitigation_selected)
 		mds_mitigation = MDS_MITIGATION_FULL;
 
+	if (mds_mitigation == MDS_MITIGATION_OFF)
+		return;
+
 	if (mds_mitigation == MDS_MITIGATION_FULL) {
 		if (!boot_cpu_has(X86_FEATURE_MD_CLEAR))
 			mds_mitigation = MDS_MITIGATION_VMWERV;

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
