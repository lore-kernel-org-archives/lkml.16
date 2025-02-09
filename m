Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C744243368;
	Sun,  9 Feb 2025 14:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739112018; cv=none; b=dEuBj3zvglxpMmJH+DppmkW/8fvXUp1x04duZAqyxC761j4KP/XNJltegqhW/OIF//HtRUoAHMnsNougxb63qzf1z5dBJL+e+UjzlRmRR/UHOYg1w6536BJ6O+Ys9QZgKAGIS/elG3sGiOi6to09cF4sFa4H83XyiEqtCTpUAcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739112018; c=relaxed/simple;
	bh=K/KSA0O8BPP5hNKCq/VygDZGmRdWKWiCWOazJ65bwSE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mt8DXHqB19ZhV/9OEg8JwKCgPlEu33mb0u1MF9WwlUnpu9CmlkE88NDoD2d7W4kFzvfgE74RhxRiFRp8zcN59PKg6hC2+APbpJukclgSXZYWmHYi4dzCsSvKZVjkVii5amjDa0AJqFtRvQA7N7xUC4CO9uph9IRDDRuXWCTcv3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KOi63/rn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KOi63/rn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91606C4CEDD;
	Sun,  9 Feb 2025 14:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739112016;
	bh=K/KSA0O8BPP5hNKCq/VygDZGmRdWKWiCWOazJ65bwSE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KOi63/rn6GWA3lor/LE3n0L0F+FgXA3wYE+uIIwUGGT+WoKmYNTcIhkG2MgMApjwZ
	 qwgkaxc++1rzLzFVQ4ypHTzbWUwJGPPtTT7suQD+5hy5Prj0WL7A/9hmQvccOxqqnY
	 X92RcdU+w1JUYSB+EjYH3LWWIQ3rebR1KX/irrTb0foNDEt9J9YXnE3qbu4RtiRpI7
	 0Lqi2P4Ddii4w3oEO0+sU/cqVLC50QjIWfwr18Q8eJk79i3LoGK02eaDngdku3AcB0
	 Lwt9F3wjpab05tzQN5roicXEVpHQVFusJ+Avb6nGcaoUEf7EGgZXOaAQBDrLrkQbtg
	 afFjbukkbCvgg==
Message-ID: <98a7fdf5-585f-47a7-bb28-5cef43f7ac76@kernel.org>
Date: Sun, 9 Feb 2025 15:40:12 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Sorting out the RTL9300 dt-bindings
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 "lee@kernel.org" <lee@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <4e3c5d83-d215-4eff-bf02-6d420592df8f@alliedtelesis.co.nz>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <4e3c5d83-d215-4eff-bf02-6d420592df8f@alliedtelesis.co.nz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04/02/2025 23:39, Chris Packham wrote:
> Hi,
> 
> As Krzysztof points out in [1] I seem to have made a bit of a mess with 
> the mfd binding for the RTL9300 Ethernet switch with integrated CPU. I'm 
> spinning up this email thread separately so as not to unnecessarily spam 
> the netdev folks and to maybe appease google so it doesn't automatically 
> get flagged as junk.
> 
> First off sorry for not providing a more complete binding initially, 
> Krzysztof suggested doing so a few times but I was concentrating on 
> landing the drivers.
> 
> The RTL9300 has these basic blocks:
> - rtl9300
>    |- cpu@0 - mips34kc
>    |- soc@18000000
>      |- intc
>      |- spi-nor
>      |- spi-nand
>      |- timer
>      |- gpio
>      `- uart
>    `- switch@1b000000
>       |- ethernet-ports
>       |- mdio
>       |- i2c
>       |- reset
>       `- led/gpio
> 
> The CPU/soc can be disabled and the switch managed by an external CPU 
> (register access over SPI I think, the docs are a bit vague).
> 
> I think I probably inferred too much from mfd/mscc,ocelot.yaml when I 
> created mfd/realtek,rtl9301-switch.yaml.


... and to recap to others for context, the problem is that switch is
simple-mfd and most of the switch children have bus addresses (MMIO of
the switch region) but ethernet-ports does not.

This will work fine, but is discouraged style.

Considering also that some of the children - like syscon-reboot or i2c -
take one or few registers as address space, maybe adding MMIO for
children was not necessary at all.

From implementation point of view, this MMIO is not really used, because
children anyway get and use regmap from the parent, right?

> 
> I still think the switch@1b000000 needs to be "syscon", "simple-mfd" as 
> that's how the reset and i2c blocks work and they're pretty independent 
> of everything else.
> 
> I've currently described the mdio interface as a device on a simple bus 
> although it could just be handled as a descendant of the switch block 
> that a driver looks up as a child node (I've tried to keep the mdio 
> driver independent for now but that's an implementation detail). It does 
> need to reach out to the ethernet-ports to figure out the mapping of 
> port to phy so it isn't independent.
> 
> I see a couple of paths forward
> - keep adding the switch stuff to the mfd/realtek,rtl9301-switch.yaml

I think that's the way to go.

> - move mfd/realtek,rtl9301-switch.yaml to net/realtek,rtl9301-switch.yaml

This you can do anyway. MFD in bindings is rather placeholder for
complex devices where we cannot assign one, common function. In your
case you call it switch, so it could be placed in net in the first place.


> - keep mfd/realtek,rtl9301-switch.yaml with the i2c and reboot but have 
> a $ref to a new binding under net/ (not sure what that'd look like).
> 
> There's only one in-tree user of this so I don't think we need to be too 
> concerned about backwards compatibility. Downstream openwrt handles 
> these devices way differently already.


Best regards,
Krzysztof
