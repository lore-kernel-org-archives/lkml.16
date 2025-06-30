Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED6BFC1D;
	Mon, 30 Jun 2025 09:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751276764; cv=none; b=bYyqke4lgay4xPWuLur8OTo2RNE4foi3Z13oJhBEwGIXhgYk4EldEqTshy1OQc3fWRccycPda9GBXC+SKWcTy4IvQhRhX1GRTPiNUHQxw54zqLL9OgAQpbP/76I6q+txAtXSn6rFvzY1Oi4UcQqLqxjyscfb1xU2UBtu+FWqPW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751276764; c=relaxed/simple;
	bh=lb2tpgsxG5/hQZJGyUa6eqq0qMhboF3PKqjWS4Z8kj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l9U1qu2RmJ/Phc60gSBTyPHIpDpNhKjw762xHAEJ1tYgBGXQd2v0D72o7gX6+Q+OmMAI4Uf87uXl0OkzVVFc7vEgYIOOWSoY1aCuWu/pXQvRbc9PUmtOkVM+baIuvDAULiy5SwqoKaYIZKmd7WrfFBwTdxfuu7oKTAMXsltyOV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=cha4O35O; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="cha4O35O"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=4cCF6vjX7ITShKbqsLVLjUwSKKlXqYMqcfegwunYLhM=; b=cha4O35OOJHdKOGKk6ME/vjkG/
	gkFx7rAvs1cXJErSj+lYsZ5N0RxvwHGZ/mCmpq4tIDNmKkf5h/g1i60rYTYovtz4i3vk0NsiZ7zIx
	RDnDNXUHBy9nHXYdBr6/slIZgfiaBBzetZQ52L2X2IG4XWnmCUu8h8IrRSVmUsp5f3TB2MFI9THSl
	z3pvDEUJ5ZjGD/7hyVThTZHfWlN/9rExzTCZpT011eLj8uoDPBvdvZvYeHFPhKgGcQK4gTmATdOie
	uKmiJ88iWT6pho2e/Z3mQ4JAb29yi+PnTtsvj/6gshptThLXbODuz5WnHI5iyBvcPIodu3blcxva8
	lITv+MWQ==;
Received: from i53875bfd.versanet.de ([83.135.91.253] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uWB5K-0006Zc-4K; Mon, 30 Jun 2025 11:45:58 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Fix eMMC HS200 mode on Radxa E20C
Date: Mon, 30 Jun 2025 11:45:44 +0200
Message-ID: <175127673172.138768.2799587757457210088.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250621165832.2226160-1-jonas@kwiboo.se>
References: <20250621165832.2226160-1-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 21 Jun 2025 16:58:30 +0000, Jonas Karlman wrote:
> eMMC HS200 mode (1.8V I/O) is supported by the MMC host controller on
> RK3528 and works with the optional on-board eMMC module on Radxa E20C.
> 
> Be explicit about HS200 support in the device tree for Radxa E20C.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: Fix eMMC HS200 mode on Radxa E20C
      commit: 6e3071f4e03997ca0e4388ca61aa06df2802dcd1

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
