Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FAF17557;
	Mon, 10 Feb 2025 13:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739193664; cv=none; b=i6IECclQZAc8lUupuFp8YOQWqJHu48hbeL+G7mQ8ffrT1I+qQx3svmToF9bH5hyfcES/O0b6AgSA2ZJ1lsr/XgqWTww3IuIg0RPW8tNGcVvuhKztx1V3jiv5Ds+CHEwbcU3QC7zYnGqViO5K+muxaOxqveB3y3ZfSYjXX0h2x1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739193664; c=relaxed/simple;
	bh=lbvK+R1S0to4+sFyhCiUUSM/9FdVL8vJT6v3dpUi7Tw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LRJrSomC8pnLjwIk3ra20cBK/Rr55p2ruqRqCaZaw/6VIuSiO1HvLHahcpIJEa3muXWK83g4ROzhvevm1cqjGjkoj8xhq3iXAlqveVQfyJ5B9hvJUrYhxVptIa74WnhULQIkD5QQVjZC1QZEm6hjbr6vw3VJJ/NTnrMw6iaunBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j4AESBWg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j4AESBWg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E68AC4CED1;
	Mon, 10 Feb 2025 13:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739193663;
	bh=lbvK+R1S0to4+sFyhCiUUSM/9FdVL8vJT6v3dpUi7Tw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j4AESBWgPJM5RvSJTGIHU0D2oc2AIw6rs1zeVJykHsy5YANen2b1FheVdgalp7tNv
	 6qZvfth7GK8vEabaQRhJM83TGlkw2klGjo3wm0NKdjRxyo5WTzDSKAQ2bwGgabUOX1
	 tTC+I6tyWiqEnc3SaAoyLwOt7x5HAaBl879+fk1IwRmsz0qsz1jTeNNr2We3xkRtnr
	 kpYw2VFkiB+e3EB0T9wRS4HEpQkkWbeL/hrizEDfFeLOl3PuXe6RR30yThrHvvGZBv
	 R6KEpvmiyTUQYjyedx8LNofbDxbZCG2B0mqh09dE1kQ+PAJKvjZOmI9r5Rr7gIgqAb
	 02RLkMRZ5kwfw==
Date: Mon, 10 Feb 2025 13:20:58 +0000
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
Message-ID: <56d128d7-c4bd-48de-b823-0b88147220e1@sirena.org.uk>
References: <20250120-rk3588-spdif-v1-0-1415f5871dc7@gmail.com>
 <20250120-rk3588-spdif-v1-1-1415f5871dc7@gmail.com>
 <4315116.iIbC2pHGDl@diego>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eAhunf2YJnuAvrBB"
Content-Disposition: inline
In-Reply-To: <4315116.iIbC2pHGDl@diego>
X-Cookie: A beer delayed is a beer denied.


--eAhunf2YJnuAvrBB
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 09, 2025 at 10:10:47PM +0100, Heiko St=FCbner wrote:
> Am Montag, 20. Januar 2025, 10:01:27 MEZ schrieb Alexey Charkov:
> > Add a compatible string for SPDIF on RK3588, which is similar to the
> > one on RK3568.

> as the binding is more in the driver-realm, is this patch still
> somewhere on your radar?

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

--eAhunf2YJnuAvrBB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmep/TkACgkQJNaLcl1U
h9AzqAf/T2ZOQi4K9XfreabaTdPLm81THw5/XTKa/58i7z3jL11ZII9/Ysaw3CiW
YnuvbkR4j45WfM2AeD5BDn16fc9h+DDbNAqYefOwFO/tr98gejqkWblnx/rFpF9D
fNI/hH0hv+8unMp08sB+jdTjf48MtQHASTCqR0+MO15cT1pdgIvsz/ylNbkXo/c5
xrcpltcyDN/xa3QFa0WCIVcDQCRRUAdHuZt1dICCy7dRD7Jac+4PclQEYxMblt24
GkCkLXIUE80m/HlOcLqS2lJAELD/hV/aGFCLeo3PCaxKovKT8vj/6JKdhPvweZik
OOKsJg5hIinmNvYGZELSgMat3B6BbA==
=h/Aj
-----END PGP SIGNATURE-----

--eAhunf2YJnuAvrBB--
