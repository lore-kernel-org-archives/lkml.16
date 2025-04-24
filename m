Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F6D22B590
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 12:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745496670; cv=none; b=HQgMMXf15zeM1j/nkRpwRJ8LMoSdnKJOBXNEDnieosZx0kvw3xs0bw/Obk7N+6zSfRPDIpr3cflCnD1awT7MRmGAyEpVKBxxZXHpjhlWMGPp38CXvw9qyKVLJnOyd2vTXqSgY65d5JLGQC6gAS5etPG1kCv0GWRi5zQF+oKBlOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745496670; c=relaxed/simple;
	bh=RU2GhwQtj3dU23fE9vBvovjI9Qtw2uarIEm4Gy+/L8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VnilePdrM2x+mDGiupnJoAz2EU+Tdawno/nQlPBVwPcSKBEUIp5BUGRXlh3bBg8QweqqOLMUEX0upu2u2YaczAW/iaKEV1IRIczmq2IPFZfIL2cSKIU7kW6L+EITqjwA+wC67tf6xVLxSN6gzv0piiH8+Apg5+6LD1Pk10Z0TbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AQx18Ixi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AQx18Ixi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24B27C4CEE8;
	Thu, 24 Apr 2025 12:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745496670;
	bh=RU2GhwQtj3dU23fE9vBvovjI9Qtw2uarIEm4Gy+/L8g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AQx18IxiuYqeuoli2JRUc6zllP1cC9NEQDtjzQwHy6AFzVUooHWWz58qwk5X9BXH1
	 CEzRsgHrdSudv3qbG2eFO3zOYlL2LA67zKY/bh+XviCqDlYtLE3ie5xJrczEpQXbHZ
	 QL6+/B93uj/pocBn5FA0X5TMdty7SGYmNpC14CILoJuG/khrZctyQ94kMfs6pinT10
	 JLuXvZjaKZnQ5proCxp2Dm7dN/Zob2VFX8aLCFkrUon90WeqaYJqGy6fK0CmAS/oTV
	 0rI3Kgf+aFGYYEfmhsBo2a/CPM7XkMdPgYJHW7ZUXsQHtwnSTB8U8abykbeMrl+33s
	 DuoFUjEI4nGnQ==
Date: Thu, 24 Apr 2025 13:11:04 +0100
From: Mark Brown <broonie@kernel.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com,
	Andrew Morton <akpm@linux-foundation.org>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Mateusz Guzik <mjguzik@gmail.com>, Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jon Pan-Doh <pandoh@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Karolina Stolarek <karolina.stolarek@oracle.com>,
	Aishwarya.TCV@arm.com, sraithal@amd.com
Subject: Re: [PATCH v2 ratelimit 11/14] ratelimit: Force re-initialization
 when rate-limiting re-enabled
Message-ID: <e6e8abd1-6aa6-423c-98e5-4daa99c4edbb@sirena.org.uk>
References: <4edcefb0-cdbd-4422-8a08-ffc091de158e@paulmck-laptop>
 <20250418171359.1187719-11-paulmck@kernel.org>
 <257c3b91-e30f-48be-9788-d27a4445a416@sirena.org.uk>
 <559db775-f151-4694-86e6-72809b386097@paulmck-laptop>
 <98e5ab65-7601-452e-9ebc-bb3a7426313e@sirena.org.uk>
 <fbcffae4-8d88-4bc8-8791-12713f0dc8c1@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SpAx88reerQWj+0N"
Content-Disposition: inline
In-Reply-To: <fbcffae4-8d88-4bc8-8791-12713f0dc8c1@paulmck-laptop>
X-Cookie: Star Trek Lives!


--SpAx88reerQWj+0N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 23, 2025 at 12:54:39PM -0700, Paul E. McKenney wrote:

> Could you please try the patch shown below?  I might actually have
> it right this time.  ;-)

This seems to also fix the boot on the affected platforms.

--SpAx88reerQWj+0N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgKKlcACgkQJNaLcl1U
h9DrWQf+O5cFwKliiGjRZUGV5xMJuZ2xrmvQUztEyM6Qpy97l8HVTrTkL4XISCEW
ZBJ8L/GH8rJv3iRicBDXnFIkHUb17DZ2ueDbBCYjeCmBRCyxnvT7j59zLM+uX8VG
rCd4IMuLj0k6K3KTowihdWaXeupnDBP/HhxEgYb+ofmlWZ7ziLXjAHYJKH2e0VE2
gx8CFtyD3W5R2emA6LBMCXdUpUSvPr1xa129qazlMTaNTM+BOFCIKQ8iNbV13rWe
IVCB8liYzwqWvP7XvVoQbcfT+2i6sg+xjrzrZekY7HWXKTY4m2XW6GVVseCEb8Yp
bIgn5sm6D4xEZQk+18xwoE6VZMDQwg==
=Jfij
-----END PGP SIGNATURE-----

--SpAx88reerQWj+0N--
