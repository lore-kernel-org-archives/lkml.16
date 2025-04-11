Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59662220683;
	Fri, 11 Apr 2025 16:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744390004; cv=none; b=XgAjL3JoGu7eGJ32TmXYmdSUAvW3YR3JXyB8GcXKpxT4lbJOWo3gXY67y8Oa8kw/QQnjFPT8vOV/Ta1GNKUIDG5dg9ioQHUmAVGY6Nv6AeSfwZ5Bx8uC8c37UI2HnEGc+yBlcsGTA9o5392aM5wbMtS07up0fALrHAdokUc/iXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744390004; c=relaxed/simple;
	bh=KRJyaCNBuio27Dc7HTLuBLoaNfpbX8S+zCNEoZ10qeI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r101mGMP3NFrXRXJyxq+uSyvpwmHwSwClnDJmZuPftC1yjxOM0M/KP8dV6rFrmYuJLJkyrnOW4/oeVjUDnuwFOb63vFHHseW5iXvWU3425et/Pdi24y1JTJtUeoQDSmIthO3tGBx5grEl4iPXEdYPHu7OEowP/WJ/LtnwM136/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AxAXb9LZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AxAXb9LZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8FD2C4CEE2;
	Fri, 11 Apr 2025 16:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744390003;
	bh=KRJyaCNBuio27Dc7HTLuBLoaNfpbX8S+zCNEoZ10qeI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AxAXb9LZ6ibhSYLAfgeO3lRxGhZvVDAOXyNMMyqnEpIzCtqyKwV3QS5CfIk3vCqRw
	 ui6K41mTa8Kn7GQ1kX1mA0h7uMkmsSrzeb/1v9ywYUIxyhpIUuF0MzCFXS3VWnQk2C
	 hiijFzbWqbD2sNAXMHLyTWe8Ty8HLgU4wOBLnJ5mlp9H6biOemikMWopvI86dZfwks
	 bH1wk7g6DFRA7tpfHAW94RQ/5gDT72XNAiAfUk2EjI/46z/mzI92KO57ccuJtGtqaj
	 3sCboV9+hwGbH7ILSIl2pqTheNSZW/Ifn5+8SMqdkZhVQurU2IBKTUdFzSMfKLt3dM
	 jm/VkfAkzOEZQ==
Date: Fri, 11 Apr 2025 17:46:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux@roeck-us.net, Conor Dooley <conor.dooley@microchip.com>,
	Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Zev Weiss <zev@bewilderbeest.net>,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	Peter Yin <peteryin.openbmc@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] regulator: dt-bindings: promote infineon buck
 converters to their own binding
Message-ID: <20250411-stapling-unwed-21a303742ca0@spud>
References: <20240223-moonrise-feminist-de59b9e1b3ba@spud>
 <20240223-blabber-obnoxious-353e519541a6@spud>
 <CAMuHMdXXWSfDrrQUTW54FFHN464efe+672jyCjqYw4jpSPosBA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6wRL8umIpjJ8SWNb"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXXWSfDrrQUTW54FFHN464efe+672jyCjqYw4jpSPosBA@mail.gmail.com>


--6wRL8umIpjJ8SWNb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2025 at 06:15:24PM +0200, Geert Uytterhoeven wrote:
> Hi Conor,
>=20
> On Fri, 23 Feb 2024 at 17:23, Conor Dooley <conor@kernel.org> wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >
> > These devices are regulators may need to make use of the common
> > regulator properties, but these are not permitted while only documented
> > in trivial-devices.yaml
> >
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> Thanks for your patch, which is now commit bad582f9879812bc
> ("regulator: dt-bindings: promote infineon buck converters
> to their own binding") in v6.9-rc1.
>=20
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/regulator/infineon,ir38060.yaml
> > @@ -0,0 +1,46 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/regulator/infineon,ir38060.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Infineon Buck Regulators with PMBUS interfaces
> > +
> > +maintainers:
> > +  - Not Me.
>=20
> make dt_binding_check:
>=20
>     Documentation/devicetree/bindings/regulator/infineon,ir38060.yaml:
> maintainers:0: 'Not Me.' does not match '@'
>             from schema $id: http://devicetree.org/meta-schemas/base.yaml#

Yup, and it is still "Not Me.". Shouldn't have been merged in the first
place (or sent tbh), but someone who understands and cares for it should
be here (Not me!)

--6wRL8umIpjJ8SWNb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ/lHbgAKCRB4tDGHoIJi
0jU1AQCsqiKWTaB3RtphflqxEMzhA5Q4kq+XEHvCauo/Jr1E5QD+JHeWzHkm9cx9
+/v2EKTCVexboj6QnEuDalRsgMlsmw0=
=MDyY
-----END PGP SIGNATURE-----

--6wRL8umIpjJ8SWNb--
