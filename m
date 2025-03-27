Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6C120D504
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 09:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743069489; cv=none; b=KtWCASXaMPJnxsrjLXIiQa9cWKpzit30SAD/pHa9IeMIQLB3rnG2/d1s0uv5E0tRZ7X5LEBwPhJn2GpLhKR7QAsiAup/ZW2LmBRT9reulIcLMqY0XSfB7r4v9/EHTFgFmaLBFwQAodizTH/I6Stom/pBrNXoBiVFwo79PpqYQzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743069489; c=relaxed/simple;
	bh=p3JC4yQhrsYhpFs8EKo57zPThjeS/Gbcpw5YS1QEuI4=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=agd4yhl4vVtz/QElR0wXrWq0eesRA/N4g+cJLyAXj1OvUPL/7I0rHWjEhcNMZExsav+fOFeqCpVLIsDK9F97xoWyF0aXZ6K9gBLIDJnSCFDXSJwHk9X80LSjHAbOlFNB+PW8WhMBWzk9AKmOs7k4fhtFQKRJqpn4/1YSiTD1zMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=kG+/ZIg7; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="kG+/ZIg7"
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A977B3FE2F
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 09:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1743069163;
	bh=B77IjrCuB6vIebp/9p2+ET8GiOtyI9dx9sa72qBo+cs=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=kG+/ZIg7s24EVWtPf3XKfIm1jil8ZtsoxNK+5eOD3TiO9Azs91VwzGnDa2JAryzJT
	 aQRTtLfhl0aH63EH33ByxYyb4PL+IFhWiklxIRumORZaDk2Pll1Gx4hpRPGpP6y8vN
	 ObLPwb2bB4sFnrum/fkCDPbsgTkVYv3C+dHb8/DU6XUHJvLyvug3ElJ3BEzyRjv4Ui
	 //FJOeAHqky3Oj/0gCFz4GEeQJ0I+ANtUdirkL6XAr9F1PEg1qVnsB2vQsd4oDmx46
	 3GdRSTc8OWFSoT+l2ik7c6YqoIWz4zxrg8nbcLcLkdE4qNg/nm6kO4CxdxUDXXpK9P
	 yYWo5Ao9qSxFg==
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-601e231e8d2so622311eaf.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 02:52:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743069162; x=1743673962;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B77IjrCuB6vIebp/9p2+ET8GiOtyI9dx9sa72qBo+cs=;
        b=aY4uzf7y+2Kni2BfnItL6UxD/A9fyfHsMVH7k2rNV6A4Dz17Wev5QrY/eXXsrF497Q
         s4Cjp87CV5cFdXUi/ckOpe0wHX0/eISCeEJIGn695uG8hPdPtN0NcYbOl2GCrpe8LxwY
         VYbhCFWPOOyk3JI4lejv7QZaiA+/m60bMOx39kZAF9BFP6297EB4HZptalKj/uuZIJ5t
         Gau4XG0PaEZj1ba7SobFyAXrtKalp9vMgS6qnb6eOYs9yotJk8Y1vfyNpD99h0Pj/3SN
         sHJhFhephV1HGud81mRC9R+9/v/arb08JRM59Gez0ExhaHnYA6BP5gaye9lxPQb6oUu/
         P0Bw==
X-Forwarded-Encrypted: i=1; AJvYcCWhygehkEJQFqrkAP6O+UhFgALXytnNlWbswbX4b6VUFuaXABuus4cfbHzSPHZqa3tSgVKwp0a0lT/2zFs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkB4D2wqzqakmYe3e3RXzy5dK5mX+xiUCRRZ+YztPPxa+GRJ4D
	P+R0d3im+XBkiY8P5vZj2E7z47cqu7q2N17xu8rimg5GWVjW81UJEM6RwCZfL372kFXo6C9UrQz
	+rQysW5OcmbyM6iOABFJDV5iO90biyM3a7O4Xsbri7wiOZIpwRrQiUlRgM2aB531xCkQvvrPRl7
	K1eZ1Gpv6IqMr1gnRoZlw54zQ2SbcBsI4BkqVzHrQ05oMSuPaispMk
X-Gm-Gg: ASbGncvuZ8Awp/qG3GAiwmgha1qjtmdjVVoxXCug8E2vm24ESLGyWhKytfV0wDAitQy
	Ngd6idC9ATCZ8lZ8eY7VchNt3MJ++CwHNgwJpFSqeS+GCa0eFpSzlM4Qi0883cHyIaVoIVBql
X-Received: by 2002:a05:6870:d24f:b0:2c1:504f:42ed with SMTP id 586e51a60fabf-2c84819f95bmr1979674fac.29.1743069161479;
        Thu, 27 Mar 2025 02:52:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE83awQwNx+dMBWzJP2MzicfAHDKESqCJA4TNMWkSjbXkwlUAjf18/JZSrbIX0oCS21SczuNPt9Cl5/K55Brwg=
X-Received: by 2002:a05:6870:d24f:b0:2c1:504f:42ed with SMTP id
 586e51a60fabf-2c84819f95bmr1979649fac.29.1743069161029; Thu, 27 Mar 2025
 02:52:41 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Mar 2025 02:52:40 -0700
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Mar 2025 02:52:40 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <CH3PR04MB89282DDB25C289C34581DC0083A62@CH3PR04MB8928.namprd04.prod.outlook.com>
References: <20250320105449.2094192-1-pinkesh.vaghela@einfochips.com>
 <20250320105449.2094192-10-pinkesh.vaghela@einfochips.com>
 <CAJM55Z-LUoeh0pSDnPKpduub_UBOPeg4g3t20JA0GBosJKuiAQ@mail.gmail.com> <CH3PR04MB89282DDB25C289C34581DC0083A62@CH3PR04MB8928.namprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Thu, 27 Mar 2025 02:52:40 -0700
X-Gm-Features: AQ5f1JqCbdx_VNT37OdJPVr3F0efA0rT47C_sey_CmVIAYSwd2z2XmZaZ3-bc1k
Message-ID: <CAJM55Z9=0sxXiC20OEe=W0E5S_jHd6JW+7SWvW5JFiu4vpr=nQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] riscv: dts: add initial support for EIC7700 SoC
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Conor Dooley <conor@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Min Lin <linmin@eswincomputing.com>, 
	Pritesh Patel <pritesh.patel@einfochips.com>, Yangyu Chen <cyy@cyyself.name>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Yu Chien Peter Lin <peterlin@andestech.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Kanak Shilledar <kanakshilledar@gmail.com>, 
	Darshan Prajapati <darshan.prajapati@einfochips.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Aradhya Bhatia <a-bhatia1@ti.com>, "rafal@milecki.pl" <rafal@milecki.pl>, Anup Patel <anup@brainfault.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Pinkesh Vaghela wrote:
> >
> > Hi Pinkesh,
> >
> > Thank your for the patches!
> >
> > Should this not be marked dma-noncoherent to avoid having to mark each
> > peripheral as such?
>
> Thanks for your feedback.
>
> We have not added "dma-noncoherent" because there are no DMA-capable
> peripherals in the devicetree yet.
> We planned to add this later when we add any DMA capable devices
> i.e. sdhci, gmac, sata, pcie, spi.
>
> Do you recommend to add this property in current version?

Yeah, Conor also answered this already.

> > > +             gpio@51600000 {
> > > +                     compatible = "snps,dw-apb-gpio";
> > > +                     reg = <0x0 0x51600000 0x0 0x80>;
> > > +                     #address-cells = <1>;
> > > +                     #size-cells = <0>;
> > > +
> > > +                     porta: gpio-port@0 {
> >
> > Maybe these labels could be something like gpioA, gpioB, etc. to not be
> > confused with an HDMI port fx.
>
> The gpio node labels are based on the example provided in
> "snps,dw-apb-gpio.yaml" dt-binding and other dtsi.
>
> Could you clarify more on how these labels cause confusion with HDMI
> port as I don't see any example for HDMI port using name as porta, portb?

Sure. Try git grep 'port.*:' -- '*.dts*' and you'll see that "port" labels are
used for many things that aren't GPIOs. It'll be a lot easier to scan through
the device tree and see what <&gpioA 27 0> references.

/Emil
