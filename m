Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E25194A67;
	Thu,  6 Feb 2025 18:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738865632; cv=none; b=RKUQN+xaU/bpSRVI8uDkxQnFLIVhJeFhwsOOkpvaYi6vRyLwoaY+92JpPmF+/diLyEKe4kU9Vn5ORIzuqrSpWrVW/+oXJ1zwuSw3GKI7HIouvyLu9a3ZAb3sPJEgjngCbjA4foiHX6Ik4zoP5AgtQYFeeniUznUs8P8nAQTCRsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738865632; c=relaxed/simple;
	bh=qpRlHeJcZ8Rg6GiEylH3nJ6t0qFUQU58DAXj2IT1v4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G/fup2cl6LSQC55H2Lg/dAAsxEGe8+HxelwJuqioLZ45Yp/BnC+eoOWG4kMyAdzBcq+T/zgOtou4GZOmBkLBwCB64HBy5Bk9zfrwMnPkJD/lagxseR9dwXYtJ/UrEI02ICS3jW/UqaTTcWJtXnAaD4UmOb64r9R0dzghiT0/kts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZuAfXx4Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZuAfXx4Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A66FC4CEDD;
	Thu,  6 Feb 2025 18:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738865632;
	bh=qpRlHeJcZ8Rg6GiEylH3nJ6t0qFUQU58DAXj2IT1v4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZuAfXx4ZNiYZ3TZP7ZCllR1EQpRwKvsaMCxW7EeC61cyMdVUePlhC8egRPP7pOOjT
	 ybgmbOEqGeixDpRnUWEnwAgC/sjzJ57umRUGkIhKpHHZGKhyuRYjS+uTsar8qHREMP
	 XCyXzAQNqTISYzEaeJeRc6SqI9YAoExu6ZkjGraoFR7Z02QKUxbckRMAJ6829veUxI
	 i9irRJ3mbxm3gs5eyp9H3gh7zP3xK8IwYR43SmtPJWjyQG1LgZZ/+ZjHucmGxfo1Rp
	 AbaD2a6rE3ujFdrrs1d/0wUMRcJjaFlrLCEvw/vRrMGX+lR93t1BsxP64h97TAlntu
	 XscmKC2irtFNQ==
Date: Thu, 6 Feb 2025 18:13:47 +0000
From: Conor Dooley <conor@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>,
	neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
	airlied@gmail.com, simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: vendor: add csot
Message-ID: <20250206-overlaid-eastward-610a0d6e34cd@spud>
References: <20250206131300.1295111-1-yelangyan@huaqin.corp-partner.google.com>
 <20250206131300.1295111-2-yelangyan@huaqin.corp-partner.google.com>
 <CAD=FV=UfWJoUsKzYMkyU3U4Yn1ufAs=NHMCDL+db887Uec9fww@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BCdvD9ZIbZN+8WvF"
Content-Disposition: inline
In-Reply-To: <CAD=FV=UfWJoUsKzYMkyU3U4Yn1ufAs=NHMCDL+db887Uec9fww@mail.gmail.com>


--BCdvD9ZIbZN+8WvF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 06, 2025 at 09:12:45AM -0800, Doug Anderson wrote:
> Hi,
>=20
> On Thu, Feb 6, 2025 at 5:13=E2=80=AFAM Langyan Ye
> <yelangyan@huaqin.corp-partner.google.com> wrote:
> >
> > Add "csot" to the Devicetree Vendor Prefix Registry.
> >
> > Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
> > ---
> >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/D=
ocumentation/devicetree/bindings/vendor-prefixes.yaml
> > index 42d14899d584..375f1f7c79ef 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > @@ -336,6 +336,8 @@ patternProperties:
> >      description: Crystalfontz America, Inc.
> >    "^csky,.*":
> >      description: Hangzhou C-SKY Microsystems Co., Ltd
> > +  "^csot,.*":
> > +    description: Guangzhou China Star Optoelectronics Technology Co., =
Ltd
>=20
> Doing a `git log` on
> `Documentation/devicetree/bindings/vendor-prefixes.yaml` shows that
> most patches use the subject prefix `dt-bindings: vendor-prefixes`,
> not `dt-bindings: vendor`. If device-tree folks care about this
> difference and they don't want to fix it when applying, they might
> request you to send a new version.
>=20
> In any case, that's fairly minor so I'm OK with:
>=20
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>=20
> I would assume this will go through the DT tree, not drm-misc. If this
> is wrong then someone should shout.

idk, probably the whole series should go together via drm-misc.
%subject can change if there's a resubmission, otherwise
Acked-by: Conor Dooley <conor.dooley@microchip.com>

--BCdvD9ZIbZN+8WvF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6T72wAKCRB4tDGHoIJi
0j/SAPoC/C0pCB6Rfsu3yKehTDKPZcAfV2TvGOVKD5gwb5RWPgD+PFLgD3XA0PVE
VHMkn6PRxKBvUAwsB1Vmq2uHw3SItQE=
=gFPY
-----END PGP SIGNATURE-----

--BCdvD9ZIbZN+8WvF--
