Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C9A155330;
	Tue,  8 Apr 2025 16:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744129023; cv=none; b=TLedABrdksrp3fMFe9Qs9qdP5S8ua+zBTJutKRfejKeolBgFltlinh7C3aeqx4VlJnX1YAsLojOR/EbnTFWlXIL2/2PAd8OnB2BsBIqRDFWUHEFoLdC7Qsgi2/BbuageYcsW82rXNmjH5BXhrh04ho8hvVtYD/YLBGPRoCO5VM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744129023; c=relaxed/simple;
	bh=D/u6fyxlHSleLdCoQek7uwAEz8bqYvcQCAlKrKE1QFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gpNIM/Y/o3tBJJhxvosIdWOS/WoZ+zW0ncBAbIuYsmbLlF2Z+nlOUE53cvnQzcCZZbCRKqjW/erWG8WEp5My6Unxh2i5uWCa8fEDBOgX6DRQxOtSOwd+Ep+Xe5BZ5/pU1AJEPtzUWma04Fo0zTYOGTAqhUYhn7O7c5F59eYi5d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Np+QzJ1s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Np+QzJ1s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4644DC4CEE5;
	Tue,  8 Apr 2025 16:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744129022;
	bh=D/u6fyxlHSleLdCoQek7uwAEz8bqYvcQCAlKrKE1QFE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Np+QzJ1sEoTb+6Un2YVwu0qVVvBRJFUz8qUudB4McJxCY71Rp7MuX0YCBnByq0MNg
	 9tl2nKluUeqmEVMjvU9Qdwpkr48AcAwDtrfEuejkvne6Le4WN8xdwIUuGRFhuTdfNR
	 zT1PUUOTQ9yeB0Q7Hl4Mt/b7PK/4pjL2rMmbQC47LU8dqKiHUB2uwSgKCBvrajSMJ7
	 W1SbaZsDNYYJ5v5aqvISyoOOUMXbPLPgN8mx6JfmWtmxXuAv9duaogRj4+gYCHHA91
	 nbGalk0MWaEuSwpTbhTk1FNIAd+/tD/1Ybe31ho7i0ZETQfVInNISK5pEluaGz2KgH
	 R2r4Y4VQU81tw==
Date: Tue, 8 Apr 2025 17:16:58 +0100
From: Conor Dooley <conor@kernel.org>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: display: Add Sitronix ST7571 LCD
 Controller
Message-ID: <20250408-aloof-bobcat-982662a5b448@spud>
References: <20250408-st7571-v3-0-200693efec57@gmail.com>
 <20250408-st7571-v3-1-200693efec57@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OKJtP93zrhfExoEX"
Content-Disposition: inline
In-Reply-To: <20250408-st7571-v3-1-200693efec57@gmail.com>


--OKJtP93zrhfExoEX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 08, 2025 at 09:04:28AM +0200, Marcus Folkesson wrote:
> Sitronix ST7571 is a 4bit gray scale dot matrix LCD controller.
>=20
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--OKJtP93zrhfExoEX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ/VL+gAKCRB4tDGHoIJi
0gamAQC0ifWDbCg05xEoWFlGsNIIHRu0xfM905aHXX6nF+Eh9QEAmqT0keC2p8QY
XrPKp65ATH1bYfg+XqgjzdKDVOcsngY=
=/fDX
-----END PGP SIGNATURE-----

--OKJtP93zrhfExoEX--
