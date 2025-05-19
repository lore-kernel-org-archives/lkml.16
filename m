Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CFB266EE7
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 07:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747639803; cv=none; b=OQ4wJ+TlnhSnOLrEc5jSeP4kGW/GB1e2nzwvKSVtyoKct2gc71N4VJfgTo7vSRo40hAvsgoFQvkTdbhbFp8kVl/sjlwJ8ytbpi/P+UBUOHXCI/0HYvv2uz6wQnPDop4KQuI1KUYOr7ooABoDPopQLl18vbcBVxGBiDnvdAE5SdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747639803; c=relaxed/simple;
	bh=qkdT8Cp5AKBfHPwo6RteW35DLD1bNOc5UzWP2dv3v5U=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=XJw3OtelbMIlEhPhJ5L/6KqMHrWNR1YYGZlFO1YmGtMLfuyzNV6j6wACYRewS5zmPF9+xZwApYrESWNQXlT4/FE9fXzxSZ1Z5Koa/KjdHqxla8YgXS3ufFaL+thR/dbAG2vxq4C/sVrStYr7GQuISN583w+8o+Qh/XEv2LLudmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d8sHcEEU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d8sHcEEU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 194F4C4CEE4;
	Mon, 19 May 2025 07:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747639802;
	bh=qkdT8Cp5AKBfHPwo6RteW35DLD1bNOc5UzWP2dv3v5U=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=d8sHcEEUY17YxpnK+a47HTO7aNpbY+VR6WSbvkjZ7+QO8W3e55n94jR+QaFd7fm3A
	 jd3IuWYcGp4fX+B4fABq8qWWV60DYZaNZgPFXIVtV39eWy/GO8V6ZBEOxZ9lRyrpQK
	 Sz4//mMD4EWmJ6wp8ssO4qnPWKxgoTtHlS1rZMsXE26XDBtlhc/XJOPq4If4hj6xph
	 7Tsr+g0m6O92YeGG+fNSoIgA0gjr0yNcW81O94gl4lKyxV8AHd1JJ/gxldrfGvwuyx
	 pnd7aDSpJJr3N+hamDcSm/2I8QWCjJUKfi5ZKEfRoOYf30Dhw4Ju7y4JzU/UuIEMBx
	 o1HMMGLybgz9A==
Message-ID: <4a2a48aba8e080225659851c1cf4ee48@kernel.org>
Date: Mon, 19 May 2025 07:29:59 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v6 03/10] drm/connector: add CEC-related fields
In-Reply-To: <20250517-drm-hdmi-connector-cec-v6-3-35651db6f19b@oss.qualcomm.com>
References: <20250517-drm-hdmi-connector-cec-v6-3-35651db6f19b@oss.qualcomm.com>
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

On Sat, 17 May 2025 04:59:39 +0300, Dmitry Baryshkov wrote:
> As a preparation to adding HDMI CEC helper code, add CEC-related fields
> to the struct drm_connector. The callbacks abstract CEC infrastructure
> in order to support CEC adapters and CEC notifiers in a universal way.
> 
> CEC data is a void pointer as it allows us to make CEC data
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
