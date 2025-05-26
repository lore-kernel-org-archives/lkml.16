Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9BF194A60;
	Mon, 26 May 2025 11:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748258913; cv=none; b=VECNnoWDCAiuV8bSeAJ8Yu9FLISTcLzKm7Amoxiz/1gSoTbFvICHoVR9c6bs0BQT5OHZpvdwpVYecFlCdCU5RzXUlqqy02KcbdQa3lgtj3909Yu/cB3QS/rI5OLtaxySUrPvd/UzU8uTHw+U8bE8X+RBLQ+bJnTE0oDhkwyqA6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748258913; c=relaxed/simple;
	bh=kEmp3zOQRYeNavMXIDH8o5Z2ES2SGt4vLffkGHqSWJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h4MCrbz7empavvh9HL74clzsZyT8I+TBpGxmKynkLlN7Btnk48va5pwHB3ja8J4xpVsyHDERskrFJaIokGXaw5AWYQwfl+xDR0mvsj4D+yXwq9MCTay0Q7uqRrSxsw1noYsSOEVGhXewhj3+BWY8Nb8anT8lk0EzhufgiT6WsJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=REI6joJY; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="REI6joJY"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-55324062ea8so718868e87.3;
        Mon, 26 May 2025 04:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748258910; x=1748863710; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B/gp0tjp1Usc8MAV95nXKqKc5hXuWmSH0K8Gw6kVM6k=;
        b=REI6joJYxwrfOIsJu5/fegCW4UEZKU8iDQkZsbfeloTn5F1ZUE/ZuzL8AnzwUv38/d
         7NwXGGB0uxwwkPPLErfjlScON/PidcdSSXwshUnvYkWO49Ftq1ccbjl86/qkHsg0BlnA
         7nllNAWoEr97tZAWwcxCJyCkem0ABYaANqf2i+J6jmsEUR8oF9jLAYItuqUl0wtdd8w6
         oJ4CheapnMstdvHnjL0OjyyHB3/Yvwr4lKdY/b1Q8pHTINQBfW6HBKTwWtrOflxsWxRH
         HMUkmCn8Rsy8INEXSe2olXo6p0VkyUXgma3czTarq/ji+3zhgfPhBU12P+xxBK56b43N
         tZOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748258910; x=1748863710;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B/gp0tjp1Usc8MAV95nXKqKc5hXuWmSH0K8Gw6kVM6k=;
        b=Ku+iXyC5Mj/KQZnRD/ttrlwWMhlQTRqkflWJd4oyvKVZcSlXOpnvzLawpyiMbk+NRy
         bzaa14Y8mXB+y6WFRKOVW6GQ7bp0HeNNDw026exK5RWt+qmJaJHahWJDYsmz8HI6H/JK
         MQOUeMKlwrwiMJYYmCEK9lZqAZc2pvQJh1K5siaX8oUgVnOgCFGakR4Y+xojeY5GdpAE
         RMzkwDak+7ZhkU/lDdpXIrgSSI+RB+aHfRDUvcG6iVaXk9gKm7h8J0HmsK3GuKq1y9Kx
         GtP7wmnbv0quwiYbhMGO12LQc/6Ey/m8soWpcqlUL4fuUPM5xrMrSVg3eik+zSs2OHzC
         DvTg==
X-Forwarded-Encrypted: i=1; AJvYcCVNF4/dAqtJxPydB4hxHekTpN7pq+jGYfZdty9KdVqcJcfW+mGQeRjpmUZQZ+1nUULgI50/X97TplDt@vger.kernel.org, AJvYcCWA1P51Wvvr5fHKnJut6pJLYXf7gVH82Mxl9DUcY76S1O3RaRpt/+WTCtkoe1/xjAuJX42H0p2TwDyF@vger.kernel.org, AJvYcCXtFf8g3t5uhuX4EFxtU90MtERaHMt7wQzCw9D/kg7CYnts4lpD3smN9HBJOfXN8Ahow4deESddP6Wi1lIp@vger.kernel.org
X-Gm-Message-State: AOJu0YyqMisdey/hiFabiSo6ui1P637LQldZSDSPZjToMkvR4ssb3HVo
	lVcumqR9vvP1sgKCrSnDVFCq4dYXT+zaN5zBPv20f2Yg70Qlx4iM1O5C
X-Gm-Gg: ASbGncuUgnASldQ84BRdg9YoKLi3jCZMwJf9HvZM8bY+FsJK2KpcIQi1MKO7xTdptO2
	WCTgkZZNOueCUxrtQiRcDT+Aa1BqSeakmmN5zSuHu/2RzXIpTzf5uzJnxGrHpnx8LoXDytQZmB+
	KoppoQTpdiu/qK2NxCc8hal3bVk2evp50MRsQe4Jk672ijc9URZF22stAKMMs/+pw2i/Aj+TfgY
	0NrZVNk/9IlmesbqjNc3q23Ahw/tdsCz4sIkvSCxUzeDJS27Ja28kzhxZBFLmL1PIUW7BO2QccO
	sv99LRERNeEss1WPamIQGyImRwAdbc974dwOuwRLaxg+2QVS6Ik2BuJrxgvMlbgWgptmO9/KmyQ
	dg7u3slKnBseFjLCM6vIsybk=
X-Google-Smtp-Source: AGHT+IHRhjYaDU6k00/gXLYowdKanWHffNQeKQGOtcca3mVTBbs0rkOKWcbsJqncpV4ih5gfEecxkQ==
X-Received: by 2002:a05:6512:3d21:b0:545:1e2d:6b73 with SMTP id 2adb3069b0e04-5521c7ae5a0mr2006472e87.13.1748258909504;
        Mon, 26 May 2025 04:28:29 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55322c2cd0bsm351149e87.124.2025.05.26.04.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 04:28:29 -0700 (PDT)
Date: Mon, 26 May 2025 13:28:28 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, jank@cadence.com,
	edgar.iglesias@amd.com, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: clk: fixed-mmio-clock: Add optional
 ready reg
Message-ID: <aDRQXFTQngigI4pC@zapote>
References: <20250525190806.1204531-1-edgar.iglesias@gmail.com>
 <20250525190806.1204531-2-edgar.iglesias@gmail.com>
 <e7efac3d-8dbf-4370-8f36-ffa9351593c0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7efac3d-8dbf-4370-8f36-ffa9351593c0@kernel.org>
User-Agent: Mutt/2.2.14+84 (2efcabc4) (2025-03-23)

On Mon, May 26, 2025 at 06:53:14AM +0200, Krzysztof Kozlowski wrote:
> On 25/05/2025 21:08, Edgar E. Iglesias wrote:
> > From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> > 
> > Add an optional ready register and properties describing bitfields
> > that signal when the clock is ready. This can for example be useful
> > to describe PLL lock bits.
> > 
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> > ---
> >  .../bindings/clock/fixed-mmio-clock.yaml      | 38 ++++++++++++++++++-
> >  1 file changed, 37 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/fixed-mmio-clock.yaml b/Documentation/devicetree/bindings/clock/fixed-mmio-clock.yaml
> > index e22fc272d023..90033ba389e8 100644
> > --- a/Documentation/devicetree/bindings/clock/fixed-mmio-clock.yaml
> > +++ b/Documentation/devicetree/bindings/clock/fixed-mmio-clock.yaml
> > @@ -10,6 +10,11 @@ description:
> >    This binding describes a fixed-rate clock for which the frequency can
> >    be read from a single 32-bit memory mapped I/O register.
> >  
> > +  An optional ready register can be specified in a second reg entry.
> > +  The ready register will be polled until it signals ready prior to reading
> > +  the fixed rate. This is useful for example to optionally wait for a PLL
> > +  to lock.
> > +
> >    It was designed for test systems, like FPGA, not for complete,
> >    finished SoCs.
> >  
> > @@ -21,7 +26,10 @@ properties:
> >      const: fixed-mmio-clock
> >  
> >    reg:
> > -    maxItems: 1
> > +    minItems: 1
> > +    items:
> > +      - description: Fixed rate register
> > +      - description: Optional clock ready register
> >  
> 
> I am not convinced we actually want this. If you have more complicated
> clocks which need more than one register, then maybe this is too complex
> for generic device and you should just make this part of clock controller.

Right.

> 
> Also I wonder how a clock, which is not controllable, cannot be gated,
> can be ready or not. Issue is easily visible in your driver:
> 1. Probe the driver
> 2. Clock is not ready - you wait...
> 3. and wait and entire probe is waiting and busy-looping
> 4. Probed.
> 5. Unbind device
> 6. Rebind and again we check if clock is ready? Why? Nothing changed in
> the hardware, clock was not disabled.

Yeah, in my particular case, once the clock is ready it will never go
back to "unready" until cold restart.

> 
> Although above is maybe better question for driver design, but it still
> makes me wonder whether you are just putting driver complexity into DT.

Yes, I felt that this was simple enough to have a generic mechanism but perhaps not.


> 
> >    "#clock-cells":
> >      const: 0
> > @@ -29,6 +37,25 @@ properties:
> >    clock-output-names:
> >      maxItems: 1
> >  
> > +  ready-timeout:
> > +    description:
> > +      Optional timeout in micro-seconds when polling for clock readiness.
> > +      0 means no timeout.
> 
> Use a proper unit suffix.
> https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/property-units.yaml
> 
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> 
> Drop

Fixed for v2.


> 
> > +    default: 0
> > +
> > +  ready-mask:
> > +    description:
> > +      Optional mask to apply when reading the ready register.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    default: 0xffffffff
> > +
> > +  ready-value:
> > +    description:
> > +      When a ready register is specified in reg, poll the ready reg until
> > +      ready-reg & ready-mask == ready-value.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> 
> 
> > +
> >  required:
> >    - compatible
> >    - reg
> > @@ -44,4 +71,13 @@ examples:
> >        reg = <0xfd020004 0x4>;
> >        clock-output-names = "sysclk";
> >      };
> > +  - |
> > +    pclk: pclk@fd040000 {
> 
> clock@
> 
> And drop unused label

Fixed.


> 
> > +      compatible = "fixed-mmio-clock";
> > +      #clock-cells = <0>;
> > +      reg = <0xfd040000 0x4 0xfd040004 0x4>;
> > +      ready-mask = <1>;
> > +      ready-value = <1>;
> > +      clock-output-names = "pclk";
> > +    };
> >  ...
> 
> 
> Best regards,
> Krzysztof
