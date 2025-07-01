Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05841E7C12
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 08:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751359735; cv=none; b=QlXqqxpPrMxjTxST7pvuxESSVbWLNjLr6J+URbBU8g/HdGfaD2fOqI4jbYq02gTCqxiUf3LE0RmRI7VgOOjm64k4EfPm3Na7836aB9yK1+TOBJkK9ZnxZJ+o8qs5fJ6bKtYq6cd4dBZ3Ea/f8FqPHbDfMMEuV0jeCKS8wMZ6LpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751359735; c=relaxed/simple;
	bh=DGBHFGIQFj3DI57v/KergKc6+HMEaz+DP4HpyZ/MxtE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VpUc31yGfiKFxjDu+aKl+0kJ0EwaquKoQ+ARLjuZyLjvrjzCHLtkXRZJ5ZTve9V2sAsQUTi6Y0fA8ueVsOJxBWkIs3GD+wjbH5OJRrtaHxK9KPE4x6u40JcAedSGs1mPl9gyRYLOOpzkDDnPVP5YQtH+Y7iBObchvAY8uqyZ79k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=EvZITTKY; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="EvZITTKY"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e733a6ff491so2643089276.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 01:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751359732; x=1751964532; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ham4MleQtpYSqIWPo8fq/MuoFtt+t8Ya59SZXOm39+s=;
        b=EvZITTKYDl5uL1ve1wLJnipv0bkLmS0L6fx3chyv8BvSs70JiIxRsLqL1cVwFUWFZm
         ebyxm0YSMkZtuTns9B0jtC757l7bd1gJM8CIOVMI3gO2+pg9X4Z5yAKrn4g9UXc+9IyC
         CT4t/PFh87odls6yrrlbaGp6E3rr73GVlhSdbbWtkSIGnrpi2DsQ8BIGzfJmialYSVNd
         1gYU4eKxe7vPsnBZ894SqyXviLAZH8SvsByGStG4vued3wd6wH8DiNcWWKWf1RMt02rv
         rKZa3L/9r6Ikb76GXd4f6tnKn5/YlGWXqCVEAbmm8bYvPzF3A4ewfOtj5O/MXM2QMhAC
         mAXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751359732; x=1751964532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ham4MleQtpYSqIWPo8fq/MuoFtt+t8Ya59SZXOm39+s=;
        b=O3YT05or3zZWJiSM+jKlqGEhC25UDvCtzRZg+BMoHL4JAjb6WY74KhrI16C0ncCQr7
         gllk7+gsxf19MkNBrTtihOs8oJb2GCOiy+ZnPrq0ZuvQsZRfcUwPFxDdEaOXAJcHOv/T
         yvAOIF8eO7e0r8gHNpyZuKw8G1pfHOZHThtbJMWVN81i77vGxasE6A1Wk5zK84h0UcAO
         SqCSo1P2NkeFkvFFk4+/B75oDsJy8cmkfRSlYX7d6vsQwnpjxOY6UWKnLikZykAOV0pT
         vBolbYUdDT5kmSzQaWQGiuUXfHT3373S7slgnn52w5WRAbXRzLHv0S1nuJ8sxf8D9f1E
         S7Lw==
X-Forwarded-Encrypted: i=1; AJvYcCXVNEx/eLFBdIrlRSwHpSgOCas6sTUI6AZJLPWFOtZrS3O4OhBUmjBsvU8QP/GD1Q6iTFCczc2phQT4/FE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyS7TmzYSA+INGuk1HaU/2QuVcd3w6I0B5kWpRwCGx7zvvpwCmJ
	74yYVdmgSmKKgClo+H6LuXGdf8dhm3W1TUi41esI4/m54Gv9xxOIpBUxG0Oalb8G1Dkr93i7fid
	QpCXRGlg2ayWo+lmzbh6Vf7valGur/eteFEv/Y92zhA==
X-Gm-Gg: ASbGncunE7t8p4JN/8Z3aQl9LITv6fZ1L3ps5pY/21VeisZ6qc0vzxFbmVraQ9o/pHR
	cmv9W9YlfItI0uXPEht0ORk5W7CVrvvIvu06OpIFvFLAIamvcNqs+O6Z5cT83JTADosB+cbZ9lm
	+XkRtWz+TugtRkNUzufoohAVBxxFLMlj5Du2M9GvVdh+/3xSnp
X-Google-Smtp-Source: AGHT+IExwbxuXz67r7i2U0Hj9e39nnEuFRzklLDURAXbWXk0DV903xSBiVjsaBHg1u3FdNeBklfefUYYXWQaY3P289M=
X-Received: by 2002:a05:690c:45ca:b0:70e:29af:844a with SMTP id
 00721157ae682-71517196047mr247551697b3.18.1751359731954; Tue, 01 Jul 2025
 01:48:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250701-working_dma_0701_v2-v2-0-ab6ee9171d26@riscstar.com>
 <20250701-working_dma_0701_v2-v2-7-ab6ee9171d26@riscstar.com> <ebc16dbe-2405-4956-91a0-bcce9f199326@kernel.org>
In-Reply-To: <ebc16dbe-2405-4956-91a0-bcce9f199326@kernel.org>
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 1 Jul 2025 16:48:41 +0800
X-Gm-Features: Ac12FXzG_24euqC2ksqQUMdli-9vCkce_uhDVNzQHQHTjfNnkSCnW6ua-Xfs0vo
Message-ID: <CAH1PCMa2dB1fefzGgo-kKfgAdou_KaDSvTDsvYPjsGKODHETCA@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] riscv: dts: spacemit: Enable PDMA0 on Banana Pi F3
 and Milkv Jupiter
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

On Tue, Jul 1, 2025 at 3:36=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 01/07/2025 07:37, Guodong Xu wrote:
> > Enable the PDMA0 on the SpacemiT K1-based Banana Pi F3 and Milkv Jupite=
r
> > boards by setting its status to "okay".
> >
> > Signed-off-by: Guodong Xu <guodong@riscstar.com>
> > ---
> > v2: added pdma0 enablement on Milkv Jupiter
> > ---
> >  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   | 4 ++++
> >  arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts | 4 ++++
> >  2 files changed, 8 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/ris=
cv/boot/dts/spacemit/k1-bananapi-f3.dts
> > index fe22c747c5012fe56d42ac8a7efdbbdb694f31b6..39133450e07f2cb9cb2247d=
c0284851f8c55031b 100644
> > --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > @@ -45,3 +45,7 @@ &uart0 {
> >       pinctrl-0 =3D <&uart0_2_cfg>;
> >       status =3D "okay";
> >  };
> > +
> > +&pdma0 {
>
>
> Does not look like placed according to DTS coding style. What sort of
> ordering Spacemit follows?
>

Agreed. We should establish a consistent ordering rule for SpacemiT board
DTS files. According to the coding style documentation, there are two
acceptable approaches for ordering node references in board DTS files:

"When extending nodes in the board DTS via &label, the entries shall be
ordered either alpha-numerically or by keeping the order from DTSI, where
the choice depends on the subarchitecture."

Refer to Documentation/devicetree/bindings/dts-coding-style.rst

My preference would be alphabetical ordering for easy maintainability. Howe=
ver,
I'd like to hear Yixun's perspective on this before we standardize the
approach across both board DTS files, BPI-F3 and MilkV Juptier.

Thanks.
Guodong

>
>
> Best regards,
> Krzysztof
