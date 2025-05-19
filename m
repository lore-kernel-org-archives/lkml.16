Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF823269816
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 07:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747641527; cv=none; b=OJ1VEehrpsp3S5GpfxMdGmrIR1s16HPo0+vLtgBNTgbK2cCuJ6XcBr0gN1Y0LgiyXdUYrp7Qugj+Td4DTnw+zXoMco49o8PcNVLPc5O/7/fEcVLFoqxugDQLQ+XJ2FG9O+E3bYn75HPxMUlmbaKQusmUlPJp7igAFaK+5iFz7Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747641527; c=relaxed/simple;
	bh=MRAdI24DJA2lIVS1amYwOksKI1lgkup8YiWAAYJ77h8=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=owT4DRoNaAmy79Wbt/P4rP1BuKph0uxeLNGZj27BdJZGtnZR5ObpI94GlXXFZu3cQSWw12jHOF56OO8lpHSkBOU4qW+t07WPi/OfOhY5WgJaWD6KkE2psK2/iXBmcD9sAcFzAzkSn37/9gPJ9OKJTtQ1Nzbm70nu/jcXfsxi9/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IcUSAhdk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IcUSAhdk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A761CC4CEEF;
	Mon, 19 May 2025 07:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747641527;
	bh=MRAdI24DJA2lIVS1amYwOksKI1lgkup8YiWAAYJ77h8=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=IcUSAhdk2V6GyCmet+XYBLjMm4Jq+zdV+cjIxH1Cyn0apTU95o4RTMZN7PW2A7sE+
	 BKSYfH72KvM2YzeesS6GSsr7I4bMxVk1U/xLZbkLPKsGpITWMrXXMxO8hvz+FjEIlq
	 gvfY75Fg3jNBjnNT3Tn1hsl4Z+V1VEZh5mX6xNVTGWyc38I+YJCZ8L3XoXWpYNs2BA
	 ippzugo5F1ExUD4EGMcefuBUf7ksitROheeLCPQQmASXlXAnBgZ7isOkb2vWw2ykmM
	 h0V1GD4I6SNwm/v7P1dzbwFVw46l/ME6zn+7fqRSGUkzH4M0VhgIPWe8w+bgvz/2h0
	 r9jUvgj75TWpg==
Message-ID: <3d72e987dbd84da21ceb6dd9b83d043d@kernel.org>
Date: Mon, 19 May 2025 07:58:44 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v4 18/23] drm/tests: hdmi: Add limited range tests for
 YUV420 mode
In-Reply-To: <20250425-hdmi-conn-yuv-v4-18-5e55e2aaa3fa@collabora.com>
References: <20250425-hdmi-conn-yuv-v4-18-5e55e2aaa3fa@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com, linux-kernel@vger.kernel.org, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Dmitry Baryshkov" <lumag@kernel.org>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

On Fri, 25 Apr 2025 13:27:09 +0300, Cristian Ciocaltea wrote:
> Provide tests to verify that drm_atomic_helper_connector_hdmi_check()
> helper behaviour when using YUV420 output format is to always set the
> limited RGB quantization range to 'limited', no matter what the value of
> Broadcast RGB property is.
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
