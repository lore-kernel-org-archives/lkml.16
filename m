Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7867270EC5
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 11:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747222308; cv=none; b=BhuBSu2a112Cwj7RF9Q71ze5E2tiIzLrzcA27qg/1sZoVFGuv592gTsDqjuvI9za1p9MJNtt97oD0lZfEsKoBA8yDJXL0TRnza9SahrpOWx4ezUj6Ui3YwuZ3/sBPQmY4xAJdyoXtT6KLqSslQWa9fOFh1N4WNOao2tmgmv+/+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747222308; c=relaxed/simple;
	bh=6Y5lH/WN0GXq+set7ttl4tqIU0/kQ62gjvDykjHOqzE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QuCJxVJ1nRje3LLMye4A1eZHVXPhTpA4fcrDGPPm06iS6AuWKz7IwLc66BgKqxyA09HI05S40C4PwijalH5doHesLRFiK+KSJ3e3qvAiNGAblo5Fk0MwMihQuzYTVZSQIqTGMADh88oByMuk/UqVMywOr0FKQp+rMyi3hlY0kc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sLcy25pS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sLcy25pS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C81CC4CEE9;
	Wed, 14 May 2025 11:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747222308;
	bh=6Y5lH/WN0GXq+set7ttl4tqIU0/kQ62gjvDykjHOqzE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=sLcy25pS7iL/rQ9QW6thOkXNhocSovucg+Eoa69c+SKgcsR7i/6khpAhCx3CmHHET
	 RMgf6+yVpOtHzY/LIXjq0JVkQ80rVW4vdF7bXKvulUh1sPz6I+H7lCHfA6gnP5v6j0
	 bMJTk79HQaa3x2/L8jBZX63VPTvbnh2z67tP+9XPuaTZ/x/m2yrwoUBneGuxNAELxH
	 cOCabt81A3kS13yfg72CA28bKh1nng0dGBdQtXSy+945S5rXZqNEnuzEzDIK+1MZ/Q
	 dMvbH49Kp36wfIQ4anz0Xpbx3zjTdif8qQrMs6V1TH4aa/jZXUP4aB5Bupkllp44eS
	 OYSott8KMl/0A==
From: Vinod Koul <vkoul@kernel.org>
To: kishon@kernel.org, heiko@sntech.de, cristian.ciocaltea@collabora.com, 
 andy.yan@rock-chips.com, Algea Cao <algea.cao@rock-chips.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250427095124.3354439-1-algea.cao@rock-chips.com>
References: <20250427095124.3354439-1-algea.cao@rock-chips.com>
Subject: Re: [PATCH v2] phy: phy-rockchip-samsung-hdptx: Fix PHY PLL output
 50.25MHz error
Message-Id: <174722230604.74407.7449753819890518835.b4-ty@kernel.org>
Date: Wed, 14 May 2025 12:31:46 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sun, 27 Apr 2025 17:51:24 +0800, Algea Cao wrote:
> When using HDMI PLL frequency division coefficient at 50.25MHz
> that is calculated by rk_hdptx_phy_clk_pll_calc(), it fails to
> get PHY LANE lock. Although the calculated values are within the
> allowable range of PHY PLL configuration.
> 
> In order to fix the PHY LANE lock error and provide the expected
> 50.25MHz output, manually compute the required PHY PLL frequency
> division coefficient and add it to ropll_tmds_cfg configuration
> table.
> 
> [...]

Applied, thanks!

[1/1] phy: phy-rockchip-samsung-hdptx: Fix PHY PLL output 50.25MHz error
      commit: f9475055b11c0c70979bd1667a76b2ebae638eb7

Best regards,
-- 
~Vinod


