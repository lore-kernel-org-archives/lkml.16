Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E55C1FC0EA;
	Mon, 26 May 2025 14:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748269799; cv=none; b=uxE3G35VSfCookCpcENOF8uRkxDaWG/m9CSYJHtqtqcBaKxr7ANIM2tzN8EHMSSQqVvBFTlG5tdNLsS4FSYgGJVECmPDoVhkPmzDnOI37+Cvf5D2XvhVQY2OWagxdnXOdLKyjCa+Am3Bhl5Ny2C2QK/Wv/tMQoPAObPaa6R1qpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748269799; c=relaxed/simple;
	bh=jXxtsHqy49HEr7W/9gJvil9hdu/xf25Qj4R61xruCPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U3P3n0KwdjYDJXfhwAS3HDiH7s2FW4mc7TO9c8BrF5fcpREOSt8EI2yjDHAYNp4DcrhU400OXcScaX8sOkNwabVvkLhmg+UpRhvWbm37U3wWyNvvIkD9Va01ZiFgCMX7jOaFdtElyWWTRIhCtVOgus/hs9QD0gO3nwfttZTEFYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RYB2bOQP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RYB2bOQP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 843BAC4CEE7;
	Mon, 26 May 2025 14:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748269798;
	bh=jXxtsHqy49HEr7W/9gJvil9hdu/xf25Qj4R61xruCPU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RYB2bOQPnMVuzF+jZgA00OrAQt2+/HUjMP0htmSkX9GzBM4eXFhoy+ELlfBKH42Hf
	 pPNONSpLStJLWsYFn7vDOLiBa/wF4oHXMRbG3468eJbYVtJNAb3ECQ/BbxK0Lv4LIj
	 4q/EtuCYOea+8Aej0duZoN0hFYC7TfB7eSOyD9QGe00k9HXjGA3A1wL9eCsZZalY0b
	 IJ0nIjuU8VG1lAvF51OgTxSFW7xRq1GOoPJymqA3b5jwVQfJYyvwgyEwZ26ZIdRA1e
	 2faSDf1r2QuWETwbEMx6EnUr+Px4Q58QR7Yx1YAo0o5mbPWmNulcTO9xQbb3M4xgbZ
	 3csA7JLDRukxA==
Date: Mon, 26 May 2025 15:29:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] media: dt-bindings: mediatek: Constrain iommus
Message-ID: <20250526-churn-survey-92e4ac835db3@spud>
References: <20250525051639.68753-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6ewRwsCC7aREqelS"
Content-Disposition: inline
In-Reply-To: <20250525051639.68753-2-krzysztof.kozlowski@linaro.org>


--6ewRwsCC7aREqelS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 25, 2025 at 07:16:40AM +0200, Krzysztof Kozlowski wrote:
> Lists should have fixed constraints, because binding must be specific in
> respect to hardware.  Add missing constraints to number of iommus in
> Mediatek media devices.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--6ewRwsCC7aREqelS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaDR64QAKCRB4tDGHoIJi
0vZWAP9BR4vLb8OlwsUrb+fCOvG9Bsq3De8bY4TqVlmsHnP9PAD+OVk4U34TmxkS
EV+BCTevs7Syc2H23i8NMl+1tSwmuAU=
=llAX
-----END PGP SIGNATURE-----

--6ewRwsCC7aREqelS--
