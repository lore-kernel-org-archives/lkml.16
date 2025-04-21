Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net [60.248.80.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CEBD264F8F
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 12:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.80.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745239363; cv=none; b=nwA08IXSPKamc9VIxojXfM8P/1yO3jWTTJEj0y1UOY7bQnEGbSM0hIPDkXBfuGJlC1+QbZnMUeBkRR9p/I2NfOuethXWvjVyjzh/ugQ3iS/MdCUNF28wwEaT4Vwgcl1HbwYWF1f8j/hTusBNh1oCgqTzQJgn99Q/aRjdtBZxPco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745239363; c=relaxed/simple;
	bh=nRO5OSLtxXidrQVlQfeNk550Tzm4uT/LC9HCLrmY1fs=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T2dVFL3o0bauT6bGd1cuwwYJlb//sgXPfj+zgpnSngC7b9oguAFpFcUGXqm5/84cA9C8Xmw1YFj069OwSv3+/O9eVf4eYA3f1CDJZLWJN8u5HHTTvr/YdDEARMWsPXUjPuO8xVp+h/nUJBVXA6lVAIa3uVHGkyNSTWzOW4EpYMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.80.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from Atcsqr.andestech.com (localhost [127.0.0.2] (may be forged))
	by Atcsqr.andestech.com with ESMTP id 53LCKdH8046275
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 20:20:39 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTPS id 53LCJT2d045671
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Mon, 21 Apr 2025 20:19:29 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from atctrx.andestech.com (10.0.15.11) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Apr
 2025 20:19:29 +0800
Date: Mon, 21 Apr 2025 20:19:29 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: Rob Herring <robh@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <paul.walmsley@sifive.com>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <tglx@linutronix.de>,
        <daniel.lezcano@linaro.org>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <tim609@andestech.com>
Subject: Re: [PATCH 4/9] dt-bindings: interrupt-controller: add Andes
 machine-level software interrupt controller
Message-ID: <aAY30QwzG6/7RWhE@atctrx.andestech.com>
References: <20250407104937.315783-1-ben717@andestech.com>
 <20250407104937.315783-5-ben717@andestech.com>
 <20250407141708.GA2250717-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250407141708.GA2250717-robh@kernel.org>
User-Agent: Mutt/2.1.4 (2021-12-11)
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 53LCKdH8046275

On Mon, Apr 07, 2025 at 09:17:08AM -0500, Rob Herring wrote:
> [EXTERNAL MAIL]
> 
> On Mon, Apr 07, 2025 at 06:49:32PM +0800, Ben Zong-You Xie wrote:
> > Add the DT binding documentation for Andes machine-level software
> > interrupt controller.
> >
> > In the Andes platform such as QiLai SoC, the PLIC module is instantiated a
> > second time with all interrupt sources tied to zero as the software
> > interrupt controller (PLICSW). PLICSW can generate machine-level software
> > interrupts through programming its registers.
> >
> > Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
> > ---
> >  .../andestech,plicsw.yaml                     | 48 +++++++++++++++++++
> >  MAINTAINERS                                   |  1 +
> >  2 files changed, 49 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/andestech,plicsw.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/andestech,plicsw.yaml b/Documentation/devicetree/bindings/interrupt-controller/andestech,plicsw.yaml
> > new file mode 100644
> > index 000000000000..5432fcfd95ed
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/andestech,plicsw.yaml
> > @@ -0,0 +1,48 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/interrupt-controller/andestech,plicsw.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Andes machine-level software interrupt controller
> > +
> > +description:
> > +  In the Andes platform such as QiLai SoC, the PLIC module is instantiated a
> > +  second time with all interrupt sources tied to zero as the software interrupt
> > +  controller (PLIC_SW). PLIC_SW can generate machine-level software interrupts
> > +  through programming its registers.
> > +
> > +maintainers:
> > +  - Ben Zong-You Xie <ben717@andestech.com>
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - andestech,qilai-plicsw
> > +      - const: andestech,plicsw
> 
> Drop the fallback. If you have another implementation that's compatible,
> then andestech,qilai-plicsw will be the fallback.
>

Hi Rob,

Maybe this is a stupid question, but I don't understand the reason for
dropping the fallback. I follow the same logic in commit 1267d9831171
(dt-bindings: interrupt-controller: sifive,plic: Document Renesas RZ/Five
SoC). Thus, I think if there is a new SoC also equipped with Andes
PLIC-SW (NCEPLIC100-SW), the SoC vendor can simply add a new compatible
string under the enum.

Also, I will rename andestech,plisw to andestech,nceplic100-sw if the
fallback string is not dropped.

Thanks,
Ben

> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts-extended:
> > +    minItems: 1
> > +    maxItems: 15872
> > +
> > +additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts-extended
> > +
> > +examples:
> > +  - |
> > +    interrupt-controller@400000 {
> > +      compatible = "andestech,qilai-plicsw", "andestech,plicsw";
> > +      reg = <0x400000 0x400000>;
> > +      interrupts-extended = <&cpu0intc 3>,
> > +                            <&cpu1intc 3>,
> > +                            <&cpu2intc 3>,
> > +                            <&cpu3intc 3>;
> > +    };
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index a0ccac1cca29..645d7137cb07 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -20728,6 +20728,7 @@ F:    include/linux/irqchip/riscv-imsic.h
> >  RISC-V ANDES SoC Support
> >  M:   Ben Zong-You Xie <ben717@andestech.com>
> >  S:   Maintained
> > +F:   Documentation/devicetree/bindings/interrupt-controller/andestech,plicsw.yaml
> >  F:   Documentation/devicetree/bindings/riscv/andes.yaml
> >
> >  RISC-V ARCHITECTURE
> > --
> > 2.34.1
> >
