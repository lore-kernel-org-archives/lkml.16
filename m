Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66464241CBC
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 15:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739202785; cv=none; b=UWYUsRUSr33uGmHhFg/Z4AF40FdR48JhaHQT7MgKCum1k5Cc7arhb9s1sZNrVu62tL2epl/CIIHRAt5TBR09f2bAV9pO9ivC5iroKAJRUW8/bcJ3TOYncD/dHgFwnG5EcUt3abn13JG13/8DC3jdthKvfzJuCMaOIlb3ja5uRJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739202785; c=relaxed/simple;
	bh=yqGd0pQCEeWQ7bz7anVjqVOop738V+vFyvm+NZfQDdg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dl8vPrR0gmEokfqxghF+GLYng76NXslHnKBOuc9DBWRFFKRAh0hYb94kWXsK1NsBsUR0JqZFa7Tx5CCQ+cNXMEiK1CwtfNnKgXE4v+iPULaWyDuyYWkotY4okzTkAfJ2CwOtuC/myB/yvOQEWxq13zRj0R3Ih+CiI9/VhR7F18k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SRrs14VQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SRrs14VQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA941C4CED1;
	Mon, 10 Feb 2025 15:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739202784;
	bh=yqGd0pQCEeWQ7bz7anVjqVOop738V+vFyvm+NZfQDdg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SRrs14VQxzOXuxJWT4H5CtGOsgDgM0Ia1kmvb8JAZl8159ePxW4KrILXTUaYGmTv2
	 EsWe2RtbGxwoIFUoLXKXAzSDLc2AmZUZRHH8hsaBzeTMySCBDcu51jJ4x2Pfqvrfqi
	 pZKmafVjefDK4TOqo6h46L92PNPrNwr4pdxuikuiesltIHY3UGAL79Mo2oJL2u7gx7
	 k4TeUVDF4RVaAA/EF5/VPmR91d7ygKMeMfIkp9Hrfq/2CvYCHcIUDgnEhffaDAk+DN
	 6fOZ6kdUjcsD2f/CJMNGroJAxmjAJjkWrmbpEqz0IB2diQot4BqZRBCxPW5KXQOdJa
	 RTdvnULffSDVw==
From: Robert Foss <rfoss@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250206-drm-cleanups-v1-0-93df60faa756@bootlin.com>
References: <20250206-drm-cleanups-v1-0-93df60faa756@bootlin.com>
Subject: Re: [PATCH 0/8] drm/bridge: minor cleanups
Message-Id: <173920278049.3996442.9575559146490038271.b4-ty@kernel.org>
Date: Mon, 10 Feb 2025 16:53:00 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Thu, 06 Feb 2025 18:02:32 +0100, Luca Ceresoli wrote:
> This series removes some unnecessary #includes and and unused forward
> declarations, which I noticed while preparing a way more complex series
> (bridge hotplug). I decided to split these trivial patches to a separate
> series to limit the noise on the larger series.
> 
> 

Applied, thanks!

[1/8] drm/panel: remove unnecessary forward declaration
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/66ac08bb7788
[2/8] drm/bridge: nxp-ptn3460: remove unused drm_panel.h include
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/f4e71f660368
[3/8] drm/bridge: parade-ps8622: remove unused drm_panel.h include
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/202f3f60d174
[4/8] drm/bridge: parade-ps8640: remove unused drm_panel.h include
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/10fab0675483
[5/8] drm/bridge: tc358762: remove unused drm_panel.h include, add drm_bridge.h
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/38e092786e54
[6/8] drm/bridge: tc358775: remove unused drm_panel.h include
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/2ac2ff99962a
[7/8] drm/bridge: ti-sn65dsi83: remove unused drm_panel.h include
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/5199ffb87f78
[8/8] drm/bridge: ti-sn65dsi86: remove unused drm_panel.h include
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0e9cb79ce49b



Rob


