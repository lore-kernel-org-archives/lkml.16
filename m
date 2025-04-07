Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE46D215063
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 17:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744046420; cv=none; b=l4/A9nIk4PhZtKNNvbhKw/zP0+UMn2ph4flW/YDGI9QY7nwyk3AoBZ+UmpH4XL3WQIRN5xJDsmCToJx/h05uVsu3W97M7RYUF1Z+WeQO6hrNjAEu5Io+VPpt9CCcotzppKDDRXRQ3OcJ4XpH315DTawj0m/uSjUCgQZMaucCnPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744046420; c=relaxed/simple;
	bh=y3CDgjgxAq1nXRptrpLEI4T8Vt0KRTqKCS1gk3hO2FU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h0L1B00CUKcE6zcoDEYlYQqKQgUi+Hgj6nvntkVa0qtgRX4LKCYpglpJ/n5tABMOy6UnZiLW9CwTHx8bUy+8oEMHPc5SUaJHJjCbWpZUnYjhJfyVfPCowZO1M4+WYuEb5oDAax0ZhDAnRhTBuwFgN/ZYwxuHGHli9UY0O0UR6iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Lzv9tFx5; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Lzv9tFx5"
Message-ID: <44dcfd6b-66c1-4d3d-a75a-10ff50e54000@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744046415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BClHdxstGh3jFQkV9pe5yGI/1UV+EncLjPVq1x2L2Gw=;
	b=Lzv9tFx5ICSIixEoc57fHyAv2E5T3JKXkYuvm+TSe6jSOZ7b09RwSYREpDN8brPDtsrclJ
	wUokCg1vQKz6NiHKtU/Rn1/br5AEkOL3dq8MxZwWiW32+dIbmZvcWgQCnJB6CSOnOFnJnE
	FO5AX1ROscTQcFArRx/CTDHXijzXWSc=
Date: Mon, 7 Apr 2025 22:49:22 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 01/18] drm/tidss: Fix missing includes and struct decls
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
 <20250402-cdns-dsi-impro-v2-1-4a093eaa5e27@ideasonboard.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
In-Reply-To: <20250402-cdns-dsi-impro-v2-1-4a093eaa5e27@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 02/04/25 19:00, Tomi Valkeinen wrote:
> Fix missing includes and struct declarations. Even if these don't cause
> any compile issues at the moment, it's good to have them correct.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/tidss/tidss_dispc.h       | 3 +++
>  drivers/gpu/drm/tidss/tidss_drv.h         | 2 ++
>  drivers/gpu/drm/tidss/tidss_plane.h       | 2 ++
>  drivers/gpu/drm/tidss/tidss_scale_coefs.h | 2 ++
>  4 files changed, 9 insertions(+)
> 

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>

-- 
Regards
Aradhya

