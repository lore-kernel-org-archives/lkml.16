Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD02225A3B
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 13:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748525054; cv=none; b=p/oNlikwJ+IsCGkTcxu4KHLqyC4JNkPhycZFj5TcxpQyJA+veOdmMezu5OVndo4hekGVk7AXXzXVy6Ra63m3pRxG371+u7T9Y1TyyF/OFzGzBwVtP5rJ3POK6362aSn7ZApq4rSWmsLFioSSjXZX7bffXqUG/99PcROD4S3CArk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748525054; c=relaxed/simple;
	bh=u6PXl/iHQww6rD3fUk3v7gcYp1gk8Tk5zANeoTZrfyY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=qYFfnRhTP3twXDVlpEoWzh2Dk4bhaWDpVz6O0uKqGAsYzj8dp+E/TNRT4eC4lzIMX+aetj2QxltRUuXBEMau5FCIbNHD4bpiceYi/PPIwXbqOxa5JG4z8RSRoPtutAF91+qKoYFVvn+vKU/rsP52u6dh9Wl1wzOKDAqio60QZQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LQfEriaP; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LQfEriaP"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-450cfb79177so3839665e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 06:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748525050; x=1749129850; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zoLc4ELQIKOc5XDzCSKwyjSpDnw0shMoP1mujhtDXfU=;
        b=LQfEriaPUgXmPwCes1ZyM9mAhpWhMQYwczl4UnC8VYlflt8yZIr07y1ZVutw1LBkm9
         AMB7DrFxXW76q7fmQS1UCzqhy1wVc+f5/IYqtytMRnYtbXtsA4VaU5BG4C2SpHuUt57f
         otqTn35YQwZzHbmfgB8wlArzJ67djr7B1iVAirt5Ia6QBYTrvxH8RlzKsNgBG/4JWZt5
         zgO4jcICIyKGu4WgqCYmgvVG4zpUOdXeaaHxbk+Uu+KiaTtPN8BXK/02ktsxBydFbADs
         NHNz+hiSthhfCg2zAMffFe+kDEGkgD2A8hFdyOGK6EtlQCPOAIm6ZzcUbOFabm6GHjEI
         1V9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748525050; x=1749129850;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zoLc4ELQIKOc5XDzCSKwyjSpDnw0shMoP1mujhtDXfU=;
        b=KCuIbaqxuLhORZ9vJyYIfJ5vQrib3AKG7lhZ1xjTldnFZWTUOq2Eey1zET80htLbXp
         +0XtRVZeJQkhu79xdgK0MgC9N98JBbxfC8Uzj6/0P37TWSaJNQVYk841VfGf1IpVV4bc
         h0IT9zyNKRkuA1KifTBfX0O+LKLO/nWInWrQ+kOVupL4l5e3O/6zewlXb3Fy63133TqS
         s8ShRh2IzWoeACANygpmKseibvF9APh//4k4eD4YDMITtg9vZS0Waz2JKdkD6Q/tsVCF
         6f6AHuQr5xF5vvDhYyKl5ccBqtljclBGobZqlXOY0keJIndXl05wrSt4DUsks11VCMl0
         nrZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiqmZTTUq4UVZbto81zWp1ffAldrerKjD3UxdrDXXSHvFCm9kHFcSe+gTytthsLL8UpSevV/CHpMEH/f0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxADzH1/TBDau71K+NFinBYxm14I1RQLesy3eU8hhbLsNFrkgFq
	TfDyJdEiBiOzbCraAii1egkfHN5zl3Z4nIWRcFSmsL6x7+zvuXeU6GKRXlFimyFbnnY=
X-Gm-Gg: ASbGncumwlTG3CnaflbCp2oOWMPCZuFpnWTLv5gTnFsFoazqxKTt8obHZZoTzwU/QgC
	sacL3c4oHVJMFtJ+kjPg4vGsv0RWA67GISB+XaLpy7UAJfB3G/CV4J2ru3ZH5uAgvesxR7c4iGD
	kk3ZuXT7Na8rrzH0blQdT+FC0/7twqXBY7lJlHIXPX0PqwkXZ0p6TyDyBsyQ7Bja/dS5mlGsRjS
	rEOajTQdzjb0OQ7WcxprFoE5JZhT0zVFpdrCT1FFfndvxUCo61M5duKUoxqdnAAHCfE7UGMaHsF
	WmLPZ2FeN3++N7Yepi/yJ3WySSOVQ/ES6srDy6b0rYcT8efwz6I=
X-Google-Smtp-Source: AGHT+IGWA4BBkHB6xJjNhjPeH4ms8/V/tRLixJc1WNJXtJiU2mBdPy6sHFzIQWuccGGlqiqPKRQPnQ==
X-Received: by 2002:a05:600c:1c8b:b0:450:cc3d:6a03 with SMTP id 5b1f17b1804b1-450cc3d6c38mr45073395e9.7.1748525050414;
        Thu, 29 May 2025 06:24:10 -0700 (PDT)
Received: from [192.168.0.34] ([37.222.66.194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450cfc15b6csm19894015e9.20.2025.05.29.06.24.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 06:24:10 -0700 (PDT)
Message-ID: <bdd3fe2f-28eb-4c85-99b2-7220cb15b9bc@suse.com>
Date: Thu, 29 May 2025 15:24:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 07/13] misc: rp1: RaspberryPi RP1 misc driver
To: Andrea della Porta <andrea.porta@suse.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof Wilczynski <kw@linux.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Linus Walleij
 <linus.walleij@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic
 <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-gpio@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
 Stefan Wahren <wahrenst@gmx.net>, Herve Codina <herve.codina@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Andrew Lunn
 <andrew@lunn.ch>, Phil Elwell <phil@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, kernel-list@raspberrypi.com
References: <cover.1748522349.git.andrea.porta@suse.com>
 <20250529124412.26311-2-andrea.porta@suse.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <mbrugger@suse.com>
Autocrypt: addr=mbrugger@suse.com; keydata=
 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
 PVrr2NoUqi/bxI8fFQJD1jVj8K0=
In-Reply-To: <20250529124412.26311-2-andrea.porta@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 29/05/2025 14:43, Andrea della Porta wrote:
> The RaspberryPi RP1 is a PCI multi function device containing
> peripherals ranging from Ethernet to USB controller, I2C, SPI
> and others.
> 
> Implement a bare minimum driver to operate the RP1, leveraging
> actual OF based driver implementations for the on-board peripherals
> by loading a devicetree overlay during driver probe if the RP1
> node is not already present in the DT.
> 
> The peripherals are accessed by mapping MMIO registers starting
> from PCI BAR1 region.
> 
> With the overlay approach we can achieve more generic and agnostic
> approach to managing this chipset, being that it is a PCI endpoint
> and could possibly be reused in other hw implementations. The
> presented approach is also used by Bootlin's Microchip LAN966x
> patchset (see link) as well, for a similar chipset.
> In this case, the inclusion tree for the DT overlay is as follow
> (the arrow points to the includer):
> 
>   rp1-pci.dtso <---- rp1-common.dtsi
> 
> On the other hand, to ensure compatibility with downstream, this
> driver can also work with a DT already comprising the RP1 node, so
> the dynamically loaded overlay will not be used if the DT is already
> fully defined.
> 
> The reason why this driver is contained in drivers/misc has
> been paved by Bootlin's LAN966X driver, which first used the
> overlay approach to implement non discoverable peripherals behind a
> PCI bus. For RP1, the same arguments apply: it's not used as an SoC
> since the driver code is not running on-chip and is not like an MFD
> since it does not really need all the MFD infrastructure (shared regs,
> etc.). So, for this particular use, misc has been proposed and deemed
> as a good choice. For further details about that please check the links.
> 
> This driver is heavily based on downstream code from RaspberryPi
> Foundation, and the original author is Phil Elwell.
> 
> Link: https://datasheets.raspberrypi.com/rp1/rp1-peripherals.pdf
> Link: https://lore.kernel.org/all/20240612140208.GC1504919@google.com/
> Link: https://lore.kernel.org/all/83f7fa09-d0e6-4f36-a27d-cee08979be2a@app.fastmail.com/
> Link: https://lore.kernel.org/all/2024081356-mutable-everyday-6f9d@gregkh/
> Link: https://lore.kernel.org/all/20240808154658.247873-1-herve.codina@bootlin.com/
> 
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>   # quirks.c, pci_ids.h

What changed in this patch so that you didn't include the Acked-by from Greg 
[1], or is this an oversight?

Regards,
Matthias

[1] https://lore.kernel.org/linux-arm-kernel/2025042551-agency-boozy-dc3b@gregkh/

