Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895282F42
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 14:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744641688; cv=none; b=Tb9QKhWc97VylCakEZZwMSK2bRNeRq7bED2/tsm7uPTsg6fK5HL2wGbgsgUTsKjt6ZA7K48lu3BSNC/cz2AN4V/tyCIO8nKA54KrlnlL/Smi5DktSLtGnDzSAkbhTxC1qpYIQL2e4IIKcbo+fOf+GFVOzbFgXJV49jLaCdBaqHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744641688; c=relaxed/simple;
	bh=cWqnGKre/AJ+uBJDkw2xfSaRhLZK6lmGSm5x9aeHPGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nfjQJlffs81FOiXUbqGP56AhreO4hs5TZzOQlN2Phjkc7hy+GMvrReJUZnw2OCqXUZxRupuYNIy1STJjt39UcDPHYpiU8EPMAam+nZaQyXJsQwPjdIizS47xL5SvRDZLlb3omQjmNkveVV/5R62L7LGxwdFdd1JpR8CpfI0skwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fo2J8iIh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fo2J8iIh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D4EEC4CEE2;
	Mon, 14 Apr 2025 14:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744641688;
	bh=cWqnGKre/AJ+uBJDkw2xfSaRhLZK6lmGSm5x9aeHPGg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fo2J8iIhDDDjtlNmmfpOmEqeq5AOfb9f1YVPvFeU/qRn33XnWUVF4J80EMbMwLxcK
	 99YdPtbWncuGBxy9ZEDesg6vf31ZeDt+g/Sc8XZOgBLBZDF+AM4mSYgmhdQKm2ZJd2
	 XwFD/XqTNWdFG/COCZ15eRnWQoX+uyPD1AGBzHhXUhrq7I9iSGgXVqsHt8+YBtrerF
	 e8MhB4IAcim92G8FggtQKdzNJbbP+Bqd7qz575vkIfMAsG2flaEFHESqwaB4Bps8uH
	 GMHWnTUubhHpq1Z3k+zDcZwo2exqididE9rQ+C8c5ASaxyW8Bj0PtDsk/xunZFi3Wv
	 SmQD6KVwCbIlw==
Date: Mon, 14 Apr 2025 16:41:25 +0200
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
Subject: Re: [PATCH v5 08/11] drm/vc4: hdmi: switch to generic CEC helpers
Message-ID: <20250414-thundering-marmoset-of-promotion-c8e0dc@houat>
References: <20250407-drm-hdmi-connector-cec-v5-0-04809b10d206@oss.qualcomm.com>
 <20250407-drm-hdmi-connector-cec-v5-8-04809b10d206@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kisrvyl6ygk7uwlb"
Content-Disposition: inline
In-Reply-To: <20250407-drm-hdmi-connector-cec-v5-8-04809b10d206@oss.qualcomm.com>


--kisrvyl6ygk7uwlb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v5 08/11] drm/vc4: hdmi: switch to generic CEC helpers
MIME-Version: 1.0

On Mon, Apr 07, 2025 at 06:11:05PM +0300, Dmitry Baryshkov wrote:
> +static const struct drm_connector_hdmi_cec_adapter_ops vc4_hdmi_cec_adap_ops = {
> +	.base.unregister = drm_connector_hdmi_cec_unregister,
> +	.init = vc4_hdmi_cec_init,
> +	.enable = vc4_hdmi_cec_adap_enable,
> +	.log_addr = vc4_hdmi_cec_adap_log_addr,
> +	.transmit = vc4_hdmi_cec_adap_transmit,
> +};

Did you compile it? it looks like drm_connector_hdmi_cec_adapter_ops has been renamed, and it
doesn't have a base.unregister field anymore?

Maxime

--kisrvyl6ygk7uwlb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ/0elAAKCRDj7w1vZxhR
xRstAQDseeLF3+wOjRX4FDWG1gzsPN4u0U3uth+lr62PR0BwxAD8D+xv+rQhSZRL
r0aNflxzktpW7TPg2LqP74PvX2cw0g0=
=+zwv
-----END PGP SIGNATURE-----

--kisrvyl6ygk7uwlb--
