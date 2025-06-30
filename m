Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F3A3D6F
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 03:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751253914; cv=none; b=XoQSfbjqwEOnfCPAn9Q7uny5vhVTptjJkJASBnrWhgw/iAXHk6Hq6/jTzN0PuNS7ows04M/W92X9KsoE3v3m+rk/amIgZegzXKgx571P384hGZYaMiqEGE+BojW5MHTdlDZEiJDWrDdzie6820VNNPjzJQy+drwhXVBTRPT5x1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751253914; c=relaxed/simple;
	bh=HqxsES9BjFxb1DzfPVlIXMOHtqBQW4SMuesB6hb3kh8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ql79OEMn43A07ATnfUk7OFrRdlu82HrUqbgpxiwsq1iWxbYmCbSqA6p6R+XLUmLkvJr352XJw5XDj/BnHRJxRmahFwJtcnzKOfNv1HxldOq9gI9wRL4XAxKC7qaCWpB7Gtt5vvJbkLM8/z3NzASgoAxsJ28ZeONRTT4MDmkCVBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=K+9/Xx58; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="K+9/Xx58"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5551a770828so710172e87.1
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751253911; x=1751858711; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Arx/vh/1p7726lfU61ekP8LCF9/XaIuNl/Y+OL2yoTY=;
        b=K+9/Xx58RnS3aCXRivTcl5I3kJhfRFnXSKxxHVOJELVz7f52aTb7YrSzHkg33zujZL
         EPp3dZjxhMBOB+52IItIf4KAhCJVw008U8Ld/G0hhUT/Pk3juNHcPJz+irtHId3Q8HLW
         j5BJfrHPIMlc7eIs+3KkSOabnnr350F2tLzc0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751253911; x=1751858711;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Arx/vh/1p7726lfU61ekP8LCF9/XaIuNl/Y+OL2yoTY=;
        b=poAEJALALv7CerDeZ/1zgO/PKTgEXSEUYEyW+aQRW+nBLR44cXYjmoeoIM1awkpwNj
         5tZpg+m+kisZOTccC6BuQLF8LQGGfqVnb//vHtIWOTvwygURhpnP2XlIXiYMesCklp/l
         ALAwmXCD9fjnDPx/pwwHJRtkXc51MiOkw4uArdkAffE08QvRKKpl2fKGIPkGbtY5FFTq
         uq35jlQsxBSmKGB2mLE8TJfMmMONi4/WKUejchTA8pu6OznXVwqU8cC9BiVJzBMBhD0V
         up85Dco96ccmhfAnZj2GEzXx+E4gxe8stfAYu8DTB2nMYct3U5V9sVKeHN5IVvemzGzs
         ENCQ==
X-Forwarded-Encrypted: i=1; AJvYcCU98q1tM7zU/roKIw/qgaW5clMOjT2AnjxvWoHsT5kggN+5+81o8nKyl/Q2eeRtw/TlTuFLxSYdASLxJLI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEdGZ8ZtCWrH2zztjtquOKDrO8JMCsowCXlIJmM4DRvDkKDFvu
	IAj11OMxw43abYiIRVwV8HCljEIPkWaf0oqVEcH5rhVZ0uHEyOJKbDpxdr+dHCIguJwU3cgEH2B
	B1yMD8Cif4K0htaHwqZ6VuRWHbkX5ddbtfBY4fPNm5IeqGQM+ZPc=
X-Gm-Gg: ASbGncvxnvt8aXmUPN+B+g6h0twWmrfs1BGOoRKlXYR/AxhRdhfMi+XILbwvkiQojzH
	7HOn+uUkqMAUINUlHm+TgaqGRwrrRDjMQ40R91BYcl3wRVz8btCoS4HMJ3hmFYd4EhuLHQHgtYG
	rAUhBVUN2doHbRqkc//SDNkLw3guasQArkxlc6yProM0MT+8Rao5hjJrMfbiuUTQkGIHguzwT4e
	aXg2TA=
X-Google-Smtp-Source: AGHT+IG9cnl6ModTYi6p2CiPzEyX+jlxQEfwAMhFMxkNl7fS/RoRC0YYR5H1zSIeP2ag3GvJxVUZnK/m4syzOJSkQKo=
X-Received: by 2002:a05:6512:3041:b0:553:addb:ef51 with SMTP id
 2adb3069b0e04-5550b886294mr3126600e87.18.1751253911120; Sun, 29 Jun 2025
 20:25:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624073548.29732-1-angelogioacchino.delregno@collabora.com>
 <20250624073548.29732-4-angelogioacchino.delregno@collabora.com> <20250627-neon-hidden-sheep-ed8dae@krzk-bin>
In-Reply-To: <20250627-neon-hidden-sheep-ed8dae@krzk-bin>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 30 Jun 2025 11:25:00 +0800
X-Gm-Features: Ac12FXzEzclUPx2ytH0n81YEF7rV0XFgxUmmA57Z4fo3T5oQBKH_wjXRPSro-S0
Message-ID: <CAGXv+5GLJ7cfAQW_kbTqqe_QO+RfU7KL57n77qenpDiRS5BybA@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] dt-bindings: regulator: Document MediaTek MT6363
 PMIC Regulators
To: Krzysztof Kozlowski <krzk@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 27, 2025 at 4:24=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Tue, Jun 24, 2025 at 09:35:45AM +0200, AngeloGioacchino Del Regno wrot=
e:
> > Add bindings for the regulators found in the MediaTek MT6363 PMIC,
> > usually found in board designs using the MT6991 Dimensity 9400 and
> > on MT8196 Kompanio SoC for Chromebooks, along with the MT6316 and
> > MT6373 PMICs.
> >
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@co=
llabora.com>
> > ---
> >  .../regulator/mediatek,mt6363-regulator.yaml  | 123 ++++++++++++++++++
> >  1 file changed, 123 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/regulator/mediate=
k,mt6363-regulator.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt636=
3-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6=
363-regulator.yaml
> > new file mode 100644
> > index 000000000000..f866c89c56f7
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6363-regul=
ator.yaml
> > @@ -0,0 +1,123 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/regulator/mediatek,mt6363-regulator=
.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MediaTek MT6363 PMIC Regulators
> > +
> > +maintainers:
> > +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.co=
m>
> > +
> > +description:
> > +  The MT6363 SPMI PMIC provides 10 BUCK and 26 LDO (Low Dropout) regul=
ators
> > +  and can optionally provide overcurrent warnings with one ocp interru=
pt
> > +  for each voltage regulator.
> > +
> > +properties:
> > +  compatible:
> > +    const: mediatek,mt6363-regulator
> > +
> > +  interrupts:
> > +    description: Overcurrent warning interrupts
>
> Are you sure interrupts are physically not connected?

Side note:

I wonder if we really need to describe _all_ the interrupts here.

Looking at the PMIC as a whole, the interrupt tree is something like

SoC <- SPMI inband IRQ - PMIC top level IRQ block <- sub-function IRQ block=
s:

    - BUCK (buck regulator over current)
    - LDO (LDO regulator over current)
    - PSC (key press / system low voltage)
    - MISC (protected registers accessed / SPMI stuff)

And some other blocks that may apply to other MediaTek PMICs:

    - HK (some threshold triggered interrupt)
    - BM (battery management related)

The thing I'm trying to get to is that all these interrupt vectors are
internal to the whole PMIC. Do we really need to spell them out in the
device tree? The top level compatible should already imply how all the
internals are wired up.


ChenYu

> > +    minItems: 1
> > +    maxItems: 36
> > +
> > +  interrupt-names:
> > +    description:
> > +      Names for the overcurrent interrupts are the same as the name
> > +      of a regulator (hence the same as each regulator's node name).
> > +      For example, the interrupt name for regulator vs2 will be "vs2".
>
> You need to define the items or pattern if this is really flexible in
> the hardware (not drivers).
>
> Best regards,
> Krzysztof
>
>
