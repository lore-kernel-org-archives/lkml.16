Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD20A226161
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 13:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748525314; cv=none; b=WuQDuarXyygaPylZASyWq3YlyT2gJ1u3kKCZ5khsHWTS5yOrRyWWXzGrHZ5lAHosWy6RNomlC/Kx6jPYEu7hM4CkuAuitA5rfQxiLuUD5fzpF+/BztfpC0tv57wKOXwVqmuvnqdVPzsSBs6SPBq13SO+CNThaZRzN40LFhGG6Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748525314; c=relaxed/simple;
	bh=dxaIdhwkxrcOH7PEuve5FxQGB0PHBCUqWE1E/dvQymc=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TgYZVA25hnL3tBHqfEJ8q/IxAieTPZlIahOnZOAgVp8TPy1AllMSHhDKn11NrC2iKiLKfW0/Y4R5rPEr0i/o18jw5erdfsT5GbE6PRGmz05G4RjoEwHcfkBh8AuJU/94Xuqw21Gq6ydRw3FSsVQJTEqVm3FgQTEUtumdtwiVN/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=A3v8zUXn; arc=none smtp.client-ip=209.85.208.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="A3v8zUXn"
Received: by mail-ed1-f67.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9ebdfso1626201a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 06:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748525310; x=1749130110; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1kiFDdDACgorTtuRk6Gy6UOaoSPvn2tyJrIu3RsE3v0=;
        b=A3v8zUXnzauQLe9ygE6mTbuXx1BUCCXTZaNjNvsVuhlJM4xdoOkcJZVNMEHC21WEDR
         oMYMuh6MVkOPh3tuPnDWs1noaLEPe2ioTEJQXn8E1p9L6RasaWKK9QHPk/ln0EOk09fN
         VEx08SFJHeYBdvO6QuKBXlyJjwNfITKmr6qnoyTsioaxGdxDwrFLHXfumzowGdqWBusE
         7oBr8AhYUM8JSI3APz2CfNeUkn2LfQyQWloaj7yEPiqWTooDA62nUc0Fr0ue6wnz1PoK
         GCoULDD35NKBw87W4rVdP8ZADod79bcKFVf9+VFckjV5RhFS/xJKOon8BlGh7AWeBprf
         m1gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748525310; x=1749130110;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1kiFDdDACgorTtuRk6Gy6UOaoSPvn2tyJrIu3RsE3v0=;
        b=fROI5mNMw/IyA20/dmMZAyAkv1slf3pJE7N5DyMKh9M4t25MuZtmNq1fLrjxfFbTW8
         NbPJ4Om15S9WLCcri7wdVciNN9KeL9BqzT22jw770yOnZnLaQ+EA2rpNlwJQJ9UoQHEt
         0K6EEXKSX+oPMAloZsTot6HnVUzpCGprYg3nRcfWKYB5HMwlRJJorM2J1mco5jGNqaDI
         CakE5Qx4Gmi5QbSzL8fLQr4VyoVwLQwl0FjGoexTo/Oce37BGA2i9Kfo+7q9XEyS3AIl
         z0Uji44p3Q1HLX/ZxE/0KJ3sBOufq34siVvUMJUnJILRospAsibWM3yTUulg3/sRoiMr
         MxRA==
X-Forwarded-Encrypted: i=1; AJvYcCU6BJGef+akXWgvfe3ZVXqbbxacK5pCuktcAgZX6oQQRPFjBBAL0WelXm57lYIze4xQ6a7zVoQ9Gk1Q+YQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5dteMocuC65KkZCrEpYDltReh+oyRNKm3XzUkVMmZDRMVktHT
	7mA1sy2exQnCT7PaiuZkVc286+7sN+TP2c0ZacSlpfr6u6i6ZQVRbmfDzSiXFjYKl8k=
X-Gm-Gg: ASbGncu0StokoIaU6O1j1ijPKDJdzw5yw2OoHfN3GQ+QN5dTlsCbKVTmhoFQm4LzlrT
	IDKnJuWooHzZFQRZKnOokMkmAeTfJHrhQKpOwN+wUBk8HVp4HMl1KM3xMRn29l3PAIo6gMEiHEZ
	RBo/L9iPqTwTOahVzDY5QWQL+1ArJmu1o8VWiILXQ+Q7vfVhrTw2GiqBlbUoasrkMMszBC4KIUL
	J/+JA6GnAxi1rQqS5GnJZlNY+Hwf7Q9Wg47hUIdGXoFK/eaHKeiKmFeCbQMIezmzFi9w41pvW33
	uLd5qZFqz4wYza0PVd36LUHmhnWQMNlQekrZZnS+I1hIHurULLUXFZdmTgnZmdPfrlvwG27yaKh
	rhkLohti0QNr9BuslnyfQIhd0xWPAluNq
X-Google-Smtp-Source: AGHT+IHK4Y7PatnxnQUlnLwZj15PpOrDfyPqPLYipWAui/kq0fXHKQv8bz76vrMm7M/L8eA7f812UQ==
X-Received: by 2002:a05:6402:27c6:b0:5fc:954e:bd4f with SMTP id 4fb4d7f45d1cf-602d906bc1amr16501831a12.8.1748525309931;
        Thu, 29 May 2025 06:28:29 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6051d5d9587sm2364236a12.15.2025.05.29.06.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 06:28:29 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 29 May 2025 15:30:04 +0200
To: Matthias Brugger <mbrugger@suse.com>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>, Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com
Subject: Re: [PATCH v11 07/13] misc: rp1: RaspberryPi RP1 misc driver
Message-ID: <aDhhXF_MNn34Bu2N@apocalypse>
References: <cover.1748522349.git.andrea.porta@suse.com>
 <20250529124412.26311-2-andrea.porta@suse.com>
 <bdd3fe2f-28eb-4c85-99b2-7220cb15b9bc@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bdd3fe2f-28eb-4c85-99b2-7220cb15b9bc@suse.com>

Hi Matthias,

On 15:24 Thu 29 May     , Matthias Brugger wrote:
> 
> 
> On 29/05/2025 14:43, Andrea della Porta wrote:
> > The RaspberryPi RP1 is a PCI multi function device containing
> > peripherals ranging from Ethernet to USB controller, I2C, SPI
> > and others.
> > 
> > Implement a bare minimum driver to operate the RP1, leveraging
> > actual OF based driver implementations for the on-board peripherals
> > by loading a devicetree overlay during driver probe if the RP1
> > node is not already present in the DT.
> > 
> > The peripherals are accessed by mapping MMIO registers starting
> > from PCI BAR1 region.
> > 
> > With the overlay approach we can achieve more generic and agnostic
> > approach to managing this chipset, being that it is a PCI endpoint
> > and could possibly be reused in other hw implementations. The
> > presented approach is also used by Bootlin's Microchip LAN966x
> > patchset (see link) as well, for a similar chipset.
> > In this case, the inclusion tree for the DT overlay is as follow
> > (the arrow points to the includer):
> > 
> >   rp1-pci.dtso <---- rp1-common.dtsi
> > 
> > On the other hand, to ensure compatibility with downstream, this
> > driver can also work with a DT already comprising the RP1 node, so
> > the dynamically loaded overlay will not be used if the DT is already
> > fully defined.
> > 
> > The reason why this driver is contained in drivers/misc has
> > been paved by Bootlin's LAN966X driver, which first used the
> > overlay approach to implement non discoverable peripherals behind a
> > PCI bus. For RP1, the same arguments apply: it's not used as an SoC
> > since the driver code is not running on-chip and is not like an MFD
> > since it does not really need all the MFD infrastructure (shared regs,
> > etc.). So, for this particular use, misc has been proposed and deemed
> > as a good choice. For further details about that please check the links.
> > 
> > This driver is heavily based on downstream code from RaspberryPi
> > Foundation, and the original author is Phil Elwell.
> > 
> > Link: https://datasheets.raspberrypi.com/rp1/rp1-peripherals.pdf
> > Link: https://lore.kernel.org/all/20240612140208.GC1504919@google.com/
> > Link: https://lore.kernel.org/all/83f7fa09-d0e6-4f36-a27d-cee08979be2a@app.fastmail.com/
> > Link: https://lore.kernel.org/all/2024081356-mutable-everyday-6f9d@gregkh/
> > Link: https://lore.kernel.org/all/20240808154658.247873-1-herve.codina@bootlin.com/
> > 
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > Acked-by: Bjorn Helgaas <bhelgaas@google.com>   # quirks.c, pci_ids.h
> 
> What changed in this patch so that you didn't include the Acked-by from Greg
> [1], or is this an oversight?

Nothing really, just an oversight. Thanks for spotting that out. I will resend V12
with it as I also notice that are some inconsistencies with mail Message-id, as a
result of subseqeunt invokation of git-format-patch from different branch.

Thanks,
Andrea

> 
> Regards,
> Matthias
> 
> [1] https://lore.kernel.org/linux-arm-kernel/2025042551-agency-boozy-dc3b@gregkh/
> 
