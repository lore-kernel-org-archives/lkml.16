Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4191E5B99;
	Tue, 11 Feb 2025 07:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739259357; cv=none; b=tnvFA6fpyonI8Xd/fEemymFuhK+u0M75+hBkX8soKd0fngyEwofXVopTWXEiJV9uS5DUkzINFpRDVC8vWMOj7hjXO7UhZnxPsGk3l7Pfu5FU0Az7glvxaRNi6KqoZmjWBCHw/7/aBEPH448w5BOYPMH2dyp4Nr2hxT/JhDvKIT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739259357; c=relaxed/simple;
	bh=wk9GcUBAUnFbpDFQjRgo/Y7jGVofCjD7NpuzPXMmbNU=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=q6QqLawlO4XevCOCJ6Cy4biEjXb0blIH5Rep+YTy7BK35OZf+IMDaasa8ov98wfpAMTusaiKaa0gZirrC2asera1TFISEMoIDmifiAIqCffrFYduNxAcgONLGitNtEq2umVDDgeBqZNd1CCtDU+TQNHToEDVxj+Exf+JhkEF/oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dZPD32ZX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dZPD32ZX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 004EBC4CEDD;
	Tue, 11 Feb 2025 07:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739259355;
	bh=wk9GcUBAUnFbpDFQjRgo/Y7jGVofCjD7NpuzPXMmbNU=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=dZPD32ZXuJAb3SaosBOD3nrgRXQVwSLTGR8Ip8SO5hn4R82fPCQCOVMFZeVWkwEKF
	 CsRwWKh5X2FSpspky30RS9ud/WXOOYvuYTGh9gJyXV7D1DNqcd9eUIW1K3tG2pq8a8
	 +tVA+ecHrDAe8SK7i8WdBt2OShsxmm23a9thPsNMCF5L36Pt+u2Jdd/WAo86kABVlP
	 fq5gUv60xGYHo4U0usYfJ3gQzj6YA1M/4VVcctNHfxVRcmxGGctjnOvsw2DWKcoeBg
	 Wba4XtAH4yUWtmjkKbAUIa0DaBtLcrhn+Cz53Ri/oj0MGdvkhuBue3+qUyD+sVodRw
	 oJc95h1+ypBzA==
Message-ID: <e7d64ac755a644d680e5d69e91fac7ed@kernel.org>
Date: Tue, 11 Feb 2025 07:35:52 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Herve Codina" <herve.codina@bootlin.com>
Subject: Re: [PATCH v6 1/4] dt-bindings: display: bridge: sn65dsi83: Add
 interrupt
In-Reply-To: <20250210132620.42263-2-herve.codina@bootlin.com>
References: <20250210132620.42263-2-herve.codina@bootlin.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, "Alexander
 Stein" <alexander.stein@ew.tq-group.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "Conor
 Dooley" <conor+dt@kernel.org>, "Conor Dooley" <conor.dooley@microchip.com>, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, "David Airlie" <airlied@gmail.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Laurent
 Pinchart" <laurent.pinchart+renesas@ideasonboard.com>, "Louis Chauvet" <louis.chauvet@bootlin.com>, "Luca
 Ceresoli" <luca.ceresoli@bootlin.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marek
 Vasut" <marex@denx.de>, "Maxime Ripard" <mripard@kernel.org>,
 =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Raspberry
 Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Rob Herring" <robh@kernel.org>, "Robert
 Foss" <rfoss@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

On Mon, 10 Feb 2025 14:26:16 +0100, Herve Codina wrote:
> Both the TI SN65DSI83 and SN65DSI84 bridges have an IRQ pin to signal
> errors using interrupt.
> 
> This interrupt is not documented in the binding.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
