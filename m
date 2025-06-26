Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0AF2D3ECB
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 09:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750930517; cv=none; b=ha7Q6J6nWCQBBmp+0uUuTogeR5hqhkuBGjY1Q2pYSlBfKDw5/Hcet+JrHFA4G5tFbYnBrZ8eJu9rBxye+dGRhMhP14yUwAGZAb0BAD9vBtttFAgIIKt/4ORTnEmLGNu5NzdKJPXl7SfHmfDp62Uv3c2nYqNgOKJQVLl4fJD/YXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750930517; c=relaxed/simple;
	bh=PYXwf7axwZvMYoIVOS0LNUHKNMXK1OI0DFuWWGPcXeI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kdvk1o5o7o1sTdb8TguvKsxUsJRoE6YjjM86aIonqO7mmThw1+H+3boPREU1HhXXPh1yGkJMQFDruxGmcKHSSbTaxijMHfissL26FI3R1pCQJDrUjwi3tmgFheIJuozL0IgsXqQPYEs57b1XvdeOpa0dMOta9IyP3gYM15CLh28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=eSrwSLdl; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="eSrwSLdl"
Received: from gaggiata.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 4CA2A1F967;
	Thu, 26 Jun 2025 11:35:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1750930513;
	bh=jtFY4cO1iLUpT7mdVmwDvk5FlsqBRnFPfF6wlzvKuX0=;
	h=Received:From:To:Subject;
	b=eSrwSLdl8wEfJkYq5UjD3wVo+W7cQeS3EPUsCAgcfW+LIOAv/tkhS5L40hEgBdiYM
	 01xy0KGYWxTYVml4mFitNh2eTR2ztVPX5HkXkrKU0nY90Gu/2tmJBoGYi3LCgILQuU
	 JQhf159cjGS183FStzVK+NwgegmNuF5gDKGyocCGz0fZKJ2r9FiJEZ2d8Oq13mktIE
	 JOp3ozf+Ke13c4dngeKb44oSDl6lV2j83hxq9H9xWGXqaPKhJWZLqEQzAnma4AKIAM
	 RZ9Ya/rfVd0s8RIKNo9VMoR12fLBMz6ii/ZHFhNwG3zbYYHxF2AWakp8wJFqt3TJUp
	 I0GvlrevRp7vQ==
Received: by gaggiata.pivistrello.it (Postfix, from userid 1000)
	id 05FAA7F9CF; Thu, 26 Jun 2025 11:35:12 +0200 (CEST)
Date: Thu, 26 Jun 2025 11:35:12 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Anusha Srivatsa <asrivats@redhat.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	francesco@dolcini.it
Subject: Re: [PATCH 0/5] drm/panel: panel-simple: Fix panel-dpi probe error
Message-ID: <aF0UUBQFAu9GUde0@gaggiata.pivistrello.it>
References: <20250625-drm-panel-simple-fixes-v1-0-c428494a86b8@kernel.org>
 <aF0SBNGmTpgtBTC3@gaggiata.pivistrello.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aF0SBNGmTpgtBTC3@gaggiata.pivistrello.it>

On Thu, Jun 26, 2025 at 11:25:24AM +0200, Francesco Dolcini wrote:
> On Wed, Jun 25, 2025 at 08:48:37AM +0200, Maxime Ripard wrote:
> > Here's a series fixing (hopefully) the panel-simple regression for
> > panels with a panel-dpi compatible.
> > 
> > It's only build tested, so if you could give that series a try
> > Francesco, I'd really appreciate it.
> 
> It does not build for me, applied on top of commit ee88bddf7f2f ("Merge tag
> 'bpf-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf")
> 
>   SYNC    include/config/auto.conf.cmd
>   CALL    scripts/checksyscalls.sh
>   CC      drivers/gpu/drm/drm_of.o
>   CC [M]  drivers/gpu/drm/panel/panel-simple.o
>   AR      drivers/gpu/drm/built-in.a
>   AR      drivers/gpu/built-in.a
>   AR      drivers/built-in.a
>   AR      built-in.a
>   AR      vmlinux.a
>   LD      vmlinux.o
>   OBJCOPY modules.builtin.modinfo
>   GEN     modules.builtin
>   GEN     .vmlinux.objs
>   MODPOST Module.symvers
> ERROR: modpost: "mipi_dsi_bus_type" [drivers/gpu/drm/panel/panel-simple.ko] undefined!
> make[2]: *** [scripts/Makefile.modpost:147: Module.symvers] Error 1
> make[1]: *** [/home/francesco/Toradex/sources/linux/Makefile:1953: modpost] Error 2
> make: *** [Makefile:248: __sub-make] Error 2
> [Exit 2]
> 

The issue is that I do not have CONFIG_DRM_MIPI_DSI. Adding it the build
finishes, and it also fixes the issue.

Francesco

> 
