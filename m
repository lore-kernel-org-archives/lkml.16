Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB29EDF59
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 08:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750235564; cv=none; b=F8nclv6wUNsuRNCCTDmVdBuBV87jzmvNzTUtd440jxtZrxucLItlj7SH6mi8vUxbBJAFJJdcf11sz7S83UVja0nFC17OA/t1lHW1nm49RgPr5cV/xEag2zMhLS6Yj9c5HVauV8359014NgIxWhPJhdONqIP8bVVIx2Fl8MVRhxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750235564; c=relaxed/simple;
	bh=PJ6j+8ZdYsZHp7QWIcTY310+ctKE6geptGnMh8L2Mt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lx7Kz1nF3uHX36cAz5r/n42vHqLCmFH5dX75CPGXX5RpMJ4Bx3rRk7lxrOYtO8R9kkxfI3F2UCmqVgRMHHqn+0ba/ma3H91zLlRbkOeBrXEtHFH7PvQ0BY4g9FxJwr3HpE01YXppeI7HDGGsEPr7D6ectUBx45D8+q0X+RWCi0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XhylNVb1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XhylNVb1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA55DC4CEE7;
	Wed, 18 Jun 2025 08:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750235564;
	bh=PJ6j+8ZdYsZHp7QWIcTY310+ctKE6geptGnMh8L2Mt8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XhylNVb1gqxkx5X7CHQ6fLstVuEo4fA9mTr19b0NQb22/UDJ9XGvasSa8bePDJhJq
	 XhBXPknvjUaH2PVrGjKxy3yT60SeiFw5IoBWNTOAsSbSCvqnQncmgTA05FjTkntHWa
	 qIgR3qU0vWk9RsVdGGA0rvsvWb4CLK8SM6A4BXusrkJS8r899nOft2/QDmDYs1H37m
	 BXyqPkJ+U0xVmrTam/RGWmU4pOU7YsBX2gChrwTdU0RQeW5QmRV+Szh4QtDw/CXZwz
	 3dE9DuHqS2hBjcFIk2U5SjPLKtADkMUjaVaz2G9NLAvJISPz+GvHgmvm4m3t6xiOX/
	 /Lq8QSIXegA6Q==
Date: Wed, 18 Jun 2025 10:32:41 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: jyri.sarha@iki.fi, dri-devel@lists.freedesktop.org, devarsht@ti.com, 
	tomi.valkeinen@ideasonboard.com, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/tidss: Decouple max_pclk from tidss feats to remove
 clock dependency
Message-ID: <20250618-groovy-stereotyped-aardwolf-27bb40@houat>
References: <20250618075804.139844-1-j-choudhary@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="o3iuasowtw5fgira"
Content-Disposition: inline
In-Reply-To: <20250618075804.139844-1-j-choudhary@ti.com>


--o3iuasowtw5fgira
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/tidss: Decouple max_pclk from tidss feats to remove
 clock dependency
MIME-Version: 1.0

Hi,

On Wed, Jun 18, 2025 at 01:28:04PM +0530, Jayesh Choudhary wrote:
> TIDSS hardware by itself does not have variable max_pclk for each VP.
> Each VP supports a fixed maximum pixel clock. K2 devices and AM62*
> devices uses "ultra-light" version where each VP supports a max of
> 300MHz whereas J7* devices uses TIDSS where all VP can support a
> max pclk of 600MHz.
> The limitation that has been modeled till now comes from the clock
> (PLL can only be programmed to a particular max value). Due to this
> we end up using different compatible for each SoC when the clocking
> architecture changes for VPs, even when the hardware is essentially
> the same.
> max_pclk cannot be entirely removed since the display controller
> should tell if a particular mode clock can be supported or not in crtc's
> "mode_valid()" call. So remove "max_pclk_khz" from the static display
> feat and add it to "tidss_device" structure which would be modified in
> runtime. In mode_valid() call, check if a best frequency match for mode
> clock can be found or not using "clk_round_rate()". Based on that,
> propagate "max_pclk" and check max_clk again only if the requested mode
> clock is greater than saved value. (As the preferred display mode is
> usually the max resolution, driver ends up checking the maximum clock
> the first time itself which is used in subsequent checks)
> Since TIDSS display controller provides clock tolerance of 5%, we use
> this while checking the max_pclk. Also, move up "dispc_pclk_diff()"
> before it is called.
>=20
> This will make the existing compatibles reusable.
>=20
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>

We've generally used 0.5% in drivers with similar requirements, because
that's what VESA requires for some mode generation techniques (and
what's required by HDMI too iirc).

We've never had to revisit it on any driver afaik, so unless you have a
specific reason to do so, I'd really prefer if you stuck with that as
well.

Maxime

--o3iuasowtw5fgira
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaFJ5qAAKCRAnX84Zoj2+
dgJFAYDGvW6I2k43jc31wGvUwVP7jxtWW8ARqty16W/rDRc+402Bx5u70qFJCLzp
fN7Lu+wBf0R+rjsLdxyS1sSix3d7Jr7xFSWRfcpHZT4JUOF/0VnYa8ISb0/up2xT
p1JUhFoifg==
=NPEJ
-----END PGP SIGNATURE-----

--o3iuasowtw5fgira--
