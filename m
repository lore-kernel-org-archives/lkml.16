Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42158227B97;
	Thu,  6 Feb 2025 11:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738840008; cv=none; b=Ov/AQ3RRUNZ6WUYld6xs4DeoawhgUnJlD9u6JbnU6RxauDYIGOwZf7JNcTAwUUjrvoCTn0gETtGIhOOuoeB4GbHdyQ0KxxM5SoAqI1ZKhy8JkiIFIJ7DEbGlmEwTcdCTE0gOc4VuiihZGDgoriCnlMxqltkm4FI1QvdISbRXbMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738840008; c=relaxed/simple;
	bh=3bB3+WZzZSAwwvgutDedhIXWLro4WEeJFdxBIyKZyQA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PlCGQp3fEFK7Yp5Tosdxsyk584O3MpAEqyhxC8HCGwBnt4vkmFBpp8wFSbnufnoExKG59iImg2jubNq+iL1mGE1wQ8r7+IBhldwfcSW4Ug+U9SMYginYAwkEKGkKdktucLxFINuXa7FpWcW/UG07APKTXhsZDX7YaAFQSIO+dq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=2XgVpoDc; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="2XgVpoDc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PTzceVVLGcE4E9r04+uL5fw9YsIKV1pPWUyw+5BW8vM=; b=2XgVpoDcIYvuoLxlEnwsV1w+br
	JtE+n+kZ8EsG+Kqbad1GYZoZCmDxePBZ99wFJ7CRDYsvkBqCMLk+ZsU27IeiE63MfLTWbkM8K7hna
	+sSopEOzPHQsuh01RKeZwpPhvCcsNLKkOGTLy+RC3jSH4hUvj9EsNXHFTQR8jChES+EqQcCsRD7hW
	10mUxM3eG/SZcFqbpuctsAstUMC4WlT/ZLOwfYRP7KRN27JbqIb1fSnEc/s3MR23lcgoxT/fbftdf
	XZhkKH4tYpOqnYyRl0osJ2eNCcLKSyYFNjNBHHzh/Kx6CEIcI8sRmfdbpx1GLaH8DqJKEIjw4jMSV
	IGgrSyuA==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tfziG-0008NO-DT; Thu, 06 Feb 2025 12:06:28 +0100
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
Date: Thu,  6 Feb 2025 12:06:17 +0100
Message-ID: <173883997042.679546.13069476307207799965.b4-ty@sntech.de>
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

[4/5] arm64: dts: rockchip: Enable HDMI0 PHY clk provider on RK3588
      commit: d0f17738778c12be629ba77ff00c43c3e9eb8428
[5/5] arm64: dts: rockchip: Add HDMI0 PHY PLL clock source to VOP2 on RK3588
      commit: eb4262203d7d85eb7b6f2696816db272e41f5464

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
