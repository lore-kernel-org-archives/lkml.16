Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABEC28DB70
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 13:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747142703; cv=none; b=GEKpSOeh6qo0sYG+viM464Ixvo28MfYkfeRGvslfx/GuqCVMqtPBoHqhQ/Yr44WDFfJXFEMS3KjR26HAHzTvsPKsp/4hUklDwQKn8a3ck9cE4eS5JV2lLcjoFTHkch4Xswi5qDfijP6QB/kerKJXmx4B+vDj/2hvuz/5eHsGqck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747142703; c=relaxed/simple;
	bh=N0ripQ5H0a0+OPx4XMmmy6T70fq0AJ7PIXNGwmLij7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kB9aeIDpIjhdLGedy5Y9cmogz6fe7qnz4G0hyGaxclRSTLCUzjCAKi3qbZvraxzzJ9b1JBqZIpLXp4yAFkpA6WTeEZgNBF9GJZum2xl8zGOYLRoZXd3bIhqBT9lVLJc4jjNmcaw0elejkfUNl3Az9ezAz1eK//Pvl+8SZfb6gxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IFMyIWyQ; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IFMyIWyQ"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ad21a5466f6so807902366b.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 06:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747142700; x=1747747500; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CVXXOZH7f0B33E9l5ZVHSDML8IjUVWi8Sv90AwCRorg=;
        b=IFMyIWyQqTJFPT5nK+4ZpLRWhzsIh2YGXaH6M76gjm7mLxfz3vmpAdd0X+qI8ufEQn
         QBN8N68jlMrWWlIVQdKWCrGEOeJAiXWqZ40p7JB8u61Ml3AWAIn23L4zPCldjBTTZTAK
         fZcVkZwTISsXa7ouP5DLrg2s4nZt+XZ72n+I4XzHmmCP6xlMU5SJ8K4Kwn/Sz9eRbA3M
         wPuBxpoGKhbLBkwYoPL2XU6tzWDxWZkro5zW5t55x5sbmF17hFA95kZ6gU9V49saqHuq
         3zSHK9mnr08nk152EnfBfas++WtOkwRGW5vEFYLHa1BFW0O+O4t0HWHm4bEn025tnDu2
         HeRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747142700; x=1747747500;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CVXXOZH7f0B33E9l5ZVHSDML8IjUVWi8Sv90AwCRorg=;
        b=gIfZZ2tnm+Q5T6oRYDEe2IJITxi/CDIZ2R65pbIEmB/Vt48yQf2ojg7bFEEh/bQw/N
         NsX+PnmbjzjzEigMYoWxRPNenzi2xTFXYooqvF+ljmtNM+GcXUVl90p+12Pc50M2pqF0
         3g1kg+dWwWST8c5/HFNyMzTOdcavisookMslTnZahP/c9I/USVZf1fm6yDsDlslX7a2u
         /PDXJpaqaoxlgyF9ebcj5+HU4NeLCK7Cd6N+PRgbC68wPRY2VBggcfwwWxUhrsNp73dY
         Y9iCTNxsXkyMkrLhLd6HkegrxkNu7TeIOc9aUaed4xK/LrKUg+o1NIsuPY4n4Z7hnFxE
         2kYA==
X-Forwarded-Encrypted: i=1; AJvYcCUiwgGwrH6ktSpVzpRGRvrWkaiSx9O1djy28/+tX14EGcM8KBVBfSCICzv3OG+UW2sk2mDuexqcYsApMYc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbK25P0oCU2MmQsMAcyRX0k6S+WOiQmR9yVkXSJIvPie2OH+fE
	D68yefx/Ih2BRUSubIVBUaXJ42TRQBHUdnuiwze5T9UUnX+fs6CUpjieY6L8S1E=
X-Gm-Gg: ASbGnct6uMmb4Phcy+aya6TdAzZD1L0AF1OGj5a6lCsyzAblsy2znU5FhIr16CAsPV3
	WVnZyX3uMMOVsUrHjl0mBNnUfnpm+PSgVfuZFJIe5WClDHGnsR/lIqB0E1j6Xq6EF4qMB/zfohm
	F2T9F9Er9KjHxK2o0jDPcQG6LSJXEKARNFqxoaekx+nyfHI9dg+l7zrLRhUqH4NltTvSKWvWW+h
	lGddAjx28GzOMBr9+sHEGrOdMbT6Soo00EGg3MQsSE0klc9tnrhxsYGxNNN05iMrv+J23CkCCER
	fBTQ0vKqj5PaqgRnaZ7aVRyKIxJCJ7A496Fzs8a/rMfjtBHnCn2FOOmEWK8=
X-Google-Smtp-Source: AGHT+IH4q71GfWDFPWIs43SZZ2VdNWpSIEScBi0c6x4nUnbwHEPiOXUunt+jRyisi7xmv6r4dIDz9Q==
X-Received: by 2002:a17:907:7e84:b0:ad2:3d34:e2a7 with SMTP id a640c23a62f3a-ad4d4e211abmr343040266b.14.1747142700043;
        Tue, 13 May 2025 06:25:00 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2198505fdsm774854166b.168.2025.05.13.06.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 06:24:59 -0700 (PDT)
Date: Tue, 13 May 2025 16:24:57 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Cc: Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>, Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v12 16/19] dt-bindings: clock: imx8m-clock: add PLLs
Message-ID: <aCNIKZrJmbpmeX+7@linaro.org>
References: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
 <20250424062154.2999219-17-dario.binacchi@amarulasolutions.com>
 <20250509162546.GA3704130-robh@kernel.org>
 <CABGWkvq4a73hvCWG-P_+arc3R-pnr5NVfcGPDTGEoW1doPt2qg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABGWkvq4a73hvCWG-P_+arc3R-pnr5NVfcGPDTGEoW1doPt2qg@mail.gmail.com>

On 25-05-09 20:22:18, Dario Binacchi wrote:
> On Fri, May 9, 2025 at 6:25 PM Rob Herring <robh@kernel.org> wrote:
> >
> > On Thu, Apr 24, 2025 at 08:21:46AM +0200, Dario Binacchi wrote:
> > > Though adding the PLLs to clocks and clock-names properties will break
> > > the ABI, it is required to accurately describe the hardware. Indeed,
> > > the Clock Control Module (CCM) receives clocks from the PLLs and
> > > oscillators and generates clocks for on-chip peripherals.
> > >
> > > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > >
> > > ---
> > >
> > > (no changes since v11)
> > >
> > > Changes in v11:
> > > - Fix conflict while rebasing on master
> > >
> > > Changes in v7:
> > > - Add 'Reviewed-by' tag of Krzysztof Kozlowski
> > >
> > > Changes in v6:
> > > - New
> > >
> > >  .../bindings/clock/imx8m-clock.yaml           | 27 ++++++++++++++-----
> > >  1 file changed, 21 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
> > > index 4fec55832702..e83f08abd44c 100644
> > > --- a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
> > > +++ b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
> > > @@ -29,12 +29,12 @@ properties:
> > >      maxItems: 2
> > >
> > >    clocks:
> > > -    minItems: 6
> > > -    maxItems: 7
> > > +    minItems: 7
> >
> > Increasing the minimum entries looks like an ABI break to me. The .dts
> > files not being in linux-next confirms that (from 0 warnings in
> > mainline):
> >
> > arch/arm64/boot/dts/freescale:859:50
> >     122  clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
> >     120  clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
> >      61  clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
> >      61  clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
> >      60  clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
> >      60  clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
> >      36  clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[35], [36], [37], [38], [39], [40]] is too short
> >      36  clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[24], [25], [26], [27], [28], [29]] is too short
> >      32  clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[34], [35], [36], [37], [38], [39]] is too short
> >      28  clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[22], [23], [24], [25], [26], [27]] is too short
> >      26  clock-controller@30380000 (fsl,imx8mn-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
> >      17  clock-controller@30360000 (fsl,imx8mq-anatop): 'clocks' is a required property
> >      17  clock-controller@30360000 (fsl,imx8mq-anatop): 'clock-names' is a required property
> >      14  clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[44], [45], [46], [47], [48], [49]] is too short
> >      14  clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[23], [24], [25], [26], [27], [28]] is too short
> >      13  clock-controller@30360000 (fsl,imx8mn-anatop): 'clocks' is a required property
> >      13  clock-controller@30360000 (fsl,imx8mn-anatop): 'clock-names' is a required property
> >      12  clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[26], [27], [28], [29], [30], [31]] is too short
> >      10  clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[38], [39], [40], [41], [42], [43]] is too short
> >       8  clock-controller@30380000 (fsl,imx8mn-ccm): clocks: [[22], [23], [24], [25], [26], [27]] is too short
> >       8  clock-controller@30380000 (fsl,imx8mn-ccm): clocks: [[20], [21], [22], [23], [24], [25]] is too short
> >       8  clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[34], [35], [36], [37], [38], [39]] is too short
> >       8  clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[28], [29], [30], [31], [32], [33]] is too short
> >       8  bcrmf@1 (brcm,bcm4329-fmac): $nodename:0: 'bcrmf@1' does not match '^wifi(@.*)?$'
> >       6  clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[41], [42], [43], [44], [45], [46]] is too short
> >       6  clock-controller@30380000 (fsl,imx8mn-ccm): clocks: [[24], [25], [26], [27], [28], [29]] is too short
> >       4  clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[43], [44], [45], [46], [47], [48]] is too short
> >       4  clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[40], [41], [42], [43], [44], [45]] is too short
> >       4  clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[36], [37], [38], [39], [40], [41]] is too short
> >       4  clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[35], [36], [37], [38], [39], [40]] is too short
> >
> > Please fix the binding or drop what's been applied so far.
> 
> Abel and Shawn are already aware of the issue:
> 
> https://lore.kernel.org/all/CABGWkvqfyH=dcuw6EDZaFVVebj8SZhJF0P944+mmzL5YK3-Pug@mail.gmail.com/

So Shawn suggested I pick up the dts patches from this series as well.

I'm waiting for another -next to get merged and if there are still
issues, I'll ask Stephen to ignore the pull request I already sent.

> 
> Thanks and regards,
> Dario
> 
> >
> > Rob
> >
> 
> 
> -- 
> 
> Dario Binacchi
> 
> Senior Embedded Linux Developer
> 
> dario.binacchi@amarulasolutions.com
> 
> __________________________________
> 
> 
> Amarula Solutions SRL
> 
> Via Le Canevare 30, 31100 Treviso, Veneto, IT
> 
> T. +39 042 243 5310
> info@amarulasolutions.com
> 
> www.amarulasolutions.com
