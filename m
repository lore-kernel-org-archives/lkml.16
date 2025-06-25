Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DCB1E32BE
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 06:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750834673; cv=none; b=op2O01cIAuEkWDxC51QIedPqmidSLDr22EYc72/mER/a7Z5arAViWAl46/YXVLH9Wn3kibs8t2QOQnPuohTNhQrj7Bq/YMCWlmu6dQIazCq8ALUbJ1XTQ75cBzYCPFRe04Fj8VDSGhZ0dlTOHvTZ40CFw/JWl1wWnC+ffU3GLc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750834673; c=relaxed/simple;
	bh=TH2Sh4xVmeTr5CC8o4+TFv9M1ig1OcnOG6XJmVoW7cU=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=K8cUYI564uAAEnEG1zPGVvh2XKKqCgZKsM9cyNkubNXoJ7h6/TNnxsgAjUu0oYZRidh5E1bb0U0qnXvu39XVdA1WCU4P+GtyhhVwEGtyAbGNYTjrGzXPczww/OGSN5MSm+jZ40XT6D1rb/E6OGVlQ2DCWa0YqKtrfg1A5tyZ0aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tglTcBxl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tglTcBxl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E546C4CEEA;
	Wed, 25 Jun 2025 06:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750834673;
	bh=TH2Sh4xVmeTr5CC8o4+TFv9M1ig1OcnOG6XJmVoW7cU=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=tglTcBxlcQageCvCnz+ngh4sx8zeege1NpLDgdHvb5KyKa3cE7XX66xmfaYExpfS6
	 D5m4fZvgdoGVKdXSsbpA25tLTJvUAb133Amk21SnOHSOGgEc/PB+JTYYaEq9UFcb8t
	 3t/dno+vJhuYaqv6hNpLvXc0rVsOW45BGucKZGQQK2qh964bpgb/Br3l36G3GrjAIK
	 K/Glsuu5jJsHkhOZQHXD06B/odNvZxIEI4ZZuugtKOoG9mkNwn7v1AcCrWGL1Jm8U4
	 fdgkd5zycrnDHjitGZgd2JvTQvjFZC4WisrGkcp0KmvLWEbxy6EPUB1cFdzN2j+PQm
	 ozwcOgfAOTYwQ==
Message-ID: <0a152b0fc2b95835cce7a0703745793b@kernel.org>
Date: Wed, 25 Jun 2025 06:57:50 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dharma Balasubiramani" <dharma.b@microchip.com>
Subject: Re: [PATCH v5 4/4] drm/bridge: microchip-lvds: fix bus format
 mismatch with VESA displays
In-Reply-To: <20250625-microchip-lvds-v5-4-624cf72b2651@microchip.com>
References: <20250625-microchip-lvds-v5-4-624cf72b2651@microchip.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "David Airlie" <airlied@gmail.com>, DharmaBalasubiramani <dharma.b@microchip.com>, JernejSkrabec <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Manikandan Muralidharan" <manikandan.m@microchip.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Robert
 Foss" <rfoss@kernel.org>, "Sandeep Sheriker M" <sandeep.sheriker@microchip.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

On Wed, 25 Jun 2025 10:26:12 +0530, Dharma Balasubiramani wrote:
> The LVDS controller was hardcoded to JEIDA mapping, which leads to
> distorted output on panels expecting VESA mapping.
> 
> Update the driver to dynamically select the appropriate mapping and
> pixel size based on the panel's advertised media bus format. This
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
