Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E74C1A9B32
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 09:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748855347; cv=none; b=LQK4IZhBXKBsaDilIBjNIsvhnxbt1KjRD3ZYUVhtEF7N+3Yiepmj9uPFzYHojVrQjV5zRrNyRFJA6UcrCKy6xASvdyJbam2OURYoBGR9Z4hukl0TgHriGMB8nwe4afSs6vUxvMzb4K7w32m75nbUwIvQMfyOkb054wo2LLshcRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748855347; c=relaxed/simple;
	bh=ZzJSmNulbJA4MVD8t/C7Muasm1dszCIGGJqupearam8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LEkMrikkDWyRD+PbZj4SyEXywaWA6f9fOp0iCCK0zF4APofXOIAxGHQ5MiS4VwDBMDLsHxNNJr+J05cuiMkKL/ol9To5V/LDKUNebbXb0NSc9+M8OTzv7tkh5qV0nqSNbNNsCPNiWEAwBC+oABzrvbW5qPldDyRRRbPoT7oo0Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=moFuTHDi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="moFuTHDi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AA37C4CEEB;
	Mon,  2 Jun 2025 09:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748855346;
	bh=ZzJSmNulbJA4MVD8t/C7Muasm1dszCIGGJqupearam8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=moFuTHDikOi6PpkwcQn6TxLIH4tHzrtyoyuaM1egnK9xrfIqd3bKIq9hfxclUUaGt
	 DbPYd/KEmrUs/xAnsLBQcpY0FaKzoSrB4GnrTSxZhhvxB7r1acKE+QdnU0p0fKwzEe
	 V643FvYJuEHpgXKzwUc32HrKsIsbTMgj2tz1hKbMqjUej86G7s2n9nK0YJ2DJnz986
	 qjGHCst+AvQayTes9RP4wKbdCEzbzem7qLuYjfT7YI3s3aCzvety0GbHqkeLc4y6+2
	 wJ4Vz2YYGuUvf1OL82ZAecEfkXPXsEBkRCSltaJvk3WRp3NTir/H1pHoOeJuxK6xNo
	 fdAIzLUx2ZLeg==
Date: Mon, 2 Jun 2025 11:09:04 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v5 00/19] drm/connector: hdmi: Allow using the YUV420
 output format
Message-ID: <20250602-invisible-goose-of-triumph-ad6e5e@houat>
References: <20250527-hdmi-conn-yuv-v5-0-74c9c4a8ac0c@collabora.com>
 <174885511345.447765.15117962049678380491.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="odmupuflintx366b"
Content-Disposition: inline
In-Reply-To: <174885511345.447765.15117962049678380491.b4-ty@kernel.org>


--odmupuflintx366b
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 00/19] drm/connector: hdmi: Allow using the YUV420
 output format
MIME-Version: 1.0

On Mon, Jun 02, 2025 at 11:05:16AM +0200, Maxime Ripard wrote:
> On Tue, 27 May 2025 15:11:08 +0300, Cristian Ciocaltea wrote:
> > Provide the basic support to enable using YUV420 as an RGB fallback when
> > computing the best output format and color depth.
> >=20
> >=20
>=20
> Applied to misc/kernel.git (drm-misc-next).

Also, thanks for your persistence on this, I'm glad to see this queued up :)

Maxime

--odmupuflintx366b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaD1qLwAKCRAnX84Zoj2+
dhGXAX93Dz78uq4cT+8ybJTFsTo2OB9hFiItpZIX0qF8d8xDHdOTPWlwi4Y44ALV
zyBTd3sBgL/wrhIZV34K1EVyiW0aW25cvpFfjc15W11XbZId80IWS75ghw5kkriA
JHiek0GO9w==
=gMoL
-----END PGP SIGNATURE-----

--odmupuflintx366b--
