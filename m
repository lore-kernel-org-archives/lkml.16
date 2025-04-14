Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C7A2DFA59
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 15:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744643108; cv=none; b=ebx9hD2QE8bTnfDMxZAgd38O58nQMEginxT9ReiS4RbvT9K4x8JteEFQg2I2On57p+EjRNfrlQx92iVg7nYQXG08A0G0M3AQPfNJTVASrLE3CWlLZdA/Q7+qzcF4bqWcdFxT4BH8HZVmtMNnNepNsZL24KKYRfY4weQbJdjVQJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744643108; c=relaxed/simple;
	bh=Je/04BYunCBJyCO6JqJ32/u1fHw2UcgBh6bgtkxZqoo=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=eoY1xJ9DGaB/vPtGejA67DdM7Ce+kPm1Mz8BmrCPRh018JESeEnp50ciC+qtKCwBwccZV4/LDyt4DL+7Z6jI7SQU6w7GS1SEdmih/FMr+50+e2wpV/rQrPr7wFlm1Bx6nWfj2cCpeic5ibtDggMSL9CQnqUMrMPOV1AyLKxVw64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E+2r/FEl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E+2r/FEl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DA81C4CEE2;
	Mon, 14 Apr 2025 15:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744643107;
	bh=Je/04BYunCBJyCO6JqJ32/u1fHw2UcgBh6bgtkxZqoo=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=E+2r/FElhiDqHQYxEWKEcjz1d5Au0GeWyBZVejfDh+QKo7pSurp4twDj+g7b+3tnJ
	 G2ylvjTLBurENn4z5lIUf9gk+MNbuOPHOmeDqidiQDp1c5MW5J7NcoDcKyL08Tdqf/
	 oQZXcaQ00F20WDLbpoLRyJHve2Ml3FmSojDWClLb8TEZrlDVN0Ir3MGxCE9nQybMqp
	 hYIqTKlGyhzbEtqJIcXHvOYKI/3j0D3CZzZRUvLelXMvtIOddfzBc6GIO5JCdOe6wx
	 Ki9dAjWaoJ1rn8nFVjdkEXCx6mIosQG+Xyo190Vrea2PK6+eQuPR1USkGwQwgyqdex
	 oJ3uXOQJmLuaA==
Message-ID: <b11aaa3ca9e2273441124800bbda1f52@kernel.org>
Date: Mon, 14 Apr 2025 15:05:05 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v5 10/11] drm/display: bridge-connector: handle CEC
 adapters
In-Reply-To: <20250407-drm-hdmi-connector-cec-v5-10-04809b10d206@oss.qualcomm.com>
References: <20250407-drm-hdmi-connector-cec-v5-10-04809b10d206@oss.qualcomm.com>
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

On Mon, 7 Apr 2025 18:11:07 +0300, Dmitry Baryshkov wrote:
> Implement necessary glue code to let DRM bridge drivers to implement CEC
> adapters support.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
