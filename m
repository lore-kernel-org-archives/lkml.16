Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7BF020B81E
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 08:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744274529; cv=none; b=NmSonAsJk6lnYNWMwhZ2zGEX5nZomec2vAa06NqhIn0+JJ04L02hO1TSAueSqeKNRGBgLJ/mnmziXJHPXPW/WXpmALNBVjRiPwrSNlly+QbpmJQF+Cmrc2oJI/9+T8w9DYekirX4AsgUM0XHJgbGbd1fLn+VtVMMIn6xQVSnpAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744274529; c=relaxed/simple;
	bh=oXn25/Y83Qjn1QMOpF0i9E+MTtHxjYbD1q85ek2sFGw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KZyiAU/ovijBiT3jhPCaRPwZv0hZ1yt3LYPfCQseTgiD/g/zceauwkxQ0qkRiDjT89iIxZwPmpADy2r0o6TrcL6HVTEdz4kAdk+R+G0vLAX1rlGzGQoMPaSLTTrMAjNOaPd3ORZZMdV6CdfGWnRO4hcqoscPfVjnW3SEhn/Eoik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=wVDaAKIY; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="wVDaAKIY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=PHgurkr3hfzIhUm3LgtYoYaBD5Ipt+sR4+jQYwAKKxg=; b=wVDaAKIYQLbajvye4IbWs10b1p
	/C3Ez7SoN9FvjdXQ3wyMQwdQqvl0I+sukLGw675cakYQUpv/KWIAegmQSiYrbA7n1dDK1vh+RGRA6
	Qlle8/0O/SEhx3WO/v3DwVV7wg7ggwzQs99YUxN1drFtvJYjvH2fxsCExdvsImiLQE5eou/BZf4iS
	r56xWG/gi+UUDOAjoY15WK7Bf5J3YW0axV2hC37g/sspKK26lOb0uDsloxTrpTfmhMcoJw98pNOss
	s5Hc58KIstJg42996lQmlnveFW5Gil2s7Clz6ZOJnnt2jytJDT/fKI9d/e22E990+6GUZPbXEUzoy
	aVgjWJ7Q==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u2nTu-0002qP-Ux; Thu, 10 Apr 2025 10:41:55 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	hjc@rock-chips.com,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	derek.foreman@collabora.com,
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH] drm/rockchip: vop2: Make overlay layer select register configuration take effect by vsync
Date: Thu, 10 Apr 2025 10:41:42 +0200
Message-ID: <174427445692.820310.6392572128244429943.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250318062024.4555-1-andyshrk@163.com>
References: <20250318062024.4555-1-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 18 Mar 2025 14:20:17 +0800, Andy Yan wrote:
> Because the layer/window enable/disable is take effect by vsync, if the
> overlay configuration of these layers does not follow vsync and
> takes effect immediately instead, when multiple layers are dynamically
> enable/disable, inconsistent display contents may be seen on the screen.
> 
> 

Applied, thanks!

[1/1] drm/rockchip: vop2: Make overlay layer select register configuration take effect by vsync
      commit: c5996e4ab109c8bb5541453b20647eaaf9350f41

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
