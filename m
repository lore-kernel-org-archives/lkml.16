Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB45C469D;
	Fri,  9 May 2025 01:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746754262; cv=none; b=d9jl3GpODdGYwC/YUOTlrj3lGNCvA7JfAONye86LtexYm20DOXL5wGl4LIUIxFCsI2Vcbx7sM3F3TeLvEFtX7/GFENXs9PCKYkyT3/4iFdXKGncKlQlR7dTRAqD3nWWZ3PqDY7dFocKi8/OdvUp97jbeD6o8t1mRodIh/I990pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746754262; c=relaxed/simple;
	bh=+PL22NNieIiKEtfNZ+lv4C0IHgtYlEyfd+uza+Cp+M0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gQzJyFlOy6hL7aGpqc5HJli6ZLiHBkrppTm0KOGTbLpQPABDFW1BTUcLywQgvRHjqM3YjCKciMU46dvmrEoR2HjsaT8YkiV4VQlirrkib5rmZQ9iEefad/8wFvcOmtoAeuGBcQ+QntxhBl5lhNn6RkChuCJMnFm3hN1ODgx9EVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MhqLUs6G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MhqLUs6G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A555C4CEE7;
	Fri,  9 May 2025 01:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746754261;
	bh=+PL22NNieIiKEtfNZ+lv4C0IHgtYlEyfd+uza+Cp+M0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MhqLUs6GRKKiUAV6COqL8S9WOmzekLfLb20WVGT8tMENLh0j6eAXEQV8PFdSq/qo5
	 DF34dJniE4HB6pqQEfTgEY14ZHob3uA9ZT+FsEt1IzqtgNI7ib0yLNil0Ffe5orTeG
	 GGL4DRBfOIG4pZ+SgMkLWYwK0A08xFwhUUFSolpvhGhZX8PuVQ9vR4kwInjSqyzWSY
	 qyXlfMuvXZyHrvqPc/YavgMInuWp3xZFR2AfmA/3RLwVZAlJxW4t+SXIMqPcZYdJ/k
	 Lh+hVqg2Jq3ACnriZz/TIHhhJ/Pb6Yk99p1bN1gREkxmpCBDcOzg6XCJA+E3DC5pnC
	 /50vIvnhy80TQ==
Date: Fri, 9 May 2025 10:30:59 +0900
From: Mark Brown <broonie@kernel.org>
To: "Colin King (gmail)" <colin.i.king@gmail.com>
Cc: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org, christophe.jaillet@wanadoo.fr
Subject: Re: [PATCH][V2][next] ASoC: rt712-sdca: remove redundant else path
 of if statement
Message-ID: <aB1a06gKZ4X8Uc2b@finisterre.sirena.org.uk>
References: <20250508084527.316380-1-colin.i.king@gmail.com>
 <174671514156.7345.16339489109303663127.b4-ty@kernel.org>
 <a1f5fa12-1e0d-429c-bc15-79911c2571d1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JbvGtJAmjdaqZG8k"
Content-Disposition: inline
In-Reply-To: <a1f5fa12-1e0d-429c-bc15-79911c2571d1@gmail.com>
X-Cookie: Well begun is half done.


--JbvGtJAmjdaqZG8k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 08, 2025 at 04:17:42PM +0100, Colin King (gmail) wrote:

> Looking at your repo I think you applied the V1 of the patch and not the V2.

Please submit an incremental patch with any changes you're looking for.

Please don't top post, reply in line with needed context.  This allows
readers to readily follow the flow of conversation and understand what
you are talking about and also helps ensure that everything in the
discussion is being addressed.

--JbvGtJAmjdaqZG8k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgdWtAACgkQJNaLcl1U
h9Av2wgAgqgvJq4Bu+T3uFohrNxXlAz+aWszOaoetOK0HfSBfhtPW1DGGkcBhuYY
Ej25DGgAP+rNuDfqRzbwEIb5fDVMvL9FfYsSBIn0cHtSPvohYC4ArXJYMezorAi3
dNfr1Oluwx2W2Fog0R69FTNZlbtaxo58JTmZOPBTY/MQHjUJmUjXpaLVcr00hev6
AzvijQdRbqHiRT5nk/QEvG28VaLzlOoxETa+7V0m8VwBfE/1183IDYOVnbpt22fa
n4XT/QU5g7YT59ZLy+DCa8/5oMi86zK09sAF9JTDToihJCEG21RSvDbSVbrD+3XD
I6+wSTeHrco9Vdj3RBFNU4FMtHJY2w==
=r5Tq
-----END PGP SIGNATURE-----

--JbvGtJAmjdaqZG8k--
