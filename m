Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946D12116FD
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 17:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744046840; cv=none; b=N9Sx8P37/P+9P4jYPRd2C0L4292CC0Um5c29dF0kREDr1xh0ldoXoAOgbMpO+dJu2eW4V89Ut8AMqBLKkdVJDalsm0BEWAHi3C05kSg8oTPUpu22+sQoY85UopFeBbjK69s8Z7EbEY3gdANaFPAy3e4VxtUFH2Y4xAq9B8voS1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744046840; c=relaxed/simple;
	bh=tjiGdsQp446cAAljbjHrCNcoZko0oAthJ7ARyT3rwro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p+ulX+hMbgd5bbEisSC4wvOaHpvpHpBBZp3NAmzI7Yg/JWfBv1MemLM0KKaH4WGkSSVQABc3CNl8K5W9YB8T7ficxQPxd76gj35Bvr+ulY42Y38Z6UGsTR316AW1V4p5ncYq2KhB0Sv+Swm7apDpmv0s22DxI0sdzUMBhgKkYyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=CVBDKLHD; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="CVBDKLHD"
Message-ID: <54304499-c5ce-4a6e-9fe8-ce7844379cdd@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744046836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7BoZUSQTLENy9wH34VHXkqxJQv7Mux8ViHjIKiftxO4=;
	b=CVBDKLHDxSI5+1SVXXzPderrRjq5PdrIwteBlnwDoptDqGlM0nxRosoQQcrkCu7PcEF9YY
	P4AkB6KGUv6C5EZ06H81Y29LowCJKhj9i1v3ajS043cy+Faf/6v2O6xT4BEpTRSdV5/2Q9
	D03p9gEnaUsRuGNigGcBmY9JKpbeD78=
Date: Mon, 7 Apr 2025 22:56:19 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 07/18] drm/bridge: cdns-dsi: Fail if HS rate changed
 when validating PHY config
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
 <20250402-cdns-dsi-impro-v2-7-4a093eaa5e27@ideasonboard.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
In-Reply-To: <20250402-cdns-dsi-impro-v2-7-4a093eaa5e27@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 02/04/25 19:00, Tomi Valkeinen wrote:
> The phy_validate() can change the HS clock rate we passed to it in the
> PHY config, depending on what the HW can actually do. The driver just
> ignores this at the moment, but if the actual HS clock rate is different
> than the requested one, the pipeline will fail as all the DSI timing
> calculations will be incorrect.
> 
> There are ways to improve DSI operation for various clock rates, but for
> now, just add a check to see if the rate changed, and return an error if
> that happens.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>

-- 
Regards
Aradhya

