Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A1D1B4251
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 08:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743063226; cv=none; b=QfhUnciVaqg3FrYfdZ+LUPuGAmSN7uPkk4QlNthQLhc0TCjGCh23/f7luHi8j3stSETUwC++JAowi/fKyDYfapydEqqi/60fmGMyXwfGOHGeu1EbX3DxCQxpMSaE4784uYFg46f6AFIKrMxJvNq1g/GAKwhR8gQ1rvWQH+CaV/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743063226; c=relaxed/simple;
	bh=bTCIQbZfb43JnsDod1rtfij5pP9d9sm1SFgzMjOAryU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lkl+pweqL91x5Zhv1sQKiGk9Fvebk/Sy/aWOJsRkFaq/W60yMkMQ95EdTlv603HJY/6uh53Tn9dQeC/VY8KjAOTcz+pQD37OVX0WK3+1/cJs3DuhWh2lQLMdOZ1GiBYdrWFhl69NVOm4FXOD5i7JVPExuhGoQ4BCNJDa6EBIDag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=eKkfVi6F; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="eKkfVi6F"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3913d129c1aso445149f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 01:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1743063223; x=1743668023; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jz00sfAr3h8cNxbqkgl+Nkm67OZ8eaKlmd2X1ZA3QeM=;
        b=eKkfVi6FIHybAbye3vivpv7F5qJh6/WlpVeI1g7ZQZMsHBfrTlrSKzEUSHO1+53gxi
         5QakzQOla++hMT3utMCBUlBEqkld4DLKDw1/qmRN2/NDC2TxjA7eRx9yPhV1PmtYb+1S
         +4UfmLSq1mSixxdmV2KVBVBZUaQ8WuP1OUUnftM/Cug/6eVLQveJXLIFLKjuFxUWji3R
         oFeIftQO0WUB8RIrMQNbBR11TZ7kUzaOXjoMzi7C7XMl1zjazr7dUkYmF64Ibv/mtEJ+
         Y+0+vCVFHFUxB4H8b/Xvm04q3OMP+cu70Bp7XTDejyVW/K0CYapDrqPmQ0uVS0B5Uw1t
         p8Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743063223; x=1743668023;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jz00sfAr3h8cNxbqkgl+Nkm67OZ8eaKlmd2X1ZA3QeM=;
        b=gJnyLyzqGFWy2sMzLS7OSOBiR7Hf/sdWzLHmR7ALWEHTHfBJUoHa1xX7ii+wwus5b+
         VgSzENQ+UMzGAFCWau4f+ROG1bL/FF1GagaDAg+QZjOIzJcycAxsg7lTfY6Ckt5o2SvV
         qmvNbBGNZcTjlFAJGR1A7bNQpvGi2SekvJER7HhHU9dv7o4eio9Xjp2S/GqGeHEcK0V3
         bQcKMHg/o8S96O930efgOTqtB0tUnAQ/KyJ1X0FYT+szSHkli9EUsAuwQASGNk4hPHw4
         UGurSs3WwqKkCQX8mQjflSFvY/s/BKKJUmJM92koPagpi7v1t3N2PWUFmRhuKDtnMTO5
         dARA==
X-Forwarded-Encrypted: i=1; AJvYcCXmlifAP+TXRRiYM7vbtMjc0vblCZ2h/sbJoaO6mytl8KLHq8pe9+CGuq29V7K3/sD2PiqDbsDv3X74oq4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa6VsWaUIxG8UjD1qePiu5QuHyMGj40VBkeEzqveBbL/RkL+WF
	XdtT7Uu4r0q3bWAeRNFwYs/CbPVrowShJNO6vyjz0prlc1hwayd+DnNE8U78yog=
X-Gm-Gg: ASbGnctJh2p6H2CFXk8U83Ew/nUS/kYuGisv2SFkDDQLDpCz/dxTinHt7BQ+EVAYJgp
	6Ml6prs3w+ile9p2/FCl5oqKFAWgZ5fDSzS6nLYNkV8V1fVCcsQrQHqBUc5GyTc6+vgMpG3C5WP
	okGxl3G79VYk/tLyOoo723GFJ3f2DHwc73iuHKuF667A17KPU9MuzlvZtB70IhisO0I4Rm43dYz
	aEkw052z/8DvXDNsUjDD/7h4CMK1LjY5AQAsDU4BV4WZti/qTt87TonwFZ9hZ19nXn1CumV+s1j
	TkQldhl7vAyturqwrrZN9y5fCP4YIwGTn3k8L13cmOys7jKtdQQJ9w==
X-Google-Smtp-Source: AGHT+IHaGU7k1A9qg1y23ZMz5cgJ0D4Cu+DVQXIKfTtvPKv7hvhNHKkbv6hFjGYgP2YHKA+NqagcPQ==
X-Received: by 2002:a5d:64a9:0:b0:39a:c6d1:c343 with SMTP id ffacd0b85a97d-39acc44f0aemr5163077f8f.10.1743063223009;
        Thu, 27 Mar 2025 01:13:43 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9e65besm19397452f8f.65.2025.03.27.01.13.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 01:13:42 -0700 (PDT)
Message-ID: <d47e7da3-4b84-4688-a1f1-8019383a3e48@tuxon.dev>
Date: Thu, 27 Mar 2025 10:13:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 10/13] net: macb: Add "mobileye,eyeq5-gem"
 compatible
To: =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-mips@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>
References: <20250321-macb-v1-0-537b7e37971d@bootlin.com>
 <20250321-macb-v1-10-537b7e37971d@bootlin.com>
 <ea5de004-a26c-43a1-9408-0089fa18b44d@tuxon.dev>
 <D8PITUNTWTXA.366TNSXDUL48G@bootlin.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <D8PITUNTWTXA.366TNSXDUL48G@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Theo,

On 25.03.2025 19:25, Théo Lebrun wrote:
>>> +	}
>>> +
>>> +	regmap_read(regmap, gp, &reg);
>>> +	reg &= ~EYEQ5_OLB_GP_RGMII_DRV;
>>> +	if (phy_interface_mode_is_rgmii(bp->phy_interface))
>>> +		reg |= FIELD_PREP(EYEQ5_OLB_GP_RGMII_DRV, 0x9);
>>> +	reg |= EYEQ5_OLB_GP_TX_SWRST_DIS | EYEQ5_OLB_GP_TX_M_CLKE;
>>> +	reg |= EYEQ5_OLB_GP_SYS_SWRST_DIS | EYEQ5_OLB_GP_SYS_M_CLKE;
>>> +	regmap_write(regmap, gp, reg);
>> To me it looks like this code could be abstracted as a phy driver. E.g.,
>> check the init_reset_optional() and its usage on "cdns,zynqmp-gem" (phy
>> driver here: drivers/phy/xilinx/phy-zynqmp.c).
> I thought about that question. Options to implement that sequence are:
> 
>  - (1) Implement a separate PHY driver, what you are proposing. I just
>    made a prototype branch to see what it'd look like. Nothing too
>    surprising; mostly the above sequence is copy-pasted inside
>    phy_init|power_on(). I see two issues:
> 
>     - First, a practical one. This adds a lot of boilerplate for no
>       obvious benefit compared to a raw registers read/write sequence
>       inside macb_config->init().

The macb is used by various platforms. If the settings proposed in this
patch (platform specific AFAICT) could be abstracted and used with generic
APIs I think would be better this way.

> 
>       The main reason for that boilerplate is to allow reuse of a PHY
>       across MACs;

And/or avoid having platform specific code in the macb driver.

> here we already know that cannot be useful because
>       the EyeQ5 has two GEMs and nothing else. Those registers are
>       EyeQ5-specific.
> 
>     - Second, a semantic one. The registers we are touching are *not*
>       the PHY's registers. They are configuring the PHY's integration:
>       its input PLL, resets, etc.
> 
>  - (2) Second, taking into account that what we are configuring isn't
>    the PHY itself but its resources, we could try modeling each
>    individual register+field as a reset / clock / pin control (there is
>    some drive strength in here, *I think*). Issue: this would get
>    messy, fast.
>     - A single register would expose many resources.
>     - The sequence in macb_config->init() would need to be the exact
>       same order. IE we can't abstract much.
> 
>    Something like this pseudocode (which is a bad idea, we'd all agree
>    here):
> 
>       reset_deassert(bp->eq5_sgmii_reset);
>       reset_deassert(bp->eq5_sgmii_reset_pwr);
>       reset_deassert(bp->eq5_phy_reset_tx);
>       reset_deassert(bp->eq5_phy_reset_sys);
> 
>       if (bp->phy_interface == PHY_INTERFACE_MODE_SGMII) {
>          pinctrl_select_state(bp->eq5_phy_input_pinctrl, bp->eq5_pins_sgmii);
> 
>          reset_deassert(bp->eq5_sgmii_reset);
>          clk_prepare_enable(bp->eq5_sgmii_phy_input_pll);
> 
>          reset_deassert(bp->eq5_sgmii_reset_pwr);
>       } else {
>          pinctrl_select_state(bp->eq5_pinctrl, bp->eq5_pins_rgmii);
>       }
> 
>       reset_deassert(bp->eq5_phy_reset_tx);
>       reset_deassert(bp->eq5_phy_reset_sys);
>       clk_prepare_enable(bp->eq5_phy_mclk_tx);
>       clk_prepare_enable(bp->eq5_phy_mclk_sys);

This looks complicated to me.

> 
>  - (3) Keep the sequence in macb_config->init(). Plain and simple.
>     - Issue: it is somewhat unrelated platform-specific code that's
>       present inside macb_main.c.

For maintainability I would prefer to avoid this.

> 
> The two serious options are (1) and (3).
> (1) is what you proposed and (3) is what's in the series.

I prefer (1) if it can be done.

Thank you,
Claudiu

