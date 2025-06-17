Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE412F5329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 23:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750203404; cv=none; b=rKQZLG9IvX0yZw/SezWcstIjJruJCF/2cDM/USFRAL5anpihThddIP4PwvGiE7wdrAYbUM3Xaep1d7AHPDSqVU0fhYmfNjNeIfs7MzkDmolBz0jgtCY5VPEICzKmQl03NsVoUn62unwBL5NK/NTOJhvN30dCy0s4RQo1w2vA3+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750203404; c=relaxed/simple;
	bh=NbTMohnJ29DTX2DJnsv1NNMZmJYjYAXpl7R+I7B/mgw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u/FwnfVno53QJsV609jWHmh3uLAGH7Pfo6jWtdTZ39vTLNjyPPsvXIUuHcR8lNURkMxxTtqj0S0H7WozfkWhZvkhzI3jkXxT8H/tm35wVDseSxWQGi6iSss7YN+P9YNlKKc63h7G9CavlyIUiCY8qnAT4+sr2w5I3WDRl+dKtjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CuZ62l5X; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CuZ62l5X"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5C118C0B;
	Wed, 18 Jun 2025 01:36:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750203387;
	bh=NbTMohnJ29DTX2DJnsv1NNMZmJYjYAXpl7R+I7B/mgw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CuZ62l5X4iTkjoNjpXqIb4XvdDlEun42BxyOHkXW5dNv7E15UKN5WzNM7e98gAIhh
	 5356Dbii9VEM1I+rG5Q16XRjITXX80nI6ChywDhVZqEY7sxd2DdK6knyjBcrE6Nafx
	 kWhcwGZwgFI9Ctt0vnaHDDyAjiBX5zaFvH3wB+Zg=
Date: Wed, 18 Jun 2025 02:36:23 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: dri-devel@lists.freedesktop.org, manikandan.m@microchip.com,
	dharma.b@microchip.com, Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org
Subject: Re: bridge/microchip_lvds panel usage
Message-ID: <20250617233623.GB22102@pendragon.ideasonboard.com>
References: <CAN9Xe3RV9aZLJ3zV3zip5MQweGbBghdOFGohd6Qg-XjvFoGing@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAN9Xe3RV9aZLJ3zV3zip5MQweGbBghdOFGohd6Qg-XjvFoGing@mail.gmail.com>

On Tue, Jun 17, 2025 at 10:36:34AM -0500, Anusha Srivatsa wrote:
> Hey folks,
> 
> Can someone please explain why the driver looks for a panel here:
> https://elixir.bootlin.com/linux/v6.14.11/source/drivers/gpu/drm/bridge/
> microchip-lvds.c#L182 and doesnt use it or set it up anywhere?
> 
> I bumped into this while working on converting of_drm_find_panel() callers and
> the lvds->panel usage in this driver felt off. Am I missing something?

That doesn't seem needed.

By the way, please use plain text when posting to kernel mailing lists.

-- 
Regards,

Laurent Pinchart
