Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB2625DCEC;
	Wed,  9 Apr 2025 12:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744201802; cv=none; b=ZY2XRRlKXsECta2afGrDjLxV8ebajfomyc31XiFW/fZ8cWSqpG4lzDAAumZ2eMxuu7cM4H77TAyoKpF1A9jZ1UN+6QIfd5xt8+3bGIfFqfC2G/fWt3q1arYMSST7xKvOd3hLCVD/aaazcrKIpnqwf+Rmnqtv4UJQ2gOfJ3JvWmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744201802; c=relaxed/simple;
	bh=IZoOsZsy8sycYe6l3UDWg9W0PAk6ggScHLXiXDpcBOs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iiWqDEqy7KoOuRWwPsSOwyeJ6uqhpFFXBjl74rXZpIcfBOf05qFET1H8xHIL/RXJz0ovj97TahgojWKyX5VhwMhORewD2wc5I8n5nIm3dA4ntyX/189UgTpfjNIlgxb7STAwTD9Uk9rYi+lur/J7+wsmY1tdaehGEBazw1ihNYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X13c65Wv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X13c65Wv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 637ECC4CEE3;
	Wed,  9 Apr 2025 12:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744201801;
	bh=IZoOsZsy8sycYe6l3UDWg9W0PAk6ggScHLXiXDpcBOs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X13c65WvBHdt0K8dH9/tmuUHVrLk04U/l5se7vnYNohYidTx/CXA3unl7hPlG9apO
	 5DUSGjKQ+jAzKmzKUDOkkkAeEBdPm+t5RraN7UDAkMwkBvCg4xIsKqxLo+CmQiNTPi
	 mat7+8IaNdzzbUyyJ7CnfFNNQtdFYrnjv3LcJCsFkCT4Gx7xKw77UGrWfpTTfTpiUl
	 gTOZPa0xK7AhzKNOa9KsBtPIygy4QEZ9aivAQDBZj7Sv3o5oqgCUsBJ79NrgHv4sYa
	 p51LLCQle8bBlZd6f+M1T0m2BJZitB/7ZAi4yf6yQlfJghhlw0hFJV9ZGSPJPMZpoA
	 mPtIf8JyGKMew==
Date: Wed, 9 Apr 2025 13:29:56 +0100
From: Mark Brown <broonie@kernel.org>
To: ChiYuan Huang <cy_huang@richtek.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Otto lin <otto_lin@richtek.com>, Allen Lin <allen_lin@richtek.com>,
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] ASoC: codecs: Add support for Richtek rt9123p
Message-ID: <0aa1c431-4408-489d-8f11-e6055c827e20@sirena.org.uk>
References: <cover.1743774849.git.cy_huang@richtek.com>
 <27583d8f9bb07351e5c9ea78ed286ca6daa74a8d.1743774849.git.cy_huang@richtek.com>
 <20250404200519.GA198531-robh@kernel.org>
 <Z/Mh8JEHqYohvcfL@git-send.richtek.com>
 <Z/XILJ8YRt905whu@git-send.richtek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BIesKuQNbSpzPwCg"
Content-Disposition: inline
In-Reply-To: <Z/XILJ8YRt905whu@git-send.richtek.com>
X-Cookie: Words must be weighed, not counted.


--BIesKuQNbSpzPwCg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 09, 2025 at 09:06:52AM +0800, ChiYuan Huang wrote:

> In last mail, I have already described what the delay for.

> Another question is for this property name 'enable-delay'. Should I add a
> suffix like as 'enable-delay-ms'?

Yes, if there's sensible units then adding a suffix for them would be
good.

--BIesKuQNbSpzPwCg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmf2aEMACgkQJNaLcl1U
h9CgBgf/T0/YpQZE7mqmZaBrW3K9TGXl0yrAZmdxuMnBRHS4G2ui4cr27J3PqI3S
CRuKgq8PZxaeLwyH9lnSlYG3wA4O5DxYVn77Msu7NcOtLmnumyTvEEy9oxdsmdSK
Rb4L+Lgt8s1+EcXCyvCkso4RXJHPmVk1CVpzrrUsJXvqH1w/Mt5n9n31uSvtFkg/
Q6Eapenh3vW6bv/8T40YQbbbw7KCMfxoATSCk9+vcrm/E+j5ia6iXhDiHa87W+by
0QJIId4CmqiwOhrBDE1ILXuYp9ayaZGNrwHWxkAmAqHqe2exHYwxoMEsuL8qvjL1
U/Mg5FC8LjifOS52Zj2LlMifEn2p6g==
=ooYi
-----END PGP SIGNATURE-----

--BIesKuQNbSpzPwCg--
