Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8A2188CC9;
	Wed, 11 Jun 2025 15:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749654869; cv=none; b=uzspPouu4Dp1KxzGPYDvfntPmACi6SOAXeKEMdVBFfLtjzAmqDp+itcySzKVkWPBguueAPOy7WkJp2VJ9PjGWA+Arys3ZkTXs9Yn5xb7EpXU3VRXRkVIufTbrm4eKk3+W4/IfuYUdQuFsu/u8bpMm4pU5ei/cFmZquoQafuVn2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749654869; c=relaxed/simple;
	bh=8zfSXXFV1xgQJy1mUdrZsabuC4LujniNvHm8OnpJ6Zo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E9OaWRi2R6wx+DeD27KEY+8RC7gaKmmuHLeA/1W36mW41AfokHLoxP7iKqOJ94r0zbABNx5EatC3RJ35QLADEqjYXNLZ7QKELIiiqEyDlVp6eC7JeZUPQDKXV4KTNmxhN9edt6m6vwDseA+658wn+moAUomcsBi/z879dDqQANk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z0uCF56r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z0uCF56r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73C14C4CEE3;
	Wed, 11 Jun 2025 15:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749654869;
	bh=8zfSXXFV1xgQJy1mUdrZsabuC4LujniNvHm8OnpJ6Zo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z0uCF56r6j27XgvKCyCizr6xrutKJGUpp4AcCHT01Rw2e/qrfgs/Rz0yVtixer5wA
	 NM4kEDqYDy6IBEPkT0fueSGEG2lVijkxx7FkcKeJ8KYVAtEKPspcaf4OL1hgJFEv/2
	 dRymKCmndm4aW1LSOrrxbtVnxKdcmxj8mx5nfgv+RYUgHNHQr2Y2O0yq+1nwUn6dxq
	 fZAXboHW54lLSudqtZQTyJQRvnCil1OPpdmtpSVAJFt1Q5cMOPPeUGBl3x02Rd4Dki
	 4DM5TwWiO5LnCO4Q1rk4WpGkXEKr118k+JydDJVFosiBFdVi6NNOHXDxYe9QJsEC7T
	 +aHrMIJWdwUhw==
Date: Wed, 11 Jun 2025 16:14:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, pcc@google.com, will@kernel.org,
	anshuman.khandual@arm.com, joey.gouly@arm.com,
	yury.khrustalev@arm.com, maz@kernel.org, oliver.upton@linux.dev,
	frederic@kernel.org, akpm@linux-foundation.org, surenb@google.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v7 2/9] arm64: report address tag when
 FEAT_MTE_TAGGED_FAR is supported
Message-ID: <9a78c058-2aeb-43d8-94f8-987507a1a9a3@sirena.org.uk>
References: <20250611135818.31070-1-yeoreum.yun@arm.com>
 <20250611135818.31070-3-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="llNME2sYZezlFhNO"
Content-Disposition: inline
In-Reply-To: <20250611135818.31070-3-yeoreum.yun@arm.com>
X-Cookie: No skis take rocks like rental skis!


--llNME2sYZezlFhNO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 11, 2025 at 02:58:11PM +0100, Yeoreum Yun wrote:

>  	 * The architecture specifies that bits 63:60 of FAR_EL1 are UNKNOWN
>  	 * for tag check faults. Set them to corresponding bits in the untagged
> -	 * address.
> +	 * address if ARM64_MTE_FAR isn't supported.
> +	 * Otherwise, bits 63:60 of FAR_EL1 are KNOWN.
>  	 */

Should that be "are UNKNOWN"?

--llNME2sYZezlFhNO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhJnU4ACgkQJNaLcl1U
h9C55wf/TdyfC/w7P1v4F0hQRmhNZ6ZT6FQpZRqi0HVD/ZBIHWgIpUenQ1p+dTrL
Yh9K8yel2k1AKNsrZwpcTYGX6EHG1e+cpxTBHRQ1QBAMjIZA4QGpUqmBLFv9HSa7
fQfN06W843PM4GCO8U94F7ovaj+Vtroe01uCZhkO0zaYGpuBppaL0yWKw88unErL
lRnHmzOy74Vip/f7zNEdXYscNcBrHQW9hIZj+RFi7sE9jykuCCxQlrT5kTNckmAV
BWwj7tCisc8IRj/ov8BRtANfk3BqZlLsHtBCkMUACdNCmnhATAbhkZa1tQUOsROl
q81tUHwm4zYBMoApcuEa4DSp2Ex73Q==
=6B4e
-----END PGP SIGNATURE-----

--llNME2sYZezlFhNO--
