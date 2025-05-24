Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1616A18DF80
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 11:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748086069; cv=none; b=gU+GJkvSWEamQdJodjmYGlu/XnTyOZe6po3jBb2I+mROLXPXnPH9A8AXkAyBnALJQW0JCfikXhaT7nAY72XkOPJzvGh5I5XTrrh2FX2OHNvfyRybuttXRiysIMej1aWua7WxC0FXGk7RWp5MfxcefFQyf3AMnPqnRDOxVC0ZQoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748086069; c=relaxed/simple;
	bh=QlrPkFL2kFJeGG/x+RoW7APPuB/HE2hlc/Ppxkio0GI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XGIFbmSWSPvKBANEln4XqnyOVAgS+e0ohYOWbcs/Unzmcx9n76WMBRr0rZgx7kuMMy2SxSA/sdldPfFldPupTncrMw3ueMIvunJ/a6IiaPc4SbXzpYbgAWNjFy6Uqu+uhge3bljaRqsNzL7nYqDIxazprPeHVxROhqOWI5NHc5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=LqH+NQgO; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="LqH+NQgO"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 035CA40E023F;
	Sat, 24 May 2025 11:27:46 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id bhdpViCRxkSf; Sat, 24 May 2025 11:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1748086061; bh=UR5opvquslS0Ruu5hR6H/JG4AlIcXSbA67L6Hyl1oFM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LqH+NQgOmQQtFX7IOnlNp6oblPGzSL93DMwwkSJIf3YdLavd8rBpEMQyMF8W9eNeU
	 e00Z0r4YK4M9YX7xlZO5q/QJJ3I4Vn3n9nIuCmPRAb9o263O+pgRQ13rw2aB+O9YZy
	 E5Qx2BIwBZ4pwnYuLp+O1TNVKfQzQLJtc8r1kytgObmglo4tTztJxP6wbzNwJN+GOs
	 2aTEcUpHlCs1zUG9N2H/jnhia6lposIXjJSJz4Oz6u5wGOH+MjbjeEK+jlP5R7NOyo
	 G5nqtjs3Kb8n33REOT/CaywBEHc/8e0kJor1HLnqMgbGMTVLKLYlDsmSXqPWZrjYSw
	 scTZFpDU22cMIAfiAk9bGKASWgypBNMU36yfN/v4sUgg15Gp9Oz96JCAEUmsmlDIxc
	 naS7tIiB42qvj4Xz5bWm6sCn9R6LS/XKSNSU/0tMk6qFjd7Cug5DeUkFz69N+zQdGa
	 pXGQao7CG4jHxlNR1TUaQL7i5V6C4L0r27YApRM6HidMtuaiyUI3SwN0EcpHU+CpyS
	 phoDxeSXAYUG9cWTkqiZdJObfmyA4q/j5Z1LmmVs/hSQ7FtAfbdFyMYd7WGI3ShHwi
	 2IeplhsEGMI5AG/p7Ms6zvYrhbKvJwswq0lErBW2OB1HdijXuO/9R0rYoguksR2Uke
	 8G68eKnYYM8tsjm1xDLBcFM8=
Received: from zn.tnic (p57969c58.dip0.t-ipconnect.de [87.150.156.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id A8F5F40E01CF;
	Sat, 24 May 2025 11:27:35 +0000 (UTC)
Date: Sat, 24 May 2025 13:27:29 +0200
From: Borislav Petkov <bp@alien8.de>
To: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc: x86@kernel.org, David Kaplan <david.kaplan@amd.com>,
	linux-kernel@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>
Subject: Re: [PATCH v3 3/7] x86/bugs: Exit early if return thunk is already
 set
Message-ID: <20250524112729.GJaDGtIQ9pR-pPiy9e@fat_crate.local>
References: <20250522-eibrs-fix-v3-0-12704e291e1e@linux.intel.com>
 <20250522-eibrs-fix-v3-3-12704e291e1e@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250522-eibrs-fix-v3-3-12704e291e1e@linux.intel.com>

On Thu, May 22, 2025 at 06:21:02PM -0700, Pawan Gupta wrote:
> When the exact same return thunk is already set, avoid the warning and exit
> early. This is to prepare for ITS to also set CDT return thunk independent
> of retbleed.
> 
> Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
> ---
>  arch/x86/kernel/cpu/bugs.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
> index 94d0de3e61aec32b3b67c8d21f89a8c67b93dff3..354593065025fd7c5727e955d76523777b3da9ee 100644
> --- a/arch/x86/kernel/cpu/bugs.c
> +++ b/arch/x86/kernel/cpu/bugs.c
> @@ -113,6 +113,9 @@ void (*x86_return_thunk)(void) __ro_after_init = __x86_return_thunk;
>  
>  static void __init set_return_thunk(void *thunk)
>  {
> +	if (thunk == x86_return_thunk)
> +		return;
> +
>  	if (x86_return_thunk != __x86_return_thunk)
>  		pr_warn("x86/bugs: return thunk changed\n");

Ok, let's drop those silly conditionals here and simply issue the name. We'll
see later whether this needs to be louder...

---
diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 94d0de3e61ae..20696abd1bef 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -113,10 +113,9 @@ void (*x86_return_thunk)(void) __ro_after_init = __x86_return_thunk;
 
 static void __init set_return_thunk(void *thunk)
 {
-	if (x86_return_thunk != __x86_return_thunk)
-		pr_warn("x86/bugs: return thunk changed\n");
-
 	x86_return_thunk = thunk;
+
+	pr_info("active return thunk: %ps\n", thunk);
 }
 
 /* Update SPEC_CTRL MSR and its cached copy unconditionally */

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
