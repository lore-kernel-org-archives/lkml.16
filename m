Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE6E2957C7
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 13:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744722953; cv=none; b=WHd/UoCU3suzRzxHgOQ4spxhN7FtaF5Ims36E1E7JqsSgoqH2TOF47cK5f++lWhK7jQmciMf7F0YW4ucEOGHGJm5Kef0RbCJKuV2UT10HjaaTpCmBWR6djxxfZJP0i0Yjy2IeOz4HvBr9oxM32sSmvKLBT19WbXE5mMS3UlobKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744722953; c=relaxed/simple;
	bh=3HXa0mbL0uJTBLGBwrWeb5TOy4PFFr5snd4nuGj5ZPk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=V+OlXLaV4HxUWNrdL5/4/P2GBoDEdbWVR9X1VyDOH3HLhcEwW0dRgSqH7nNu1respLo5aooZBStRpyxbUgHK/vW2MB5MjNJYk12Hy/hybZxWcBDmqH12xEJbDx/ls6WhYw2eneL2/Wg3strGKB4k1X8WB6tBP5x8hUi8F5ySfrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=TQ8QG51P; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="TQ8QG51P"
Message-ID: <c536b801-dbfc-4bcd-92f2-6483c0435620@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744722948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U3Rq97Ks2hDSPNG4otSnWau7sPLWkLpBWy07vjVfPwI=;
	b=TQ8QG51PX4qMTQGQ4xRyCjWXZv1LlD7KkNWuH+d21q/Shzt46If14hdkNj1UzK2lo3rjO0
	rGS4KjV+wC5nBbHwRbuNCmBjdoYb1VodxgfJchxMCF6KDLNVcmza2FS9NVwKsJ8VoL14Fw
	lF1MDzB69rIifBS2yqWBBPjdfl4sQ/s=
Date: Tue, 15 Apr 2025 18:44:57 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Subject: Re: [PATCH v3 02/17] drm/tidss: Use the crtc_* timings when
 programming the HW
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
 <20250414-cdns-dsi-impro-v3-2-4e52551d4f07@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20250414-cdns-dsi-impro-v3-2-4e52551d4f07@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Hi Tomi,

Thank you for the patches!

On 14/04/25 16:41, Tomi Valkeinen wrote:
> Use the crtc_* fields from drm_display_mode, instead of the "logical"
> fields. This shouldn't change anything in practice, but afaiu the crtc_*
> fields are the correct ones to use here.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/tidss/tidss_crtc.c  |  2 +-
>  drivers/gpu/drm/tidss/tidss_dispc.c | 16 ++++++++--------
>  2 files changed, 9 insertions(+), 9 deletions(-)

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>

-- 
Regards
Aradhya

