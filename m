Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E019D261362
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 13:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749646963; cv=none; b=tdUpG6ia8T8qA7iwsQu2DEBjAjEkErB/iBjlyIV8q/GTHHc3B0basbgZhJbXG89qpztx/wznLHZDRl5dCBgUpgvFhC4Mx8k+GJKN1IysEeoYD6Ce6bRXJq4CRa9H1zdXfHIfw2/vt0RyWyPWx2jJtbYcuShf5k2mZ58/VUHasmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749646963; c=relaxed/simple;
	bh=mPSaLB0O4YFKypvEUw2xr1HF7HiKMj7ghM8XCkascqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZZCoDSCRwqPKEVsPkDV4j4zUSySBndSG2t3SBH/lzknQYFloto2RkuNbdvDIMu7PGQu3/2RxgEGR+hGkgQdZKLGgTdMOP9fDWJRVfXlzLrSbSXP/w7UpfVLDADZuO/EwaK1UHcnGT83UI2KYCcUoT8HdHSe992hE3uglnKec7EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bTum4QFi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bTum4QFi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FF9AC4CEEE;
	Wed, 11 Jun 2025 13:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749646962;
	bh=mPSaLB0O4YFKypvEUw2xr1HF7HiKMj7ghM8XCkascqA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bTum4QFi0Ja6rGHlIiaXajUns7aQUJyHvQcI8Go2nEAkykZsm3LJmhYfB2H6XLTYm
	 QIEgUDiGFKw+Zrw25JNZ/eZIKgho+dXxOSjrFDFhxbdF1bPgiVv2NT0uKie2QukNlD
	 xCvMAUKtNWj9fxRqHZL4EXSw6pecBC8XyWsEWX/rzIlcA8j+OGJHoIArqN4+0FAG9+
	 yPzj9gU/GF52S/eFesEUkeeAsJhUsjrp+PzbE6OwvKLxJX3J7E5gZsyNqjF6Oqb1vr
	 y0aXh1Kng6N/PNiohKoNK7aTaHROoY4IEfjAv1Tt799bzRGf58B3f5yc7u2w8L0iqL
	 /cx9xVHVZZ8AQ==
Date: Wed, 11 Jun 2025 14:02:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, pcc@google.com, will@kernel.org,
	anshuman.khandual@arm.com, joey.gouly@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, frederic@kernel.org,
	hardevsinh.palaniya@siliconsignals.io, samuel.holland@sifive.com,
	palmer@rivosinc.com, charlie@rivosinc.com,
	thiago.bauermann@linaro.org, bgray@linux.ibm.com,
	tglx@linutronix.de, puranjay@kernel.org, david@redhat.com,
	yang@os.amperecomputing.com, mbenes@suse.cz,
	joel.granados@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 7/7] kselftest/arm64/mte: add MTE_STORE_ONLY testcases
Message-ID: <c613b941-063e-450f-a38f-c16248e95e81@sirena.org.uk>
References: <20250611094802.929332-1-yeoreum.yun@arm.com>
 <20250611094802.929332-8-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kfXM4mrCaBVYOJD6"
Content-Disposition: inline
In-Reply-To: <20250611094802.929332-8-yeoreum.yun@arm.com>
X-Cookie: No skis take rocks like rental skis!


--kfXM4mrCaBVYOJD6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 10:48:02AM +0100, Yeoreum Yun wrote:

> @@ -144,7 +178,7 @@ static int check_file_memory_mapping(int mem_type, in=
t mode, int mapping, int ta
>  			close(fd);
>  			return KSFT_FAIL;
>  		}
> -		result =3D check_mte_memory(ptr, sizes[run], mode, tag_check, atag_che=
ck);
> +		result =3D check_mte_memory(ptr, sizes[run], mode, tag_check, atag_che=
ck, tag_op);
>  		mte_clear_tags((void *)ptr, sizes[run]);
>  		munmap((void *)map_ptr, map_size);
>  		close(fd);

check_file_memory_mapping() looks like it also has the issue from the
other series with skips being upgraded to fails, looks like there's more
instances.

> @@ -106,11 +115,11 @@ int main(void)
>  	int i;
> =20
>  	ksft_print_header();
> -	ksft_set_plan(5);
> +	ksft_set_plan(8);
> =20

This should probably have been ARRAY_SIZE() to start off with, sorry.

--kfXM4mrCaBVYOJD6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhJfmoACgkQJNaLcl1U
h9BhCAf9HHfyEm6lx/QcH1cq7zU7HaQjxqIgIbv0jy3orlOnCpSDeHnMV+ugDfPJ
eaewrydpOczLgRj7uAhpcPcd7EvP5pIMJwuBBnK/q8ojxmWzcBKMLKcE0Sq6l6eR
w+RGsn0RmgBteHcOAM72MT/GyJ+94VIhlC0Yw/SzBsebOM6tdpI1GQ7QrG2XbkC0
7Y3wsD38xajqLRak2GD2jrxMPG86G1WJyx7NIhE+cnfWcaWCNMTcYjSc98pozrlo
t0CjVPxZ/m+EwrXjwFKbQra/1YgpezOtQassGUkiDvEAdPr6mQIRAHNCvB2A/AiW
BC6NnmkMJnziA4pt7FJwRqCLePA0PQ==
=s4ow
-----END PGP SIGNATURE-----

--kfXM4mrCaBVYOJD6--
