Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587742040B3;
	Tue,  4 Feb 2025 19:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738697300; cv=none; b=QVsymst8dt/QvzeMt48UXH7+D1uVsaC0tUG05Txi8mcrfXz7zfDruv0lABVYicEnql23eX+VrhIBBr0CvcaGXcNBLw0PHdHkSBbsrI2JEATYZkvUf5iVKlJGan8r3jjO0pYY0L60gTENqlyobxr/iPajYs8rfQ72hV8gC612o1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738697300; c=relaxed/simple;
	bh=payM3Lv0i2tFvtWvDl+mDAKVdtJ2xzD5z915sZ87mYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eusaGo3g3n86/jy+WjjCjn2h3FjxMFueL3bvOlwlQS6q7GITEmEvDjKbsNgcjE+hj7I8H2Ss6YGXCBds2eCFymX7u0mDvtQgCjJaw20WYkAqimSssF82LVvbqy7LqGLT7UZP/fGEhEEl8lCaSZjIqyv9M4kmKbM9F+wUdGn7ILU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JlBxqcOv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JlBxqcOv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CD53C4CEDF;
	Tue,  4 Feb 2025 19:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738697299;
	bh=payM3Lv0i2tFvtWvDl+mDAKVdtJ2xzD5z915sZ87mYA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JlBxqcOvfeSKjGTyrXHq2OUXcbNTe7hFhrMrHfk2gMRrSHXyVv01XMrWEVwUFFrj0
	 IRONpv9NOGWvsgRhCuyYaB/cGcpNML15JDbRoR5WWuwqSX2E8xII3dZPg2a92osys7
	 yoPvTrpxCLGiyG9xbXL1ODndgIPRgSJp4zge2DI8bHvj5FwEE9fVstdSLxN7K3BD+G
	 5wXKNXjp1v+Xtg8wVBj2YMNBuMfD2S1JcB+CBy+JyNaB18JIbJl7tkd685xMZDaLiw
	 9KTJ9D3Kv9wah1hSom4WKjnfVWI1m+livcPswyoQMyOhFGjpW33lfHAipZ4U6HnH+n
	 a18+G+46kmu1g==
Date: Tue, 4 Feb 2025 19:28:15 +0000
From: Conor Dooley <conor@kernel.org>
To: Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, monstr@monstr.eu, michal.simek@xilinx.com,
	git@xilinx.com, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: Add new VN-X board description
 based on Versal NET
Message-ID: <20250204-vitally-catering-7006a7c6c1df@spud>
References: <cover.1738657826.git.michal.simek@amd.com>
 <6e4486141cf9b1d36b03624cc73621b2e3bba894.1738657826.git.michal.simek@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rihF7DvlGIW5aR1L"
Content-Disposition: inline
In-Reply-To: <6e4486141cf9b1d36b03624cc73621b2e3bba894.1738657826.git.michal.simek@amd.com>


--rihF7DvlGIW5aR1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 04, 2025 at 09:30:32AM +0100, Michal Simek wrote:
> From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
>=20
> The Versal NET (Networked Adaptive Compute Acceleration Platform) from
> AMD/Xilinx is a next-generation adaptive platform designed for high
> performance computing, networking, and AI acceleration. It is part of the
> Versal ACAP (Adaptive Compute Acceleration Platform) family.
>=20
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> Signed-off-by: Michal Simek <michal.simek@amd.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--rihF7DvlGIW5aR1L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6JqTwAKCRB4tDGHoIJi
0g4uAP9NqvqiRCTrc4sSRsD1Ar/ITRdkdCG5QK+HJofHimbPaAD9GQoMS2RdTGPX
WUyBpEzXaR1CSHZCIk4qZYHnkiM2/wQ=
=gypN
-----END PGP SIGNATURE-----

--rihF7DvlGIW5aR1L--
