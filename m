Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C2F1FC0E2
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 23:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750980737; cv=none; b=rgaThlFoKqNWeGjZsWLRvUE7rtukCjoIsKuUPrGtwMij9eDU5H/+CsqgBUH/lIaL/Nc+pdUJRiUsMw7adarVGXXZbDaZTG4YbLE5mHi/Bn/EYAcg/l/QeREY55rW6Hm4L/CqpQqys/8CIRRz5eFajhmx1lRfFk7QkVsga+1ERiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750980737; c=relaxed/simple;
	bh=p9T5tKbPyQn9WU/Ctj4Au9KigTyc9WURcP91i9yJwPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NBWRWK7+VSfsxYdnS5LTcAhGmjNRSvIhZ86tM37eN1oNBnfRPufvXxdCEQW5cwbD6d5cOFuujlu9DHBJNZoxYBzXvR4aoQNidyKQtiXobPiQMc92tpWK23ty8xqWyN9j+TFQ97ocfQ7q8J+qRXRnHQTUEHdbsLcfq+xLCaZ0Zew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PPmlCSmo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PPmlCSmo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA556C4CEEB;
	Thu, 26 Jun 2025 23:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750980736;
	bh=p9T5tKbPyQn9WU/Ctj4Au9KigTyc9WURcP91i9yJwPg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PPmlCSmoLgBO0j/SIml3aZayN9reJ2oZPPNkIycp8F5PROgpVZ2ClK6knBSuobp3C
	 /CJ6DR6IbJqEhMD+I6HFWvSeCPTB4apGNMaqdd9VzKncvWmymd6bjm8AxinS4EqWzm
	 0VHsUFCyvkaxy3JjRVkXfHGt9TdC+HMJP2ovmI5EVccNvkjBcCItOvFHXD9DYZYpp9
	 7nPf60OAqsa6KsDpnj45VAhMEj/KRQoL+iem2n02bsC2MUiPOuZO5kny23ecJyAcOb
	 la/I1Txteu/H1XFFbJUyoHixZsLZbtfWEG7o3a0oxr689bbVYUWUX7HVj1L5Qfn2iy
	 01ZEtuwJP3v2Q==
Date: Thu, 26 Jun 2025 16:32:16 -0700
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
Subject: Re: [PATCH v4 05/17] phy: cdns-dphy: Remove leftover code
Message-ID: <aF3YgKoaLniqs1XC@vaman>
References: <20250618-cdns-dsi-impro-v4-0-862c841dbe02@ideasonboard.com>
 <20250618-cdns-dsi-impro-v4-5-862c841dbe02@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618-cdns-dsi-impro-v4-5-862c841dbe02@ideasonboard.com>

On 18-06-25, 12:59, Tomi Valkeinen wrote:
> The code in cdns-dphy has probably been part of a DSI driver in the
> past. Remove DSI defines and variables which are not used or do not
> actually do anything. Also rename cdns_dsi_get_dphy_pll_cfg() to
> cdns_dphy_get_pll_cfg(), i.e. drop the "dsi", as it's not relevant here.

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
