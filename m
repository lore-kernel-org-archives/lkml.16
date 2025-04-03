Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC0224BC1C;
	Thu,  3 Apr 2025 11:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743678611; cv=none; b=e6Vkw9+viT06oCieQ2uCrXShNa9KoK5/9m2rHGmkoaCYawYX7NOfDZ1wgX3R6nwg+1EuEkjF09ARhfWftsIRc5PXTn77neweI/YNzmG1poNHW68kyOJtjR6W+3h3WrHdLcGcT14GK266IN6p2dpRixHhGxV2PSrCLDFMzr3pvPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743678611; c=relaxed/simple;
	bh=htwI5zsh8ZDaI94Lm8c3UJRY0TNj20AHOyFODzHrsRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rpJ2xWRrtCFF/f22Jj/HZacawGTTBbEzH/mwn22Cv8+9nnjX1g69AuBFf8s86+X2ZyXzB+pl0/mbpspJlSf0gMZy4yN067dcObcR7NYFYwACTqMME74MvkHr+yHnBo0IxJHca3Imxh015AjAJRxNqwnS1Sg00/X1pzIReSlxBTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JDOhLyn0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JDOhLyn0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11F2AC4CEE3;
	Thu,  3 Apr 2025 11:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743678610;
	bh=htwI5zsh8ZDaI94Lm8c3UJRY0TNj20AHOyFODzHrsRg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JDOhLyn0xYLRzSvccPU8EviC8cR6irF7BDJvH8ACOAdUQzHQH7oP/7wYujcxO+NjF
	 GgY2xgBpssfWkG1WsjPDgdBi0nkVLNmQuj7vdHyeM2DsDwYSPD9qDsrfuYj0WWsPah
	 G7FDtZORFO+rimKjF7CbjHQbT9uuROt2jdGtPEDeuW/dt5Kx2J1GvenawEct3O0SoS
	 Uo8PX1xw/niwV9hUIuhDFfnkEKfrdyMd0X5Sf46MelotqgSxu2VVk6SA7mz/eOaFDJ
	 HoPO9zn4Vc6zD+ANTRl/YKXupC3sqi6yHP4dPfKlO5jsS9+ko5WOXpbKrRmvIzhObh
	 m92UasI15X0dw==
Date: Thu, 3 Apr 2025 12:10:05 +0100
From: Mark Brown <broonie@kernel.org>
To: shao.mingyin@zte.com.cn
Cc: olivier.moysan@foss.st.com, arnaud.pouliquen@foss.st.com,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	yang.yang29@zte.com.cn, xu.xin16@zte.com.cn, ye.xingchen@zte.com.cn,
	zhang.enpei@zte.com.cn
Subject: Re: [PATCH] sound: soc: stm: stm32_sai: Use dev_err_probe()
Message-ID: <f78f066f-2be6-47f3-bb06-03f1c2ed3d22@sirena.org.uk>
References: <20250403154142936Po-soX8Bifyvw_eWSbddT@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VJtFOiDls7d3k31G"
Content-Disposition: inline
In-Reply-To: <20250403154142936Po-soX8Bifyvw_eWSbddT@zte.com.cn>
X-Cookie: Logic is the chastity belt of the mind!


--VJtFOiDls7d3k31G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 03, 2025 at 03:41:42PM +0800, shao.mingyin@zte.com.cn wrote:
> From: Zhang Enpei <zhang.enpei@zte.com.cn>
>=20
> Replace the open-code with dev_err_probe() to simplify the code.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--VJtFOiDls7d3k31G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfubIwACgkQJNaLcl1U
h9CeLQf/R93pQE1PWEoaKn2ix4KLyiBG73yedrtnMdMp+o5mrdfBQ7mMCsCUr9D2
OYklJCVdg5UGii26J9AHrpPFJ/maeTRCZLWSYi8jSkDvVOzITy74IiQN+3fMSyvo
lG/EJg7WhDkLyGdQm3FM6/GD3QqppgcfzTFJkKTGxFwXeTCYJoanUdk2rn7iNqyO
ZIfIQYS56l4O1FR/xTJG+n5iyS2HsYUACJRFyrnHW+CjpGpEVXRWEMOmhzhVl0TQ
EjDsPh4BWWbOX2Cvca66T1c5mJ5SHEFBlcQEIJ+RaDP5koM9IiMMuRAKY98HA3rK
mYbd3uFbhvGA9EVRiMkS/8iOsQJUTA==
=LR/E
-----END PGP SIGNATURE-----

--VJtFOiDls7d3k31G--
