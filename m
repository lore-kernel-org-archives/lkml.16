Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731AB5223
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 06:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750834327; cv=none; b=KpgWotzk0BbiByAa3e7UO7cvqC6W6FeLurDqOKktT7L7wZ3AzocV0sdv9DsfssfRNStahEP+EQfh54wLeqqwuWHSMU71UIeZw17hYXu8ETX1UtuYEhneXf6JjYCvN5oGcqn7k8cUXzC4Zcncxv5KanXnMSuaLFLzGNArHLaYCT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750834327; c=relaxed/simple;
	bh=Ch3e/A5r4GOgd1/KIeyk2VHq983bEKfZTlaigXX2/vQ=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=qDm62crj2caoNL4gyaC6w2tc25thzO2HK3Y4aaET3Umd8mvytUbqdfgv9avdtwFJh8/1IYumlEzuFqlILBiuICo2/0V3VHAzCnonJzzMEdoMJvp7rhZudAy38n4zI14y9nc/aPO8B8Kjzs9f1IT1uZyJdjxLf1082xdbMrLe/yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tc+iZjxy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tc+iZjxy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E050C4CEEE;
	Wed, 25 Jun 2025 06:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750834326;
	bh=Ch3e/A5r4GOgd1/KIeyk2VHq983bEKfZTlaigXX2/vQ=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=Tc+iZjxykSadbTHJG+c/zWpyfEsJKQuFNgcW4x3f/ztr/ln7b5VUjR9K6Rz/68cyV
	 Clqfx8wRZVOT7BtIt2VFveiFHrbo+HxIsKeFcjQaQOovo14+JRc6qwLMuN5MhMlzlH
	 q4DPfnqG4iRMWWoSboxLynePmRPPBlIusJw1w6lIhmLxZwRVYzBcb17Tp/DySx8hHO
	 25c5N4FOblWH+jQCnJQoh4R9rEmqzwp1GlzwGOWT0mW9fXu1KugLnd+o0mz3RuU8p5
	 rG8Vxwpu6pcV2ozpIp40/HGeBKgya55qQKf3Jbckn9jId1qvS3+/cLtE1J8xGejvQ6
	 Sv8Bv7FlB0DAw==
Message-ID: <db2c09490ab61264c98033c9e0dac762@kernel.org>
Date: Wed, 25 Jun 2025 06:52:04 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dharma Balasubiramani" <dharma.b@microchip.com>
Subject: Re: [PATCH v5 1/4] drm/bridge: microchip-lvds: Remove unused
 drm_panel and redundant port node lookup
In-Reply-To: <20250625-microchip-lvds-v5-1-624cf72b2651@microchip.com>
References: <20250625-microchip-lvds-v5-1-624cf72b2651@microchip.com>
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

On Wed, 25 Jun 2025 10:26:09 +0530, Dharma Balasubiramani wrote:
> Drop the unused drm_panel field from the mchp_lvds structure, and remove
> the unnecessary port device node lookup, as devm_drm_of_get_bridge()
> already performs the required checks internally.
> 
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
