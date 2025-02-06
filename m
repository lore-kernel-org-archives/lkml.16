Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6331218EA8;
	Thu,  6 Feb 2025 11:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738840192; cv=none; b=cKk751I+VKsP1Tnrtjutey24Cmdf+1bilC+SumRi9Bsd5M3Q+2iYLrxssnoxY2RssFEtZvEBsj6fhl7dP+EAf2PQlL8qCYr0/dZJXUi/QufCGmFfJ795YjrdPbFXy8WvpISGviT9xkJX0RAI3SpCRyWZUdCMTNbPzY/lBsOE4bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738840192; c=relaxed/simple;
	bh=Onwre4rKklXoVEIWt+Ow2HAb7ij6JoNe/XkYb6Iw/m0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pon4jdDcy46GnOPBKNoFCkNqrWx58P5Vo2scg76BLkn0DnNV+4JifSL/4hjyDkbU8onxtJ0L6gvFtZdFRvjHPflO5T+pz1VqOrVrfRWBU44tiS/2Y4cQYv7j8fb6rPjk8oCn3Fcuy2/tAW2R1drZa/x/8H6f4CqwyIp2bKjeg1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=UD+fSb+q; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="UD+fSb+q"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7UpvLke4oioUrowQXl7t8t90tDzY44J9nUrhfLcSw3E=; b=UD+fSb+q/jJLuMvhCZJ9lQLlTz
	9fTW9L9aye9GPqOGVlFXFniw014SVhHEZcUxlr0NyrA35vuklDcZYaUuTaAmabhOZZ6qGW3PhrPiy
	m8p4X0vYnIeFXzuNwBOXuATgfDbN7EW0izjuDNOFaKUL7lD2wmIhd2XnJW54bIyzRHKno1fW5LWiP
	KhZPpTkVDoEzOWtGLNexQ7Zzsz50GV2rh7WZSn1Z/oMyfr51+iUy2nd41HKImii24Gpt0Y8sZQcNh
	WX7cykD/tKIwr0EnRMayaahamxb4FATMF01o9kHvvUULWXMiMrbwL9W5t25AL+eSyRAuI+pTztcSb
	NuyC+suQ==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tfzc6-0008Kl-IV; Thu, 06 Feb 2025 12:00:06 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	kernel@collabora.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	FUKAUMI Naoki <naoki@radxa.com>
Subject: Re: (subset) [PATCH v3 0/5] Improve Rockchip VOP2 display modes handling on RK3588 HDMI0
Date: Thu,  6 Feb 2025 11:59:54 +0100
Message-ID: <173883958378.672361.1217084677686580584.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250204-vop2-hdmi0-disp-modes-v3-0-d71c6a196e58@collabora.com>
References: <20250204-vop2-hdmi0-disp-modes-v3-0-d71c6a196e58@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 04 Feb 2025 14:40:03 +0200, Cristian Ciocaltea wrote:
> VOP2 support for RK3588 SoC is currently not capable to handle the full
> range of display modes advertised by the connected screens, e.g. it
> doesn't cope well with non-integer refresh rates like 59.94, 29.97,
> 23.98, etc.
> 
> There are two HDMI PHYs available on RK3588, each providing a PLL that
> can be used by three out of the four VOP2 video ports as an alternative
> and more accurate pixel clock source. They are able to handle display
> modes up to 4K@60Hz, anything above that, e.g. the maximum supported
> 8K@60Hz resolution, is supposed to be handled by the system CRU.
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: display: vop2: Add optional PLL clock properties
      commit: 79982cbac896768c3860c241df2028c3e75f5a6b
[2/5] drm/rockchip: vop2: Drop unnecessary if_pixclk_rate computation
      commit: 9f40d7a94427a503e303b2a2d8db227d615e32c1
[3/5] drm/rockchip: vop2: Improve display modes handling on RK3588 HDMI0
      commit: 2c1268e7aad0819f38e56134bbc2095fd95fde1b

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
