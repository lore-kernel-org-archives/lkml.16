Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99440275111;
	Thu,  8 May 2025 14:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746715127; cv=none; b=nNvaxRQM+xJV6dCy8KLLgqet3vgQe/qkSOGXjtyuGPIAf7mVyQLLqcsUWdcn7SKsdzhW1adB7cSEwcmuj305wgVZGVRzRC+ZpiPIrc2I+hz8GWBhROUUhNKh2CGU4B5zAaULgUq/OLXo5Fx5tw+Zd4yeqol5vKvkhQSYqH1QUaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746715127; c=relaxed/simple;
	bh=9yOcdIne5y4Mf4C+Ln8+C/5lI4uoJxGEYh5DXK7tSvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IuU9Je1/Iu0xSBWu2IEClKSWogv0dpJBEFl4l6q3KiDQ5rlNHH1JFJfw7VfRO/X4tn2gkLstPGzCrBZxDxUXPwYXZKB6gmOBSNMLsf1+CT0D88nAneA6YrU6/rKX/tDWxAnb61gzPLwyhympCim6mo5/JZi8ZYBS1vK3LYKGmzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t4x4rTXQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t4x4rTXQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 395BDC4CEED;
	Thu,  8 May 2025 14:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746715126;
	bh=9yOcdIne5y4Mf4C+Ln8+C/5lI4uoJxGEYh5DXK7tSvQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t4x4rTXQ7kusjUppFTp4Ck5eMgH7su/kfpNqnzpfIgdisfxmOm3v0y7tw/2OoJ/xC
	 OGQs+U0IchViQTO8Tc3KyzHzZkpLSRKKhkFURNHIBpcvW6nqpKy90nEhV4J7e1Uesn
	 yvf/Inrwlcl0ocDa03cjavV1U/XW3ibBjDfmC85gPvq3qBZ+bapDRM5CNz44n0ppEC
	 xdTBwvO5l9L5pTnch/VSXsLvsYqvsK+Gh3fifVnX2slKHv3g+1dPmD2mL/3ZRyLvLU
	 cwifnydE/LqsxyVPb7musWatO/16oUjd+H2Nghv039r5ej5iubHSvohkxqOHkkcr1c
	 3a2HnHEZdd+zA==
Date: Thu, 8 May 2025 15:38:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel: Add Novatek NT37801
Message-ID: <20250508-unplowed-uneasily-7f075bdf380d@spud>
References: <20250508-sm8750-display-panel-v2-0-3ca072e3d1fa@linaro.org>
 <20250508-sm8750-display-panel-v2-1-3ca072e3d1fa@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3W9tYwD3JkBFR5uI"
Content-Disposition: inline
In-Reply-To: <20250508-sm8750-display-panel-v2-1-3ca072e3d1fa@linaro.org>


--3W9tYwD3JkBFR5uI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 08, 2025 at 04:34:47PM +0200, Krzysztof Kozlowski wrote:
> Add bindings for the Novatek NT37801 or NT37810 AMOLED DSI panel.
> Sources, like downstream DTS, schematics and hardware manuals, use two
> model names (NT37801 and NT37810), so choose one and hope it is correct.
>=20
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--3W9tYwD3JkBFR5uI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBzB8AAKCRB4tDGHoIJi
0geyAP9vnIZd5waQjrk3f24fmdDXXRBH1tAOFAgrVTxWJg/AcQD9FSjdHHh/rK+K
szh1K8B+7TvVUXzIOrlx6txW6wIfng8=
=vxm7
-----END PGP SIGNATURE-----

--3W9tYwD3JkBFR5uI--
