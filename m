Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4408F2528E0;
	Mon, 10 Feb 2025 14:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739197692; cv=none; b=Fecuy3fjVT2ivrn9EkeXSDdEWvU2pniVPQOAYFfg7C0TC+APunWFEbld9w6Tbz6V7tGZb5zK6u2tZ1YzxNZU8ywBTkXIEc8RBgObeFYcyBph+9tqH2zkTeuHorcFwMPdJ3Ct6C2E4b+aQtWHL8LoZp7seFe0tzqm03kwVawPN50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739197692; c=relaxed/simple;
	bh=EzTEtZ2myVnXIZ24uN49qpBxcFhB3crO0seUCyVpGfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IXyihdBCXUqFtu56vo7eX3xz4QKGquiYI2sQQ9K9eo6RGhZn0W4uuvTPDMpUtAQjSudHelOOe0Eir4sjdpn+R1XSW6sub8bMACa1bb79h0mxjF/4m3QLmK0cGyBiOIopZW200I9qmsNvo9RTDpsT9Rp6t8xOjEQ0+hIAUmpFHgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gxhUTaXT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gxhUTaXT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBC10C4CED1;
	Mon, 10 Feb 2025 14:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739197692;
	bh=EzTEtZ2myVnXIZ24uN49qpBxcFhB3crO0seUCyVpGfg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gxhUTaXTUTI0ugvO7xoYJDKeCLEmCREUQUP3GJlmw5KdTweB6j//oBqZ6cHQ9rIAw
	 9UfOC3wxNTGAM0k2lEW1pooVxXV9xZn8W6Y7dxLMBlQaykFOgpErO/3UCKZKpgjrJ2
	 VNElSthIfeY8dlps7TTYEVs6Gc+Xoh0K7ppTy1e+Nn3gYY0QLFhx3tg6CGxtA5qA4w
	 v39MplyLaqteTE4/HZ6ey8QxgOGe2RSZZzPnVYNArnh9vTtBlA59DefOJplt/2FZC7
	 J2NkyN9EJYxl6Pm9qw34agxIXtL7EMzk58DD6QGuTbQhH+MTuLabA+uyWNhUbwXPfq
	 +LPEYEwxynUlg==
Date: Mon, 10 Feb 2025 14:28:06 +0000
From: Mark Brown <broonie@kernel.org>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexey Charkov <alchark@gmail.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: ASoC: rockchip: Add compatible for
 RK3588 SPDIF
Message-ID: <8cf5071c-0f3e-4a5c-8866-571aff717974@sirena.org.uk>
References: <20250120-rk3588-spdif-v1-0-1415f5871dc7@gmail.com>
 <4315116.iIbC2pHGDl@diego>
 <56d128d7-c4bd-48de-b823-0b88147220e1@sirena.org.uk>
 <870305083.0ifERbkFSE@diego>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="npqY4rgAKF91WSV9"
Content-Disposition: inline
In-Reply-To: <870305083.0ifERbkFSE@diego>
X-Cookie: A beer delayed is a beer denied.


--npqY4rgAKF91WSV9
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2025 at 03:04:22PM +0100, Heiko St=FCbner wrote:
> Am Montag, 10. Februar 2025, 14:20:58 MEZ schrieb Mark Brown:

> > directly if something has gone wrong you'll have to resend the patches
> > anyway, so sending again is generally a better approach though there are
> > some other maintainers who like them - if in doubt look at how patches
> > for the subsystem are normally handled.

> With it being 3 weeks since the patch was originally posted, I thought
> it might be the time to ask if the binding-patch was still around.

> I vaguely do remember you saying in the past that if a patch hasn't
> been applied/handled after X time-units, it wouldn't be in your inbox
> anymore, but am not sure anymore ;-) .

A big part of what that form letter is saying is that it's better to
chase by resending since that ensures that if things have been lost the
actual thing that you're looking for action on is right here.  If you
just send a ping either it'll get buried along with the original patch
or there won't be information to hand.

--npqY4rgAKF91WSV9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeqDPYACgkQJNaLcl1U
h9DVogf7BPOYta+bQCVLrNNjoe5Z+7pVxkJCieo659XYOA1nbkym8aIQTdh6RVn4
QalKJ98JYC34XWtZ6bM3+0En7DmjQ3lBRfW5VGl96k/DEvcLiPnMw1X1X3hD/txP
qimrvrIY+V0TxuZD/EBMt6PyqJLu4nJLi4hKkk9NQUK5ElDEnt0gwsx9h0nZpVdC
4iTXpm95j8QJ8eQq039hpMfyYUqsBUSaSAmePzHtecpWk3u5Md3nNRdNVUSGyGU9
uSLO/rY4MbagswLBqq7LDdVF78VSPFuRH0IoEioVXvFuKFLhnn3KfO/LwXL1cYzh
pNCEp+G/XfFXmu6jahMCuiTOjKIOKA==
=0+At
-----END PGP SIGNATURE-----

--npqY4rgAKF91WSV9--
