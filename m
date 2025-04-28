Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BF91D63F5;
	Mon, 28 Apr 2025 07:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745824320; cv=none; b=o4dvz3Jm7rOkWcGR4pKAUMpSZtMRrLIwXjZZxDe/6WceUnegNeiLLbOZmB3cF6lllnrZh26n6q59f0p+EhS/F0S3yLCJlY27s/Qis71iru04R5VD8fshOxnccqyhVR9vJX/ZhoVLorkSRV6PNe7t9vAVvzD8JoBEH3/tq96Fmv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745824320; c=relaxed/simple;
	bh=5dt8wGhaDlr+K644AjMMhAIHC+T3XY8mXNt7h3Ls/kE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yj+J+BkdudzbaKw8fYVYXfXVBYYcGqaU3hQS5hoh5sW8/uRwDwtKWZ8lpeglSenWExewaubh1rU5SGX26QbvGX+ebbKpkt4z19QZVx5d1Ba04t182Wnu6HNjHNKP4Eibb+8kQ58Zk89+kjfktAj/esC9ZP7DP3mqsCig59MPrwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b4FrpRBV; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b4FrpRBV"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54d6f93316dso4930979e87.2;
        Mon, 28 Apr 2025 00:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745824317; x=1746429117; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nEGD1qOCOZE/6f17Jae6tXR6TvXp3ML70X8oQuCd5xk=;
        b=b4FrpRBVzjPWev6upWkpBzUXEWc9/cFBXOqIZ+QazRj6UOo/ba5aHOEP2l5MnkMpCZ
         Re0a10ZWfX0ghFrWFVwwEnzfF2/ni22emhbMtJrO6KIp0rPSQMbII8qADcNKrlGT2pJd
         HedXA9rr8KmwUu4U0Y6/cfZnP+2k2COb6Nxmc8QdMGNia8MrT0KCspgLzZXArBvuF1Vo
         VGkmvYb5OCKrBxz6uvgaVR2Jg36tq2SFkTxbqPgbc20m4nAtC7U2Po0yi7ZeHWim4yR/
         uA7OsiIOZjmX9P3abhH1st/lKL4pyYcu4Kau504Y+6cES+AAA8W4TbBkrzhZvuS/8gxR
         igSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745824317; x=1746429117;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nEGD1qOCOZE/6f17Jae6tXR6TvXp3ML70X8oQuCd5xk=;
        b=DutVGhAAdA53jiHil5gYPqCUGOZxVvrklRFSY/LjhGjxMxnG0JBXseBUfFBhWuBobq
         u+vazqIOhhrzGCBdcejW/4pDfOK01wMacCr68bDZ70Bzb0G5TZZZmsr9Yqcf4tdFUYR4
         XW5i11f0Z4/+FduB5Suk+nB9D3sq/QA+kdtmaFibgA544e+rX+JXR9Tnxa3F4t55hjSp
         E0f5uMtJyzqLksg5ySAenmou5sR9bhijAolzA7UEctRm4x2czvY6HlhQUr9IIqn8VZpR
         lPvYKK7ttJMZlw7nOU1BLKAH2uSm1sjgKftP94q4qOzyUJqsoGdn3UE23mf6hd3XmE7d
         fQpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpZMCBbwGZSCSksgEp0WBPiXDr9LdpVhCJsX7XE3U7Tsdp3hJe6u7Nes45y6ayBMyhC+T0x0DZ2A4N@vger.kernel.org, AJvYcCX9dnjh6G59ie3gTEIxbq7J8XjF6jowbfq9rKlUn8/EIxf7Og0xC6XdpH86SC3qwqrNAANH1HNIqv9jVthu@vger.kernel.org
X-Gm-Message-State: AOJu0YzVz4NtTmaxejN1RColWKdU9rmIIEGnOcpNQpJ0kv9to49FOdH/
	7ywujyZuLaZluv03GXWFXnAzd8QkC56wSHYJ1XGCRMJW076mRJPM
X-Gm-Gg: ASbGncvNwiX3M5tBv54aoVw+LfYA9OEa+l0Md8gD9FoaOnBo6bfbDydjl1p9HAPsCCY
	noDU+sZRNOtBxQ0Jc235+TGZ+LS2b2GMw2KqiwZZq2HYkZEMxg17wqXSLhiNjNxQeq0PxwDzHBJ
	wCvynPBblEK5BwaCV82guHUFUHD4HH3SAH2ooAW/CIUSqsWKA/gspUF7xrWeFalj+I0R2GzEXAN
	mnXkI5ery4An7XlZw4hI6tvjep2RlBSYbDRI9xZylrN89cDWY+hxjWW3f4IkukQl6TbD2FxSL9g
	U4k4e0+EN9pIMOd3jIRW/31QHKQNY65CGh+Yv+8mW42pkWos4Snkn1xv8LrjXsfqLMnOw4n6eHB
	8iA==
X-Google-Smtp-Source: AGHT+IH5tTNFxT41Ny4rWJ0MhJIPoRHDYLcTSnP3jJ76hpK3f/FRXGQ0PW/C8Wuf5I6K4WGDB4y/ug==
X-Received: by 2002:a05:6512:39d2:b0:549:54f7:e54 with SMTP id 2adb3069b0e04-54e8cc108a6mr3527956e87.50.1745824316466;
        Mon, 28 Apr 2025 00:11:56 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cc9e99asm1595558e87.134.2025.04.28.00.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 00:11:55 -0700 (PDT)
Date: Mon, 28 Apr 2025 09:11:53 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmrmann@suse.de>,
	Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v6 2/3] drm/st7571-i2c: add support for Sitronix ST7571
 LCD controller
Message-ID: <aA8qOSOsF1__yoiP@gmail.com>
References: <20250423-st7571-v6-0-e9519e3c4ec4@gmail.com>
 <20250423-st7571-v6-2-e9519e3c4ec4@gmail.com>
 <CAMuHMdUsP5gcTyvqJM4OUFL3VutzDrX-V23uYRfnfgzotD8+rg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cqMmL9NJFy0Qntm+"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUsP5gcTyvqJM4OUFL3VutzDrX-V23uYRfnfgzotD8+rg@mail.gmail.com>


--cqMmL9NJFy0Qntm+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Thu, Apr 24, 2025 at 10:38:33AM +0200, Geert Uytterhoeven wrote:
> Hi Marcus,
>=20

[...]
> > +                       /*
> > +                        * As the display supports grayscale, all pixel=
s must be written as two bits
> > +                        * even if the format is monochrome.
> > +                        *
> > +                        * The bit values maps to the following graysca=
le:
> > +                        * 0 0 =3D White
> > +                        * 0 1 =3D Light gray
> > +                        * 1 0 =3D Dark gray
> > +                        * 1 1 =3D Black
>=20
> That is not R2, but D2?
> include/uapi/drm/drm_fourcc.h:
>=20
>     /* 2 bpp Red (direct relationship between channel value and brightnes=
s) */
>     #define DRM_FORMAT_R2             fourcc_code('R', '2', ' ', ' ')
> /* [7:0] R0:R1:R2:R3 2:2:2:2 four pixels/byte */
>=20
>     /* 2 bpp Darkness (inverse relationship between channel value and
> brightness) */
>     #define DRM_FORMAT_D2             fourcc_code('D', '2', ' ', ' ')
> /* [7:0] D0:D1:D2:D3 2:2:2:2 four pixels/byte */
>=20
> So the driver actually supports D1 and D2, and XRGB8888 should be
> inverted while converting to monochrome (and grayscale, which is not
> yet implemented).

Hrm, that seems right.
I'm up to some rework of the driver, so I will put it into my pipeline.

Thank you for noticing this!

Best regards,
Marcus Folkesson

--cqMmL9NJFy0Qntm+
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmgPKjQACgkQiIBOb1ld
UjJ0dxAAqBB1YfWqzi73/WA9wkKlpSVtUbIqm7o4VJkkJ8SqqIKMmr4xK0IerfN6
265Q+rIbWhCMsoV4gwbclRXth2tq5+CQ7LZQk7+pPzv/YquzhmyR7pN6pvW8zAIC
esbTKzJgk9ozFR1y/UOwdMjojszGQKlEBFfyiqKr5j+HROq1YlCkqFl4lgmflaPc
eH+c87IX5kKKi1c8gl800eGXeL36Lc2rY5eb+7Q//XYaILi4PioxMwxiWUhDiV5h
UJ5To8k44QFyuUnhXluHBQfVr8TTF0wF7pDx3ScIrL7jPEUjQw0Jb14ej2ZFtXPz
P/qXwU/jyZHLVP8El/aaTl/VHiZZuAlFUIMEG6Vsjn+wTKB45+04J5A48j6Sjl0x
V+B0IQADpGbhw7AXKOh1WPymnjfGhgD06GRhnQnOFMPVM7jl89wfUN+eAFHWF9IF
ANPgSBKwcyoa/dPqOYJZYhc9uSUEcFoSYrnOCW1t6es6bUPcklTG2aCG3T/4Gr4v
XZFv7x4EA1lbwt3n3TfneLqNHizpkxf4eN1WDCH71s34JzQcXlZxD1iKliM1TAlP
qCHHhBtWzXp2CLBtmKALQOmNf2HBXXxaPs6gYFQqk1CGQmySNachMzMAWAS2UOWG
UffAfo6wKdZyQh5KrCvTXkgD+Zg4r/u2THyB1RFcWEuHwDIa+Cc=
=22h2
-----END PGP SIGNATURE-----

--cqMmL9NJFy0Qntm+--
