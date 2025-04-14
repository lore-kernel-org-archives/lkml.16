Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D23C2FD
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 14:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744642330; cv=none; b=JouFpYYsYO1ez3lv/USk9TnFjhAVrIWxX23xV6HBMwhnDr+07z0T8+cHSktX0CjPDu3T/4jHBs+o2LqJI2eUgTuGwevY4NjZkJn3zyfRtibQNrRoCKB4ptDw9L60G7kGkHGFQ01pxoHBrPx0IsvCEs4rVQ6sJF/P2wVA4VSQoFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744642330; c=relaxed/simple;
	bh=EWYXK6utjGSeOg8p9KKcNQ8UUIiM6+pFjWHg83VZzLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UP3SYlnSY8MC8EQak8YrLzM/SD3BU92uQS+HuYfRcAb9czJLwjvvOtKRtdnD9oNuArQDC65vQh4B9m2TDcDkEZxMC6RahASIN2xTewqwYDKSFu7c3fvVG7Uug8auXF5VTYLGr6WmbUKBaw8LXciCBnv5yEmdwca/iS3e9Ze+RoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d/jyxRfv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d/jyxRfv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C356C4CEE2;
	Mon, 14 Apr 2025 14:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744642329;
	bh=EWYXK6utjGSeOg8p9KKcNQ8UUIiM6+pFjWHg83VZzLI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d/jyxRfv6Jlouc1xYJokyPIJpZYjp1k9a1moCqo2GJYS7ibupG5sztbcej1OLuiRy
	 4qD6hxnUJysVAqJZ+wRBj/xl8cX9IkH74FJyQBAFfKEbC8WUmfxt2H0p0ggPV4MUIL
	 A/UX0aoGRw/t7lade3HYf4HoXNo0G/M6VV1rJslBZNrByQYK8HIYplG6d7VzAb90DA
	 TFPyzSX218fOy4tYkWHNM07CH8a6KHXYgrGmOJmdow7xJ39X1iZw8XviyeP5W5r29+
	 GpTZEo5PQLY0TE3YuKlI41p/cKusLYyRv5ViQTv9Kylskq1Djx17Cl56QXnUWEcFtH
	 M6+cbqJG7cUgw==
Date: Mon, 14 Apr 2025 16:52:07 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	=?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v5 03/11] drm/connector: add CEC-related fields
Message-ID: <20250414-augmented-origami-fulmar-acb97b@houat>
References: <20250407-drm-hdmi-connector-cec-v5-0-04809b10d206@oss.qualcomm.com>
 <20250407-drm-hdmi-connector-cec-v5-3-04809b10d206@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pc6nu3m6jzhyff3u"
Content-Disposition: inline
In-Reply-To: <20250407-drm-hdmi-connector-cec-v5-3-04809b10d206@oss.qualcomm.com>


--pc6nu3m6jzhyff3u
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v5 03/11] drm/connector: add CEC-related fields
MIME-Version: 1.0

Hi,

On Mon, Apr 07, 2025 at 06:11:00PM +0300, Dmitry Baryshkov wrote:
> +/**
> + * struct drm_connector_cec - DRM Connector CEC-related structure
> + */
> +struct drm_connector_cec {
> +	/**
> +	 * @mutex: protects all fields in this structure.
> +	 */
> +	struct mutex mutex;
> +
> +	/**
> +	 * @funcs: CEC Control Functions
> +	 */
> +	const struct drm_connector_cec_funcs *funcs;
> +
> +	/**
> +	 * @data: CEC implementation-specific data
> +	 */
> +	void *data;

Is there a reason we don't just skip that data? The only user I'm seeing
so far are the helpers, and they only put the cec_adapter pointer in
there.

Can't we pass the connector to CEC and make the adapter part of drm_connector_cec?

--pc6nu3m6jzhyff3u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ/0hFgAKCRDj7w1vZxhR
xfO9AP4378jYjCW1nqnXF/1sSnm/il612oYqWtMMxU3TETGBFAD/UMRtM6qs/l2Z
c8AeNXMCFUMqpaiXwg0vvadrAr/q9gY=
=bCGT
-----END PGP SIGNATURE-----

--pc6nu3m6jzhyff3u--
