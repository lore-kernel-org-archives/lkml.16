Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF01D2652B4
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 11:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751454982; cv=none; b=bZ7pbIzmZVGHS8YtVeuNj5M5N/cL0ui8KyZ9P+z/vicxDRhvH5wmeWdAuCH70ZzNyVuQW1QXieKgF9a8c4R5SbTdjL7ZlOZLmaFoCzrasemErG+5bW+lAxFSp3Czy0icl5dmrdiUcgxDVNyvq8r6WgSOX3l+vm7yQjBBJ1C/mrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751454982; c=relaxed/simple;
	bh=WLv6kMUNDvp/npyieXA0KsxaoL75iDkMGxmkeaZEDxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hZgxio6z5PDyh3ZAgsIExnXrFvxMcs+eghwJfxD5fpNQM/9uS1xNBcSWn++rD3jPsMmdHU/bXXlM7iUQKcgtsVHPL/1gWCIKAHfmdH9jJQno9NzWbrp56JYxdS86bpLHgl4fNCRjYxI8Dr8Vx4hr9xtZZmLtAeTeAeYpKuTn5hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=igw5TDlM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="igw5TDlM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B84FC4CEED;
	Wed,  2 Jul 2025 11:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751454982;
	bh=WLv6kMUNDvp/npyieXA0KsxaoL75iDkMGxmkeaZEDxI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=igw5TDlMuxL/IqSJWZQ26IZUTkyWBFkDpgsvTdtU0mIXalHQ6on7V+MIb9ZziMuk5
	 PE+M1wwvJpCyeWKclIXQCj7N342u0nMBZ1A/g4OoFaFzqbAwSLA2/fRNla/PtTyA8l
	 hdkvKi6jGpkR8yo78iQTNRrQv5wIzNY2xaVOciFq5qf/Szq/95Fo4NWoPYQxMNJWOj
	 YL6/xUVps3EfwODVV0hcxo5fWEjLFMfW+woeBYvwDhs9np5ontek5Nbj5yR2EUm0KP
	 lNf+UBvGS73Wv1QmBhAvwfwPVO4YlOognn+bZ7Y4ajwb4sA7V3Y2O/lLepxczLosqr
	 xocSD4R/uRooA==
Date: Wed, 2 Jul 2025 12:16:16 +0100
From: Mark Brown <broonie@kernel.org>
To: kan.liang@linux.intel.com
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org,
	namhyung@kernel.org, tglx@linutronix.de,
	dave.hansen@linux.intel.com, irogers@google.com,
	adrian.hunter@intel.com, jolsa@kernel.org,
	alexander.shishkin@linux.intel.com, linux-kernel@vger.kernel.org,
	dapeng1.mi@linux.intel.com, ak@linux.intel.com, zide.chen@intel.com,
	mark.rutland@arm.com, ravi.bangoria@amd.com
Subject: Re: [RFC PATCH V2 06/13] perf: Support SIMD registers
Message-ID: <69afb239-da54-452d-8ab4-2d80dbdf8dce@sirena.org.uk>
References: <20250626195610.405379-1-kan.liang@linux.intel.com>
 <20250626195610.405379-7-kan.liang@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PqM+omoIMPGPGl7I"
Content-Disposition: inline
In-Reply-To: <20250626195610.405379-7-kan.liang@linux.intel.com>
X-Cookie: You should go home.


--PqM+omoIMPGPGl7I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 26, 2025 at 12:56:03PM -0700, kan.liang@linux.intel.com wrote:

>  	 *	{ u64			abi; # enum perf_sample_regs_abi
> -	 *	  u64			regs[weight(mask)]; } && PERF_SAMPLE_REGS_USER
> +	 *	  u64			regs[weight(mask)];
> +	 *	  struct {
> +	 *		u16 nr_vectors;
> +	 *		u16 vector_qwords;
> +	 *		u16 nr_pred;
> +	 *		u16 pred_qwords;
> +	 *		u64 data[nr_vectors * vector_qwords + nr_pred * pred_qwords];
> +	 *	  } && (abi & PERF_SAMPLE_REGS_ABI_SIMD)
> +	 *	} && PERF_SAMPLE_REGS_USER

I'm not super familiar with perf but I think this should work for arm64,
it supplies the vector length through the _qwords and we can handle FFR
being optional by varying the number of predicate registers.

--PqM+omoIMPGPGl7I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhlFP8ACgkQJNaLcl1U
h9DGFQf/R5EGZ7vANuZCxohUindvxCaxIvxhOPVb9yu3A/75ATNrRK27Z4nqpooi
q5sfss5jo52540RFXz3J54jfId952YxC0yZMLGPhBFualjzstMCEiyjLzBe86MAi
1jKoU1gTdZI2iBpaVvT8bWKg80QnC/vqt0h7qbtxPCWGCuCNjMwsikWSkj60maYO
QF8TtrZQeQpyqprCVNW0kkzGT8kSV51oWohEQfg4S4HbfXmZKBD6y3CjMnDi9R28
aLcFA++/HYAFbvxx59aJEyBvkJfVi7tkxyjefs3kQQ69BDYmd0lmSGf07m2Aq7ba
XZ4ULQjOSC6gkzAg5p5jzmTZ3PJ0xQ==
=Tr1S
-----END PGP SIGNATURE-----

--PqM+omoIMPGPGl7I--
