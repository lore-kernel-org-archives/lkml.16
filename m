Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53AB12973D2
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 13:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744723190; cv=none; b=SsSR8YR3MfVLa0Q2Km1jL7UBdtjAvOiyCkawjWWzWMqNjcZrqdhU7SGCbJK4IvFDe10dUndYvJKqwPWHIVyuGlEE9+qZYXllaNic2lyxBCc/4yjE2Ftc0oQLfi0pjEBHXDjlAm6A/XBd13EwLi2owP9EP6AE3e1w/n+0WniPjx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744723190; c=relaxed/simple;
	bh=jHpDjEbRR/e0hfSMox+5LrnIlZIkGZMycfuhgzIizrs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=EjrY6qKsx/p43GI2HgVqq3Xmglm77s0Y5WL4Az647TnBdo94j3lHO2XkKBEDzrH2stJjPsW4muzvRcgUAY3R4de/fp4kQVCFndtsGquvV9AUxCrdUOB3El1rGKpR+FGP0uLOzaYfnFZeB0GOxXfYQbbs7mJn7aEa8/xxz+7N1rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=JOm+tc7l; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="JOm+tc7l"
Message-ID: <8f72b42e-c38d-45fd-b04d-c2b48a809d0c@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744723187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZLSozCorBBEWbCogUwnoTzrWlqCaGFlvu0gweRfCrow=;
	b=JOm+tc7lz9LZ6iM6+e0XfHi2diggzB6r/LJPLb2Vt1uEcdtUrE69EkRmCJ+YcRCLDgnK1p
	kc7Pv9xnaosXzQdCamVpC6X4D9V2Pqk9tqVvrydTJqxWUv5SXOB7Zx2XlzHG1cfbLs5EiK
	oxafoQuowdcOlbUBj+8PkuwJAqTs3Ag=
Date: Tue, 15 Apr 2025 18:48:53 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Subject: Re: [PATCH v3 09/17] drm/bridge: cdns-dsi: Drop checks that shouldn't
 be in .mode_valid()
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
 <20250414-cdns-dsi-impro-v3-9-4e52551d4f07@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20250414-cdns-dsi-impro-v3-9-4e52551d4f07@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 14/04/25 16:41, Tomi Valkeinen wrote:
> The docs say about mode_valid():
> 
> "it is not allowed to look at anything else but the passed-in mode, and
> validate it against configuration-invariant hardware constraints"
> 
> We're doing a lot more than just looking at the mode. The main issue
> here is that we're doing checks based on the pixel clock, before we know
> what the pixel clock from the crtc actually is.
> 
> So, drop the cdns_dsi_check_conf() call from .mode_valid().
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>

--
Regards
Aradhya

