Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708132737F1
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 08:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751014462; cv=none; b=r3PAxYPWzxAaZlLLCM0iX+FMJKyjZow5ajLjlm6unC4xSfVfqk8veC69ndMSYkpiIrvsP8xM9pnssn/JduDJ3wuLCmXkqoI+x6vHyZbkd0EYf+1zryr54r98odAMId1wioOWBxsh5IiilRra+i6aTHe1gxvkMwRof7sScpRZLIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751014462; c=relaxed/simple;
	bh=G/67mhxLuKytL5l5EvWf4Siqtg/clNGoegq0wOXrKnE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=J+wSB0a6axP2yUUESk1L1y6Irr8XnVfBg2t7O2uK0EtGYJviMrsYOcxpFgnZJqTtWgkNA8vD+2uNSBev6e/mwHoTMKj6jq+xzhCc3ksOya4nFCP7AjD4umo78N2bQi+UzzJWyqeNaAcIzzBcLKK7qLYl4D3+ZB+Ud0px+7hZf9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iba02Znd; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iba02Znd"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-451d54214adso13118565e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 01:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751014459; x=1751619259; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0BS+6uy4su/8ABLs5cJdrouwkh2bvREAZhph1XMTpHE=;
        b=iba02ZndNDEd8FYkIxmnk0X3mZnW4cYs7zKS8dLT0Aeltvyo8fofDespJ+Nq8ompjG
         D1uddw91hnsRPH/DNoGBALCrrFfow+lMQxqjgbxw6GqLYhORAVBy6XMrf6KUoxgC7iuo
         RtH+vr1MNWgySIOXmxJ29Arllq7sXQ23n5jhI4SeLEFg8kPnPRT4DJCM2LsHSa5IvMi+
         irrWWPcEV/CCNvXRjkbmr56FHRMtTMPvVMZBpbTBQWVITUbuWj4kG6VzRjESdoeSH88E
         InbD7swBRHhdZbonyFcx6JuBKfZ0YCrYh8mwIVg5ZSLra/e06iIDPzND/0QRkm5BPJ5O
         VBgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751014459; x=1751619259;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0BS+6uy4su/8ABLs5cJdrouwkh2bvREAZhph1XMTpHE=;
        b=OYjxLpD4jDKsaZPEhngkDtQ//1cWjshWaH74r8nXeWNSUuOPguNO41LCV+zV580lm7
         ZxVutrWLctrfj4coE0Yk4Whm1OcyMBVeCfdrR/fAeI4ZVIdxgdccsVcvE7zZpkZ4fa4J
         7zq0wWbk2o4oVOWJT5L56tYpRtDR2oVUrPx3q1fNkVdCe/PqWPLWRUbxmXxYYBeD8J5N
         dbC0lWYlYlNH3D3jYOb8LnDWUPw9WzzZaLiYYTJQ1ZwA5r9UuRDvmMejtdfcsgTp0YYT
         8n2jHvTF5w7igpOyK5CqlkhZLZnrnV2gKYfB/zrI7uFP5BDNmUREkdydC4RMDLA0UqZq
         vX5w==
X-Forwarded-Encrypted: i=1; AJvYcCVOZ0wkyTkv87XzJ7KfAZUN2SjfsEiQj0C0CjknxiA+r2t6Lm5bzCIm5G19hIxIsrhgI5RpHPdbMmE5MBU=@vger.kernel.org
X-Gm-Message-State: AOJu0YypUQpbCTcyngRSPus6loH/Lv/m6y3ly5WZ6xkC+J7Gf3BSwnvH
	ncn4LHCG73XaiLadq9cKB0A8Nxqb5yHC+w69C/33rkJXgwMzS7/sTArwoq/0ZwmAqgQ=
X-Gm-Gg: ASbGncvS+6te8MRm2S/5yAErVFKng8JvckuabhkVERdOitqOgwpZUcqAuQMIUSA+r3l
	sRu37J7VEF+Qw4D4TsBfIJh6MWzrvRLCJW2vgFLvh1Wulh76zNvvWZHrO/+5OM5REgI0+VU4o9L
	blRZw6g6xKG6uKYKc1VxO6+ujRcrnSc/sfSItBT0OXLhBpFYLymXkTVPLAE5HDxWof4xCtzQ+yl
	wuVDQV6Dbq5E6cPk5KFvsO8jcMA2vRJRc6sB5zFI/6ZpfJv0ZoFitxA1Sk75FE5UIBoOmu/Zcdq
	X3vA5Zuz13FLNkxf6VMpQQudRm4YQQgta8jtxcSQLUs0os9GUINgy8hQUDUqhNQFKbs=
X-Google-Smtp-Source: AGHT+IE4X30M79feYa1B4IoJp+P/zoAnkDqF1pqfPyj589N4UXNvVInq2V7VnCmuiR3hct5W2E2d9A==
X-Received: by 2002:a05:600c:1c87:b0:442:c993:6f94 with SMTP id 5b1f17b1804b1-4538ee59148mr23355875e9.12.1751014458664;
        Fri, 27 Jun 2025 01:54:18 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4537c6e2f64sm51190205e9.2.2025.06.27.01.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 01:54:18 -0700 (PDT)
Message-ID: <b2c3b78d60f3dc3e4576e8b79298e22ea46567c6.camel@linaro.org>
Subject: Re: [PATCH v2 2/4] arm64: dts: exynos: gs101-pixel-common: add
 Maxim MAX77759 PMIC
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Catalin Marinas	
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Peter Griffin	
 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley	 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Date: Fri, 27 Jun 2025 09:54:16 +0100
In-Reply-To: <2c491166-d8ae-4fb6-a4f7-74e823e1205d@kernel.org>
References: <20250524-b4-max77759-mfd-dts-v2-0-b479542eb97d@linaro.org>
	 <20250524-b4-max77759-mfd-dts-v2-2-b479542eb97d@linaro.org>
	 <2c491166-d8ae-4fb6-a4f7-74e823e1205d@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Krzysztof,

On Thu, 2025-06-26 at 21:49 +0200, Krzysztof Kozlowski wrote:
> On 24/05/2025 07:21, Andr=C3=A9 Draszik wrote:
> > +
> > +		gpio {
> > +			compatible =3D "maxim,max77759-gpio";
> > +
> > +			gpio-controller;
> > +			#gpio-cells =3D <2>;
> > +			/*
> > +			 * "Human-readable name [SIGNAL_LABEL]" where the
> > +			 * latter comes from the schematic
> > +			 */
> > +			gpio-line-names =3D "OTG boost [OTG_BOOST_EN]",
> > +					=C2=A0 "max20339 IRQ [MW_OVP_INT_L]";
> > +
> > +			interrupt-controller;
> > +			#interrupt-cells =3D <2>;
> > +		};
> > +
> > +		nvmem-0 {
>=20
> Why is this called nvmem-0, not nvmem? Is there nvmem-1? I see binding
> does it, but why?

'nvmem' is used/declared by nvmem-consumer.yaml as a phandle array
already so using just 'nvmem' fails validation:

Documentation/devicetree/bindings/mfd/maxim,max77759.example.dtb: pmic@66: =
nvmem: {'compatible': ['maxim,max77759-nvmem'], 'nvmem-
layout': {'compatible': ['fixed-layout'], '#address-cells': 1, '#size-cells=
': 1, 'reboot-mode@0': {'reg': [[0, 4]]}, 'boot-reason@4':
{'reg': [[4, 4]]}, 'shutdown-user-flag@8': {'reg': [[8, 1]]}, 'rsoc@10': {'=
reg': [[10, 2]]}}} is not of type 'array'
	from schema $id: http://devicetree.org/schemas/nvmem/nvmem-consumer.yaml#

https://lore.kernel.org/all/20250226-max77759-mfd-v2-3-a65ebe2bc0a9@linaro.=
org/

Cheers,
Andre'
