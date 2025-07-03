Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741EB2D0292;
	Thu,  3 Jul 2025 09:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751533313; cv=none; b=mPI9SvGtWtiaDiHKjebO/GED2RbUqL8aAIZRKlQTmH7zE6cvn77K82Vct02EOndsbWr1XHXd84i5HsikC+2Ek7NwmK0QuQxfj/hm8zNbGYgTjG9/R/Wm3ZpvDeiNlW/CwulUeBrnpiTEGPqPi4M4jnHq9QaMRHNC4PYYa6uZq7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751533313; c=relaxed/simple;
	bh=NAPX3z+5Hzs1tzhGj4iLZXmU149A+uDXJDgyn5k9ggk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sXWnncl9kuEUATWR5UZP5SRbjtEp8tlG5YFgUWC/eLRjl/ckobrgJDpl9p44MACM8oC7KXEaUb3d33ElE6zC8CfM8/JYIrnSNOFgCg5bIyS5Dj5vUcDa8ZFXxWSumZ3CDrvc9bN4MwszW81fG6mFYHkbNUf4m69OL5FNZOfUYNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JaNj9cTv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JaNj9cTv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7961BC4CEE3;
	Thu,  3 Jul 2025 09:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751533313;
	bh=NAPX3z+5Hzs1tzhGj4iLZXmU149A+uDXJDgyn5k9ggk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JaNj9cTvilRL1BXp9dI71RP1VExcmeRml6tzrJQmopCX2CCjbnw4R5UF9887xL0F7
	 Xifb8roVNzKhu7Sah44k3nkKKRwb4NHGCHLJPA+9e7JKMwQbjeKptez22c/MsErYQx
	 V2ZqTO/NHMkUPFW+WqUfL2gE42k+2R3s20vWb7SVh42DbAvOjaCEX9K9QbTS5423+W
	 GS6yNoKt9meth48YXsi9sFRkkVSSrEeN8BF/qdZfgm/6haetTQB4c2zkSfco6mXL21
	 OT+MnJSDdWXOUAHOlLEJhteMpR0tXlg6xdj2wj1omjH0zwTMLXzVZuEPott84R64Yz
	 8roZc413BpGKA==
Date: Thu, 3 Jul 2025 11:01:50 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: panel: document Samsung
 S6E8AA5X01 panel driver
Message-ID: <20250703-true-archetypal-skylark-dfb055@houat>
References: <20250625-panel-samsung-s6e8aa5x01-v3-0-9a1494fe6c50@disroot.org>
 <20250625-panel-samsung-s6e8aa5x01-v3-1-9a1494fe6c50@disroot.org>
 <80055981-3624-4165-af0c-3b60c345e8f8@linaro.org>
 <4b9e44b14395ff4c64eba1bd71e63150@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="vgt7kszogf7yzhtt"
Content-Disposition: inline
In-Reply-To: <4b9e44b14395ff4c64eba1bd71e63150@disroot.org>


--vgt7kszogf7yzhtt
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 1/2] dt-bindings: display: panel: document Samsung
 S6E8AA5X01 panel driver
MIME-Version: 1.0

On Mon, Jun 30, 2025 at 05:18:22PM +0000, Kaustabh Chakraborty wrote:
> On 2025-06-30 15:29, Neil Armstrong wrote:
> > On 25/06/2025 14:41, Kaustabh Chakraborty wrote:
> > > Samsung S6E8AA5X01 is an AMOLED MIPI DSI panel controller. Document
> > > the
> > > compatible and devicetree properties of this panel driver. Timings are
> > > provided through the devicetree node as panels are available in
> > > different sizes.
> >=20
> > Wait, why ? Why not multiple compatibles ?
>=20
> The panel dimensions is the only thing which differs. The model name,
> controller, registers, and functionality are supposedly all similar, so
> I believe this is fine...

If only the dimensions change, then width-mm and height-mm would be enough,=
 right?

Maxime

--vgt7kszogf7yzhtt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaGZG+QAKCRAnX84Zoj2+
dkaKAYCpDgUynGpFGg0nAqhZ30rfPSkxPdT3Biba4y/wI3F/AcjI9V5YST4HJiga
ZYrL9SMBf0M/4B6wrK0XPpwgMoKZsNfd5A6/xz/MW8Mf5bKc38jYSUrQQ4OzDSSo
1h6PhC25sA==
=PL0P
-----END PGP SIGNATURE-----

--vgt7kszogf7yzhtt--
