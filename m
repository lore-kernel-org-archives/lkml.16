Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3D53234
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 14:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743430189; cv=none; b=L1E5o7HuwdkCjl8iHf+B5ULjhECbAQgwV2GGL+IxyiLZeysuypnD7YDTjPhb2qW0MxYz34y4/bPo2+VakICI3I73UyDeW2J0urDPU6IUQEvGBy9rrHXs/6D6ELG2T7mMUQkoDEGpfgY695UW83qR0r7bxl+4FsJgJ70FVL5Q2Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743430189; c=relaxed/simple;
	bh=TwSbUk2bexhBRfYZh2O2px1+cAq6T4pwFbXJLNozjNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NIVHQxZb30fxAhFV2WEDiboka49HaRQaaZAaSUI00kmTJZ0mBaP9d0vWhAY7o2zCXeYKnb+y8SCMG0S5KJdZt2Gktt2Gl5aC2WJz2Z7duMejZRL7dBiERjNW/6EcrKaUvlfUUV8HUoBEiwfxg1LrZGBW/tCpsGQkENYDaNZjByM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TgWE4TFT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TgWE4TFT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 460D0C4CEE3;
	Mon, 31 Mar 2025 14:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743430188;
	bh=TwSbUk2bexhBRfYZh2O2px1+cAq6T4pwFbXJLNozjNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TgWE4TFT5TJnnKd32XnTxF64gPG34kwjwETYZ+oclfBfZhMpSdc2PrGfO0zI22S30
	 u1Vlj2Qx4I/F/mSDM+f7B84WEYnRKmfaH0Kkf3oec8INZyZ1Fj0vw8hmmsZEG3hLWM
	 3HtHgfK79276QhgtSR77rl3GZb/m78EZFfFEzZAJB+XFBNoX8V405FbQoxsnGAlv7b
	 nsocigMJTqfkngSDmTIRQqKIvTuhnBFaC1xeiAlLUOExbbdJUwW5Gz+UIKRbWeaM5V
	 iEkaGYwa+E9wkFo73tue119OyEuENr4ZWz6UIGplaZE4L7vMI+TO4LeTpgTx8/9Cyv
	 YePjfSwKCe8OQ==
Date: Mon, 31 Mar 2025 16:09:45 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 1/4] drm/panel: Add new helpers for refcounted panel
 allocatons
Message-ID: <20250331-defiant-jackrabbit-of-culture-cffe6a@houat>
References: <20250330-b4-panel-refcounting-v3-0-0e0d4e4641eb@redhat.com>
 <20250330-b4-panel-refcounting-v3-1-0e0d4e4641eb@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="imf3y3eouv67rpth"
Content-Disposition: inline
In-Reply-To: <20250330-b4-panel-refcounting-v3-1-0e0d4e4641eb@redhat.com>


--imf3y3eouv67rpth
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 1/4] drm/panel: Add new helpers for refcounted panel
 allocatons
MIME-Version: 1.0

On Sun, Mar 30, 2025 at 10:24:12PM -0400, Anusha Srivatsa wrote:
> diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
> index a9c042c8dea1a82ef979c7a68204e0b55483fc28..97a5457b64fbbe9c91c6a4f41=
b8e1fbfe4fa604e 100644
> --- a/include/drm/drm_panel.h
> +++ b/include/drm/drm_panel.h
> @@ -268,6 +268,30 @@ struct drm_panel {
>  	bool enabled;
>  };
> =20
> +void *__devm_drm_panel_alloc(struct device *dev, size_t size, size_t off=
set,
> +			     const struct drm_panel_funcs *funcs,
> +			     int connector_type);
> +
> +/**
> + * devm_drm_panel_alloc - Allocate and initialize a refcounted panel.
> + * The reference count is initialised to 1 and is automatically  given b=
ack
> + * by devm action.

No. I told you in my previous email that it needed to be between the argume=
nts and returns
sections ...

> + * @dev: struct device of the panel device
> + * @type: the type of the struct which contains struct &drm_panel
> + * @member: the name of the &drm_panel within @type
> + * @funcs: callbacks for this panel
> + * @connector_type: the connector type (DRM_MODE_CONNECTOR_*) correspond=
ing to
> + * the panel interface

=2E.. So here, just like you did for all the other functions you introduced.

Also, there's no reference counting yet, so that paragraph should be in
your second patch.

Maxime

--imf3y3eouv67rpth
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ+qiKQAKCRDj7w1vZxhR
xdJRAQCHNMX/G/Wz1zDjAtn+FlQ+3vGE7rpJ3/FEU94kH5uBIgEAlXtggqh5ttPL
ZlOzl5oF4hEn2BkxYrkpcsHty9iH5ws=
=txRs
-----END PGP SIGNATURE-----

--imf3y3eouv67rpth--
