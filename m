Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3161B3957;
	Thu, 12 Jun 2025 15:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749743586; cv=none; b=VJU2TLy1liMJGViwxMHSq7NKVZ6f5FuEvbf6B36oEuyR2VHw/G53Pg4zKD1AQGr809pIKE1BtXzFE2mJZ16AB8FNlCY7hblHpnZ/xmvGeFYlOn0+Trn/ZBrRIEFZ3N7sgXoWcHpdFstF6Ulpj9T11ZN+o1zBqYZzkivBrD3geMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749743586; c=relaxed/simple;
	bh=G7ZMMQ9ADT/6wk/tz0a93t09tIL8YIFEwIYmqTwvN7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KG4RwmYSvYqKxFjMdpaGmpAGUQTcv6bZnxBnzSO0vjs3lwgRJcQ7PPimtRhwzP+nrDu0ERrgIwZezk/Xx4UTvmw/7pEj6Ww1Pi7S2zVsg+ZF+4nixxhBxgAB6Hc4KWvAqeC5SwqSwnpdQXlfL0pCORcInerisOULORRzcM6ml78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n1FQieJT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n1FQieJT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11085C4CEEA;
	Thu, 12 Jun 2025 15:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749743585;
	bh=G7ZMMQ9ADT/6wk/tz0a93t09tIL8YIFEwIYmqTwvN7M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n1FQieJTUyWtSztZ5N1cLG1nh921uBAqQ+2ezL6GVhhIqU36+GzOkXOAfAcBr2tuN
	 sdhPunWhYbIEA8AnT0MSD9Qh9/YV2oK40K9Q3YP6V2GgFXTYTLoyWU3r2GWdC+3gQz
	 QBX5jdPLoaWnAVQh4uhuy2Ps9RDVLuXLMqJmce5O4OHvAoyJ21fN/iRO8YZUjHjCj+
	 xLiov+Z9Ojk+Hl8W2yTtAnD+c6HkVYmBv5kC940amaRZqRuB//3sSExHH62wntLix0
	 oDaLt4wjz0ho74ZMWAWEnGLXzQDizYPkHKO8v3cOu5ojq6+9+dK5k69mRV24ZqmHIn
	 INOTynZQxxIxQ==
Date: Thu, 12 Jun 2025 16:53:00 +0100
From: Conor Dooley <conor@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: document Synaptics TDDI
 panel driver
Message-ID: <20250612-patriarch-triage-8ceeebc6da4a@spud>
References: <20250612-panel-synaptics-tddi-v1-0-dfb8a425f76c@disroot.org>
 <20250612-panel-synaptics-tddi-v1-1-dfb8a425f76c@disroot.org>
 <20250612-agency-mothball-3830177fd43b@spud>
 <2d8714983c484fe34313efe1dbabf2bd@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="s5vmbRD8rosFxZgz"
Content-Disposition: inline
In-Reply-To: <2d8714983c484fe34313efe1dbabf2bd@disroot.org>


--s5vmbRD8rosFxZgz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 03:47:55PM +0000, Kaustabh Chakraborty wrote:
> On 2025-06-12 15:32, Conor Dooley wrote:
> > On Thu, Jun 12, 2025 at 08:09:40PM +0530, Kaustabh Chakraborty wrote:
> >> Document the driver for Synaptics TDDI (Touch/Display Integration) pan=
els.
> >> Along with the MIPI-DSI panel, these devices also have an in-built LED
> >> backlight device and a touchscreen, all packed together in a single ch=
ip.
> >> Also, add compatibles for supported panels - TD4101 and TD4300.
> >>=20
> >> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> >> ---
> >>  .../bindings/display/panel/synaptics,tddi.yaml     | 92 +++++++++++++=
+++++++++
> >>  1 file changed, 92 insertions(+)
> >>=20
> >> diff --git a/Documentation/devicetree/bindings/display/panel/synaptics=
,tddi.yaml b/Documentation/devicetree/bindings/display/panel/synaptics,tddi=
=2Eyaml
> >> new file mode 100644
> >> index 0000000000000000000000000000000000000000..3aae1358a1d764361c072d=
3b54f74cdf634f7fa8
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/display/panel/synaptics,tddi.y=
aml
> >=20
> > File called synaptics,tddi
> >=20
> >> @@ -0,0 +1,92 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/display/panel/samsung,tddi.yaml#
> >=20
> > id of samsung,tddi
> >=20
> > [...]
> >
> >> +properties:
> >> +  compatible:
> >> +    enum:
> >> +      - syna,td4101-panel
> >> +      - syna,td4300-panel
> >=20
> > compatibles are syna,td####-panel
> >=20
> > These should be consistent and tooling should have complained about the
> > mismatch between id and filename at the least.
>=20
> Hmm, I don't recall seeing any errors. Do I pick any one then? Or is there
> any other generic way?

The id must match the filename and the filename should match one of the
compatibles.


--s5vmbRD8rosFxZgz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEr33AAKCRB4tDGHoIJi
0o+1AQDRaFLnl2hzqpE5LjBnhUp12VJATlA6CFsXD8YOLe6IkwEAiexCjLj6ONAF
oQvB1eDC8gP6KWkgZrOYnQuvxANgKgQ=
=wHWT
-----END PGP SIGNATURE-----

--s5vmbRD8rosFxZgz--
