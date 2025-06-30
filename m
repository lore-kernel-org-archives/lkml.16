Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1ED919CCFC;
	Mon, 30 Jun 2025 13:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751289084; cv=none; b=jNm5kEnZqSKm16ezCy/Nl23MDuXhiJdBe691zD0wm4vmx5RuW05B3urPy+6wpVVNlV8g4jENPOPyhoUVPUKnIv2FCk2kKRG2MQnk4JNCUX/Z/T8KFZjuvw7j+0SaK9QgtVO+PAld6djcXJAbXenUxb7tIw893kourWBU4QXjx4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751289084; c=relaxed/simple;
	bh=8r0GBIOm3yPi2xNQd1i8+zEp5Erb3ctYSKBtpm0aHWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nUdjasus6KOdLGznFu1XpSmifBKxOQmMp4xvrKv8rk4zSGc27SYBuzruQ44aX6fjelQy5f961x5p7hKysU+MsVLNh/6MNoH65G4syfY9PbTkwhyR0B/RcHRb812G3prH1PzSaAMr5jTYNS2XG1D2EQA3sezgxAuWvJ617BekH80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iJicIwwI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iJicIwwI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BA68C4CEE3;
	Mon, 30 Jun 2025 13:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751289084;
	bh=8r0GBIOm3yPi2xNQd1i8+zEp5Erb3ctYSKBtpm0aHWk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iJicIwwILDJwFVGSN44LSoIHIdKYzYvFtOE4/hYZg52N2WNY+a1gmJlln0nov0jNk
	 o7OojSZZAN22eTV/8a5G1Lh6Uweqi8K61BoqM0w9YZgYbQsaJcRTCGyAdlpPPnbbyW
	 IGCbVdUXdLHGPaKQTgnRGClKwj7UgY+D4CLfSEguDhlWhx0E7s82rjU/O/ytUhlPtZ
	 8oiBLoJJgpmrSSEZ5aofdnSLSOyljuNJg/5RCP0iyyJAVu0xavSHvL8IJm6lEoUBkW
	 7jcnSOG5VX3xwMBhEice05ROrPbu7zSsPGZBQEMM+JpFY6GyN9cSeDq/Vb1BaYLIvZ
	 EVt6Hv7Z7uRew==
Date: Mon, 30 Jun 2025 14:11:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [RFC PATCH v1 0/2] Introduce dummy regulator consumer
Message-ID: <9e3a4a40-a647-4215-a3d0-4e82d9396fc4@sirena.org.uk>
References: <20250607212654.126412-1-alex.vinarskis@gmail.com>
 <8a688e9f-012e-461c-a916-f06b34fdd913@sirena.org.uk>
 <CAMcHhXpVKaWX8guog_M+5wHfJ+6uxBteNnV1xCjcDJuGFWOCkg@mail.gmail.com>
 <b481298e-319f-41ce-8a56-e3f78b8649ff@sirena.org.uk>
 <CAMcHhXoioEJH+KnLYbXmnt5eyGT-tXg0-CzLQpvj=8Jy5sGXuw@mail.gmail.com>
 <6fcbedb3-eb41-449f-9b6d-10699153c9dc@sirena.org.uk>
 <fbccc241-f957-43cf-9aa2-120e192cad55@oldschoolsolutions.biz>
 <daf6ae39-3c5f-41a1-b061-498346de6fe1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zf45igFQJo0i+o9t"
Content-Disposition: inline
In-Reply-To: <daf6ae39-3c5f-41a1-b061-498346de6fe1@oss.qualcomm.com>
X-Cookie: Say no, then negotiate.


--zf45igFQJo0i+o9t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 28, 2025 at 04:35:32PM +0200, Konrad Dybcio wrote:
> On 6/28/25 8:14 AM, Jens Glathe wrote:

> > Just like dummy-regulator is an (undesired, but apparently
> > life-saving) solution to the issue of not having enough info to

Konrad, looks like your MUA has reflowed all of Jens' reply to remove
the line breaks.

> > vddpe-3v3-supply on the pcie slot: works, but no USB-A for whatever rea=
son.

> In this case, it's more or less easy because the 3v3 supply should
> probably be bound to the PCIe port (+Mani)

Right, the DT should describe the board and the board has a PCIe slot.
If something is plugged in and needs mapping that should happen through
the slot. =20

--zf45igFQJo0i+o9t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhijPYACgkQJNaLcl1U
h9B1Mwf+I0bmH1v6fK5UKuyEGxEoF86Wl2/wZ9on52flMX16hnfk0WCdo9mxFHO6
uUUhAFRTUK0SLrHTevLtsTqY4PZHMJj/q8g+iN+D+Q4A3+xkRdN7ecpXiC1sXzP3
nTJ5V3iBTE+BR3D+pezv39Z0+uACxABEKTwFl+zvxvjCBLwnkPirMZ/ss4WyCS69
zBRlhWsbkeXLKOTlJLwMYZnlHuXBmprZCoG22jMDo0V3m7BPIQ5OXoPPc/ELot8k
nFEX2CvC1KGp0BK47KyPCaDn34uhyaJ93uZgAbsYqZUswMTR+kELkCifwI0EHEYd
TwkHbuMkYCfWfZWDrjw+a7WVxMH6ag==
=jhfz
-----END PGP SIGNATURE-----

--zf45igFQJo0i+o9t--
