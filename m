Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A4E1A23A9
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 09:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738921797; cv=none; b=G53YnJDu85xYfiSnwpp8GFUmOMoFWbcGSbg6ows8PrKJCh0UF35CxV/NCyl34dq24VvRjbk3rVYFB0rieQ66pzeX8qrfILCV7q3ao4i8My7R3GyN/PcMyU/wl4DlpRngz18/ufFVClscI6q1VrB4StmgR17TeWSChyjDuX4fdvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738921797; c=relaxed/simple;
	bh=S4p6LLSLOPSpJE9g1forZYx4llbSsosHafGdaXkcLks=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N/glBzeC437TaaepTbXnLj3B22EXk1bE9Al8djJHfLgROiUaRR60nSlB2Uo3KkuNqPKfCHWhslQWVpm970Fq70T1Qp5AV7nJiQzs9Ij2Fs8G/UImdp576Wx0uUB0A8+MToiapvbku/Q9r9hdJzZIjXLh/Va6/Rbm4xDqMf8/S/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=R0QQ6qqk; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="R0QQ6qqk"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5dcef33eeceso3318347a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 01:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738921794; x=1739526594; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hHxN1cJYA/N06QjEqFReiwPXLdQZSTCuNsi3b9gHzjE=;
        b=R0QQ6qqkuCHyh/Lspg5x220NQrmp3N6wdbNGoWH7PyXNdhvxz4Jbe7NchDCCV30XOR
         4UrnQQ0BAftdo0xjDtYM/BhzjoxDNhCnK34Yghwjgj4YH3Z24bCg8BkDMUE3cBgRNqoW
         IN/BOoMUZKikliYvQvrQhGKp5soXPZt7bLmqMnjeOaoYU/2tpjpLxYXKJbjHw7zOiTqT
         Jb0g9NZP4p3/v2EQoEOMoMl4ILwB4ZGwXP6h8dqQJOw5YWwV47WyQt2MnRb6xO1swpGW
         M+TB33esmktLN3zuHbZ6n5BvKOB6V9Gwuspyo58dC6FTQjuOuV/zfe3lbKR/zWYucP9I
         CxeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738921794; x=1739526594;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hHxN1cJYA/N06QjEqFReiwPXLdQZSTCuNsi3b9gHzjE=;
        b=jKKjioX4b5v/RLotb1/X75rU7gvC4/DkDigArZoei5FNbqjXUmT7DnDwSvV22lyCH+
         nGwbAdFrXZLNi2fLHJmUxW3Oc2qnFPnTbbHQG72MoDYYYrksLiENCgjvCLjfT7N66DGk
         bi1lHsKae/pChfiytdcD7qdBtnHc58qEpbVHeX3ZwTG9rchMW24J7Utc+AUxnUcRJJUK
         1TOPoi5ySeV4y+ZB9/yXqk/RhNUAxtSXj/BCzKSgHRyLphbECErGlMUp6ElwnXgTiLCS
         31Fg/tOE6ewFL8vHljs9Eb6HE97fTyWyYQewkWfuZW6xBl0bL/dKt7fjT7aEURKBNrWz
         d5RA==
X-Forwarded-Encrypted: i=1; AJvYcCWg4giavs3aSTF43oIzzCglLBnRI8Ddzo5cIkq+4b1aTaYjxk8NW3S0rvSQctRKNPpSZLQqs6Zuvc22GMw=@vger.kernel.org
X-Gm-Message-State: AOJu0YywB1cUQPviNA3WvApXWT3AOgiCGkQFukLqwfe42S8cqciaYtW/
	MjAFcjDvlwj4tarxx6GgBPcFMarTJYIjtb7E7C63OlCKbZgOoKFHg4DY1Bn/YgM=
X-Gm-Gg: ASbGncuDWrnaVDMfEcjpuBXSB/qhBzihLNetigGNM4cPS/K1fPafp01fosPvDQm9b5j
	4jF9VFwaQgAgi0ZLqyI4VdDF4IUB+FxLStY3zMoF0aGOp5X+CQT+tCDLxeSICmG3REIlLuAQh0Q
	0ztCaWElwFe6ldX5fEeGsi9kcqoQQufHuF+0oZg+6+YamLBPbq+3qYVeiMA9jU/LzshZDVX2zgk
	YzrzsvF+kIvBuzApmUy3kz6NxmnyQDyV5qKJsTMVXsTpzh3ddfIGRE9DFNuI7KNqdPFTZvKoNaA
	yFWaGM1Z4y8FlM/EKC9jcvBnmMmacKPeddw6nUFgoA+KObua/o64JwzjT54=
X-Google-Smtp-Source: AGHT+IHCzEFvSIhfMGLJjDLN8sAOhYITMeHBywqkNc2QJXqBWAThFj4V/KSvjovgix5IZ8ADaCm//w==
X-Received: by 2002:a17:907:1b27:b0:ab2:f8e9:723c with SMTP id a640c23a62f3a-ab789a9ed0amr257773366b.5.1738921793776;
        Fri, 07 Feb 2025 01:49:53 -0800 (PST)
Received: from localhost (host-79-41-239-37.retail.telecomitalia.it. [79.41.239.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab772fd6ba1sm235401366b.79.2025.02.07.01.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 01:49:53 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Fri, 7 Feb 2025 10:50:52 +0100
To: Bjorn Helgaas <helgaas@kernel.org>
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
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v6 05/10] clk: rp1: Add support for clocks provided by RP1
Message-ID: <Z6XXfL1-ER2dLmZI@apocalypse>
References: <b12caa1c8c674a56afa7b2de780d9ae5423159a3.1736776658.git.andrea.porta@suse.com>
 <20250203234443.GA810409@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203234443.GA810409@bhelgaas>

Hi Bjorn,

On 17:44 Mon 03 Feb     , Bjorn Helgaas wrote:
> On Mon, Jan 13, 2025 at 03:58:04PM +0100, Andrea della Porta wrote:
> > RaspberryPi RP1 is an MFD providing, among other peripherals, several
> > clock generators and PLLs that drives the sub-peripherals.
> > Add the driver to support the clock providers.
> 
> > +#define PLL_PRIM_DIV1_SHIFT		16
> > +#define PLL_PRIM_DIV1_WIDTH		3
> > +#define PLL_PRIM_DIV1_MASK		GENMASK(PLL_PRIM_DIV1_SHIFT + \
> > +						PLL_PRIM_DIV1_WIDTH - 1, \
> > +						PLL_PRIM_DIV1_SHIFT)
> > +
> > +#define PLL_PRIM_DIV2_SHIFT          12
> > +#define PLL_PRIM_DIV2_WIDTH          3
> > +#define PLL_PRIM_DIV2_MASK           GENMASK(PLL_PRIM_DIV2_SHIFT + \
> > +                                             PLL_PRIM_DIV2_WIDTH - 1, \
> > +                                             PLL_PRIM_DIV2_SHIFT)
> 
> Maybe this is standard drivers/clk style, but this seems like overkill
> to me.  I think this would be sufficient and easier to read:
> 
>   #define PLL_PRIM_DIV1_MASK   GENMASK(18, 16)
>   #define PLL_PRIM_DIV2_MASK   GENMASK(14, 12)

Ack.

> 
> > +static unsigned long rp1_pll_recalc_rate(struct clk_hw *hw,
> > +					 unsigned long parent_rate)
> > +{
> > +	struct rp1_clk_desc *pll = container_of(hw, struct rp1_clk_desc, hw);
> > +	struct rp1_clockman *clockman = pll->clockman;
> > +	const struct rp1_pll_data *data = pll->data;
> > +	u32 prim, prim_div1, prim_div2;
> > +
> > +	prim = clockman_read(clockman, data->ctrl_reg);
> > +	prim_div1 = (prim & PLL_PRIM_DIV1_MASK) >> PLL_PRIM_DIV1_SHIFT;
> > +	prim_div2 = (prim & PLL_PRIM_DIV2_MASK) >> PLL_PRIM_DIV2_SHIFT;
> 
> And then here, I think you can just use FIELD_GET():
> 
>   prim_div1 = FIELD_GET(PLL_PRIM_DIV1_MASK, prim);
>   prim_div2 = FIELD_GET(PLL_PRIM_DIV2_MASK, prim);
> 
> It looks like the same could be done for PLL_SEC_DIV_MASK,
> PLL_CS_REFDIV_SHIFT, PLL_PH_PHASE_SHIFT, CLK_CTRL_AUXSRC_MASK, etc.

Ack.

Regards,
Andrea
