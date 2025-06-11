Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01CF2E611B
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 12:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749645987; cv=none; b=RmqFETEyG5g56Mk+Z1FZsOSQ5UsjyxBzszronkBcMI1CP7kjT7OIxBNFype0IOm3K81XsFuqk9e+MNDFaPmFi3GrwrCEkFdiokfMtrDKEuOtB32NHfaKMp4zJTdRUq3AuyRJtHTaAHcrXyZdLMm1HJsh9oQb80tT1C9ER+6v38k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749645987; c=relaxed/simple;
	bh=Pb53XUnfjjR6lu6hoIuxvpaaA+sk6sa2o6bpiQWtwic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kWA3nwvZ+9Dv/Rsigpi1l1n/lXfBvcCF16UJArzJW9aiNsjl5P19xZjRjl8mHpXofBqqWLNreHDnVqpoWSc6m4Nt7jHaX52aLFOn3oMzrAM9xEVGwAygwZ2sfHFLhvH1SR8xGVFImx3F9DJYV87dor8XErU6tNw4R+gvihxkV6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sKIDC+Cl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sKIDC+Cl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AD03C4CEEE;
	Wed, 11 Jun 2025 12:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749645987;
	bh=Pb53XUnfjjR6lu6hoIuxvpaaA+sk6sa2o6bpiQWtwic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sKIDC+ClSzn1Ua1TJS1YKb1AYW8i3qJyUvfyExo3patxL3XW7T+jXh5YussTiFqG2
	 B43K9L8yvRhKp8m+Hep7MpWOK7L+/di665cuzZXcLomtNqckWVFJ4oXZempFM8xgHc
	 QafHD1xrOPpKoKeXYnCbiNrcG/nchqCihZnDEIZPbUXAGVuOqibiX6QtGhJen8UO9b
	 YoRj+EG0UKkMPJy3ueywu2zKBfqekHCeE+IA6LVP5T1riNBuFzZRNVXbm1jZ6mcFul
	 0EbDrV4nrmrLZy4G3QUF8kzjxnoe9j1ULhujl1UGyGDmzZ4xJUHwHd/DDYyByMsZgT
	 JjlepvcpcRamQ==
Date: Wed, 11 Jun 2025 13:46:20 +0100
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
Subject: Re: [PATCH v5 5/7] tools/kselftest: add MTE_STORE_ONLY feature hwcap
 test
Message-ID: <ea71432c-edbf-419a-bb5a-37da5b09caa0@sirena.org.uk>
References: <20250611094802.929332-1-yeoreum.yun@arm.com>
 <20250611094802.929332-6-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="N9Jq5vTIEkplfAUq"
Content-Disposition: inline
In-Reply-To: <20250611094802.929332-6-yeoreum.yun@arm.com>
X-Cookie: No skis take rocks like rental skis!


--N9Jq5vTIEkplfAUq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 11, 2025 at 10:48:00AM +0100, Yeoreum Yun wrote:
> add MTE_STORE_ONLY feature hwcap test.

Subject line doesn't match the usual style, otherwise

Reviewed-by: Mark Brown <broonie@kernel.org>

--N9Jq5vTIEkplfAUq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhJepsACgkQJNaLcl1U
h9Ds8Af+PUYw26pjKbOjxWOkTwg8nU84B6wNH+uwRAbw+spY9QrvZMFxOQQrAS+8
IqFjS8WTVj4it9uLc8CaLN1vLnu7oCPpaXsEJiZQ4jrVQ1beIkvR+aBa4LPG0QRk
ylsYfQK0L3QcpEOAwV8HelLPqstHExzZc3GAFmbpa9Ml8WMEw+4DnnCzbFO6UWOV
I3Z7viptW8bgJgSXJR3uhhzDXi7hgUvT3TKATRyDgcp+NyWBxpevPnYiVWEhj6XX
sHjHdZXP1JRVPZI9S9oA2yE8yw6B/CoJsHFWDZhAf2FMxwdK8n5iz0DZgzk7HljH
UJZYVKNRSI63CtXo/bEOouObcSDI4A==
=EHzP
-----END PGP SIGNATURE-----

--N9Jq5vTIEkplfAUq--
