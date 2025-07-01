Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13C8269CF1
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 08:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751358007; cv=none; b=CqJZmYA0jzrMyXI6BjeiSKVvAq2U/Fs25ef7sO0z7zPFbYmel/BJCHNDYXl02XRvaZNks0MUlR4WqJvQxr1jQO12iL5OdHnvZY/S/EsMwkQLT8Y+w4SeTLEiHCu0U1ptpOjyF/rGBnszC4MUsaEeNj/IMd/2FsAYdnlWuUUz9ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751358007; c=relaxed/simple;
	bh=TUPLhW/JmtwEUv3AE6ZmIEitSNuWEsD/cufR7kVF8ys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g9SgECc2ecFsrloYfXW3bx9GllcQTV3QM8RV4308BglOROWzAiUcFV4MNXX0SLACcUUyhOZ0fDORAoWy2Qk5S0+cE/WM3r1ZEaU9x0yGOBKolTndug554K3dFI1op04IcB/ovKcwqvhv98NYxvGvTB7l3IYobhw2Gt/h+aZgjBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=USISS8KM; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="USISS8KM"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-70e40e3f316so26499597b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 01:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751358004; x=1751962804; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FbuOsRMFTiJD9Z73+tptA9tOlUhWfVFv9XwbRhZntqs=;
        b=USISS8KMIHu+LcH6L5QWZwUHZ0RsTQPJ0ZfRFV5lyJRO+fsnjW3Vb5Uh6N1UxTyMwJ
         YWwKN+u/4pSW7Y6DLgdgtyLcMErJ8TCbHNU9cOW0jA9PwWNVlUMmpkZNYPrxyvEtlKgS
         DI9VTs65Uc2wWY8cbW3/0uCT7F6jc25a7d4fR9MOEbknsUDPAT7upnGeHp8nZlKCxWfs
         s7bli1ibTKUmLDRJgQdxDQ3XX7VKjCeDsgw+UL/JUlkVFbLYJUw/jrbdwymsj7yN/w1Q
         pbgezSjsNcp9lbMM5UepXQDoRwPX3IEGv5yNWgpKfuqGAoiUmOebU9eXP5+M+SF4QP83
         IHJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751358004; x=1751962804;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FbuOsRMFTiJD9Z73+tptA9tOlUhWfVFv9XwbRhZntqs=;
        b=K8DsEkTKYzp6OwnN1iIkhvIWFmqPbiS4OXEVFRtgQm23s2IePmUmw99rkLeCd8zVXD
         3osWADRfUyD3l5aCnktQSBCyOEzRYGOPPGDHL78zrvxJn+g6oceeLVC3mahsYQnnC3ex
         IFA2VOvyG8OV6rNQrT5O3Z4b0yncHWZAcpK/sDJlqc2OOWReFkz8YQJl8zXPbh8yBB8b
         q+0j/ykoqOL/odNsM2r4oO4+rN8ODIV9JT1f5xWX1gSOlNIrukHbWaTDks1wl/PT3b5K
         VIzK61mmyFXasd/ZYLc6hS1FBIJFS79bP/b2um7NWmMEoqQISCYWD4l7+Kq++4fH6Eog
         3Y1Q==
X-Forwarded-Encrypted: i=1; AJvYcCW+2Q+8egcBuL+Er19fPjEsl5n3CLaDl6FXqPDWkf0oT0NVEWv9G/q8UcEM4YJ9h+Q+kLkIGDgs5/Gfpwk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyisljnGYBWfASRbOCdITGmbsq7RI4OhFNwclwJovOwQ3YRCMPa
	Pf6rh4J3fyrCXwU9hQsesE7EuwBTUnh7MGC3kWq/GhQg/QVrgaz9mAAmcQJfT7Us1zvssBy+7V2
	FiF3+35VsifCZuCkKFQu2K2y8MLndjphhgz087P9XiQ==
X-Gm-Gg: ASbGnctajyk325fbAZxONjixi4i9BOqzVjx+kW0Nw3AHPhrcYsIEmYjnZ7PLNfmsOdz
	Xi1T/tZwXCO9+6SkxjwZy2RtYyiaJNV5VVMStQQflVkFZhyH2BY7bECTFoUFr1VhEXJdWNJ1xLN
	UaAX/BRbt39kvnOq8AoZ7ppm7uKntrPDCWdFNnoYQxm7/1hjVi
X-Google-Smtp-Source: AGHT+IFre+CwhTt7pE+B50luWB9F2Nl0i0HpZdG4/qK3UkvJ4Pwbg0TDxDpw39sn7GQMRaKyZ8jEL4jGCSy8+Dou2x8=
X-Received: by 2002:a05:690c:30d:b0:70f:84c8:312e with SMTP id
 00721157ae682-7151713d346mr246421247b3.1.1751358003665; Tue, 01 Jul 2025
 01:20:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250701-working_dma_0701_v2-v2-0-ab6ee9171d26@riscstar.com>
 <20250701-working_dma_0701_v2-v2-6-ab6ee9171d26@riscstar.com> <a329e8a9-d581-4af1-ac0f-9f104a810bc9@kernel.org>
In-Reply-To: <a329e8a9-d581-4af1-ac0f-9f104a810bc9@kernel.org>
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 1 Jul 2025 16:19:52 +0800
X-Gm-Features: Ac12FXz5TtaMdqHj-qXiGBKlygWCWhHUUNjiyvuAFFCHITTv4zQR9b39KeOkZO4
Message-ID: <CAH1PCMb8OKiqT1R0mHSU1RFxcJvd6VyFyWJWhhKpWc5nKvTi3Q@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] riscv: dts: spacemit: Add PDMA0 node for K1 SoC
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

On Tue, Jul 1, 2025 at 3:37=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 01/07/2025 07:37, Guodong Xu wrote:
> > Add PDMA0 dma-controller node under dma_bus for SpacemiT K1 SoC.
> >
> > The PDMA0 node is marked as disabled by default, allowing board-specifi=
c
> > device trees to enable it as needed.
> >
> > Signed-off-by: Guodong Xu <guodong@riscstar.com>
> > ---
> > v2:
> > - Updated the compatible string.
> > - Rebased. Part of the changes in v1 is now in this patchset:
> >    - "riscv: dts: spacemit: Add DMA translation buses for K1"
> >    - Link: https://lore.kernel.org/all/20250623-k1-dma-buses-rfc-wip-v1=
-0-c0144082061f@iscas.ac.cn/
> > ---
> >  arch/riscv/boot/dts/spacemit/k1.dtsi | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts=
/spacemit/k1.dtsi
> > index 8f44c1458123be9e74a80878517b2b785d743bef..69e0b1edf3276df26c07c15=
d81607f83de0e5d57 100644
> > --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> > +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> > @@ -591,6 +591,17 @@ uart9: serial@d4017800 {
> >                               status =3D "disabled";
> >                       };
> >
> > +                     pdma0: dma-controller@d4000000 {
>
>
> Oddly placed. Is spacemit not following standard DTS coding style orderin=
g?
>

Oh, I see the issue. I will fix this by ordering by "unit address in
ascending order". Thanks for pointing this out.

-Guodong

>
> Best regards,
> Krzysztof
