Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31182AEE2;
	Mon,  7 Apr 2025 18:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744052219; cv=none; b=ruEOcu4m/eE/pRkXccrf6PMBDHtYJycGIz4/T11twnojc5760ggcSJBu+p+jWGff9pOZNvZEnRuuDQuUfccGmKBXaNBY9IE0VD/zm3e56nr0I08B5TA7Vk/lYBI0jY2Fn+BwH/XOGsQ9nEqRHZHAlYPqvOQHZLjdkcoQGKAXGFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744052219; c=relaxed/simple;
	bh=wLJWwrYORWIHIpPIhjB3g9vQ/xdK4n0sVOSib6gaI64=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WS8mCn+V1Md4m52/u8/7pexrw1L3o4HJjU9+tccMOxY7Qh0IMYIJwIoDWujJdaTwRS4V1OFjG68QfAVRmON13uJayFybVPLvwaAmUZQC6lnFzjApI4nF6k8O6WKyeA9xTfjUCMkTOqj5o6t6KMUghEgM/bJ/G2NSrigu51XxsAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cwPr6b4g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cwPr6b4g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7979BC4CEDD;
	Mon,  7 Apr 2025 18:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744052219;
	bh=wLJWwrYORWIHIpPIhjB3g9vQ/xdK4n0sVOSib6gaI64=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cwPr6b4gswwfPNBCIgOGjSfjgFHBc2bJBrs8Z5jpucxGX36KB4KEITfFnBRc8IO2u
	 6hilSExO3p41cfPj+5tndMmWyV4KdsvOWJvpLwmO34uWhd2GhoNyrUTDM7ipQHQycp
	 SNhowbBzNkdJLLRoV3ZQB7HIYdE+eY40mPmpicv2VG9xWAbUugi9BKPUikWqqYaBtB
	 Dmg6gUvEAVBpFiZtV5WA1t6nqX2hz0DOQVSBiOjMxjzdx6r43rkK1v7RTmloplHEni
	 9hB72FyPnmX/CKYweVdJJzznxSpTQ02RUDGoni6QVnUGK0RUkNeyjXODHB/ZwlM38/
	 DQTtM8VlY+NDg==
Message-ID: <ebfaae8d-7186-454f-ba06-b86fea357d03@kernel.org>
Date: Mon, 7 Apr 2025 13:56:57 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/CPU/AMD: Print the reason for the last reset
To: Ingo Molnar <mingo@kernel.org>, Borislav Petkov <bp@alien8.de>
Cc: Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
 "H . Peter Anvin" <hpa@zytor.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Yazen Ghannam <yazen.ghannam@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
References: <20250407162525.1357673-1-superm1@kernel.org>
 <20250407162525.1357673-2-superm1@kernel.org> <Z_Qdn_WYAalNAHOi@gmail.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <Z_Qdn_WYAalNAHOi@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/7/2025 1:46 PM, Ingo Molnar wrote:
> 
> * Mario Limonciello <superm1@kernel.org> wrote:
> 
>> +++ b/Documentation/admin-guide/amd/amd-reboot-reason.csv
>> @@ -0,0 +1,21 @@
>> +Bit, Type, Reason
>> +0, Pin, Thermal trip (BP_THERMTRIP_L)
>> +1, Pin, Power button
>> +2, Pin, SHUTDOWN# pin
>> +4, Remote, Remote ASF power off command
>> +9, Internal, Thermal trip (internal)
>> +16, Pin, User reset (BP_SYS_RST_L)
>> +17, Software, PCI reset (PMIO 0xC4)
>> +18, Software, CF9 reset (0x04)
>> +19, Software, CF9 reset (0x06)
>> +20, Software, CF9 reset (0x0E)
>> +21, Sleep, Power state or ACPI state transition
>> +22, Pin, Keyboard reset (KB_RST_L)
>> +23, Internal, Internal CPU shutdown
>> +24, Hardware, Failed boot timer
>> +25, Hardware, Watchdog timer
>> +26, Remote, Remote ASF reset command
>> +27, Internal, Data fabric sync flood event due to uncorrected error
>> +29, Internal, MP1 Watchdog timer timeout
>> +30, Internal, Parity error
>> +31, Internal, SW sync flood event
> 
> So I'd much prefer if each bit was iterated, and the above reasons were
> printed out clearly, instead of some arbitrary meta grouping that
> removes useful diagnostic information:
> 
>> +#define PIN_RESET	(BIT(0) | BIT(1) | BIT(2) | BIT(16) | BIT(22))
>> +#define REMOTE_RESET	(BIT(4) | BIT(26))
>> +#define INTERNAL_RESET	(BIT(9) | BIT(23) | BIT(27) | BIT(29) | BIT(30) | BIT(31))
>> +#define SW_RESET	(BIT(17) | BIT(18) | BIT(19) | BIT(20))
>> +#define HW_RESET	(BIT(24) | BIT(25))
>> +#define SLEEP_RESET	(BIT(21))
> 
>> +	pr_info("System reset was due to %s (0x%08x)\n",
>> +		get_s5_reset_reason(value), value);
> 
> I realize that the entire numeric value gets printed as well, but it's
> the symbolic decoding that is most useful to humans.

The way that I "envisioned" this working was someone uses their machine 
and suddenly hits a problem.  When they do they look at 
amd/debugging.rst and then run:

"journalctl -k | grep "System reset was due"

and then map the odd duck(s) out to the table.

> 
> Also, by printing unknown but set bits as 'unknown' we'd have a way to
> clearly signal to users that there's some new diagnostic flag the
> kernel doesn't understand yet.

Right.

> 
> Just a couple of examples:
> 
>   - Printing "Internal, Data fabric sync flood event due to uncorrected error"
>     or "Internal, Parity error" would indicate potential RAM module troubles,
>     while "Internal, Thermal trip (internal)" would indicate cooling system
>     troubles. But with your patch both get printed as some sort of 'internal CPU'
>     problem that is unnecessarily unhelpful...
> 
>   - I don't think representing bit 24 ('Hardware, Failed boot timer') as
>     'Hardware induced' reboot is really helpful either, to me it appears to be
>     a failed bootup time treshold that is more of a firmware thing that may or
>     may not indicate hardware troubles.
> 
>   - etc. etc.
> 
> Basically, the finegrained list of reasons looks perfectly usable to
> me, let's not dumb it down for users unnecessarily, okay?

Boris, your thoughts please?


