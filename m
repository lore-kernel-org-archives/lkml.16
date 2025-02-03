Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D65204C06
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 12:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738586734; cv=none; b=ETPa8nUaRXFLVdvBWfilEZr5azFQKaR7LDCq92ZhpUbbM1RXr1JzlHHE+/wl1Kw0Lby/idDnQ/DZYRMFykBK1O2/Bnr3GMNFzl2cGzrc7fNujYkCbZD/5H2t0RKfwNa6aT4AgJd9mL2vVQ0+HNy71huHpWGq4EXk1E54SG969Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738586734; c=relaxed/simple;
	bh=JcKUnVRFhfPWaD36cL9IKQUCv5Wo87ZOqrEyuwlx9+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bNXW4WPn41yoGEM6dGCT2mEHdG5GqWj9k/9k6MU3UtyQIU8sTZH6A7FsW/GKSxXA7usiDkKsZbjmiJvO70Dr4Z46cc9asLRQOfBw4zwBcZAaPii1hXi+KSmw7eXOIJ8HWZirTJzxkU5cNyxAsQa3BsDxg61ARDPAkSKqN26Ixdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kIphV+Uf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kIphV+Uf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC344C4CEE0;
	Mon,  3 Feb 2025 12:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738586733;
	bh=JcKUnVRFhfPWaD36cL9IKQUCv5Wo87ZOqrEyuwlx9+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kIphV+UftcbLoqbIt+vFzwoiogm8+pnwz0ImB69UL36YOLSjxQCGdK5UM5W6tvR3K
	 qOtjMlgXIThtajedx+v5iRSJbhSjYCP1hyOIQhhMD+wEqn0A/5xwHojlCafFytrHGB
	 zxiwfhe68jME0iBZ7LMRs+HFMgg/bMQDpZVt+RQCY6Jl1drD765sCIaxRqLAswF6JS
	 tGXAd9XCzb9ByAegGZ8UEuZSxbEeCkTiPDwXUbZyvJZaCG71olCeUx326JTvHWwGnS
	 1Zsik4mRrw2bDeAAXIf974IuHdOuVv1szDvc6t2Ue9563X+XUG3K8zt8ktj2T3sVrZ
	 B7Ty4MIOn6xxw==
Date: Mon, 3 Feb 2025 12:45:27 +0000
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	DRI mailing list <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v3 1/1] regmap: Synchronize cache for the page selector
Message-ID: <849eca29-4f03-4fb2-bd1f-747ce42f4c5f@sirena.org.uk>
References: <Z4ppo8wV3nicOfAQ@smile.fi.intel.com>
 <8a7581e4-6422-4d77-8027-02df0d7da489@samsung.com>
 <Z4qTQ9ypkX6iS1Pl@smile.fi.intel.com>
 <42fe4488-0ff2-4b92-ae11-cce1664a7176@samsung.com>
 <Z4-hMdUUTeQHN5W_@smile.fi.intel.com>
 <6b4cba29-786c-4999-ac1d-27b3e4cea6f8@samsung.com>
 <Z5kJLrE6xOzOKaeb@smile.fi.intel.com>
 <Z5pESDSekep9ChAN@smile.fi.intel.com>
 <eyjsejpx7klztr4k7xmrvceosfykyozs736kycdnf5uur5by43@5i5x7tsuxtpg>
 <Z6CKGu7URC1iGOVO@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kIw/jZ2k8nynFeV2"
Content-Disposition: inline
In-Reply-To: <Z6CKGu7URC1iGOVO@smile.fi.intel.com>
X-Cookie: May your camel be as swift as the wind.


--kIw/jZ2k8nynFeV2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 03, 2025 at 11:19:22AM +0200, Andy Shevchenko wrote:

> Thank you, guys, for reporting an testing, but it seems the simple problem
> to solve requires a lot of changes to be done without regressions
> (this fix on fix makes a regression to those who have cache enabled), which
> means that for now I propose to revert it (or drop) if possible, Mark,
> what is your preference?

I dropped it a while ago, it's not in mainline.

--kIw/jZ2k8nynFeV2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmegumYACgkQJNaLcl1U
h9CI1Af/YUQZ/OvbLSPHBblbvWjcYRs/36TUcERL58yy+RZLvmccKwfXstl6CZxe
/8jDnW9rbwNP4/s7OC0Sz5MBlLyaJlnvr3/hiYcC6ybOpqYGFx3DwI/HQGBxSYah
4DNfH/NgnMWCkeCW2hoQHEmPbQ+kzIAPMbToMgZIo2k4buqcL9Avq2ITo5FwsEpu
2aN2ZRmmfIZ9X1I/2BbNqq0l6/8IBMiVs12CEyeb5PfbfSGNra564aL5VtyoqKIT
Mhx58Qdxk/fUknj7FnnFh8o3pYKTkqY4BLN9fPD1spvIKLXszA1wCASHSeZ+VS9F
QapzrA6XxMys3x/MsaJqpcuWMK9gDQ==
=oT4u
-----END PGP SIGNATURE-----

--kIw/jZ2k8nynFeV2--
