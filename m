Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A6A201246;
	Mon, 19 May 2025 12:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747656116; cv=none; b=ZiQzqi4QEhX0o7Et5MDZva5HxWQRDQ6rBCjPcQvQAVAb3EYnf4wH1H0QvebFyOnpb/lC2Z0gCuQ/CdESPfPRIbfDsszOy0QsUJZD92RYSntxRO8Zn9gAKmTS0zVK3krGDCpa7N78hwRC0mKnfUrfuwbTkWgM5BHEBo45vCdLOAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747656116; c=relaxed/simple;
	bh=Zf9gz2Q4q1qJ6K136JlNwatN69nhNVbGzKy8s8ubJ+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O9HEfqC0/qjUUJXqEYsf8jElaePkETDMpNuzZJOi6xqzGy/mPLxIwO7l2b0Fn9vU0YrAH9UdrSvGyAb7gx7dquFeNfj2OhhC1EetfdvupPWPDjPumS3j84EIhd1KlXI8Rbgk5Kvz1Gzze7mYueV4RLdKC8ne+w+oGbZj7WEbCmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lzlAp7kz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lzlAp7kz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ACF1C4CEE9;
	Mon, 19 May 2025 12:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747656116;
	bh=Zf9gz2Q4q1qJ6K136JlNwatN69nhNVbGzKy8s8ubJ+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lzlAp7kzkoeCPmb5UunEHlWgmAl6Q6kbrRzx4rW7AoTfmckiFONvJq29T9drSlON3
	 0WTijnMEjM1LxWh1MJ44JOmw/AXLRzUlRgFCnnbHP6m7yRtJ5uA1ripR22NSvNB32r
	 kQYSTDTBa/fEC2p2ucqCtrtoAIS3bBAI+ESwcnaGqho5wBp0a7ZAzceHbP86hbsSY4
	 k81oLtVguNRmvh1Caq0PNj5V++HjyH59/IC98Gx97Tw1mK/MVG/IyXU0/5pJsPLVBV
	 BDFHQ/+Xh7csYJSI92XW2xtTnditMy/PgO5HTb6vo8NGS+RYH0Yz7XE+64KhtcUlGO
	 yV+mxK1yLpdaw==
Date: Mon, 19 May 2025 13:01:50 +0100
From: Conor Dooley <conor@kernel.org>
To: Han Gao <rabenda.cn@gmail.com>
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Guo Ren <guoren@kernel.org>, Chao Wei <chao.wei@sophgo.com>,
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: riscv: add Sophgo SG2042_EVB_V1.X
 bindings
Message-ID: <20250519-geek-slept-8cae4fc6d548@spud>
References: <cover.1747231254.git.rabenda.cn@gmail.com>
 <b538e2b24eab8b740091d80ca76b20ef6014a4e5.1747231254.git.rabenda.cn@gmail.com>
 <20250514-showplace-yahoo-e3c306355288@spud>
 <CAAT7Ki9Fw0+Ntv+oFqr2R=EHnFZrT6KmyTPN2MCDDGvSn-Wi8A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="p3QpKvf7RfTC567z"
Content-Disposition: inline
In-Reply-To: <CAAT7Ki9Fw0+Ntv+oFqr2R=EHnFZrT6KmyTPN2MCDDGvSn-Wi8A@mail.gmail.com>


--p3QpKvf7RfTC567z
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 17, 2025 at 01:11:46AM +0800, Han Gao wrote:
> On Thu, May 15, 2025 at 12:22=E2=80=AFAM Conor Dooley <conor@kernel.org> =
wrote:
> >
> > On Wed, May 14, 2025 at 10:08:59PM +0800, Han Gao wrote:
> > > Add DT binding documentation for the Sophgo SG2042_EVB_V1.X board [1].
> >
> > 1.x? Is the v1.0 something people can get their hands on, or just the
> > v1.1?
> > What differences do the boards have that are minimal enough that
> > specific compatibles would not be required?
> >
>=20
> First of all, v1.1 and v1.0 are compatible boards.
> There is no difference between v1.1 and v1.0 from dts.
>=20
> Both v1.1 and v1.0 have been discontinued.
> About 80 pieces of v1.1 are in the hands of community developers.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--p3QpKvf7RfTC567z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCsdrgAKCRB4tDGHoIJi
0kd5AQCYs1Sq3GD4kaz3DoAtIrt6+FU4CPdjvAtv8vhTf1N5uwD9FTZzafSC58rf
8spnL07wKGQMM9LFZN9yxZ8RvCxKagU=
=ZRoH
-----END PGP SIGNATURE-----

--p3QpKvf7RfTC567z--
