Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738C418F2FC
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 09:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743412832; cv=none; b=WXEgQPpXp6g1G58iQWwFtAfiFzl4r5I4p32d6SshiC9QrA0y6OU47Wv37KspU59R38CD5pSYekXUQS/vGDrjIHtubsqBQGN3q12IMDYP+r6FIdCMT5ybaG/fTi6dQJQRgzVDrVKMgLM9QSKV02068MIrMYq+xX/L6I054rSUrHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743412832; c=relaxed/simple;
	bh=FH4g3fvpXV3lHKpvSvhwmjnLhb7FANS7ey999xYBE4E=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=egS2O+yk5YEw1+fkZCoSahSCDroGQRcbPMUCeHzIXcePYw0f9FVTdKFwj47vV01n2zs0e4rxRNjWqGDBnMIdxqHqTaSYkGEhv3x2Y+EJbWj6EFugfo8JLZFV9tpBVb0dR0YYSoWTAjP4l8r1igNT6R30afpo5EhF23ASYeDoWg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=KRiVozBi; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KRiVozBi"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5ed1ac116e3so7170026a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 02:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743412829; x=1744017629; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vkzLnbFVOYDObQyUvRiCdFcMVyW9LHfEzzCWp7sSsRM=;
        b=KRiVozBiaD6Kw3Pe2tHxOX3+sF2WPnMfxe0qGzETpUM24tWd+QSYBSVGbtoOH+Lf/v
         +R3mO75sLVqqRD1xFpXQBHW4As8vEdAEylmTBrkzoqpnk1WNOkCUbSDImGqk3izW2ANz
         tpjuW/L7I/Objb1MWNXG7mK+GkgoscDi/8K8Kc4Wa2wT8y2qo8sBAeDxWPxXfQOgV9Y9
         KB6/5qy/9zWilcUFunTXHLVUZZF7mkz6b8+Z8VRVXHyXiTxn5bWvs+3dkYKuZw5rltDU
         A0BfzLCeqaYRDnGdUiq7KSGZUsrjwJnRQGSyLmEcJ61kaI7wvFyb9YEnXfI9EgO+iyE2
         sMfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743412829; x=1744017629;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vkzLnbFVOYDObQyUvRiCdFcMVyW9LHfEzzCWp7sSsRM=;
        b=PXfZ+cKWX+ZaEwjmMqC155S68ia/M5rLfeI2lJu5UGf4YyUKeMxBz3WnPWQsSJBSlU
         +HrCfW0xtgh1IgTGmWDQeadaXNKI//EGs0cEcMfFztQgnRGP5xzjXpde51rE71zU/lt3
         EIAp4Iwca/DR4UbuBRIyairyJUrXadUJ2+xyLYF2iVcIqlRibHURWKImCuCKTj8ZcdPQ
         /YTyPv92Q/mnjeAm3MKKL9Rw/bra6Zkd4rqu3vbq6dcSAkCP4kEO+6bL2oPxrBj3vxv1
         Rg3Ap9v6iN7MBdViAJPtY09eHNAhGUaAqOqDvFxJ6VjFCfX/8ZzrzwZKx2mXaJNOdMex
         FuVA==
X-Forwarded-Encrypted: i=1; AJvYcCXa/4qNHuAh2kzfIal7jY0zmIGnAx7R2d6YxNfkL7xB4biPTD8iplfkeVchIL+qy4VIcQEHiFGMRUyrY6M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcsx5KFoPYiocvGem6mNP/QB+ABi8iGQvz1rysqu45MbOCnnCb
	/L248MTpkqqg9CkIXW31L9TAw108XePCA3+xmV8zVgu8ZkmALo5jBzpHF8F5SHQ=
X-Gm-Gg: ASbGncubphBsqpf4PmYkxFUmvqFSJhZCxR3ULldBZOlWFMEEuBBGaNwbDJgseWI/kyt
	VzU8pp5ar1zpr+RugIVHSY9xJ+pp6PL1ejUVO7rAwI1Nw/GXi5tQDnCDV7tsmrVrRW19jx48sb6
	LCsuCVMs90GODE2G3lJH3h9aCDsMGDqT5rxSfaE8NEQGtR9/x0TnLX9eQp9tnc46WxnA5FCPkDn
	7xEWq4jmLKfdwvaciBiypBbZNVRhpIP69zljHebLrXKy75jOlpK9cSRS8ymWD32nLXBM0MzeBJE
	HCKK/xq06XYGAMEPrDdzMfwUJAG4e1FO+wE9T9BWMIC4YyEFck2izqaf6pYiOHl3EfAE5QZh6oC
	soUVrgqbgggBLqxTh2vFw19I=
X-Google-Smtp-Source: AGHT+IFw4ZQBM4RCOBDHsaOKEO0WJ/K/tqyXI3QtId7X55gIJKhmKgjgqUxtnj7DaAzH7tFUE8PTlQ==
X-Received: by 2002:a17:907:8686:b0:ac3:ef11:8787 with SMTP id a640c23a62f3a-ac738b910e3mr830432866b.54.1743412828665;
        Mon, 31 Mar 2025 02:20:28 -0700 (PDT)
Received: from localhost (host-87-5-222-245.retail.telecomitalia.it. [87.5.222.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7192f0c66sm591000666b.78.2025.03.31.02.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 02:20:28 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Mon, 31 Mar 2025 11:21:45 +0200
To: Krzysztof Wilczynski <kw@linux.com>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
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
Subject: Re: [PATCH v8 08/13] misc: rp1: RaspberryPi RP1 misc driver
Message-ID: <Z-peqcNpvIbKa1MT@apocalypse>
References: <cover.1742418429.git.andrea.porta@suse.com>
 <3fbc487bc0e4b855ffbee8ed62cfb6bf3b0592e8.1742418429.git.andrea.porta@suse.com>
 <20250323114945.GD1902347@rocinante>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250323114945.GD1902347@rocinante>

Hi Krzysztof,

On 20:49 Sun 23 Mar     , Krzysztof Wilczynski wrote:
> Hello,
> 
> Thank you for sending new version.  Appreciated.
> 
> > +	case IRQ_TYPE_LEVEL_HIGH:
> > +		dev_dbg(&rp1->pdev->dev, "MSIX IACK EN for irq %u\n", hwirq);
> > +		msix_cfg_set(rp1, hwirq, MSIX_CFG_IACK_EN);
> > +		rp1->level_triggered_irq[hwirq] = true;
> 
> [...]
> > +		if (!irq) {
> > +			dev_err(&pdev->dev, "Failed to create irq mapping\n");
> > +			err = -EINVAL;
> > +			goto err_unregister_interrupts;
> > +		}
> 
> A small nitpick: "IRQ" in both of the above.  Not a blocker, though, so
> feel free to ignore this feedback.

Ack.

Many thanks,
Andrea

> 
> 	Krzysztof
