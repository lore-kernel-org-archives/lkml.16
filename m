Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BFD219E8F;
	Wed, 18 Jun 2025 19:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750276531; cv=none; b=kjRNg8uYyIiBLVgKyIt91iXr0d7ZzJ/YzA7CuOShNRiOthHfVELlMGftIWgi9tefE5antsddtyjeu7en/vWtxmI8wZVHaesEztuC3s4L6WQLQT2GNBsPEbDrUkOs2PWRmAPXj8Kx3bwnS7hxJP/9gnZjGiQFAh0S5fqyuZ1ayKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750276531; c=relaxed/simple;
	bh=/hx69EgIRd5u5Yq56ErOQ7OjXNa8EoiLRyzeRsicTuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tjfj3xYYHkwQwUd3WtMEsL9JZ727aCQ0YKRC+3jvve8uNfqjsC30l+fFZaIPOui+R8ezhY+y3ibvc3BCRyQTyYWowyGMNppwGQ4xTjHtobJi37Fd1S4HkzcFd/vNEx4pWOLPukVE7m4HT0KcM5Q3EFMb/RZ8CX/hiweWQkDmT5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mTk11yM4; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mTk11yM4"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a548a73ff2so93566f8f.0;
        Wed, 18 Jun 2025 12:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750276527; x=1750881327; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wNzDJ0oBkEzm8oLmVZ4FeBB/IbmdKIQf9CHD8w2IwKo=;
        b=mTk11yM43YoFe/Qt9mx2V08m/ZeRFy4qUCu2XQVccVC//YKtYz7XhD/X+J9UgMU62t
         D4oQWUGUs3gbp9lznEvv+VkBWBOKX+dirBfhSJox4Nb13yc+KYqB0sms4JkMULfCPmIp
         2PhdjS/tnh+wuE+1GBDlM73h6xk/BePRHY1dppYcXM2ziyC/r4dXKqS9dWDUriiI48/z
         oW8CkjmbDfT57ED+1E4pyUCRtjV+NIVFZocKTdRgVPBxo+WsBk/5zW1fjFdv8AcLuPGd
         73RwjPEp145D2Yc+DPIGbGO6poF296+0NTu4kf+vrmXSqjR6VT61pFGVGbB0N1xdKxOD
         wwGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750276527; x=1750881327;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wNzDJ0oBkEzm8oLmVZ4FeBB/IbmdKIQf9CHD8w2IwKo=;
        b=h3+Budb/hZYs/hGEkAlNIFKEjT6RjYj+1aUUIcqsgdlGRC8QhGtYRWTKIUFleZqp/j
         KyQXgDBuaxychAstHdzJtdLiuNvBHumqQGEnEhGcoJ6r9Lu7hUzERiG8N1eMBZivOZ0o
         OkyFGxeWzpLA53cbg81XzdVJ+dXyImijMiMg7q5aJrYjREd9mFcPFRB+CoUFMUTUUSwM
         YAw8Qvw95G1JOsiBuvFuFVnwqsA9Dmm4bSsPKwNud/MkHXX5yc63ahRccj6SMW1zkKkZ
         qkPwsBRYU1yiO2prVbOG0nI+DjDoB2JkOX95y3qiGOdup1UBk4ArNzxGoH2KchSWtTV8
         KMMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMddTB5CxAM88TJFJ5Wu2qY73kYC6Zq5ofWLCjVQjEgg45h6SzmLWT13RMpjwS/6N8sQ+OkGCnj4fz/CQG@vger.kernel.org, AJvYcCXhmou4ON4KWGokB+94WKngRkeW+gplSRerhHAYxVHm5aT/yLEEIbv258JZrMVpnkflOebsJmZjYDCV@vger.kernel.org
X-Gm-Message-State: AOJu0YzkvsDZW8XMhZnemBzYPoduNzC+JDLUNynlutCUnSYeuK1bAuFn
	cptx5e6nDp5x9oR0A1IBxg1nwpR93dOcoOhs9uuaiyfSPVkKAqBVIq2y
X-Gm-Gg: ASbGncuo47ZckQlUi7GlKRaksMs6FjJlu9NrTyeaLvI8X5jgkpqj1SDtFSsL6EgbBJg
	25N+JVoT0r2Ihu+mrprjE9FIMQaodyuf2gmnfQ2W8D4gnsRtklJmfNtrE6H0OS241uia0RkB4zu
	+dnhbRg9sxePNRMoc8zVH+gBapDsEE/YpdkSzcVYTjVDu6FSLK7GdWxHPFwCCVqkJbvR2xSSZgU
	FGgu3Vpc1P7t4gmU0UYFF8QxElzPWyol5nYQpurGofT2fmHJrACl0w4Rz8kONd1ybwFamXDR1rr
	eR85zDBlYNUN42okVo3BAxlDExpj0zJB+LCCnc1ylsxZoNeYT1dgInM19UniDeqRxGUg9xpqMYS
	EwPkYMSM1aPU=
X-Google-Smtp-Source: AGHT+IGf8e5oh4khYmXZMlIMvNd0kEOjqBixPh2SFjaQsD1l9BKRo8X19dErEHHzDb4u6nTTOodrng==
X-Received: by 2002:a05:6000:653:b0:3a5:783f:5289 with SMTP id ffacd0b85a97d-3a5783f5758mr13454626f8f.49.1750276527099;
        Wed, 18 Jun 2025 12:55:27 -0700 (PDT)
Received: from HYB-DlYm71t3hSl.ad.analog.com ([2001:a61:12c1:8801:20af:3ab0:e9d9:22c5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54d74sm17994443f8f.10.2025.06.18.12.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 12:55:26 -0700 (PDT)
Date: Wed, 18 Jun 2025 21:55:24 +0200
From: Jorge Marques <gastmaier@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jorge Marques <jorge.marques@analog.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: i3c: Add adi-i3c-master
Message-ID: <dfejhrchaxwze7gkipdgcx5byefv6hudi456na25yrts6viqvw@lfnv55dgvk32>
References: <20250618-adi-i3c-master-v3-0-e66170a6cb95@analog.com>
 <20250618-adi-i3c-master-v3-1-e66170a6cb95@analog.com>
 <20250618-visionary-hawk-of-success-d4aab8@kuoka>
 <ymmn2jgpa4bia2wl4d32ccipybxt4nylz4hspdf2svivk5ao7s@vv7v3soq2e65>
 <9260c217-9c63-4eec-854a-a7ec020d1e65@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9260c217-9c63-4eec-854a-a7ec020d1e65@kernel.org>

On Wed, Jun 18, 2025 at 05:45:22PM +0200, Krzysztof Kozlowski wrote:
> On 18/06/2025 14:15, Jorge Marques wrote:
> >>>
> >>> Signed-off-by: Jorge Marques <jorge.marques@analog.com>
> >>> ---
> >>>  .../devicetree/bindings/i3c/adi,i3c-master.yaml    | 63 ++++++++++++++++++++++
> >>>  MAINTAINERS                                        |  5 ++
> >>>  2 files changed, 68 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml
> >>> new file mode 100644
> >>> index 0000000000000000000000000000000000000000..718733bbb450c34c5d4924050cc6f85d8a80fe4b
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml
> >>
> >> Filename based on the compatible, so adi,i3c-master-1.00.a.yaml
> >>
> > I agree, but I ended up following the pattern for the other adi,
> > bindings. I will move for v4. IMO the version suffix has no much use
> > since IP updates are handled in the driver.
> 
> Filename is not related to whether given ABI works with every device.
> Filename helps us to organize bindings and existing convention is that
> we want it to follow the compatible.
> 
Hi Krzysztof,

Understood.

> >>> @@ -0,0 +1,63 @@
> >>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/i3c/adi,i3c-master.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: Analog Devices I3C Controller
> >>> +
> >>> +description: |
> >>> +  FPGA-based I3C controller designed to interface with I3C and I2C peripherals,
> >>> +  implementing a subset of the I3C-basic specification.
> >>> +
> >>> +  https://analogdevicesinc.github.io/hdl/library/i3c_controller
> >>> +
> >>> +maintainers:
> >>> +  - Jorge Marques <jorge.marques@analog.com>
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    const: adi,i3c-master-1.00.a
> >>> +
> >>> +  reg:
> >>> +    maxItems: 1
> >>> +
> >>> +  clocks:
> >>> +    minItems: 1
> >>
> >> Why?
> >>
> > The IP core requires a clock, and the second is optional.
> 
> OK
> 
> > minItems sets the minimum number of required clocks and the maxItems is
> > inferred from the number of items.
> > 
> > On the IP core itself, one clock is required (axi), and if it is the
> > only provided, it means that the same clock for the AXI bus is used
> > also for the rest of the RTL logic.
> 
> Hm? What does it exactly mean - same clock? You mean one clock is routed
> to two pins? That's still two clocks. Or you mean that IP core will
> notice grounded clock input and do the routing inside?
> 

The routing is inside the IP core, and only one clock pin is used. In
fullness, since it is a FPGA-based IP Core, the number of input clock
pins are defined by the parameter [1] ASYNC_CLK that enables the
asynchronous i3c clock input pin. The devicetree then describes how
things are wired, if two clocks provided, it describes that both clock
inputs, axi and i3c, are wired to the IP Core, if only axi, then there
is no clock signal to the i3c input clock pin and axi clock drives the
whole IP.

[1] https://analogdevicesinc.github.io/hdl/library/i3c_controller/i3c_controller_host_interface.html#configuration-parameters

> > 
> > If a second clock is provided, i3c, it means it drives the RTL logic and is
> > asynchronous to the axi clock, which then just drives the register map logic.
> > For i3c specified nominal speeds, the RTL logic should run with a speed of
> > 100MHz. Some FPGAs, such as Altera CycloneV, have a default bus clock speed of
> > 50MHz. Changing the bus speed is possible, but affects timing and it may not be
> > possible from users to double the bus speed since it will affect timing of all
> > IP cores using the bus clock.
> >>> +    items:
> >>> +      - description: The AXI interconnect clock.
> >>> +      - description: The I3C controller clock.
> > I will update the descriptions to:
> > 
> >         - description: The AXI interconnect clock, drives the register map.
> >         - description: The I3C controller clock. AXI clock drives all logic if not provided.
> > 
> >>> +
> >>> +  clock-names:
> >>
> >> Not synced with clocks.
> >>
> > I will add `minItems: 1`.
> >>> +    items:
> >>> +      - const: axi
> >>> +      - const: i3c
> >>> +
> >>> +  interrupts:
> >>> +    maxItems: 1
> >>> +
> >>> +required:
> >>> +  - compatible
> >>> +  - reg
> >>> +  - clocks
> >>> +  - clock-names
> >>> +  - interrupts
> >>> +
> >>> +allOf:
> >>> +  - $ref: i3c.yaml#
> >>> +
> >>> +unevaluatedProperties: false
> >>> +
> >>> +examples:
> >>> +  - |
> >>> +    i3c@44a00000 {
> >>> +        compatible = "adi,i3c-master";
> >>> +        reg = <0x44a00000 0x1000>;
> >>> +        interrupts = <0 56 4>;
> >>
> >> Use proper defines.
> >>
> > The following can added:
> > 
> >   #include <dt-bindings/interrupt-controller/irq.h>
> > 
> >   interrupts = <0 56 IRQ_TYPE_LEVEL_HIGH>;
> > 
> > Is there any other to be replaced?
> 
> Usually 0 has a meaning as well. Where is this used DTS snippet used (on
> which platform)?
> 

The example provided is used on AMD xilinx arm,cortex-a9-gic.
The IP core is tested on AMD Xilinx, Altera FPGAs (arm, microblaze, arm64).
Test/support to RiscV-based Lattice FPGAs should eventually also come.

In this example 0 means Shared Peripheral Interrupt, but has no header
file defining. I guess I could make it generic and set to

  interrupts = <3 IRQ_TYPE_LEVEL_HIGH>;

and let the user figure out for his target platform.
> Best regards,
> Krzysztof

Best regards,
Jorge
