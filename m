Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBB38F58;
	Mon, 10 Feb 2025 05:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739166249; cv=none; b=fI//uQ0MJ3npOyRCJUAJgovcbcUpe0/poJNTTFCptmnxSXEC+aQcelavcPXLPNhSlU+fpO2XWT1SLsll7qTl8+Ztt56psUIReA+gVlKBjD3bf5ZWXCYVOuHSrI2bclDOQK6edl066l7TKjNRP2lBZC9lW8I9C55eGiMM6t81Rkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739166249; c=relaxed/simple;
	bh=QsKlo5lRihncyD4jf3O/19ocwBlCJAhbEv+gr4CqoAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CYj5tJp3nP8Cq2o1j/LgmYw9SIQDr+/NBaiYgzqK/dcJRRnCdD+cNdAmWYMDMWM2TZcc87HvHlhJjk8cW8+jdtosWHIqJ1QvQnH7d8J009UKDH2STQdOrIqR9TFtcXTHS6RdFumbk8eX8PcGBXK3BVAC06KH2rZ9qeL0E+CV0iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=fR5V6ay0; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="fR5V6ay0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=25tCAJSvng3HpkeQlkOkZCZn9tqQLSrQ/1A3tOLGXtI=; b=fR5V6ay01P+rV/ADPEZA0yhSRU
	1L/dV+ttTTfxUOMsfLhGx1z2UsQGEP6VNtvWmaRP2BwBToAB5e2Z5iOzi6B7RZEaRfxy++bxfrMZE
	Qq9Q3MxkujOU05ZXoTuCd8cbsY+6pE/nl8+MicJue/diuTbK2xV3N1x9PBxaHByUGOwYdELXdnl/c
	TQB/ksuLm1BNz2FXQZj6xtJtslaYWgqHtLACbWwXpYZQcHH4ER7362afSzmSF856IiDDkxpkwKGqW
	cSYleficNzmdK/LuEtBRBQqV9N9dqaZR68Lwn5CxE+I+Ub7S9JLdpuRycj3RGmOqiJLK8E1D8I5ag
	r3G/nLfg==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1thMaR-0000000EkQx-2hot;
	Mon, 10 Feb 2025 05:44:03 +0000
Message-ID: <710360ce-fe10-481c-9db8-917d3cf73b51@infradead.org>
Date: Sun, 9 Feb 2025 21:43:59 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: proofreading Documentation
To: Armin <armin.mahdilou@gmail.com>, corbet@lwn.net
Cc: shuah@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250210041800.357393-1-Armin.Mahdilou@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250210041800.357393-1-Armin.Mahdilou@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 2/9/25 8:17 PM, Armin wrote:
> Fixed some spelling issues in documentations.
> 
> Signed-off-by: Armin <Armin.Mahdilou@gmail.com>

Looks good. Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  Documentation/ABI/testing/configfs-usb-gadget-midi2 | 2 +-
>  Documentation/input/devices/elantech.rst            | 2 +-
>  Documentation/nvme/nvme-pci-endpoint-target.rst     | 2 +-
>  Documentation/sound/soc/machine.rst                 | 2 +-
>  Documentation/usb/gadget-testing.rst                | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/configfs-usb-gadget-midi2 b/Documentation/ABI/testing/configfs-usb-gadget-midi2
> index 0eac3aaba137..d76a52e2ca7f 100644
> --- a/Documentation/ABI/testing/configfs-usb-gadget-midi2
> +++ b/Documentation/ABI/testing/configfs-usb-gadget-midi2
> @@ -47,7 +47,7 @@ Description:
>  		midi1_first_group	The first UMP Group number for MIDI 1.0 (0-15)
>  		midi1_num_groups	The number of groups for MIDI 1.0 (0-16)
>  		ui_hint			0: unknown, 1: receiver, 2: sender, 3: both
> -		midi_ci_verison		Supported MIDI-CI version number (8 bit)
> +		midi_ci_version		Supported MIDI-CI version number (8 bit)
>  		is_midi1		Legacy MIDI 1.0 device (0, 1 or 2)
>  		sysex8_streams		Max number of SysEx8 streams (8 bit)
>  		active			Active FB flag (0 or 1)
> diff --git a/Documentation/input/devices/elantech.rst b/Documentation/input/devices/elantech.rst
> index c3374a7ce7af..98163a258b83 100644
> --- a/Documentation/input/devices/elantech.rst
> +++ b/Documentation/input/devices/elantech.rst
> @@ -556,7 +556,7 @@ Note on debounce:
>  In case the box has unstable power supply or other electricity issues, or
>  when number of finger changes, F/W would send "debounce packet" to inform
>  driver that the hardware is in debounce status.
> -The debouce packet has the following signature::
> +The debounce packet has the following signature::
>  
>      byte 0: 0xc4
>      byte 1: 0xff
> diff --git a/Documentation/nvme/nvme-pci-endpoint-target.rst b/Documentation/nvme/nvme-pci-endpoint-target.rst
> index 66e7b7d869b4..b699595d1762 100644
> --- a/Documentation/nvme/nvme-pci-endpoint-target.rst
> +++ b/Documentation/nvme/nvme-pci-endpoint-target.rst
> @@ -86,7 +86,7 @@ configurable through configfs before starting the controller. To avoid issues
>  with excessive local memory usage for executing commands, MDTS defaults to 512
>  KB and is limited to a maximum of 2 MB (arbitrary limit).
>  
> -Mimimum number of PCI Address Mapping Windows Required
> +Minimum number of PCI Address Mapping Windows Required
>  ------------------------------------------------------
>  
>  Most PCI endpoint controllers provide a limited number of mapping windows for
> diff --git a/Documentation/sound/soc/machine.rst b/Documentation/sound/soc/machine.rst
> index 9db132bc0070..1828f5edca3e 100644
> --- a/Documentation/sound/soc/machine.rst
> +++ b/Documentation/sound/soc/machine.rst
> @@ -75,7 +75,7 @@ In the above struct, dai’s are registered using names but you can pass
>  either dai name or device tree node but not both. Also, names used here
>  for cpu/codec/platform dais should be globally unique.
>  
> -Additionaly below example macro can be used to register cpu, codec and
> +Additionally below example macro can be used to register cpu, codec and
>  platform dai::
>  
>    SND_SOC_DAILINK_DEFS(wm2200_cpu_dsp,
> diff --git a/Documentation/usb/gadget-testing.rst b/Documentation/usb/gadget-testing.rst
> index bf555c2270f5..1998dc146c56 100644
> --- a/Documentation/usb/gadget-testing.rst
> +++ b/Documentation/usb/gadget-testing.rst
> @@ -1050,7 +1050,7 @@ Its attributes are:
>  	midi1_num_groups	The number of groups for MIDI 1.0 (0-16)
>  	ui_hint			UI-hint of this FB
>  				0: unknown, 1: receiver, 2: sender, 3: both
> -	midi_ci_verison		Supported MIDI-CI version number (8 bit)
> +	midi_ci_version		Supported MIDI-CI version number (8 bit)
>  	is_midi1		Legacy MIDI 1.0 device (0-2)
>  				0: MIDI 2.0 device,
>  				1: MIDI 1.0 without restriction, or

-- 
~Randy
