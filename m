Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBD622CBD0;
	Wed, 11 Jun 2025 12:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749644729; cv=none; b=nLdGnbBYjS3Le4mwN8+xzNK/hxINtTEv7Asm5qfJFWesissyCzqbmbLI2Unk+dgJbTy+n1thE+XeYqwU84oc2eAT6EHratL/TuwC/JLVPt2CLfKXSAH1ZvnyKftm/HrU4dGNjDjFP5790kAxfDt7YMNtFIuKGNappwsfPtcspbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749644729; c=relaxed/simple;
	bh=ya87dO4a/HiSj6eipOEqSoaBIE/2f6SuK5LxdImo3jc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F2WS2wisrytsvy43NRzHDPLEGPMLxKZ5H2suW5Nus66xgz1C/juUq1GV3wFkuIsGwMCucKqIMhOa7oidcrTQbT/ERLY9PsD9hBhnjc0tM2GFP3HEKZAW6gbDP2QMwPYl7bYqe9HCrfCRJqZcybaeHthvaEVfYKhFwtyAhGCry5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cXboh0x1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cXboh0x1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3A59C4CEEE;
	Wed, 11 Jun 2025 12:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749644728;
	bh=ya87dO4a/HiSj6eipOEqSoaBIE/2f6SuK5LxdImo3jc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cXboh0x1SuHRoR6mxmMtneC+3hObxIcavh8WW9PHLDCq/s5tnf0i7VSp4sZ9j/mE7
	 dicI6iGqpPOZDYitJxifSE2GxxZWOs3XB7E+kdQiInXFW+dfvEwlXEds7jJEd4YcpS
	 6etZhw9baEpBID3euUjcKhfIBaiPv10chFZiJfyeP3FvMh4EQ7OvjA4pqvtCqzREjy
	 pxJvt5cZwOB4k/4pKyS6Rchm8HnIY/NPWKYBQnkh/wzc2p8nOh+4erSi17g185e/SG
	 JhJVX0KtnsCI7DP4Wf/lX5yhCwX9vebm+ywwhzZ2jhBlHJ5avqPd1bYN/PBG/hujqd
	 xAca3Yjrzw/uw==
Date: Wed, 11 Jun 2025 13:25:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, pcc@google.com, will@kernel.org,
	anshuman.khandual@arm.com, joey.gouly@arm.com,
	yury.khrustalev@arm.com, maz@kernel.org, oliver.upton@linux.dev,
	frederic@kernel.org, akpm@linux-foundation.org, surenb@google.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 9/9] kselftest/arm64/mte: add mtefar tests on
 check_mmap_options
Message-ID: <9a81979b-2b9d-4bf6-88a0-5803483f802c@sirena.org.uk>
References: <20250611094107.928457-1-yeoreum.yun@arm.com>
 <20250611094107.928457-10-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZxWWX4yq1T0f5i2U"
Content-Disposition: inline
In-Reply-To: <20250611094107.928457-10-yeoreum.yun@arm.com>
X-Cookie: No skis take rocks like rental skis!


--ZxWWX4yq1T0f5i2U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 11, 2025 at 10:41:07AM +0100, Yeoreum Yun wrote:

> +static int check_anonymous_memory_mapping(int mem_type, int mode, int mapping, int tag_check, int atag_check)
>  {
>  	char *ptr, *map_ptr;
>  	int run, result, map_size;
> @@ -97,16 +106,16 @@ static int check_anonymous_memory_mapping(int mem_type, int mode, int mapping, i
>  			munmap((void *)map_ptr, map_size);
>  			return KSFT_FAIL;
>  		}
> -		result = check_mte_memory(ptr, sizes[run], mode, tag_check);
> +		result = check_mte_memory(ptr, sizes[run], mode, tag_check, atag_check);
>  		mte_clear_tags((void *)ptr, sizes[run]);
>  		mte_free_memory((void *)map_ptr, map_size, mem_type, false);
> -		if (result == KSFT_FAIL)
> -			return KSFT_FAIL;
> +		if (result != KSFT_SKIP)
> +			return result;
>  	}

This changes the logic to exit the loop immediately if the check passes
which doesn't seem like what we want, should we instead change the test
to be:

	if (result != KSFT_PASS)

which I think is more the intent?

> +		result = check_mte_memory(ptr, sizes[run], mode, TAG_CHECK_ON, atag_check);
>  		mte_free_memory_tag_range((void *)ptr, sizes[run], mem_type, UNDERFLOW, OVERFLOW);
>  		if (result != KSFT_PASS)
>  			return KSFT_FAIL;
> @@ -192,7 +201,7 @@ static int check_clear_prot_mte_flag(int mem_type, int mode, int mapping)
>  			close(fd);
>  			return KSFT_FAIL;
>  		}

Won't this upgrade any skips to fails?

--ZxWWX4yq1T0f5i2U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhJdbIACgkQJNaLcl1U
h9AceQf9ESTpI03oYV79ZBWSYTYktYpJpJCThnBIOdQEB+mQwDdhuDOrLIbso7bJ
GdlaFJ1NDJOYIVLa9jdfiG0kO2WSzq/yClIuGu/HubaKRiVwS0xcfbjfLO5KtrF5
kY1KJc7ZKqUIBA+Tbe/ntokLUqDnLuPgdINUBeSTuemBK9rbAQicUms0/ishICNs
976HinKbqFluPCrgcnVIsOoap5L/1A6ZTT8nAsnJLaK+BYTn/PGgNGgIX1NNbL7r
tX7//JsJpth6lfvUBklfvgM15FZWh+OSH6Zsm4uvML8qFgyf2Vy7CCntJ0XNIPdS
hrE2xe9NlVva3ernymzkyYMwmufd4Q==
=pXyY
-----END PGP SIGNATURE-----

--ZxWWX4yq1T0f5i2U--
