Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2664A262FCE;
	Mon, 28 Apr 2025 16:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745859346; cv=none; b=bnGHQxIBJ5AvcKtxJ07OYpOpZLdTe05gOVQ3ja+ol90tg8OnIVc69XTz2HSifIvaek93wafy3iUcOdnDOfEA+j2MaFv9Vp9b3+BXn5UhL85S4v4/uifFwmp13XM8YM5enGkI6cUCOjbz5sopFZvJNzeD059wH/JQwZz+2McGuac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745859346; c=relaxed/simple;
	bh=rdzo+bpXDJs0ypWV1LWmkb04e+4rQxP1v+N7g7Jw86Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n8BFI758O1jfmnnWgXKL6urIcf4MBwcjGOOXVdl/EjQmK7hh87E+kllOjozbsFx4/rkzpeeHsxgMDZeDC5VM+b7NGF3SZNZy7lu7fg0dVe0PUCR2+P0DXoJABRZbJ2JXRhrzR/iFpkUqI2nPHptyqbXwaBKjiQD55vrbn+w+h/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KkVkT3Yc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KkVkT3Yc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7453C4CEE4;
	Mon, 28 Apr 2025 16:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745859345;
	bh=rdzo+bpXDJs0ypWV1LWmkb04e+4rQxP1v+N7g7Jw86Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KkVkT3YcpNZPQH1CXcgtvOqB7kfmqTmHQKSJmJBtdyFDJXTSQ+9O6i30thaWFY6ua
	 TIGFIFM0yRZ7j6mpXNy60R4qddQFo41FFxN2E/MgEomDSslXRhqDXOHc6HYX77ihPn
	 xMYOOV7UDGIjVdxqZt61hPkIvA/vyk1c5dq/D5pbY/KbfoUjFOoikmzj0ctcmpLViv
	 vVEB+bG26jeFRxtKwHHuuRpNrz0xsa8ITsSqFOsypxM//yw2bcefZEmWz0zcuW2SiY
	 z1E39u/C9IJ88mArbHTwlpPOyxr+S5PPjiRDn6Llfis6bpM7epmqdkCFi12J1xQO69
	 Y704H6whlT4Nw==
Date: Mon, 28 Apr 2025 17:55:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Yuntao Dai <d1581209858@live.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 2/3] riscv: dts: add mailbox for Sophgo CV18XX series
 SoC
Message-ID: <20250428-water-sermon-eefdfa511f8d@spud>
References: <20250428-cv18xx-mbox-v3-0-ed18dfd836d1@pigmoral.tech>
 <20250428-cv18xx-mbox-v3-2-ed18dfd836d1@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xA+yzJlbbZrKnJ4A"
Content-Disposition: inline
In-Reply-To: <20250428-cv18xx-mbox-v3-2-ed18dfd836d1@pigmoral.tech>


--xA+yzJlbbZrKnJ4A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 08:39:45PM +0800, Junhui Liu wrote:
> From: Yuntao Dai <d1581209858@live.com>
>=20
> Add mailbox node for Sophgo CV18XX series SoC.
>=20
> Signed-off-by: Yuntao Dai <d1581209858@live.com>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  arch/riscv/boot/dts/sophgo/cv18xx.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts=
/sophgo/cv18xx.dtsi
> index c18822ec849f353bc296965d2d600a3df314cff6..f7277288f03c024039054bdc4=
176fc95c2c8be52 100644
> --- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> @@ -55,6 +55,13 @@ soc {
>  		dma-noncoherent;
>  		ranges;
> =20
> +		mailbox: mailbox@1900000 {
> +			compatible =3D "sophgo,cv1800b-mailbox";
> +			reg =3D <0x01900000 0x1000>;
> +			interrupts =3D <101 IRQ_TYPE_LEVEL_HIGH>;
> +			#mbox-cells =3D <2>;
> +		};

No user added here, is there another series in the works that adds a
user of the mailbox?

> +
>  		clk: clock-controller@3002000 {
>  			reg =3D <0x03002000 0x1000>;
>  			clocks =3D <&osc>;
>=20
> --=20
> 2.49.0
>=20

--xA+yzJlbbZrKnJ4A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaA+zDAAKCRB4tDGHoIJi
0jKSAPoDM25pLrGWkg9bkq2pYg0aNYGJ2RznmDX5+prlXe7rCAD/ULesrOMr+1Fd
IAlLCzjsDtLy0SL/qyrXAINikYX6sgM=
=ZurY
-----END PGP SIGNATURE-----

--xA+yzJlbbZrKnJ4A--
