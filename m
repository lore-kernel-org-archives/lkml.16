Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBCB26BDB6;
	Tue, 11 Feb 2025 07:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.92.40.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739257525; cv=none; b=qSdtV67m9iD1MyOm+a92giFmk8d9N1lyA6DfhAtypGmaRVw49AMr5pxfgoXR3Si9+hGsWpPrsQzx9PcGCvOpGW3ODW8p2Z6CHylAumedIAWPZBcHknC+pppUDJpk1jyz5gyH4TLmB6fOV/oqzNHg0mdHN71XYUymcYj7SuBMVxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739257525; c=relaxed/simple;
	bh=mwmPV6GcjGF953IW1HDwL4a6zb02eH1Tc0c3yrbIinQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mjt8OAwajiL3D8HVX7PtQh0vgwO9dVmVtQoJ6GGX3bIwy+FtXdhNT70HotBJYdFt0tJDj7GbKqIhv+3ILrN8yrY8kUCmqzybzqnPukG4/YH93ZUkdgb6awvMjG4ehA8a9cYq/yDabznQ4lk3WacREcTrX3yfYC+4rtGBO8fTyaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com; spf=pass smtp.mailfrom=thorsis.com; dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b=fZ3S4PNW; arc=none smtp.client-ip=217.92.40.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b="fZ3S4PNW"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 395C81480388;
	Tue, 11 Feb 2025 08:05:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1739257520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zhmjHnHw3vjWo+tkwmIIDKtbQQYkCfKwRVCsE4/6FJ0=;
	b=fZ3S4PNWa3z+AJjC0z2Rbjb5irYPnhzFSGve2WHv/xVHrClSkkw1Oes9qbeC/rN/TQZh5m
	KrVmjp6tTe3JZa0PMnQEZFj+kESGp912bmTFau0QfHIltHr4fb0isN2eAYvm8uSYjR0TZg
	NpUqCvPoVIOFWaolUjEMi4nruboGJWZco7zOLxrjNKaYfJcOOChhvyNaNs26HVnmAvR6Tg
	XyS9tX9ilujx0t0bxAxs45yYEXWzCm4SG8fhljKGhNvao+jh7Z+VK9r33o2Ov7q5sIsCU8
	Pll5wN5r0QX6RRXhKR/8Jrazpa5tfCXRic9raMqghv/C5Bk0FPfe1Gl2Mh5RhQ==
Date: Tue, 11 Feb 2025 08:05:14 +0100
From: Alexander Dahl <ada@thorsis.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alexander Dahl <ada@thorsis.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 08/16] dt-bindings: nvmem: microchip-otpc: Add
 required clocks
Message-ID: <20250211-primer-epic-d07bc3752569@thorsis.com>
Mail-Followup-To: Krzysztof Kozlowski <krzk@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
References: <20250210164506.495747-1-ada@thorsis.com>
 <20250210164506.495747-9-ada@thorsis.com>
 <8e9562c8-5c01-4b5c-b2b0-4dad3d16e7a8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8e9562c8-5c01-4b5c-b2b0-4dad3d16e7a8@kernel.org>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Last-TLS-Session-Version: TLSv1.3

Hello Krzysztof,

Am Mon, Feb 10, 2025 at 05:59:52PM +0100 schrieb Krzysztof Kozlowski:
> On 10/02/2025 17:44, Alexander Dahl wrote:
> > The OTPC requires both the peripheral clock through PMC and the main RC
> > oscillator.  Seemed to work without explicitly enabling those clocks on
> > sama7g5 before, but did not on sam9x60.
> > 
> > Older datasheets were not clear and explicit about this, but recent are,
> > e.g. SAMA7G5 series datasheet (DS60001765B),
> > section 30.4.1 Power Management:
> > 
> >> The OTPC is clocked through the Power Management Controller (PMC).
> >> The user must power on the main RC oscillator and enable the
> >> peripheral clock of the OTPC prior to reading or writing the OTP
> >> memory.
> > 
> > Link: https://lore.kernel.org/linux-clk/ec34efc2-2051-4b8a-b5d8-6e2fd5e08c28@microchip.com/T/#u
> > Signed-off-by: Alexander Dahl <ada@thorsis.com>
> > ---
> > 
> > Notes:
> >     v2:
> >     - new patch, not present in v1
> > 
> >  .../nvmem/microchip,sama7g5-otpc.yaml         | 28 +++++++++++++++++++
> >  1 file changed, 28 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
> > index 9a7aaf64eef32..1fa40610888f3 100644
> > --- a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
> > +++ b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
> > @@ -29,6 +29,16 @@ properties:
> >    reg:
> >      maxItems: 1
> >  
> > +  clocks:
> > +    items:
> > +      - description: main rc oscillator
> > +      - description: otpc peripheral clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: main_rc_osc
> 
> osc

On at91 SoCs main oscillator and main RC oscillator are two different
things, and those are different clocks in Linux as well.  This clock
is named "main_rc_osc" in the clock driver.  In
drivers/clk/at91/sam9x60.c this clock is added like this:

    hw = at91_clk_register_main_rc_osc(regmap, "main_rc_osc", 12000000, 50000000);

The datasheet makes it explicit, it's exactly the main rc oscillator
clock required for the OTPC to work, no other clock.

So why name this "osc" only then?  This is confusing at best.

> 
> > +      - const: otpc_clk
> 
> otpc or bus or whatever logically this is

Okay the "_clk" suffix is redundant.  Since the peripheral clock for
the OTPC is required here, I would go with "otpc" only then.

> 
> > +
> >  required:
> >    - compatible
> >    - reg
> > @@ -37,6 +47,8 @@ unevaluatedProperties: false
> >  
> >  examples:
> >    - |
> > +    #include <dt-bindings/clock/at91.h>
> > +    #include <dt-bindings/clock/microchip,sama7g5-pmc.h>
> >      #include <dt-bindings/nvmem/microchip,sama7g5-otpc.h>
> >  
> >      otpc: efuse@e8c00000 {
> > @@ -44,10 +56,26 @@ examples:
> >          reg = <0xe8c00000 0xec>;
> >          #address-cells = <1>;
> >          #size-cells = <1>;
> > +        clocks = <&pmc PMC_TYPE_CORE SAMA7G5_PMC_MAIN_RC>, <&pmc PMC_TYPE_PERIPHERAL 67>;
> > +        clock-names = "main_rc_osc", "otpc_clk";
> >  
> >          temperature_calib: calib@1 {
> >              reg = <OTP_PKT(1) 76>;
> >          };
> >      };
> >  
> > +  - |
> > +    #include <dt-bindings/clock/at91.h>
> > +    #include <dt-bindings/clock/microchip,sam9x60-pmc.h>
> > +    #include <dt-bindings/nvmem/microchip,sama7g5-otpc.h>
> > +
> > +    efuse@eff00000 {
> > +        compatible = "microchip,sam9x60-otpc", "syscon";
> > +        reg = <0xeff00000 0xec>;
> 
> No need for new example with difference in what exactly? Even compatible
> was not added here...

Different compatible, different clocks, no sub nodes, different
peripheral clock id …  From a human doc readers I'd like another
example, but fine, we can drop it if it adds too much redundancy.

Greets
Alex

> 
> > +        #address-cells = <1>;
> > +        #size-cells = <1>;
> > +        clocks = <&pmc PMC_TYPE_CORE SAM9X60_PMC_MAIN_RC>, <&pmc PMC_TYPE_PERIPHERAL 46>;
> > +        clock-names = "main_rc_osc", "otpc_clk";
> > +    };
> > +
> >  ...
> 
> 
> Best regards,
> Krzysztof
