Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7969B2874EB
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 14:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749651292; cv=none; b=e4RP6IR4ezLLurjWq17Fqji9zwwLv62X8sGjRmghUwB+jHg7JVUabz11pGzzBpJYomOAjlvCuFw4i9pOJegrfiq/EZGSMa4oF+rQtzbAxyVZR1i5WL8ARSN4836lyPuyxMXxp90cRgRo86bc2j4a5TibA9CG/BqI0mGrJ41mSXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749651292; c=relaxed/simple;
	bh=cRDHd0SMxDu8sH1wYotu8sGdz7yzIzox5QZKJm1LQHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dTo3cPJgzsEy14OjyjIH8yUAJhryqUsTFLpbZjPIUUpqnKBLcbAoZ+I4yX+R/2RMJgVF8AWdhrakmqCAXhvCekGiaPQlBNqAknG/oRazW6PXaMeduY7jYNrhsxjbe4Hc3EWSKy9Gb1a8lyOYM8g3Kg241BU0dsE8iiKqv9x3Bhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mCmuawCh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mCmuawCh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B27B6C4CEE3;
	Wed, 11 Jun 2025 14:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749651292;
	bh=cRDHd0SMxDu8sH1wYotu8sGdz7yzIzox5QZKJm1LQHw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mCmuawChcdqRdwAkPm4jhPIy665Rxx6TdREd5RlZDR5ccoBbKUFGQpPO/Hgzy2J7+
	 c1lwCZn9Ui/z0p+lFGcoDCxz9xmrsPIPPqDfUF4rzRRckdn0y9UKI1EwrR7aDa/+8/
	 EtwxYhO27sfSo+he1rtJQNCuxu7bj9mWM1Oi+CDOxyOV2Z20SX1T0E3XafYUAi026y
	 aEqteOH2s3eT/TYnHVUK3mifK+CD1DXRVmJ6Ik86vz5vP7mRZdnzHsWBWsflpgdjox
	 H92WsTBhkMWzGQZVun7SIQ+kmv0GwF6xL/eJeer8bC24qfF1xIgi0OqsESU++2TsIF
	 Sq82BLwmrIiRA==
Date: Wed, 11 Jun 2025 15:14:44 +0100
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
Subject: Re: [PATCH v5 2/7] prtcl: introduce PR_MTE_STORE_ONLY
Message-ID: <7f9d8b40-3e01-4d83-b6e8-0cb2cdeb8fd6@sirena.org.uk>
References: <20250611094802.929332-1-yeoreum.yun@arm.com>
 <20250611094802.929332-3-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WLkaznFp6D9YkjJU"
Content-Disposition: inline
In-Reply-To: <20250611094802.929332-3-yeoreum.yun@arm.com>
X-Cookie: No skis take rocks like rental skis!


--WLkaznFp6D9YkjJU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 11, 2025 at 10:47:57AM +0100, Yeoreum Yun wrote:
> PR_MTE_STORE_ONLY is used to restrict the MTE tag check for store
> opeartion only.

Tested-by: Mark Brown <broonie@kernel.org>

--WLkaznFp6D9YkjJU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhJj1QACgkQJNaLcl1U
h9Bw5Af/XdFp939N2wucEqYWmTgJRZo67n99s5HUufuQy9VuRp8hvczjeAs6Kkx4
GxXiaPopZ8T4BbO4Dcg1jX/NcHqJn7JATKxyQqYXsxOZHD08QzPJhdNNakfX4DjO
4/YbkM9X8uM+cI1kcyFsTHSpmkx5gppfZS9ZfKUoAPHEg8xlQVrWYjn9z+5bw/Q6
5IWN57yGPSalnTxCOwC9w9tPRNpiDpoy4/1odxFGTmH6UsYABrfaprcBJjGm2t6O
5SLrAW8VNJrnDbIezM92Zq3GEa2cLUUUJLs4mld5Z0gGbgL/XfJglpPzrfX0p7rl
oN0TrmhTKHyH+xS48CG//DZ5mvzVqQ==
=1ld8
-----END PGP SIGNATURE-----

--WLkaznFp6D9YkjJU--
