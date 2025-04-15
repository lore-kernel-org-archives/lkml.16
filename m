Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E76297A60
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 13:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744722957; cv=none; b=XeoSg3VVfSQL4SCbxqgl6Mrhdon4Z4BjWfe0w15AcxtwAQSeVEVZlXFNL8dAn3mfq18loSXmPDkslnzLH/vKGDfmSAlOTmXAyNN0TDlrH8GowbMTXhFxRLodl4y8Mh2hD87EGzgIoDwHJFHVRNrtf1mLvFcoLoo3GVsQ/kC5OPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744722957; c=relaxed/simple;
	bh=f/vopwY1Lx/AOeBdtgIRiByPPczcNQo6jXilDcQSpZY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=nUg5swT7fnD5i9P9CkRPNNF1LoMeqSn5tDoNiX+Bb6+tYrkLj3VBD7uqaslzp/MA6wgwppJMCrYB079iFZk0JEa9zMjnt3ovLIQsmor3tHyZR1Pffkt5JAC1PQckO9vnu+ZioO47NjydS2VfLOIArNjAlMT2/+scq9U0DxOgLPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=wxqSGbIn; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="wxqSGbIn"
Message-ID: <d765276e-5cd9-416e-8e0b-e2810734017a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744722952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pOe3TSF5iLtdBYGt2ECIozQoznpT8UJ5ecLS38nYhCA=;
	b=wxqSGbInbfg5KgjNIdcw7nzkmn5PJJYLiEJwQxId+8kjLaGyunJjUrRBsBLlUhbPYODVZE
	nAi0IvwtZ3B6PCH7r2lSqAtBKwNtz6FL1qI94KSIUQFVdqb5V0ufIC70d8bWZJedmKYD0I
	piyHSAu4SkogMc+HmLvGO3l1mjWWAt4=
Date: Tue, 15 Apr 2025 18:45:21 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Subject: Re: [PATCH v3 04/17] phy: cdns-dphy: Store hs_clk_rate and return it
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
 <20250414-cdns-dsi-impro-v3-4-4e52551d4f07@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20250414-cdns-dsi-impro-v3-4-4e52551d4f07@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Hi,

On 14/04/25 16:41, Tomi Valkeinen wrote:
> The DPHY driver does not return the actual hs_clk_rate, so the DSI
> driver has no idea what clock was actually achieved. Set the realized
> hs_clk_rate to the opts struct, so that the DSI driver gets it back.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/phy/cadence/cdns-dphy.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>

-- 
Regards
Aradhya

