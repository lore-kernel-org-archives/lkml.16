Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D213297A4F
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 13:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744723420; cv=none; b=gwebeI65NIObQfk88HH6xUGCBQ4nl9u6qPSi9zyrpXcQXFPx04tiDeZO80838yu3A+I9ILc490DgV9V9oiJGEOoYwkZByKBoaTmZPQvAiywJU13kUWLgiexq3y8KHS4VJWTE18+lpFvquKj2FLrwVYtwR42z4ZPl/hj556bjAKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744723420; c=relaxed/simple;
	bh=1Ymuo9tMuY7EaQAopu6di5wEe3nTHPMcFMafE313oRE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=cwIfnT1Hl/IGeidK8WutmEhR39Yf7MSMj2tTqlIo4WUZlq+c2hDTRcwTouZH3J5pYiCN73fc8vuCInv5pLe/EI79gPrt61l14B1zwrmEx56V67miQKPYaFSdb8ur+9V+Gb0ArYPAyf2YvP89mLPU5md3eH9XdlpHnobzC3hHQ8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=wbTneSf0; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="wbTneSf0"
Message-ID: <73b7af40-92e4-420f-81f1-3cd41c4a6920@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744723416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6+3VXbGj0V9Ezv8q+AT06eZN7LwpyfQrVtRO6evgNd4=;
	b=wbTneSf0te0y+CPrdj7NcTSVnzzmgQfpHYz86lU4OJ3C2NrH9hGo8mlPrHerH93pEx7jeL
	nLvf8bjiNPClJ9RWSfgcpTzAOC0sQ/zcMzglfSjz+9Dl+q75Khzqc3d7kktxS2SyPiR3Fk
	ICkGA7xR3vpHAKJlFAB5iNNnr7yZKRM=
Date: Tue, 15 Apr 2025 18:53:27 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Subject: Re: [PATCH v3 10/17] drm/bridge: cdns-dsi: Update htotal in
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
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jayesh Choudhary <j-choudhary@ti.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Francesco Dolcini <francesco@dolcini.it>,
 Devarsh Thakkar <devarsht@ti.com>
References: <20250414-cdns-dsi-impro-v3-0-4e52551d4f07@ideasonboard.com>
 <20250414-cdns-dsi-impro-v3-10-4e52551d4f07@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20250414-cdns-dsi-impro-v3-10-4e52551d4f07@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 14/04/25 16:41, Tomi Valkeinen wrote:
> cdns_dsi_mode2cfg() calculates the dsi timings, but for some reason
> doesn't set the htotal based on those timings. It is set only later, in
> cdns_dsi_adjust_phy_config().
> 
> As cdns_dsi_mode2cfg() is the logical place to calculate it, let's move
> it there. Especially as the following patch will remove
> cdns_dsi_adjust_phy_config().
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>

-- 
Regards
Aradhya

