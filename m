Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4134A33987
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 02:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738289917; cv=none; b=aBIRtHfExYftuFG6krtACU91MaBQVhrgBp/oVB1yksqw3sxbtXTj9t5uyEr22qlTe0FiWnF5JECFXcH3VekYmuYTfgntpwhw5pCZSAjpyGJQVBr0dOzUxeLS9OhSRxwt5VMT1iod3W/DsXFDZxP1MmjL5MMs6KKKzBulld/YNec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738289917; c=relaxed/simple;
	bh=XnOLiOAPqFuyycqvz0k4TD5hyRbsM2c7tVD098a3M10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=szf4MKup7cu1mrZjCfmzPPQ+KXOrNXJoyqOALAUnoe0CKcWK/vZZGOIt2O+wfy6OXNvtX2zr1rpC+xI1wJ/LwqKKB+KE57mvATpigg+0y5cv5gWKYxfiLyYetHEWxXvzkTHQs+E1KYmYtqcRBi6KWBaHRFmpfXmiH1rNOKsGR/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com; spf=none smtp.mailfrom=pdp7.com; dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b=aoxgFPAp; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pdp7.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="aoxgFPAp"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2166360285dso25013115ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 18:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1738289915; x=1738894715; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AeapXKg7pGSTYAjdi+WZBYgB1YuW7HbwD8RdeOPOKSo=;
        b=aoxgFPApjIUkJDVGJmWi9D2//YdUzhSDvo5Q472ddXC0hTboY8fQmgZGlPZ3gwJFS2
         yrDH25ZEdG7z+iUZiHKmiMosEvhzpGvlfoHrv2s+Jbdu+rCxszhOm7XK0QkZ0nMeCT8h
         HGS7jjrW6hnEf++/vgBXExl8X1P+pdyd6IKVlQxQy5A1s3CewmhC9Bk6mMhcFIUwuxQW
         PaWPgxY+2TF0TuHGa9Rf9GfcFmH5iUj7+hPIWXpNCVAOSCHUIGgd1DIPpPZvlbw4y+/U
         JVIzWE1c+SQDS6INbrKRyGfQEiQ2atL6ubxByHnwsX83B5x0vAYkIRRnwJKc1PckX2Ln
         wFYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738289915; x=1738894715;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AeapXKg7pGSTYAjdi+WZBYgB1YuW7HbwD8RdeOPOKSo=;
        b=AtmlJsqx6s8HSJ099HsZCXu2eOJcpm7SC+AQMlM23q9sqWDYyyDg+EKSIC7vu+5gfU
         Ow6vRVwWRi5yjZhHRH6rgIWTnr3IJtsOsCLuxQba6qvdhsKgsRSWdMKzpyBbuFPI8THj
         1z9e91NnNm2Frz6pmG4Tri1YVsOJu6I/po4Ifu/na4HYcEsh+VL4lWqN0tv1OtJXEgP+
         rBLvxr4M58VMj18CViNdrzCuizMln+6POQu0xvlFE9bWvaCUG2iY4vzgL608yiyycybu
         eQdE+3ydDT8eEmr1au9O6PHnagyuciRfSwlNbyb9lmEyEovWM6FrqBiR5pKFJA2/DrDg
         BWIg==
X-Forwarded-Encrypted: i=1; AJvYcCXWwQ4P+RtfPfOwSQa7/7NQNcxcFLX3PQ2e+qpPL+PFH3p5yomBe8U92jwo6NfaYYsvAx583q6b01hVY9s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy10XTNEUZNTuxE4rzCHiAw4jcfB8XKqDH68ONMsgo1gPKVxdHK
	pe0whYtHKA1d7HGo8NKk3PeYb2hQ3yT2No4J0l2chdbiQde18herWWT83uetGEQ=
X-Gm-Gg: ASbGncsXMDqGRy7sf3HjY0xEk/DlU7iJxzwpzrMxcWNTjlI8ZdHS1w2X3Y42m5TQNZy
	ZkTnZ/PhNffdLsVLcVO7VKstr0wuJqrNFDCvy0237SpTaK7xAme9oV709CgQy5FivcNRaL0o6FS
	Y6mz+13S9lON9VlIIN4j8ghAaysn7i3Ndsq7JHsf18q+P0Ni5sNzby6jiVjJUE5BUYME4yYfqQn
	3QedrUoFl/Zsu1DifYDfNJBBWG/e0ChbJ3t3nSejICC720cANws0++js2Ir762ZZ7w/nR1Fd/w5
	h1SbDtwsBh5HVUBVa8iDyQ==
X-Google-Smtp-Source: AGHT+IFiw3qM2OLJAOzrht8znQypwnZ0VIBRkG/SQsfw+mpAfFJbX2GlbCZASwokcRTIuNT3Enb+JA==
X-Received: by 2002:a17:902:d584:b0:216:2a36:5b2a with SMTP id d9443c01a7336-21dd7df1bfcmr114645165ad.47.1738289915459;
        Thu, 30 Jan 2025 18:18:35 -0800 (PST)
Received: from x1 (71-34-94-122.ptld.qwest.net. [71.34.94.122])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de331f2dcsm20448295ad.226.2025.01.30.18.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 18:18:34 -0800 (PST)
Date: Thu, 30 Jan 2025 18:18:32 -0800
From: Drew Fustini <drew@pdp7.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the risc-v tree
Message-ID: <Z5wy+NosgbxYk3fN@x1>
References: <20250131075413.6fc6c272@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Cjn7TpeWn0+zx8Ni"
Content-Disposition: inline
In-Reply-To: <20250131075413.6fc6c272@canb.auug.org.au>


--Cjn7TpeWn0+zx8Ni
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 31, 2025 at 07:54:13AM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> The following commit is also in Linus Torvalds' tree as a different commit
> (but the same patch):
>=20
>   0207244ea0e7 ("riscv: defconfig: enable pinctrl and dwmac support for T=
H1520")
>=20
> --=20
> Cheers,
> Stephen Rothwell

Sorry about that. I did a RESEND on December 15th [1] which Conor took
on December 16th [2]. I did not realize when I resent it that Palmer
had already commited it on December 11th [3].

I'm not sure what the correct resolution is. Drop 0207244ea0e7 from
riscv/for-next?

Thanks,
Drew

[1] https://lore.kernel.org/all/20241216003114.326129-1-drew@pdp7.com
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/arch/riscv/configs?id=3De7177ecdd2b73de4e19a02794d29e6c5f06728ab
[3] https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git/commit/=
arch/riscv/configs?h=3Dfor-next&id=3D0207244ea0e7fcf45e68e24b0fffe964624a22=
ef

--Cjn7TpeWn0+zx8Ni
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSy8G7QpEpV9aCf6Lbb7CzD2SixDAUCZ5wy6AAKCRDb7CzD2Six
DD9IAQDhe6p9qTHCwVhHI8GCN4qh/vxHiSft1a1gTw+CseeTzwEAzD6wWiwU5gcV
LfLVm/SNbJIrXwD18NuzOpZ5Za0IKAA=
=DGyT
-----END PGP SIGNATURE-----

--Cjn7TpeWn0+zx8Ni--
