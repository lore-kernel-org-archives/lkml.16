Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C8F2973CD
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 13:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744723440; cv=none; b=u54qGteumNgJMfGChW88aTjg0zQWIIHCkeGunZwGsp6uDMKZDydp0aV2RKsR2QsvneNke8M1gkPKJvpJJAbgiSDEmJXdRDf2IfXme54SPDVUNOYZyHLbplo7BWwCgbhGGqpaQj43a8zHs4reuas5bLSMPMuPzlRNdDGbY0LkGw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744723440; c=relaxed/simple;
	bh=e5SXotqBlNzbFjcGhEOATti6UjS7AiaE+BOA1EnycnA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=TuzL1tA+PKc+DSuuoR7IU0zp73ttZZPR1VPfUW4HY32KA3Jm5NI/7bq3WyZNFL8pRMcOgk5uLezSIAnZ8mM8WqARk79Wio9i54RGgo1YVhqRHqlwzVgR98omB03Egsr5HqtbRoP/qocoiudSbr5UCpJha7gKBXHwoB0RzwQDD5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=oN8WMgVF; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="oN8WMgVF"
Message-ID: <d2816b7c-f637-4603-b2cb-d33721325fbd@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744723436;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xx83AGFMQurtRu9wIIKYXJ5FYa6n70ce8rgr2WFuiFs=;
	b=oN8WMgVFdaECJCVq2LYkHQbHspt1tKdLftewZUx25CxeqVnMd8uos7WRz7bbKV/T9890RX
	PLdAAuJMfImxJozTXcLSkk2Uos+Aq2tguK4jg23EBugKM0N/50hYfnxcZOS+Xzl3xOveX9
	//KxacX6SbgztjnbLjkz28xjGJskkkw=
Date: Tue, 15 Apr 2025 18:53:45 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Subject: Re: [PATCH v3 12/17] drm/bridge: cdns-dsi: Adjust mode to negative
 syncs
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Jyri Sarha <jyri.sarha@iki.fi>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jayesh Choudhary <j-choudhary@ti.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Francesco Dolcini <francesco@dolcini.it>,
 Devarsh Thakkar <devarsht@ti.com>
References: <20250414-cdns-dsi-impro-v3-0-4e52551d4f07@ideasonboard.com>
 <20250414-cdns-dsi-impro-v3-12-4e52551d4f07@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20250414-cdns-dsi-impro-v3-12-4e52551d4f07@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 14/04/25 16:41, Tomi Valkeinen wrote:
> The Cadence DSI requires negative syncs from the incoming video signal,
> but at the moment that requirement is not expressed in any way. If the
> crtc decides to use positive syncs, things break down.
> 
> Use the adjusted_mode in atomic_check to set the sync flags to negative
> ones.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>

-- 
Regards
Aradhya

