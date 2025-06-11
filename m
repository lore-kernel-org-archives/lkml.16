Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2901625F960
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 13:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749647448; cv=none; b=cY2UjJyx14G6YWnFUpgi5JC+mq7ns40g/c11BvBo75gTo/yjtvuxHkEN7rTbVwjclFXcycXpXBnz3Ym5ady8gkGqP7iLRjs9mB6B3ZefNm1Ey/nVeA1Jxx4bXvTJ2VDITmUGuf1dnM5WdeE7CqiSQ+pIQYgz6iP/qJZig3LG6vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749647448; c=relaxed/simple;
	bh=Z2p+EaCVvCC5rA59Eoy55kVZTXGrjuA8oN2F6ylO3Fw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mIF7+NdI+Mdr9bG239jtXSO/e971VAP54uIysI7IUaZ8kcoql2MknBJNNegWbedqQLiY4lilY2G1vph5jSaL+nP44f0o70r1oM1nKdfb1YtxkgbYoLrWzuWyHBLpPPtW3Sq0sDRic8bmOsDxCElaoHO7lyybVwi80HEsfCasTjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rc8Ml1jN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rc8Ml1jN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F178C4CEF1;
	Wed, 11 Jun 2025 13:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749647447;
	bh=Z2p+EaCVvCC5rA59Eoy55kVZTXGrjuA8oN2F6ylO3Fw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rc8Ml1jNJ8Odiy4dTo8yxSiK7T7KD4cboVLSHQDW6uxl8b/tDTrFh8k3+nMtfbtBw
	 0WgK6bv9kgN+W/zsDLoXZJlQS7DHDENpGzjid/XsAAGB6DcR+xXMcTPc/tG4E1ATru
	 UQpNfjLkgEUtMcaY+MTBA3Pid+4NOpfgZpJXcZqVnoB0FtvkVzJZMdLnZynFVNKo0l
	 XXsq1n4ojRijNMiIBbVLXCw148OL+6f8J7TTxJQO5bgyckGTxznCmDgysNR+B6OKcA
	 IaG7GDcUPe+jdqy4eTOLW5yRxE9etA4wqu4rTPVfZk1arM9wPxIEaf19QtNCCHaNnT
	 4X5zusZzPKG6Q==
Date: Wed, 11 Jun 2025 14:10:40 +0100
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
Subject: Re: [PATCH v5 6/7] kselftest/arm64/mte: preparation for mte store
 only test
Message-ID: <87931a27-36e4-4c6f-b97c-206493ec3da0@sirena.org.uk>
References: <20250611094802.929332-1-yeoreum.yun@arm.com>
 <20250611094802.929332-7-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TJDJd5eGbyHdjCVv"
Content-Disposition: inline
In-Reply-To: <20250611094802.929332-7-yeoreum.yun@arm.com>
X-Cookie: No skis take rocks like rental skis!


--TJDJd5eGbyHdjCVv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 10:48:01AM +0100, Yeoreum Yun wrote:
> Since ARMv8.9, FEAT_MTE_STORE_ONLY can be used to restrict raise of tag
> check fault on store operation only.
>=20
> This patch is preparation for testing FEAT_MTE_STORE_ONLY
> It shouldn't change test result.

Not verified that that's the case but from inspection:

Reviewed-by: Mark Brown <broonie@kernel.org>

> -	mte_switch_mode(mode, MTE_ALLOW_NON_ZERO_TAG);
> +	mte_switch_mode(mode, MTE_ALLOW_NON_ZERO_TAG, false);
>  	item =3D ARRAY_SIZE(sizes);

I was going to say on the other series that the boolean flags are kind
of awkward from a readability point of view, but equally it doesn't feel
worth it to make these arguments enums so I'll just mention it but it's
fine either way.

--TJDJd5eGbyHdjCVv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhJgE8ACgkQJNaLcl1U
h9CKygf+OtfW9Ek6HiQhh2kbGskJ+4mpCZoWK4EZTQDwrvnd7WBe0Ax4Lpa9Ond9
BBOt6hXXbnLMLnQv4s3p+SfX/bt8+tlN1sS//m1N7ciUSBKoUpJvc1nEJNtd6ECZ
rIWIiqMO93wMQoDTTX2/YVLm9ybiH6pc6yIALEdmzFIPOCdUaFF1xynz+FTRvINp
3jLrqhxPmumnhRaGuSf0XYp5EzLPT6qeSa56UGFCg8Uye5CZLzHGujzqV8ZtyVwY
UkYWCpxXvXAK14XzMqjfm56sJ76w0aT3WTJGGwXVG3pxXQ54wS5owjeZS/U7lbDX
0PqEG0JDWCo8VeRv9K0o4htJdHtIrA==
=VY3F
-----END PGP SIGNATURE-----

--TJDJd5eGbyHdjCVv--
