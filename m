Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470B118C332
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 09:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750929796; cv=none; b=ST8kNL626OWo9FNNENWys15DZ19SczgbpQqpwVsmBlcg2u9e4qrncqMatnU5NdG31gXZnoTIEzPb5VYszLd2ADb08imhVaITbTOxyier0UujVCRITKlZDtzbWXCLPiiXWhEGFm/8LbGtkdgnAPnjA4deKz9f4tM0SYynFPKSt6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750929796; c=relaxed/simple;
	bh=ylEfa4vUACuw8KIfRNg2KdZZX09VjtoRgwfxRGGV2XY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C9dLjV6eEAZlvY8bWDPFSzQ00H6p5yaDSC1uHtIpdhRqWOeFHPxz0W6uXfY2BRTuYzlSOM32pez2jeAOOTKIUdLLzCe1uFpPkjGXDWjQWjQgek5h/WK2GqZHs5hoW2Ki3JLHigJWo22mVw7qg1jNOa8zOXc3mLuzKskjjwHkZ+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=utUg7EZ6; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="utUg7EZ6"
Received: from gaggiata.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id ECC671F967;
	Thu, 26 Jun 2025 11:23:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1750929792;
	bh=izAjhpsXTal8f3hm9SJLot604E5bhxsb/4OFueLGShY=;
	h=Received:From:To:Subject;
	b=utUg7EZ6/KmoskT8pK882I06qecDzO3j3zgPDifDO3S7FCfVo2D1q+LUGIaKeLJCv
	 TZHqwBbvlESBfiLZAEWQNMv74de4YmEkSj5oSZ6V1s93DUfxaEwNk5e0k7hoeLwupR
	 /Lrl3LWBbcoxIwep4gjUXPIKkkO1MX6W2HlgpZtEOy7/DUXLOKkBW+OyKoUZpdKlGj
	 HVfxcaXhKQn36QYXxeoEGvnUicwlrUV5OwkzsSt0jOkYN+eNokpNVJaxmRTgL1YFGn
	 BKgoGg9vuCEwrpfzhJEdqm1trRhSY284pG3YIWmolrPydpd9kRJQ4TQmRpzY76a2gk
	 vv7pf9//pSzAA==
Received: by gaggiata.pivistrello.it (Postfix, from userid 1000)
	id A697D7F9CF; Thu, 26 Jun 2025 11:23:11 +0200 (CEST)
Date: Thu, 26 Jun 2025 11:23:11 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco@dolcini.it>
Subject: Re: [PATCH v2] panel/simple-simple: Identify simple DPI panels using
 .compatible field
Message-ID: <aF0Rf8YiriLCN85V@gaggiata.pivistrello.it>
References: <20250625-b4-simple-panel-regression-v2-1-9422d46917ac@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-b4-simple-panel-regression-v2-1-9422d46917ac@redhat.com>

Hello Anusha,
thanks for your patch

On Wed, Jun 25, 2025 at 05:44:44PM -0500, Anusha Srivatsa wrote:
> The panel allocation in panel_simple_probe() breaks due to not having
> the panel desc for DPI panels. DPI panels gets probed much later.
> 
> Currently driver is checking for desc == &panel_dpi to do the DPI
> specific panel desc allocations. This looks hacky.
> 
> This patch does the following:
> 
> - Rename panel_dpi_probe() to panel_dpi_get_desc() and call it before
> panel allocation. panel_dpi_get_desc() returns a panel desc unlike
> panel_dpi_probe() which returned an int. This way driver has a known
> connector type while allocating the panel.
> - panel_dpi_get_desc() returns a panel desc
> - Add a simple helper is_panel_dpi() to identify a simple DPI panel from
> a simple panel based on .compatible field
> 
> Fixes: de04bb0089a9 ("drm/panel/panel-simple: Use the new allocation in place of devm_kzalloc()")
> Suggested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Cc: Francesco Dolcini <francesco@dolcini.it>
> Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Reported-by: Francesco Dolcini <francesco@dolcini.it>
> Closes: https://lore.kernel.org/all/20250612081834.GA248237@francesco-nb/
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>

Not working for me.

I tested on top of current torvalds/master [1], and the result is display not working, no WARNING
message and this `platform disp0: deferred probe pending: (reason unknown)`.

reverting de04bb0089a9 on top of current master [1] fixes the issue.

[1] commit ee88bddf7f2f ("Merge tag 'bpf-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf")

Francesco

