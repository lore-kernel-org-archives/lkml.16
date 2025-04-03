Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7CE1E87B;
	Thu,  3 Apr 2025 10:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743676301; cv=none; b=YbAfHDuObdhhdMkbT/bw3eHcGAJAW968hwG02eX/Rr4WwCmgqdFFzwYA1tB1gFyx45Kk4jp2c/G4a4vNLkDA1CIM+5esEX2XZus/9D/LBTiHHoYU5yctpI0dJinDUbhI39BnL2KNMMkE6tITvfMcc+gAtl9oWXSpFhy/H8bT5fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743676301; c=relaxed/simple;
	bh=Ooq39rTuDewDohPdD+Uv0IDrJtgY8HeG+4EVxLiWgFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k2kCgxKehMa5NJfRRS0c0UJJGN5K6tluSQpC/Pr6e89b6uvJ/bHm2+l/VSt9SDzWlhaepWbg+x7m7EZh38fcCOlUMbD7bAiTPu3RR1Dx95rnLW+5pIRIXPuM7cRWrKXeBJI4HR1JsL+vENFjCA6bjo8JA8uECsnCL+jn8fYR4ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QhR9dsFW; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QhR9dsFW"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30beedb99c9so6901821fa.3;
        Thu, 03 Apr 2025 03:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743676298; x=1744281098; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pkl55XOjf550d6YijfrQtlIy4dvUDtTsQLi7ATChpCM=;
        b=QhR9dsFWmJ7I5SmzwxsXq+ULN6xuFyt/piQg+Z56nCnhOrsCmPH70VwWKs+W3gU5In
         KxMHUIi7jpWS8+XHE11zOYC3GwuM0eX9XnbMwYGapsN9kqaAIXo5DBHrcd4yjp8Sw374
         ow4k9UV0lemf+4RsMVJ3nlMvaSvuD69KkKTbIqPwpaq/ia0gXSXHk/AASQVdhV7ZiDF6
         yK05KIZ7J1t+0tespB6xvsZyG/84yZK1DcPLZE2rx9v881DZ5ET9+pg2qqaVk1qndfuE
         d4Yfq7chleb6OK8eOJVzSk962RDkoclUquwl7Nq+9qLG1hSJfhALGn3/507lwzZiiVHO
         jtww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743676298; x=1744281098;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pkl55XOjf550d6YijfrQtlIy4dvUDtTsQLi7ATChpCM=;
        b=aw3BdEyb1FQMDG00UzdfNHOB4b/k69p9sGefPK7w4Eq/TNe+dDctTaeQiqg+gLDJuy
         BTrUqOowrl9u7dhZljum3CoY/jmdCu2lATI9sGTix6kzSf/rmqYNJOQUhj04ctE+LrRq
         9ISS6UvIV8iDdoQpGnGO6blfGUKgw2Om3pWg5LH9yZEXbVB+lYCT/7RPPmK4T7dzGmko
         C04OMRBnqTcH93R2IBemeY05M0o16Ua8VLwsoHB7FASL3aCny+wDWa4gvp151Jbmoi5U
         IjJd3DHkdyCzr7Gx+YGCNyqCxeX8B6TECQ8VrcOwMcfHdhD2RIiBUNSe1t7ouf+OmoQB
         8UHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUZ75n4myqQZEyOHUTLjSBxFD+2vzg3dllAQMMA4RcAMOA3YQ6m90zwwjgqc46dnzJqDi5iaNkAW9WoLjD@vger.kernel.org, AJvYcCXa3NwzaEWd6txZluyKZK5xAwLln9kG08lxb1lYKGFei6Qu6yM17eKPKYzRVOIt+LDtwrboeDueGML5@vger.kernel.org
X-Gm-Message-State: AOJu0YzJDR0rtiJiYzqHBF/o5JwAEb/fGjo8IoSBCf/4vNzC9ESY//Ap
	ob2xTrg+bgRfFvUJ61l3AXSrQL0s4XtagZhBGbjPsXy7i1H+3aBq
X-Gm-Gg: ASbGncu4egDzNMVgzuWXp6u/yYp0BXL65OCFTRjY94SFY40HWcBvLknMEx5+HSRaUBH
	JNb1nSiS+pzwrW239qZX5egBiS4fxNwDSfm7AV/19SK4d+IHQ+WMqku6LGzfjEYt97B203nSdqP
	cB6t9u5qYSIJfJTsaDKhq644vp+pOa34eN2agHRCFrFpUQBOsobqXUMrZYpT/I4jqHjPD5VB9jj
	Y6ZdUAxJH1MgnwVirUBG+Ve237oh/c41SaLiBMpZ4mVHUBHpozZU2e1TuwHlTFTKP2G/ZiYTcut
	LN/Tv8LwfwCtjytnG97I3nU3eKHYyynHIDR9R0Mn9crJTXf0yRObmcZpBXP0ItFCeSoRb7RELwK
	o5bqM37WElnCkc6/M
X-Google-Smtp-Source: AGHT+IH2Bx56lpKD5XZwwwuXaUE9amtjtXGdogWmMz4v9lpDdZavcEWpRMM5U9IqHfqZOxG9kifMmQ==
X-Received: by 2002:a2e:bd0e:0:b0:30b:e983:9ba0 with SMTP id 38308e7fff4ca-30ef912d2afmr25767961fa.23.1743676297324;
        Thu, 03 Apr 2025 03:31:37 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f031ce889sm1577031fa.98.2025.04.03.03.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 03:31:36 -0700 (PDT)
Date: Thu, 3 Apr 2025 12:31:34 +0200
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
Message-ID: <Z-5jhrwTfu4WMk5n@gmail.com>
References: <20250402-st7571-v1-0-351d6b9eeb4a@gmail.com>
 <20250402-st7571-v1-1-351d6b9eeb4a@gmail.com>
 <20250402-rare-slick-carp-dbcab9@krzk-bin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ferfG92n2ptOGpLx"
Content-Disposition: inline
In-Reply-To: <20250402-rare-slick-carp-dbcab9@krzk-bin>


--ferfG92n2ptOGpLx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Thank you Krzysztof,

I will fix the issues you pointed out, just a few comments below.

On Wed, Apr 02, 2025 at 10:27:53AM +0200, Krzysztof Kozlowski wrote:
> On Wed, Apr 02, 2025 at 08:12:10AM +0200, Marcus Folkesson wrote:
> > Sitronix ST7571 is a 4bit gray scale dot matrix LCD controller.
> > The controller has a SPI, I2C and 8bit parallel interface, this is for
> > the I2C interface only.
> >=20
> > Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> > ---
> >  .../bindings/display/sitronix,st7571-i2c.yaml      | 71 ++++++++++++++=
++++++++
> >  1 file changed, 71 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/display/sitronix,st7571-=
i2c.yaml b/Documentation/devicetree/bindings/display/sitronix,st7571-i2c.ya=
ml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..6e5e0994a98db646a37bb17=
c4289332546c9266e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/sitronix,st7571-i2c.yaml
>=20

[...]

>=20
> > +    maxItems: 1
> > +
> > +  sitronix,panel-width-mm:
> > +    description: physical panel width [mm]
> > +
> > +  sitronix,panel-height-mm:
> > +    description: physical panel height [mm]
>=20
> No, use standard properties.

I will use width-mm and height-mm from panels.yaml from
panel-common.yaml instead

>=20
> > +
> > +  sitronix,panel-nlines:
> > +    description: Number of lines in the panel
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 1
> > +    maximum: 128
> > +    default: 128
>=20
> Ditto

I will use vactive in panel-timing instead.

Do I need to specify those properties or should I just list them as
required?

Some bindings set e.g.

reg: true
reset-gpios: true

and others just list them as required.


>=20
> > +
> > +  sitronix,panel-start-line:
> > +    description: Start line of the panel
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 0
> > +    maximum: 127
> > +    default: 0
>=20
> Ditto

I will use vfront-porch in panel-timing instead.


[...]
>=20
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        display@3f {
>=20
> Look how this is called in other bindings... The binding and example are
> not following existing code. Why? Why doing something entirely
> different?

Sorry, I'm not sure what you mean here.

>=20
> Best regards,
> Krzysztof

Best regards,
Marcus Folkesson

--ferfG92n2ptOGpLx
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmfuY4EACgkQiIBOb1ld
UjI7Gw/9F4LvS32qIkIpPs75F5yZZNtfUcPbkFPQ7lF5z+fABUdvoneq2xFkw30S
ItTED5BG4DUpXkuKqapvWLq5tvdHk0t6wcjDJGoz+qla7RScgC0lf24p/l4q0RIn
PS1c9+p3SGmsORM88jrj/fZCBKom2HZMrG/SKbnL3c5zG37Hy9dXcV2x+ha+k56F
Qtw9xFxPjS3xaDFQr4hzZ9mo/ppVPOKUkjZh8fAzaeuexyMT5iI6U3FrAp/VK6OZ
iec6nE/whl7yqDqf1h+xVuJbaxW54+qTk2XweuGn2wk4l3VLi7skW6c3M5fiDj/Z
d4bDYdBqFTMA+/9RiAEONDDMEq/LPzmF3FSACsaIxz9NbJeDtu+Nc0UA5KaVog9X
Sq9CA4BTmoXL2tMF5leO3FA88Ujlp2kopATjE4GQy1+r5/pFQDIITJMfjnLaPnMD
Zi2HyKUfbnvEZbRO814BFaISfJD40hBKR2ik5wf0ZgDzqM6hMCCWBneg6qtMNk+H
jybbsUVsB+8GJWoMFRaFoHv15ydpcx10qk5YyxBdlFS4F1HVDlZr3uS4/u2QvWe+
kgzOgYlVTvNTS68U7HYBRJBJ6xGxDyOdETaKVxXQM8xydwDcGCZthh41AINhCWj0
h243gcMmfCNbJpgVPIR1gb36CgpYRoY57wLW2f2AwFqo2o/udD4=
=VjMV
-----END PGP SIGNATURE-----

--ferfG92n2ptOGpLx--
