Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2623938B;
	Thu, 12 Jun 2025 17:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749750534; cv=none; b=mV6l4+BBjRpnsplklxlA1NxPKUCkxKJhVd4hceTDN9oKRUNp8Tdg/RMair9qhDHCQTm5Skne0ocP1C8vIGRMk/3Tk2o02Ug2yYs2/whaj73bzZYQvM8IqSclKZACnr3HSdL5b8mh2Ov0hh/to4d/djAVFzrjSMg1xFTyJuqMhMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749750534; c=relaxed/simple;
	bh=wKdC1kaW6Mz233y8IwinugA1rK2mMjZiCz1ANtUBJaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QSyXG/m93+QpjmBEuj7yayom9A8d2UJ/Kj1cIZVXKaF6CYP/mJyuLZ07lVogr6DviXrJe+9irgNlVNo79iE8vq1K+QCcXZ3bjsUtYsjkG0uWXVEsDhPvx8zvnLhBusBSkDBobcrQGoIglXfeUUpeZgZ+1B6ucu8nngX5aahJG5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IYhRx5uv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IYhRx5uv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 258F1C4CEEA;
	Thu, 12 Jun 2025 17:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749750534;
	bh=wKdC1kaW6Mz233y8IwinugA1rK2mMjZiCz1ANtUBJaA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IYhRx5uvnkonjwx441vp+/Wbc1KUGF5fLeUz0yapovSRXtUE9d0oU47qdib5SoNdz
	 c+znyu7L5vjxn40sguLyeUxJK8zTWYddIiTOYBH0oojVTXxbyD0TAAWB2Z5GtOmKi6
	 4jwiEdOtSHxm6ED4WuwTXPiicz/ff/8rNBCFfCCIqFSynnQSh93eRvPjdbZQJqd0mv
	 V3F9lyarWqguOPA/XuFDbZdcrnv/GeRy9edy8OKg6EvHPAtEZdU8RJ/OxQCCX0OzVV
	 WEa6NgQSuuylo7d7NCfLXzacCHasClNsWa6GUx/zgHtWxRM2axSnBzp7a6IGvZveCj
	 v7JJnuCK3iGLg==
Date: Thu, 12 Jun 2025 18:48:48 +0100
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
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: document Samsung
 S6E8AA5X01 panel driver
Message-ID: <20250612-banjo-mongrel-37125f8f0414@spud>
References: <20250612-panel-samsung-s6e8aa5x01-v1-0-06dcba071ea6@disroot.org>
 <20250612-panel-samsung-s6e8aa5x01-v1-1-06dcba071ea6@disroot.org>
 <20250612-lively-duplex-ff45181ffd5a@spud>
 <0a89c2b2edee38fc910d2ec88760f2e5@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SP8a+pJLs3oRR5NN"
Content-Disposition: inline
In-Reply-To: <0a89c2b2edee38fc910d2ec88760f2e5@disroot.org>


--SP8a+pJLs3oRR5NN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 05:10:23PM +0000, Kaustabh Chakraborty wrote:
> On 2025-06-12 15:30, Conor Dooley wrote:
> > On Thu, Jun 12, 2025 at 08:22:41PM +0530, Kaustabh Chakraborty wrote:
> >> Samsung S6E8AA5X01 is an AMOLED MIPI DSI panel controller. Document the
> >> compatible and devicetree properties of this panel driver. Timings are
> >> provided through the devicetree node as panels are available in
> >> different sizes.
> >>=20
> >> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> >=20
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> Okay no, even this one has the ID wrong, ugh :(
>=20
> >> +$id: http://devicetree.org/schemas/display/panel/samsung,s6e8aa0.yaml#
>=20
> Will apply tag after fixing it.

Thanks, I didn't spot it here either.

--SP8a+pJLs3oRR5NN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEsTAAAKCRB4tDGHoIJi
0lvOAP0ZozR/t0mHA2fg37mJyEOtYJBvVqBNr3GGVvmJf1RvWQEAtKjgMPW8lp0M
hb6IZjaUkNbKWGE63IHTZaQGsyQgUAI=
=kQDe
-----END PGP SIGNATURE-----

--SP8a+pJLs3oRR5NN--
