Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E03A23183B;
	Thu, 19 Jun 2025 21:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750367873; cv=none; b=Qdp6nMfx/ylz7S+KjRdYnlJc3K7lvhT5awH4mb/5+nv6iGd84T9VKindMiCZyMG4TMy/ZGQWp9oUMDJoYzkFCGyffhiT+SvJeG18AIZoeAVi3vCyUkRYo+NWG1XN9c+aRVf7a46OPbhRsdehrckI212FKKhKnEBTXal81SqVVhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750367873; c=relaxed/simple;
	bh=Tn2wCj3rODDUhtM6//cBSkpP9My4hcw28BaoF/qXwfo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aHHciO0PB8emeexmVuO5+Ps8fEhqOfgJbI47rPfmyEtMzYxA44NCzCvFTF9tEU0xDDDsCJq5xgFxPD/+s/xn68oMmcRz/nSmRc1iWCftSK3wxGk6MmU3MyECf5dZjd7iRDGN6LAuwRA/QuX+UvhpoNnx7ojRjn3E7BIRYyaOa38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=JwPr/f6i; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="JwPr/f6i"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=/E7FuKxOhj6v2SCRuHODjTXc3/S3zVFKDl5381MANVw=; b=JwPr/f6i5WgF7XoimdPvbXx3mA
	pwSYD3qjsN97w2QYudv4umxVAixHX7+2msbGzRZezOvPKXoFd/b0mjIj5Jeae1ZgclyUkYFPHEn3b
	jp0nryEoqOK8zMEmJoUiBJut1fr9sgGAa9V4Myg6Ah4AjPH4eF8gb2MRMetKC5cy/NsNWIzVpsUrn
	A7R7bUXUq5Cr/g2GLkVhC8lkD6OKleROP6y6ZcWSz78lvUfj6Jtw1cNRJN4gEoNZjb5v+4Vh9mvGf
	7zb3k0efUHqNMzUxIQWMW8iVVfHmnhAZiLi4yiPJco04OTOvXMQ7nt2tI/+2REuPUd1gYwbGoQWrg
	9AzxVmMg==;
Received: from 85-207-219-154.static.bluetone.cz ([85.207.219.154] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uSMdd-0007fA-Si; Thu, 19 Jun 2025 23:17:37 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	detlev.casanova@collabora.com,
	conor+dt@kernel.org,
	dsimic@manjaro.org,
	kever.yang@rock-chips.com,
	krzk+dt@kernel.org,
	robh@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Enable gpu on rk3576-evb1-v10
Date: Thu, 19 Jun 2025 23:17:25 +0200
Message-ID: <175036770855.1520003.6023832068451703480.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250618063609.690332-1-andyshrk@163.com>
References: <20250618063609.690332-1-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 18 Jun 2025 14:36:01 +0800, Andy Yan wrote:
> Enable gpu for rk3576 evb.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: Enable gpu on rk3576-evb1-v10
      commit: 974baaa147022a6230768ad73313154ce0a77c0a

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
