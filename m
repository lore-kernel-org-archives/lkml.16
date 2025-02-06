Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B05C1E5B78
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 14:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738853119; cv=none; b=rtVsq8nAnDlEpO5Q7CvDp9yGJMSd3KkUxwuQCKIAZA35fkcgyBh64sdW59qEUHtpVJ9HX4Z8NK/4lTEhWGBnz82LJke7sULzMAY2na6AzazR0jp+g23dNpLzapBdho+UWJli2qmRkGwEYyK+K+wnk05QWdpRlnA4vQbm+19UlXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738853119; c=relaxed/simple;
	bh=U/0f7l0blhQk7R6zoO3mEGN0Y4xGTK4wN7+DsiJxa24=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=pOMJ2QwvKLPfsNcTSP813a+OGpDs6BqROT28XFqO284I2tgbhx7nn2HlW5AD9/4pqPOky/XGmV54TSdL+J66zgaRQRnPR/Vw4z0ZcYsiAlX+3wi1fEZuweFfKLMLtJUW4o/RH6DkGX+2cCMgFduW9PrBz7B/WD/btipLTFvu5o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P5chCnGs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P5chCnGs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7AC1C4CEDD;
	Thu,  6 Feb 2025 14:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738853117;
	bh=U/0f7l0blhQk7R6zoO3mEGN0Y4xGTK4wN7+DsiJxa24=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=P5chCnGs2h7gJ/Gfl4hSd6dbM4OBnsTK8CsBOVgjIC4vdQxO33Skf7JPwvZGgOFmO
	 UIRYV0X28rPwci+PCWqxce/JKXmUalWM8nRknMraUqCtqBuWIgX8dQg7ziCEhFuT3g
	 Y0GqeYnFAFZ15G7pO2w8DGSpKYqPMvvUFUOo7glMNY2iC101k2/kxryKmB0KD204EJ
	 ah1V9pEeOXzoEE4FE3nK+Y6P05Z2UMr3QCMAzamnzUJPMy69Zge/qPZwgEhBZ3kmzW
	 FIHBeBlEN2e+dw+Ruv4dbTrfEmaN+Qy7QiGDSUqkxCWDvWfI2/TRgrMLFt1ZmQA2vm
	 MKKDXuYPxISvg==
Message-ID: <2310c2c4c9670a776090ebc81ea2aaff@kernel.org>
Date: Thu, 06 Feb 2025 14:45:14 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: oushixiong1025@163.com
Subject: Re: [PATCH] drm/bridge: convert to use
 devm_platform_ioremap_resource()
In-Reply-To: <20250206071713.180471-1-oushixiong1025@163.com>
References: <20250206071713.180471-1-oushixiong1025@163.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "David Airlie" <airlied@gmail.com>, "Dharma
 Balasubiramani" <dharma.b@microchip.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Manikandan Muralidharan" <manikandan.m@microchip.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Robert
 Foss" <rfoss@kernel.org>, "Shixiong Ou" <oushixiong@kylinos.cn>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

On Thu, 6 Feb 2025 15:17:13 +0800, oushixiong1025@163.com wrote:
> From: Shixiong Ou <oushixiong@kylinos.cn>
> 
> convert to use devm_platform_ioremap_resource().
> 
> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
