Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE692C3759
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 13:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745933348; cv=none; b=illWlDGSDJPI/RmTxZcNgMhWYkcwIHRjHdnhzaHqwKec/7lwy2s3dYG8szxg4Nhoi9QuwDqibMSf/4ibpIRQakRH2aunadXRklNvQQQk5qn8cEcsIowDookQMCNS2m/mRtDsGLsrho9MfAv61sADQsc76lnhW8yZ+cOkLBDpVSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745933348; c=relaxed/simple;
	bh=kDv0l15rAK7bZZq1e1Vseo/zrn4ABP5F9SmziT3xyZI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EKBU0K/FyR6N7aK0BGomVXi+kL0R+r5o1wt/5pvu+pzb3/vOUM3G7IzUl3XxYFopDKl0cgOeTCBoJUbnZu/UiIQFGbq9o1oxe3dj0Js4VcjVP8KqvWElrZSjANtpGHAKz860UFqqbaLsktii8yuzgosKzGNKeWQiL5++Pl3+o4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=ROw1RHi0; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="ROw1RHi0"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1745933344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4DytQf8/knSTl8uN0E/2GEj/HCfcYQColb3vJTlNtko=;
	b=ROw1RHi0HM04vTWcet5QsVpmmPhfbXa4hwH6n+xgsKwc32TKuztrJt44PvMGB5AL0YyL4a
	zoQOfN6SH0Nt23ov4l80WjBYo1jgFf90uj/2I55trX8KrCqO3ijmILGzu7hdWk7MAtSfuP
	qGPXenuw1BgxPHRVa9AQeyou0Uv3lrFSlaRrm4c2RuM74s1VpkTgu1rcuJ0nk/PDxpNF1W
	dvmgYpbo+Q3KOzWX9yFd9oxrzEgw3wxmobR2n340M8A9i8iImAwXErfSfFVhv4RpPVzEBA
	Ynyq3VtD+PaWFbAjOWA3VjyOVfrTxJqHn1/q4+5+FzGnF846uhJpgGKqFaOeSA==
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Neal Gompa <neal@gompa.dev>, Dmitry Baryshkov <lumag@kernel.org>, 
 Janne Grunau <j@jannau.net>
Cc: dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250428-drm_adp_fixes-v2-0-912e081e55d8@jannau.net>
References: <20250428-drm_adp_fixes-v2-0-912e081e55d8@jannau.net>
Subject: Re: [PATCH v2 0/4] Apple Display Pipe driver fixes
Message-Id: <174593334122.31053.18397299595093842185.b4-ty@rosenzweig.io>
Date: Tue, 29 Apr 2025 09:29:01 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On Mon, 28 Apr 2025 13:37:12 +0200, Janne Grunau wrote:
> While looking at a suspend issue in the Asahi downstream kernel I
> noticed several issues in the the ADP driver. This series fixes those
> issue.
> 
> The root cause of the issue was that the device is unexpectedly powered
> down on suspend. The driver relies on initialization done by the boot
> loader and can not bring the device up from reset. The change in [1]
> annotates the power-domain used by ADP as always-on. This ensure the
> touchbar is useable when the adpdrm module is loaded after boot.
> 
> [...]

Applied, thanks!

[1/4] drm: adp: Use spin_lock_irqsave for drm device event_lock
      (no commit info)
[2/4] drm: adp: Handle drm_crtc_vblank_get() errors
      (no commit info)
[3/4] drm: adp: Enable vblank interrupts in crtc's .atomic_enable
      (no commit info)
[4/4] drm: adp: Remove pointless irq_lock spin lock
      (no commit info)

Best regards,
-- 
Alyssa Rosenzweig <alyssa@rosenzweig.io>

