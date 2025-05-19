Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F50212D7C
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 20:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747686731; cv=none; b=EZ14sCtNirtZEyLMtpeTuMeDSbLVplIYWl3AdhG4VH5cnOsAL2u+4F+yuaZ1MQGZ4ZBlpaphejDXYqkPqiSiPNjO8jMvVDi6KvEXiU+W8Bl0gJ69izqZaIpah5WJq266eP1QvpRmWR3A9lIpTf27UG+3K5hNuU1l9PAkWliqZns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747686731; c=relaxed/simple;
	bh=adicYJFUFbcWI5VCpds+T+yRkPfU5MwBVrNmMuIk72Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dxiPrEv/Dpke1sfcsQ/zP8OIHJhcXLZV3DdBiD0VKHpZVi3zaz2Z2F3efPScVDiVidsc/fa8peNMIs9xB6LuGoqafaXgRK7tG/Widjn0gS0722eHesmnNeKBcFzbevpx55OIvk/fgviNQf1Mf+XXHR91zG6ElwyyyEvLzcF7vdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=CuKCu/if; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="CuKCu/if"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=lgc1mOORiC8HFkaMdvW9xX85kqMLmkBHdBu/nZcEIx8=; b=CuKCu/ifSJ0H3i3LkowTpcIUGR
	1p+wk74pfLBfZ6I681e9iiZHymozFIxIdm4I5XWIydfQPhBezlHnJ1aiGNDQ/+dTd6suyukIPHeIb
	FjUGkxeDG+N8o1X+3+a65XmfoHEIqRKmK6Sam0qThY6WLLcxabf1FhbvEpARG0y7m4KlHFssZAF4b
	+qZFbsTkj4OIufdQynOkXdAZaSE+o0Yn+OnpScdcCS9dNWYqb+jB/S4pcuMFXsXfwnhwFOMvLl6zW
	3QTYo7PQzZT8eaF+XPLe3AqUghxTyuttxOQjNzL8Z9y3oBS+R9gvj+R194SlNOgY+mv6TIoV5WOB0
	GqdD5J6g==;
Received: from i53875bdb.versanet.de ([83.135.91.219] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uH79R-0001JQ-OP; Mon, 19 May 2025 22:31:57 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	andrzej.p@collabora.com,
	hjc@rock-chips.com,
	dri-devel@lists.freedesktop.org,
	tzimmermann@suse.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH] drm/rockchip: cleanup fb when drm_gem_fb_afbc_init failed
Date: Mon, 19 May 2025 22:31:45 +0200
Message-ID: <174768669421.2818279.4158433368328822949.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250509031607.2542187-1-andyshrk@163.com>
References: <20250509031607.2542187-1-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 09 May 2025 11:15:59 +0800, Andy Yan wrote:
> In the function drm_gem_fb_init_with_funcs, the framebuffer (fb)
> and its corresponding object ID have already been registered.
> 
> So we need to cleanup the drm framebuffer if the subsequent
> execution of drm_gem_fb_afbc_init fails.
> 
> Directly call drm_framebuffer_put to ensure that all fb related
> resources are cleanup.
> 
> [...]

Applied, thanks!

[1/1] drm/rockchip: cleanup fb when drm_gem_fb_afbc_init failed
      commit: 099593a28138b48feea5be8ce700e5bc4565e31d

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
