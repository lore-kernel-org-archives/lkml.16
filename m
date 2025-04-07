Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987DC1C68A6
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 17:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744048006; cv=none; b=gzNVXEblNgsDuqQyXFokcsqsYQhNaxKIRiN9I1gFJV/1gkxXmdn954VVEI1tmB/WmW6EyEBhEAIpM1JE2fgCNoiPcPfTjf9HEOJ69+vhVzHTFdVr3As0CSxyAl+wF/72nurr/d0H3A1utxDz73BgE3xyoc/z6PEBPy8560bNEKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744048006; c=relaxed/simple;
	bh=JzBmnWSt98HBgHAwiCtsM7eilR0ikgfQb2mp5c7ohR0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K/mhR5TC17GVIwVrLHYn4Krt7N4I32LJ09hnlKQA/N61SVCVuNP3Z5EZwPkwtD6G2ysvE8mSXJlunuTNpz/ntoGVcxTvff/m4NvGYtl0BH6HgrBsqtkQtkzCW2uZJL4DuY/x4nByn34vLjUyrwAhU5sCARcOJfAbH2rAi1nYwl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=kgO7v09K; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="kgO7v09K"
Message-ID: <dfa007cd-71d4-42a7-8785-b066f7240630@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744048002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R8ircDol4yo8g4TmFBTzW6351cSVGXrV0q9TBc9nzvs=;
	b=kgO7v09Kjxl477hWa84NENJTdDf4jnih6zgOTrT8+DCb/BVUCE3SnfQlAEXrYcLqXKQP+z
	R9zh1kK7emurPlIBqcubcma0tjdA+moWQaojlf3i749JfLXFgyGV5WYp34loWVylCaQ1Fi
	K7igzccF39hOeZVjn3vFA2TBlQi2ghE=
Date: Mon, 7 Apr 2025 23:15:51 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 08/18] drm/bridge: cdns-dsi: Clean up
 cdns_dsi_mode2cfg()
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
 <20250402-cdns-dsi-impro-v2-8-4a093eaa5e27@ideasonboard.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
In-Reply-To: <20250402-cdns-dsi-impro-v2-8-4a093eaa5e27@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 02/04/25 19:00, Tomi Valkeinen wrote:
> Clean up the function a bit, mainly by doing the mode_valid_check dance
> once in the beginning of the function, and grouping the calculations
> wrt. sync/event mode a bit better.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 48 ++++++++++++--------------
>  1 file changed, 22 insertions(+), 26 deletions(-)

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>

-- 
Regards
Aradhya

