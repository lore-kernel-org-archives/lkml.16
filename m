Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3173E248191;
	Wed, 11 Jun 2025 11:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749643091; cv=none; b=qthDskjTyKQWKIZK5qz0QhDmtpvecZ5EJCIRMfvf/kxK28AVB/Qr2+bAzRAOzmZRTy/gGgT8udUMwBPkuCOoj7HzY8+AMiuDn5kBwwPZjbudY8DQH/Q3I22LQhfeIIGq6V+GaH2w1SAE+FIGYsOXRyAS1hcOba+1wCq8nnB0+oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749643091; c=relaxed/simple;
	bh=lYYMfAjItLC4fLsRYmM8XcrT+WkhPcmAqDN2A8wwZbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nwl8k9cyVC1BS8/j7kO5suhH8rYAhamYlFwuX8ugv38ncm6oVuMGz5MUQdyYJDSS4q05ji/40VOrvgVfX3CVJ0pwGT8QzqFJjWMYov1Umql9EblQMqjDnGVnIPw62dYOtM24DmhhqQBRuX1Y5VxEA3xn10S9p8uk3eO1nTp5nLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PkSbiwVO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PkSbiwVO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB847C4CEEE;
	Wed, 11 Jun 2025 11:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749643089;
	bh=lYYMfAjItLC4fLsRYmM8XcrT+WkhPcmAqDN2A8wwZbM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PkSbiwVOZrbtfaxIHOhfWEaCd5XLI8oDnSHWJ+efp/sjm66ZmiBXgBBRycVgnUSgg
	 Du9hcEbUrAJCDLlE6ExgOHzVQuipmpGs6wQX7EOeMI5peGZUOkv++2keNUsy9/J/0k
	 7hYX+DuBNBhtCy2bHY8Ue9ZZNXRrN4dQE9E8r8cEASMA8gG7z9Fv9YLHi1puy5nzk9
	 wpndB4Zr718xZd8tK5xKbtbJCi84cY1JyV2oQWLAwt68eSxMx3tnnzXZ+NBUJLkqB1
	 GerpGtkII1SPdbOVo/se1l0BOUSa1ZPVrh31rqJEmcHf7Vn119gpLmBB6TAWmpEcfT
	 iPNAzCP6hULGQ==
Date: Wed, 11 Jun 2025 12:58:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, pcc@google.com, will@kernel.org,
	anshuman.khandual@arm.com, joey.gouly@arm.com,
	yury.khrustalev@arm.com, maz@kernel.org, oliver.upton@linux.dev,
	frederic@kernel.org, akpm@linux-foundation.org, surenb@google.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 6/9] kselftest/arm64/mte: add address tag related
 macro and function
Message-ID: <5e937cf0-3b71-4c17-838e-8b38595c153c@sirena.org.uk>
References: <20250611094107.928457-1-yeoreum.yun@arm.com>
 <20250611094107.928457-7-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0+qKX/eUD8jBDCqq"
Content-Disposition: inline
In-Reply-To: <20250611094107.928457-7-yeoreum.yun@arm.com>
X-Cookie: No skis take rocks like rental skis!


--0+qKX/eUD8jBDCqq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 11, 2025 at 10:41:04AM +0100, Yeoreum Yun wrote:
> Add address tag related macro and function to test MTE_FAR feature.

> +void *mte_insert_atag(void *ptr)
> +{
> +	unsigned char atag;
> +
> +	srandom(time(NULL));
> +	atag =  mtefar_support ? (random() % MT_ATAG_MASK) + 1 : 0;
> +	return (void *)MT_SET_ATAG((unsigned long)ptr, atag);
> +}

Ah, this is where the time.h inclusion came from - it just got split
into the wrong patch.  I would move that srandom() into the main()
function, we don't need to reset the RNG every time we generate a tag
and since time() has a resolution of a second depending on how fast the
machine is we might manage to end up setting exactly the same value for
every tag insertion the program does which would seem to defeat the
point of using a RNG here.

--0+qKX/eUD8jBDCqq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhJb0sACgkQJNaLcl1U
h9A+1wf9FqWnxRE/oTBDa+Oapv2ZOPq4qp6V+BctcWuI4/96XjoZ5VwmFrpEbyfa
oq8IZKJQh3Ab9MTvkzQBUpOQT6L6N1DWrmw9j92d1CZ/cCnsbhlECrthCfaAoxZv
fOp9mgm0d33GXm/LvKOMcwTEddRfA3INrDGPJlOfpU2b8fPJHztzpI656I3zz4n0
2n7EFIT/+o69unP5wgmvOcsD/GDXyJ8Vmaw1zTl8GyEonvvmCWSUt+jbGw2biY+T
KNdztBsKkxHQjUrgn8Aqf+QxEcaAuDwr0FL6+Mowa+wHlkEO9ekxCy6vNMAfjCeA
JWfGBw0pL7uQo3zM+Na3LFCkRoC+Yg==
=w5En
-----END PGP SIGNATURE-----

--0+qKX/eUD8jBDCqq--
