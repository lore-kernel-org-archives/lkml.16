Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D20215F50
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 17:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744046423; cv=none; b=HVV7vwh1Eg+Zo889ZZ5hdINNMAyfGLu/3HhsKI3tt+nxGFHlCbe5s6uzmgAUtpovD0lcpnu7ZWtWIOIKUHrbTqP23nUouwWCDFuP19F7tdNFhqV7S/gy/4JaS8R6ebU6RwmDCigNLsj1GY0jRkValwAlLYcr0TLF9057rKcICm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744046423; c=relaxed/simple;
	bh=d8/3HEU5ZuR1sJc+Fgt6KUOcMb7ztYoX8aqxZSyTS0Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FTJjX5904gRhuSUIzsQLjeYbttt/4oRcxsdHXNqTNsjGuBLZ1YV9hxzPYe0KUbhRdb4VJ+obVzixX6aThhokTFEAJQ+QCPS9R46rfbUfI/GMo9vW0KFSpqj69QjlJ4sriluw9yZju2Zl07gY0WWq9QFg0ce+mtGhFU024s+hMPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=CWbW93gr; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="CWbW93gr"
Message-ID: <3fdfd450-6624-4621-bcae-5457da7cacc7@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744046419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KXRWft0X5vqZc806dG3f8UT9bd4FnC+vOrHSKFqZhi0=;
	b=CWbW93grZ9qPup6CaE6mEnjqWauqK0oVhtuflAXlR3ZkbwO+FDKQwsH4kdb3oJ0feFh8QP
	4QZOrDXBmVQcqjUvzOULDxa1Ln6FPbuZ03uuDbICGy8UBZUj7Hy/KZdzcZwtiK9CY9pHHa
	muZIk67GG8PrVwJNg9sU5aWN4x0RaeI=
Date: Mon, 7 Apr 2025 22:50:09 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 03/18] drm/tidss: Adjust the pclk based on the HW
 capabilities
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Jyri Sarha <jyri.sarha@iki.fi>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Francesco Dolcini <francesco@dolcini.it>,
 Devarsh Thakkar <devarsht@ti.com>
References: <20250402-cdns-dsi-impro-v2-0-4a093eaa5e27@ideasonboard.com>
 <20250402-cdns-dsi-impro-v2-3-4a093eaa5e27@ideasonboard.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
In-Reply-To: <20250402-cdns-dsi-impro-v2-3-4a093eaa5e27@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 02/04/25 19:00, Tomi Valkeinen wrote:
> At the moment the driver just sets the clock rate with clk_set_rate(),
> and if the resulting rate is not the same as requested, prints a debug
> print, but nothing else.
> 
> Add functionality to atomic_check(), in which the clk_round_rate() is
> used to get the "rounded" rate, and set that to the adjusted_mode.
> 
> In practice, with the current K3 SoCs, the display PLL is capable of
> producing very exact clocks, so most likely the rounded rate is the same
> as the original one.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/tidss/tidss_crtc.c  | 23 +++++++++++++++++++----
>  drivers/gpu/drm/tidss/tidss_dispc.c |  6 ++++++
>  drivers/gpu/drm/tidss/tidss_dispc.h |  2 ++
>  3 files changed, 27 insertions(+), 4 deletions(-)
> 

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>

-- 
Regards
Aradhya

