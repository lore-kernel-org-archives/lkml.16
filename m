Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E1712DDA1
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 23:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750980723; cv=none; b=qYJkq1OG0wioTrAjbT+Hp5IhduYr/rEA8jMMizEVQFrSss44XwbSbOfbwZ0mR1QF31+AIZG4lC70VaMtMST9pSGj5VVd1QMG76vV3JjjLyHQsThYBHVn8cwCmkLax+hEnCQO3X9MYAGXc8RHJzl1VFD+h0gbqv7FoqCA3Cx29S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750980723; c=relaxed/simple;
	bh=ckM1z62+dzERRsA8njW/QMC1vRSg8enjDPrdmoz/Lmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FVB1D5qlRxffKfNuf1Nz/jtbtlnwDQqIVW3Yqm2tbcS5jxB+N72RCUn/4yLKA38Fkn4MdELT1g04XMafloG36zD86HY0bSxDMIx1LNpSZK6Nv93/yHfFzjwI6sMvaw9AQqjKvQ1czaVZscX4HqSprGpypVirfVZFRMRYYdQrnj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rHIlbWpC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rHIlbWpC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55037C4CEEB;
	Thu, 26 Jun 2025 23:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750980722;
	bh=ckM1z62+dzERRsA8njW/QMC1vRSg8enjDPrdmoz/Lmo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rHIlbWpCPNwmNcL0HYK9yTLEIH5uOmpr090lt3qNIXx6tVE8EA61pGmhTQCt/H0eY
	 UwFVgz/MDPsX2y3lVhHsJSWuA7LYJ4SqKB+EQluFhxP8YxaTk23J0vYc6aacoF1Wfp
	 5j+ZCxFhZ38o0LZDsw21Ck6GNtVVcdnZTID6ArKUaB7SiyHkNi/uM5iJZkxc1plqG0
	 jrn0dUpbD7fLllsOdKjNSojE1a5kmwLZdPaTfj3w5Cm1x1ydHGrSThA4+voXH/ZGgv
	 tDSv8NasuyOyH6bFxSKDkjUCKc3L16JFMCH054gUlY1IksSRu/TqlHPTmGbQ7rUGxt
	 6bd4N0d6PzSrA==
Date: Thu, 26 Jun 2025 16:32:01 -0700
From: Vinod Koul <vkoul@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Jyri Sarha <jyri.sarha@iki.fi>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jayesh Choudhary <j-choudhary@ti.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Francesco Dolcini <francesco@dolcini.it>,
	Aradhya Bhatia <aradhya.bhatia@linux.dev>,
	Devarsh Thakkar <devarsht@ti.com>,
	Parth Pancholi <parth.pancholi@toradex.com>
Subject: Re: [PATCH v4 04/17] phy: cdns-dphy: Store hs_clk_rate and return it
Message-ID: <aF3YcUfnagD9rHvR@vaman>
References: <20250618-cdns-dsi-impro-v4-0-862c841dbe02@ideasonboard.com>
 <20250618-cdns-dsi-impro-v4-4-862c841dbe02@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618-cdns-dsi-impro-v4-4-862c841dbe02@ideasonboard.com>

On 18-06-25, 12:59, Tomi Valkeinen wrote:
> The DPHY driver does not return the actual hs_clk_rate, so the DSI
> driver has no idea what clock was actually achieved. Set the realized
> hs_clk_rate to the opts struct, so that the DSI driver gets it back.

Acked-by: Vinod Koul <vkoul@kernel.org>


-- 
~Vinod
