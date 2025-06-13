Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6B618B47D;
	Fri, 13 Jun 2025 14:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749824990; cv=none; b=XkXs3FlcwllVsTJ1GcenAaNnOGfLgdJo5T1PiD2963oSVtvTqU5c9h6+bqXb4ojdPRngmrQ/1NgujvmmVgY1SKnOeljxmWdlaGOeqHj5oXqI+6cKLXvS1+l0N4Pw4E6CtutQpVLFu7iJ27ZV+O1xbLVZwbCepd4rSiwh3jROIjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749824990; c=relaxed/simple;
	bh=XjIGrMXI9Lwf15i7w/n2nAnmVq8n5EfiQ7/Rpe0jmao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lK4D7SXi2QvZMa+jjn3uiJL2PE1VKWKXLRC8wtLtY2T6jK2a88uMOuLLvFFwpeu5sERx8I3AAohgqyZTit7vKqbwTZ6Wx+0cRTEq6Mkdmjjc3o/OwD00di0Q6q3wPvHcj4M4cmisiGsbfVSc7s8e+fhJ2adyWfSzj7Ad7sgjBRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HKZxsEGA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HKZxsEGA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9B00C4CEE3;
	Fri, 13 Jun 2025 14:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749824990;
	bh=XjIGrMXI9Lwf15i7w/n2nAnmVq8n5EfiQ7/Rpe0jmao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HKZxsEGA0hFa/XuJii3LvwPMfo7ZKkj6l3tLAyNYYpDWhVJhPvaAoMc7+KrQen0Nr
	 OLR0b5WXa7Zz96+Q5E/JUFeRjlf7NJ5i5zwkeXozWiapm8WocyHWDt4uefY8aR6wQa
	 Sw5IWlV2SrwpVwAYJ4T0VGsknXPfTjUUfKISFX0rS8k3GrexPd4czmkU1+2w4dVFHB
	 dAefyMlvUIWXYvOURB8l/KsR/xCTxOkGmq/xwlBVg3HYfgjUJmFyiyD0lPLv56K9HR
	 E9zHBNMKkCO+unEpbFAYSoCB4acHnncuws4PspxrjiY47Gz9CXXHFEsCwuEMyVEYig
	 7CwyCRrGjv9LQ==
Date: Fri, 13 Jun 2025 15:29:44 +0100
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: phy: Add Sophgo CV1800 USB phy
Message-ID: <20250613-deflation-aerosol-fed1d566fd0b@spud>
References: <20250611081804.1196397-1-inochiama@gmail.com>
 <20250611081804.1196397-2-inochiama@gmail.com>
 <20250612-siesta-verbalize-6a7768ebc648@spud>
 <jf76ak6b5edgqhx4rkhcsfpmcpkrxci7rq373ld2apue67q7hh@3fb346tgaxcq>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3c8vFvw0nmfKFBPv"
Content-Disposition: inline
In-Reply-To: <jf76ak6b5edgqhx4rkhcsfpmcpkrxci7rq373ld2apue67q7hh@3fb346tgaxcq>


--3c8vFvw0nmfKFBPv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 06:02:27AM +0800, Inochi Amaoto wrote:
> On Thu, Jun 12, 2025 at 05:07:37PM +0100, Conor Dooley wrote:
> > On Wed, Jun 11, 2025 at 04:18:02PM +0800, Inochi Amaoto wrote:
> > > The USB phy of Sophgo CV18XX series SoC needs to sense a pin called
> > > "VBUS_DET" to get the right operation mode. If this pin is not
> > > connected, it only supports setting the mode manually.
> > >=20
> > > Add USB phy bindings for Sophgo CV18XX/SG200X series SoC.
> > >=20
> > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> >=20
> > I'm having a bit of trouble finding the v3 etc, could you provide a
> > link?
> > I think what is here is sane, but I want to make sure that review
> > comments on previous versions have been addressed. "dfn:" searches for
> > both driver and binding filenames turned up nothing.
> >=20
>=20
> The v3 is
> https://lore.kernel.org/all/IA1PR20MB4953C1876484E149AA390DD5BB1D2@IA1PR2=
0MB4953.namprd20.prod.outlook.com/
> It is a long time ago when sending these patch.

Thanks. I think this patch looks okay, but probably worth Rob or
Krzysztof taking a look, even if you seem to have removed the props that
were objected to.
Acked-by: Conor Dooley <conor.dooley@microchip.com>

--3c8vFvw0nmfKFBPv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEw12AAKCRB4tDGHoIJi
0rFvAP9S13o/LIdwmUHfvdi3xmI2QY28l91ctWFzgrUilzPCYAD/SjWjbDN8whBn
xzbmH9XlaGdqGPG+RXchp8YvmnNg5ws=
=1aby
-----END PGP SIGNATURE-----

--3c8vFvw0nmfKFBPv--
