Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2AA1B87EB
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 07:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745653529; cv=none; b=rqifojZyckyc3Y3ZGBrtw6KuD3hpF4dFLtSpvyOrRq3LuLSN3mwt48ZfnbVH26lj95JbEWTWZOApVuD8M/gtpSLTm5oysRNkFPK4aCZTNrtMdFbfFCj4WHPyGkBcuFfzzb0Y6+YQMueeb45Pjw2W/ftHjn58y/9spaLKgj0y/IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745653529; c=relaxed/simple;
	bh=w8RacVv7kD3lnn+AVvnyUBxmiCMUu8RBJaFo4l2EVyM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W3Sm0+bxyqrkQy8EBut0oScDSA0MwC0iWiWbnhzsHMGA/PiL/Du443btWanJvp1cdZPmBEkqdWcWjwmxJCcB14fNd4Ek6iuLRpRbnopd3W9PBAZ1zGasgTvW0AjKMON4k2feH3DGVTplu+ElbtQMPbOFGdo6P7gnFXsgNi7kb+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=luyXVycX; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="luyXVycX"
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 4DC503FE55
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 07:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1745653523;
	bh=xQG8aR91QUiXJqe0zGBSMh1PwbLabEkgq2LJTt+r2Gg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=luyXVycXjIa2SO5y5jEa/CR1zX3NptRZrTjaACkyul+CJYlD0A9+6wjec1ZkUZ0Jp
	 iq0K6St3V54oJC5SdAVMO3oF7P2vZFOb9M2rC6SkNclDUK3TKkFEZ8gkozOQKcKzwH
	 V5V4JicU2ccRdYp0mgwgfau4hlm8OAkGcZJxBW6+BaRxBT3bdDjHAslcwKmOPiKu5g
	 3hsIfy329X2euI1nAllquTfUOS9ODt030zwBNLapZmSD8GIJebiXA7tfEGAkBHk62o
	 atMC+kOw1TLhEDErQEPTK8uF/h5DSFYCjsmUn/BFVC5EggmiGpZqveVgUXTvdco++N
	 QCzRUQ2cgo2Jw==
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ac28a2c7c48so240714666b.3
        for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 00:45:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745653522; x=1746258322;
        h=mime-version:organization:references:in-reply-to:message-id:subject
         :cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xQG8aR91QUiXJqe0zGBSMh1PwbLabEkgq2LJTt+r2Gg=;
        b=pw+k7zveuWlcrpSb7OMYLptWNfqe1cSAT6IcGYTQwq8FHxsH1Sm0NFc5/oD393TZYb
         e7Y4BlFnh2JXyy1LN0frzMMGrwAWiwSLGqEEobDOpS9IyE8KopNzK/k0tRR+yAahkCd+
         zA0V9uM4UY+KJcxL66cnxz6J2Oy5xq9lZKy8OnjYC3iNe6YjaJ2uxngTUn4xioIrUIGg
         4IyahJwpILdkMBQMG27zZxIlxoq2+H6EUpyMUiFA1CREHYStgKE4rA7qEDrzZd0kREHx
         zxr6Wbu3ShZbGHgDRwpnLRfAQpcmE1cAqixvMbePeIq7hf6crgnccjB1B4RGvGzUieKk
         6frQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUW6YcK90+6Gx7XdTuW2Sa7qwXg3YeOXWkto3KR1PGemVMn7nILExmBUpGe11Y1fkz4jk8EZpa35+QbcQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDFs1O84eZAe7ulE13C6+YHQjwjkzQarUL0y9s9A7Ug535VxDX
	P/CUVK3MSf2lF8C3R3Ye2Tx2xanirF1qG4nwcI3U7frbm6Q3A3QW7C1l2oJ9YJGc+Lx76w+5uAp
	UJtPLN0DOS3AhAwDEGmXaYB0xtsY/wH7d9QjKEVVvXsKXSf0yfEG8WC2903TsyNdKEm/a7Ra+GF
	XHvg==
X-Gm-Gg: ASbGncsEmIyE0twJUMWi18Ty2V0SfA18OEwU1mAshMERzcOfigcpXrkW4yhIoKON8Ra
	+EuTE9b/U3WXnCrK0Q/Xu5EwClxHqVptS/6iUXg+UaqhLM+TDzZ+A8vr7RGkhmKJ4zSa2xd7iaw
	RxTEt1O8SiFa+CQqGYCm4O0TasXUzxFHy84TZzL72tevUOKvJ9jirhR7nfYu3sIuyX7JddMk1tq
	PUdedTXOcE5OEDTm5PKs8mWNdchIt8e8QNOWNUDUNvSGy/ES3gW8CE2g4Q7ouUdss1mlrxgoy+N
	UbKAd/hdtLdpJVTXVNGnG7tQoEvfeU4iLneMLXvMiLXcbn0lMP4T+A==
X-Received: by 2002:a17:907:7f92:b0:ac7:4f1:65c5 with SMTP id a640c23a62f3a-ace84b4c6f6mr175863066b.54.1745653522574;
        Sat, 26 Apr 2025 00:45:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFac88syXkSEHa373nY7+k8VjAiVo/ZD5gaPuEp01MgkPmzBDXRMO1qk5C5k/b8KxWKQSeAw==
X-Received: by 2002:a17:907:7f92:b0:ac7:4f1:65c5 with SMTP id a640c23a62f3a-ace84b4c6f6mr175860966b.54.1745653522112;
        Sat, 26 Apr 2025 00:45:22 -0700 (PDT)
Received: from smeagol (151-243-191-194.pool.dsl-net.ch. [194.191.243.151])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6edb1a48sm256429866b.179.2025.04.26.00.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 00:45:21 -0700 (PDT)
Date: Sat, 26 Apr 2025 09:45:15 +0200
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 konradybcio@kernel.org, krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v3 1/3] arm64: dts: qcom: x1e80100-hp-omnibook-x14: add
 sound label and pull out the model
Message-ID: <20250426094515.193e5f59@smeagol>
In-Reply-To: <mit327e4qp3hch4xy6qmqmks35tq5w35rw4ybvs5s3q7osxbkv@bzvon2u3jsmn>
References: <20250408145252.581060-1-juerg.haefliger@canonical.com>
	<20250416094236.312079-1-juerg.haefliger@canonical.com>
	<20250416094236.312079-2-juerg.haefliger@canonical.com>
	<mit327e4qp3hch4xy6qmqmks35tq5w35rw4ybvs5s3q7osxbkv@bzvon2u3jsmn>
Organization: Canonical Ltd
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bs8.Q+hsXAsnuniQCI/K9Ru";
 protocol="application/pgp-signature"; micalg=pgp-sha512

--Sig_/bs8.Q+hsXAsnuniQCI/K9Ru
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 25 Apr 2025 22:44:42 +0300
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:

> On Wed, Apr 16, 2025 at 11:42:34AM +0200, Juerg Haefliger wrote:
> > Add a label to the sound node and pull out the model name to make it
> > explicit and easier to override it from other nodes.
> >=20
> > Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
> > ---
> >  arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts b/ar=
ch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
> > index cd860a246c45..9595ced8b2cc 100644
> > --- a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
> > +++ b/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
> > @@ -174,9 +174,8 @@ linux,cma {
> >  		};
> >  	};
> > =20
> > -	sound {
> > +	sound: sound {
> >  		compatible =3D "qcom,x1e80100-sndcard";
> > -		model =3D "X1E80100-HP-OMNIBOOK-X14";
> >  		audio-routing =3D "SpkrLeft IN", "WSA WSA_SPK1 OUT",
> >  				"SpkrRight IN", "WSA WSA_SPK2 OUT",
> >  				"IN1_HPHL", "HPHL_OUT",
> > @@ -1691,3 +1690,7 @@ &usb_mp_qmpphy0 {
> > =20
> >  	status =3D "okay";
> >  };
> > +
> > +&sound {
> > +	model =3D "X1E80100-HP-OMNIBOOK-X14";
> > +}; =20
>=20
> Usually the DT don't use this idea. Could you please bring the model
> back to the node? The label is fine.

Hm. Maybe I misunderstood but isn't that what Krzysztof requested here?
https://lore.kernel.org/linux-arm-msm/bb95af7c-5e88-4c6a-87db-2ddd1fe211a5@=
kernel.org/

...Juerg


>=20
> > --=20
> > 2.43.0
> >  =20
>=20


--Sig_/bs8.Q+hsXAsnuniQCI/K9Ru
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIyBAEBCgAdFiEEhZfU96IuprviLdeLD9OLCQumQrcFAmgMjwsACgkQD9OLCQum
Qrd7LQ/4+q4xmthISwE892TSn8RgxS/c7Ti1v75eDFMPcuMXBPnbzt7ZLrRKksFf
jILKVaqj/wxNrGx9xcZPy4KLMY3IQL2mSdgsEYtEKE5F0HxasMpFCo3caHZHR4+Z
q5zuBLw0nOpOrDKSatHjlLefxWQdYOWhZlkzullTZrouh2IJ8jrIAVRGk/EJDyym
6dSXwczKPhX3VLyuEdTNnwSpkSS68avDHHxhwc9Hm/ORbY6N91BR+OABZsJ9mGKR
m7jDQUQkWeiqzNJWpyvE/0LmRUBOvHXA9xSEPX1NP5lyieCP6zjLmEfLYp7/wNN7
4JAye09lIYZPKxf+ZiFPIQkzH00+eFC7k+1Gg80PXMJShHU+JzMXbfMp15e3VSVy
hWhso40J6qAaLAuaMwEMR7Gs7Ozxgjzph2E0/oKyft78Sbx5eyHIRDlPoEkCyPP6
8D5dOBXQprpB1YViCsjBekcfye0PqKRqZnZu1d/dQSDbOYk7Uevw2EmGfzSWZ1cc
alfzejgVtLrnzAinWdr0A2YzzV5gqt2l0D/WZ4Ac2zaQC82oXeCCS0Ia8W9nTpIY
WdmwZkJMyf+Pg1aCy9YZ307vltIPDkKitY2NPyoHlS/184AEQuMp9P7dYcUi1Wdw
eKv4spD6t6WZtwJKU0b7xu8bQznbVXt8wXxjP3SFuZtR0GOLvw==
=nqY8
-----END PGP SIGNATURE-----

--Sig_/bs8.Q+hsXAsnuniQCI/K9Ru--
