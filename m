Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604BC21B9E7
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 09:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747389538; cv=none; b=RwB4CWf/HY/uGkI8QN8j23VisAO5lzcsDWRb67fy8geGLjYZEG2wU+br0RgrD26TSrodnRMMLpvJbrU6QvnMx7FqzBwdc7azEJ6ap+QpTokS7JM+SdcEJ/jOWpc3wZnQujnJ6kqImlQMAub/eVJz4S7v/4d/gfNf4GZQlbWFdpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747389538; c=relaxed/simple;
	bh=QVfxvrCQXv1stWTNGX4NXG+vcy75UugbfRcy9FAUof4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rjekoEPOdLHi51nxORweFQJCHS5BL9K1TFyxTt52B7Jr2+z3xlw4HZEArfBppo4paSBaMQkPoPOCE5/v9JP0KqXAr97Yj9VIpExZNW9eqT8Z2OCO/3/Na2fxlH8XKqTKQHKT8dXrdWdz63hadZkABexyaPHs6KCJlIpJ398OYAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=KyESI/2J; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="KyESI/2J"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=QVfxvrCQXv1stWTNGX4NXG+vcy75UugbfRcy9FAUof4=; b=KyESI/2J9ezWNblBEXm8WCY5Vx
	N0U6K8cowUXXXmvRS21Yz3CFNQF01H2tUlXEnlpnSymSWijOPM4wuA18OBysE8g3XQMj4yFYRJTBs
	VJ6WcqCkCQK2BXggU71M67bIiMNvzg//sKECW9IUOuIFZUkbzkZWfB3XyM4iG4H+RPlX0Yw12AXFi
	VAZkVGylkbqpe+685ZOX7YOaL+MSIrvGMk95uxNPsNxtRG18D3YZ+a5Z/HFWL1yQI+BDxJmln1pl/
	Mtk/ViNcfB4w0c47ve5aE54sxZ+w9iBxM0roTDImQ4HzIYBlmWBVfBcx1S7RreM67pjt4/poXXeBG
	ZqDNxL9w==;
Received: from i53875a50.versanet.de ([83.135.90.80] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uFrpU-00016q-Dg; Fri, 16 May 2025 11:58:12 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: long.yunjian@zte.com.cn, hjc@rock-chips.com,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 fang.yumeng@zte.com.cn, mou.yi@zte.com.cn, xu.lifeng1@zte.com.cn,
 ouyang.maochun@zte.com.cn
Subject: Re: [PATCH] drm/rockchip: Use dev_err_probe() to simplify code
Date: Fri, 16 May 2025 11:58:11 +0200
Message-ID: <2022996.jZfb76A358@diego>
In-Reply-To: <94e0951b-46e1-439b-9dbc-c2009a78b04b@kernel.org>
References:
 <20250515203554564-j1jBXUXR6bdiN6zARicC@zte.com.cn>
 <94e0951b-46e1-439b-9dbc-c2009a78b04b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Donnerstag, 15. Mai 2025, 17:54:20 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Krzysztof Kozlowski:
> On 15/05/2025 14:35, long.yunjian@zte.com.cn wrote:
> > From: Yumeng Fang <fang.yumeng@zte.com.cn>
> >=20
> > In the probe path, dev_err() can be replaced with dev_err_probe()
>=20
> That's not probe path. I am not sure if you really understand this code.

I think that is somewhat debateable.

dw_hdmi_rockchip_bind() is part of the rockchip-drm component device,
so part of its probe-path. Also I think just the presence of EPROBE_DEFER
which causes the device to re-try probing later is a nice indicator that the
code in question is _a_ probe path. (and usage of EPROBE_DEFER is an
established pattern to make that component device re-try probing later)

And the parse_dt function itself is part of that path too.


> > which will check if error code is -EPROBE_DEFER and prints the
> > error name. It also sets the defer probe reason which can be
> > checked later through debugfs.
> >=20
> > Signed-off-by: Yumeng Fang <fang.yumeng@zte.com.cn>
>=20
> Incomplete chain.

Yep, the patch needs a 2nd Signed-off-by line from
long.yunjian@zte.com.cn please.


Heiko


