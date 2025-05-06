Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9213284B2F;
	Tue,  6 May 2025 16:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746548864; cv=none; b=Xl34nglt9h4uaiQtX9rp5RMrbqd55DvpKdIHJMDUgvOlMM17kSWY5fc5SwEuSTY5JZOeXN/O76biySJCYvL0A2LJO9hrrQoGfqS0Usy/3SabkLirSg7X0bTguPq3RYM1JfaP5rHdJxaW2Z/CzVo7bPPugW87kszDx+7KUeh92/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746548864; c=relaxed/simple;
	bh=wJl9fXyLBlj/alvhQ5nvzBTo2DX+kfoN+jfRteXdm2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iAcgnT1Bf3hpcxe2VDlgUELkt7iNENHYHlNPSC/prUFAt6JgCkigWFa7Lyv6g4U8ktXzl5FHazU29T65v3IjvYQ001Zn52HI8xuLkqDU1wzYUS10soLvhU/huy8ByJD3VpNkh5r7SZADxoU/iF1oYeYCFtmiAIA721hM3lSlb34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rhuo3y9T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rhuo3y9T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D61D5C4CEE4;
	Tue,  6 May 2025 16:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746548864;
	bh=wJl9fXyLBlj/alvhQ5nvzBTo2DX+kfoN+jfRteXdm2I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rhuo3y9TxDpq5ldZKL2HKkbwDu2AeBTHP5+/g7FPz5CgzrP4Ax9Es9tm6+hELS3AF
	 rH2Y6Ri9dyMKWLknUeYV5tzJZTv1zEjS5Dec1xZGAV7YPKFymJ04FcZYbZif7mRtZ1
	 5CVnTtkMyZa3b3yYtQc/339Uif3VQlInWZ/cktPdrwwWGo9jSYn5iIFCJ4QDNNQPQ8
	 c+5kNG2AmUWIk1LIpU9X23aswuxg8V6RkMRPcNCeZgO2ehWHHsIcDE9jAvC+L1xnS7
	 KVtf6jzmfVrP4LyO2/mKsI6gFJic2hF9X4zg/yhXFXprzsnXnhGK9QEzpUOU1b2nkG
	 RTs+bx3Ltd9Ew==
Date: Tue, 6 May 2025 17:27:39 +0100
From: Conor Dooley <conor@kernel.org>
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	tglx@linutronix.de, daniel.lezcano@linaro.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com, tim609@andestech.com
Subject: Re: [PATCH v2 5/9] dt-bindings: timer: add Andes machine timer
Message-ID: <20250506-bonehead-security-fdd71309a721@spud>
References: <20250503151829.605006-1-ben717@andestech.com>
 <20250503151829.605006-6-ben717@andestech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cHkgK4xVUxJ740D6"
Content-Disposition: inline
In-Reply-To: <20250503151829.605006-6-ben717@andestech.com>


--cHkgK4xVUxJ740D6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 03, 2025 at 11:18:25PM +0800, Ben Zong-You Xie wrote:
> Add the DT binding documentation for Andes machine timer.
>=20
> The RISC-V architecture defines a machine timer that provides a real-time
> counter and generates timer interrupts. Andes machiner timer (PLMT0) is
> the implementation of the machine timer, and it contains memory-mapped
> registers (mtime and mtimecmp). This device supports up to 32 cores.
>=20
> Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--cHkgK4xVUxJ740D6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBo4ewAKCRB4tDGHoIJi
0hwNAQDM2atqbPzuEVmNCgCayxvl4ixzEpqJu6dqfw41f5RJ5AD/fTboHXFJsmwG
tNcawZ/ktKYZjQUmN3Q2fvk7oKf8DQo=
=YvVt
-----END PGP SIGNATURE-----

--cHkgK4xVUxJ740D6--
