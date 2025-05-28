Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61732246789;
	Wed, 28 May 2025 13:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748439351; cv=none; b=cfDmJ+HA9aTGSXFEFfdwPNm0288G/3+4PBSMrnPYFSCu7S10weSfrdzqmd7m8XctZ8f6atRdB7J73EGKFQkR6ScQSQTPUnZrsnmnbgZn/ZaNfr2GBoZeFzzLKxYxrKjfoLQMqcsGf+sm/9jp/eIc54//6CqJBuej4+PaTjIFFXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748439351; c=relaxed/simple;
	bh=knk8q/FALEdjxGDuprxqQZMXz1KpNrrRmanSda0rE9Y=;
	h=Content-Type:Date:Message-Id:To:Subject:Cc:From:References:
	 In-Reply-To; b=ZXQ6xZlAJ7oucAsdZnG1LA+zXg7gFZ0j5VDq+sPJW8a84hp3Zqr0JDISovYhojvZrKmDNdnRMyy1mbqU5HimmCOnQ7P9emUJcgfHlvsP+iwMeE1NziJ5nmKWv+Rc+U9QRiUJ4HfDxwouwHSrnE250x/ACknGicKoUgfZwNT7cRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r89pZ3Wd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r89pZ3Wd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F396C4CEE7;
	Wed, 28 May 2025 13:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748439350;
	bh=knk8q/FALEdjxGDuprxqQZMXz1KpNrrRmanSda0rE9Y=;
	h=Date:To:Subject:Cc:From:References:In-Reply-To:From;
	b=r89pZ3Wdo58sTUeYve6Z5etikGXEkbsTZZLsstU3BSl7yQb2w3O0x086ke1cXkE11
	 Wk6bi1CWkXiEui30ORYSiE3pjAuIZmjnvpGuN+se+sB32KLPiuBYQ3rywb33VoJ3Qa
	 okX8PIH7HjV4K51cDIXqVaEUGP4c1oSyRJK5+5OxcO6FJYkKBm5uU3zLXZq8Ri+tVp
	 rTN45IXVzpegS73DEUgEbJxytYo9dYz78bqBQrsqVSNoE4sia5dJiW7y+YLS+bAZ/n
	 FtSHe5t9O2FUfa41JRb5NJa2OoEBmU5v9pOKh817aSxskdjU1QeD3ljZEqf9XMqsLo
	 kc4dtZVrRQI/Q==
Content-Type: multipart/signed;
 boundary=a01ec67d579d790ebeab352c5a5d5a4c98173c681872122f1d16c4e94ddd;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Wed, 28 May 2025 15:35:46 +0200
Message-Id: <DA7U0RDHCIDK.2KTS6YW127P4Z@kernel.org>
To: "Aradhya Bhatia" <aradhya.bhatia@linux.dev>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>, "Jyri Sarha" <jyri.sarha@iki.fi>
Subject: Re: [PATCH v9 4/4] drm/tidss: Add OLDI bridge support
Cc: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, "Maxime Ripard" <mripard@kernel.org>,
 "David Airlie" <airlied@gmail.com>, "Laurent Pinchart"
 <laurent.pinchart@ideasonboard.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Nishanth Menon" <nm@ti.com>, "Vignesh Raghavendra" <vigneshr@ti.com>,
 "Devarsh Thakkar" <devarsht@ti.com>, "Praneeth Bajjuri" <praneeth@ti.com>,
 "Udit Kumar" <u-kumar1@ti.com>, "Jayesh Choudhary" <j-choudhary@ti.com>,
 "Francesco Dolcini" <francesco@dolcini.it>, "Alexander Sverdlin"
 <alexander.sverdlin@siemens.com>, "DRI Development List"
 <dri-devel@lists.freedesktop.org>, "Devicetree List"
 <devicetree@vger.kernel.org>, "Linux Kernel List"
 <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.16.0
References: <20250528122544.817829-1-aradhya.bhatia@linux.dev>
 <20250528122544.817829-5-aradhya.bhatia@linux.dev>
In-Reply-To: <20250528122544.817829-5-aradhya.bhatia@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

--a01ec67d579d790ebeab352c5a5d5a4c98173c681872122f1d16c4e94ddd
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed May 28, 2025 at 2:25 PM CEST, Aradhya Bhatia wrote:
> From: Aradhya Bhatia <a-bhatia1@ti.com>
>
> The AM62x and AM62Px SoCs feature 2 OLDI TXes each, which makes it
> possible to connect them in dual-link or cloned single-link OLDI display
> modes. The current OLDI support in tidss_dispc.c can only support for
> a single OLDI TX, connected to a VP and doesn't really support
> configuration of OLDIs in the other modes. The current OLDI support in
> tidss_dispc.c also works on the principle that the OLDI output can only
> be served by one, and only one, DSS video-port. This isn't the case in
> the AM62Px SoC, where there are 2 DSS controllers present that share the
> OLDI TXes.
>
> Having their own devicetree and their own bridge entity will help
> support the various display modes and sharing possiblilities of the OLDI
> hardware.
>
> For all these reasons, add support for the OLDI TXes as DRM bridges.
>
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>

Tested-by: Michael Walle <mwalle@kernel.org> # on am67a

(with local patches from downstream for DSS support)

Thanks,
-michael

--a01ec67d579d790ebeab352c5a5d5a4c98173c681872122f1d16c4e94ddd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaDcRMxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/j14QGAhZrSdUr0WUS2+40Cu+09ap7KmA0xJXOl
kBaZaFsgOAQPknZDiT5jW3JdM/NC+9a2AYCjb3vFpm/xWsU0e7rREQ/lVfuS+lze
HVJTtpGmGdwseReGa8Xo16GwG2hExmjdjpU=
=hq/P
-----END PGP SIGNATURE-----

--a01ec67d579d790ebeab352c5a5d5a4c98173c681872122f1d16c4e94ddd--
