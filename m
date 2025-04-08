Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358C921517D;
	Tue,  8 Apr 2025 20:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744144282; cv=none; b=Zwvc14VVAjWfE/bcWew44+EEpbd4432TMtk+NFbS4/X1yrC1xgpz3qT1bRAcUygUJmfE8NFsDo4mMlqvfrA21oagLBCV9+vUhpO6rwDf9nICjwYAPszW5TJtSUzJGFiW/s8eWBTPQYeUnGFDA87IZCToINeGlDbSI3xkOeR5DM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744144282; c=relaxed/simple;
	bh=DMjZ1/RAZgEsuBn5HCdCnHNlTOYxIgcnTcp3ByTgwos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CGyTsR61RqbIyVegoeFIY/nHMCCKA8WYCfyBPZtqk4IJfKgxFgr8RWPe5qgiICcTUWPo395+ROmOlfJ63RXGRQBpxWOIeeJ1Bw6Y3g4mAcvZZt6hU55W1E4OSLtcE3cwqeUa6jFf1JM3eDXKHyIo3ex4/YZY6Z3d2XmPMO9Jkok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NARKNKLj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NARKNKLj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1E14C4CEE5;
	Tue,  8 Apr 2025 20:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744144281;
	bh=DMjZ1/RAZgEsuBn5HCdCnHNlTOYxIgcnTcp3ByTgwos=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NARKNKLjS4L3Drr8clmsRxD7yfH2dqRL2fHdj5qiVNMEvUBhvoGY0QM7dnFK0JjlR
	 Dq5pVs7/d2Uck1UyGdfYQ/MDRx8QEM7naCVDkf4WWJxX0ZQQfdJwbmD4/ys58b0B0Y
	 Pm58XV2T06p0YsenRmzpg0lvPQODOWMqbUaaE3F/bwMuBKP2J7Kt2qgSlQTQU7Orl4
	 /rFiSGVKgqpLzwePYcoWzkWo/3LioKv/t7ewxzw09tL1xhXs9Cwm23xohetRlVxr6y
	 sZgcjUjFdwRfhZREks/BAGwug8fBeFuWxARlwTNfHVPbH2/RGfyX4/Pf8mgwFxIZK+
	 nmkL14WG+ADKQ==
Date: Tue, 8 Apr 2025 22:31:15 +0200
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
Subject: Re: [PATCH v2 2/2] x86/CPU/AMD: Print the reason for the last reset
Message-ID: <Z_WHk4jP0inUSt7T@gmail.com>
References: <20250408174726.3999817-1-superm1@kernel.org>
 <20250408174726.3999817-2-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408174726.3999817-2-superm1@kernel.org>


* Mario Limonciello <superm1@kernel.org> wrote:

> +static inline char *get_s5_reset_reason(u32 value)
> +{
> +	if (value & BIT(0))
> +		return "trip of thermal pin BP_THERMTRIP_L";
> +	if (value & BIT(1))
> +		return "power button";
> +	if (value & BIT(2))
> +		return "shutdown pin";
> +	if (value & BIT(4))
> +		return "remote ASF power off command";
> +	if (value & BIT(9))
> +		return "internal CPU thermal trip";
> +	if (value & BIT(16))
> +		return "user reset via BP_SYS_RST_L pin";
> +	if (value & BIT(17))
> +		return "PCI reset";
> +	if (value & BIT(18) ||
> +	    value & BIT(19) ||
> +	    value & BIT(20))
> +		return "CF9 reset";
> +	if (value & BIT(21))
> +		return "power state of acpi state transition";
> +	if (value & BIT(22))
> +		return "keyboard reset pin KB_RST_L";
> +	if (value & BIT(23))
> +		return "internal CPU shutdown";
> +	if (value & BIT(24))
> +		return "failed boot timer";
> +	if (value & BIT(25))
> +		return "watchdog timer";
> +	if (value & BIT(26))
> +		return "remote ASF reset command";
> +	if (value & BIT(27))
> +		return "data fabric sync flood event due to uncorrected error";
> +	if (value & BIT(29))
> +		return "MP1 watchdog timer timeout";
> +	if (value & BIT(30))
> +		return "parity error";
> +	if (value & BIT(31))
> +		return "software sync flood event";
> +	return "unknown reason";

Can multiple bits be set in principle, belonging to different reasons?

Also, wouldn't a clean, readable text array and find_first_bit() result 
in more readable and more maintainable code?

Which can be initialized thusly:

  static const char *s6_reset_reason_txt[] = {

	[0] = "trip of thermal pin BP_THERMTRIP_L",
	[1] = "power button",
	[2] = "shutdown pin",
	[4] = "remote ASF power off command",
	[9] = "internal CPU thermal trip",
	...

  };

Also the text should probably be expanded into standard noun+verb 
sentences or so, to make it all less ambiguous:

  static const char *s6_reset_reason_txt[] = {

	[0] = "thermal pin BP_THERMTRIP_L was tripped",
	[1] = "power button was pressed",
	[2] = "shutdown pin was shorted",
	[4] = "remote ASF power off command was received",
	[9] = "internal CPU thermal limit was tripped",
	...
  };

etc. Note the deliberate use of past tense, to make it clear this 
refers to a previous event, while usually syslog events indicate 
current events.

> +	/*
> +	 * FCH::PM::S5_RESET_STATUS
> +	 * PM Base = 0xFED80300
> +	 * S5_RESET_STATUS offset = 0xC0
> +	 */
> +	addr = ioremap(0xFED803C0, sizeof(value));

0xFED803C0 is a magic number, please define a symbol for it.

> +	if (!addr)
> +		return 0;
> +	value = ioread32(addr);
> +	iounmap(addr);
> +
> +	pr_info("System was reset due to %s (0x%08x)\n",
> +		get_s5_reset_reason(value), value);

Please make the source of this printout a bit more specific, something 
like:

      x86/amd/Fam17h: Previous system reset reason [%0x08x]: %s

or so? Also note how grepped output will be easier to read due to 
flipping the fixed-width numeric and the variable-length text output:

 # Before:

        x86/amd/Fam17h: Previous system reset reason: thermal pin BP_THERMTRIP_L was tripped (0x00000001)
        x86/amd/Fam17h: Previous system reset reason: power button was pressed (0x00000002)
        x86/amd/Fam17h: Previous system reset reason: shutdown pin was shorted (0x00000004)
        x86/amd/Fam17h: Previous system reset reason: remote ASF power off command was received (0x00000010)
        x86/amd/Fam17h: Previous system reset reason: internal CPU thermal limit was tripped (0x00000200)

 # After:

        x86/amd/Fam17h: Previous system reset reason: [0x00000001]: thermal pin BP_THERMTRIP_L was tripped
        x86/amd/Fam17h: Previous system reset reason: [0x00000002]: power button was pressed
        x86/amd/Fam17h: Previous system reset reason: [0x00000004]: shutdown pin was shorted
        x86/amd/Fam17h: Previous system reset reason: [0x00000010]: remote ASF power off command was received
        x86/amd/Fam17h: Previous system reset reason: [0x00000200]: internal CPU thermal limit was tripped

Thanks,

	Ingo
