Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47C8202965
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 08:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750236973; cv=none; b=BtHOU10rn/LlxPkkDdAKf+Au7iblQZ8MhQ8dp90dbi9mXw2MJ+czoTkZCZQ7gctrYMFrpsIooi+ffvia33PTElqzvf57wik1pzN6+PkOS1GlICh7imN+EiDiyV20KFFbQBeFK23A51VeysCOiLzJoLTtEZij4z9fJfk+h3cGwSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750236973; c=relaxed/simple;
	bh=6BYDznB4RlQc+mhxufVxTPJ5Wx3KeL1CGpPkr2rksDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qiaUK1gxSW72aaGrb7aDEQ12bXBI6zuXRt8ryxwHIcHLPSF1t7IPPuYo2NeaLG1J8m64HkVJx9mRh4zF3NA5fVLU2U4EKN5hKURuzSXqsRXvlaC8CDqCz9olqqm6smR70nRhrM7ITCFOEzYGbXQNHPG+dJB41QtEYD5ibUUSZEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ci+LKuB9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ci+LKuB9"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A1012593;
	Wed, 18 Jun 2025 10:55:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750236950;
	bh=6BYDznB4RlQc+mhxufVxTPJ5Wx3KeL1CGpPkr2rksDM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ci+LKuB9+BLJf8defbnolBzBEb49WwnAsDr/a1CEepJks+H5U9q5NGNBjPdobiYfQ
	 AOYXT54RwVxYlkqrjhJ5MpsqZaVLT+tRdS1f3xSDEc9Xek0YZhDzu3CzB4XlgCNUrc
	 9w7gyBDLTtUn/G9oLjUvR9JeOT+C871+ubH2ZBL4=
Date: Wed, 18 Jun 2025 11:55:45 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dharma.B@microchip.com
Cc: asrivats@redhat.com, dri-devel@lists.freedesktop.org,
	Manikandan.M@microchip.com, neil.armstrong@linaro.org,
	rfoss@kernel.org, jonas@kwiboo.se, jernej.skrabec@gmail.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	linux-kernel@vger.kernel.org
Subject: Re: bridge/microchip_lvds panel usage
Message-ID: <20250618085545.GC28826@pendragon.ideasonboard.com>
References: <CAN9Xe3RV9aZLJ3zV3zip5MQweGbBghdOFGohd6Qg-XjvFoGing@mail.gmail.com>
 <20250617233623.GB22102@pendragon.ideasonboard.com>
 <f10ee1ce-5362-4dc9-8e61-726db9c27d64@microchip.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f10ee1ce-5362-4dc9-8e61-726db9c27d64@microchip.com>

On Wed, Jun 18, 2025 at 03:50:11AM +0000, Dharma.B@microchip.com wrote:
> On 18/06/25 5:06 am, Laurent Pinchart wrote:
> > On Tue, Jun 17, 2025 at 10:36:34AM -0500, Anusha Srivatsa wrote:
> >> Hey folks,
> >>
> >> Can someone please explain why the driver looks for a panel here:
> >> https://elixir.bootlin.com/linux/v6.14.11/source/drivers/gpu/drm/bridge/
> >> microchip-lvds.c#L182 and doesnt use it or set it up anywhere?
> >>
> >> I bumped into this while working on converting of_drm_find_panel() callers and
> >> the lvds->panel usage in this driver felt off. Am I missing something?
> > 
> > That doesn't seem needed.
> 
> Currently the LVDS controller driver is hardcoded to map LVDS lanes to 
> the JEIDA format.
> 
> In order to support the other format "VESA", we need this to query the 
> panel driver and set the appropriate format accordingly.
> 
> "drm_panel_get_modes(lvds->panel, connector)"

It would be nice if this could be done using the bridge API instead. An
LVDS sink does not necessarily need to be a panel.

> We'll be submitting the patch upstream shortly.
> 
> > By the way, please use plain text when posting to kernel mailing lists.

-- 
Regards,

Laurent Pinchart
