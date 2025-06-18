Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541892DE1EC;
	Wed, 18 Jun 2025 12:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750248935; cv=none; b=O0O0ngl60aChPajzPJenjmdZmzv4nWrx0TPjmcDfB7W1bsyBrGeCy4kIn9JGoXRVQfWOcVfSfm6YeXoUzDHyz7umIY2w4WlsiSxfw4xcWDizAfnwiHdlLfccrQXapMINg5kOxDciZhmsKTuncCZ9hMMQbMIpZX9Y5iYhHzWZTq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750248935; c=relaxed/simple;
	bh=q0xCXsq5/VQMh0RUMEkGA3SijeZinqDCKVKsIPIgqhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qDO546ZwmqYiV2QazkChJYAYMFHhWS4sko3zVGa+wB7ETBr1BpR5b9GjgyrrwEMoCyJP9UKCroOedn11pjiZWr9XF9NF4Dr5EjI4NA8Z5/Uyvj40O0T3U1lzAsm7WwvO1WnjzUsKT1PhAwXpcBPtPQNCWhXCC1HQGRUIcjXEfXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T6ukrPeP; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T6ukrPeP"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-450cea01b9cso32309815e9.0;
        Wed, 18 Jun 2025 05:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750248932; x=1750853732; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ywQo6SUFx1lzN34W/DgqqJaDCnFkQLp/0M82nR/3jtk=;
        b=T6ukrPePe+Vdt7VlMU4cYtIspWg7SwEyO7nMBxYe85Q2whGmcDUQ/jw+Fk8Rmf/TZD
         tEa5mUG6Vq2P29/zlaucMDjadf5ZcbdPQGcmBiZ4yy2CLIbFbre9j2MNnoaqPoLUqg0Y
         u+1cu5844q0srW/xlECNI0V/fBdM2DCyv8DvWc3yIPyLGz8jga89kFdlkIw1+E5DoNdQ
         oz/1dLTQNK5y7LB6o4UqF/OYsVLQZLjc93xm+9sr04wkO963jmRxHR2N69XGKDb4K+iy
         2t3+qSGy8bKPYiW9bb8ZXmAm4hsS/afK99TxbG8VaBQ6qYgG8JT4EBqvADQlUCtFRoWN
         It5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750248932; x=1750853732;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ywQo6SUFx1lzN34W/DgqqJaDCnFkQLp/0M82nR/3jtk=;
        b=bdFu/5EhDpbCyyscKeBOn4766iic9Nitn41hzZjXpbw9/dvG/vecnf7Uq+Eq65M3/M
         QOiaTetqqs6rzbIKsv0yA8KlGIAk/G8iwJZWPHAMiobKOHTM6XaL4aqc8yNo41s+/WAX
         G1mn9zMzeCU6xJWcax02Yu4EQT6Hh7gYbDBb6Dmg9nGtZdaZclteyfNzVnv6ArTz5CiK
         s/7+n6lIaNOF2Nnrr/1ds7cVqJoi7pH15BvxKIjGigA2xi+YzQu5JgBDLmyepXCrtYyV
         8sF0P/HXT+r3wVWZ58zbD06JwU6i5FPCMkql3oSUbSkj1QS6irnMMHSbKIhQCI283JgX
         jGGw==
X-Forwarded-Encrypted: i=1; AJvYcCW6KjaKbUTTpKO/pDuCTf6vU7w+WhA9NTFtxLDHUZPd/fbdb71WfTyTslz7csNZOw1mCsnQ+MHC7JRgjfwA@vger.kernel.org, AJvYcCXKpMVgIbXHUNGzCO3U2fWQT8hPO1V+6Cck9AOqHRagYeQ9qLJz+hbKH6VFfM/YYfpRoPyzBrC5B+ce@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8AMj/Nj6vE54KAPie7EOfet+co3uPdna5Igm5WJbIrK8hzv+I
	kXyQMlcN8fuUduudAyM5u6G1qiwLWoepgH2B1X2bPkVIBsbTM97ZdipgsGiMoAEY4cY=
X-Gm-Gg: ASbGnct9ExAwqlL+ErLBNB+mnV5j/gXptxjnCq0kWuwTIGnTE68tUyJNZWN7i0SxRXC
	oqf6OVr+ItQtbwK29SYdsiOSTUB0wjUGLq0CDOBmgzvJBPSNtwSpyZ1tI/XRQmGkMQbEQMZR/Lp
	uVh+bTASqziJA/Sl1PNwFcNYvFfxCOj83gEW6kl71dnbd0oQjH4PBRQ18zG+nh5zkXXn9jc6o1A
	qsoI940Fd2rE4uohTs6IbwTFCBOP3dsbTgmv27tjt5ukO4M+x7yS02J7NpNzArdfaBcvpiwfkdT
	qQRk1zA04TxcU83KkTnRiXwXzHxXpo3poi/ExySz8404w4VsfznLpYL3LGFCUYnhHaJwDP7dLsW
	5oF4dJQQ=
X-Google-Smtp-Source: AGHT+IEHOSjPWSh00P12zW7jYpqc5E8nsqDH1nPj9D8MDJOQ7SCMRaKJlqbVi+qZDnUXj/RLD7r7yA==
X-Received: by 2002:a05:600c:8b25:b0:44a:b7a3:b95f with SMTP id 5b1f17b1804b1-4533cac9674mr143842665e9.25.1750248931315;
        Wed, 18 Jun 2025 05:15:31 -0700 (PDT)
Received: from HYB-DlYm71t3hSl.ad.analog.com ([137.71.226.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e253f64sm203769495e9.27.2025.06.18.05.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 05:15:30 -0700 (PDT)
Date: Wed, 18 Jun 2025 14:15:24 +0200
From: Jorge Marques <gastmaier@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jorge Marques <jorge.marques@analog.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: i3c: Add adi-i3c-master
Message-ID: <ymmn2jgpa4bia2wl4d32ccipybxt4nylz4hspdf2svivk5ao7s@vv7v3soq2e65>
References: <20250618-adi-i3c-master-v3-0-e66170a6cb95@analog.com>
 <20250618-adi-i3c-master-v3-1-e66170a6cb95@analog.com>
 <20250618-visionary-hawk-of-success-d4aab8@kuoka>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618-visionary-hawk-of-success-d4aab8@kuoka>

On Wed, Jun 18, 2025 at 11:21:22AM +0200, Krzysztof Kozlowski wrote:
> On Wed, Jun 18, 2025 at 09:16:43AM GMT, Jorge Marques wrote:
> > Add bindings doc for ADI I3C Controller IP core, a FPGA synthesizable IP
> > core that implements the MIPI I3C Basic controller specification.
> 
> Here you put outcome of previous questions - why such compatible was
> chosen, that hardware is this and that.
> 
> > 
> > Signed-off-by: Jorge Marques <jorge.marques@analog.com>
> > ---
> >  .../devicetree/bindings/i3c/adi,i3c-master.yaml    | 63 ++++++++++++++++++++++
> >  MAINTAINERS                                        |  5 ++
> >  2 files changed, 68 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..718733bbb450c34c5d4924050cc6f85d8a80fe4b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml
> 
> Filename based on the compatible, so adi,i3c-master-1.00.a.yaml
> 
I agree, but I ended up following the pattern for the other adi,
bindings. I will move for v4. IMO the version suffix has no much use
since IP updates are handled in the driver.
> > @@ -0,0 +1,63 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/i3c/adi,i3c-master.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Analog Devices I3C Controller
> > +
> > +description: |
> > +  FPGA-based I3C controller designed to interface with I3C and I2C peripherals,
> > +  implementing a subset of the I3C-basic specification.
> > +
> > +  https://analogdevicesinc.github.io/hdl/library/i3c_controller
> > +
> > +maintainers:
> > +  - Jorge Marques <jorge.marques@analog.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: adi,i3c-master-1.00.a
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    minItems: 1
> 
> Why?
> 
The IP core requires a clock, and the second is optional.
minItems sets the minimum number of required clocks and the maxItems is
inferred from the number of items.

On the IP core itself, one clock is required (axi), and if it is the
only provided, it means that the same clock for the AXI bus is used
also for the rest of the RTL logic.

If a second clock is provided, i3c, it means it drives the RTL logic and is
asynchronous to the axi clock, which then just drives the register map logic.
For i3c specified nominal speeds, the RTL logic should run with a speed of
100MHz. Some FPGAs, such as Altera CycloneV, have a default bus clock speed of
50MHz. Changing the bus speed is possible, but affects timing and it may not be
possible from users to double the bus speed since it will affect timing of all
IP cores using the bus clock.
> > +    items:
> > +      - description: The AXI interconnect clock.
> > +      - description: The I3C controller clock.
I will update the descriptions to:

        - description: The AXI interconnect clock, drives the register map.
        - description: The I3C controller clock. AXI clock drives all logic if not provided.

> > +
> > +  clock-names:
> 
> Not synced with clocks.
> 
I will add `minItems: 1`.
> > +    items:
> > +      - const: axi
> > +      - const: i3c
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - interrupts
> > +
> > +allOf:
> > +  - $ref: i3c.yaml#
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    i3c@44a00000 {
> > +        compatible = "adi,i3c-master";
> > +        reg = <0x44a00000 0x1000>;
> > +        interrupts = <0 56 4>;
> 
> Use proper defines.
> 
The following can added:

  #include <dt-bindings/interrupt-controller/irq.h>

  interrupts = <0 56 IRQ_TYPE_LEVEL_HIGH>;

Is there any other to be replaced?

> Best regards,
> Krzysztof
> 

Best regards,
Jorge
