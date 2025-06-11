Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D37E1E47BA;
	Wed, 11 Jun 2025 16:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749658936; cv=none; b=tm0DIESBiyvDUx4x+OGwCqLwpDgGBXAkben7o4BbJurioSqJ3hOEyqlcQEgRmHZqrUIVNtEdXf33I9f6w+axAqjn7QlPeUOs5WWiy4WHVkIYCHNola7tOndkrpfO6QvLBHnY2Jh1gtSsa3+9ncz+RErjrlJqIzoGuNLHngIgf+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749658936; c=relaxed/simple;
	bh=ziAnfRxyNjEpCFfJWS21721Am3P++TML+hoaHXrdOSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lvCwbJS9XyiKLr5OAY66hIC+FVwcWMxA0ebo/kRf+I5i8alNdXElYyMrGCbGjDYUMk5xqPpUvJidAk4AH3A6hfE3tbTayAA2GjFnzTlhrZW66CzF3xkwWcNrL9WaMD2gPna1bDDytgDFKuHVnaYExlUTEvVz0yR54+YIwloF+7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EYDhMv3P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EYDhMv3P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D1A4C4CEEA;
	Wed, 11 Jun 2025 16:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749658936;
	bh=ziAnfRxyNjEpCFfJWS21721Am3P++TML+hoaHXrdOSE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EYDhMv3P1nNHg7yQuL9LjYXiZ9ORAsq3I68fYTi/2MNVIkJkwzZ9gQUBM0bw6BRD/
	 uOIgFxIblO8opvv5LsAMfBCV3JzloO1RU+Z4O+h9gN3jmb6Vowpf4LdTv8LZrRZx8U
	 qvOBN+9Vt3fAIFctk5tBrnICe6qGbKihcNe/SvUJ9H0r6vDlte0Zlgl6JYjjVAA17L
	 Ei96J7SqN5MeI5JlM8IpMY+pHQH96geciXxUkoTsa6Ienw5cOXVqs2vQ9odQol+RmC
	 ZQPMz+HK68AAsgRKnxaAgBoJOJpt+oUgPyyTdJvs4dET0RNjYu6wJZlVWNql8nkVQT
	 L0h3l3NTO/8Mg==
Date: Wed, 11 Jun 2025 17:22:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/13] ASoC: mediatek: mt8183-afe-pcm: use local `dev`
 pointer in driver callbacks
Message-ID: <d9107e29-ccb3-4a60-b6d7-dfd938c45b4f@sirena.org.uk>
References: <20250424102509.1083185-1-wenst@chromium.org>
 <20250424102509.1083185-10-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OKDsn+6sk/Ui8xxs"
Content-Disposition: inline
In-Reply-To: <20250424102509.1083185-10-wenst@chromium.org>
X-Cookie: I've Been Moved!


--OKDsn+6sk/Ui8xxs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 06:25:03PM +0800, Chen-Yu Tsai wrote:
> The probe and remove functions in the mt8183-afe-pcm driver repeatedly us=
es
> `&pdev->dev` for |struct device *|, but then assigns this value to
> `afe->dev` and uses that in other places in the same function.
>=20
> Store `&pdev->dev` in a local pointer and use that exclusively to avoid
> the numerous dereferences and to make the code more consistent. Lines
> are reflowed where it makes sense.

This doesn't apply against current code, please check and resend.

I'm just about to drop everything else into CI so it should just be the
couple of patches I flagged.

--OKDsn+6sk/Ui8xxs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhJrTIACgkQJNaLcl1U
h9A0swf/YV8Fwq4XzOoUcESeG40woM73Nf36oZKuCPnJShafmWlvwGNu1nrxUXgT
B5uc4HFldlyHz9V+Z3ICpZcWX8BxfVGgGQz6gdUFv0dHmTrF1Uw8jMLQnRzW7Ay8
mPUO4wGiDkOzS4Fr2c0CIs1rjLnFlRg+V4cwfXgC7Tt9MEZl/A0Njgp/WF85PD9A
fHpwE5sBvo57t2tkt/Jy9p6F7JT7QkVTAGljnbiuxQMBkqrX6rj+Old5UhDaYoaJ
R7ktKAYju/Xa2ChFYSwSipX7Mg/7vPMepYJSW8WsYf+XHkUYjjHPqZ99mpCOPvsC
AZJCtp3kY5y+dz8R35xID2GHWqvstA==
=F1JI
-----END PGP SIGNATURE-----

--OKDsn+6sk/Ui8xxs--
