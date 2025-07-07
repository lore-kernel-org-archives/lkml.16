Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755A0293B55;
	Mon,  7 Jul 2025 10:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751885486; cv=none; b=uREPV+u23hbcLWV4iPpZfuJs6T4RNcePhyw2ZMntkFee2FFzAqOQtjWaqupC/julecpSzgQ/4O0QwGjlDmvwYV91Y0YLUAmH8auiurW1gC/3NHzNIbWvLO+4tKDSalWhw72W6drehzzCek3s9yWyjI/hb2ITOJE3ddahhufgoXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751885486; c=relaxed/simple;
	bh=slOPMNTVA3FLhW65MdVR4aR/1OsxKkcOkNICbnYATJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P6SVUtDLNN07XL4Lvi5gIR8tJIOEkWklg0U481LHUatnwagWxMjUdLUosrelIgzlA3cFKjTpPZkqZUEwXnTY4rRubOWYH7SW2wLrZN4naFrQc7MZDcPEg0MC1vb9hpjbO/kG7hDEvQrBDxif5dy3dXyzi8OeqCY2jJ1qqH/yVGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U2gp0c+K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U2gp0c+K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAE75C4CEE3;
	Mon,  7 Jul 2025 10:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751885486;
	bh=slOPMNTVA3FLhW65MdVR4aR/1OsxKkcOkNICbnYATJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U2gp0c+Kgl9cK3ut2JrE9CJJHpRfc/LdGEG/KOkwFoNM2tzjS6Gpgtdl0j73+sA3l
	 LZwsIIdjoZpSq9M+0BVFvIwGKR1JqPaoR7U9MHGaE/emID7fM7KE/PBaFsrAorSWeY
	 JN4P/OYiUOkcrxwVcCKv5sxcle9qFoAB20AsVcPG7kFGveEiY3GOpd//CRrMONQQV0
	 uqHvM6G2urwFfMYi6kzPuvAZG0PHBfjO5h9Y9skbuZNTVec/17yQeJIujj30IJ2ubj
	 XcnvVsZaaVaAjIN3T4DxdS1Tds+5rN/lI7K9YHC19wsPJuzl7GRUxNhWK/YwleTjFf
	 /vtjzlcW+4Rjw==
Date: Mon, 7 Jul 2025 11:51:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <Frank.Li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 4/6] arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
Message-ID: <a5c902f4-6f10-4a1f-8d57-b232583e4556@sirena.org.uk>
References: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
 <20250610160152.1113930-5-laurentiumihalcea111@gmail.com>
 <ac1daf6b-ee06-4076-b86f-b436ca0acd6d@sirena.org.uk>
 <c3deef24-fed7-4405-9953-804bff118c11@gmail.com>
 <8ef60a13-015f-4228-b834-799592342ae6@sirena.org.uk>
 <225eb39b-958c-4e40-96be-272a8dc9ce12@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6IZozApVFuUcVoyp"
Content-Disposition: inline
In-Reply-To: <225eb39b-958c-4e40-96be-272a8dc9ce12@gmail.com>
X-Cookie: We are what we are.


--6IZozApVFuUcVoyp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jul 05, 2025 at 05:41:17PM +0300, Laurentiu Mihalcea wrote:
> On 7/3/2025 6:25 PM, Mark Brown wrote:

> > This also appears to be the source of the boot issues I mentioned on the
> > EVK, affecting ramdisk only boots:

> >    https://lava.sirena.org.uk/scheduler/job/1533032

> > as well as NFS.  The board seems to get to userspace but then not
> > respond to serial input, it looks like it's hit something while loading
> > modules and locked up but ICBW.

> OK, this is very odd. I've tried the ramdisk boot using the files from the CI job: Image,
> modules, CPIO and my own flash.bin (u-boot and ATF hashes match those shown in
> the CI job) on an EVK board and so far no hang.

It may not actually be hung, it may just be hitting long timeouts in
userspace (I notice that all the boots with a NFS root are doing module
autoloading, and the ramdisk ones have tried to bring up the network).

> What I've noticed though is that the bridge does indeed not get probed. So, for now,
> I think I'm going to submit a patch to enable the driver config in the defconfig so
> we can get the Verdin failures out of the way.

If the driver is now required then it does need to be enabled.

--6IZozApVFuUcVoyp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhrpqcACgkQJNaLcl1U
h9Dwlgf+KcOwF5vR7PuxEJNsgZjoa9GnoGnVh+0CPAuGUe3yEo9/PeR8jVAdVjyO
gdI8ymNYVm+xOaeRJiIgxFxA/CocttzXKGcw23uB5cM9hwaVkAmOaoqLVE+ef9xn
hNu96YXWRPNskp5mB5d5WQcT/rfid/iaAzpCWktqFMLvZmzjaTdnSDDdJ1eqbUqL
kgpSxE12xPns8/o8SPVU9rB7ShPuc16AdOJ5phCrMNnfnu0IAVTTpQJpr8LZhV9M
MavTiyLgRI7EMXGXfQrxgRl8mbCIAe08ESsIjjNf+UB4nwXFZIAg00h9xqHt2LXp
6sqF82kfizbNMybb9BmMbzXehQoUCA==
=xYTV
-----END PGP SIGNATURE-----

--6IZozApVFuUcVoyp--
