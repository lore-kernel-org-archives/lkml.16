Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1F021ADC6;
	Fri, 16 May 2025 07:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747382375; cv=none; b=tbaMxoZM/y+W/m8piU7/Q2mpE8HKJc8Wkbn1FzmAIVn9DuQWLsphKO+X1NZ5xt8vD7woAp6lE8n2o2Wp8y0gEDHt4ojRKy8zIPHdk5YocXNzABkk2ZkjTD9ls+bBMKKlc7PYSuTylmzaW7OuEMsMeJPiY8NcMdoAh9yyfOTkhDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747382375; c=relaxed/simple;
	bh=51UiwAtTBw1xtOTx6e1Pp64GJoZ4L5WSxUxJDmEN9Kg=;
	h=Content-Type:Date:Message-Id:Cc:From:To:Subject:References:
	 In-Reply-To; b=djQSGw9JHskFnwiurmcLP/EFaoV2zcexlVTcZS61Fea+YxUn03VtKSj6eHJ/vecFgfmkGYJLXvPSG+4ALZt/BIrUnZQt+dVny4fnTfdRvdscPr21chPOKtilR4vrsUvvnigIrVJVlyddwj+hRh6I/Ms7K117jlacPXEt49o99XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U3xEd25L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U3xEd25L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50609C4CEE4;
	Fri, 16 May 2025 07:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747382374;
	bh=51UiwAtTBw1xtOTx6e1Pp64GJoZ4L5WSxUxJDmEN9Kg=;
	h=Date:Cc:From:To:Subject:References:In-Reply-To:From;
	b=U3xEd25LCeI5ukSRK+khUpX/7FrIdv7pmsPIoVDcXd977W94/6EfEvi7labDdNvg7
	 89SxW/GpepKxBL5ot2BIQ51iRgEMwULni7ZiUz3AFh3MVjC7zEUbWXuJzzjUVvxoIK
	 CfsX2IzFCTgcmg74kg8SnZ64ckcp9pFGw6cKBf4SczEUSqn/Y1khXtZ2mOe1LDiXhE
	 blgmYVgSOJehRAknA1OoYmdfQGvU4whBtwlBWF3TsUN8wumFBZkCt7f6AsDwatq/CY
	 Fde1crnHIujZ1oW/M9gwSEx3LwfmIiqHQwp1XNkS5zgLUM//OSXAghtYvJbbeopjRV
	 cniiO3aZVFuLg==
Content-Type: multipart/signed;
 boundary=d7312f90523e3e5483928f25794944ee2c9f0b4081e939bb716620953902;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 16 May 2025 09:59:30 +0200
Message-Id: <D9XFCQYPTRMX.3AKZYI2Z5SV2Y@kernel.org>
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
To: "Aradhya Bhatia" <aradhya.bhatia@linux.dev>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>, "Jyri Sarha" <jyri.sarha@iki.fi>
Subject: Re: [PATCH v7 4/4] drm/tidss: Add OLDI bridge support
X-Mailer: aerc 0.16.0
References: <20250329133943.110698-1-aradhya.bhatia@linux.dev>
 <20250329133943.110698-5-aradhya.bhatia@linux.dev>
In-Reply-To: <20250329133943.110698-5-aradhya.bhatia@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

--d7312f90523e3e5483928f25794944ee2c9f0b4081e939bb716620953902
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Sat Mar 29, 2025 at 2:39 PM CET, Aradhya Bhatia wrote:
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
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Tested-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>

Tested-by: Michael Walle <mwalle@kernel.org> # on a j722s/am67a

FWIW, I have a few downstream patches to get the DSS on j722s
running.

-michael

--d7312f90523e3e5483928f25794944ee2c9f0b4081e939bb716620953902
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaCbwYhIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hj6gF/Wusj103bkQJ0s/qoyxRDcMUItzGDi4DS
o3U2g+BCnLNbwlPXUphnJlSKimOAS8ynAX9WTLPfNmCmAVDU8f08fakCPkJUot0x
tdNCXLNt5WYI5Hj5jUV6ysIYmadhcu0rjv8=
=GNXG
-----END PGP SIGNATURE-----

--d7312f90523e3e5483928f25794944ee2c9f0b4081e939bb716620953902--
