Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B4624166A
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 13:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747400816; cv=none; b=dbqFE/YVEDMyiZ96utnXWaP2gqtyj0xkXFQ54xLsgIhovPp6H7aUiUv7upCoNt6lwo2lXlTfI5VSNMqfvF+WHIsFKYt9HKFeH9D0NUE/mYfrGiBN/YEmam9J+u5gNQ1swBFrZlzb7s5xF49xLXlslIpl3gO8kX+cr+CjpeiHbvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747400816; c=relaxed/simple;
	bh=8oSKT1zoGGaJt0Y1QF5tV3uqLZ+JpzchfT2QI3rX9+g=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=WQy0qK9w9tPYmfvZBfVMLbHvaEg587I7h7kBhTSV1LBeXrTtLpirOQd3Da8brB4D+Vw7spBxTHxTzn9fSqiwAyKvQ0f3N3naFUkALg81iTY1Sn5N03xz1pDOcCkVuQl6hLZNiGyMV+WU0lTwOhHldvixmNT3JxjAH5lK7WN3sFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FJu47Bgx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FJu47Bgx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F4BDC4CEE4;
	Fri, 16 May 2025 13:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747400815;
	bh=8oSKT1zoGGaJt0Y1QF5tV3uqLZ+JpzchfT2QI3rX9+g=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=FJu47Bgx0HDih+jvseKzeex5F1rU8xofJngFv5YOWafYRZc5/Sv9pH8wDVTvFEqmE
	 7LoAsE1nhqwwohMadn031e1Oy9oGzAq+aA6yFln5JuKZtiZu+HBdyezKqrzKv8gtFe
	 vyvlZgRFHtZP+1Sho062+czBW4hKZ1wxy60iuMrWSOoR3/VwwTfe0FcNJYsgsnjUne
	 kbJbARNtskBawzkGTkkNhP9/y/ySs0xCwtVDfQfw8uFzdgkQ3TRN6PUX5SUBL7H3Mg
	 q+70HYGf6We3EgK+2rIf5M1YdlxWnFB7E+8ctNdVHGfzD4kgRPv28el3rYCFnZwXBT
	 VZtBDqNpVGVrQ==
Message-ID: <053e88b7f6416750e303480d996c3245@kernel.org>
Date: Fri, 16 May 2025 13:06:52 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v4 10/23] drm/tests: hdmi: Drop unused
 drm_kunit_helper_connector_hdmi_init_funcs()
In-Reply-To: <20250425-hdmi-conn-yuv-v4-10-5e55e2aaa3fa@collabora.com>
References: <20250425-hdmi-conn-yuv-v4-10-5e55e2aaa3fa@collabora.com>
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

On Fri, 25 Apr 2025 13:27:01 +0300, Cristian Ciocaltea wrote:
> After updating the code to make use of the new EDID setup helper,
> drm_kunit_helper_connector_hdmi_init_funcs() became unused, hence drop
> it.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
