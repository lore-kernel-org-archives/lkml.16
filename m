Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF78246774;
	Wed, 28 May 2025 12:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748437072; cv=none; b=aOiyjFW1mSsahXWWnRsypFMW4sXHSYkJ9G7suz1f84V/v1F0r2s4M+6IntT4rfLmwQyKPCnUDgUdVg/31Ge2AO0xBq4KkZpTQbVzOMxYmJDXcGgtp99h0P0rH/+vTcLc0stRzqwxX5RWlfuHqqgdvfg/e3Jm04si2sK4kcdRJwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748437072; c=relaxed/simple;
	bh=WpeZQl5vh0yqYxs+79UsHi2F/aa84sVNJqFa7mJ4Avc=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IB4dNENg1rijFIFUott8/NQbFWj6vBfJiS5AYX5aLHRJivp0+fuD1ilNuKVDbnYY9dGDmoJFuwxJX2pOg/1kzhhqwW00KkaEUn7S8D2VYLgQ+JDJtAKOViiP/ZQ9Om3w5nqms84Rs3RS+KRz40CxVmLrUbA6pbyxd21MFxth0GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZD/wViPJ; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZD/wViPJ"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a36f26584bso2754810f8f.0;
        Wed, 28 May 2025 05:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748437069; x=1749041869; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qz431+WLyrOYjxIXVQx5eCUQ1G5IA4208Qab297D8GM=;
        b=ZD/wViPJNg/FqKxbWpXaB/MW2Vt3Z2mb+ngEhaaRURUbC2HtKoDxDeiMAiqup6AS6D
         wt15zExhb1YZoTd6wn3xvIPT51dmerOpnLOx+9E3duLBi+qebQIGLERs9DyIP8XM7sBj
         d50+qiZqSb61bnI95Dka58D5fNhwvmwMf7Pm3xNMv2ZtJ15Yr9GtuPddNchgvhqlnI5o
         NoCyp7Vkxt/RnHTRmQNX3eeUMtqaGBDjjqJZlCt4za4bsp+FsocuwdQVfpnGXqI5qHuQ
         RxmSqz9rXgbqn40To+GFqM5LDH7pAYSrOW1eg3UZq53J/Q6ZhqNXqZd1J0BjuVYVocqP
         erQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748437069; x=1749041869;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qz431+WLyrOYjxIXVQx5eCUQ1G5IA4208Qab297D8GM=;
        b=R3zlYNbA07qBzg4BjsBZmL9Fzaa/JG/Mc7KcgRUzAYIPcEhHgESDskztU3Ws2BDytg
         baMtI0aRRz8ocnOxAKMi9rRADJRQOXbx52wfaNENDC3ZWQVncc6UcXTzgMxpgK8OKYNf
         RfsIppfgemuiFoKWyb7h2Lb0lwvztzQKb6huc4P3z0sQI+AkooNGduw8gAV+Z9AKQKyD
         no+Ice4Ljvv4Fx7lfVnQ0uqwKJKubM95An4Dx2gYbYtDgYsF7+UbzrMJ7fyJN3AR+t0K
         P1Zl1UnhtMJESeqBCjrQLl4+QVp4XWI1FIkVk8q74jThwKHI8SGnrPxKWDvgCvKLL/aI
         gtYw==
X-Forwarded-Encrypted: i=1; AJvYcCUCbdbg0uxCQpZsuVLURmwl5YXjFGjczv8PJ2wC24EwC97P+LouerPC9jS5L66HqeyJDMf76SEumPaJNm7b@vger.kernel.org, AJvYcCVhW7vvMMhIGukeaRDeG62AUgQ86O37SMs1/mjMLfnojt1uQJCGU/en+/Hk25CFVYJ1afVdmKwlscPO@vger.kernel.org, AJvYcCWCBrDvSWQ2XmNao0RuLCvgyIxKbkdGFFJhrpU01WSnXTnBpicv+OEgOTAHMqIIy3l0sOobX6f20/75@vger.kernel.org
X-Gm-Message-State: AOJu0YwCloU9NTeBZJCrYLrqDfyTP9kfBM+aAdYGiZ7BAPCTU7lY460g
	AZro3C3aBpbkPhf1oZUxhG3lI6Z8vgj/clbR27XuDdZqEgtuWrd4NgzX
X-Gm-Gg: ASbGnctAxS2n8S4W0HoJAlwhh9fx29asN2UVtBDQjJ3p84UpsW7arcgqnkkDRbQ5WxV
	b6c9b2dh2Fjz9DhzlVcG6Ug6sxYyv8vh4waL3Cb1XOfBrmJySyvjiXkz608yLb0VMnFI8jZLU8F
	m2stwbw2XUedqZF1UaNWhOkR16PhrRjpPq5sx3LB+hi0kuReDpkpzM2O5sVMNY0Ka5yFB+y0l3k
	FQ93V72xyw2dV09X4879YbAgVKgAVeJ+Vx49qdXnb/NpID/LcO0u4CURBhqMDFycgsyz33DG5Kv
	lomJ/qzWPoZbn2abWPF+3gfgJigzE4j6TrCJhwPpjfjum5XtbZTAUB121m7G9jrVEZ+5JOLRK/Q
	+FzCnnjI=
X-Google-Smtp-Source: AGHT+IEl/pHPv7vigoqckP9ECM+urkLDQK2RF8IW0Ah4JbrbzZh1z1Et6i/TKjhKBeupCdDcJQ72Aw==
X-Received: by 2002:a5d:584c:0:b0:3a4:d452:fff with SMTP id ffacd0b85a97d-3a4d45211edmr11122707f8f.17.1748437068809;
        Wed, 28 May 2025 05:57:48 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4eac6e615sm1446608f8f.19.2025.05.28.05.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 05:57:48 -0700 (PDT)
Message-ID: <6837084c.050a0220.1e474f.3f20@mx.google.com>
X-Google-Original-Message-ID: <aDcISot-sCztcyqa@Ansuel-XPS.>
Date: Wed, 28 May 2025 14:57:46 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] dt-bindings: clock: airoha: Document support for
 AN7583 clock
References: <20250528004924.19970-1-ansuelsmth@gmail.com>
 <20250528004924.19970-5-ansuelsmth@gmail.com>
 <f9aebfb8-6312-45db-be12-94580ad412cb@kernel.org>
 <6836cf62.5d0a0220.35d0aa.2025@mx.google.com>
 <969c42d7-0a40-4daf-a074-f2713d0d0412@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <969c42d7-0a40-4daf-a074-f2713d0d0412@kernel.org>

On Wed, May 28, 2025 at 01:56:54PM +0200, Krzysztof Kozlowski wrote:
> On 28/05/2025 10:54, Christian Marangi wrote:
> > On Wed, May 28, 2025 at 09:30:37AM +0200, Krzysztof Kozlowski wrote:
> >> On 28/05/2025 02:49, Christian Marangi wrote:
> >>>    - if:
> >>>        properties:
> >>>          compatible:
> >>> @@ -75,6 +78,17 @@ allOf:
> >>>          reg:
> >>>            maxItems: 1
> >>>  
> >>> +      required:
> >>> +        - reg
> >>> +
> >>> +  - if:
> >>> +      properties:
> >>> +        compatible:
> >>> +          const: airoha,an7583-clock
> >>> +    then:
> >>> +      properties:
> >>> +        reg: false
> >>
> >>
> >> No resources here, so this should be part of parent node.
> >>
> > 
> > Ok hope you can help here. This is another case of "MFD" thing.
> > 
> > I was with the idea that it was O.K. to use this with very different
> > devices. (current scenario Clock controller and MDIO controller)
> > 
> > The node structure I had in mind was
> > 
> > 		system-controller@1fa20000 {
> > 			compatible = "airoha,an7583-scu", "syscon", "simple-mfd";
> > 			reg = <0x0 0x1fb00000 0x0 0x970>;
> > 
> > 			scuclk: scuclk {
> > 				compatible = "airoha,an7583-clock";
> > 				#clock-cells = <1>;
> > 				#reset-cells = <1>;
> > 			};
> > 
> > 			mdio {
> > 				compatible = "airoha,an7583-mdio";
> > 				#address-cells = <1>;
> > 				#size-cells = <0>;
> > 
> > 				mdio_0: bus@0 {
> > 					reg = <0>;
> > 					resets = <&scuclk AN7583_MDIO0>;
> > 				};
> > 
> > 				mdio_1: bus@1 {
> > 					reg = <1>;
> > 					resets = <&scuclk AN7583_MDIO1>;
> > 				};
> > 			};
> > 		};
> > 
> > But you want
> > 
> > system-controller@1fa20000 {
> >         compatible = "airoha,an7583-scu", "syscon";
> >         reg = <0x0 0x1fb00000 0x0 0x970>;
> > 
> >         #clock-cells = <1>;
> >         #reset-cells = <1>;
> > 
> 
> mdio could be here just to group the bus (it's pretty common I think),
> although not sure if compatible is useful then.
> 
> >         mdio_0: bus@0 {
> >                 reg = <0>;
> >                 resets = <&scuclk AN7583_MDIO0>;
> >         };
> > 
> >         mdio_1: bus@1 {
> >                 reg = <1>;
> >                 resets = <&scuclk AN7583_MDIO1>;
> >         };
> > };
> > 
> > Again sorry if this question keeps coming around and I can totally
> > understand if you are getting annoyed by this. The reason I always ask
> > this is because it's a total PAIN to implement this with the driver
> > structure due to the old "simple-mfd" model.
> 
> ... and Rob was saying multiple times: be careful when adding
> simple-mfd. If it bites back, then I am sorry, but everyone were warned,
> weren't they?
> 
> What is exactly the pain anyway? You cannot instantiate children from
> SCU driver?
>

Answering below since they are related.

> > 
> > (as again putting everything in a single node conflicts with the OF
> > principle of autoprobing stuff with compatible property)
> 
> I am not sure if I follow. What principle? Where is this principle
> expressed?
> 
> And you do not have in your second example additional compatibles, so
> even if such principle exists it is not broken: everything autoprobes, I
> think.
> 
> > 
> 
>

The principle I'm talking about is one driver for one compatible.
(to be more precise excluding syscon compatible that is actually
ignored, if a driver for the compatible is found, any other compatible
is ignored.)

This means that declaring multiple compatible as:

compatible = "airoha,clock", "airoha,mdio"

doesn't result in the clock driver and the mdio driver probed but only
one of the 2 (probably only clock since it does have priority)

The "simple-mfd" compatible is just a simple compatible that indicate to
the OF system that every child (with a compatible) should be also probed.
And then automagically the driver gets probed.

Now the ""PAIN"" explaination. Not using the "simple-mfd" way with the
child with compatible and putting everything in the node means having to
create a dedicated MFD driver that just instruct to manually probe the
clock and mdio driver. (cause the compatible system can't be used)

So it's 3 driver instead of 2 with the extra effort of MFD driver
maintainer saying "Why simple-mfd is not used?"


There is a solution for this but I always feel it's more of a workaround
since it doesn't really describe the HW with the DT node.

The workaround is:

		system-controller@1fa20000 {
                        /* The parent SCU node implement the clock driver */
                        compatible = "airoha,an7583-scu", "syscon";
                        reg = <0x0 0x1fb00000 0x0 0x970>;

                        #clock-cells = <1>;
                        #reset-cells = <1>;

                        /* Clock driver is instructed to probe child */
                        mdio {
                                compatible = "airoha,an7583-mdio";
                                #address-cells = <1>;
                                #size-cells = <0>;

                                mdio_0: bus@0 {
                                        reg = <0>;
                                        resets = <&scuclk AN7583_MDIO0>;
                                };

                                mdio_1: bus@1 {
                                        reg = <1>;
                                        resets = <&scuclk AN7583_MDIO1>;
                                };
                        };
                };


But this really moves the probe from the simple-mfd to the clock driver.

So it's either 3 solution
1. 2 driver + "simple-mfd"
2. 3 driver + PAIN (due to MFD required driver)
3. 2 driver + not very correct DT node structure

Maybe option 3. is more acceptable?

The SCU node is mainly clock + reset controller and the MDIO bus is an
expansion of it?

Hope the long explaination makes sense to you (especially about the
OF principle thing)

--
Ansuel
