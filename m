Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453A5335BA;
	Tue, 24 Jun 2025 07:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750749082; cv=none; b=rQugeG1lR96UGF9RSLv3ZD0U6Sxaq+LLdWJs/hWvyzIgNvu3KEcCKt19cNpaxDIQKsC97QEHL3SQ/odUnDE0y5K6zmtNQ+iD5eKUmBDZ1sHsvWYJCqWCst+vhg+ObR577Rysx58bEjVDh9YSo9NL0sSzLBlbGeiSZwARicJQ/pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750749082; c=relaxed/simple;
	bh=yJDKd5+dKK2xzoUm23JVLkaJJEcp1/KtgKkWApjEWtY=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=Kj+aQz1s/Vpw2j1EQmqZ9pk5p7vm+ahWx1EKQIixAp9e2BcxEycmdNRQNdvKW+Hz4AU85ntWv2qVHPabIHnJFd1H7HznAzvJrHrIGgokb52Fx1EPbVNK+p+6vDJ+ljupD2qWnIbrvDICJY/M1ixp5s+/qVh/yW2yGHo/JKGr0eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J3xKKSls; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J3xKKSls"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68C64C4CEE3;
	Tue, 24 Jun 2025 07:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750749081;
	bh=yJDKd5+dKK2xzoUm23JVLkaJJEcp1/KtgKkWApjEWtY=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=J3xKKSlsiZo6RsDo6+oL9tA3PzHpoCx/xIdEv0xHuYFNnWMun83Uv70+HHZxocJH9
	 lbDLJOUAgxzoq0XUcqU7/FkESMHZnS/MTq6WbzhY4XfJPLhcYrtnSlUkpOi5Iy7RAe
	 aV5hvTLj2WxyFLIj0DB7Np0t+x1NbMeTD8efL3bDlabjvVuri03n/h6tfevhHLN4lj
	 XO5eXE2xkoY7BaCXNZi9v2jaQdCB89GfcUqvVpEqstdGQjWakECjn4n0I024RzRNOI
	 aYWYOhrgqlNT+9gm4ETZmz7KNswFU1fSzV2g1qdrSostmeDrLACTZwHwyiuCWrjUQ6
	 J+w4jYeG21yig==
Message-ID: <0b92d749fcd2714db7b501e5a6fe4a7f@kernel.org>
Date: Tue, 24 Jun 2025 07:11:19 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v8 4/5] drm/atomic-helper: put the bridge returned by
 drm_bridge_chain_get_first_bridge()
In-Reply-To: <20250620-drm-bridge-alloc-getput-drm_bridge_chain_get_first_bridge-v8-4-0321845fcafb@bootlin.com>
References: <20250620-drm-bridge-alloc-getput-drm_bridge_chain_get_first_bridge-v8-4-0321845fcafb@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "David Airlie" <airlied@gmail.com>, "Fabio
 Estevam" <festevam@gmail.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marek
 Vasut" <marex@denx.de>, "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Robert
 Foss" <rfoss@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Shawn
 Guo" <shawnguo@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Stefan
 Agner" <stefan@agner.ch>, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

On Fri, 20 Jun 2025 19:26:16 +0200, Luca Ceresoli wrote:
> The bridge returned by drm_bridge_chain_get_first_bridge() is
> refcounted. Put it when done.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
