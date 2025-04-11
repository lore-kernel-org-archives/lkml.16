Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BBE29344B
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 12:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744373480; cv=none; b=gcJZyyfc7LntyN+oJfZVT/AuwJH14pY3Na5p2TXZfMdr62m9zVmzT6rV+NQViqm0TnZ8HryRfFDi/cuQoUCxnx9gVIz/KOcgd9iwYWqlLNulGX1s/lG2fv4b+/bJoBoegg8ila32BiB1iIOId55lVuusuTvNrAv1/CEzenIMiM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744373480; c=relaxed/simple;
	bh=12U8A9tqFraTkbX8UucQrHYVXY0lsm8Dl+Z4zRDU7+M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TT/+5UZ+L0vo0YYlMaqh6dW54/kn8OdWd9lGyvu5LrA8fpjA3D0/ts/BKIwtmXFIqoQJDlYZXa1IA99TsY/UCvofpQnnfahBS50ST1hwHl3ul4ixOko4G+yAl/Pk0qiF+crGOu/9eO6x5AW1/voOfcxo2/FabnoFAPdo3/oNYq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K3dSX4tR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K3dSX4tR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12A5DC4CEEC;
	Fri, 11 Apr 2025 12:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744373479;
	bh=12U8A9tqFraTkbX8UucQrHYVXY0lsm8Dl+Z4zRDU7+M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=K3dSX4tRj7rJ9O1JP0isV71y1pRkYOkWhdxA4/IoSEK64MYcwp+4fRUgs4XuosURC
	 FJ+eVvLwRBH/Xmz4HsgLa4bMNianpOCI+1O66a+ekF5/AkNzXrzzt5h1nxS0ASDF54
	 X6pa08EMqcgJvIZJQp0EJZPkQLX8YvbtdvAKHlUQ2ZE2VBdtUCCDew4Bk6M+g5HXbX
	 X9+QYoUY94VJuma7WoS7l7Vv3fOsbLjPmaLHgkE3M71MsTcvmAsm8z6duGH46ePTIh
	 ukJZUFxvECbyl6MxIm/kK0tV1+SKSPH5KhZQRoxIj4Ey+hkEoxQtPq2VkBQD9c3dW6
	 yJUZQmyGxClgw==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Algea Cao <algea.cao@rock-chips.com>, Sandor Yu <Sandor.yu@nxp.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Maxime Ripard <mripard@kernel.org>, kernel@collabora.com, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Dmitry Baryshkov <lumag@kernel.org>
In-Reply-To: <20250318-phy-sam-hdptx-bpc-v6-0-8cb1678e7663@collabora.com>
References: <20250318-phy-sam-hdptx-bpc-v6-0-8cb1678e7663@collabora.com>
Subject: Re: [PATCH v6 00/14] phy: rockchip: samsung-hdptx: Support high
 color depth management
Message-Id: <174437347571.673939.550787962753296084.b4-ty@kernel.org>
Date: Fri, 11 Apr 2025 17:41:15 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Tue, 18 Mar 2025 14:35:34 +0200, Cristian Ciocaltea wrote:
> This series relies on the new HDMI PHY configuration options [1] (patch
> included here for convenience) to provide high color depth management
> for rockchip-samsung-hdptx, and to introduce a proper solution to setup
> the TMDS character rate on this PHY.
> 
> [1] https://lore.kernel.org/lkml/d1cff6c03ec3732d2244022029245ab2d954d997.1734340233.git.Sandor.yu@nxp.com/
> 
> [...]

Applied, thanks!

[01/14] phy: Add HDMI configuration options
        commit: 10ed34d6eaaf86e301a8f2dd190d26dfbc9799bd
[02/14] phy: hdmi: Add color depth configuration
        commit: 3bb9286f4ece6acbc1fbaa9f192a82645d30efbf
[03/14] phy: rockchip: samsung-hdptx: Fix clock ratio setup
        commit: 0422253ac1919fea8292381c85f11a9decff1bb1
[04/14] phy: rockchip: samsung-hdptx: Do no set rk_hdptx_phy->rate in case of errors
        commit: 1f4d382769e3b38dfc498c806811dae856e40f31
[05/14] phy: rockchip: samsung-hdptx: Drop unused struct lcpll_config
        commit: 6218c3fd6702a5bc4ab323fed25714cde127684c
[06/14] phy: rockchip: samsung-hdptx: Drop unused phy_cfg driver data
        commit: bcd61d182618c6a77d0841fcdc3333e125725360
[07/14] phy: rockchip: samsung-hdptx: Drop superfluous cfgs driver data
        commit: bacf2fe750dab6bc7ed50556aaadd3ab107fc643
[08/14] phy: rockchip: samsung-hdptx: Avoid Hz<->hHz unit conversion overhead
        commit: 0edf9d2bb9b4ba7566dfdc7605883e04575129d9
[09/14] phy: rockchip: samsung-hdptx: Setup TMDS char rate via phy_configure_opts_hdmi
        commit: c871a311edf0ebb1b934946a84a6c532cac0c035
[10/14] phy: rockchip: samsung-hdptx: Provide config params validation support
        commit: 2392050a2cb94ff3397949e109e4b9f0285ee085
[11/14] phy: rockchip: samsung-hdptx: Restrict altering TMDS char rate via CCF
        commit: 6efbd0f46dd8ae1d2b91b41d98c2800c60ab1f5e
[12/14] phy: rockchip: samsung-hdptx: Rename ambiguous rk_hdptx_phy->rate
        commit: 37f335dbfd028c008d0a7940ca5a270d1e2f6b81
[13/14] phy: rockchip: samsung-hdptx: Optimize internal rate handling
        commit: 45b14bdcf4acfd483d9890396197c35c23821124
[14/14] phy: rockchip: samsung-hdptx: Add high color depth management
        commit: 9d0ec51d7c227c3ae837e22832eaed219e25f126

Best regards,
-- 
~Vinod


