Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10EA142E86
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 14:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744642041; cv=none; b=dSzUdlUYTsanMTqI43Kg9rFt85ur/wXHiuA92zM26FxhvdB7n0bHBKrHrrtBu3JSCYZBub7+dR9Wwwde2036JyIJDWsJEMS4IYvylCpmRCMJKJS3IBU+a/0iedvsvg/uJRV76VH+DazbU2Ho6++iWEEjlkUS8sanhAXpRGt6VDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744642041; c=relaxed/simple;
	bh=h9uPxkbu37JMl9K8mq07mcmONRcYkFkLq//paRKhktE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gimJpYqSxSavSL8RAq0XTE/Gg4wqX17o9brv4xxubv2Znhz22QsORTd0DsxBShVLWpwPWx3SVUpd64xrlZ3N0ORvO9G5jppUgkVmK3LmsHRTigF5hyAdFWDAtYLVWLOuXjyCu3xnNDAJMTHKfqpRovHZC/tf+4A/IiEu8WrGFlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HmfJW8uS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HmfJW8uS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6F25C4CEE2;
	Mon, 14 Apr 2025 14:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744642040;
	bh=h9uPxkbu37JMl9K8mq07mcmONRcYkFkLq//paRKhktE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HmfJW8uSoQQz4BSrQG43jo8P7iD2mv7jRAtmfZm/OSsbqbCwEltK7CMOdqMWTC42r
	 AZR+QUG4owaz0bvILc2U6Znpyu4FbIrxtiDmB18Pr5GePh91Reja47WLefjZkDIa2p
	 dB8cUtN8sZjwTYsE/a2L8f65UMn2GAFgVwGl/WswCaOEPJ7xhA14fQ/eCTkLrPHE9b
	 aS9r7Skx9E0eL7b1o22vnvlJt/hn+VBphHK2vkCArE60vBUTDuzQF/niL05qJ77bUy
	 vae0H5OeOjHYwwzspU3zQIpEuhlevEUKsnYw1D7LT0VQtpOJXFtmGD9hz99JjB53hF
	 S4yCj/HFNIFhA==
Date: Mon, 14 Apr 2025 16:47:17 +0200
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
Subject: Re: [PATCH v5 04/11] drm/connector: unregister CEC data
Message-ID: <20250414-hissing-auspicious-goldfish-78b9dc@houat>
References: <20250407-drm-hdmi-connector-cec-v5-0-04809b10d206@oss.qualcomm.com>
 <20250407-drm-hdmi-connector-cec-v5-4-04809b10d206@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="za6i6cutm7oj65z7"
Content-Disposition: inline
In-Reply-To: <20250407-drm-hdmi-connector-cec-v5-4-04809b10d206@oss.qualcomm.com>


--za6i6cutm7oj65z7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 04/11] drm/connector: unregister CEC data
MIME-Version: 1.0

Hi,

On Mon, Apr 07, 2025 at 06:11:01PM +0300, Dmitry Baryshkov wrote:
> In order to make sure that CEC adapters or notifiers are unregistered
> and CEC-related data is properly destroyed make drm_connector_cleanup()
> call CEC's unregister() callback.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/drm_connector.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index ba08fbd973829e49ea977251c4f0fb6d96ade631..ae9c02ef9ab102db03c282468=
3ece37cfbcd3300 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -743,6 +743,13 @@ void drm_connector_cec_phys_addr_set(struct drm_conn=
ector *connector)
>  }
>  EXPORT_SYMBOL(drm_connector_cec_phys_addr_set);
> =20
> +static void drm_connector_cec_unregister(struct drm_connector *connector)
> +{
> +	if (connector->cec.funcs &&
> +	    connector->cec.funcs->unregister)
> +		connector->cec.funcs->unregister(connector);
> +}
> +
>  /**
>   * drm_connector_cleanup - cleans up an initialised connector
>   * @connector: connector to cleanup
> @@ -763,6 +770,8 @@ void drm_connector_cleanup(struct drm_connector *conn=
ector)
> =20
>  	platform_device_unregister(connector->hdmi_audio.codec_pdev);
> =20
> +	drm_connector_cec_unregister(connector);
> +

Actually, since we know that the HDMI connector is drm-managed, why
can't we make the call to connector->cec.funcs->unregister a drm-managed
action registered by drm_connector_hdmi_cec_register?

Maxime

--za6i6cutm7oj65z7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ/0f9AAKCRDj7w1vZxhR
xWeFAP9tC/rL1qz6F44OceHXYWDpiv2S2ByDvX23IObFZZIhpwD/UOyfKXhq8Wbq
8hT9g6wj33SL7RUyMDFRtQeZMspHTgY=
=Ha6M
-----END PGP SIGNATURE-----

--za6i6cutm7oj65z7--
