Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34F521D3EA
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 10:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750933292; cv=none; b=ZUnU4CXg6WiLpACQi8ah23wC423KZv3FkEvq2VW7JgtJ3I3mAghRewVKncK88sw+opwV+Bz2eT5RHW31c7w2MpkKxeFP7iJxeFbKyuHKxQoG+h7b5S1vLafnP3W4UgvAqoQn6EKptwd1vUZ5Iv1dBXerOXlfZja2mqM3DENTm2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750933292; c=relaxed/simple;
	bh=wuyYUJYBGjMGsR5z8Xt+sWOwz08ARzD+e0c376gudIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f9VXlfcTW7tdtC4mWrr1FCX2lK89DgcCxf5OklLSMY/nC+24ELUPGFV6hodlljkvFN2ATvL0P8Qvp8lz5F1AUcMUAaFcmf8sufVX6+tKMmDQ6zIJmv/nlx0B22Lmyw9YHPd5R8QcoMAySzn7e2kI0+YKGY3efYT40NsIc7X/fzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=C+JGQTgl; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="C+JGQTgl"
Received: from gaggiata.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 866231FA9F;
	Thu, 26 Jun 2025 12:21:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1750933288;
	bh=8mDX2mVu5psUDXip/UEM+GhL2PEeUin4P89BMTdn6xc=;
	h=Received:From:To:Subject;
	b=C+JGQTglztBCnKVPAZCdr5iMERa2OSCeP4znfS4XhVyRD1GOS4D5ZVYSRgm4G0CYt
	 QBWL5HmEAMG2/52afkE8PDl1zSqpJbuBxAWx1fIXa/Z6S+sPvOGZLUID7vEGoHUL27
	 6LrRoAwHs5aDVd5fSxjfgOUA0ZOYMg2AJmp2JfAChJUt7UQHrzT+O5z6gVEB+uPqIz
	 jeqfRsAOjpgYGhpFNE9e00h5Aq4LP7DVZiD4WpZYoXqQtv/uCu7aMpYW/e+PIo2owP
	 Vt/ssRmyTPb0ZqYGBMQ+pdTiBYNLu/StnvxsoCMdvSClI6h9Z1ZFLKuGsymbUtTvsj
	 I8ifHMV6XgFcQ==
Received: by gaggiata.pivistrello.it (Postfix, from userid 1000)
	id 2E5177FA06; Thu, 26 Jun 2025 12:21:28 +0200 (CEST)
Date: Thu, 26 Jun 2025 12:21:28 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Anusha Srivatsa <asrivats@redhat.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] drm/panel: panel-simple: Fix panel-dpi probe error
Message-ID: <aF0fKHQywtoG63wT@gaggiata.pivistrello.it>
References: <20250626-drm-panel-simple-fixes-v2-0-5afcaa608bdc@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626-drm-panel-simple-fixes-v2-0-5afcaa608bdc@kernel.org>

Hello Maxime,
it works for me, thanks!

On Thu, Jun 26, 2025 at 12:04:58PM +0200, Maxime Ripard wrote:
> Here's a series fixing (hopefully) the panel-simple regression for
> panels with a panel-dpi compatible.
> 
> It's only build tested, so if you could give that series a try
> Francesco, I'd really appreciate it.
> 
> Thanks!
> Maxime 
> 
> Link: https://lore.kernel.org/dri-devel/20250612081834.GA248237@francesco-nb/
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

For the whole series,

Tested-by: Francesco Dolcini <francesco.dolcini@toradex.com> # Toradex Colibri iMX6

Francesco

