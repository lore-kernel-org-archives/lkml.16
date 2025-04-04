Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E176E567;
	Fri,  4 Apr 2025 20:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743796829; cv=none; b=FWa9e8BBPIrGJMk8ELDbgKUPSQwU8bpjpe55Kbu7icPRZJeZ+2PVlHGWZ43QyLAjgqinbZwhzSyOPvHSjqMvFrK7wpHMFkicGqxUAcS8KFRcimx7ubbu5uCKs2UGE2Fzj95/d4xI/bSPHThUI7SrdmrQzk7bfTMHIWqDO/MFDps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743796829; c=relaxed/simple;
	bh=CdUvOQYTxjNTsDyHeUAwsW2erk3aVAGihloUjioHLbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IOCW+ZO3bZEHBK9EcXKjuIj5B11SM4t4BxBLc7A5D11XAdcDibpSew53R57q3kOAFTJT+Ohi98Sd0rLgCvJdRqJNACU6HfqrQkdjC8H9WTe1Jlhdn4U3nezETRJyMbzBiV8WjlkOkDAOFQvyorBJM2zp/Nt8Pn9ml5CmctEijbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X1P4/7F0; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X1P4/7F0"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30de488cf81so24584381fa.1;
        Fri, 04 Apr 2025 13:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743796824; x=1744401624; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NGnSFRzuoAQP7JbKLfcQWzVzDu4XKirqs+YYRbjcXCs=;
        b=X1P4/7F0v7aaaZ9jRpmpy/OHxTMYR/IapBAH13+VRB5Bg9RcxxnnDVp7TEh1biLtue
         SSHrdMzKWzenGzXOb54e4KerrWXFZz4acPgAtMMqLpfkvoZf/KbOvv36G/aSuxRtbpQJ
         5RR5PA448ww9RpxoGlFy1BkAB9feBoP2e+GbrJ4wjjppfPBXHZd7HfIEXneUXufXt3i6
         oUNNaXKeg1CF9glQdSKTdoAU5b/T9TZmcK/dzcHDoCObalk5w3dN5r2ig2bc5Yk/TeKm
         u8VGps9h2eftZdOmqUYkzv+iZy4LZ7W724W4ry4VW/UhsjdiCVGvRK3ULIJ0SZG+smDI
         /cCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743796824; x=1744401624;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NGnSFRzuoAQP7JbKLfcQWzVzDu4XKirqs+YYRbjcXCs=;
        b=OOgtFfTmcQbVZQAkz59xRB0mq7F6yzRyp3R3ig8WNM1r6Tm+R7XSRLjIy/D7cU91m2
         dUJCBghHl0mnKf1Rdi36vJ/BSY6yJL0GGXOIip5gvCfU42ZVLuLtJymF12K77DXZMnpU
         3eZmxLtNyH4TuUrCpUFmet8KVIbpqb/Fil0Cwct8s8TZ/mJ5X0XY27KH6Ee1FoegayBG
         gMKS7/RJISsT2XAZqm+yYFxuuhRbpu8nFc11bq0nPZdqn2FvdHAFKU3FGXqf9GKuQWqy
         h5O/r2jKi/IDJw1KNahprBhD1FWeTnqPX/IhSfMz78Jro0M+InX1GsCOR3Q2tzvHvzqL
         +tPg==
X-Forwarded-Encrypted: i=1; AJvYcCV78f0L3iWwLj4Qf9NN9u+koxXIsmKW9qpA0xlnYKi8GbEAG3Zb95Ray2FG5Y3uDsqIMdISfQ2hefxs@vger.kernel.org, AJvYcCXKCQiM0qbX23eTOTLlnyJp8ml2k9bqoWLUOzvJ7mfwd3kQ/Xxbe/jRLzl3PJm90Cb1Ih5cGqpcGOOLoq2I@vger.kernel.org
X-Gm-Message-State: AOJu0YwxePembcCKtCoYbJqXxYECV611/YKhBa1WMGa3RFZzVIBJqPsS
	guO3JpKd+ZhrP1/53mlsPQ5ozmPQkmJ71mvQUiExg6qFQf2XtL2B
X-Gm-Gg: ASbGnctQuUx9/H9VQ0DlOOzYwCzTe0h6QZeWip/oPRvuw2bX9LnM5OzCXAJr7A6KL9N
	tY/b7Galgu/s5qKBOoGSV8q5P1uL/J9yPntUufGdgl0TY5XGQ19N5Q9c2+WQJDgFPL1apKlgzEb
	T+xbYvOusSkb4Q/ki+g2IDvWPP8YUAhk605LWb/mnoLyhaJbyFg0rY8y7UR/pIC/zbC5zrcJaxR
	BXJ3CZPfEZ6zqAvoQgkLMmW6KdK0zfups2xPCNboUxVx59HxbaHUc1h9QB9QizYrkaK/OTTzB5m
	PLnJoOLRX169L073EUO9MFyFi/qDzcia1NmfDPAFtDQTS84RHNDgUPis0E+HNoxvnCfa/OG0K+u
	3GaA0tA==
X-Google-Smtp-Source: AGHT+IEEDhNz2RLU0cU7UeS/zJmcHV5Dl+HcylWgqmeC/Yvy6JjRimOfReWDSNO1EN6tnir9PBbWUg==
X-Received: by 2002:a05:651c:30c1:b0:30b:b956:53bd with SMTP id 38308e7fff4ca-30f164eb958mr2440851fa.4.1743796824081;
        Fri, 04 Apr 2025 13:00:24 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f031bd00csm6479541fa.66.2025.04.04.13.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 13:00:23 -0700 (PDT)
Date: Fri, 4 Apr 2025 22:00:21 +0200
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
Subject: Re: [PATCH v2 1/3] dt-bindings: display: Add Sitronix ST7571 panel
Message-ID: <Z_A6VXPLuOfk9HPL@gmail.com>
References: <20250404-st7571-v2-0-4c78aab9cd5a@gmail.com>
 <20250404-st7571-v2-1-4c78aab9cd5a@gmail.com>
 <d2ffca88-6773-4e40-b737-65a451ba1d01@kernel.org>
 <e1a7c9d6-9c14-48d3-ac2e-c6e0df04bbbf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="C7W91j7lgF/0CeRL"
Content-Disposition: inline
In-Reply-To: <e1a7c9d6-9c14-48d3-ac2e-c6e0df04bbbf@kernel.org>


--C7W91j7lgF/0CeRL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Fri, Apr 04, 2025 at 07:36:12PM +0200, Krzysztof Kozlowski wrote:
> On 04/04/2025 19:30, Krzysztof Kozlowski wrote:
> >> +
> >> +examples:
> >> +  - |
> >> +    #include <dt-bindings/gpio/gpio.h>
> >> +   =20
> >> +    i2c {
> >> +        #address-cells =3D <1>;
> >> +        #size-cells =3D <0>;
> >> +
> >> +        display@3f {
> >=20
> > Not much improved. How is this called in every other binding? panel.
>=20
> Hmmm, unless this is not a panel, but it looks like a panel and
> description partially suggests it. Other sitronix devices are split
> between these two, but OTOH your driver is more complex than just simple
> panel.

I've counted this as a display, but the border is not crystal
clear, and, as you say, other Sitronix devices are split between the two.
It is a controller/driver for a LCD panel.

>=20
> Your commit msg is one sentence and binding description is basically
> non-existing, so not sure how to help. You need to describe the hardware
> so people understand what this device is.

I've prepared this description for the next version of the patch:

description:
  Sitronix ST7571 is a driver and controller for up to 4-level gray
  scale dot-matrix LCD panels.
  It drives 128 segment outputs and 128+1 common outputs.
  It provides several system interfaces like SPI, I2C and 8-bit parallel bu=
s.

But still, it is not obvious if I should move it to panel or not.

>=20
> Best regards,
> Krzysztof

Best regards,
Marcus Folkesson

--C7W91j7lgF/0CeRL
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmfwOlAACgkQiIBOb1ld
UjIxkw/+IYMZdy49mNky3ZxLZOHPj6jfpICZtwU3QV7hHQtccjTrAxO58wKk14U7
0NLdVZY3VN9Tjr2ASKebQRgEbesEiKdZQJ2ZKu7z5tpj0WrImU0+jYIAKAPhO66f
NtfwOD++IQJX0ZoX0oTfC8aMTD3qUN/vZ0NM+fvlSpu0+GEhZClA/yU2P5pVN66X
B3i6COv/Bu7WWuJ/z6widLqqMf/ru6u1iOfhg4NJ4Bg6WiOazVnjLY72iQNreVho
UQy7KJfCbT8aFptnaGPDZPtELCrxDNCifRmOhk1jylIiteWpEgjkdAFGCfjHXGm+
ZsuH0ZhCHjEIfiqR0hG5IP33fP30d2dzmSBOS5nO0FldZIMGyC61VJ78MNoaleYl
bivx5fsKvzJqgLL9kn2CaJKqEkZXePudspz0wTwcwNfSaTGBKBB9fzHcscnbGB2H
hajQauJM6+ntV7QRqAhBhrP/A7eyNg/CUWY4K0eJridwQwSSXVKGhhYROoOsDCC+
OABuvYbVIPt74NNgKXq5AJpdAZedMwPUYIptWBWirToYJ59zzAlE67lTmKU3MjTH
Hzo0EKqEq0x+m6x85naY3ytm9FcLX8dKmsh5Zpo6TCaO5bdzd4yNunMTRekkjBc2
KeGYDxA3g9UR00GSS3ib9DoGMpHWrQjCbIBhe9h4KuQtYmaFpPs=
=HeD4
-----END PGP SIGNATURE-----

--C7W91j7lgF/0CeRL--
