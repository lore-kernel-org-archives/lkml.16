Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BBF250BFE;
	Mon, 12 May 2025 16:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747067762; cv=none; b=G9Cvk+N7eEAW83w2itgErpRbgtlnMP9WhYunTQICffEROBmlddhroCGAhSZIaIn4hg/3K/7863TxeEjrL1ONr2N4J/2lYDKA9JO6jV29pXhQeN94Gaqlgy5NhRuFDtMzCv3/lWF0LyFhZwvt3Qs7Y+oFlStgdseCNsICXIojBRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747067762; c=relaxed/simple;
	bh=UutJlU+U+PC5vuoNA8XGRVHw2fxOnOzKGMbcX7lytaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=piJsmuPkMxdcZsJiQu3a/LA1mkd+duo78I5/zFFLV8k4nzd5FkId/ZHTVcpOoWR2LngSjuHsuqAtVcZlXU0YzOWkiViad3xaDKxTvB+dwy3vJn1eg46qe8gi7iyVVt2P5WrCMeg0hrVpORE128AEtNdJ8CUlcBe81drQq4UW4Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SSyE2Rsh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SSyE2Rsh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47DF3C4CEE7;
	Mon, 12 May 2025 16:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747067761;
	bh=UutJlU+U+PC5vuoNA8XGRVHw2fxOnOzKGMbcX7lytaA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SSyE2Rshzk/e7uG3PUwLrxTCh8AkVdBjpx8zmMElp5s2/yjKvmA21DCqT7ros70hC
	 pbYTmPG8PCxKXvs6IH50TBkQMP/ANIPXjlmQZXxVKZySs+CuCQ8Pf3v1WdOX0ES8dl
	 dzvSo+pa9CJ5f68urBDVTA7nkH71oVoUMO1hidWV59KzBw4OhxcS01bQhx5JJQUwxi
	 SBNjxwuAdF0DtjnPmv0T6x2U5pgROpKx2cIB/dJd9algKOwgoJ9HWNzNfvyft6fQlF
	 0j1JFPKPpogfZ/8Ozgz7QRk7/7ohynTL9Bptk+ycXlA4sfpUeOpoq8/wHmmCLyJwIJ
	 ae5MElyQ/OTAg==
Date: Mon, 12 May 2025 17:35:56 +0100
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Guo Ren <guoren@kernel.org>, Chao Wei <chao.wei@sophgo.com>,
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: riscv: add Sophgo x4 EVB bindings
Message-ID: <20250512-dugout-twenty-4eaf88653c5d@spud>
References: <cover.1746811744.git.rabenda.cn@gmail.com>
 <4a9236b67a368423c1bb1a86720dfcd7593f0d1b.1746811744.git.rabenda.cn@gmail.com>
 <5hn5ywklwlc2cfjeesarg7hcf2knsujloxijzp46o26ox33yzo@6kuf3bkqqigf>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VG9g93rQvIs17bvF"
Content-Disposition: inline
In-Reply-To: <5hn5ywklwlc2cfjeesarg7hcf2knsujloxijzp46o26ox33yzo@6kuf3bkqqigf>


--VG9g93rQvIs17bvF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 10, 2025 at 06:37:00AM +0800, Inochi Amaoto wrote:
> On Sat, May 10, 2025 at 02:13:29AM +0800, Han Gao wrote:
> > Add DT binding documentation for the Sophgo x4 EVB board [1].
> >=20
> > Link: https://github.com/sophgo/sophgo-hardware/tree/master/SG2042/SG20=
42-x4-EVB [1]
> >=20
> > Signed-off-by: Han Gao <rabenda.cn@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/riscv/sophgo.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/riscv/sophgo.yaml b/Docu=
mentation/devicetree/bindings/riscv/sophgo.yaml
> > index ee244c9f75cc..0f93f4cbfc6c 100644
> > --- a/Documentation/devicetree/bindings/riscv/sophgo.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/sophgo.yaml
> > @@ -35,6 +35,7 @@ properties:
> >            - enum:
> >                - milkv,pioneer
> >                - sophgo,sg2042-x8evb
> > +              - sophgo,sg2042-x4evb
> >            - const: sophgo,sg2042
> > =20
> >  additionalProperties: true
> > --=20
> > 2.47.2
> >=20
>=20
> Please keep alphabetical order.

Additionally, I think it'd be pretty reasonable to add both of these
compatibles at the same time since they're variants p much.

--VG9g93rQvIs17bvF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCIjbAAKCRB4tDGHoIJi
0tR+AP9b1shg4Lu3AUTKYTsqnHrJDBmUrhh7PZoACkE4XpNE9gEAuE9hd5Hl+qrd
3/aiIfboh3RAGHvZudETddxnf5DulwY=
=GPQK
-----END PGP SIGNATURE-----

--VG9g93rQvIs17bvF--
