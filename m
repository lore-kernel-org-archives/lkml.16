Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F58922B582;
	Wed,  5 Feb 2025 10:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752820; cv=none; b=l5fShC7DFQmPO06Kg2BsQ4rvBtx2AL1T7kkAlPDd3uKuRsjBqjwc96X0JVZ1K/ghDWy7efiph4rl6WKw9h0aQ4QbA4fc5KLvoUgdkbyQbiv6Tk7VLPJGQriTk5Bg+rCIs1pR/oMMaUokcQ2LfFLFyaVr5FXl50I5Q+c7jIxdjBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752820; c=relaxed/simple;
	bh=T+3gl+VSZ+Qi/d9r3WJTd8uqTFyuJiVzfw6RNe53BYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NTObMZdLdM1Q298oljaXS+DALL/A5KMk8WMWPcUC/bqGgMH2LDOOVsw/14/+N+ZL0Xa065hgiEGYOIwiQGao3hvS06vvhuo6KJMIlLRL5jcybiYJWLTER14HmDpQZaD9p/vWO2M806UDLqPafo9v82eV8yL2fMiKOfqX4zUGerQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iDd3SGBL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iDd3SGBL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E04EC4CED1;
	Wed,  5 Feb 2025 10:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738752820;
	bh=T+3gl+VSZ+Qi/d9r3WJTd8uqTFyuJiVzfw6RNe53BYQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iDd3SGBLbf6wfwR52kJbJY2t3d5Q//YmuOtijtnJaovsfUADjETr5rcQEVkg/fgT6
	 yIYkpvYhOp1XZ61+yyDUhog3aPmXid9GDgs4I0JTSmEEss2ktIs6XFnhpejfbARPVg
	 vy6M7pWW+NPFSU1n4+UMFCUmUXXe/Ipt8VRt6HJ74GroO6qfoPeeX6Qzt7ii4gL+/A
	 l6UIEtQmS7zhPC67+PuKex27eB65jAXN4qpnz6PX7z1J5pyY3zGFuBwxH/cyHw/DOT
	 V0eZhv1ixc50zFyAQd6YobH4WH3/PSXTHC/vLYH+WZle0pieZEONIwfPfLOh/U/Oxy
	 2A8tmPpkxkStg==
Date: Wed, 5 Feb 2025 10:53:35 +0000
From: Conor Dooley <conor@kernel.org>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: E Shattow <e@freeshell.de>, Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 5/5] riscv: dts: starfive: jh7110-common:
 bootph-pre-ram hinting needed by boot loader
Message-ID: <20250205-tricky-passport-b786aba90241@spud>
References: <20250203013730.269558-1-e@freeshell.de>
 <20250203013730.269558-6-e@freeshell.de>
 <CAJM55Z8oWonQBbUHPbMrVmN2HG9Dwjyr6o7L7spJQFhQfj+7Pw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TQwBxH4NgmwT3RhR"
Content-Disposition: inline
In-Reply-To: <CAJM55Z8oWonQBbUHPbMrVmN2HG9Dwjyr6o7L7spJQFhQfj+7Pw@mail.gmail.com>


--TQwBxH4NgmwT3RhR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 05, 2025 at 02:35:42AM -0800, Emil Renner Berthing wrote:
> E Shattow wrote:
> > Add bootph-pre-ram hinting to jh7110-common.dtsi:
> >   - i2c5_pins and i2c-pins subnode for connection to eeprom
> >   - eeprom node
> >   - qspi flash configuration subnode
> >   - memory node
> >   - uart0 for serial console
> >
> >   With this the U-Boot SPL secondary program loader may drop such
> >   overrides when using dt-rebasing with JH7110 OF_UPSTREAM board target=
s.
> >
> > Signed-off-by: E Shattow <e@freeshell.de>
>=20
> I can't find the booph-pre-ram property in any of the schemas in
> Documentation/devicetree/bindings. Does make ARCH=3Driscv <..> dtbs_check=
 not
> complain about this?

They come directly from dt-schema:
https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/boot=
ph.yaml

--TQwBxH4NgmwT3RhR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6NDLwAKCRB4tDGHoIJi
0hNrAP43qtVDHtQj36YwYboLuBOirdtkgVN1fUhOnVEV0Y1ATwD/YYP2G1xIul75
f6agMqEHmTC28/AhY8PcgE/JUQIWzgQ=
=y2pN
-----END PGP SIGNATURE-----

--TQwBxH4NgmwT3RhR--
