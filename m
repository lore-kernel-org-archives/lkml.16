Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE519264F97;
	Mon,  7 Apr 2025 18:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744051620; cv=none; b=AK7mhn+T6zmeH6sW9EFHwHpMIWNcn6RdoEb/Qodzd2MWFMgvjgJGD26GayM9ffQaut2Qqw63msl/EarDLptkBGgb7crTbRjA4wJdhr9gxQwTPiRvmWue4gw9Motq+7aZvbpGkT8S52EGdrzY/y4Ep7tE0wuYU8FK0l5ip9/HZXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744051620; c=relaxed/simple;
	bh=uDFkW2NzqPPArsrus5K5eohiRz2wTMhz2dpgvWO8dwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sAQ5auZVkalySQSyNVbxkFCYf4gr+bJxFNl+Cpwc0PH4m6NgzUsHwqZHFaeQvUBVAibuQCX18c1rHbh4vLKXv7hX2sIrebaM1h4peyTqSrGUbEg3HRmBytMpDcTDjsz+H5iqi9CZVeaaKs0WM5QQeteWO8rfE3FurIWvv17Nlx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HNWxqAmh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HNWxqAmh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FD19C4CEDD;
	Mon,  7 Apr 2025 18:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744051620;
	bh=uDFkW2NzqPPArsrus5K5eohiRz2wTMhz2dpgvWO8dwU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HNWxqAmhT4YHZ8BNHaMN3pPR6reOuB1rcGHwvPo46fqHWNP8uEva0su2O8rCNZaye
	 obKbA18BwPKkd3OBC3iOUVnMMIsY4VGZWmUuNjq0KQfFp6IkqFXjJO5Sh3yZJiwrav
	 vg3yexKUb0Wb1r9iRtbFrciTk9rPA2rzC4cUh79kwjd5a5QjxsJONa++Sc/4RY7S54
	 efGuq82xqJZnWKj+QTnHojRdloxA1W0aK+ccTbXUlrP1Ps2Exx74gbYfR+AFrMYHfG
	 lqfgkoNZ13GOck2vDOQAYYTaIGEsw6UIGn4yKEyjeD2cnjkL6I6IOlpTyfdr0wRMim
	 vYUFoks+jQ8mQ==
Date: Mon, 7 Apr 2025 20:46:55 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Mario Limonciello <superm1@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>, Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH 2/2] x86/CPU/AMD: Print the reason for the last reset
Message-ID: <Z_Qdn_WYAalNAHOi@gmail.com>
References: <20250407162525.1357673-1-superm1@kernel.org>
 <20250407162525.1357673-2-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407162525.1357673-2-superm1@kernel.org>


* Mario Limonciello <superm1@kernel.org> wrote:

> +++ b/Documentation/admin-guide/amd/amd-reboot-reason.csv
> @@ -0,0 +1,21 @@
> +Bit, Type, Reason
> +0, Pin, Thermal trip (BP_THERMTRIP_L)
> +1, Pin, Power button
> +2, Pin, SHUTDOWN# pin
> +4, Remote, Remote ASF power off command
> +9, Internal, Thermal trip (internal)
> +16, Pin, User reset (BP_SYS_RST_L)
> +17, Software, PCI reset (PMIO 0xC4)
> +18, Software, CF9 reset (0x04)
> +19, Software, CF9 reset (0x06)
> +20, Software, CF9 reset (0x0E)
> +21, Sleep, Power state or ACPI state transition
> +22, Pin, Keyboard reset (KB_RST_L)
> +23, Internal, Internal CPU shutdown
> +24, Hardware, Failed boot timer
> +25, Hardware, Watchdog timer
> +26, Remote, Remote ASF reset command
> +27, Internal, Data fabric sync flood event due to uncorrected error
> +29, Internal, MP1 Watchdog timer timeout
> +30, Internal, Parity error
> +31, Internal, SW sync flood event

So I'd much prefer if each bit was iterated, and the above reasons were 
printed out clearly, instead of some arbitrary meta grouping that 
removes useful diagnostic information:

> +#define PIN_RESET	(BIT(0) | BIT(1) | BIT(2) | BIT(16) | BIT(22))
> +#define REMOTE_RESET	(BIT(4) | BIT(26))
> +#define INTERNAL_RESET	(BIT(9) | BIT(23) | BIT(27) | BIT(29) | BIT(30) | BIT(31))
> +#define SW_RESET	(BIT(17) | BIT(18) | BIT(19) | BIT(20))
> +#define HW_RESET	(BIT(24) | BIT(25))
> +#define SLEEP_RESET	(BIT(21))

> +	pr_info("System reset was due to %s (0x%08x)\n",
> +		get_s5_reset_reason(value), value);

I realize that the entire numeric value gets printed as well, but it's 
the symbolic decoding that is most useful to humans.

Also, by printing unknown but set bits as 'unknown' we'd have a way to 
clearly signal to users that there's some new diagnostic flag the 
kernel doesn't understand yet.

Just a couple of examples:

 - Printing "Internal, Data fabric sync flood event due to uncorrected error"
   or "Internal, Parity error" would indicate potential RAM module troubles,
   while "Internal, Thermal trip (internal)" would indicate cooling system
   troubles. But with your patch both get printed as some sort of 'internal CPU'
   problem that is unnecessarily unhelpful...

 - I don't think representing bit 24 ('Hardware, Failed boot timer') as 
   'Hardware induced' reboot is really helpful either, to me it appears to be
   a failed bootup time treshold that is more of a firmware thing that may or 
   may not indicate hardware troubles.

 - etc. etc.

Basically, the finegrained list of reasons looks perfectly usable to 
me, let's not dumb it down for users unnecessarily, okay?

Thanks,

	Ingo
