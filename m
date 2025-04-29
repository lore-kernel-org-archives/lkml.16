Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC90029E07D
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 10:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745923596; cv=none; b=L9mhCKmatPOD28mcBRMIDv0gjoSO0b2HufXU7b6EU8ATE185h+0L15VSbm8dAmFLfPMn/HTNkxUYATUV0J8jZLjNJUxGvVniuU+8C6+5+THSenSgLFI5HHjkbRzfF8BH6QeKxyeXZNrPcKZLpWvW5dJGnW2xx9PYR4wA1jiS9T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745923596; c=relaxed/simple;
	bh=29Vbs5Y0eAF/rGCtBtbZtgzKEpWWEjP7RGJQY4FRLVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N+xFvDg37Lba4a3VmrCp8EzqNmk0MDd7MjzZ8I1kQLRh51vPW92a0cUzjRTEE4kNNy9ldoaxRt6mx3bSnTKkuhUxjEtmTLXZWttIlnoS1mYTQcQ7qMCKwqBbvPwJPoS9Qy26qxtkIz03lyOxieFPcRFQ5XXiS1Z+XzAzCF6tH3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=QWQ4hxkV; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="QWQ4hxkV"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id A900540E0214;
	Tue, 29 Apr 2025 10:46:31 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id EVfmTzIRbtee; Tue, 29 Apr 2025 10:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1745923588; bh=hD+R/SbfPTXDMNjsQ9/Rv/rRVMj3K4Ikj7S/IDC0qoU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QWQ4hxkV8smlT3g59LQPAvO3OTqX/FklqXt78VFKCx6lFEvVsyIdZWgteye5sx3EN
	 Gza/yPUHX1S7Fi9y2Lfru86h5ZuliHZIutz4a/gWSkmyHkU99z3x8MokNT+mbgHX0q
	 n0BqIGVtVXsGNg8jJ9pXqNBenGdwh/9mpEqZR12hmvKpbHI+EbXU+L4xyLgjQ4fO7h
	 aHgVBH1cB1C39fQzDNUYrVTTIxmLyyIfe0IHxttHxpDSVoEM9rNCoAgYaXJzPX+ak9
	 /e1tIlMvUOsGXGNvWEh+xoPR3TGAiVnQVBFr6Q8GYzfjj7s5CWUS33KOi5vDnpalN3
	 77f0AKdDMZsBxo6jTCQY5VcIbfSlKSGWzaeR0eEQTIo0nfauIup54QqEYf+M6F669U
	 KeaFfODRL9k5Wh1DJ4zzf3eR2BCrUWlftS2jXuQaf+zbRu6MlY6FamxZxCJIbLzHX2
	 IjKC/IY6V8NNg/O31CIfo6eabL4djnIdAG5PKsWsCO12lmDLNAmuuuYKOKbemVWi6G
	 g6wawO9D44ZIAKsj0uyl5AL+VCqAWBBd50OYbNXsWUGM4nKce8YnrtmA9v4D/xdp/G
	 TCE63CCAxZDgC46PNzJ+p9LoQhioXE9usGqSoUaaSPsoaJiranRCc8oxRuDL9jDFhL
	 eDAYzh0rIlL2AwJ9usQ4aYgc=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id D2F1040E0173;
	Tue, 29 Apr 2025 10:46:17 +0000 (UTC)
Date: Tue, 29 Apr 2025 12:46:11 +0200
From: Borislav Petkov <bp@alien8.de>
To: David Kaplan <david.kaplan@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 13/16] x86/bugs: Restructure spectre_v2 mitigation
Message-ID: <20250429104611.GFaBCt81C5mZwdnqo_@fat_crate.local>
References: <20250418161721.1855190-1-david.kaplan@amd.com>
 <20250418161721.1855190-14-david.kaplan@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250418161721.1855190-14-david.kaplan@amd.com>

On Fri, Apr 18, 2025 at 11:17:18AM -0500, David Kaplan wrote:
>  static void __init spectre_v2_select_mitigation(void)
>  {
> -	enum spectre_v2_mitigation_cmd cmd = spectre_v2_parse_cmdline();
>  	enum spectre_v2_mitigation mode = SPECTRE_V2_NONE;
> +	spectre_v2_cmd = spectre_v2_parse_cmdline();
>  
>  	/*
>  	 * If the CPU is not affected and the command line mode is NONE or AUTO
>  	 * then nothing to do.
>  	 */

Obvious comment. Lemme zap it.

>  	if (!boot_cpu_has_bug(X86_BUG_SPECTRE_V2) &&
> -	    (cmd == SPECTRE_V2_CMD_NONE || cmd == SPECTRE_V2_CMD_AUTO))
> +	    (spectre_v2_cmd == SPECTRE_V2_CMD_NONE || spectre_v2_cmd == SPECTRE_V2_CMD_AUTO))
>  		return;
>  
> -	switch (cmd) {
> +	switch (spectre_v2_cmd) {
>  	case SPECTRE_V2_CMD_NONE:
>  		return;
>  
> @@ -1898,16 +1907,6 @@ static void __init spectre_v2_select_mitigation(void)
>  			break;
>  		}
>  
> -		if (IS_ENABLED(CONFIG_MITIGATION_IBRS_ENTRY) &&
> -		    boot_cpu_has_bug(X86_BUG_RETBLEED) &&
> -		    retbleed_mitigation != RETBLEED_MITIGATION_NONE &&
> -		    retbleed_mitigation != RETBLEED_MITIGATION_STUFF &&
> -		    boot_cpu_has(X86_FEATURE_IBRS) &&
> -		    boot_cpu_data.x86_vendor == X86_VENDOR_INTEL) {
> -			mode = SPECTRE_V2_IBRS;
> -			break;
> -		}
> -
>  		mode = spectre_v2_select_retpoline();
>  		break;
>  
> @@ -1941,10 +1940,32 @@ static void __init spectre_v2_select_mitigation(void)
>  		break;
>  	}
>  
> -	if (mode == SPECTRE_V2_EIBRS && unprivileged_ebpf_enabled())
> +	spectre_v2_enabled = mode;

Might as well zap mode here too, like for the others.

...

Diff ontop:

---

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 3b0ffebb8f4b..93d07438eea7 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -1887,13 +1887,8 @@ static void __init bhi_apply_mitigation(void)
 
 static void __init spectre_v2_select_mitigation(void)
 {
-	enum spectre_v2_mitigation mode = SPECTRE_V2_NONE;
 	spectre_v2_cmd = spectre_v2_parse_cmdline();
 
-	/*
-	 * If the CPU is not affected and the command line mode is NONE or AUTO
-	 * then nothing to do.
-	 */
 	if (!boot_cpu_has_bug(X86_BUG_SPECTRE_V2) &&
 	    (spectre_v2_cmd == SPECTRE_V2_CMD_NONE || spectre_v2_cmd == SPECTRE_V2_CMD_AUTO))
 		return;
@@ -1905,44 +1900,42 @@ static void __init spectre_v2_select_mitigation(void)
 	case SPECTRE_V2_CMD_FORCE:
 	case SPECTRE_V2_CMD_AUTO:
 		if (boot_cpu_has(X86_FEATURE_IBRS_ENHANCED)) {
-			mode = SPECTRE_V2_EIBRS;
+			spectre_v2_enabled = SPECTRE_V2_EIBRS;
 			break;
 		}
 
-		mode = spectre_v2_select_retpoline();
+		spectre_v2_enabled = spectre_v2_select_retpoline();
 		break;
 
 	case SPECTRE_V2_CMD_RETPOLINE_LFENCE:
 		pr_err(SPECTRE_V2_LFENCE_MSG);
-		mode = SPECTRE_V2_LFENCE;
+		spectre_v2_enabled = SPECTRE_V2_LFENCE;
 		break;
 
 	case SPECTRE_V2_CMD_RETPOLINE_GENERIC:
-		mode = SPECTRE_V2_RETPOLINE;
+		spectre_v2_enabled = SPECTRE_V2_RETPOLINE;
 		break;
 
 	case SPECTRE_V2_CMD_RETPOLINE:
-		mode = spectre_v2_select_retpoline();
+		spectre_v2_enabled = spectre_v2_select_retpoline();
 		break;
 
 	case SPECTRE_V2_CMD_IBRS:
-		mode = SPECTRE_V2_IBRS;
+		spectre_v2_enabled = SPECTRE_V2_IBRS;
 		break;
 
 	case SPECTRE_V2_CMD_EIBRS:
-		mode = SPECTRE_V2_EIBRS;
+		spectre_v2_enabled = SPECTRE_V2_EIBRS;
 		break;
 
 	case SPECTRE_V2_CMD_EIBRS_LFENCE:
-		mode = SPECTRE_V2_EIBRS_LFENCE;
+		spectre_v2_enabled = SPECTRE_V2_EIBRS_LFENCE;
 		break;
 
 	case SPECTRE_V2_CMD_EIBRS_RETPOLINE:
-		mode = SPECTRE_V2_EIBRS_RETPOLINE;
+		spectre_v2_enabled = SPECTRE_V2_EIBRS_RETPOLINE;
 		break;
 	}
-
-	spectre_v2_enabled = mode;
 }
 
 static void __init spectre_v2_update_mitigation(void)

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
