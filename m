Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1A4143C5D
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 15:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745766514; cv=none; b=ncwUuQrJvN5Ox3PZC1XdrSyLR23nfy4x/9ON4oSNp/z8W67Zz4dtaLDmb4Pztd/Xe2KwQ4Rr/ivbORnvrVlgkJl/qf8t3Q7X/tiAz1t4ZGb8bumn7oQCu33J6VxAb8yyiMkB+p9bn4bea+SwvF6Dov2fqK8kQEIS0jmNC957qyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745766514; c=relaxed/simple;
	bh=MHBvij10nNzO+rqusVyrgIx9GF+nGIkjyjaycWLq3Vk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZbFY2UZ1u+W910RthVdUdLAyGilcYYliD5Jsb9NTIIzcTYA2yuh/ziPi7Jz6sir6Ml/VQqboUroGzbsPAitdt1o/FN+hc0Bq3V1FjTdhpjmmEaoUDadh/lnx6HW33V0pYiNaEEAy8utg/82c0ZJ2V553o8VqIogiukabLoPM6VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=AG3RFH8W; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="AG3RFH8W"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 0B10D40E01DA;
	Sun, 27 Apr 2025 15:08:21 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 0EA-oVhjCYgP; Sun, 27 Apr 2025 15:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1745766495; bh=H1J8AtcECk6XsjUI+sew8jrQhjJ2IxlGG7IYis+lyCg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AG3RFH8WMh9MQ2jyfipDN3EBieB8qx/5cRLZxXMdqPm1EiRGrxnmBi7cscVUuoGpE
	 zKBVw0o6YcW2HhLEBQwymy5L4xYODb7xpTO75Xfur/zQ8oopZ2DZRBpj5D+w3x6Vy8
	 giBv9w2ByXvl31lFY8QoTeeeJiEdPoCLb1Em5Oey3ClvDkm2+eNKJwKOn+c3RC1tnF
	 htsbDXmgM9Q15/+74BXFHhN+wmMQ6TL+vBrcwazjYMo+vzD6fDzdtKFu5spcn/IVEJ
	 N+U+Ldp5gAp+O8zjuD/HYQIKKyBvS0UIhTrc/EXGZpuBtlLeb8MDyLTk4xo2RiuLzh
	 k24jgH8EKcudW9OaHVR87uAbxQFYwKXSRhlqfWJoCePQPYH4MGD2rvIqU2eFiXWgK5
	 98NrGyv3LCLT+ryHWjf3wFTFdg8cnnkjrOMl9BSuOdfPmgtYTmyH9Uy4PO8KUe48ws
	 CalHNTx5kx3YvSS7SeLsP1xAKg7CWn2Yp5/tnd6Tl/xhU4JpIW2C48GpyrSHwRWVXI
	 rk1hZskT1b49gCzatcjFUFyHN70+UfIrwGP2YA53scd76UrVzrvYjS1G14OM3E4B5t
	 PmQJ9RzIt9LowZ5GhCj0DxnmY6T8HUT+lAORqfMqo3s8sKWMwXk0a37oq9hiWT8qfx
	 yBCDqJat1q0DcHREljmgKEqw=
Received: from rn.tnic (unknown [IPv6:2a02:3038:263:e72f:8736:46f5:3e28:41ad])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 1094740E015D;
	Sun, 27 Apr 2025 15:08:05 +0000 (UTC)
Date: Sun, 27 Apr 2025 17:09:03 +0200
From: Borislav Petkov <bp@alien8.de>
To: David Kaplan <david.kaplan@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 04/16] x86/bugs: Restructure RFDS mitigation
Message-ID: <20250427150903.GAaA5Ij3L6IHenvlMF@renoirsky.local>
References: <20250418161721.1855190-1-david.kaplan@amd.com>
 <20250418161721.1855190-5-david.kaplan@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250418161721.1855190-5-david.kaplan@amd.com>

On Fri, Apr 18, 2025 at 11:17:09AM -0500, David Kaplan wrote:
> +static bool __init rfds_has_ucode(void)
> +{
> +	return (x86_arch_cap_msr & ARCH_CAP_RFDS_CLEAR);
> +}

Might as well call it what the bit means and then the code reads a bit better:

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index e668ccccd8c7..2705105d9a5e 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -630,7 +630,7 @@ static const char * const rfds_strings[] = {
 	[RFDS_MITIGATION_UCODE_NEEDED]		= "Vulnerable: No microcode",
 };
 
-static bool __init rfds_has_ucode(void)
+static inline bool __init verw_clears_cpu_reg_file(void)
 {
 	return (x86_arch_cap_msr & ARCH_CAP_RFDS_CLEAR);
 }
@@ -648,7 +648,7 @@ static void __init rfds_select_mitigation(void)
 	if (rfds_mitigation == RFDS_MITIGATION_OFF)
 		return;
 
-	if (rfds_has_ucode())
+	if (verw_clears_cpu_reg_file())
 		verw_clear_cpu_buf_mitigation_selected = true;
 }
 
@@ -661,7 +661,7 @@ static void __init rfds_update_mitigation(void)
 		rfds_mitigation = RFDS_MITIGATION_VERW;
 
 	if (rfds_mitigation == RFDS_MITIGATION_VERW) {
-		if (!rfds_has_ucode())
+		if (!verw_clears_cpu_reg_file())
 			rfds_mitigation = RFDS_MITIGATION_UCODE_NEEDED;
 	}
 

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
