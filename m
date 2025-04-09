Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471561E7C23;
	Wed,  9 Apr 2025 21:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744234143; cv=none; b=DSs5hnJcXeP1Fh/BBotRMvwDQLgynSjChUW4jK6uJ6QhRXVz0W9J/pRQTozcnfXdqjSnwcEe+IAbhjfwsD5ECd2zZKZi0ln9CFCqowCyw+KuoEswjNpOnxy4oi05A3WGjRAbOgz5qlJUcGgdSG3zUUAUsNObMVadwWHceN8i7Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744234143; c=relaxed/simple;
	bh=kow1nCnHwGqDGsc6kx25kg3tNataWlAxWwYy4kzu+nU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HIihTHDE4Fe1grzLVmg5OSHxJaeHtTjBGITVtX7gtXbZP+2hp8COr8/tAHhfwOwAmMxXfqNouti5x3kkWRu3n83x8eajaYPASunY9qOkc3TfhqdukRpzyM58KEerMa0aPZeDWHkZQYd1S99FnGZ/9llMLJg0KmBSdRM6ZVrAWFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ILS6wmiW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ILS6wmiW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FF70C4CEE2;
	Wed,  9 Apr 2025 21:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744234142;
	bh=kow1nCnHwGqDGsc6kx25kg3tNataWlAxWwYy4kzu+nU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ILS6wmiW4KNuP5JE5I+64vndL1hQe4W5cL+3mRYNiIFJXyObzlAIU/dIqY8q7T79C
	 pxW8VgmLtJTPkIdLhQ1+ib/0GBg+8bujbQZlmYD5ZqgwkcgrrfQg9wQYMdMtoh3bwO
	 lcexc0MWRlo4f4DiCVcNlVw1qh5jJEasjbKXNHTLPqoIjVz/YiDc580SObVwF83wRp
	 Wmp5idLRsnK3PUu7TmVjkb4pgKFfTn1pgbdk4XLfQ3eIiwHTzQQx5ixXHMGHAkWvsJ
	 IbxtCERFpJrYrBsR5KGSGhgwBDex2SWrCftzK2LGS7gzz6hbLVkozFtuR0/bozVCp3
	 3M3G9FHMb1h6g==
Date: Wed, 9 Apr 2025 22:28:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Sandie Cao <sandie.cao@deepcomputing.io>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Maud Spierings <maud_spierings@hotmail.com>
Subject: Re: [PATCH v2 RESEND] riscv: dts: starfive: fml13v01: enable USB 3.0
 port
Message-ID: <20250409-pulsate-buccaneer-ae996b6ff98e@spud>
References: <20250324020958.2235802-1-sandie.cao@deepcomputing.io>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ssygYa8RWRZNqOUH"
Content-Disposition: inline
In-Reply-To: <20250324020958.2235802-1-sandie.cao@deepcomputing.io>


--ssygYa8RWRZNqOUH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 24, 2025 at 10:09:58AM +0800, Sandie Cao wrote:
> Add usb_cdns3 and usb0_pins configuration to support super speed USB=20
> device on the FML13V01 board.
>=20
> Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
> Tested-by: Maud Spierings <maud_spierings@hotmail.com>

Emil, can I grab this one?

> ---
>=20
> Changes in v2:
> - Remove space to pass checkpatch.pl.
> - Add usb0_pins and pass test on board.
>=20
>  .../jh7110-deepcomputing-fml13v01.dts         | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.d=
ts b/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
> index 8d9ce8b69a71..f2857d021d68 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
> +++ b/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
> @@ -43,9 +43,28 @@ GPOEN_DISABLE,
>  			slew-rate =3D <0>;
>  		};
>  	};
> +
> +	usb0_pins: usb0-0 {
> +		vbus-pins {
> +			pinmux =3D <GPIOMUX(25,  GPOUT_SYS_USB_DRIVE_VBUS,
> +					       GPOEN_ENABLE,
> +					       GPI_NONE)>;
> +			bias-disable;
> +			input-disable;
> +			input-schmitt-disable;
> +			slew-rate =3D <0>;
> +		};
> +	};
>  };
> =20
>  &usb0 {
>  	dr_mode =3D "host";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&usb0_pins>;
>  	status =3D "okay";
>  };
> +
> +&usb_cdns3 {
> +	phys =3D <&usbphy0>, <&pciephy0>;
> +	phy-names =3D "cdns3,usb2-phy", "cdns3,usb3-phy";
> +};
>=20
> base-commit: 38818f7c9c179351334b1faffc4d40bd28cc9c72
> --=20
> 2.34.1

--ssygYa8RWRZNqOUH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ/bmlQAKCRB4tDGHoIJi
0iytAQCAj+mhwwzQXQIlbDlw6waVQEY9X9FMeCpD8NcU/uJKoAD/WfWT0WNPVjU3
t/4rjgXuGljrypJHRMQOxppAmnkeOgc=
=z5A+
-----END PGP SIGNATURE-----

--ssygYa8RWRZNqOUH--
