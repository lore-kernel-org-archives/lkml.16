Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E7E23BCED;
	Mon,  7 Apr 2025 12:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744029275; cv=none; b=EI4dxaG+Ipdmrxj2t8LDCF53nfsxHHrKUBBrw8W9TeVvtHfCAO2hIIA3vgH2SWEUH8PjJMwpLbvMgbW5IP5lmE9DvPDEZvNtFkxNuEz9c7nG7ssj35J6Zod4eMaszDXPY6LH2WOffenNDNrYtO7M4IaAzhXbup/gBcn/xL4tXdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744029275; c=relaxed/simple;
	bh=81O8Kfs9Kl3ByB4JJQKPJiUtwEnEXTyQvJsxew6T6zU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G5Pe+X8S7C+JXfhHV6d88iNv4Ui8sxUUPbwyfng+gzxEuMCL0tFtdFpZCw5qsN4Qkp+VPU3NcOB0S0qR/1WGA2mxTbzaZlFFSdKXfCsroCrHCQ7cO4LOEisC8TYXqP8mgfHD7lvFHAI9vw32YaBSnEi+qHuq/pFEOLntSdVsDvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UTTA0U/S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UTTA0U/S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A674C4CEDD;
	Mon,  7 Apr 2025 12:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744029274;
	bh=81O8Kfs9Kl3ByB4JJQKPJiUtwEnEXTyQvJsxew6T6zU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UTTA0U/SG+M07Ucyfn5N8gZvwdgX4P7wb8qIjF4F4TnPKQmqRWhlcXm+QqfwW0zCQ
	 CEdL14aGClRpBViIchPbJn7Vhi8oy4aqrwT0bEuFT4xRr6pLlLJAdPJC9V33251/Au
	 TN2xd7bD20Dhrue2eArrIUqSo5+feEWgpprFerM6pGR26hgL/mncFz0KaAYGBVl/9F
	 bNBeVXEin9qDjWqzW0hZUBz3laHUtIw8ULxejyxa9dyXZmzl8rAnfUMTYAWsn6S3Wb
	 56uV2mgjR5gv1+uhYLbH/UNjCo/iUTa3s8KvJ5aYvYk5vo0I+Sye9LOvbz+NPssmCJ
	 cFtNGNwypn2Lg==
Date: Mon, 7 Apr 2025 13:34:29 +0100
From: Mark Brown <broonie@kernel.org>
To: ChiYuan Huang <cy_huang@richtek.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Otto lin <otto_lin@richtek.com>, Allen Lin <allen_lin@richtek.com>,
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] ASoC: codecs: Add support for Richtek rt9123
Message-ID: <17e8e4a6-135f-46b4-89d8-3ea0d3bf6e76@sirena.org.uk>
References: <cover.1743774849.git.cy_huang@richtek.com>
 <cff65757c4665a81397ef5f559b277f96d4236c3.1743774849.git.cy_huang@richtek.com>
 <4e966f68-527e-4e2c-9043-0795ff094031@sirena.org.uk>
 <Z/Mf1VQ1Ay/Fw3kh@git-send.richtek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bv6CX8lyqjhHM+CU"
Content-Disposition: inline
In-Reply-To: <Z/Mf1VQ1Ay/Fw3kh@git-send.richtek.com>
X-Cookie: Meester, do you vant to buy a duck?


--bv6CX8lyqjhHM+CU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 07, 2025 at 08:44:05AM +0800, ChiYuan Huang wrote:
> On Fri, Apr 04, 2025 at 04:03:57PM +0100, Mark Brown wrote:

> > What's going on with the runtime PM stuff here?  Especially for the DAPM
> > widget usually the ASoC core will be able to keep devices runtime PM
> > enabled so long as they are in use so I'd expect this not to have any
> > impact.  Why not just use a normal DAPM widget?

> That's because The RG 0x01 'RT9123_REG_AMPCTRL' is mixed with other volatile
> status bitfield like as 'SW_RST', 'SYS_STATE'. That's why I use pm_runtime to
> make sure the RG can really be accessed at that time. Actually, the
> mixed RG bitfield  for 'RW' and 'RO' is a bad design.

You need some comments explaining what's going on here.  If the volatile
fields are read only shouldn't you be OK, so long as the register is not
cached you should be able to do a read modify write fine?  Unless the
status bits are clear on read.

--bv6CX8lyqjhHM+CU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfzxlQACgkQJNaLcl1U
h9Bj8wf+MuvOpgGLzuxJ2zgFZYqQIWbkfQ/xyJKwdXkIab8aukkw5vy9JzFozl4n
wjbf5U+oaNzMzXUHJ9Ky5FRc6pz1W3KEHuowYJY/tho+5V/RMDL1Nju3IWuNqy0f
KTOG5cHyKSR6F5IesQ8PQQnnUl9amHHGuwIgHigYIiX7C9GsREIswNPdBVjYoZxU
eryX9WMVvdJR+dsrl6J4T+CtVhmScR5dR51TdZpROdh2km0cSvrQjx1hntpf6ImM
q53PwCzcxRvVcDAHwNk//8/1aYRMbkNuaz7eNo4CfJGe5vyDXnGtKAJjuphLb7b6
LL6zcDVeJbvvUPYA7Fdehfh9pWxtjg==
=CXgY
-----END PGP SIGNATURE-----

--bv6CX8lyqjhHM+CU--
