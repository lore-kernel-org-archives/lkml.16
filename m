Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5817820C001
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 08:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744274541; cv=none; b=Er6byYSSCfwLIcjG2kStgWRZgh4jSwDpfrQ6uVs5Tgt5w+WZTHgnUl+zLn4AVDbSyBYAA8uov5LsZ0uKofSo+7QysRU4YHubOT1MVipDNqzb885TigOGZkfAvdByIJUFHIGDie3e+LGYDC4bNpwc8VMdGRPvQ9c+bfgjL+5nYTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744274541; c=relaxed/simple;
	bh=AaJjAlAKcDF3tjoRqZMBgaYfkY2JnPMP40VzG3mujEA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=myLmipGMCvgQ5VCOi68ZyLaMzi9QAojsRRW+Jx1w6VAwkmb7ZTHqOy/Y1otc1lE7YofGSucdPKnmR0qFEZXxCbywo2qphXTDS6n1mMbeMoiikAuolIYb0ZLhQhcaoVYUaWWwQBWQqi8Cl4bXu2F8T8lINvdyG5X1fHJeUaaH6NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=uVQOKEw4; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="uVQOKEw4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=/lGNGBbyMCD75p6dCKO3apkP06sLNCHOySPvGUmT+7M=; b=uVQOKEw4d8WibbYYpCax6pBQvj
	rwa4ehZAeOcGxnNXZKddKIeD+I5ZOJbNAn2a6pd+TL+sbgMsDujSjG8lLLDstT7Jp12Z6SMWbSp3M
	LJiLaSzvVHegTRfdDpgV9KR2UbafL+oPuGOdZY7buhPfXPPAw6kng0J+CtFDEYQFAWB8GwTHPu+UU
	24TDQSw4k1X10YgTrxq/QGK0WAbKan+95jpiJhV+Z1v3obJk1otKgPObPW6JnMSlw/c2DwnanYUUh
	ThT1+2/BXfpbvv7lNOJ8BbVyeiN8+TAPxxck867kIr1g9w+Mw6xZQOFY6kSppDYOxsM8VxjCbS59I
	FJ5kVPgw==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u2nTv-0002qP-VF; Thu, 10 Apr 2025 10:41:56 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Konstantin Shabanov <mail@etehtsea.me>
Cc: Heiko Stuebner <heiko@sntech.de>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] (drm/rockchip): Consistently use rk3399 registers consts
Date: Thu, 10 Apr 2025 10:41:44 +0200
Message-ID: <174427445691.820310.17501284948552457054.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250403064740.4016-1-mail@etehtsea.me>
References: <20250403064740.4016-1-mail@etehtsea.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 03 Apr 2025 06:47:39 +0000, Konstantin Shabanov wrote:
> As rk3399 has its own registers definitions, update related structs to
> use them.
> There are no changes in behaviour as updated constants values are the
>  for rk3288/rk3368/rk3399 chips.
> 
> 

Applied, thanks!

[1/1] (drm/rockchip): Consistently use rk3399 registers consts
      commit: d74cc229cfbbc5a96139825c297f34accd670bce

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
