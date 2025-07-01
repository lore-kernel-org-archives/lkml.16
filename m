Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CAD6239E82
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 09:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751363542; cv=none; b=PIfB1TN2C2JYt5SP3LJruWDexvcTRJhWjm7UUGqE5LIvArMIoXoNuWo26WctbMZabP5sINrcDeLmIqORCaVbImIZI7cRHyO5aqOcXNckNCR9Tu9UWX2KDgUqsSwvAciNDriaTix0jAP1mD70gdaYHCqPCt6z+4t1lh4A/GCtzg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751363542; c=relaxed/simple;
	bh=Od6JdPcnkvsl/bR/hf7XDyqJsEJSHXYwNg4QbKnbiNM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PudhTkGO0JTAUZ/8BakhTGmP4R51ur9ln0NoBswUaWo/JhesFmoF96buaOq3/ReF9xxIcykzfxgFcw/xVrWuXTO8tV9lYwvT2lVPLcA8jH6nlAFuM25fKTK97HE8bEgy1oVg0GWpJT71rcCNSlx1M1IkFNdr1aGaRUGMW+BfvAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=PGJo+ngT; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="PGJo+ngT"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e81ec95d944so5651014276.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 02:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751363538; x=1751968338; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IKA6FwPF97E3KxijHqFbWyBNdWNWu66wkqfXYan6V+A=;
        b=PGJo+ngT3mA+Bk6kTf1DWDLGCk5eKaa9IG+FF/3ikN2V9SE/WxpLLFQRmp3o8sRV0v
         efmDIaEtIw7xCfZkCg84kVlLsKkQQywfz/du1cQm2M9pZQtKYNb5vKaw0ZkYjaKjVtZ5
         HxA+O3ruYU2K4Oi3IdreSNeIEHjBvGowZoRmQbjDBRIrr/NAy4KkF5YbTd3Nw5C4E5DX
         ibd7cmEOwn45zf96Hg0dF/akk7UZBj3PW+hH5/9/Pfm9ka6dkyI/0gyJALZ2+gKpoyBb
         kf1HLEI1TVcmk9fjHc4jdeVcIwDcxOGHZRcPP13yyCGx8fT49uNjIIgKqp/jBz7I4bZS
         TUYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751363538; x=1751968338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IKA6FwPF97E3KxijHqFbWyBNdWNWu66wkqfXYan6V+A=;
        b=rQaBs+GDNwM2XC42dZEjAqvduXHEz7kbIVEGkPCy4GblNEkLIyavKdSRNsR4MsZKUi
         VjV89fTwfkyb0A1erZXjGkOUSJd4baSaaCqvEwfbTZWPIBpCGEMN7Q/Y6GKtsI1l3v5X
         M8af6cr/4IxfY0QwjvuXMzDrGCElDubyIRy7pkS2aH9VRPYrfoeguHlUKIQqzicGqOvA
         7VBOVH7Y/F11WzTNmtgp/f0Gy+tjPWv4jbC7V7hDGrEajGDbIA8mDtUUnqufIgRYOSPh
         77PQNW6GDckAcRh5q0sVm7xKhP6DoPuIh86vaWvXMBnk89BKCxypTUKAEkLb5067a5ve
         JUjw==
X-Forwarded-Encrypted: i=1; AJvYcCWkcf4d9lxBLTD8/tvmyj0UC730GHaV2lLVv2SzEHRppXU9Qx7x/X0nObIFQ2Aa17EG8Vb8BBN2ayhhWHo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmPPgF8oB6qwko+i8NVxUIITMudNbKCG/11LvkIum3JFLBpSjL
	rUoXhoCWAdYymfK2ZxisuTho70tj9HaM4jotK8LBllLu19Y58cYq/xpo8Xu3rYL/5mHCCaFCXPh
	S1GdMMXW8PTimliM63cedpswRIRRZ5c7nICqfYDvpKA==
X-Gm-Gg: ASbGncsUVSuIB14oSwlBj2rzNgB0K1j3PGuZAV4Z0aEz4TR2rV2I6O+P3v6tnJcWR08
	n4TBm+Ucyk+DYFspWHqXdpiYdX4+Q9DBNb6+UvLfnzLE0Wzr9t5CgaKX2im/bXb4XnPecIaoJzh
	VgD0Es33OrkmODOM2ClRbfJvLWw44a4tcRTiD3655ZcdwkgcFxHwh19vvZAfE=
X-Google-Smtp-Source: AGHT+IGzHyECCHeiUYQOgvHa6UJ9WkRPSzDk6WELLYNag9ls2mHas7vRAKuqf10+XgRIe5X8BpYEYpQLbmrpRpbXWcM=
X-Received: by 2002:a05:690c:6102:b0:711:6ea1:8d12 with SMTP id
 00721157ae682-7163ee4d03dmr40769417b3.1.1751363538182; Tue, 01 Jul 2025
 02:52:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250701-working_dma_0701_v2-v2-0-ab6ee9171d26@riscstar.com>
 <20250701-working_dma_0701_v2-v2-1-ab6ee9171d26@riscstar.com> <de965773-bab1-4c50-b111-19896465e53e@kernel.org>
In-Reply-To: <de965773-bab1-4c50-b111-19896465e53e@kernel.org>
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 1 Jul 2025 17:52:07 +0800
X-Gm-Features: Ac12FXxrwUxphoCfQfkTD7volCQBmLx90I-g-CSXGPV4ZQwkJtWnCbMfwgC8RlU
Message-ID: <CAH1PCMbKGeXL9Te6M28ZdX8VBvaToKcK7f+JmN6JsCfttG_Mtg@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] dt-bindings: dma: marvell,mmp-dma: Add SpacemiT K1
 PDMA support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	=?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alex Elder <elder@riscstar.com>, 
	Vivian Wang <wangruikang@iscas.ac.cn>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Krzysztof

On Tue, Jul 1, 2025 at 3:35=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 01/07/2025 07:36, Guodong Xu wrote:
> > Add "spacemit,k1-pdma" compatible string to support SpacemiT K1 PDMA
> > controller. This variant requires:
>
> Why is this marvell? This should be explained here, it's really unexpecte=
d.
>

SpacemiT K1 SoC uses the same DMA controller as Marvell MMP. They share mos=
t
of the registers (and address offsets) and only enhanced in addressing spac=
e
capability (from 32bit to 64bit).

Also, spacemit,k1-pdma and marvell,pdma-1.0 use the same driver (mmp_pdma.c=
),
that's the reason why I chose keeping them in the same binding file.


> > - clocks: Clock controller for the DMA
> > - resets: Reset controller for the DMA
> >
> > Also add explicit #dma-cells property definition with proper constraint=
s:
> > - 2 cells for marvell,pdma-1.0 and spacemit,k1-pdma
> >     - (request number + unused)
> > - 1 cell for other variants
> >     - (request number only)
> >
> > This fixes "make dtbs_check W=3D3" warnings about unevaluated propertie=
s.
>
> How can I reproduce these warnings? Looks like this is not relevant
> here. Each patch is applied one after another and commit msg must be
> correct at this point.
>

You're absolutely right about the commit message needing to be accurate
at this point. The dtbs_check warnings only occur when compiling board DTS
files that contain nodes with marvell,pdma-1.0 or spacemit,k1-pdma
compatible strings - specifically when PATCH 7 of this series.

I'll revise the commit message to better reflect that this patch enhances
things, rather than claiming it "fixes" warnings at this stage.

>
> >
> > Signed-off-by: Guodong Xu <guodong@riscstar.com>
> > ---
> > v2:
> > - Used more specific compatible string "spacemit,k1-pdma"
> > - Enhanced DT bindings with conditional constraints:
> >   - clocks/resets properties only required for SpacemiT K1
> >   - #dma-cells set to 2 for marvell,pdma-1.0 and spacemit,k1-pdma
> >   - #dma-cells set to 1 for other variants, ie.
> >       marvell,adma-1.0 and  marvell,pxa910-squ
> > ---
> >  .../devicetree/bindings/dma/marvell,mmp-dma.yaml   | 49 ++++++++++++++=
++++++++
> >  1 file changed, 49 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/dma/marvell,mmp-dma.yaml=
 b/Documentation/devicetree/bindings/dma/marvell,mmp-dma.yaml
> > index d447d5207be0436bc7fb648dffe31f8b780b491d..7b5f7ccfc9dbb69bfef2501=
46cba5434548f3702 100644
> > --- a/Documentation/devicetree/bindings/dma/marvell,mmp-dma.yaml
> > +++ b/Documentation/devicetree/bindings/dma/marvell,mmp-dma.yaml
> > @@ -18,6 +18,7 @@ properties:
> >        - marvell,pdma-1.0
> >        - marvell,adma-1.0
> >        - marvell,pxa910-squ
> > +      - spacemit,k1-pdma
> >
> >    reg:
> >      maxItems: 1
> > @@ -32,6 +33,19 @@ properties:
> >        A phandle to the SRAM pool
> >      $ref: /schemas/types.yaml#/definitions/phandle
> >
> > +  clocks:
> > +    description: Clock for the controller
> > +    maxItems: 1
> > +
> > +  resets:
> > +    description: Reset controller for the DMA controller
> > +    maxItems: 1
> > +
> > +  '#dma-cells':
> > +    description:
> > +      DMA specifier, consisting of a phandle to DMA controller plus th=
e
> > +      following integer cells
>
> Why do you need it here? Isn't this coming from dma common schemas?

Thanks for pointing out this. It should be removed.
I will fix it.

> > +
> >    '#dma-channels':
> >      deprecated: true
> >
> > @@ -52,12 +66,47 @@ allOf:
> >            contains:
> >              enum:
> >                - marvell,pdma-1.0
> > +              - spacemit,k1-pdma
> >      then:
> >        properties:
> >          asram: false
> >      else:
> >        required:
> >          - asram
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: spacemit,k1-pdma
> > +    then:
> > +      required:
> > +        - clocks
> > +        - resets
> > +    else:
> > +      properties:
> > +        clocks: false
> > +        resets: false
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - marvell,pdma-1.0
> > +              - spacemit,k1-pdma
> > +    then:
> > +      properties:
> > +        '#dma-cells':
> > +          const: 2
> > +          description:
> > +            The first cell contains the DMA request number for the per=
ipheral
> > +            device. The second cell is currently unused but must be pr=
esent for
> > +            backward compatibility.
> > +    else:
> > +      properties:
> > +        '#dma-cells':
> > +          const: 1
> > +          description:
> > +            The cell contains the DMA request number for the periphera=
l device.
>
>
> It's getting complicated. I suggest to make your own schema. Then you
> would also switch to preferred 'sram' property instead of that legacy
> 'asram'.
>
> Really, ancient schemas should not be grown for new, completely

The reason that they share the same device driver may not be strong enough
compared to what you said here.

> different platforms.
>

Complexity wise, I agree with you. I should admit that I haven't dug into
the history enough. Anyway, unless other people have strong opinion, I will
create a new schema namely spacemit,k1-pdma.yaml

Thanks Krzysztof.

BR,
Guodong


>
> Best regards,
> Krzysztof
