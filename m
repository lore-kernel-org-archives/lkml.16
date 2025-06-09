Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273901FC7E7
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 11:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749467474; cv=none; b=cqXiPCdTSEhqh5QOPulLfHFi9oQkE+XVlnAIn2k9e8M5bdVt64+MWfSlLieHaJ2dn2EnXZmkvBXQ/sqdAOgkms51DhU3m96OCwddAAztoaQ29GJpoUwzs/wqRneOzSEZ80yugOrTui3A/R2p0YivYzn9tDqz2A9oleyfR8RcQZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749467474; c=relaxed/simple;
	bh=h/Fek+Jt9+onEH5ybbgN0/MvP1anuVt+6vxPd5hAs8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Lcvl5xsgc1Vblr4OOrsEyRjH32YdnaI9EVdsMuFl0t0Iwe90Fy94FkRDcW1sk0S5p5ZlwP5KmPwALXMYfREb6lavAQxW+Ypyw34rDzq5cwnYG91ZKinXOageRUrEv5y0KfWA0CUWn2wfuQCl/JNsm9WRdiDnAEKTccLW+WyEDAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=vWlm0hfF; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="vWlm0hfF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Uaq+qcvYWlUE8XUYIRED91MXduBw3WkGvbeOZQWHwe8=; b=vWlm0hfFQvAZ4ds/uEeDbjWaat
	XR5U49qIIRZite3bg3zaaf0uCZZoFqFcwYAMTBM9+Oz0PsW382lkpfkC8EAiP21l++yLJEm/dtrRx
	nVePX3Why4KYJjymVanLD0iZL2r2qd3E4kIq550f0GknFw/5CsR0i3K9I8q4AhpljwyPHLR9ClxIR
	tzCCztkq0Yoanoqz3P/y/gRk3aj9Yn/nFv1WBEZ8mi4N7DxRMddGT0/frR+LZqWFOUMwt/v1ENOie
	GQ6EUmb91u9o78EWJSQlvbVqJV0u6ULGpKGuVxQk11NzN7fOPpZ+upbyUV7K3E2nUTVxxNC8WksLo
	9SXMvMdg==;
Received: from i53875b1c.versanet.de ([83.135.91.28] helo=phil.fritz.box)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uOaPC-0006VT-VV; Mon, 09 Jun 2025 13:11:07 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: kever.yang@rock-chips.com,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: convert rk3562 to their dt-binding constants
Date: Mon,  9 Jun 2025 13:11:02 +0200
Message-ID: <174946744892.771907.16719729052078630169.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250510161531.2086706-1-heiko@sntech.de>
References: <20250510161531.2086706-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 10 May 2025 18:15:31 +0200, Heiko Stuebner wrote:
> Now that the binding head has been merged, convert the power-domain ids
> back to these constants for easier handling.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: convert rk3562 to their dt-binding constants
      commit: 208e7e76fbc77775b760edeeb528318992c60595

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
