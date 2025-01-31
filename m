Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07C71A8419
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 09:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738314505; cv=none; b=n7+FPMl15K6YTCYlALIiEgGqsDfDUtZv6ZpnjxRgQJg3jvur6aXbhQzPXUdpfPLTtQWsSBuqKAKhqeGSyGKv2eGdzysMzFV48NSAFOxmpwjDeWstxZMH1TlGy8dqfkH7nV6xfFn/bqRydOGw0WkzewAOuht1gOElK3AdRWDRfzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738314505; c=relaxed/simple;
	bh=KPVdPMhIVgpNc7Gf2AkypDd57zx3GYx+s8m1RtCNULk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kMwbACfiSVg/88eYfudDUjFMgyJCFlJJ8LhFSM6Dpzt3l2z3zL3HWyLJgS4kTADCFtK8+B6AlpNXApQt+74XpvF5DYJ2Y7YPXFnB45au9mtRLghQDPkUZfvyyeHAoQ1d001RnC21dFe6w6pIqaB1VNYPh4p8cqy2Xt2Ctqz0j1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=fpKcdvnb; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="fpKcdvnb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qBM19W687ds68sEqtJ4vSFA6vs5r5fWKLK9XgZ4ixE0=; b=fpKcdvnbProJpRtOff/uta2zO1
	Xp+MVSiJ8TO4LfWykrj2Q+X02a+jr4pdNSgjS5XIu5LAtaubaR8GJll/OHqwF/qaAfLe5rf2MNWDp
	F39cFgmoNVf8euCYGeiVzgjS3fGTT+Rh1JB1msyjEBkCfsIVnksuUerd3ze4Cj1eVG3QXeSijF8f1
	nHwOl+5U5VLi7pFyh5w/7SpELWmgP41aoTsYFGQYYZldlTt0AUTbikzijwHvzIlLsIMCzJHyVt4AO
	qML0o24k88Zso+sZNxx9meAvLEnBLp4BXhEnxF9/OeckaEzWTZTIUrpe5j+63VN27C5M1n0cdrJiv
	/We0Uj+g==;
Received: from [212.111.254.164] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tdn0W-0006Bw-LK; Fri, 31 Jan 2025 10:08:12 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Zhang Yubing <yubing.zhang@rock-chips.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: rockchip: fix Kconfig dependency more
Date: Fri, 31 Jan 2025 10:08:10 +0100
Message-ID: <5999606.DvuYhMxLoT@phil>
In-Reply-To: <20250122065249.1390081-1-arnd@kernel.org>
References: <20250122065249.1390081-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Am Mittwoch, 22. Januar 2025, 07:52:44 MEZ schrieb Arnd Bergmann:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> A previous patch ensured that USB Type C connector support is enabled,
> but it is still possible to build the phy driver without enabling
> CONFIG_USB (host support) or CONFIG_USB_GADGET (device support), and
> in that case the common helper functions are unavailable:
> 
> aarch64-linux-ld: drivers/phy/rockchip/phy-rockchip-usbdp.o: in function `rk_udphy_probe':
> phy-rockchip-usbdp.c:(.text+0xe74): undefined reference to `usb_get_maximum_speed'
> 
> Select CONFIG_USB_COMMON directly here, like we do in some other phy
> drivers, to make sure this is available even when actual USB support
> is disabled or in a loadable module that cannot be reached from a
> built-in phy driver.
> 
> Fixes: 9c79b779643e ("phy: rockchip: fix CONFIG_TYPEC dependency")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

@Vinod, I guess this should go into 6.14-rc?

Thanks
Heiko

> ---
>  drivers/phy/rockchip/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/phy/rockchip/Kconfig b/drivers/phy/rockchip/Kconfig
> index 2f7a05f21dc5..dcb8e1628632 100644
> --- a/drivers/phy/rockchip/Kconfig
> +++ b/drivers/phy/rockchip/Kconfig
> @@ -125,6 +125,7 @@ config PHY_ROCKCHIP_USBDP
>  	depends on ARCH_ROCKCHIP && OF
>  	depends on TYPEC
>  	select GENERIC_PHY
> +	select USB_COMMON
>  	help
>  	  Enable this to support the Rockchip USB3.0/DP combo PHY with
>  	  Samsung IP block. This is required for USB3 support on RK3588.
> 




