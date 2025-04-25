Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D3D78F4B;
	Fri, 25 Apr 2025 14:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745591811; cv=none; b=AtnDAalzU89bXvRyHhXie5rmdwwtjcDhiCFWP9AxCFf29JhKHaXARq+vKtUwjeurWm8IcysHZjOwyxTD5HImjgc7OBBWrUaQsgZkDuCUdJABK8W+jGoO6m0D3czeq94hTRtmsHimskzGyga9paPnfQtMkch0M4jx45NW0xWWkb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745591811; c=relaxed/simple;
	bh=K2RdwYQvxoGdkMb4tRtn11nLabJWv4T2dHWe753R+lE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TxPIp+bjH6146wIYJCcMt7xu/K8+v6hNgBZCr3NyISdLRTEzdRqNAo8/IWtx8vRzL/d8tRQxIwEzapf5Ue/f/TS4TX0VJMSHqSeKOsX/+T+Aj6qdzyUpO6ncLWFjgWpx92nSILDDATzSvsHoljgQsA3dorL5p+sOb9QA8C5o90w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G0BlZTgl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G0BlZTgl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 045ABC4CEE4;
	Fri, 25 Apr 2025 14:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745591810;
	bh=K2RdwYQvxoGdkMb4tRtn11nLabJWv4T2dHWe753R+lE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G0BlZTgliYLpKMPqcPn0s9FTdF2UvlHq4qxPzcEaLoyqevgouX1IzelnR3Hg5t06K
	 Ik706/6ehA0pE+fOk420fIvbz2USLSeUV6wb61gY2p4Or157l/RNF4WFNha8pFM+5A
	 ceWIt7io1tvZyuLCj0w4gb08P9cw5ACpSGU0JpNkKTOpTG5fXq0D9K0A9rd72S6p/l
	 SLZTt4kdl/mTfif4dlaa67I66ReQ+HHtPh7VzoLboicfCqolP3iSBH7l5ofIMYvFr/
	 qF5sfl292IYrAQGsMxatk7tlFE+mcZ4sF+5FPxN+mi07DtHjl+ecKe/4/tpkVFCxKM
	 UavRglTEVkZLA==
Date: Fri, 25 Apr 2025 15:36:44 +0100
From: Conor Dooley <conor@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Alex Elder <elder@riscstar.com>,
	Yangyu Chen <cyy@cyyself.name>, Jisheng Zhang <jszhang@kernel.org>,
	Jesse Taube <mr.bossman075@gmail.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v9 1/3] riscv: defconfig: spacemit: enable gpio support
 for K1 SoC
Message-ID: <20250425-unsuited-perennial-96d13be0b927@spud>
References: <20250424-03-k1-gpio-v9-0-eaece8cc5a86@gentoo.org>
 <20250424-03-k1-gpio-v9-1-eaece8cc5a86@gentoo.org>
 <20250424-untried-refueling-50c5902d63c9@spud>
 <20250425000406-GYA49092@gentoo>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kUnUDH4nBaYcHt5+"
Content-Disposition: inline
In-Reply-To: <20250425000406-GYA49092@gentoo>


--kUnUDH4nBaYcHt5+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 12:04:06AM +0000, Yixun Lan wrote:
> Hi Conor,
>=20
> On 16:22 Thu 24 Apr     , Conor Dooley wrote:
> > On Thu, Apr 24, 2025 at 05:40:49PM +0800, Yixun Lan wrote:
> > > Enable GPIO support, in order to activate follow-up GPIO LED,
> > > and ethernet reset pin.
> > >=20
> > > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> >=20
> > Do you want me to grab this patch, or do you have a defconfig branch to
> > put it on?
> >=20
> Yes, I'd appreciate if you willing to pick it, to avoid potential conflic=
ts?

Sure, done.

> (I currently do not maintain defconfig branch)
>=20
> BTW, we might have few more in this cycle, e.g. - clock, reset

Cool, just poke me if you need them picked up. I should see an email,
but failing that, @ me on your IRC channel.

Cheers,
Conor.

--kUnUDH4nBaYcHt5+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaAud/AAKCRB4tDGHoIJi
0saMAPwOeQlQUrG6np6OmBikq8VoxLk3DzM+HkXJFjuDkb5spwD/VLAVmmRQJRdW
7Kd+TdyJ9DvK5K22vsvOBcpQHKAbIAY=
=qbG6
-----END PGP SIGNATURE-----

--kUnUDH4nBaYcHt5+--
