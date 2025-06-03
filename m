Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0087B173
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 05:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748929972; cv=none; b=iMjWGFiLzlOXfs+QoXnGikf7xntVuF9X0hPKUjJ3sL91eYpOJW6b2biM2yElv/FdyoJfTNbFQgCGy/xsMCmBS1Um4M1p5vNmDTW/nqXYyqdBgxnNgiyFOwNOIKsnFdAj6gCN135AILF5hF74v7kLekqvJi1OdxWVr8UtZWFfogo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748929972; c=relaxed/simple;
	bh=L+ELz69jUFptNnqIky4yrspsl0rBiFTFr5FiTSmQAqQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=t1LaUFS0/YEr1Xjnfo1lkPFr6EbK7L5M66/7c8n8u3R3LVxTuiOwjkqgxn0qcViZxqujvjP5YD4jSmQl8vjBBcn0LL6mB71mkhCgbY1H7HArNm2S+OtOgCHYdmCIf52+aZzfHXhTGtkT6v8a6isX8fF6UjgRRGk2e97/o6f16Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=hmIvBDy/; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="hmIvBDy/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1748929962;
	bh=L+ELz69jUFptNnqIky4yrspsl0rBiFTFr5FiTSmQAqQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=hmIvBDy/fhmokIfbZgUwFM/S/DySSWlNBFsLMvctKkqsuqgfbAh3lW+sTbBIUvf1N
	 pyi8LkMtCeeq0EU8OMmgbYviozIGhMw8Xgacm2ioc7nhpGmOEzH2SeEb+rLiHznPeO
	 s4K461QL8NuOSkMaiv5JNdh6hWzFJZYqRfZmgLYY=
Received: from [127.0.0.1] (unknown [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 63FB565F62;
	Tue,  3 Jun 2025 01:52:41 -0400 (EDT)
Message-ID: <e41eaaee52b57f279a47f68745bc79c6178daac9.camel@xry111.site>
Subject: Re: [PATCH 2/2] platform/loongarch: laptop: Support backlight power
 control
From: Xi Ruoyao <xry111@xry111.site>
To: WANG Xuerui <kernel@xen0n.name>, Huacai Chen <chenhuacai@kernel.org>, 
 Yao Zi <ziyao@disroot.org>
Cc: Jianmin Lv <lvjianmin@loongson.cn>, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, Mingcong Bai <jeffbai@aosc.io>, Kexy Biscuit
	 <kexybiscuit@aosc.io>
Date: Tue, 03 Jun 2025 13:52:39 +0800
In-Reply-To: <77dc0324-ce8d-4af4-9aaf-815bb9a1bd82@xen0n.name>
References: <20250531113851.21426-1-ziyao@disroot.org>
	 <20250531113851.21426-3-ziyao@disroot.org>
	 <CAAhV-H7RBcaAP8WjjrX20cvuMixarqyeTLoMPdb8QMztz_648g@mail.gmail.com>
	 <77dc0324-ce8d-4af4-9aaf-815bb9a1bd82@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2025-06-03 at 13:44 +0800, WANG Xuerui wrote:
> On 6/3/25 12:16, Huacai Chen wrote:
> > On Sat, May 31, 2025 at 7:39=E2=80=AFPM Yao Zi <ziyao@disroot.org> wrot=
e:
> > >=20
> > > loongson_laptop_turn_{on,off}_backlight() are designed for controllin=
g
> > > power of the backlight, but they aren't really used in the driver
> > > previously.
> > >=20
> > > Unify these two functions since they only differ in arguments passed =
to
> > > ACPI method, and wire up loongson_laptop_backlight_update() to update
> > > power state of the backlight as well. Tested on TongFang L860-T2 3A50=
00
> > > laptop.
> > >=20
> > > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > > ---
> > > =C2=A0 drivers/platform/loongarch/loongson-laptop.c | 53 +++++++-----=
--------
> > > =C2=A0 1 file changed, 19 insertions(+), 34 deletions(-)
> > >=20
> > > [snip]
> > >=20
> > > -int loongson_laptop_turn_on_backlight(void)
> > > -{
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int status;
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 union acpi_object arg0 =3D { AC=
PI_TYPE_INTEGER };
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct acpi_object_list args =
=3D { 1, &arg0 };
> > > -
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arg0.integer.value =3D 1;
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D acpi_evaluate_object=
(NULL, "\\BLSW", &args, NULL);
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ACPI_FAILURE(status)) {
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 pr_info("Loongson lvds error: 0x%x\n", status);
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 return -ENODEV;
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > -
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
> > > -}
> > > -
> > > -int loongson_laptop_turn_off_backlight(void)
> > > -{
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int status;
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 union acpi_object arg0 =3D { AC=
PI_TYPE_INTEGER };
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct acpi_object_list args =
=3D { 1, &arg0 };
> > > -
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arg0.integer.value =3D 0;
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D acpi_evaluate_object=
(NULL, "\\BLSW", &args, NULL);
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ACPI_FAILURE(status)) {
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 pr_info("Loongson lvds error: 0x%x\n", status);
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 return -ENODEV;
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > -
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
> > > -}
> > I prefer to keep them, in downstream kernels there are users of them,
> > I don't want to add them back if one day those users are upstream.
>=20
> Then these symbols should be properly EXPORT_SYMBOL_GPL marked?

I guess those downstream works are kernel forks, not separated modules,
thus an export is not needed.

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
