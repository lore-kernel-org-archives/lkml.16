Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB0F25A2CF
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 11:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750936704; cv=none; b=T1hi6aPxzgey3ztxNb+D+pdJQKEJWAm43uJjoUFWbfLbAlPDsfWNN/oQHXrdIu37zG6YX51gVJsOlcmCV74X8j3ULYfXzF1ZW/6VBbYcZ3qRz66ft+h0QqbIX01lpo3ZFNsVemz06cTuuHMAo5j9Kqxo8vBHA11B9FKaHErgLmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750936704; c=relaxed/simple;
	bh=cZdfqNOjL195pG/M5zmssDAIlpdKlgz4b0sLq7q/4Ew=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=Irgym/XZc1Zoy/86lzkNhBENhMBdZCzqXVCcUe60z4MHD1czGpnSyF5qvtJpLN+ZJEBgU5PS/9H2d6RVeJng9AwdKaDBIXDXI2FaMWRAiCi1pH6mGkBv9baQoDYW+hHHcVPt4NGLSwh/WR+MQXEnZ0TWVCpDXZCDH3q8StMCMQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TUWh2MGM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TUWh2MGM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01010C4CEEB;
	Thu, 26 Jun 2025 11:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750936704;
	bh=cZdfqNOjL195pG/M5zmssDAIlpdKlgz4b0sLq7q/4Ew=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=TUWh2MGM6If6pxtYHuaFpppjLWQ1BthWXM56z6vPJiWcOwzJhSzUjjHsm5WyDwCa5
	 ANYi6MYTCCxxiikDkg/yAXePp6hvL3mXIKF1f6rnyOxiCwrMserIjm//6OCKZfBbiy
	 FfWpmooxsp1rDi0lJhJT6dH+j/EeuAMmOvqYOXRsSAMZGC4soXEwzjI9YxNQmdig82
	 j8cWeMM6CJWL7Hr5vG1RDotE2mcr2f2C0QtP8Y+k1FmRfv0FP++yB9XV8Cn7ldcYdV
	 X/5z0Kg2XywaEWu3dEDig9gwhA6p+TSDGtdD8jSHqmHSCy8Q5Am+22a/DeMMWrMvDO
	 rx5TY+QWSj7GA==
Message-ID: <6e1b830a83aded9354ba154cdf1100b6@kernel.org>
Date: Thu, 26 Jun 2025 11:18:21 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dharma Balasubiramani" <dharma.b@microchip.com>
Subject: Re: [PATCH v6 2/3] drm/bridge: microchip-lvds: migrate to atomic
 bridge ops
In-Reply-To: <20250625-microchip-lvds-v6-2-7ce91f89d35a@microchip.com>
References: <20250625-microchip-lvds-v6-2-7ce91f89d35a@microchip.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "David Airlie" <airlied@gmail.com>, DharmaBalasubiramani <dharma.b@microchip.com>, JernejSkrabec <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Manikandan Muralidharan" <manikandan.m@microchip.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Robert
 Foss" <rfoss@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

On Wed, 25 Jun 2025 14:11:54 +0530, Dharma Balasubiramani wrote:
> Replace legacy .enable and .disable callbacks with their atomic
> counterparts .atomic_enable and .atomic_disable.
> 
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
