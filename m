Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA1A18C332
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 09:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750929929; cv=none; b=K08nU80+oZyOPSF1xc/Gyagpk4a5KkCgCRByFIgrw8q4gtzSn4ht9J67Bqfcx9qDmROr+Mp88Q1cB8LGuJvo+sZ+8uHgdyxAeED/caIjNBxnYOAbkPaeGBYQ+XJNMOUV5QmhNJ+QOFwrR2DSj3z2wbl8LUqS04rCfU4JR5QKPtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750929929; c=relaxed/simple;
	bh=Erpy+GznfU3VNLbN8ho+JUSJoOvRCq/2b7GmnCXbbWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dzs6TDWY2426Gm4nLes/7zQi4JUMVhU2AvaCSx8tbTXfv4O8o+uEHwZ+Q6EYpYtn+krq5G8qV6RZVAYn7rUzUzpNa4Gcam8W333e3TEWQ20ypbTOMgZ8DQxO0oLn/xNoi5UgfGT07+dhBqUVy5OXQeN+mO1XBgnv/kN5IHr8NQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=HE9EmomO; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="HE9EmomO"
Received: from gaggiata.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 640301F967;
	Thu, 26 Jun 2025 11:25:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1750929925;
	bh=oQiL2nk762kw5hgZ/7yLoXi+yV+vsX0JHtdeUc0YXFY=;
	h=Received:From:To:Subject;
	b=HE9EmomOlz2739bN8MLQHMe8DK71hV/EWB3nf7vOcyRuATfWdfu9hsBvYqfS9lYtL
	 2pip2Jrqz+es1fSzAjzqB4m3VfZmUDS3n/Dx6LCFuw+Kb9hlUlDU3B1leS1xEqJJjc
	 9B7lfga9jODnJ6PLNanjpUR75gFAX/NLgnOM+2jHnNVJ5uKZGu+7k6FEBp6OwN0Gg1
	 O1TTeHq33HMEIaenHxycMCz4Oa0gXRVX9O0sRA9qauH8j/CyCxLyD+UIbfIq2YMC7S
	 sYzoN82zfMxVCqY2IWzTtBmP8dAUYeRzPgSemmVF9HmbypI9kS8151s3sfg9aWk7/E
	 hC/qtLWxiwaJA==
Received: by gaggiata.pivistrello.it (Postfix, from userid 1000)
	id 08CEA7F9CF; Thu, 26 Jun 2025 11:25:25 +0200 (CEST)
Date: Thu, 26 Jun 2025 11:25:24 +0200
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
Subject: Re: [PATCH 0/5] drm/panel: panel-simple: Fix panel-dpi probe error
Message-ID: <aF0SBNGmTpgtBTC3@gaggiata.pivistrello.it>
References: <20250625-drm-panel-simple-fixes-v1-0-c428494a86b8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-drm-panel-simple-fixes-v1-0-c428494a86b8@kernel.org>

Hello Maxime,
thanks for the patch

On Wed, Jun 25, 2025 at 08:48:37AM +0200, Maxime Ripard wrote:
> Here's a series fixing (hopefully) the panel-simple regression for
> panels with a panel-dpi compatible.
> 
> It's only build tested, so if you could give that series a try
> Francesco, I'd really appreciate it.

It does not build for me, applied on top of commit ee88bddf7f2f ("Merge tag
'bpf-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf")

  SYNC    include/config/auto.conf.cmd
  CALL    scripts/checksyscalls.sh
  CC      drivers/gpu/drm/drm_of.o
  CC [M]  drivers/gpu/drm/panel/panel-simple.o
  AR      drivers/gpu/drm/built-in.a
  AR      drivers/gpu/built-in.a
  AR      drivers/built-in.a
  AR      built-in.a
  AR      vmlinux.a
  LD      vmlinux.o
  OBJCOPY modules.builtin.modinfo
  GEN     modules.builtin
  GEN     .vmlinux.objs
  MODPOST Module.symvers
ERROR: modpost: "mipi_dsi_bus_type" [drivers/gpu/drm/panel/panel-simple.ko] undefined!
make[2]: *** [scripts/Makefile.modpost:147: Module.symvers] Error 1
make[1]: *** [/home/francesco/Toradex/sources/linux/Makefile:1953: modpost] Error 2
make: *** [Makefile:248: __sub-make] Error 2
[Exit 2]


