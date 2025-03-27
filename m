Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1451E868
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 15:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743091135; cv=none; b=p5Y9q2M5EUeRg9i69+i4hoH7/4gYHzmzsgWWXe/6AdhF5ZsMUJBUtoeFLyArrZojVcTqwuyLsTKF95MVxd14V9JgH+6iE8lFucFxPFXMDoO1t6exMlCuymoLpK0egMAbedEnIcpXIDYUK4ZWNS0/aER3MzDr9H2Xjv58nsQeRL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743091135; c=relaxed/simple;
	bh=pbYDjAvFxfxYjSsyWNc3U0OkBb1vljVHhfPna0F5/CU=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=QNrqb8qm4QxEIabD+yQBc4HtmLkulhmsuwIbiuyP7q/UZG9CCUI6tYyUBiFUvrKY8cMcSPTi1jNufR6EU6rbSa0G2hhvW638qC5WK7qKj1KTlQTqF1xvlqlOxMlviLupB/yFTRxlmwCvyN2QKsHQb65gv4EjfCX4yhgtNMzZJB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qXp7GcCB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qXp7GcCB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2252CC4CEDD;
	Thu, 27 Mar 2025 15:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743091135;
	bh=pbYDjAvFxfxYjSsyWNc3U0OkBb1vljVHhfPna0F5/CU=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=qXp7GcCBhiEhqVw/470D400rKFS4IAGASJhIduIstfzFVGPi3lo+wKbxvVHZ/A8wb
	 V5YSDNrqAwvWrDuerZRuxtY8bMD89AiQD7Y+GPplLM5hgR//zTWS4yJiN56wuva6eW
	 zQBYLYFg3ziCcwYdyp/rfQmgtfnuwKPLrqHW+TRuuBfbYFDDhPvD+ph032gvtH9bnc
	 NBPkbC7PPouWVG8ucDmqUUh2mpFY5HGi5gfG9aKvQq6biPXPMBniBD3bI0tBj0EipA
	 oou6rWIiHcYAomMrhb1+/XP0NJckPEIVDD2cj4g5qevZ4TXu+yhmeQSWRW/ayJuBVy
	 skXD6Yrrg2ntw==
Message-ID: <6515c8cba3cbc66d0b93deea3e4b45a5@kernel.org>
Date: Thu, 27 Mar 2025 15:58:53 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Anusha Srivatsa" <asrivats@redhat.com>
Subject: Re: [PATCH v2 3/4] drm/panel: deprecate old-style panel allocation
In-Reply-To: <20250327-b4-panel-refcounting-v2-3-b5f5ca551f95@redhat.com>
References: <20250327-b4-panel-refcounting-v2-3-b5f5ca551f95@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, "David
 Airlie" <airlied@gmail.com>, "Jessica Zhang" <quic_jesszhan@quicinc.com>, "Luca
 Ceresoli" <luca.ceresoli@bootlin.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

On Thu, 27 Mar 2025 10:55:41 -0400, Anusha Srivatsa wrote:
> Start moving to the new refcounted allocations using
> the new API devm_drm_panel_alloc(). Deprecate any other
> allocation.
> 
> v2: make the documentation changes in v1 more precise (Maxime)
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
