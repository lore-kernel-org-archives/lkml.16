Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FDA548EE
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 07:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747639972; cv=none; b=B8Mow95urxKBO8Gh+2f7zipEZZyvTE0geG6son6JGmlVpMxnxzgbh/vcvxLng5+gncmPH0kHxnny4AuR8ACRJ3xrvkT8tj7L+gcRu+4DrndZe95IDtnKEfHcUtWakkjVS0c9addC+0E4DVz/qyBEMObNS4pLJKa1mEenrp4m+28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747639972; c=relaxed/simple;
	bh=nYb5Kshx6CLJ37Qnb8psaSBwq0tx6XMzzbwhCqEZ5mM=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=I7pV17jM+pfX2wDgy8naYh3/gIKyOJaRTRARl3a4x8KPl2Go38m6I/vbT6RFKFBpkZvtUsYoCuMkg0JF97ZK5T8ZIMjFEKJc8YEi58an1NrLlht0rUngahYJ1qvq1ilWGKoNZM82sibkM1iKKObRHQEHF+7F9X+MMV1Is3nWgko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KRh69JZd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KRh69JZd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC0F2C4CEE4;
	Mon, 19 May 2025 07:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747639971;
	bh=nYb5Kshx6CLJ37Qnb8psaSBwq0tx6XMzzbwhCqEZ5mM=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=KRh69JZdeBCWfoRS4ykXttpbmnUIQt+C0esV1moJDZrQTwfmRdCzSbHUFFG+fpT3m
	 L28PbBoBllg9y4NCwHfRJrJwItpvwX410SPDlDiSXbJ5of2JwSlOw06NxFhFa2ryAY
	 xEmPXNrC7pnm1gIbwmCGtBEwt67rHEKczNmdqVa/EPE1y+dilVKsRFC3/pfSuayr+L
	 GPLBeqHvHk5RH4YdAvoAXxDitBr36D3MgZo+1P89Nbq0Bwkr1JuErxckFKi2z07KxV
	 zDX4f6WZbSxYbUcFk/BFnBpf7zf/Qk9LDurFr2aqld7/YMRzY5SLIy5xSobPh+wJ/4
	 dVTDbwonZewjA==
Message-ID: <905648278aadd7e53b8c9d3f33816b88@kernel.org>
Date: Mon, 19 May 2025 07:32:48 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v6 10/10] drm/bridge: adv7511: switch to the HDMI
 connector helpers
In-Reply-To: <20250517-drm-hdmi-connector-cec-v6-10-35651db6f19b@oss.qualcomm.com>
References: <20250517-drm-hdmi-connector-cec-v6-10-35651db6f19b@oss.qualcomm.com>
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

On Sat, 17 May 2025 04:59:46 +0300, Dmitry Baryshkov wrote:
> Rewrite the ADV7511 driver to use implementation provided by the DRM
> HDMI connector framework, including the Audio and CEC bits. Drop the
> in-bridge connector support and use drm_bridge_connector if the host
> requires the connector to be provided by the bridge.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
