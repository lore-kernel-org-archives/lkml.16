Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28AFA31
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 06:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748414494; cv=none; b=OO+5/qGhprCkIdWW85LIet+6xvCHOVWNJajIa37W/gIQLClbe2dz8h2f1749F2HiTnERHRmLJRFLbIn7UlviKCEQNRnTHbt0JOsDvSYDcedmaAboRUwGlH2WkV0IYssGzzusgnBdEgMsMzZ4ocZYwZUSoteGwJ4kekFpFje7ZwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748414494; c=relaxed/simple;
	bh=QuS4ki+ygmzNgbM1gN3bOweRZf/kkEWCfvJRu5b9BWA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=VltEuKEf+niabdceOVTLiYtRm67OQM9Ul9GbaoSl5AY44qW7pTP+dxfb9cqqFda5C58Drb2NCpQExRYd/JanheiUMzY12jALxX+x2W9IGcjmDGdQCy61qj5yJ25Mvi8MXV91zT00Xwmj2D/tPsGQjP0tZW+eWCDaWb7Qdp62ys4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=lY3RS0ZJ; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="lY3RS0ZJ"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250528064129euoutp01a252898ceb79a91bae3d3fd9f77e3a2d~DnbcQwyb81766317663euoutp01E
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 06:41:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250528064129euoutp01a252898ceb79a91bae3d3fd9f77e3a2d~DnbcQwyb81766317663euoutp01E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1748414489;
	bh=1CqYlDJ7Pye3W/xNL1WCDcZNkM1De9lFuAMds043EQQ=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=lY3RS0ZJCY2FT4ZRA2JOyjYq04zRvZ/4bCvl64owpge97u/lq1XtOcDil8YCp4lsE
	 yXqHY55aN6rKYm9Lf8AVNtfsfmp8laLHWb61qmve4OaJI5QlCi7DmuZd81R/jBq8Aw
	 DpMPhKEPqgn0Wd6dvtI6k4Z5me09lv2EO/JjpukY=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250528064129eucas1p2cf0cc2407e45422e9598a01b5dc0906f~DnbbxmIM51574615746eucas1p20;
	Wed, 28 May 2025 06:41:29 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250528064128eusmtip150027ece79e69b35d778441f1de3c0c8~Dnba22_l10218602186eusmtip1F;
	Wed, 28 May 2025 06:41:28 +0000 (GMT)
Message-ID: <d96f5578-4c87-4b94-b42f-7e8e54d75b04@samsung.com>
Date: Wed, 28 May 2025 08:41:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/4] drm/bridge: samsung-dsim: Stop controlling
 vsync display FIFO flush in panels
To: Philipp Zabel <p.zabel@pengutronix.de>, Inki Dae <inki.dae@samsung.com>,
	Jagan Teki <jagan@amarulasolutions.com>, Andrzej Hajda
	<andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart
	<Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
	Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Artur Weber <aweber.kernel@gmail.com>,
	Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel@pengutronix.de
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250527-dsi-vsync-flush-v1-0-9b4ea4578729@pengutronix.de>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250528064129eucas1p2cf0cc2407e45422e9598a01b5dc0906f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250527141451eucas1p268427354487325dd2fc1302a94f40c1a
X-EPHeader: CA
X-CMS-RootMailID: 20250527141451eucas1p268427354487325dd2fc1302a94f40c1a
References: <CGME20250527141451eucas1p268427354487325dd2fc1302a94f40c1a@eucas1p2.samsung.com>
	<20250527-dsi-vsync-flush-v1-0-9b4ea4578729@pengutronix.de>

On 27.05.2025 16:14, Philipp Zabel wrote:
> This series enables the vsync flush feature in the samsung-dsim driver
> unconditionally and removes the MIPI_DSI_MODE_VSYNC_FLUSH flag.
>
> Background: I've recently seen shifted display issues on two different
> i.MX8MM boards (mxsfb + samsung-dsim) with different DSI panels.
> The symptoms were horizonally shifted display contents, with a stable
> offset, in about 0.1 to 0.6 percent of modesets.
> Enabling the MIPI_DSI_MODE_VSYNC_FLUSH flag in the panels' mode_flags
> fixed the issue in both cases.
>
> The samsung-dsim driver is the only DSI bridge driver that uses this
> flag: If the flag is absent, the driver sets the DSIM_MFLUSH_VS bit in
> the DSIM_CONFIG_REG register, which disables the vsync flush feature.
> The reset value of this bit is cleared (vsync flush is default-enabled).
> According to the i.MX8MM reference manual,
>
>      "It needs that Main display FIFO should be flushed for deleting
>       garbage data."
>
> This appears to match the comment in mxsfb_reset_block() in mxsfb_kms.c:
>
>      /*
>       * It seems, you can't re-program the controller if it is still
>       * running. This may lead to shifted pictures (FIFO issue?), so
>       * first stop the controller and drain its FIFOs.
>       */
>
> Now I wonder why the bit is controlled by a flag in the panel drivers.
> Whether the display controller pushes up to a FIFO worth of garbage data
> into the DSI bridge during initialization seems to be a property of the
> display controller / DSI bridge integration (whether this is due to
> hardware or driver bugs), not a specific requirement of the panel.
> Surely no panel needs to receive a partial line of garbage data in front
> of the first frame?
>
> Instead of adding the flag to every panel connected to affected SoCs,
> the vsync flush feature could just be enabled unconditionally.
> Clearing an already-empty display FIFO should have no effect, unless
> I'm missing something? With that, the MIPI_DSI_MODE_VSYNC_FLUSH flag
> would not be used anymore and could be removed.

The Exynos5433 datasheet doesn't give us anything more about this bit:

"Auto flush of display FIFO in only video mode.
It requires that the display FIFO should be flushed for
deleting garbage data in video mode."

Your reasoning seems to be correct, it probably slipped into 
MIPI_DSI_MODE flags just because it is in the same register.

Feel free to add:

Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

