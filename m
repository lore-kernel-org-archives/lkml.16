Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B430F239572;
	Thu,  6 Feb 2025 17:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738862937; cv=none; b=bgxWIzhcfJUyQWNEnrF+2EO77utgINv3KnnXoOjlGVUI+7CIn30Jx5mYWeW9LAGxKql3+jppQZAFHGJ4U5ES1J5dYIZ9Sth+Rg7zNAI0pCocNEafvGyohV6adWtRBTynhlmOLlUijOmiMtrpEA3Jipu1xs/cBfTZwu3A8yeJHvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738862937; c=relaxed/simple;
	bh=ee6xhU/145JBRAaQuROyk8466EDmizhZTf8RLbkd/uQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sk8Ya9fuJdtaqHIq2UH/ZgPnuGq3uQ/nAXAXGjDwYvQEpioyLxivOF2S14ZYyI9Z6umjIVFL0AzPBHjoDBgiLQduOdjjcqj7Qed9jZQuI/vcA7A7uZ8T99AIo49XLoHJltGpHg8lxSXWqAwXve83H8N9b1BKiYR1Cblho4pCHjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZULBypIk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZULBypIk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11220C4CEDD;
	Thu,  6 Feb 2025 17:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738862937;
	bh=ee6xhU/145JBRAaQuROyk8466EDmizhZTf8RLbkd/uQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZULBypIkD5AIglypoJtktYFlMwU+W+KbSFtCQcB2xUM6oFDnJFtEKSzT+mQY6g+tV
	 2ihit9vVUiULl5JYRgAePh9o2qZpZwJHdL7sQ8aVUumTp3XZuhdNo30d7WE5bW9X5p
	 f2ax52WEafJru969HjYMPcLuAm/KN7iHDU96J6Aoy08xCQiA4tm3PnJyC9eSuU4OUx
	 6kF+60xNf0KNSEg9iJswLdD+zOpRUCQeGQeAkUgaoMSqdHKI8SvLWhterPDQQSmIuQ
	 8xEMws3RaHvW/PudnYR4jffNCp6Y3mjwBN1YZpwAhEPBKrqa4R2k4cwH1KTLQRIBiM
	 S8478xKq7+Upw==
Date: Thu, 6 Feb 2025 17:28:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v2 4/8] ASoC: SOF: imx8: shuffle structure and function
 definitions
Message-ID: <5d075a4b-f253-4203-8b44-dfccfdff3048@sirena.org.uk>
References: <20250205203022.2754-1-laurentiumihalcea111@gmail.com>
 <20250205203022.2754-5-laurentiumihalcea111@gmail.com>
 <Z6TguAqGRS3eDhqa@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9ePzvpx/N0yDHpeJ"
Content-Disposition: inline
In-Reply-To: <Z6TguAqGRS3eDhqa@lizhi-Precision-Tower-5810>
X-Cookie: With your bare hands?!?


--9ePzvpx/N0yDHpeJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 06, 2025 at 11:18:00AM -0500, Frank Li wrote:
> On Wed, Feb 05, 2025 at 03:30:18PM -0500, Laurentiu Mihalcea wrote:

> > Shuffle the definitions of some structures and functions such that
> > they are better grouped. This is purely a cosmetic change.

> I don't think this patch is neccessary. It have not look better after
> change position.

The rest of the patches depend on this one (or there's some other
conflict with my current tree), please resend with this patch dropped.

--9ePzvpx/N0yDHpeJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmek8VMACgkQJNaLcl1U
h9AJ9Af+PpUdI9eSeMWcul/JsORox+wiE3dTzdAbUfma8OXASV/PxqngxwaNo9bS
Jh5SixKRkRBt17Rg9dROy63iyzdKX7DQGsJLgHHatXrhzie06cLsVPWPDKwamM/1
GG2w6qpPBYIdE14vEESpzA6TG+fTL0/IYE8R7gjY/tOn2LE9Xy7XJfwZ1PZKBaVt
GMwoz64ly0LQ0VxJdbMaQsGTtdomLji5c1QIhEy/u91J7MwaC0KN1UPvG8GFmCn9
X6jIUqcJrL7hvRE2FGQYDPmm9tJbBDuR56DUkSmvBmiPsw4skvk2bsVdOS+3xGBO
Ztqw4CJ5HdjIMf3QAJciEd2Zbos18w==
=4efS
-----END PGP SIGNATURE-----

--9ePzvpx/N0yDHpeJ--
