Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1327718AE2
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 11:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747914198; cv=none; b=Ay1uNQj/agB+Htg+wfkEGEmUTPyppf5+91yfSMXHOKgUS3gzxx+L9zGnAlBGYd/dBOz/b/2yWYzpjSb5+2RuMBPrcAjMq0HxiWV0WGJ3fi2+fbqtHi1NPvc2IXuf5/RL4xdyb1ReKxuD6cUa6+mB5vollE4ihmCj4ZcZOiSGB+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747914198; c=relaxed/simple;
	bh=doHCWNufQCeZ3HSKLTL3pN2MK6N/ThuGahXcwy2alj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V6MpH/pjWEGs13StvKw2YnBYkVO5+/MxjRJUNW+RjP71w3N3ttcBcR/QnMnQ6nYAp+9CWsWWSWJYKropfybIx9k3N5mnaDupI9oXV+Q8bzYWJgLdvsOZ2zlqlUBz0/u4F+ZOBqcBaxi5cbmE8XzYFrbL9RlFRmkuj2t6zNZ2YFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=hkkSwyWi; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="hkkSwyWi"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id CE3F240E0238;
	Thu, 22 May 2025 11:43:13 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id kmVArlLYCah1; Thu, 22 May 2025 11:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1747914190; bh=E2cusLv+CATO9iaKZip4xA02byRLyVa8q6OwFgpIRQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hkkSwyWiHYSS6/lv4wMAS6IYxli9DD/1cFtqzEGdKZZ6W7x2xgI2Esf73+P8hzYu4
	 SeHUsZZg3uiuHL4UADvFXYMS/8CSQ2LPXTUPlLI9GCNakc5XWrH59CBKXGFHm+cSKA
	 d0cSNU8gJpIjsHjVbZXJFwljV4tAt3OsUdbxH8qqkmeMl9W9VlKzGSgpNV+rMwLbu8
	 YogZsJW84tsiaXWZJg9H/3M5ISchg7HIYVCYmO+f4sX+2H3J3y+E5D1aCGGMgJttU2
	 9p6HIWJyt/lF/pw6xyKanwcC/WGNZpBcohr3fHLULO4ObDdPIvDWHMQSyI8bYf7psA
	 APHonV7PimYoq9yrRkbM2BwNwXk5zBrwRal9Dp30huvqrW1DVneQ4eJabCteGBbL00
	 +9xanrEGozvUHVKqJN3TWy0P15DW1MqGQSRsVyIyYef5qQl8z88VF8LbkIYNuRie7Q
	 H1ewsV/zuRYhIXFFuord+Tja8fmdEPg/Um8pP89b3yD6H87it9wt+Yog7my8zC4HjY
	 8N2oQ9gRhJqSV2u7Oq2iq0OC6o/N02bo68eCA8Vxzysk9D04AbDbSnRImgqP6cZuuN
	 3COEjwaL+4JXIsj2faF0sp8jSHyAkds+rdsYvyWaS3wBfpYYSAlf4fRh8ij05Y+how
	 AaLZ6dIKOpabRQmuGkmscWr4=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 1CF5640E01FA;
	Thu, 22 May 2025 11:43:04 +0000 (UTC)
Date: Thu, 22 May 2025 13:42:58 +0200
From: Borislav Petkov <bp@alien8.de>
To: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc: x86@kernel.org, David Kaplan <david.kaplan@amd.com>,
	linux-kernel@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>
Subject: Re: [PATCH v2 2/7] x86/retbleed: Simplify the =stuff checks
Message-ID: <20250522114258.GGaC8NwmKyhKfJmyga@fat_crate.local>
References: <20250521-eibrs-fix-v2-0-70e2598e932c@linux.intel.com>
 <20250521-eibrs-fix-v2-2-70e2598e932c@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250521-eibrs-fix-v2-2-70e2598e932c@linux.intel.com>

On Wed, May 21, 2025 at 07:44:37PM -0700, Pawan Gupta wrote:
> +	if (retbleed_mitigation == RETBLEED_MITIGATION_STUFF &&
> +	    spectre_v2_enabled != SPECTRE_V2_RETPOLINE) {
> +		pr_err("WARNING: retbleed=stuff depends on spectre_v2=retpoline\n");
> +		retbleed_mitigation = RETBLEED_MITIGATION_AUTO;

What would be the next-best thing fallback for this, short of disabling the
mitigation?

UNRET, IBPB?

I would prefer if we look at STUFFing only when SPECTRE_V2_RETPOLINE - i.e.,
is it even possible.

If not, we fallback to another mitigation which is probably more expensive but
it is better than NONE...

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
