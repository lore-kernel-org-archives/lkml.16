Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725A222069F
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 20:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744837109; cv=none; b=fRC7gzWkWVPL7H7yU6wqzRUoVOpLfJEP9vgTmtpKteusz1I+Mv3oIvFVUMTF9t80vtbmiEBmFFsDN2KQOu4kBdYmlhZY3y2egZJZ5vgF6uLRlQOJUU+vCyvz/AlDyjpB/30TEP2PQZ7kdbMshtUKI2FJxskgDnDpzt+WXL5Eh2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744837109; c=relaxed/simple;
	bh=j5RC3enUXwVXzMEJUQTbhkZj6HXXkHlsw3V2BQMlmyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s9SpO8Tw37+UWK2Vnudckd2CTheToF5zrfQ7iHZOtH6A3YwlO0KS1W0VdF87uHmHycu49Ldic0J7iFmYNP57hRdvkzn04Yyg3PK3l9fXA2YUUFs3uIxifnjTPulKCJiRTXwZMih38vqHtPjeKTAOUhZ5prhhDjTgWrgOTwDXdxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=C+RKc3Cy; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="C+RKc3Cy"
Date: Wed, 16 Apr 2025 16:58:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1744837105;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NdQpuGRR10gNQcv5XLfg3fsBASs65X0pcBvFcqE6/LE=;
	b=C+RKc3Cyt6ZV+BMa/0RtEY3HqPur3LQD8icOfxhuqQNLmhiWx3NvihKurNpw43u2uaf4Xw
	NqZX232XuZSMvk+OuXQRr/2Nbk5hGswcUFoIUiOUFfxc5zAakPfvgKw2ExzSPn7fJiBP4g
	s70w5NOHg2Bk3kuIL8+8K+tXNkykG7NRg1LuSkuHmVndwDWfs9aoxkFL6S6m/kdQr3Zrbt
	b+rn2NS5kD9zlu6hWjVc2GdisDQNm1shJpAkri7KLLYlG58UUDx067YidANCT4JZ1EPd5r
	Pi8nH4z/yOGKXOTNWGq6KaMA9QJ9UpkRMVNuotQbxRLzhEUQU6AgLla7zbBCcw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: j@jannau.net
Cc: Sasha Finkelstein <fnkl.kernel@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Neal Gompa <neal@gompa.dev>, Dmitry Baryshkov <lumag@kernel.org>,
	dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] drm: adp: Handle drm_crtc_vblank_get() errors
Message-ID: <aAAZ6iIUtYcfpcdm@blossom>
References: <20250416-drm_adp_fixes-v1-0-772699f13293@jannau.net>
 <20250416-drm_adp_fixes-v1-2-772699f13293@jannau.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416-drm_adp_fixes-v1-2-772699f13293@jannau.net>
X-Migadu-Flow: FLOW_OUT

> -	spin_lock_irqsave(&crtc->dev->event_lock, flags);
>  	if (crtc->state->event) {
> -		drm_crtc_vblank_get(crtc);
> -		adp->event = crtc->state->event;
> +		spin_lock_irqsave(&crtc->dev->event_lock, flags);
> +
> +		if (drm_crtc_vblank_get(crtc) != 0)
> +			drm_crtc_send_vblank_event(crtc, crtc->state->event);
> +		else
> +			adp->event = crtc->state->event;
> +
> +		spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
>  	}
>  	crtc->state->event = NULL;
> -	spin_unlock_irqrestore(&crtc->dev->event_lock, flags);

Kind of confused about

>  	crtc->state->event = NULL;

now being out of the lock. Should we set to NULL in the if, since
if we don't take the if, we know event is already NULL? Or should we
hold the lock for the whole time, the way the code did before your
change? I'm not sure between the two, but the in-between here smells
wrong.
