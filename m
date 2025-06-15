Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78802D2FB;
	Sun, 15 Jun 2025 01:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749951770; cv=none; b=G9pcWc/ZVqA/UiYM8TXrSc2SvN7WnmwU/Syh+FbWBQUA9Rt0htqbqWkAW1qiShzuES0SNTFB47F6SF6tn7ifugzhQXR5LfXPyRl2eNp7i55E2FXP0SEZTjGlwLwzw4WNb1sAvrmB1kpBLeAuDx7dncz+i/Bh7sx4puaxiINZ6lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749951770; c=relaxed/simple;
	bh=hUsudwWSbrDY74Me4I8ISvrmEGy1vwtv61ce/Y0YldQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dxyZsQB7TNwBdb5ikgFdqCPZhhiGabvQQ17sPWaJ5zXL9PGTFrhfYPAyyPwSmHFosZ73XJE0OcoqrwiJC1caNVOXQ28y9h0CBZC2739tRwrmS80XXvAeD6iOZ0gl7vR9l4axqPb59gziYnDqC9Xia2oD41zhv2Ae28SUTKTMQSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g005+n6H; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g005+n6H"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b2fca9dc5f8so2431707a12.1;
        Sat, 14 Jun 2025 18:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749951768; x=1750556568; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SrxySgbd2izx1maOgVxP9ZTfn4E4sjc7PUTQCsZRh48=;
        b=g005+n6HrnpR5YrQXGxzTVxQZEf3v6xoioEsGP36EkDL6UJktDYDXE0x39pTfRwA9M
         5/KWFuryrP9L8gYTg4LwUcyFlbiLFDkaOcdH7hQAh9pO8CTBO55+f6lzoHJlCbtg8frs
         vnmKkmFYvOD1kxIDx/gefdWI6y9Qrzhwjd69KuDEw90jUTEo/YuN4fWldW1D8yZyQmTP
         yHmVY6O5a5qeGe5uNVokzguxCUAiS/4uKTo0c2BkEGN+fgCa+Hgpn9cpAHpK7x1viYSe
         0gwxvAg2wlIBB4SOW0LOTndFEUgf8hNsGJs9eC/O5K0/BbWshb9KV0UI8mse95i16t8h
         3uMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749951768; x=1750556568;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SrxySgbd2izx1maOgVxP9ZTfn4E4sjc7PUTQCsZRh48=;
        b=szBNJ/FZJwefxZ3hx2NSt3EykzT7NE0LtzfALYO/yjAW9K23X4IIepHWcTHhM7uo3l
         u7Y0SBqxk/V5ZRrQRz1jfyOywLkBfQIKaF3g6dXoYjjH8jsetcCIHcacOufwX4Byya55
         FhAXcpLYdCQZUymVGG+9jwmC+zF77qZ+ui4RLWufqUF/628buQbpfRPnFW7fY8fCJ93K
         3V01TGlA/XO/14lwvVNBeVc1TXnQpUJhlufZoyTohjlEAjW3wjLPtawUKja6XW3LeTgm
         GNRRUK89/afgfw91TAONdgyTPBZIxw2iFpCUZxALU8R1sUkuqfMlestbx1A/S0YI/tcT
         SDKw==
X-Forwarded-Encrypted: i=1; AJvYcCWsKnypJ2X+w8HQI+OokA89O/dPBqfy+OEHGmC4xH86GQM+YP/Nxg/4SrhfPqSSNHLEZY3YcOGli//KLTsH@vger.kernel.org, AJvYcCXhc9cHubN7Osr1H9CyNAsxnyW3+zsDNKfsfUaDll2zLzX3GjVHmRLDD6kp9OZzCpDIxw9/4l6lC2OY@vger.kernel.org
X-Gm-Message-State: AOJu0YzxYScJBKMrbWEfbUdfMNwCiWtI53nlg75XU3mNpdGNhh1vaCQD
	6W+8mHF5vdEgKy112cjmEXSmBDWJbG/0qsgaCQkQxXPbop7iROKhu4qU
X-Gm-Gg: ASbGncvkV2JxT1ApLDsrSPaIWwBSfo5b1aKDvu7BEI4orRdqTfs8nBFGwMx8SpNA199
	eArLbzHNef/d4zQjkmPi9WfmE8/cH9L/g23ekPbaBRLkWwtm7zisb3L7eQG46Zsm2misVoHW47Q
	AU9c8FY0pObcgdXIPeVMVqrkDiILEJqVk6t/qLY+rBBGwAlHBuA1wHUYwkn5j6XPo0byLBkwRpC
	bgPnCFZNT47LOaHJll+iT960dvzhmcXVE1K7ayeqf3ckH8rzgIIPVXjACEGurSELeW8yIVqtrX3
	EGpri/anjIF6uOR5M11PRL2YIo2PmjRETre5jmUXzXUHfwHVqEFuh1i272oQjQ==
X-Google-Smtp-Source: AGHT+IFQJycihrzqStgqBch1SxHHFFK4UJbfgDZpFK6aOcFb18jbAbwV9uqWfmoR+F4PY5gp6uTNHQ==
X-Received: by 2002:a05:6a21:3982:b0:201:2834:6c62 with SMTP id adf61e73a8af0-21fbd5f2087mr6758634637.25.1749951767631;
        Sat, 14 Jun 2025 18:42:47 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-b2fe163a470sm4139687a12.9.2025.06.14.18.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 18:42:47 -0700 (PDT)
Date: Sun, 15 Jun 2025 09:41:34 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Conor Dooley <conor@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Yu Yuan <yu.yuan@sjtu.edu.cn>, Yixun Lan <dlan@gentoo.org>, Ze Huang <huangze@whut.edu.cn>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH RFC 1/3] dt-bindings: soc: sophgo: add TOP syscon for
 CV18XX/SG200X series SoC
Message-ID: <z2msqxjwfwieqafr4trj4xvdam5tapfl3ls65vecgtgpz2f2zw@rv6zd5ovsjz7>
References: <20250611082452.1218817-1-inochiama@gmail.com>
 <20250611082452.1218817-2-inochiama@gmail.com>
 <20250612-culpable-roman-295df1360198@spud>
 <y6dkhbc4x5qvd3z2yyh3ba7zkq7gphcnrc5757fxlmpz3zh2nb@tk65ldng6oyl>
 <20250613-paving-reimburse-fa5ed8c40c7f@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613-paving-reimburse-fa5ed8c40c7f@spud>

On Fri, Jun 13, 2025 at 03:23:26PM +0100, Conor Dooley wrote:
> On Fri, Jun 13, 2025 at 06:09:47AM +0800, Inochi Amaoto wrote:
> > On Thu, Jun 12, 2025 at 05:04:46PM +0100, Conor Dooley wrote:
> > > On Wed, Jun 11, 2025 at 04:24:49PM +0800, Inochi Amaoto wrote:
> > > > The Sophgo CV1800/SG2000 SoC top misc system controller provides register
> > > > access to configure related modules. It includes a usb2 phy and a dma
> > > > multiplexer.
> > > > 
> > > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > > > ---
> > > >  .../soc/sophgo/sophgo,cv1800b-top-syscon.yaml | 57 +++++++++++++++++++
> > > >  1 file changed, 57 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml
> > > > new file mode 100644
> > > > index 000000000000..e8093a558c4e
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml
> > > > @@ -0,0 +1,57 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/soc/sophgo/sophgo,cv1800b-top-syscon.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Sophgo CV18XX/SG200X SoC top system controller
> > > > +
> > > > +maintainers:
> > > > +  - Inochi Amaoto <inochiama@outlook.com>
> > > > +
> > > > +description:
> > > > +  The Sophgo CV18XX/SG200X SoC top misc system controller provides
> > > > +  register access to configure related modules.
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    oneOf:
> > > > +      - items:
> > > > +          - const: sophgo,cv1800b-top-syscon
> > > > +          - const: syscon
> > > > +          - const: simple-mfd
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +  "#address-cells":
> > > > +    const: 1
> > > > +
> > > > +  "#size-cells":
> > > > +    const: 1
> > > > +
> > > > +patternProperties:
> > > > +  "dma-router@[0-9a-f]+$":
> > > > +    $ref: /schemas/dma/sophgo,cv1800b-dmamux.yaml#
> > > 
> > > I think you're supposed to add "unevaluatedProperties: false" to each of
> > > these nodes.
> > > 
> > 
> > This is is OK for me.
> > 
> > > > +
> > > > +  "phy@[0-9a-f]+$":
> > > > +    $ref: /schemas/phy/sophgo,cv1800b-usb2-phy.yaml#
> > > 
> > > Why are these permitting random addresses? Are they not at fixed
> > > addreses given that you only support one platform (modulo the rebrand)?
> > > 
> > 
> > IIRC, they are fixed address. I use random addresses as I see many one
> > in binding do the same. Should I switch to the fixed one?
> 
> If things are actually possible to have at variable addresses, then sure
> use pattern properties and a regex. It may be like that if a new device
> is released that reuses the dmamux or phy but locates it differently or
> on a platform with multiple phys etc. If not, then then just restrict the
> address to the only permitted one.

Great, Since all the CV1800 devices I can reach have the same register
layout, I will switch to fixed address.

Regards,
Inochi
