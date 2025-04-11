Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6409923A9;
	Fri, 11 Apr 2025 06:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744351417; cv=none; b=as9RdTvxcChHRRBEHrNmkT3GtOLDwckGl9j/1xnCLnNhF8EXRrgAwMiuWeKnHAzh2KdY/qYOSnKx75hFmus0dZtxDh97o6XabmYt5kQsBrjAxwgkiF7ckk6qz6ZhoTZj6JZI+a+wh1TbH8yNktzjwY2giRMPFB1sYgqiM9HCrPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744351417; c=relaxed/simple;
	bh=OJ/4ucNwctDsuH7ccbouQT7OQ1/pZRlfwaGwj0hMlZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eMhNY+Dve2/ccKCIUMwfa1N7n9qnKDjEkX8vVqVh+/t0msgFsOC0/j0l0GqrcTQ1+1gXN75HfIv9hGWAsa2B9lFwJ1nE3UA1gX3wmjyiehpefMBq7LlkLyRpW25gbindAJbi7h5gGjEeGZV8Uj9n5HRPJeRTFvF1SQS2RpuaVHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T8ULoLYw; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T8ULoLYw"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30db3f3c907so15279731fa.1;
        Thu, 10 Apr 2025 23:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744351413; x=1744956213; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KogIvuVDAt2X129qWiT+1rCQQg1lNr3mi/gTxLDY/rc=;
        b=T8ULoLYwxRHCKAlYrrlT5JQ7SVzv9yqf2gK4cqprC12q/bUnKEugBBshMpJQce0fhh
         310gKunoZm6wDQptoSxnt7oBxv0qycAuUKHZ2u1BjDhMnMilzAQdpH1KcAQhcC9YnvNp
         Xy1e57tuXaj1HxiKynPqNwGT27hZ7w64N1lA+MypNSbWpSLdp55VV/xwCrBvjJwKncw1
         ztqCbCTEEgXd8hZSOErIeH84OUKKi6eVa2hwMOFpscLDi4N823atCKDZoljbUA3aPI0B
         7iKwiy6mToro9/Wx9GNReJNaQoHYZHUtB/SHB/SDUKAnFfgf6Mj9CHP+6WKBpeCkctwE
         BUWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744351413; x=1744956213;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KogIvuVDAt2X129qWiT+1rCQQg1lNr3mi/gTxLDY/rc=;
        b=A8OLSQKwOOZ4VVvuU/A2yirPg+9qmW352LmNrZaaMt0lQhUL5QmsVNHDQaMTedRomI
         Jbv37Kj940uyCdWFPduxBe4O8xvOEkKfeluNR2bwxsbT9cezDo9kCDlVPva9d3tptOjC
         2KmAFl2Vll9AHIRR3J7tv3z6IojsM9LQMaTmFeiUaA+8JE+BVHt3x1Uzfq9UpEXnO6Kh
         /8xHEEU/WS352QvtrwK7Zn1egt1jW57YY53A6hsN5MsvnaYYvDXYVCmM38BLaKGrVBtF
         bYWP5l3uHiAgrBnf9gWGdWwaTEJM0vzMPBLyVWbJVBqi2CbLGJVax6VTMxtNWKtDL/eV
         7SNA==
X-Forwarded-Encrypted: i=1; AJvYcCWCAlXkMe4mSqd9LWTiw/0QcTjYPJMzFwQin5hMyCH+8sA6e47FqJ+1DNtLUssOlusB6dxNygGTUL+qSpIl@vger.kernel.org, AJvYcCWGK9oB6U+r/3gKjWc5BiwOx4BRBvi3lbO00h+6lZlwml0unQ5X/6LNkNiY/yAGuLO4LuF1UX2+Wxa+@vger.kernel.org
X-Gm-Message-State: AOJu0YwiAqDCV2mtCAuQ3xdr/Un7CinKpz843ZwKUfB8+7CSEFLdYpVY
	FuXV+tQhPUf0svP1ZAU4TRUBiFS+MzK1dlysTsPc6QuQ2ydj9kW2
X-Gm-Gg: ASbGncuk6/v0BLOm0KiOctDT2nIJNXAjZyBeNwQKC/rqgECUFMoUxg967LNVHPMoMg8
	cWuBfIrt/3K/p1wNIbMEql37BGC8NGYBrUZg3aZvxt+xquQiepOroRxeGFCkPqbLAosP3Gwsw+9
	WKUYHR9y4FnSTXBOSiXTIYB88hjvqWhhsYiSEHVAzhhindzjV62ejgB9WOXLmJhEorEzT6bDumK
	QtIrh6cblqMLI+Rz+tqVwI6XKcQmxnsR85ZRr44oFBlMleVZnUnTdeFJBXsaVfch8qQM08WFWWj
	7S47tYYkUxnenQQLSKAYEdJ8VCZtQHUmj8iIPlKJLP4Zt7TMV0NGQCZewVrgjtY7axN1Do9sKR1
	W7rxrvMUaDUoo
X-Google-Smtp-Source: AGHT+IELeqhKYDoyLZxkTlWhRxGJfiYCFeb68UsWHeuWkSgfqQgVXqQSvk+wW24gS0mK2grv/JSIzQ==
X-Received: by 2002:a05:651c:12cb:b0:30d:e104:b592 with SMTP id 38308e7fff4ca-31049aaf9bfmr4987611fa.38.1744351412983;
        Thu, 10 Apr 2025 23:03:32 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f465d4ee8sm7221121fa.77.2025.04.10.23.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 23:03:32 -0700 (PDT)
Date: Fri, 11 Apr 2025 08:03:30 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmrmann@suse.de>
Subject: Re: [PATCH v3 2/3] drm/st7571-i2c: add support for Sitronix ST7571
 LCD controller
Message-ID: <Z_iwspuiYAhARS6Y@gmail.com>
References: <20250408-st7571-v3-0-200693efec57@gmail.com>
 <20250408-st7571-v3-2-200693efec57@gmail.com>
 <87cydn9bkx.fsf@minerva.mail-host-address-is-not-set>
 <Z_Uin2dvmbantQU4@gmail.com>
 <87ecy1g8z8.fsf@minerva.mail-host-address-is-not-set>
 <Z_YWq4ry6Y-Jgvjq@gmail.com>
 <87bjt5fz51.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0+MSCrb+186FMFuN"
Content-Disposition: inline
In-Reply-To: <87bjt5fz51.fsf@minerva.mail-host-address-is-not-set>


--0+MSCrb+186FMFuN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Apr 09, 2025 at 11:43:54AM +0200, Javier Martinez Canillas wrote:
> Marcus Folkesson <marcus.folkesson@gmail.com> writes:
>=20
> Hello Marcus,
>=20
> [...]
>=20
> >>=20
> >> That's a god question, I don't really know...
> >>=20
> >> But fbdev does support XRGB8888, which may be another good reason to a=
dd
> >> it and make it the default format. Yes, it will cause an unnecessary p=
ixel
> >> format conversion but the I2C transport is so slow anyways that comput=
e is
> >> not the bottleneck when using these small displays.
> >
> > Hrm, I now realised that I have another issue.
> > Not all LCDs that will be attached to the ST7571 controller will be
> > grayscale.
> > The display I've attached to the ST7571 is a monochrome LCD for example.
> >
>=20
> Oh, that's very interesting. This means that vendors are using a more cap=
able IC
> (i.e: ST7571) for display controllers + LCD panels board designs, even wh=
ere they
> could had used a less capable one (i.e: ST7765). That is, using an IC tha=
t supports
> 2-bit grayscale when they could just used one that only supported monochr=
ome pixels.
>=20
> From a quick search, I found for example this one from SinoCrystal:
>=20
> https://displaysino.com/product_details/SC128128012-V01.html
>=20
> > Maybe the right way to do it is to only support XRGB8888 and specify=20
> > if the display is monochrome or grayscale in the device tree.
> >
> > Or do you have any good suggestions?
> >
>=20
> I don't know the proper way to handle this, but what I would do is to inc=
lude
> the actual boards as entries in the OF device ID table instead of just th=
e ICs.
>=20
> And then for each entry you can specify what formats are supported, e.g:
>=20
> static const uint32_t monochrome_formats[] =3D {
> 	DRM_FORMAT_XRGB8888,
>         DRM_FORMAT_R1
> };
>=20
> static const uint32_t grayscale_formats[] =3D {
> 	DRM_FORMAT_XRGB8888,
>         DRM_FORMAT_R1
>         DRM_FORMAT_R2
> };
>=20
> static const struct of_device_id st7571_of_match[] =3D {
> 	/* monochrome displays */
> 	{
> 		.compatible =3D "sinocrystal,sc128128012-v01",
> 		.data =3D monochrome_formats,
> 	},
> ...
>         /* grayscale displays */
> 	{
> 		.compatible =3D "foo,bar",
> 		.data =3D grayscale_formats,
> 	},
> };

A comment for v4:

I think I will go for a property in the device tree. I've implemented
board entries as above, but I'm not satisfied for two reasons:

1. All other properties like display size and resolution are already
   specified in the device tree. If I add entries for specific boards,
   these properties will be somehow redundant and not as generic.

2. I could not find a ST7571 with a grayscale display as a off-the-shelf
   product.
>=20
> --=20
> Best regards,
>=20
> Javier Martinez Canillas
> Core Platforms
> Red Hat

Best regards,
Marcus Folkesson

--0+MSCrb+186FMFuN
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmf4sK0ACgkQiIBOb1ld
UjLmqA/7BCl7lJDEoPPt2ZzQgG3ygaeetBdM4UsZDpleS6b7DyZuy84RJQrCFfZU
FNyRITissD9f11CEVEFcVu7RpwvckDXy5Wc0yJYBj7fLe6e/YCHHP4+9/5oMyqSj
S5ULhE+/Ai5mt10PMoJ2i8Ht9lO76i+Y+tjsa76fQ3if6hPuBCgR/MFPRv3iZZ2i
HsfPWeQpQ2ehV9Zip9zcSWGN1cKSFLqZrQvbmHXwNt4G2rkpENpGXFQO6GFm0BMT
dosgtS44DV6bmnWugz0Rkjvv5EGIX5ESN/HVlRWjWUTv3yyYWN0YXXxGZ/huqdwz
ly3k1LR/l5EZF0Be46kmHNURIez2AKYKDH86391ew77Q/06HqG0Unkm5vL37V/6Q
/e6OYLvM01TnYW7351Z7KhCi/9MlM4NXMrS9Q9meNI3rDWcaZ/Q9KXdVU10ugOcF
+XfwzYDilqU9KlZIfLoEylrt5Yspam/VYT6G4YfVQBREhF7SvFlhvvDaq6ptRvrm
5oI8a0g7SZPIyxIhwC3tDdJjo53HivUfnD91w6n5NBk0jbr5EnWoXcS+2E7rrvcM
dwwzjqHoFT075Z94v018+dW6mT412twlxz0gJ6Vuyrngul8s6UWMX3XYqEF4rZOa
hbUJKUG9XNybnsUSaqL9p/np+PFNZ+o/urAyky/ALRyIa+WeuGU=
=pS5B
-----END PGP SIGNATURE-----

--0+MSCrb+186FMFuN--
