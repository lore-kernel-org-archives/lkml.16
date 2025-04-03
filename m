Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C8D2475C8;
	Thu,  3 Apr 2025 14:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743692041; cv=none; b=sLrbrhUmJan7RLbbhHWezKC3JP0K9J10sqplq+WDrQ24mNd6c9E22WAZWxfIQfVAfb7hxt+Coah2IVDRAozK4u0xIZ/ilybQqAmQPB1da7fGO29iDEoS0d4fSzKHoy0pl/tYmJvQitzCn1edt3RTogpj7RjiEpcTGHpHYpFwAP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743692041; c=relaxed/simple;
	bh=1HW2J9szfZcfQayWxnE0sHRZHkTM+3aadWMY9TyaNdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EIC0TG2ybkhTMyCRH2f0WPh1B863AzIszVALIxYBG9GWPM2pJHV4mwBMkgK7TEj2up3A4ieW1+wd0CCLh4UbhaN/sL3fQc7oZjQVVmONsn0hJ8A5DweFUzYfjtRUfoRLjwGriKHZSijJQS7XuxCbdZ/MfyIKG9AZ/LNBsVgfJW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KFaLoLcZ; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KFaLoLcZ"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30bf5d7d107so7752951fa.2;
        Thu, 03 Apr 2025 07:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743692038; x=1744296838; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Oh8FUFZnWO912SrVNU0z7oV+vIAYgIiMRfGsFdHpPvo=;
        b=KFaLoLcZXXvrZo3ne3Amtu1PREPRkDVfgI/o9S7c7RLxgTmoji3bqR7v7dpB6X1YUX
         fMtDa3Ls4bsDzAEjWkO3T3BVKzuWKHSxeUwS1j8YZ4hM+Te9RmdRBB7rnYT26X13pcxw
         u3VMXVCrBsyIrw1Q9JBCBA1C4RPqFVGgdiIbdKOYTTI6RNmZCiFtkF4aZ/FHOmexKWkG
         90bPZVCBv7db8O2E7cCaKgJwNuzEwGgCIGdHVOLYmCUGbGt4iBpsOgaiIaUZepxpvv/H
         30aihxO9dbWlo8zuECFvKzR9AkTZ2HDbr2slWsLa/KGGa3fUYyfP7A6dGOMelYIgHDF1
         Re1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743692038; x=1744296838;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oh8FUFZnWO912SrVNU0z7oV+vIAYgIiMRfGsFdHpPvo=;
        b=e38BYN1H+Clh4h4yh8HQlKCvXzvGXkJwyIELU+hEKgcAiyZXcjD4fu1OnEFW8Tssaw
         MXalcSlkOBYoFcWRqMcSeV139CCx/LaLjBEJo7US9c511Uf0njTFo1+7u5eG5vdgfn5S
         mLKH0zVAadycV7x3GuxAMfChVSCGUloYP/AyVL6Qsxntl2HqHzmBvNa/YhZsdbZF4D31
         dRbjGlnTdR4COsOqg6aPD+TVW+LciTc+lFsenzfOVeYZDGEVa74+H6IiZWGK5bzxCVfn
         hfDbvAfKh6AxczVfvTmlXtN5mDa8yhUpxg1vrIBEsMGio+PlW9U8HOkQ013eknaMNu5N
         odOQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+IYuaOdyTuDaXyEhKU7bFZljU2Gwsmig4AO7kvWmci9Su/YVR0yfD/xaQ0GpkGTMRuZMny4iEqCGHOgHY@vger.kernel.org, AJvYcCWOVHE/YZfT7WZkdRvRNihOXeQ0ahXBxy51+T5nHPOysMa9jfjhWVn77RXCMvdPBQaEtYloRgrZoNTb@vger.kernel.org
X-Gm-Message-State: AOJu0YzoD9NYdI/gtWSyUzG5HKCn3U9NsEzEtExnRr7rpunIdIv9qm4k
	cFw1Bu0Bg/h+Xn5+nmIhuXy8s3j3Qh/ix4MoOIflXS6I+WyToK7/
X-Gm-Gg: ASbGncsBBXwKhtaOQyy849gqdq/pZQwCfWID6Tp/X8qbTY9s8yoqUBTLuvZ6bRn+eZm
	ispPZDIOFAH5yTZFAywrHMdMh8FscCWkqFgZwhHF4jcFITb9sXaVZZqEQmHqIH/H3YoGUBpNHYM
	/Ql0WsncT84SivciXhCOdlDxXeSDmmTXUy7zmgFagvl+l8oFaetKD9IXtvrDK3Z3M8aE5FDI06h
	qmbBQK/3jGxbm8COMZ+Zk40nc2mncI1RedPNVy2LTMIcBVxe5VOzyzUz/vVkqDoI4xlTczJQRrt
	ObCuPYF8izYVEor8aihiNFYpolxg3QRrIXBQ9mIcEtdkkIlAlR627rhv83a3yN0TzbTdoTHpZRC
	KATV0di9K6jg3YNU5
X-Google-Smtp-Source: AGHT+IFr/ZQ8fQxwv6L85p0npeEqoBszB5XUE5CN/N6qEJuyXQpYUL11SZCknXJaO6nELi+XVOR9hQ==
X-Received: by 2002:a05:651c:2122:b0:30c:12b8:fb76 with SMTP id 38308e7fff4ca-30de024ada2mr62681471fa.15.1743692037619;
        Thu, 03 Apr 2025 07:53:57 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f0314b58esm2398931fa.52.2025.04.03.07.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 07:53:56 -0700 (PDT)
Date: Thu, 3 Apr 2025 16:53:55 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: st7571-i2c: Add Sitronix ST7571 panel
 bindings
Message-ID: <Z-6hAzDHm8zOOrrw@gmail.com>
References: <20250402-st7571-v1-0-351d6b9eeb4a@gmail.com>
 <20250402-st7571-v1-1-351d6b9eeb4a@gmail.com>
 <20250402-rare-slick-carp-dbcab9@krzk-bin>
 <Z-5jhrwTfu4WMk5n@gmail.com>
 <4dbdea1f-dc22-4c66-b253-c3fd625edc67@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BsHP1+c7dvF4bVP1"
Content-Disposition: inline
In-Reply-To: <4dbdea1f-dc22-4c66-b253-c3fd625edc67@kernel.org>


--BsHP1+c7dvF4bVP1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 03, 2025 at 04:28:22PM +0200, Krzysztof Kozlowski wrote:
> On 03/04/2025 12:31, Marcus Folkesson wrote:
> >>> +    i2c {
> >>> +        #address-cells =3D <1>;
> >>> +        #size-cells =3D <0>;
> >>> +
> >>> +        display@3f {
> >>
> >> Look how this is called in other bindings... The binding and example a=
re
> >> not following existing code. Why? Why doing something entirely
> >> different?
> >=20
> > Sorry, I'm not sure what you mean here.
> You added code entirely different than existing code. Why doing
> something entirely different? Open any other panel and look how it is
> called.

This is still unclear to me.

I assume you are referring to the display@3f?
I can see many other panels use display@<address>, e.g.
elgin,jg10309-01.yaml
and=20
sitronix,st7735r.yaml

Those are using address 0, but that is because they are SPI devices,
this is a I2C device and address 0 is not valid.=20
There are plenty of examples of I2C devices using the real addresses in the
node name.

Or do you want me to call it panel@3f ?
I can go with that if it is preferred.

>=20
> Best regards,
> Krzysztof

Best regards,
Marcus Folkesson

--BsHP1+c7dvF4bVP1
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmfuoP4ACgkQiIBOb1ld
UjL+dBAA0pHFn/eRrynPDT9PQ/BqIumgyZwTUV/jSUAJJoZjfDmo28iG47/Xg6LM
D/eriitszDo6l9HvvTyESEqb3vPmi4xdVxN7RBErYdwFByyv4vQtquv9sNJNhiBP
41mDv0m2H2yksn4iV3XY68i+mGrnf2V/cUhe+VaGWmnOQtxUXHjUi0goSt6PDxYX
J3rMsJX1+U7E6Xh8U3JfAmeevOfzh1RjxdbksNN9gX2twMRPSyTMBPHJVUiPsEbr
lb4V0OGI5XqzIcVkg3TFkKZz2gmkZf6XvxY9gFpYm7OUFEOehJZZyD7ZAsvDL2Kq
DcxnJjmnsf9D8n5DlQGzVLTL8EcJpQPb5v578DrNXRKKyoV4m8oyW3ZSaOnhko65
7HokSAtp2QoXlHfpEkmDcAZruD4/r5aZvb3Hkcxm83nv5UP/PxKV2xBnXMSLqtMY
/9kI7YvrtifhhIoiWXXcy2SbY4+EazLnaVxgSN8NpCh7XI7MvLoHsq72wxndEz04
pyw3rD4crtw0hlHrhgexb2hhPkeLofuccNMad0httVt5mLVNFseRABE2sQ++j6Zo
R1IE0GB2GHx3bHwj9r9d15kzz5huQe09TLL4TVOPdYe3h77VsoXxqAmTvR0JpKuc
LAbzjJzXNVlxuyyS61j3c1JrOVK7auCp/qT7tzkHWT14BJEMNgA=
=rqvK
-----END PGP SIGNATURE-----

--BsHP1+c7dvF4bVP1--
