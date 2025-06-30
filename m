Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014DA28982E
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 12:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751287269; cv=none; b=pvZstCePlGiqxMQKshVwm5BKr2A84+1M1R2Go0YjRiHwmeu9tdWuerYN4g30xgDGHuTE/c4kHKKzwqzEuOLylw05ECrc6OtcY3NpwaAft3MxOJo6i02RejSxV28QUA+zijmP3WDO6zSLoBkkat09ELk6wB6qpZKy4ey3o5zHUWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751287269; c=relaxed/simple;
	bh=B6n6w2gQ711jKzVaiI7qXcGx1qqLrRwBWVKjiG2AFSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rjJhQakkSSdutxrbiw5wBlduSiA0gClftrm5Lbb7Y1jNX2dnAw05xAU7hk0YlNdPA1SpMFTjgvfP0GhINNjnPxo4jxVL74BQsU8wsdsORztAFTxQBSM3DhkI+LvJ/KRo9l7surf76yWbL9RFv8PmkXElfQSKmWJ4jaghy3DdM0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=M0x4Q5tn; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="M0x4Q5tn"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id DD84940E00DD;
	Mon, 30 Jun 2025 12:41:01 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id sLr0bVzyS3c3; Mon, 30 Jun 2025 12:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1751287255; bh=qUznKdvuceQ1mqOavakZXMExqv94bo/QDurRQ3PrqUc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M0x4Q5tnuA4mqyRjCuyCM/faoZig5hLkV6ZSz5g8i+xWQX0Am/0l5jEBose8U3nXR
	 08G8rbo4oLyypWEH7g1KbmVHHrvwpvyMf0D9Hl9y3ru5Wq1xPVrsJbXOpVHv8eNWaT
	 ElnnNMskA/JsA8eyP2ics1QNoDKFP53a9Z0dTQhIebe322yO0hxvyo1Qz9eiOOjV4v
	 OoGkiGg81TDk3Dox/UmSPlPffkJN2KBHs7v80W/D0y3CiOagWsqwk4muRJxThSqkTE
	 2Rzv3/n7VLf9+ifi5Ust9uS2LUvdigFevjihw6aayw9AoIyd4R4QbVL0TIxkpoCmte
	 mg+f1HtexFmH2V8nXjTIQokR6Lww/bLqvcNLrzo4WicqWNVoGcVHXAkiWGy2DTOqjn
	 4JIsipMf/O2Ldg+h9vmWbaHn0DWiafpSbrwY0DslfRujaTkegYFl4m8RkpCdpfqSwW
	 4E9FZlQrO19VW4vhzmWlhqpxQzJLOXmDkDSRJ/vJGySeh84uBvKPQ4UVTOpcmaenXy
	 b9yD2PLZHGWrj0EzRZwjCZZCT2o+sivvQWkCxziu0cW2HhJlTpovH9Hk9fNQnEzTBx
	 sBU3b/+rHimTMWFZtFLSE8PV93AWqjaXXxnU2G6K8KR3O4LyI4AoB0hd12HaMCNiax
	 oWEmqECQY123hlCSRfDUjrqI=
Received: from zn.tnic (p57969c58.dip0.t-ipconnect.de [87.150.156.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id F24E540E01FC;
	Mon, 30 Jun 2025 12:40:44 +0000 (UTC)
Date: Mon, 30 Jun 2025 14:40:38 +0200
From: Borislav Petkov <bp@alien8.de>
To: David Kaplan <david.kaplan@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 14/20] x86/bugs: Add attack vector controls for BHI
Message-ID: <20250630124038.GFaGKFxtAiYEBUAFRy@fat_crate.local>
References: <20250509162839.3057217-1-david.kaplan@amd.com>
 <20250509162839.3057217-15-david.kaplan@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250509162839.3057217-15-david.kaplan@amd.com>

On Fri, May 09, 2025 at 11:28:33AM -0500, David Kaplan wrote:
> There are two BHI mitigations, one for SYSCALL and one for VMEXIT.
> Split these up so they can be selected individually based on attack
> vector.
> 
> Signed-off-by: David Kaplan <david.kaplan@amd.com>
> ---
>  arch/x86/kernel/cpu/bugs.c | 38 +++++++++++++++++++++++++++-----------
>  1 file changed, 27 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
> index 305a11fa9521..667385808400 100644
> --- a/arch/x86/kernel/cpu/bugs.c
> +++ b/arch/x86/kernel/cpu/bugs.c
> @@ -1905,8 +1905,9 @@ static bool __init spec_ctrl_bhi_dis(void)
>  enum bhi_mitigations {
>  	BHI_MITIGATION_OFF,
>  	BHI_MITIGATION_AUTO,
> -	BHI_MITIGATION_ON,
> +	BHI_MITIGATION_FULL,
>  	BHI_MITIGATION_VMEXIT_ONLY,
> +	BHI_MITIGATION_SYSCALL_ONLY

We usually call those USER_KERNEL or so...

But I don't think you need it. The rename to _FULL is ok but the rest could
look like this:

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 32edf0b8a495..624d8d766dca 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -2096,7 +2096,7 @@ static bool __init spec_ctrl_bhi_dis(void)
 enum bhi_mitigations {
 	BHI_MITIGATION_OFF,
 	BHI_MITIGATION_AUTO,
-	BHI_MITIGATION_ON,
+	BHI_MITIGATION_FULL,
 	BHI_MITIGATION_VMEXIT_ONLY,
 };
 
@@ -2111,7 +2111,7 @@ static int __init spectre_bhi_parse_cmdline(char *str)
 	if (!strcmp(str, "off"))
 		bhi_mitigation = BHI_MITIGATION_OFF;
 	else if (!strcmp(str, "on"))
-		bhi_mitigation = BHI_MITIGATION_ON;
+		bhi_mitigation = BHI_MITIGATION_FULL;
 	else if (!strcmp(str, "vmexit"))
 		bhi_mitigation = BHI_MITIGATION_VMEXIT_ONLY;
 	else
@@ -2123,11 +2123,11 @@ early_param("spectre_bhi", spectre_bhi_parse_cmdline);
 
 static void __init bhi_select_mitigation(void)
 {
-	if (!boot_cpu_has(X86_BUG_BHI) || cpu_mitigations_off())
+	if (!boot_cpu_has(X86_BUG_BHI))
 		bhi_mitigation = BHI_MITIGATION_OFF;
 
 	if (bhi_mitigation == BHI_MITIGATION_AUTO)
-		bhi_mitigation = BHI_MITIGATION_ON;
+		bhi_mitigation = BHI_MITIGATION_FULL;
 }
 
 static void __init bhi_update_mitigation(void)
@@ -2160,15 +2160,19 @@ static void __init bhi_apply_mitigation(void)
 	if (spec_ctrl_bhi_dis())
 		return;
 
-	if (bhi_mitigation == BHI_MITIGATION_VMEXIT_ONLY) {
-		pr_info("Spectre BHI mitigation: SW BHB clearing on VM exit only\n");
+	/* Mitigate KVM if guest->host protection is desired */
+	if (bhi_mitigation == BHI_MITIGATION_FULL ||
+	    bhi_mitigation == BHI_MITIGATION_VMEXIT_ONLY) {
 		setup_force_cpu_cap(X86_FEATURE_CLEAR_BHB_VMEXIT);
-		return;
+		pr_info("Spectre BHI mitigation: SW BHB clearing on VM exit\n");
 	}
 
-	pr_info("Spectre BHI mitigation: SW BHB clearing on syscall and VM exit\n");
-	setup_force_cpu_cap(X86_FEATURE_CLEAR_BHB_LOOP);
-	setup_force_cpu_cap(X86_FEATURE_CLEAR_BHB_VMEXIT);
+	/* Mitigate syscalls if user->kernel protection is desired */
+	if (bhi_mitigation == BHI_MITIGATION_FULL ||
+	    cpu_attack_vector_mitigated(CPU_MITIGATE_USER_KERNEL)) {
+		setup_force_cpu_cap(X86_FEATURE_CLEAR_BHB_LOOP);
+		pr_info("Spectre BHI mitigation: SW BHB clearing on syscall\n");
+	}
 }
 
 static void __init spectre_v2_select_mitigation(void)

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
