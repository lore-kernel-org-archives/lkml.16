Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026672571A0;
	Wed, 11 Jun 2025 11:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749642204; cv=none; b=blGbV/5DImXiu4KoLtwdu4/80ZoTzxZGQwuwlacazUAV5YdCyL0DJT8a1+C032Bxrh23dWvnv01lYle2HSgNxPZZeNRA/KJD0ku//bwoxU0RUbe769dxdoSeL9dZmj2CN5EXG2QW6D3OyR/jJvSdF3tqfqFiMKlGZiQeB05M7/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749642204; c=relaxed/simple;
	bh=VtORa9gULIIxSrmzYE2nKZ6lSqCXmbEADc6P99tw9QA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ILNEl848nS2aGuQCAZ+f7+CfZgbuL1I+TzT3ZcXwoJ215XOBsL9tUr7S0bfq+R6P0AEC4tUr13E1krd1rlTKgeVk/Y+f+hjAi16M+/5Ngsz1loWjiuuENudbZUrGB/2fZJgS9BLdLbFpkBC/IW2AKnBWItphhAeO7V8lrYx3Ks8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VBlo25Bv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VBlo25Bv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3479C4CEEE;
	Wed, 11 Jun 2025 11:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749642203;
	bh=VtORa9gULIIxSrmzYE2nKZ6lSqCXmbEADc6P99tw9QA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VBlo25BvgjCTtX2YzIkubtVomP3UFvIlPOni6KAT2iaqyw0+rNOOgM/ZPl/fuHBvJ
	 6RUhLoAuNInQr/FBMX+RWik7oyFJ4KwkDbIMdqFWDfaPGcfFNs6vqlMdc5geOp1Ujl
	 FCrHNQtUTTvUg8occ3jpxoAIVnGwsjmbIPHHEIjSsMh6tsNYLL33XyJWgH9mPukgYK
	 hCYm0bezRR5bM1XDKENk3gDVdcM6xmivdsOEg/XJ+wiMB/PkzCPytMmHvseo0dSsne
	 uuGrlx1zIJ69ZAdr98knudftyVAnbpHr+F3oPh7UTtxBz4kbE8usaFABwhqFj1mliq
	 fumB5us0LDq2g==
Date: Wed, 11 Jun 2025 12:43:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, pcc@google.com, will@kernel.org,
	anshuman.khandual@arm.com, joey.gouly@arm.com,
	yury.khrustalev@arm.com, maz@kernel.org, oliver.upton@linux.dev,
	frederic@kernel.org, akpm@linux-foundation.org, surenb@google.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 2/9] arm64: report address tag when
 FEAT_MTE_TAGGED_FAR is supported
Message-ID: <c0b4dc8a-b37c-4e8e-be2e-bc8906615702@sirena.org.uk>
References: <20250611094107.928457-1-yeoreum.yun@arm.com>
 <20250611094107.928457-3-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Gb6T1JetxHXIds4r"
Content-Disposition: inline
In-Reply-To: <20250611094107.928457-3-yeoreum.yun@arm.com>
X-Cookie: No skis take rocks like rental skis!


--Gb6T1JetxHXIds4r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 11, 2025 at 10:41:00AM +0100, Yeoreum Yun wrote:

> +HWCAP3_MTE_FAR
> +    Functionality implied by ID_AA64PFR2_EL1.MTEFAR == 0b0001.

> +Applications should interpret the values of these bits based on
> +the support for the 'mte_far' hwcap. If the support is not present,
> +the values of these bits should be considered as undefined otherwise valid.

The constant is HWCAP3_MTE_FAR and the cpuinfo is mtefar:

> +	[KERNEL_HWCAP_MTE_FAR]		= "mtefar",

The reference to the hwcap should probably be one of these, I'd go for
HWCAP3_MTE_FAR since it says hwcap.

>  	/*
>  	 * The architecture specifies that bits 63:60 of FAR_EL1 are UNKNOWN
>  	 * for tag check faults. Set them to corresponding bits in the untagged
> -	 * address.
> +	 * address if ARM64_MTE_FAR isn't supported.
> +	 * Otherwise, bits 63:60 of FAR_EL1 are KNOWN.

Should this say UNKNOWN?

--Gb6T1JetxHXIds4r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhJa9UACgkQJNaLcl1U
h9CZqQf8C9c9a1CQGL/nyb8MDCIEwm3jBTstFRtDJlSPcoMRL/KcLTbk01sP2PWr
A/qdmt5qMlQKPwtnIUrzSIqmn96TTzCbJZWsn4C7fzrLh7jT+eD8GjXKCjF/Mkq0
uXfzVKY5Mcyn0H73gtKrRdOC9ng/Xn0xFolNvXYDZplN0VUHBn+Fj51XYzR1lMKL
9zNZry8Dc9mpHUgORCFt5gxud4Wph4lPnWPsCDI9zyXHw91xzzZAxqByLZ8d8vsH
Z5Rpe5jD6kMkoS2umJr5ZyENjqaPagxWY1IZa+C5/7xx7l8czKLWXy+jj7OG9lAr
G+4u3UauAv/tfBdOWi2iq6ptu58suQ==
=dyyt
-----END PGP SIGNATURE-----

--Gb6T1JetxHXIds4r--
