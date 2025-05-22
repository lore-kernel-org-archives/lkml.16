Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2942B9A9
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 11:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747913286; cv=none; b=RoNrhSI7FIyHvP/VT3dcQ/6/KfLFGEsbgtsrh7b7ZXu9Q7EdndYsStJz8ivb8rJ7nJz5xcDRMzcJTzY1crh4R8xZQBJk6JfPqqxfQ/p2W7QACRbR8Obtk2g1lEzEi/RPZa6GCR07kUSZYIX/sQel+kYEYXpjZPULN8C+uZmQl+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747913286; c=relaxed/simple;
	bh=wrLndpLeatp9wBGYUXidOjah085egs0Hmvle5JjDa0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CcOHSX8Z/SWz+qhErIvoM6QKyTaoo3aoh7BnfSanD/F5pIGXBW0pIqjlayvRRB8YOa9ugTIE9RP0mCdBjMEpuc2cRlSwiyCMbmk6cRw8opEtXPK0f776+PAUnCQgxhau5a6Z3KmX+ieRMU+Gper8Guquk5O+0JkJzHUe/X2wGeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=SBr+kHBg; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="SBr+kHBg"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id A0F7B40E0238;
	Thu, 22 May 2025 11:27:54 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id obI0p_6iIzXK; Thu, 22 May 2025 11:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1747913269; bh=VXP4G28s+yyqXXz4f5HL6GK1nYQ1f8I8r0biDfWWSj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SBr+kHBg/mq1Zz98oKFsjZAAtqSomtkNyZRpsBICSJjtag1/ebkb4IO3AupFfXLxl
	 TyaqWPfrEwnyPrVZ+G8RydfBTnTLi8WXO1e7Jdd9i3SWkQZxw+OG3YBWUsEHg8bSBu
	 b4I1UDNyOJvME2KNNWxaX8Ce1zoTLWBNrnhvlVuDK9q7zQL5+4Z4WjQ/18aePuSdJj
	 20DVZ/D3vAhtFIyTWPV+k2jx1u/4pavZG3cT8J/KPRAVAbECb4ilUqH91qpPVeIWyu
	 2inh2Wyuphr7fWWhbQXtiZYsa3tX/inyNJ6pSk0mROmMNjkT3Qm3w19f/0+OzOc7z1
	 saRnYhlL9yl5WAsjX7nas6Jn4METtN8PRcPwHW7/f9GrlQY2SQGPBhEVdlBVSKx29a
	 7SfQkqYH9k4yzycwPQWDj5zpwPR0iLxBM5G+4if507FMLf6W6XHSY6pKfXOLOpZrBU
	 p+TNLsqCPli0p5H+4JBU6l8cGLaBAyl8WRivPZSYF+CuM7k9mXVwo9SUzGkC4hqYyo
	 DBCjF8Yh63y+iqlzPwYwlnEo75jq0DO09jzbYDrimfEy3sDYiL/26DTWMo26bAih3V
	 uSoEJ9MJGzktjcVSnKoCxwdivFBYjETqUSAKryrmKB7gV4fU76IbtmsGYw4N6eIVPJ
	 A6FFrwpQp0pH8WUIadhcms9Q=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id BEA2540E01FA;
	Thu, 22 May 2025 11:27:43 +0000 (UTC)
Date: Thu, 22 May 2025 13:27:30 +0200
From: Borislav Petkov <bp@alien8.de>
To: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc: x86@kernel.org, David Kaplan <david.kaplan@amd.com>,
	linux-kernel@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>
Subject: Re: [PATCH v2 1/7] x86/retbleed: Check for AUTO in all cases
Message-ID: <20250522112730.GFaC8KIk7jbj4EyoV7@fat_crate.local>
References: <20250521-eibrs-fix-v2-0-70e2598e932c@linux.intel.com>
 <20250521-eibrs-fix-v2-1-70e2598e932c@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250521-eibrs-fix-v2-1-70e2598e932c@linux.intel.com>

On Wed, May 21, 2025 at 07:44:22PM -0700, Pawan Gupta wrote:
> When none of mitigation option is selected, AUTO gets converted to NONE.
> This is currently only being done for Intel. The check is useful in
> general, make it common.
> 
> Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
> ---
>  arch/x86/kernel/cpu/bugs.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
> index 7f94e6a5497d9a2d312a76095e48d6b364565777..19ff705b3128eacad5659990ed345d7a19bcb0f4 100644
> --- a/arch/x86/kernel/cpu/bugs.c
> +++ b/arch/x86/kernel/cpu/bugs.c
> @@ -1294,15 +1294,15 @@ static void __init retbleed_update_mitigation(void)
>  			if (retbleed_mitigation != RETBLEED_MITIGATION_STUFF)
>  				pr_err(RETBLEED_INTEL_MSG);
>  		}
> -		/* If nothing has set the mitigation yet, default to NONE. */
> -		if (retbleed_mitigation == RETBLEED_MITIGATION_AUTO)
> -			retbleed_mitigation = RETBLEED_MITIGATION_NONE;
>  	}
> +
> +	/* If nothing has set the mitigation yet, default to NONE. */
> +	if (retbleed_mitigation == RETBLEED_MITIGATION_AUTO)
> +		retbleed_mitigation = RETBLEED_MITIGATION_NONE;
>  out:
>  	pr_info("%s\n", retbleed_strings[retbleed_mitigation]);
>  }

So, the way I see it is, AUTO means user didn't select anything so we will
select the default thing.
 
And we do that in the select function.

But then in the update function we bring back AUTO from the dead again,
forcing us to having to deal with it, well, again.

So can we simply set to RETBLEED_MITIGATION_NONE in the retbleed + its = stuff
option when SPECTRE_V2_RETPOLINE not selected?

This'll get rid of the AUTO crap.

For that, the select function should probably select something else from AUTO
on Intel too.

My point is, let's deal with AUTO in the select functions only and then forget
it from then on...

Right?

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
