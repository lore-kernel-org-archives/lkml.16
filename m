Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9752021421C;
	Fri, 23 May 2025 15:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748014233; cv=none; b=p0bqW1pGb191vI8IxAeoC+6hvyyzOKWNwTXZSZbX0WusUSkGAqhaJW3WllxFPQ9hIC6fUUt8+1XcxAnUAAZaTx2QSCS9s9aOpfijnnsAw4ypdXCrMwV8NOWLo/LYYuLUqyELQ2gJkbO6jyZTBO8HmqGRbY4GSTWXBbQKGN5rKCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748014233; c=relaxed/simple;
	bh=fnvSBvOtjPgpgsLbyZ6UgCbUTyyWa+ZiZL8H26nf+Bs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jJvmswX7EVz6Oo2unnOOHCFeKdXlecTE3+RYK5WCn6tOyNv50P1mFA1GM6HBT/JeqTiXP0G04DCnRVn2qaDWq7ay5qsJMd9ErIL03wX//JQAFEiNPM8rhyegdbM4R8gIMwKY5bysNVAG7xyVnjV8iqr1+3rCbY1NJT/hPpcDo+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hychKxWz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hychKxWz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14633C4CEE9;
	Fri, 23 May 2025 15:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748014233;
	bh=fnvSBvOtjPgpgsLbyZ6UgCbUTyyWa+ZiZL8H26nf+Bs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hychKxWzbELhE24bK3Jvmlg5wemFWGKvdLNltfRzmJtNiztVKttgST3CscmccfPZF
	 HgZa/uesPqfeg9q8W3FuAAZX6d5bY38hwD4zRV1RcAicChiqOt1a8Ywm3nPgWCuSzZ
	 Oj8NjmEhCaB7BcZPkksIeftImQcsmYR3dvSdVJmYOUODfCGaKtxttD6+nhbzc/5Wqy
	 HrSLXRO8SXJAGrcT07ADvIcgvEqvusgqVRqjN9hQSi9iBc/3HRGfOLk2VWAYyGCOQA
	 f5+jA3qf+e5TIqXBM0nYjGMWBdOr2T1O405f9rvCSC1ILQJ8ICmU4b5VF/kTKlTNY/
	 Q+Pl1cTb4Mrcg==
Date: Fri, 23 May 2025 16:30:27 +0100
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Noah Wang <noahwang.wang@outlook.com>,
	Naresh Solanki <naresh.solanki@9elements.com>,
	Michal Simek <michal.simek@amd.com>,
	Fabio Estevam <festevam@gmail.com>,
	Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>,
	Grant Peltier <grantpeltier93@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: trivial-devices: Add compatible string
 adi,adt7411
Message-ID: <20250523-fridge-scarecrow-982578c16bf0@spud>
References: <20250523151338.541529-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1tM7LlsoiyBetFYr"
Content-Disposition: inline
In-Reply-To: <20250523151338.541529-1-Frank.Li@nxp.com>


--1tM7LlsoiyBetFYr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 23, 2025 at 11:13:37AM -0400, Frank Li wrote:
> Add compatible string adi,adt7411, which is temperature sensor and
> 8-Channel ADC.

Usually for iio devices supplies are meant to be documented, and this
device has one.

>=20
> Fix below CHECK_DTB warning:
>=20
> arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: /soc/bus@40080000/i2c@40=
0e6000/adc@4a:
>     failed to match any schema with compatible: ['adi,adt7411']
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Doc=
umentation/devicetree/bindings/trivial-devices.yaml
> index 27930708ccd58..38bc1937ff3c9 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -41,6 +41,7 @@ properties:
>            - adi,ad5110
>              # Analog Devices ADP5589 Keypad Decoder and I/O Expansion
>            - adi,adp5589
> +          - adi,adt7411 # Temperature Sensor and 8-Channel ADC
>              # Analog Devices LT7182S Dual Channel 6A, 20V PolyPhase Step=
-Down Silent Switcher
>            - adi,lt7182s
>              # AMS iAQ-Core VOC Sensor
> --=20
> 2.34.1
>=20

--1tM7LlsoiyBetFYr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaDCUkwAKCRB4tDGHoIJi
0soQAP9nLwnTgi8ErCeVe+t4xFKeKQSUBvkCY2bu6XvQQJM8nQEA/DcvXLA5+7Le
5zSe0czOnw25QKcFvhYHxTKAKVwqwgI=
=y7DZ
-----END PGP SIGNATURE-----

--1tM7LlsoiyBetFYr--
