Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6A3235344;
	Thu,  6 Feb 2025 16:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738859695; cv=none; b=JM8JzcpDttc60Ow3CK/QesKdXRhe12dS3eBsVLNw5kB7uPxMCMpULNTiG9KExqahor0c37z184wceY/6jBueuspPSMl5tID68p8erKSzVgDqqFV03duyqHINUM5nNYB4LG5HvG5OmpjYNfCvI1Uwyb2rFT9by2AwRBDrNBhAnTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738859695; c=relaxed/simple;
	bh=+ivOAUv3shutbdSTgc0/oz/8/mZOlkgY1F9fFkCvfs0=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=eebJHVxZCmo40czJfBAX0Hnyx0larsBEf+5+iww8/5Cylr0TDBUggmZyJTfxxkA/tOEZPjyUEl4qhRhAdgJxDcDVS8K23V5GccUYUwK/xUL+cDzjV5273kkhleT4qBzja2WvBIb8Yim4nRIKUEFPGmo1JMuVNtHG0oiC8+WV6kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gu7zYGA5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gu7zYGA5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD1F8C4CEDD;
	Thu,  6 Feb 2025 16:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738859695;
	bh=+ivOAUv3shutbdSTgc0/oz/8/mZOlkgY1F9fFkCvfs0=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=gu7zYGA5Ha68MTmNlxhrXGN574w4P+3IrB6nJY6x6RCRin7jR2+BUffeyQCVyQg67
	 oW8ak31pVFpVSGXhsDClOI6YtrD9/qezzRzEzmcd8/D3NYzad4cZ4fi0eOvJ/494Cw
	 wPBO3uhkBDiaiU86eCnw57sqaxpHrVavnOJSTKLEadIx3e+n66hfBaexQQsJhQVzUV
	 JhnaBJF471QlXMkwrEvInOngEHEi+lb6wG+HhT+sPwpw2njYwbp2aNjLOVvl+MoRzE
	 4gdu9o8kDKwg4EJknCp+ftTdP9XhRKP+3WkWfJ7HAudTs0YHUXTb1wirn7KFRcHVKM
	 eBG+69YkGgOZw==
Message-ID: <895aa2097cb7e57560c70ca53aba4abb@kernel.org>
Date: Thu, 06 Feb 2025 16:34:52 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Liu Ying" <victor.liu@nxp.com>
Subject: Re: Re: [PATCH v8 13/19] MAINTAINERS: Add maintainer for i.MX8qxp
 Display Controller
In-Reply-To: <7a03ebbf-5ee3-45d3-a58c-8832bd0f8960@nxp.com>
References: <7a03ebbf-5ee3-45d3-a58c-8832bd0f8960@nxp.com>
Cc: agx@sigxcpu.org, airlied@gmail.com, aisheng.dong@nxp.com, conor+dt@kernel.org, devicetree@vger.kernel.org, dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org, festevam@gmail.com, francesco@dolcini.it, frank.li@nxp.com, imx@lists.linux.dev, kernel@pengutronix.de, kishon@kernel.org, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org, p.zabel@pengutronix.de, robh@kernel.org, s.hauer@pengutronix.de, shawnguo@kernel.org, simona@ffwll.ch, tglx@linutronix.de, tzimmermann@suse.de, u.kleine-koenig@baylibre.com, vkoul@kernel.org, "Maxime
 Ripard" <mripard@kernel.org>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

On Wed, 5 Feb 2025 10:39:10 +0800, Liu Ying wrote:
> Hi Dmitry, Maxime,
> 
> On 12/30/2024, Liu Ying wrote:
> > Add myself as the maintainer of i.MX8qxp Display Controller.
> > 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
