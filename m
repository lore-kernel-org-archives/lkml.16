Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A868E283CAA
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 11:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744286009; cv=none; b=VLp4NDpw6vmGB1l5IsOQqXe3QIoBBMnoCOR/TFkcbvdl7bGT/ii/XFhwvcBZ38IpFRJY81phwMOWvnrKlSe6SOsPyHNcLk1enbZpplt3IQTob5SgwLxRoiMGZa5ZqrtFF/zg4/wigGh9OK1Zh03s2Wn6Eu55G0VFANrHZ0cyUKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744286009; c=relaxed/simple;
	bh=zqzlRnDUGYajT8xc8yCcNvDzHC278SgpwmXlWMaDc3Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kRk4KRwcX2AKwNjntXc60B3/MCMP0PO/aGNaPNMC5NTAqFcEshN0I9hOm7/5rJus3Oal4L8rOmF1psQC+YO22EEttLZ//WPo95fT+niJEvvKByObJiX98LFq7Qo0TnmmmlmwPHM3uYVnHkZXCxFf6Q8szAopElUhgTJgbap4Xa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=KRmT10Xp; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=V3/qw1t7; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="KRmT10Xp";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="V3/qw1t7"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744286005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v2p1lbtp0QplDrWE/LzcgKEOQbnSsTNOvmjtUy+7EdQ=;
	b=KRmT10Xpesr8slURmSb1iC8Isu3KPjiYVaW386hAIp2YJCQ79iWbOIvcAHhXb5/BJzGyYt
	DfxgA4bK23sq9QaZJ2kpkxY4XcXJUgfvKyB8W8/gM31oJatbqrGQMiU9IKkmIgYQA2Sp3p
	vi49PYYA6Xe7eSB+ParB9Dsj3W4FBeUYYYIVbaZ3bNqekwlB+GYSoGGfm/KcNTd3GUcti4
	rTwtHC/PnSmDIWgoSWB5g6FjseBFVD1/iwFbQsLz9NqVcmFH74YERGsAZS0xDCRVxtsB09
	x0TYNhKfdmwiL50IPFwJrm7x15z+rzLh4iSED1mZ8r+w3KGX//d2edyX49QTZQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744286005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v2p1lbtp0QplDrWE/LzcgKEOQbnSsTNOvmjtUy+7EdQ=;
	b=V3/qw1t7mPt9XfJKfBP+7TyR0yXq5xTFEe3RCw1YCh+Nk4P9MELcK0kQG0AfaULo3mP+pl
	168aJrY+4aiEvTAg==
To: Borislav Petkov <bp@alien8.de>, Kevin Koster <lkml@ombertech.com>
Cc: Oerg866 <oerg866@googlemail.com>, linux-kernel@vger.kernel.org, Ingo
 Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH] x86/microcode: Consolidate the loader enablement
In-Reply-To: <20250408172250.GCZ_VbaqKsshMYTdaE@fat_crate.local>
References: <CANpbe9Wm3z8fy9HbgS8cuhoj0TREYEEkBipDuhgkWFvqX0UoVQ@mail.gmail.com>
 <20250405130306.ca9822c1f27db119cc973603@ombertech.com>
 <20250405093127.GAZ_D4b6NdyTS-UW1J@fat_crate.local>
 <20250406164049.c0666bc18073e3b88c92d1f1@ombertech.com>
 <20250406174633.2c581923c145687476191753@ombertech.com>
 <20250406190253.GAZ_LP3RPZInWKcHN7@fat_crate.local>
 <20250407095848.7933a358c9f450fe03fb8234@ombertech.com>
 <20250407102927.GAZ_OpBw5hJ2QTFsKz@fat_crate.local>
 <20250408002150.8955343f4e2f2ac31b4663e8@ombertech.com>
 <20250407135533.GDZ_PZVZ-2CKmhbt7d@fat_crate.local>
 <20250408172250.GCZ_VbaqKsshMYTdaE@fat_crate.local>
Date: Thu, 10 Apr 2025 13:53:25 +0200
Message-ID: <875xjcteq2.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Apr 08 2025 at 19:22, Borislav Petkov wrote:
>  static struct microcode_ops	*microcode_ops;
> -bool dis_ucode_ldr = true;
> +static int dis_ucode_ldr = -1;

This tristate muck is disgusting.
  
>  bool force_minrev = IS_ENABLED(CONFIG_MICROCODE_LATE_FORCE_MINREV);
>  module_param(force_minrev, bool, S_IRUSR | S_IWUSR);
> @@ -95,11 +95,20 @@ static bool amd_check_current_patch_level(void)
>  	return false;
>  }
>  
> -static bool __init check_loader_disabled_bsp(void)
> +bool __init microcode_loader_disabled(void)
>  {
> -	static const char *__dis_opt_str = "dis_ucode_ldr";
> -	const char *cmdline = boot_command_line;
> -	const char *option  = __dis_opt_str;
> +	if (dis_ucode_ldr < 0) {
> +		if (cmdline_find_option_bool(boot_command_line, "dis_ucode_ldr") <= 0)
> +			dis_ucode_ldr = 0;
> +		else
> +			goto disable;
> +	}

It just exists to make the above a one time operation. What's wrong with
having:

static void __init microcode_check_cmdline(void)
{
	if (cmdline_find_option_bool(boot_command_line, "dis_ucode_ldr") <= 0)
		dis_ucode_ldr = false;
}

and call that once at the proper place?

Thanks,

        tglx
