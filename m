Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CB04A01
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 08:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751272490; cv=none; b=aEyrSmtYg9btmXQ7ZoNMCc8AvrhNf1VsDNUMGqbohuT3E7jnD84O5tTGHN6oG+XVLsmPowoQIBn68dBE2Iu6odQkcuMqpsdYQtq4eUNuufYTl+ME1LxFYnPhi8c/iPjQDJbpq+V6prxuYb0WXfo5jw/+/ldVgJKtkGqrFN/CJhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751272490; c=relaxed/simple;
	bh=nC/C82fwTATbV/O/92DhgZV8ZDN71sYDFJj1hk7lRAA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lWrcpsAkh2UmnezOWnWHDV9jSH8vFe7sxvQFH34cRx+x/LR/HgR15xJ670ZMLglSaIhl9p8H2KfiNp6IPNtlRHUSCwSmILxm6lAm3+2aR/zc61SNpz/STeE1Vp1nX5hkUJk6YiD8i/iEusgon5gqIaV4/7HlgfWgvoW/gqeLvGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XV3wH+6T; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XV3wH+6T"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-553cf020383so4645989e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 01:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751272486; x=1751877286; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kVgaB3k9Sbz8/PUf8gTuXUEgwfS3TrY+vZ/LVCHdKio=;
        b=XV3wH+6TVKdQ+5AembbreyTvHcLB1aUWYLgjVKnyFTD3Zc1zcJVPYMF7xD9YtiX0Ej
         Y+0QwxTcXiWvCn0aYfsYlGCfzVadwu/afi2iaFmx2SxQNEJ78S1KIdqwi7t1czQBeXxK
         gnLlWzTws6+rRqHbRhXFYcYsdUoCe7XcTRROc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751272486; x=1751877286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kVgaB3k9Sbz8/PUf8gTuXUEgwfS3TrY+vZ/LVCHdKio=;
        b=tzHD2oMrpZyJprl5mJSM58yBNV6OuhLibUI0bE47bwRENYRum37W+sADG/ZqtO/es6
         l6oPoo8/ITroPXuJoDFhw/qrNa+xO6Mv8Aegc25DUmn8PaLz8VvvqoaJeZ5dWGwA85Qb
         zIPyQAcFB9YW37VoXh9qgY6TOLyoUiO4Zqq3e/bTZMurIr38+5OBkcaFayauKi/EWMTh
         JV259U/WnWgbLjdtlTkQlnXJDI9RfQV2GnHiG7Yout/rfPVz4Ge63wweu/bzcqI5zoba
         GKQWmX+jspPW/qDIv1hdY841KPmcd/yK1SowFJEXmn1t/+dqBfh5AULgT/yNnYLA46v8
         mlTA==
X-Forwarded-Encrypted: i=1; AJvYcCU+4WQq+IawBy3RY5rGjXcrhnjS6vS0jhJUy8sUkHxr0Q4R+bSetEmLhgmdmeOmyN39D8lqR0VILxiCw4c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmzbbGicL7Mhj/UUoc2V4HjQbMDrSkhfOXg0XAc3ixg4li726X
	IFtt7wmFNQGTaM1T+DqnsDt3d1KDGfMo86UmpStFEQgEn3u5eOxb8qssvrLzypPg+j4lIpv2K3M
	zsZvLs2wZ5bUiLz4yRQQ8c9VSdlnDktu66TpfFD1i
X-Gm-Gg: ASbGncvrd766s2usypSP8+BBQ0s5vDBk3XoykGTrQIfgloNBL3/6J8z2w/VRhfURxID
	zeHjg1lQjgg0jJxjGOk5CtDva5NG8DQtFCmgyMgsEbKtiVbASdTH7Oh0WjP7yl8vsW3iwXDmTo2
	wXukZ11sky7Uwr/TtPeyI6W3WW7P+BvsRBEiYo/YwY6cARlA2isj4St9h41dnk/C8SIPlAylU=
X-Google-Smtp-Source: AGHT+IHlFcd7ds08VjRkhAd4B5pJTIKQJ0FaK20eZC09ottQSiiIyrXWfmbyhysoyNz0SfAaoXhAnX9I8zWuiDZ9khk=
X-Received: by 2002:a05:6512:b12:b0:554:f79d:ce59 with SMTP id
 2adb3069b0e04-5550b9ee228mr3819454e87.27.1751272486439; Mon, 30 Jun 2025
 01:34:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624073548.29732-1-angelogioacchino.delregno@collabora.com>
 <20250624073548.29732-4-angelogioacchino.delregno@collabora.com>
 <20250627-neon-hidden-sheep-ed8dae@krzk-bin> <CAGXv+5GLJ7cfAQW_kbTqqe_QO+RfU7KL57n77qenpDiRS5BybA@mail.gmail.com>
 <c5dffc8c-2abe-4fd3-a062-6d1adb417d27@collabora.com>
In-Reply-To: <c5dffc8c-2abe-4fd3-a062-6d1adb417d27@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 30 Jun 2025 16:34:35 +0800
X-Gm-Features: Ac12FXy9Bg8iczKYCRzfVVALHWEDTg9agbPGYTVqjyGmcI5uPshlMdfvswpTnDg
Message-ID: <CAGXv+5EwLDue4y6fVuyNd-z1mytqXJJhQuohhe3htT-XiNcGHw@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] dt-bindings: regulator: Document MediaTek MT6363
 PMIC Regulators
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, broonie@kernel.org, lgirdwood@gmail.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jun 30, 2025 at 3:52=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 30/06/25 05:25, Chen-Yu Tsai ha scritto:
> > On Fri, Jun 27, 2025 at 4:24=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On Tue, Jun 24, 2025 at 09:35:45AM +0200, AngeloGioacchino Del Regno w=
rote:
> >>> Add bindings for the regulators found in the MediaTek MT6363 PMIC,
> >>> usually found in board designs using the MT6991 Dimensity 9400 and
> >>> on MT8196 Kompanio SoC for Chromebooks, along with the MT6316 and
> >>> MT6373 PMICs.
> >>>
> >>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@=
collabora.com>
> >>> ---
> >>>   .../regulator/mediatek,mt6363-regulator.yaml  | 123 +++++++++++++++=
+++
> >>>   1 file changed, 123 insertions(+)
> >>>   create mode 100644 Documentation/devicetree/bindings/regulator/medi=
atek,mt6363-regulator.yaml
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6=
363-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,m=
t6363-regulator.yaml
> >>> new file mode 100644
> >>> index 000000000000..f866c89c56f7
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6363-reg=
ulator.yaml
> >>> @@ -0,0 +1,123 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/regulator/mediatek,mt6363-regulat=
or.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: MediaTek MT6363 PMIC Regulators
> >>> +
> >>> +maintainers:
> >>> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.=
com>
> >>> +
> >>> +description:
> >>> +  The MT6363 SPMI PMIC provides 10 BUCK and 26 LDO (Low Dropout) reg=
ulators
> >>> +  and can optionally provide overcurrent warnings with one ocp inter=
rupt
> >>> +  for each voltage regulator.
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    const: mediatek,mt6363-regulator
> >>> +
> >>> +  interrupts:
> >>> +    description: Overcurrent warning interrupts
> >>
> >> Are you sure interrupts are physically not connected?
>
> Yes, I'm sure, they are not.
>
> >
> > Side note:
> >
> > I wonder if we really need to describe _all_ the interrupts here.
> >
> > Looking at the PMIC as a whole, the interrupt tree is something like
> >
> > SoC <- SPMI inband IRQ - PMIC top level IRQ block <- sub-function IRQ b=
locks:
> >
> >      - BUCK (buck regulator over current)
> >      - LDO (LDO regulator over current)
> >      - PSC (key press / system low voltage)
> >      - MISC (protected registers accessed / SPMI stuff)
> >
> > And some other blocks that may apply to other MediaTek PMICs:
> >
> >      - HK (some threshold triggered interrupt)
> >      - BM (battery management related)
> >
> > The thing I'm trying to get to is that all these interrupt vectors are
> > internal to the whole PMIC. Do we really need to spell them out in the
> > device tree? The top level compatible should already imply how all the
> > internals are wired up.
> >
>
> Chen-Yu:
>
> Yes, we do: not all boards need overcurrent protection on all of the rail=
s, but
> especially, in the past I have seen (multiple times) board designs (not M=
ediaTek,
> but that doesn't mean anything) that will trigger the overcurrent protect=
ion due
> to a high inrush upon rail enablement - in these cases, the ocp would hav=
e to be
> either ignored completely or reset and read after a while.
>
> Not only that: since not all rails are actually used, due to EMI (and oth=
er issues
> which usually mean suboptimally built boards) some of those may randomly =
trigger
> OCP, and that's another case in which that should be ignored.
>
> So... yes, we want to define the overcurrent interrupts in the devicetree=
.

I understand the use case, but I think that's kind of giving the interrupts
property a second meaning.

Instead, if you look at the common regulator bindings, there is a
"regulator-over-current-protection" which signals that over current
protection should be enabled for a given regulator. Perhaps you could
use that? I think this common property also implies that over current
protection has to be explicitly enabled.

> >
> > ChenYu
> >
> >>> +    minItems: 1
> >>> +    maxItems: 36
> >>> +
> >>> +  interrupt-names:
> >>> +    description:
> >>> +      Names for the overcurrent interrupts are the same as the name
> >>> +      of a regulator (hence the same as each regulator's node name).
> >>> +      For example, the interrupt name for regulator vs2 will be "vs2=
".
> >>
> >> You need to define the items or pattern if this is really flexible in
> >> the hardware (not drivers).
>
> krzk:
>
> It's flexible in the hardware... but how do I define a pattern here?
> I avoided to define the items because you can miss some; I mean....
>
> You may have, on one board:
> "vs1", "vsram", "someother", "another"
>
> on another: "vsram", "another"
>
> ...and another: "vs1", "another"
>
> (etc etc)
>
> Is there any way to allow missing items in between?
> Because then there's 36 possible items, so there are more than 100 possib=
le
> combinations (keeping the order, but missing something in between..!).

I recently saw in the net/snps,dwmac.yaml binding the following:

  clock-names:
    minItems: 1
    maxItems: 10
    additionalItems: true
    contains:
      enum:
        - stmmaceth
        - pclk
        - ptp_ref

I suppose you could adapt this pattern, list all the possibilities, and
set additionalItems to false. I don't think it can pick out duplicates
though.


ChenYu

> Cheers,
> Angelo
>
>
>
