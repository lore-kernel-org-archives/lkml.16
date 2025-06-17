Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B840B2F2714
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 20:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750190776; cv=none; b=bVq7QmONdXQDl7QQ1Y7GNWEU/EIrInhnfS7N9Bl2TGWHZrYp+cqqxkwTsMJSEprlQAsIAHFxgH1NcCu1ZTB9KiIvlbbcm0GjByfqPpkxx0Zbn4faoC8G58R4lLUU4FE/Er/O7qDOlmSWt6NkZcILXGTDiPYFT3uzTBPIyKSn+uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750190776; c=relaxed/simple;
	bh=nxG0MN8gNOMVDZDTw/GF5IpT1tBDjSa6XvsqeaNOsRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V0DTL+ZAVMv5AvaFKD9M7U//avbJt2ftL+ZNd3ks9xZAFAyWx1Jwx48eMB5ygMx0a0ZfVUmnhPRarW9WpPs5/H6X9dxCqRzI6J+0n1v4fV0ow334hdlQZp+OvbEPcREaUfezfq6VZ6SvO/kItkFgXUllu6JirzVm0LUbAIEhp3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=NJ70yeuu; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="NJ70yeuu"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 5098140E01D6;
	Tue, 17 Jun 2025 20:06:11 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id CdwBwy_wbeSr; Tue, 17 Jun 2025 20:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1750190765; bh=XvlQhiaovgN0UX7t8GkLS4GdvYCHO1JNmYVvwUvQgTc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NJ70yeuuq82hluIe6QeArqw8ggjLztu94ilbEOtzZZwpTcpt4ZaWVXzdyfrjeAYnt
	 ufkAbW24IFdlBlkpTKJKp9Bl7MzAVfhnqt8HY41oXfqDReCwobs9nQ6ByV+BId18x4
	 eUPOTjqvMcQ0sGV+EfNPM9a4UJgXbG9bX9jumxZ22DCXcplQQC5FRiRcq974FuPa85
	 F8nWmKUXyDv5sDDKG6T6F4dZEbsvmrp+ZFnAkpNjdq7zV7VJuFPEpVbTBqECFtjh9q
	 wmtcO7IkNsSWnaem3k4GqBC90on8yOVEtdSWheauMctfts6LftuyXOLHEvJBPBdzra
	 +rkIj6HglAmV3ONhUfD5gKd2uElK+krjA+UNsBJcf2+kqn9TyRKVL0DbBGC/GmJZwP
	 hSwzy0DyIXyfP+8uyIFLk8CIgbL9/KqhemDIZWX3yAGuq67Rmq0xXt5XzRV3G6tVNB
	 N0Dl5L6Q3Vf3TQKvgJ16UYRNSLmMos7WD2u0TGFR/hw/R9jWsfNPvfVPwaqYo5IyuD
	 R9zp7uUtPcG1eBjMbi5JGlU1bd7j6SlL2rCwqXAsdTR87679gMkaUiDjdgWDdjAtGy
	 vi64cHPGyDg8FQtTaB+/Xh9J/xdYhDJC26qw7dZkRtczRH9/HjRy3mhTxlpA0fEN7z
	 mlVvxN/JgArGfg7E1KnXuguU=
Received: from zn.tnic (p57969c58.dip0.t-ipconnect.de [87.150.156.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 26E2B40E00DD;
	Tue, 17 Jun 2025 20:05:58 +0000 (UTC)
Date: Tue, 17 Jun 2025 22:05:51 +0200
From: Borislav Petkov <bp@alien8.de>
To: Mikhail Paulyshka <me@mixaill.net>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] x86/rdrand: disable RDSEED on AMD Cyan Skillfish
Message-ID: <20250617200551.GIaFHKnyPV_XsSjlMP@fat_crate.local>
References: <20250524145319.209075-1-me@mixaill.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250524145319.209075-1-me@mixaill.net>

On Sat, May 24, 2025 at 05:53:19PM +0300, Mikhail Paulyshka wrote:
> AMD Cyan Skillfish (Family 17h, Model 47h, Stepping 0h) has an
> error that causes RDSEED to always return 0xffffffff, while RDRAND
> works correctly.
> 
> This patch masks the RDSEED cap for this CPU so that both
> /proc/cpuinfo and direct CPUID read report RDSEED as unavailable.
> 
> 
> v2:
>   * Limit changes to AMD Cyan Skillfish
>   * Replace the runtime RDSEED sanity check with a simple
>     family/model/stepping match
> 
> Signed-off-by: Mikhail Paulyshka <me@mixaill.net>
> ---
>  arch/x86/include/asm/msr-index.h       | 1 +
>  arch/x86/kernel/cpu/rdrand.c           | 9 +++++++++
>  tools/arch/x86/include/asm/msr-index.h | 1 +
>  3 files changed, 11 insertions(+)

Does this one work too?

---
From: Mikhail Paulyshka <me@mixaill.net>
Date: Sat, 24 May 2025 17:53:19 +0300
Subject: [PATCH] x86/rdrand: Disable RDSEED on AMD Cyan Skillfish

AMD Cyan Skillfish (Family 17h, Model 47h, Stepping 0h) has an error that
causes RDSEED to always return 0xffffffff, while RDRAND works correctly.

Mask the RDSEED cap for this CPU so that both /proc/cpuinfo and direct CPUID
read report RDSEED as unavailable.

  [ bp: Move to amd.c, massage. ]

Signed-off-by: Mikhail Paulyshka <me@mixaill.net>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Link: https://lore.kernel.org/20250524145319.209075-1-me@mixaill.net
---
 arch/x86/include/asm/msr-index.h       | 1 +
 arch/x86/kernel/cpu/amd.c              | 7 +++++++
 tools/arch/x86/include/asm/msr-index.h | 1 +
 3 files changed, 9 insertions(+)

diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
index b7dded3c8113..5cfb5d74dd5f 100644
--- a/arch/x86/include/asm/msr-index.h
+++ b/arch/x86/include/asm/msr-index.h
@@ -628,6 +628,7 @@
 #define MSR_AMD64_OSVW_STATUS		0xc0010141
 #define MSR_AMD_PPIN_CTL		0xc00102f0
 #define MSR_AMD_PPIN			0xc00102f1
+#define MSR_AMD64_CPUID_FN_7		0xc0011002
 #define MSR_AMD64_CPUID_FN_1		0xc0011004
 #define MSR_AMD64_LS_CFG		0xc0011020
 #define MSR_AMD64_DC_CFG		0xc0011022
diff --git a/arch/x86/kernel/cpu/amd.c b/arch/x86/kernel/cpu/amd.c
index 93da466dfe2c..c2ef5ab4a9e3 100644
--- a/arch/x86/kernel/cpu/amd.c
+++ b/arch/x86/kernel/cpu/amd.c
@@ -930,6 +930,13 @@ static void init_amd_zen2(struct cpuinfo_x86 *c)
 	init_spectral_chicken(c);
 	fix_erratum_1386(c);
 	zen2_zenbleed_check(c);
+
+	/* Disable RDSEED on AMD Cyan Skillfish because of an error. */
+	if (c->x86_model == 0x47 && c->x86_stepping == 0x0) {
+		clear_cpu_cap(c, X86_FEATURE_RDSEED);
+		msr_clear_bit(MSR_AMD64_CPUID_FN_7, 18);
+		pr_emerg("RDSEED is not reliable on this platform; disabling.\n");
+	}
 }
 
 static void init_amd_zen3(struct cpuinfo_x86 *c)
diff --git a/tools/arch/x86/include/asm/msr-index.h b/tools/arch/x86/include/asm/msr-index.h
index e7d2f460fcc6..2333f4e7bc2f 100644
--- a/tools/arch/x86/include/asm/msr-index.h
+++ b/tools/arch/x86/include/asm/msr-index.h
@@ -624,6 +624,7 @@
 #define MSR_AMD64_OSVW_STATUS		0xc0010141
 #define MSR_AMD_PPIN_CTL		0xc00102f0
 #define MSR_AMD_PPIN			0xc00102f1
+#define MSR_AMD64_CPUID_FN_7		0xc0011002
 #define MSR_AMD64_CPUID_FN_1		0xc0011004
 #define MSR_AMD64_LS_CFG		0xc0011020
 #define MSR_AMD64_DC_CFG		0xc0011022
-- 
2.43.0

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
