Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A262F5B
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 02:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749869645; cv=none; b=qs66bsrr1IObr40PblZL+1W1AMEj8rT0Myw9/+D/hx0MrBt3CaUlk85z7vKrOZD4bbUFp55TgE8DJNeNd1C4aaf3hjuc1OA6hsPqTAMWh1VcbBuveVRwQeNfUuBR/Qhk6WNFuDdeWhTXbOpaW8NsnIJJda2aeAlNFAU5Sx0aM3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749869645; c=relaxed/simple;
	bh=w4scoFNKuQowY9iouTExwAiGSnUFMmeHza5XmTbM8DE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r8CCvtxtsDr2I8IcT7dxmkrj7cQhQ8yApcj0abG3RpfTRd7hkl2t/qHutTXNWZ7i1mHU2zimsjAMR4w1iZRtXXExu5bRoVfHiG+zdtvVSqsYZCwOTrjJL12i5At+d+Eycl+emxCJ641SW8dsdlj6FZPQVkopkn08+6YoikJpMiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=UV8JJNum; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="UV8JJNum"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-70f147b5a52so19727617b3.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 19:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749869641; x=1750474441; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=31krmauOoYJOnjYbVjbtfjUBqSgAaFlcEYULl0apEAg=;
        b=UV8JJNumZRYANlCrL2X0QCxDQh0HefgsP1kGT/SZOcWBhzUA1A9j0MwB1/0DNMh6J2
         OJNCGOxXnRmFzE4j79SR565KSTS0O3mQvd9APcFjahVJxNxQ0KdhcVr88YRBsHs88J3F
         fbMRTNrEVfTLBmYGT59DKt7wSyGtDEk6j5IO7ZugzpQI+QAMR2NfKweUaL/QRH9Bwcoa
         KEoVl1KpV2JjDLAQTDjpwq5UswTQmcuiaq43K2GkdNU8BkWkggddh5KFOfSiKn3nUC8q
         WR2jRLL0Z/brnJHqlMegiRnD3ZfYE79t9TJDnmJE9YV6BHFYaM8t4Q7ks+7lubdyAxn6
         0GIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749869641; x=1750474441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=31krmauOoYJOnjYbVjbtfjUBqSgAaFlcEYULl0apEAg=;
        b=dBdGMKp9hMFd/ZduMQDC5EnYkOk+Ms9QGUQDk8F3BK8LF1XPP/DQc/5l5WsXkdHZb6
         R9VIfytyYmBGyYvfeBeOVDN9l9lVYxi07vu5x6UW1z3nhU6PU1gnA+HkW5XK+3V4FDV/
         1mtnnThfoLPi8eINQouN+3HWc13bZdrfVRr3M+YjTSTTrl/TmRtrCdP4WVHYSl7Fcr6h
         wrR2phKSlfWyLWJYoPBCGzYLOo+YBkp/8FmI113xz/c1Y9J7scVGVFRH8SdMQqU7KH/J
         +IeosQtl8TP6OeF+d0fXt2u9icB5TTsyLnxdQrn4YIprnLPyHdf8UHWVDOl1AnZUAoVi
         MvoA==
X-Forwarded-Encrypted: i=1; AJvYcCWZzUTRzyf+bNmqZAt6Ed2vO05rDb+/MOu03vqw3SXLqQoBfMbabKs1rsKkH+ODWb+EDbS9hWXDBaqiGa0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjs7jKZUFM2Kj5vjpFrvSM9jKKU6h4UBqAy/tTFdAH3MQJevON
	jhTyi4d/lrPKh6OoM4v7MdcQgTNluF2ybC3yPAOcA8k2ktoTJ4LZZE+xiaxQqPq8R933UQn8U4r
	vLJIwxCJ15hMRBdvc8yXFeBOCpfhj6RE0F9YxoaaNiQ==
X-Gm-Gg: ASbGnctYdoC3L/0LD8aG/PmbFm9e95z/qCseMix1PzsTvKafgX5pvY4sF+geVnjVMfz
	tOmYfowqM4ogqvgH1A9UTnalD+W8OD7Fjswrqb8vOl188wdGX+a7eXk1jbX8s5nsNncJcWXWDen
	crls/C4yMidwQlTcez3AXXftCs+QD2uxINYI+/zhjjEBpA
X-Google-Smtp-Source: AGHT+IHcwod9d585wIy9espWy9CTasZig0QiZOdlUQMf/BDe2eeDnXq8w+5El8L8W1GrR0B+DqxTxKI2/p3Xm8YnRRM=
X-Received: by 2002:a05:690c:7448:b0:70d:ff2a:d686 with SMTP id
 00721157ae682-71175440983mr25217457b3.28.1749869640812; Fri, 13 Jun 2025
 19:54:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611125723.181711-1-guodong@riscstar.com> <20250611125723.181711-6-guodong@riscstar.com>
 <2b17769e-2620-4f22-9ea5-f15d4adcb27b@dram.page>
In-Reply-To: <2b17769e-2620-4f22-9ea5-f15d4adcb27b@dram.page>
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 14 Jun 2025 10:53:48 +0800
X-Gm-Features: AX0GCFt1J7cK2ONSBYRJxYGgLZ03DM7CsbEBM2NtLfq6P5d7b2_ITgbQ_ARUd5g
Message-ID: <CAH1PCMaC+imcMZCFYtRdmH6ge=dPgnANn_GqVfsGRS=+YhyJCw@mail.gmail.com>
Subject: Re: [PATCH 5/8] riscv: dts: spacemit: Add dma bus and PDMA node for
 K1 SoC
To: Vivian Wang <uwu@dram.page>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	dlan@gentoo.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de, drew@pdp7.com, 
	emil.renner.berthing@canonical.com, inochiama@gmail.com, 
	geert+renesas@glider.be, tglx@linutronix.de, hal.feng@starfivetech.com, 
	joel@jms.id.au, duje.mihanovic@skole.hr, Ze Huang <huangze@whut.edu.cn>, 
	elder@riscstar.com, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 11:07=E2=80=AFAM Vivian Wang <uwu@dram.page> wrote:
>
> Hi Guodong,
>
> On 6/11/25 20:57, Guodong Xu wrote:
> > <snip>
> >
> > -                     status =3D "disabled";
> > +             dma_bus: bus@4 {
> > +                     compatible =3D "simple-bus";
> > +                     #address-cells =3D <2>;
> > +                     #size-cells =3D <2>;
> > +                     dma-ranges =3D <0x0 0x00000000 0x0 0x00000000 0x0=
 0x80000000>,
> > +                                  <0x1 0x00000000 0x1 0x80000000 0x3 0=
x00000000>;
> > +                     ranges;
> >               };
>
> Can the addition of dma_bus and movement of nodes under it be extracted
> into a separate patch, and ideally, taken up by Yixun Lan without going
> through dmaengine? Not specifically "dram_range4", but all of these
> translations affects many devices on the SoC, including ethernet and

It was not my intention to add all the separate memory mapping buses into
one patch. I'd prefer to add them when there is at least one user.
The k1.dtsi at this moment, as I checked, has no real user beside the
so-called "dram_range4" in downstream vendor kernel (ie. dma_bus in this
patch). And that is what I did: grouping devices which share the same
dma address mapping as pdma0 into one single separated bus.

The other buses, even if I add them, would be empty.

What the SpacemiT team agreed upon so far, is the naming of these separated
buses. I listed them here for future reference purposes.

If needed, I can send that in a RFC patchset, of course; or as a normal
PATCH, if Yixun is ok with that. However, please note, that would mean more
merging dependencies: PDMA dts, ethernet dts, usb dts, will have to depend
on this base 'buses' PATCH.

Again, I prefer we add our own 'bus' when there is a need.

+       soc {
+               storage_bus: bus@0 {
+                       /* USB, SDH storage controllers */
+                       dma-ranges =3D <0x0 0x00000000 0x0 0x00000000
0x0 0x80000000>;
+               };
+
+               multimedia_bus: bus@1 {
+                       /* VPU, GPU, DPU */
+                       dma-ranges =3D <0x0 0x00000000 0x0 0x00000000
0x0 0x80000000>,
+                                    <0x0 0x80000000 0x1 0x00000000
0x3 0x80000000>;
+               };
+
+               pcie_bus: bus@2 {
+                       /* PCIe controllers */
+                       dma-ranges =3D <0x0 0x00000000 0x0 0x00000000
0x0 0x80000000>,
+                                    <0x0 0xb8000000 0x1 0x38000000
0x3 0x48000000>;
+               };
+
+               camera_bus: bus@3 {
+                       /* ISP, CSI, imaging devices */
+                       dma-ranges =3D <0x0 0x00000000 0x0 0x00000000
0x0 0x80000000>,
+                                    <0x0 0x80000000 0x1 0x00000000
0x1 0x80000000>;
+               };
+
+               dma_bus: bus@4 {
+                       /* DMA controller, and users */
+                       dma-ranges =3D <0x0 0x00000000 0x0 0x00000000
0x0 0x80000000>,
+                                    <0x1 0x00000000 0x1 0x80000000
0x3 0x00000000>;
+               };
+
+               network_bus: bus@5 {
+                       /* Ethernet, Crypto, JPU */
+                       dma-ranges =3D <0x0 0x00000000 0x0 0x00000000
0x0 0x80000000>,
+                                    <0x0 0x80000000 0x1 0x00000000
0x0 0x80000000>;
+               };
+
+       }; /* soc */

> USB3. See:
>
> https://lore.kernel.org/all/20250526-b4-k1-dwc3-v3-v4-2-63e4e525e5cb@whut=
.edu.cn/
> https://lore.kernel.org/all/20250613-net-k1-emac-v1-0-cc6f9e510667@iscas.=
ac.cn/
>
> (I haven't put eth{0,1} under dma_bus5 because in 6.16-rc1 there is
> none, but ideally we should fix this.)

So, as you are submitting the first node(s) under network_bus: bus@5, you
should have this added into your patchset, instead of sending out with none=
.

The same logic goes to USB too, Ze Huang was in the same offline call, and
I would prefer that we move in a coordinated way.

>
> DMA address translation does not depend on PDMA. It would be best if we
> get all the possible dma-ranges buses handled in one place, instead of
> everyone moving nodes around.

No, you should do it in your patchset, when you add the eth0 and eth1 nodes=
,
they will be the first in, as I said, "network_bus". I don't expect
any 'moving nodes around'.

>
> @Ze Huang: This affects your "MBUS" changes as well. Please take a look,
> thanks.
>
> >
> >               gpio: gpio@d4019000 {
> > @@ -792,3 +693,124 @@ pwm19: pwm@d4022c00 {
> >               };
> >       };
> >  };
> > +
> > +&dma_bus {
> >
> > <snip>
>
