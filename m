Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4650264F88;
	Tue,  8 Apr 2025 09:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104418; cv=none; b=AGxoL4MwBdv5R0wMrt73yt/u1ig1ZmbV7djMUaEbztfUC+8CdmKO+9lOLqGiMFKKh6l+EclGi6ez4ozVZ4vLqmYlmiPBMaw2ZMnwrTSTeqc4bFAaYPMFB/It5hxeRG/qwA2s9JOegg/lk4J5xuJHIlot4R8AsEelC4xd8+h71Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104418; c=relaxed/simple;
	bh=KxpWyZFz7wM5ZEXNIX4IO/wpCr4Wh1XIQROm5nkLjUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E58fJmW3WHiHW1hEIAS1W68ycsY2lvO5aKTTVVT9TNNiwcbj+cEDEj7DVMCHRL7hIZZoeP+J1BlmZ/N8qccU9oqML/kycWSzQVhfkV+3XbsMGH5z+V9sHfvyh5aNW9doc2U2kh0A42Fd28wodh53kwkTYl5SME2eoWE4Zhv5I3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a12E4Jn6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a12E4Jn6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AEECC4CEE5;
	Tue,  8 Apr 2025 09:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744104418;
	bh=KxpWyZFz7wM5ZEXNIX4IO/wpCr4Wh1XIQROm5nkLjUc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a12E4Jn66yAK7/bs+ifzBet60z5voWoclN9o2GiJKAaq33NrG1+tsOQnkPMNKaGHi
	 VmRouwRxSBDitMnmVBWjMNfesDxlL5Qd5cOlIdl1UjzWzk+Kh9zovPtMZ2iqOU72Ql
	 1i90T3n/laHkj/d+LD5LEDWcKY4qqxjSxD4OoFoO8N1f9eqv0JcFS0wQ8stYc39g3w
	 5t8ZG0rNyPEWSUqj7THy05rtUv5L04JxdYYzk+M24xJVxjTTxdlr/zOsn1lzO/lN0i
	 Hy+SUmo+FlPNrM0LeEqwDExN4fWCLlFbrJGgn1N2s9HzvaeaQilBAacpc+1EetbXNc
	 UA31JdMQcUEEw==
Date: Tue, 8 Apr 2025 10:26:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Clemens Ladisch <clemens@ladisch.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Maxim Mikityanskiy <maxtram95@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	He Lugang <helugang@uniontech.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Tang Bin <tangbin@cmss.chinamobile.com>,
	Philipp Stanner <phasta@kernel.org>, linux-parisc@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 00/11] sound: Replace deprecated PCI functions
Message-ID: <e1925b7f-1256-48c8-9457-c1662df4f8be@sirena.org.uk>
References: <20250404121911.85277-2-phasta@kernel.org>
 <174406895437.1337819.1919250165088744285.b4-ty@kernel.org>
 <87tt6zb51t.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="voYfjlaWt+OS0Y2f"
Content-Disposition: inline
In-Reply-To: <87tt6zb51t.wl-tiwai@suse.de>
X-Cookie: Meester, do you vant to buy a duck?


--voYfjlaWt+OS0Y2f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 08, 2025 at 07:22:54AM +0200, Takashi Iwai wrote:
> Mark Brown wrote:

> > [11/11] ASoC: loongson: Replace deprecated PCI functions
> >         commit: 7288aa73e5cfb3f37ae93b55d7b7d63eca5140a8

> Oh, I already applied this one blindly as a part of series to my
> tree.  But it's a trivial fix and shouldn't be a big problem to apply
> twice...

Yeah, I saw you applied it after it was already well down the pipeline
in a branch in my CI and thought it'd be fine if we ended up with two
copies.

--voYfjlaWt+OS0Y2f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmf069oACgkQJNaLcl1U
h9CdpAf/bDQyxg51XaUBbS3SXbKfJJUOZ3pivQjL0IBOwGVMQBXeZ2ooqJtM34qo
5Atpy0L85A3unh0uUxMTmTS6ozDtH65ejQlOrIwcsVvpC+HbNAaiTiS/3kYeXCiO
NPtMo4WQCLrhV6HCB/dTx37VfFf54TTAUcTetCejIUz1yOkTKonoIkvVWOdgh7vg
MT5BfYiL8kRxndq/Xi3NDUMEsbKZhTuOxw8fKcgSBI70qCxsWkMZq9ul0g9cKGVU
8RdmViQ0p13+P5tG9aQCnxKRhrgm/T7PiwD7ZX/0BRNqJtwDh/Wcxbo++/413u7f
Gx5dMvDrh10sTwu5xD31ZvSkv1iRig==
=k3+a
-----END PGP SIGNATURE-----

--voYfjlaWt+OS0Y2f--
