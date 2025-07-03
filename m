Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC46239E76;
	Thu,  3 Jul 2025 22:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751580950; cv=none; b=AXwm4OOuEBXEOSWXpo11SGuVbiwhPFzhTIJjgCwT/l+2syZO0BGuN2RUR3IXMKMdaUCSeZkE+iTUDM+2DA8nB/s5TG6EwjRIZbfeZHitoao5YrCFtRn09rG+neqBBMbABR1JD7orkEyTZuPMDXuR5GEyDX1hLJwHmFFZ5M/7YAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751580950; c=relaxed/simple;
	bh=YVJ2GQaQkp9/YKzcuk9Fu2K0QO5HX/rZ9FG6NmQyo3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZiwOsPJUn7x0Z0FhfCrsHaRFXXxTcJc2z79C8s0sfuMzlD2hYE2MLZDaj5sglppAS1b0Ozktz8vhXpWVemY3y9KfxzoY5jW4PFXuLA2ho/V8fPircwR0ggJWIFcxsc7+Ywlm5O8M8fdLUEo3LE/6nUzZlwHI4ndIcpPeG95RXKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YQYMmqPS; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YQYMmqPS"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7426c44e014so528092b3a.3;
        Thu, 03 Jul 2025 15:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751580948; x=1752185748; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LdVEyliI7CI2o2rNcOBW/maFK6t06bm6iyL8o0UQrKM=;
        b=YQYMmqPSp/kP8F+KCdblrfgDF8D0sSejL7MXhG45a0P+2FHFdvc99Lqbb5Yz5+LAAT
         opka3aVU9vEM+r9uaK8PJ6KgNoX1X6A0H12qcG2p3CO0C/UIdDq88CvDSP4Oy4e8k5Uc
         B9ogWXQwoXQqsTKYj8uPTbsi1lo8J+QJDq0ZRH5teAhUehSpaEJEgZpOG6MUkYR33KLN
         C84AKW107fEd7HUbywlPjbgKcFTeIuCkOf4GKtdVEOLieWVsg7byvg5QPEqn+lVncpcs
         KYOAlRiDQWvSiSezYq+eX0i8/VXVT5agY6O2jOKjrBwZriAbgUtVqhlaJu/aRIETtO99
         DsJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751580948; x=1752185748;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LdVEyliI7CI2o2rNcOBW/maFK6t06bm6iyL8o0UQrKM=;
        b=K58eVkH96V7r6dBZtbnL24dmn09yGIk04i8/0eNZ6ofwn4eG/R7IwnqqOUQHXoBG25
         135wFPxYePa1ytW7i38vKWsJ/iDnbkh/FUP8pJCDI/Ja/webY2BtmRy7/nX+LkAPC7eB
         9WGgaKxmZAvaBivCkiSzmIJCUeuNZt9NKGcHuXDqN6nkVmRaFCfkLpIdLHjPAx9R6gqe
         zRGLTvVTrPamcjE8cnKEeh1s9vYOdh2NeEtbpR9J+1JSZNvgNQXDRkDI1UIESiQ8cvDL
         NM19V0zAOyMilN97vDXsPWxciSzR43yaCux4jnuuQLX55ZVQJIf2zsuas7FCjR8IGY3k
         X25Q==
X-Forwarded-Encrypted: i=1; AJvYcCV5x+ZyhJbWwP5kPK8yeZ7HjjDF1VHW6yLawR0KN4fG0I16ZaZDfBH1RyO1rfYBVrPW9sb23a7An7Jq@vger.kernel.org, AJvYcCVFiQ7kdu94KXjZceSczzbJfoY+Lb6OD8KIN2d0G2qg92xw+yHuFMOywDz7iO5LLdQ3Ue31ShAPZq3B1Tu4@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq3Rvfv2lTJGgcbwGCWTEeDxRTbQiusOVT4DV+yPJbTqARsQxL
	MbUY7vWasYepRl2UbW3kOfbBq3AkhY9JUjTaJcsRKO1Dun9vcI6E83cV
X-Gm-Gg: ASbGncvqKKMCgJgdcKS7JnyQRBu/yT67oORg2FUpJfCtIoq9NDCqYyU3OFHdiiXe64E
	NH3HQuwgxLJ9D/bIS3f+UnEM/Xpxueco4rcIu/tqb6tLrlwRkP9CpmY/1K3Iwg+PlX2aJ3anb3S
	f9AGxlcBQLlNBUVOGpCdfxrCnEYuYRX0NN0igmUF4I872O42HIOZO87Dwu4RTmpLhEG77Yj7Upt
	jxHMXb0ZnAXQff0WI5Ead2v5rU80dIaG1o3+s+KjeGoWvSg8Umnl12VY2WFKzfLafg2h4jtuwMR
	6STAD+EPq90e35e0HUh+lIWRON9SEUfI8dtLMRaILan5GgBzHvATTW7GrkLmQjwn16aczBjkCCq
	8xRoKpqOvMmP+TC0uMuZf7650VnTulAbGXG2OSzNB8WeHbTo8CA==
X-Google-Smtp-Source: AGHT+IGUk7PwRYq/uESipZTr5l7TnZjN4IATKVV7k9iHCae7JNaUFn05U63lEW19hVmJQS8UvmDn3w==
X-Received: by 2002:a05:6a20:72a3:b0:220:33ae:dabb with SMTP id adf61e73a8af0-225c0de25fdmr530119637.29.1751580948326;
        Thu, 03 Jul 2025 15:15:48 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce429b34dsm423082b3a.120.2025.07.03.15.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 15:15:47 -0700 (PDT)
Date: Thu, 3 Jul 2025 15:15:44 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Tao Ren <taoren@meta.com>
Subject: Re: [PATCH 5/5] ARM: dts: aspeed: Add Facebook Darwin (AST2600) BMC
Message-ID: <aGcBEHMEyQJuzmjj@localhost.localdomain>
References: <20250702050421.13729-1-rentao.bupt@gmail.com>
 <20250702050421.13729-6-rentao.bupt@gmail.com>
 <a6f6966b-50ee-4b4f-9422-96c6ac9391a2@lunn.ch>
 <aGW8Nm8ZWMwRYVOo@localhost.localdomain>
 <220ac6c2-8373-4742-86fa-f322d6ada624@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <220ac6c2-8373-4742-86fa-f322d6ada624@lunn.ch>

On Thu, Jul 03, 2025 at 09:58:48AM +0200, Andrew Lunn wrote:
> > > How do RGMII delays work? Connections to switches have to be handled
> > > different to PHYs, to avoid double delays. But is there extra long
> > > clock lines? Or are you expecting the switch to add the delays?
> > > 
> > >       Andrew
> > 
> > Hi Andrew,
> > 
> > The delays are introduced in BMC MAC by setting SCU control registers in
> > u-boot. The delays on the switch side are disabled.
> 
> Sorry, but not acceptable. This is something i've been NACKing Aspeed
> DT patches for. You need the MAC driver to interpret the phy-mode and
> program the SCU control register as needed.
> 
> Since you have the MAC introducing the delays, you want phy-mode
> 'rgmii-id'.
> 
> If you want to submit some DT now, drop the ethernet node. This is
> what others have been doing while waiting for Aspeed to fix their MAC
> driver. Having said that, i've not seen any progress from Aspeed, so
> it either needs their customers to apply more pressure, or somebody in
> the community to just fix it and submit patches.
> 
>     Andrew

Hi Andrew,

Got it, and thanks for sharing the context.

I will reach out to ASPEED offline to see if they are actively working
on the MAC fix, or if I have enough knowledge to work out the patch.


Thanks,

Tao
