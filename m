Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD6127584B
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 14:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744641867; cv=none; b=N4d2GlNwlCthcwVe0TP61KnsnX/QvsT94pOGawQGYnkeEggcQLfj5FuEr5tduf6nqlxThrVYE5rIyOYBMS1mq/V966GzOHEh1tWE9vI3C3tUjZGH2IaNTYd9yuEf2nYzpV9J19qmtWcQz4UyPoHU+hhtKQqdiKpvWy995jn8fNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744641867; c=relaxed/simple;
	bh=P0znGlUDfnyVJsOsiVX4FLU0nqmm2ya6A3L/1YprRoQ=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=nOYiE7+Nojq9d2iCkfe8KZl+UNgqNjOk723fwasue2CvU2jDim3ZGWT1zxvsxLfyy9Z3D6xwl211nY/ig5ILwf4aWnEuN6dHnf2jqCKDLvHLvVe5pCjWTFBuaIIeg3Oyp28yGQdGjT1YwMDkWjnvvHTEgM7fqZSNtiJq6jDrI4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IPaeC7GH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IPaeC7GH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7043C4CEE9;
	Mon, 14 Apr 2025 14:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744641867;
	bh=P0znGlUDfnyVJsOsiVX4FLU0nqmm2ya6A3L/1YprRoQ=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=IPaeC7GHZv45jV2BH5hVIKWsQ+yV0gFnAZ/ZRKWIjiz0Q/N62YckdRa6rmEf3/0Iy
	 ak3QwKVqvhthWCEppeVMYEmMptzu54kMXYaDDvni1wEZrYfBQzwGVXv+/eSav5xn57
	 BXliUcnro/oYz0Se4WSxWWWe/tacCOROX1wHulSOJuOdt1vFpbu59Xbxo+jBWGqRag
	 pcbdJi1YNcIlfS/TXtN5mGF98IAAui2/6+ZO0EcmBySub5yZXOeBB6owLKsB+tKJ0U
	 a9XcmuuPORRB4FOBb6sb8A02Sh1VeipAWKE9WtRMTbPJHK299ro1cCtIDiVw2Vunrr
	 DeCuboRVE62pw==
Message-ID: <9823d720e5d0a6562c3ffb288ec6be9b@kernel.org>
Date: Mon, 14 Apr 2025 14:44:24 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v5 04/11] drm/connector: unregister CEC data
In-Reply-To: <20250407-drm-hdmi-connector-cec-v5-4-04809b10d206@oss.qualcomm.com>
References: <20250407-drm-hdmi-connector-cec-v5-4-04809b10d206@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Dave Stevenson" <dave.stevenson@raspberrypi.com>, "David
 Airlie" <airlied@gmail.com>, "Dmitry Baryshkov" <lumag@kernel.org>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Raspberry Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Robert
 Foss" <rfoss@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

On Mon, 7 Apr 2025 18:11:01 +0300, Dmitry Baryshkov wrote:
> In order to make sure that CEC adapters or notifiers are unregistered
> and CEC-related data is properly destroyed make drm_connector_cleanup()
> call CEC's unregister() callback.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
