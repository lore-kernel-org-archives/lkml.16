Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC00142E83;
	Fri,  9 May 2025 14:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746802662; cv=none; b=mszd/k5yWFeFhbuS6nlXV1LXLVfXa9RoKWpHi3JJc0rAaEtHjApHUXoRAQY+V3JlgvmRrgoW/qb+halwmfcT21YORiLS4iwJtsdnU3cQ1EEZ6ftL1Kg1AgfWbP5tIT0Zju6hgCZROfrnsnblS+eSNsU1FWcC6r1F/iIqPn7iIJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746802662; c=relaxed/simple;
	bh=2ULhiX/sx2ZhXn330YQk4+98fuJt2QBfaxpf96HwbhM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V4YVSPrKEDySmxLaGoGtvS655rFLn2qww0W9wum9Q/KHM3Yec0bu2SCfs86C9s7rXNQGhDt18w8A0Z8XJPUj4m52X5cngev1HPDh9zGR8ZbS+rHBbngIWJ3KQKGOZY4ZkmwRpG7laqEJaG1Yf2sd0V07NC2YMSSZQCQrerhnivU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qtOyIt7r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qtOyIt7r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAA72C4CEEE;
	Fri,  9 May 2025 14:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746802661;
	bh=2ULhiX/sx2ZhXn330YQk4+98fuJt2QBfaxpf96HwbhM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qtOyIt7r63xVa2TFttLbLYvhxW/5E2kNkFc4HgmSapbfi7jbggZgcq5YqP3yC3DCT
	 ADIGRaLdWN5Cd3Ga4+CUSd9P1FJ6QnU+WG0oseq+H59A3UeRxB/WivhQAPs9eJBNM9
	 3q5QGUm/ju2FQJT3QqmXlvcWf8NYQTpIQqll3Qo78SihOzCANPTB2pZUksXpO11rli
	 T0+beAGs2FDsgRFnj41eloL6g+tj18BIu9fwkjhJmV1NoSObduVSYQaanA2pHC4K3j
	 06TFVSva+FZ7dvcajGbcBrlpRcnU1d4FmyZ8dn1YVr5SOV5Vev0xmo+zokVgcO03wY
	 Bh4s5Epe00t6w==
Date: Fri, 9 May 2025 15:57:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	tglx@linutronix.de, daniel.lezcano@linaro.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com, tim609@andestech.com
Subject: Re: [PATCH v2 6/9] dt-bindings: cache: ax45mp-cache: allow variable
 cache-sets for Andes L2 cache
Message-ID: <20250509-anatomy-marry-a4e1513c613e@spud>
References: <20250503151829.605006-1-ben717@andestech.com>
 <20250503151829.605006-7-ben717@andestech.com>
 <20250506-clammy-punctuate-6cb07dd0e81e@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xZGzDY3EIIpq4MLF"
Content-Disposition: inline
In-Reply-To: <20250506-clammy-punctuate-6cb07dd0e81e@spud>


--xZGzDY3EIIpq4MLF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 06, 2025 at 05:23:21PM +0100, Conor Dooley wrote:
> On Sat, May 03, 2025 at 11:18:26PM +0800, Ben Zong-You Xie wrote:
> > The current device tree binding for the Andes AX45MP L2 cache enforces
> > a fixed number of cache-sets (1024). However, there are 2048 cache-sets=
 in
> > the QiLai SoC. This change allows both 1024 and 2048 as valid values for
> > "cache-sets".
> >=20
> > Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
> > Acked-by: Rob Herring (Arm) <robh@kernel.org>
>=20
> Applied, thanks.

You know what, I am starting to have second thoughts here. Why does the
qilai not have a specific compatible like the plic etc? I think you
should have one, and only allow the 2048 cache-sets there. I'm going to
go and drop this patch, and please do that for the next version.

Prabhakar, should we add a specific one for the rz/five too?

--xZGzDY3EIIpq4MLF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaB4X4AAKCRB4tDGHoIJi
0i+qAQC9iBtavy0hTp+A64DvVYTEh716pjoR6R6D8EMqDgbsuQEA5A0t5+8Bvqs3
WbNQu9XqKvPxbXPdDeX4CzuUZJ+1pQU=
=n5zh
-----END PGP SIGNATURE-----

--xZGzDY3EIIpq4MLF--
