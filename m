Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C042505B3;
	Thu,  3 Apr 2025 15:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743693214; cv=none; b=MvsNk2L4aaVsJMB2Gi0bU4iTRocuvA7VngLtMloWr8ywSTDvwVMUJEquSxZdrDpRpt95q46So0aOp9b7kDUYAiAbmGLLQ1cbqhQ5gKzmZsqsdw3aWr4vDqwALDwo5jsolWnK++mNNwl2pH4cYZ7TAZfC93rkXOE/jGblBKFVLLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743693214; c=relaxed/simple;
	bh=nbiBXDXZAlOQvo10+zoofvtVEMUN+xY7qBqGVHhpers=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RRJA3yhyDjh7/v29lzsNJh9rksgke5i08FDicc8aff+LVCAqS7ZWojrJMREDqFMlkDYX9N6CRQXL2Y3xPF5N5zBBwKPViX3T/OvxhFFttxkCoZs8zSIMrhn7xdVWQLsCmyWhkfv2kr7cOcw0bFm/FnZShs7M7V5fQVuEc4il4M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZJGDlWGI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZJGDlWGI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA41CC4CEE5;
	Thu,  3 Apr 2025 15:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743693213;
	bh=nbiBXDXZAlOQvo10+zoofvtVEMUN+xY7qBqGVHhpers=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZJGDlWGIp+23uurxjtN0FzliArNVEFGXTjWhDmwmumYQxf4YwG8X1V/gDTSBeSAng
	 xK9QCLMq8OR0Z57WW9Y0yMUZsZwKqgJiGlvv6PGmSApSOOMIs7S4wvmE77eFgV3cGD
	 /5bksFqBt1wfCpxGAxdUdArvKPb0ngAKYR7iGJmbCAovdg6vYjd63rpR0VMfi28dGU
	 yAxdO3cQNZXt5Og7Q9Gyl/9rQu5o3UiejFQenpS6ZK3Oq1S0CsJTlGH/U6j9KT5Um4
	 nr8Nkioo6nmpPCC3TkBJ2pO6MrqM9YpRI90fTHJzkA95r3PCrn9O3Cpgb1JD3HXapD
	 qth2JFVXEfElw==
Date: Thu, 3 Apr 2025 16:13:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, anshuman.khandual@arm.com,
	joey.gouly@arm.com, yury.khrustalev@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, frederic@kernel.org,
	shameerali.kolothum.thodi@huawei.com, james.morse@arm.com,
	mark.rutland@arm.com, huangxiaojia2@huawei.com,
	akpm@linux-foundation.org, surenb@google.com, robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: add FEAT_MTE_TAGGED_FAR feature
Message-ID: <e397283e-4c53-495f-a699-16c2f556837f@sirena.org.uk>
References: <20250403141535.23496-1-yeoreum.yun@arm.com>
 <20250403141535.23496-2-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bl3Aw4IbGSVKLODu"
Content-Disposition: inline
In-Reply-To: <20250403141535.23496-2-yeoreum.yun@arm.com>
X-Cookie: Logic is the chastity belt of the mind!


--bl3Aw4IbGSVKLODu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 03, 2025 at 03:15:33PM +0100, Yeoreum Yun wrote:
> Add FEAT_MTE_TAGGED_FAR cpucap which makes FAR_ELx report
> all non-address bits on a synchronous MTE tag check fault since Armv8.9
>=20
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  arch/arm64/include/asm/hwcap.h      | 1 +
>  arch/arm64/include/uapi/asm/hwcap.h | 1 +
>  arch/arm64/kernel/cpufeature.c      | 9 +++++++++
>  arch/arm64/kernel/cpuinfo.c         | 1 +
>  arch/arm64/tools/cpucaps            | 1 +
>  5 files changed, 13 insertions(+)

Please also add this to the hwcaps kselftest.

--bl3Aw4IbGSVKLODu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfupZYACgkQJNaLcl1U
h9D64wf+Nr2Llm6/mPq6+NvuhzVcdPF1hydswJcaFKW0vvrsQNZ4lVoKSvIjEpQd
UHlSgRORZ7WqXD/8CYs3nqGOyESHVPG+lASZ+KVOjQgfdA/ASEPCkeJqnzmOODnC
Y8chXEeiY/mdbjpKYs7VhLrJq/W5GroettA59pxxDW4W04aEp9hNXDFABAUEQDnV
56fOv3kdPrm56oGB6CAeMtcEfK4VGjnPJj/tQ1aMuWxnKtlmDwIpUpsfH+HX+675
AFu56782gvNwKp9Fxfgc3SKDtZ3nGoyHHYPxzjoBpHYL/IckhFsjGVDPR6Dzbubl
SlQlNnf5roMqmEubfwaHKVrFsGi0yA==
=yyPx
-----END PGP SIGNATURE-----

--bl3Aw4IbGSVKLODu--
