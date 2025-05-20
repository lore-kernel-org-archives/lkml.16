Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D1627FD50;
	Tue, 20 May 2025 19:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747768205; cv=none; b=W/r0ZaAlLFMZC0wyhDK4t6jgzBcj1xxQuYFLhGYcfFD0aHKl/TNgcO8B3b6hq6AC6l/ttrrzFaCVIXbFpEu2dJ61FXmqNN5urjo0nPk3RdCU3Lj5AsV6DY8MVWpXVdVQhej5JUemACAR0R9smbMLykmw50JmPc7OrAULpTU82Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747768205; c=relaxed/simple;
	bh=RTm7jvWy/rOua1Hcgpx+SliyD9mCWZJza09j6uFggZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lP/R3bO0JcyuLNiRJMW8eV/edRvQ3WCO7EB82cK9zt9uTBWXTIQw5n4+j5fQV7aW31YnPq7xdKkt4r1T2yh5jM8NQjMlfTcLwixBDTxtD9hk9R65UowmyhJcgZKC/1FYNASdi5MOegNxyeEjaAVm8sHw+XxsQ/vIcjg0NxN4XKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=JljiE9ta; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="JljiE9ta"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=qfK/WZUC6HpnE6+y8HvFf0XgBFRz9UTmeovFUb5mvxQ=; b=JljiE9taUQFAHFrx20s04ywxMn
	JN4ULIvssSanFQ5v+g5v3IWMrCq2MUbmXL/RO2VXB6qFNm0nCwD+Wd3tNZtaSrOrCDi4g+ly2M6tD
	0RWDhYWuTtsYacsEuLiwM19Fe1+UHLjWWoxpAoB+fba6fOjIEeH7qpI5RhqEMUin3Pzlg5xxVo7sM
	PXZMSObBkLrbeFA6v002mnypql6p9WDHUF6mfzHB2v5Ys/udKfV6Xu3nmTzRuJvlJHO+O11D9H43Z
	uExJxldkWwih4HLGevcRJPrYkosJcH2NpuTaz873kex0qrx0MACiosm1V3SiN4iMY3u3pAn3L5TdN
	HKmT7DUA==;
Received: from [61.8.146.112] (helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uHSLd-0004fK-De; Tue, 20 May 2025 21:09:57 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ziyao@disroot.org,
	kever.yang@rock-chips.com,
	nicolas.frattaroli@collabora.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] Fix some warnings about PCIe and pinctrl on RK3528/RK3562/RK3576
Date: Tue, 20 May 2025 21:09:45 +0200
Message-ID: <174776817932.2879626.9195213851952486465.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250518220449.2722673-1-heiko@sntech.de>
References: <20250518220449.2722673-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 19 May 2025 00:04:42 +0200, Heiko Stuebner wrote:
> Inspired by the issue reported by the kernel-test-robot in
>   http://lore.kernel.org/r/202505150745.PQT9TLYX-lkp@intel.com
> 
> fix it and similar issues in all of rk3528, rk3562 and rk3576.
> 
> 
> Heiko Stuebner (6):
>   arm64: dts: rockchip: fix rk3576 pcie unit addresses
>   arm64: dts: rockchip: move rk3576 pinctrl node outside the soc node
>   arm64: dts: rockchip: remove a double-empty line from rk3576 core dtsi
>   arm64: dts: rockchip: move rk3528 pinctrl node outside the soc node
>   arm64: dts: rockchip: fix rk3562 pcie unit addresses
>   arm64: dts: rockchip: move rk3562 pinctrl node outside the soc node
> 
> [...]

Applied, thanks!

[1/6] arm64: dts: rockchip: fix rk3576 pcie unit addresses
      commit: 4d2587e0e1ce7145a38802fa281f4f1f411ec56f
[2/6] arm64: dts: rockchip: move rk3576 pinctrl node outside the soc node
      commit: 8ff721f60257d550daf524fc559c0f0d2176b198
[3/6] arm64: dts: rockchip: remove a double-empty line from rk3576 core dtsi
      commit: f8b11d8cfbfc8a0232c1e7cc6af10583c8bdb3f1
[4/6] arm64: dts: rockchip: move rk3528 pinctrl node outside the soc node
      commit: 7d086f78fe09fb94eb3b2e12436f2feed21d9c1e
[5/6] arm64: dts: rockchip: fix rk3562 pcie unit addresses
      commit: 25d3e1d2558caf823902e3b1b83901f5ac65af8d
[6/6] arm64: dts: rockchip: move rk3562 pinctrl node outside the soc node
      commit: dfab90b9580c2fbc4e8bb4ceee97cdd75832a6e7

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
