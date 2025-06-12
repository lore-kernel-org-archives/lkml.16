Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5039222094;
	Thu, 12 Jun 2025 15:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749742219; cv=none; b=uCU/pvcCzXnanLBDj5FGRqCXG8VR8PdQh0Z680mRfQ9lXlitoFGoNbTj4TcVdk14/c6dSR4iup9FSQJcmOQCsPP+esi1knJyBtM5UA/LzvnGRlOmC9N/x0MJtbNXqdVTE7Ek4KJiXYhx+QMBsBGrF7YxZwYiRIKXGvfhrjcK0OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749742219; c=relaxed/simple;
	bh=ZYe5VuTizv6cLyCXZAe69ksDuxTDKafKtBpZ+ydLU8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p7sUX/i3SMU9uAN6viee4zqqFhYzZf+jFNqqU+sVL9fGq/ES9vBx6wSy1AU03gyrbVP/QWUg0L/Fz26IYXvUUPvfrDDjcj4vBA7nibO2jtrpXJYFsaY22899mcxfDZir1LTC51ZWZ7N/Sr3GMm3iROkQv7GuTU4dHMCQUChTBII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EXJsmDST; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EXJsmDST"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2742DC4CEEA;
	Thu, 12 Jun 2025 15:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749742217;
	bh=ZYe5VuTizv6cLyCXZAe69ksDuxTDKafKtBpZ+ydLU8g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EXJsmDSTN5rIn9KOOJw9nkl2hFejRyVWk0FYT4/7RfqUR4KoKILK2Iixf3/y+QuCX
	 voG8hX5o+ipvNTnwr6mZ4r65oc++dZuZqUu3RJy7+tCyU5+xTkdAi5XNI2FKl8qVXu
	 qaGedbGcPwUKF/c2098M61JRLui1GvFVzbSSqwcocOeI9Wgl5TdvcLDryiBj+eASqv
	 JSRPMCV2I3Q3ft5OTLU2Rtk97XOpVLXxCjcz/oWd7UwhqJjYiy1YZDQFIVk3glfjez
	 AwNCRuxM2yOYaWNS7aNPDrkoViTAP1HbqqoXwQM9mJuYb+uzqnu9MoWgPoFaYd6HLN
	 2CRqHL/hKCXfQ==
Date: Thu, 12 Jun 2025 16:30:12 +0100
From: Conor Dooley <conor@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: document Samsung
 S6E8AA5X01 panel driver
Message-ID: <20250612-lively-duplex-ff45181ffd5a@spud>
References: <20250612-panel-samsung-s6e8aa5x01-v1-0-06dcba071ea6@disroot.org>
 <20250612-panel-samsung-s6e8aa5x01-v1-1-06dcba071ea6@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oIPRfQLPeZSrwhTs"
Content-Disposition: inline
In-Reply-To: <20250612-panel-samsung-s6e8aa5x01-v1-1-06dcba071ea6@disroot.org>


--oIPRfQLPeZSrwhTs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 08:22:41PM +0530, Kaustabh Chakraborty wrote:
> Samsung S6E8AA5X01 is an AMOLED MIPI DSI panel controller. Document the
> compatible and devicetree properties of this panel driver. Timings are
> provided through the devicetree node as panels are available in
> different sizes.
>=20
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--oIPRfQLPeZSrwhTs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEryhAAKCRB4tDGHoIJi
0ju+AQDPB87WoSU5h5E67DBchhB299Zn7B0ap+rS8+e1CKv4egEA7w6g031TcD0b
YPOL3AOVGx7UaD+vN3g7XChnrc4L3A4=
=xx6g
-----END PGP SIGNATURE-----

--oIPRfQLPeZSrwhTs--
