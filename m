Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA7323AE67
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 11:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744025355; cv=none; b=hFreyFxwGeDf01b2sy9FRWvl/pHDc4Rjkoj3lXhX6/mtS2yv9ZfyHd/orK7S+I0mbcibmJfbXVHc7SBPpKsb6jd1OzyC7rEbGO1/iXHB25dhYOdaml4OxARbC16sb4nJXQg4g6bnjSxKeOj7kf85hvMpY/5V8p+baxvY9ORBNUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744025355; c=relaxed/simple;
	bh=H2FKZXIS+hwA9vu7ou/PvLDYV8ymkbl31adVzvN6naI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QtXvspexrWswPjD1xgTrNPMxTb8nJd4Kf/rPId2pv37GiOtMnOuYe/C/fXTbZHwmtzyLk21XfrRI0sBiD7LyixXbPfLb+a2yZjgnxLY16c25Q//jTMhWp+zz5sKXZKaJ72lVxz2MxrOiHbzlwRqZWmSuxhZeN8gncHUJusDmShc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VdRiM1KN; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VdRiM1KN"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso21612645e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 04:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744025351; x=1744630151; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3ERzJBk8IPAt2EVC29UOPORnzeO9/Agn8egECrfbp4E=;
        b=VdRiM1KN3k56gGv/Zn79b5fCDlcQnSqwuAhYuoSvXBRIu6mnFsgKHzQ9kEmZmIc5An
         4njIiXTw+v+rksLV9lmeVw4YJefwPUVP3fsBg8Rnk6gE/WrYz39iuzXTUBqc+O5wKeco
         qEM/sm5CxxLpuewRsjDZfFIYyNnbZacJbcFIt5NlkVltPvCsQZAWBahAZMGeoNq5ox3R
         9F6EsKzj0KXcj7s+NsHGAqUtCDWx+jKjVqtfRqHOartUyR31qFdGR+ty4ZdnfKrgVj+i
         yozKtOON4+el+vX50KES/fgGIktrZLzduPXMfMRzYtS/YGdXmFDAsOby2gz25nwTwli+
         R9kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744025351; x=1744630151;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3ERzJBk8IPAt2EVC29UOPORnzeO9/Agn8egECrfbp4E=;
        b=OpawQPt5qeONl4QJuj7ab5xaQ1TGsnZUGe3SDOfdL2S8O/uzSZ7GZglnvH+iuGuokk
         R/JdohJpsZ8x2Rv1bMbv16UlWk9MxIP7OYN/Hihoz/3V8F3FaQ8UtAV9Nws45Z6iwZl/
         wYSUC1/qFVbWamt1fx8/30B1FeFXaR3z1gweuE3qnEv1UV5tMd5eH+XOW1UxVYpiBnbe
         hPI+JZRFfYDEpuFyrr2ReBpzQHD3aOeLRPzKK1bmSpAQjM2IF2bldLZnKVBVNlw0eBEl
         xUtvM2RoZKDLgo1yiuG455ALhp0SfT+XmNf9r984oqawzQ8TRNmzZAA3ZQfPxh8v80Vv
         YEJg==
X-Forwarded-Encrypted: i=1; AJvYcCVisxXPWVdr6uBNsNWKMRwtq/u0GXPG507MblKrOKFZHXIf1KQV0+pDdBTUwmPPM+XHF+y0vQu/l3PXKSo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoNdpl7bfRmshC8HLPqsi7umIa9MioJ0KjIwEftOj3T0epE6/m
	TAr7idn/q41XMWVXRQBzYH9KkdFfT2CRm3w9GE7qWzO+ut4trlEg7sxhDOj1Ago=
X-Gm-Gg: ASbGnctq1h+rCoz3OsFUGoEH5zhgMj3BlpM8jdout2VoHtXUtvnNmEOgv9kPjVhXgxq
	/qYcYD0U+TDQPA9Ih+ra/krAmIsXVYgYwM2uA63MV3wP8tpnoGWpFfrmG6GjG0erGOhIZFAPZqi
	LZnMI9jMvwbLY5sliEEttyDjtae+IWanyKG3A9LwZNBLLOVCJn75yOzShEfOTIrpSOJqAmc/gqz
	vVmhl3Z3cHpdreJd7HrYrLlOiATLQwVzGnvPfcFIxeSX6Ogniwp5h7yk5k0bcrhgkfFzpJ/ZCAj
	5KWreMM4Tz/NloerfOcKcg151r5tOvJmSQYW7/lpEQeaiDrULw==
X-Google-Smtp-Source: AGHT+IHtEoJKmUalkAqnYfLWQZZGYmoLGxJQg28JsvyBQ+EeaUcWAKIPYLpm04Je/UzWyzE9mqSY3Q==
X-Received: by 2002:a05:600c:4e8f:b0:43b:cb12:ba6d with SMTP id 5b1f17b1804b1-43ecf81be20mr130447345e9.3.1744025350842;
        Mon, 07 Apr 2025 04:29:10 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a79bfsm12098345f8f.36.2025.04.07.04.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 04:29:10 -0700 (PDT)
Message-ID: <9264729152cb70ec910b391ab4ced82dc62f953c.camel@linaro.org>
Subject: Re: [PATCH v2 1/4] power: supply: add support for max77759 fuel
 gauge
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>, 
	t.antoine@uclouvain.be
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Dimitri Fedrau
 <dima.fedrau@gmail.com>, Catalin Marinas	 <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Peter Griffin	 <peter.griffin@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, 	linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-samsung-soc@vger.kernel.org
Date: Mon, 07 Apr 2025 12:29:09 +0100
In-Reply-To: <ocx5n42h25ztwo5twlir5zoajavpcxce2ra5jjyl6ae4qg6c3e@akhc3dylsprm>
References: <20250102-b4-gs101_max77759_fg-v2-0-87959abeb7ff@uclouvain.be>
	 <20250102-b4-gs101_max77759_fg-v2-1-87959abeb7ff@uclouvain.be>
	 <ocx5n42h25ztwo5twlir5zoajavpcxce2ra5jjyl6ae4qg6c3e@akhc3dylsprm>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Sebastian,

On Wed, 2025-01-15 at 22:30 +0100, Sebastian Reichel wrote:
> Hi,
>=20
> On Thu, Jan 02, 2025 at 12:15:03PM +0100, Thomas Antoine via B4 Relay wro=
te:
> > From: Thomas Antoine <t.antoine@uclouvain.be>
> >=20
> > The interface of the Maxim max77759 fuel gauge has a lot of common with=
 the
> > Maxim max1720x. The major difference is the lack of non-volatile memory
> > slave address. No slave is available at address 0xb of the i2c bus, whi=
ch
> > is coherent with the following driver from google: line 5836 disables
> > non-volatile memory for m5 gauge.
> >=20
> > Link: https://android.googlesource.com/kernel/google-modules/bms/+/1a68=
c36bef474573cc8629cc1d121eb6a81ab68c/max1720x_battery.c
> >=20
> > Other differences include the lack of V_BATT register to read the batte=
ry
> > level and a difference in the way to identify the chip (the same regist=
er
> > is used but not the same mask).
> >=20
> > Add support for the max77759 by allowing to use the non-volatile
> > memory or not based on the chip. Also add the V_CELL regsister as a
> > fallback to read voltage value in the case where read of V_BATT fails.
> >=20
> > The cast is necessary to avoid an overflow when the value of the regist=
er
> > is above 54975 (equivalent to a voltage around 4.29 V).
> >=20
> > The regmap of the max77759 will lead the read to fail for V_BATT and to
> > correctly use V_CELL instead. This regmap was proposed by Andr=C3=A9 Dr=
aszik in
> >=20
> > Link: https://lore.kernel.org/all/d1bade77b5281c1de6b2ddcb4dbbd033e455a=
116.camel@linaro.org/
> >=20
> > Signed-off-by: Thomas Antoine <t.antoine@uclouvain.be>
> > ---
>=20
> Please add output from to the cover letter to allow easily verifying
> that all values are correctly scaled.
>=20
> ./tools/testing/selftests/power_supply/test_power_supply_properties.sh
>=20
> > +static const struct regmap_access_table max77759_write_table =3D {
> > +	.yes_ranges =3D max77759_registers,
> > +	.n_yes_ranges =3D ARRAY_SIZE(max77759_registers),
> > +	.no_ranges =3D max77759_ro_registers,
> > +	.n_no_ranges =3D ARRAY_SIZE(max77759_ro_registers),
> > +};
>=20
> Drop the yes_range from the write table. It is wrong and confusing.

Can you please clarify why having yes_ranges is wrong? Without yes_ranges,
all registers not in no_ranges are allowed to be written to.

Here, max77759_registers already specifies all the registers that exist
(and is also used in the max77759_read_table), and for write-access this is
further limited by the read-only registers in no_ranges.

As an example, register 0x50 doesn't exist, and without yes_ranges this
would allow write access to it.

If yes_ranges was dropped, all the information about non-existing registers
would have to be duplicated into no_ranges by inversing max77759_registers.
We already know the non-existing registers, and inversing that list just to
add to no_ranges seems non-ideal, error-prone, and just duplicated informat=
ion.


Cheers,
Andre'

