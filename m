Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4567719EED3;
	Thu, 26 Jun 2025 16:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750955575; cv=none; b=dviv4DE3y72fJYvXrTiDhnTBZ4JGAELNShN7IqCdU6c/3foRB1RZHrWOeTZdXBZ+co0NGuNCIOmJheP+sUt8jcjyh7K2SNxEY3BBywkFrkORb5MXnLAQwHdG7lVOy4qK8Yd3iRXo9qiEuLAA8khQ2jb+2YytCZJT9s9n0RWiG1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750955575; c=relaxed/simple;
	bh=prN19SSoG97W0Mrft7RZVsIatb8SGPHXr+Fhn9Km1Yc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PfQOeHVcPGh4t0iSDwl33vellOIN+S8kmxNNf56X1KrSF/WXzfxiDE5m0P1bPFcuQduUiLfQyL1V2dIQzxy6YITOe4LyZdR0nn/z5NhD06ZJrNe9uQw1wMobZp2Qc6GebQsRJU7cgvfEJMa0Uy74PgdEAu+3Bn762uB+FhtzKT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TNY30jJb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TNY30jJb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9335AC4CEEB;
	Thu, 26 Jun 2025 16:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750955575;
	bh=prN19SSoG97W0Mrft7RZVsIatb8SGPHXr+Fhn9Km1Yc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TNY30jJbuTH59vzkw4dmQsPZ7ZH++BpiToEzrNB+KgSoj+83y97dFxRyBUK8gXONa
	 gi23JM6XjEaMk9KKL+Lfvjz44x5/TwVyvEfVyP+3xPryhBo1U4tgCMmjoDPHslwbgf
	 fWtgOtG4Hy00p8VkEahQuDaiIXlfUDjDvIMW0PeW94v2A4BtYV91AbypxOurrTlCQ4
	 WuLShYwbqu06LRmVTiAGnnL1hildxCo30IJH+BXS+upYgmJZN4qIBPVTYCOn+67Ctm
	 wXSgUnumP3cQ6AbObQfN9FWu302ELStuUzzZczkaXlSD/20uGOO9H9HtVE83p/L4oR
	 wbLBtvb7lzcew==
Date: Thu, 26 Jun 2025 17:32:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Raymond Mao <raymond.mao@linaro.org>
Cc: linux-doc@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: devicetree: overlay-notes: recommend top-level
 compatible in DTSO
Message-ID: <20250626-providing-debug-6d31e54fd229@spud>
References: <20250624181320.2810521-1-raymond.mao@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dcUwdSgaHuCD+gQp"
Content-Disposition: inline
In-Reply-To: <20250624181320.2810521-1-raymond.mao@linaro.org>


--dcUwdSgaHuCD+gQp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--dcUwdSgaHuCD+gQp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaF12MwAKCRB4tDGHoIJi
0pWPAQCrMKJdik84OqZ5h9CNO7zYsDoKEWNYaLWhXzDDNlCVigD/UEI+lHswHMxd
ZvbRcCdAvJg00ufXxEzni7CNqmt+wAQ=
=Kxi2
-----END PGP SIGNATURE-----

--dcUwdSgaHuCD+gQp--
