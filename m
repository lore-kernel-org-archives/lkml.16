Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E5919F10A;
	Fri, 30 May 2025 15:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748618776; cv=none; b=Khr2cIdaqKc3suHx5oJz1kRpiFXe2PzOBAhOHAPU7TbjtNBUEjmC/YOvz3QKx7ymXs72fGqgg8HUrrw3mYlvAbxnjUcpM9bYpSInO5UdMzMWrfs5FiEOJ8znycn1hBZZDq5WfjEw9gAGsn2DdZm3XmxrHQDrkrr0zzh09TBx0XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748618776; c=relaxed/simple;
	bh=X+A6sN2Cu6MexSl/k85p7tfNzgzwJHKk7KlRYE70G+s=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CgJphzwLdUBXemlAo+EbP2qluw6kkYNTPBMXHXmK/ZVsqOVCZKOKA85J0bzdBrLkHDW57RF4XLtl1CY3+6iwBqceKlF8evJ0BWxWhuPhsEbLMHjj5phqXOzIlbXZuT7WNNwJVmaKX2Pfth4aj2EQjMMVuyLT5bkoSpVKqJErxxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nbLYHaNK; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nbLYHaNK"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-450ce3a2dd5so17977795e9.3;
        Fri, 30 May 2025 08:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748618772; x=1749223572; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yYryqyr161Q3K9eKpQ7wIbwd1d9yYGcsFmdpEAv/dHc=;
        b=nbLYHaNK2tDcxIsZcK2S93OCRou3JdmJyX0/XyCKVzKVZdXTbvdU02HwnBh7ZXrV8J
         Smk6U0FfcKvTNp5qdQowzkuO0wUVIZviJaJ0sZlo3dyOhOJrDKPoukYXM1y706/aICkV
         SWiTp6/0kfJaGXSp74DPPap5xXgzbYeltwjSZgM8Tewhbe2CSSLp5sG4YpkCOywGyDEK
         2jbCeZ3C0IwmOONHtnnMnmYIhzK2HaHqvWgfPpZawesEDIF6tIHyJAKoUE4+6zWNRW3X
         5Yn4o4WsvowzXp5swqiYPu3Mv7QJsRhhcwAlo1jCvK3MaaeqiPjlu30DANdpU/N+UduD
         3zQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748618772; x=1749223572;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yYryqyr161Q3K9eKpQ7wIbwd1d9yYGcsFmdpEAv/dHc=;
        b=NBLD3R8UGEEtYp3dH+15IAexUL+c/9fhF+6/2dz55frAFjgyLZsHwm2UxfhBilp2QX
         tr+tKW09oG/LXDof9VNI8Wd6ny+fVXjUytgBoUTbzPYYfbyehpVuGUWrrkTXNial+ewa
         AwCbymxVQvNKsRx41+3lVRs0sUGBdRyya+8QJHD2hfylq4ioxoBpVpVp6a6O8EA7bYeU
         5/WHtALGjLQUWYLX2Go1x6mF5NbGPjMj5L/g5PLV0FV3JhdTy67xiAiCp4XyWO7GNTmK
         V69Cxwqxtp+gYkD07m8AuQT65ehM4i4iTKTb31mWAhVSTv1Pix2A5jfsTA3u4PbKe4r7
         sQXw==
X-Forwarded-Encrypted: i=1; AJvYcCUHNwjfiafi5Sj1k3//B/2gz05tT7NoKqQGP11HQ5WaaVA4A4PuddYO8tscnvI+KWPa8vc7OarPrWKpP6Hx@vger.kernel.org, AJvYcCVr4i63UcXVk60pqA8YIG32go+FDqnS4XGtDIgnCKjyAYR7U87oTGPn3yxh3ik+zV2QXz7NvijsuEl2@vger.kernel.org, AJvYcCXk9hWZq6hadh0q7xrIuwq+KByc/fU38wPsbKQA7zqrjMOAbcotHmyWMklbxXHcqibSAWFkUiCw8oBl@vger.kernel.org
X-Gm-Message-State: AOJu0YzKHXh3NXKhv8AxIjMfhh60h0CB3ro5fHDjaAk9I439JJYSDxeS
	ETmodtD12Am9cDBk/TIcA2GMRwRzC4EZKugQh/oNlh8aB9sepRL/ddkG
X-Gm-Gg: ASbGncu2iS6LNqZXhCm3jgyHTNu1r1ftmaUgHDXPyPfU2t1Qy25W5pD+dI/C+/WbXpt
	E90hYxEo4duhVQ1boIg+Y7hqZH5NI9J7xVg6RcFQAg4Pwy6c0aiM0Jkv8qfggvzaTrT0pxzaff3
	egmOhj/d1PvxaVus15tRF1na0vDmpgF5CJoNH67aW8KdREuJxR0obHgPMLuAPDvdWbU0N0ltLHu
	/CvJ+1j8bvnYZpumwfCC6Uu2A/+0/UpIxjTvRIjJdfWLIhGuPljdy3xwpvs9n50LWGrsl5vWu6r
	lIa6yIcdaxyXQjibgppP2zLMNi8TXmALI8l4DKjF1LML+ZHFxnMGli5zPHDcD/VypbAnwyQHePU
	XsEyO4ti0sVH5
X-Google-Smtp-Source: AGHT+IHEK68tsuvXRK3HV4LkE8einmBRH0cmV84isUsG7EWuqGXqZx0xrgjevPK6Dq1qmVf1TbvrRw==
X-Received: by 2002:a05:600c:6989:b0:450:d611:eb95 with SMTP id 5b1f17b1804b1-450d64f5c12mr46822025e9.17.1748618772139;
        Fri, 30 May 2025 08:26:12 -0700 (PDT)
Received: from Ansuel-XPS. (echelon-telekom.c-base.org. [80.147.140.51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7f8f188sm21318935e9.3.2025.05.30.08.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 08:26:11 -0700 (PDT)
Message-ID: <6839ce13.050a0220.1038eb.83e1@mx.google.com>
X-Google-Original-Message-ID: <aDnOD7be4DpL_Dui@Ansuel-XPS.>
Date: Fri, 30 May 2025 17:26:07 +0200
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
 <6837084c.050a0220.1e474f.3f20@mx.google.com>
 <3fb8ad2b-016d-4eee-af57-be7dec659f4c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3fb8ad2b-016d-4eee-af57-be7dec659f4c@kernel.org>

On Thu, May 29, 2025 at 11:00:39AM +0200, Krzysztof Kozlowski wrote:
> On 28/05/2025 14:57, Christian Marangi wrote:
> >>> Again sorry if this question keeps coming around and I can totally
> >>> understand if you are getting annoyed by this. The reason I always ask
> >>> this is because it's a total PAIN to implement this with the driver
> >>> structure due to the old "simple-mfd" model.
> >>
> >> ... and Rob was saying multiple times: be careful when adding
> >> simple-mfd. If it bites back, then I am sorry, but everyone were warned,
> >> weren't they?
> >>
> >> What is exactly the pain anyway? You cannot instantiate children from
> >> SCU driver?
> >>
> > 
> > Answering below since they are related.
> > 
> >>>
> >>> (as again putting everything in a single node conflicts with the OF
> >>> principle of autoprobing stuff with compatible property)
> >>
> >> I am not sure if I follow. What principle? Where is this principle
> >> expressed?
> >>
> >> And you do not have in your second example additional compatibles, so
> >> even if such principle exists it is not broken: everything autoprobes, I
> >> think.
> >>
> >>>
> >>
> >>
> > 
> > The principle I'm talking about is one driver for one compatible.
> 
> There is no such principle. One compatible can map to many drivers and
> many compatibles can map to one driver.
>

I might be wrong but there is currently a limitation on the OF system
where if a driver gets probed for a node then it's ignored for any other
driver. (sorry for the bad explaination, hope it's understandable)

> > (to be more precise excluding syscon compatible that is actually
> > ignored, if a driver for the compatible is found, any other compatible
> > is ignored.)
> > 
> > This means that declaring multiple compatible as:
> > 
> > compatible = "airoha,clock", "airoha,mdio"
> > 
> > doesn't result in the clock driver and the mdio driver probed but only
> > one of the 2 (probably only clock since it does have priority)
> 
> I don't understand this example. It makes no sense - clock is not
> compatible with mdio.
> 

This was an example to put every properties in the oparent node.

> > 
> > The "simple-mfd" compatible is just a simple compatible that indicate to
> > the OF system that every child (with a compatible) should be also probed.
> > And then automagically the driver gets probed.
> > 
> > Now the ""PAIN"" explaination. Not using the "simple-mfd" way with the
> > child with compatible and putting everything in the node means having to
> > create a dedicated MFD driver that just instruct to manually probe the
> > clock and mdio driver. (cause the compatible system can't be used)
> 
> You already have that driver - SCU. No need for new MFD driver...
> 

The SCU driver is actually the clock driver (currently). This was done
for simplicity and because in SCU there were only some bits.

But now with AN7583 they put 2 MDIO controller in it.

> 
> > 
> > So it's 3 driver instead of 2 with the extra effort of MFD driver
> > maintainer saying "Why simple-mfd is not used?"
> 
> Sorry, that's a wrong argument. You can use simple-mfd, iff it follows
> standard practices. If it does not fit standard practices, you cannot
> use an argument "now I need more complicated solution".
> 

Then I think we are getting confused because I am following the usual
pattern.

This is what would be the ideal and easy solution. (ti what was done on
EN7581 with pinctrl and pwm)

		scu: system-controller@1fa20000 {
			compatible = "syscon", "simple-mfd";
			reg = <0x0 0x1fb00000 0x0 0x970>;

			scuclk: scuclk {
				compatible = "airoha,an7583-scu";
				#clock-cells = <1>;
				#reset-cells = <1>;
			};

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



> > 
> > 
> > There is a solution for this but I always feel it's more of a workaround
> > since it doesn't really describe the HW with the DT node.
> 
> Really? All arguments you used here are driver arguments - that
> something is a pain in drivers. Now you mention that hardware would not
> match description.
> 
> Then let's change entire talk towards hardware description and send
> patches matching hardware, not matching your MFD driver structure.
> 

Ok to describe the HW for this register block

SCU register:
- clock
- mdio controller 1
- mdio controller 2

So this is why I think a good matching node block is:

parent node (SCU register):
	- child 1 (clock)
	- child 2 (mdio controller)
		- child 1 (mdio bus 1)
		- child 2 (mdio bus 2)

Is it wrong to model the DT node this way?

> > 
> > The workaround is:
> > 
> > 		system-controller@1fa20000 {
> >                         /* The parent SCU node implement the clock driver */
> >                         compatible = "airoha,an7583-scu", "syscon";
> >                         reg = <0x0 0x1fb00000 0x0 0x970>;
> > 
> >                         #clock-cells = <1>;
> >                         #reset-cells = <1>;
> > 
> >                         /* Clock driver is instructed to probe child */
> >                         mdio {
> >                                 compatible = "airoha,an7583-mdio";
> 
> Again, drop compatible.
> 

To drop the compatible a dedicated MFD driver is needed (or adding code
in the clock driver to register the MDIO controller and that is net
clean code wise)

> >                                 #address-cells = <1>;
> >                                 #size-cells = <0>;
> > 
> >                                 mdio_0: bus@0 {
> >                                         reg = <0>;
> >                                         resets = <&scuclk AN7583_MDIO0>;
> >                                 };
> > 
> >                                 mdio_1: bus@1 {
> >                                         reg = <1>;
> >                                         resets = <&scuclk AN7583_MDIO1>;
> >                                 };
> >                         };
> >                 };
> > 
> > 
> > But this really moves the probe from the simple-mfd to the clock driver.
> > 
> > So it's either 3 solution
> > 1. 2 driver + "simple-mfd"
> > 2. 3 driver + PAIN (due to MFD required driver)
> > 3. 2 driver + not very correct DT node structure
> 
> Option 4:
> Describe it correctly. You have one device which is the SCU which is
> clock provider and has subnode for MDIO bus. I don't care how many
> drivers you have there (but I am sure one can do it in a simple way).
> 

Ok extra driver is not a problem. Problem here is understand what is the
correct node structure cause there are various options.

If the register block is still not clear to you just tell me and will
try to describe it even more.

> > 
> > Maybe option 3. is more acceptable?
> > 
> > The SCU node is mainly clock + reset controller and the MDIO bus is an
> > expansion of it?
> > 
> > Hope the long explaination makes sense to you (especially about the
> > OF principle thing)
> > 
> 
> 
> Best regards,
> Krzysztof

-- 
	Ansuel
