Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7FE27F164
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 13:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749217889; cv=none; b=hSxd+Mno5xzAYqUfM2mI9LaGSkr/qFm5Fj7OcY/GFUe954WAqjmGYzs++Z05OilR7qWgim/NBzebPT5G58ElUWgvjwHPfLvs5ztN9x+DvWQup9HfuLxyFrs/nL2+qqZoamzbHllFcCKQT31hHG3DZcFI8YF2xhv4AF0hTAzcaEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749217889; c=relaxed/simple;
	bh=0EUhPJN/ej7dujrTSImae1IpfSVdM4lhwwyQXY3wRhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MYE+OI3x9yfIxfAHjqnlsj25MrwKPo/AbUP3/aDWjlZSLoAgH/MTkX/X8XBAgD+5/DXQCSx8ATcIVDC+GxGnBfwqb4wbmhte29USWcFF8SHG+xviaLzJa/UCtMqFV45vMd8UkBScsIacrjjs1DaUheybDmGMpDY6nSQmZXInA7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g+XEJ6TL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g+XEJ6TL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54388C4CEEB;
	Fri,  6 Jun 2025 13:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749217888;
	bh=0EUhPJN/ej7dujrTSImae1IpfSVdM4lhwwyQXY3wRhg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g+XEJ6TLd24xwY1scPWFxLNqHDO/czrYDZlcD/8CYc3S9WM9XHopq2GBGKozTqSi3
	 BvYlCkIOzj9oFBx3oJeeIwNWgzVfDKqVXtvNuOw/1KG9OAEZT2P11hu1XT4PYY1QoL
	 B//JwS60GfeCS10GehaNbHz1j91AofdBlN3bBpNikWHXnZF/EyGkGq5YQcENRGjjkT
	 Je1My1YqsKM6ma7T2DKgDNpXXE/rjusOydU7TF7aEvpPyh38wQKocG0LQeejaLtR7n
	 qitO0+dbSzI+VHuE4sVXhWX4X9L0BlvGFKoRCJESripKQ1nhmUHr/y/3HqOKh+SiGg
	 +QWNAOPwBa6SA==
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maxime Ripard <mripard@kernel.org>,
	Anusha Srivatsa <asrivats@redhat.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Dmitry Baryshkov <lumag@kernel.org>,
	=?UTF-8?q?Herv=C3=A9=20Codina?= <herve.codina@bootlin.com>,
	Hui Pu <Hui.Pu@gehealthcare.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 0/3] drm/bridge: add kunit tests for devm_drm_bridge_alloc()
Date: Fri,  6 Jun 2025 15:51:24 +0200
Message-ID: <174921788251.1623225.5807110434824414840.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250606-drm-bridge-alloc-doc-test-v9-0-b5bf7b43ed92@bootlin.com>
References: <20250606-drm-bridge-alloc-doc-test-v9-0-b5bf7b43ed92@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 06 Jun 2025 10:41:18 +0200, Luca Ceresoli wrote:
> This small series adds a few kunit tests for the new DRM bridge allocation
> flow, based on the recently introduced devm_drm_bridge_alloc() [0].
> 
> It is part of the work towards removal of bridges from a still existing DRM
> pipeline without use-after-free.
> 
> The steps in the grand plan [1] are:
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime
