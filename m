Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCB126E701
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 10:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751364278; cv=none; b=in8pk+R4Ezi8Eq4Pt5l/VEVGC4DNVDeFPoILDoyXLwPlcF0C94zuF42d+qaIYgetuFBWBk3VDR4O98P69cqsg7q8lcZh++croiJIx2rCJ9pXAlf0I3+jM9lQSXuwKfC+20+/6jrxs7dYpDN3THMCczeAUYCdjQeh/1qgO3VadHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751364278; c=relaxed/simple;
	bh=+R01mkuuQZpDljT5vbAlalpVcYu+V4XYhk80TEYXfd0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iOpINCvg2iMPFBah9nvZQsXzLENiz+5Ub4YF0Vaj3ib+M5j4281ZPpL8bO1g+SvX98xCHQ/vQtpeEB0xGActC+xWwcizTNFZCqfcI8CZshYqOnVoKckvokqjTsJJJBURiruaf7+2QiWWGffOPtJl6N9lNLsI4Y25iKr87CPZKes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=sRAmk7AO; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="sRAmk7AO"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-710e344bbf9so30689947b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 03:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751364275; x=1751969075; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tI2TEX0v6p76uLE+ptZngTvOHJFtlrTXX6bq47hMyoo=;
        b=sRAmk7AOR+Xp3FbwVhZewB+jhZZAo1UQ0AiAy4BiWeOvoBw9rEoFxPAEGmTnsZOKwr
         5/HO2xxidGBgCy7j3Q9x8PPgmlg9pWpkHTHShTqm76fIlLDeNUbuyE3KxjT+uUojf/v3
         iDQFXZ4TXhidFnKF6qn035I/la0IVzSo83mYZX09jcMIEPRiBIMkY0z5ARQvl4QuXdC9
         sBd2f8vrI8jcRqaDYPmEkp4dQ+3AlPvywe+5+hgR5kQ6TQaSs4KFkPMRUqiP9PZyPl9Q
         oG1luJSepn3ovJpgDEzTxaBUMCWhLeJ+/lWOpM8mG8EcTqIQhNVP9zXtwCbxcAMOS9SZ
         t8yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751364275; x=1751969075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tI2TEX0v6p76uLE+ptZngTvOHJFtlrTXX6bq47hMyoo=;
        b=pd5iIWAKVHKTCtIa1WZGzhM47l0QgVd8FVtpCPZenc5Tm7DE7pmq9hNAdu/fTZolxL
         5qGtuhSYeWykZ+aoSpthYvpYSnhm4r/I0cV010vNRIkKZjBdPQ+nkp0K51NHdsA+qCXC
         V4CxEkbezA0FpkU8Prt+TPOl0aqUx7+ie6PVXMxAdCAIU4CpQTU5Jjp6XGM9DjaHRQK5
         ACygtLZ4MJkcnw8RGHeRFXgePYjJa/gx/5o9Eh7j6MHNGmjNVRg9ZzzRWR/eELRlUr4t
         4vgdgcozWft3keQljOu72JsW9KKc6zmGkyZdalZT61MEe3pZkuZm1c0HfdWlmIvN3oOn
         AWQA==
X-Forwarded-Encrypted: i=1; AJvYcCXUs7joTyIm9/BoplWviu9uSKBT2p88VxMkJGP6GkxsRGmTGdNXrfMKEWkXzHgzifZn3rj+35y8t2/f9B8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0k2krcS43J5j+Ug3Df6Fk63fT6/B0gE1Qnw/jMNc/BmYDb40P
	YqWNp8rAC/p/SVur/kl7RR2bkeULrshEh02hWsnO9cvSlKyTVjGYtlwi85HZC836as8EsHp/Kra
	Hl4X4pZ7+WnrSZu0z9FZLx3k/xgt/zJtqcLOFqfuqsQ==
X-Gm-Gg: ASbGncuiS0/Aoa2FHnOtpxtPZbTT1TqCI8RUw9JDK6/o40zuNF+Pne6SV/oE5D9RHtp
	AcTSOFXjNXmz8nxEVsHwHAOXmK44AicA3ebC4FO0QGrtg3GCNDygmGzByL7yJg4oBtnw7Cs7pPh
	iwgz9e8tyEao05aP3LWgRMrmuEBBB6Z4R7R6DTTeYRqkV222VrT9zLFke5Rx0=
X-Google-Smtp-Source: AGHT+IFFvhwLw/jJrBvk5mcq4A9/NKoJsPfn9jlPFZrZKY33NEca9HgiwrZDw7XbN2a2/VI+7HKKIkBzK0LvZEqayRQ=
X-Received: by 2002:a05:690c:38b:b0:709:1529:c24f with SMTP id
 00721157ae682-7151713cdcemr231087327b3.4.1751364275152; Tue, 01 Jul 2025
 03:04:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250701-working_dma_0701_v2-v2-0-ab6ee9171d26@riscstar.com>
 <20250701-working_dma_0701_v2-v2-7-ab6ee9171d26@riscstar.com>
 <ebc16dbe-2405-4956-91a0-bcce9f199326@kernel.org> <CAH1PCMa2dB1fefzGgo-kKfgAdou_KaDSvTDsvYPjsGKODHETCA@mail.gmail.com>
 <d3d73135-15d8-487d-a55a-44f1f98db930@kernel.org>
In-Reply-To: <d3d73135-15d8-487d-a55a-44f1f98db930@kernel.org>
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 1 Jul 2025 18:04:24 +0800
X-Gm-Features: Ac12FXwHr2IIx2UMlAjmgrdgoDgmw39WTy6GMM6om5RG4oXPV4Hi_Mb50OUfJEU
Message-ID: <CAH1PCMa35n4dnJ94-EHGrJyU3kztQYO8_v2CkD=rid466zv3+A@mail.gmail.com>
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

On Tue, Jul 1, 2025 at 5:02=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 01/07/2025 10:48, Guodong Xu wrote:
> > On Tue, Jul 1, 2025 at 3:36=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel=
.org> wrote:
> >>
> >> On 01/07/2025 07:37, Guodong Xu wrote:
> >>> Enable the PDMA0 on the SpacemiT K1-based Banana Pi F3 and Milkv Jupi=
ter
> >>> boards by setting its status to "okay".
> >>>
> >>> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> >>> ---
> >>> v2: added pdma0 enablement on Milkv Jupiter
> >>> ---
> >>>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   | 4 ++++
> >>>  arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts | 4 ++++
> >>>  2 files changed, 8 insertions(+)
> >>>
> >>> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/r=
iscv/boot/dts/spacemit/k1-bananapi-f3.dts
> >>> index fe22c747c5012fe56d42ac8a7efdbbdb694f31b6..39133450e07f2cb9cb224=
7dc0284851f8c55031b 100644
> >>> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> >>> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> >>> @@ -45,3 +45,7 @@ &uart0 {
> >>>       pinctrl-0 =3D <&uart0_2_cfg>;
> >>>       status =3D "okay";
> >>>  };
> >>> +
> >>> +&pdma0 {
> >>
> >>
> >> Does not look like placed according to DTS coding style. What sort of
> >> ordering Spacemit follows?
> >>
> >
> > Agreed. We should establish a consistent ordering rule for SpacemiT boa=
rd
>
>
> Isn't there a style already? Or what is the style for Risc-v arch?
>

Per my checking, it's not consistent for arch/riscv.

SiFive boards (hifive-unleashed-a00.dts and
hifive-unmatched-a00.dts) are not alphabetical.

Most other RISC-V vendors (StarFive, Microchip, Sophgo Milk-V Duo, etc.)
use alphabetical ordering. That's the majority. Right?

-Guodong

> Best regards,
> Krzysztof
