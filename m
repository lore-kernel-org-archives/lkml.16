Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB7A30E85D;
	Thu, 19 Jun 2025 21:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750369860; cv=none; b=Fg7DQgWJ4E4mOJjzu7IImKhv0foOpy1KCQz1+X8+1sHN860HdbFdw0JcAqldKK0nyItqpDf0T7obasEGBUejNHskWCgIqgg0S65RS3KmjfNpRF8M7iVdvkPBLrwttiQNkAtoPgusEyr/Is7ckJs1f/XFwxIG5mEX6jfMhSPF+sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750369860; c=relaxed/simple;
	bh=A45MqkvigqGY87gNAFmP5A7QGENiNwBzRwE2i+XEg8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jGkKMegIrJnlR8ZoGp+X0Po4fXv6foV4SXbXt4vZvoSKglzBINCHRvjwElAG2MAdC2qsaqvSEfhZS8sYcqksFntw1rME1tNlCkQVvy5GHZ+iKhjzQizuDFXOiHaroz6thPX2x/zYlH7H57wz8aLAajDOf2wZ3J+l1d9fF6g3KyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=vwlc3ekO; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="vwlc3ekO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=p78c4pFSZsl/cYAu+NblAgf0zSrytRvAYqFqDj5uriw=; b=vwlc3ekOINkhRghcoe6/+IXwj0
	anuJlyiboOwB4gTx5wFPmQIh8ZLldn4lTsXVOBzd9ctUvyL0EPK4ifg67GlWNWgW05W+5RhlM2fjD
	VdjGBB4R4bPL5fcVtSa45yjp3RX6Zp1KkBZYrEiDpSXx/6e7R5Ub8tDO/bfMw/kl3ofWpV0D+xXMb
	/mpotHo70MsV7BAIEd4WEDOVsjyCE29O9/Lwf9NZr79067oLYRGW0m74nVIOpQjxizzekTiUmgops
	P4ol8wnMkj7mWZEYoyOj/zlvqFb+GcqtwvtroC21Nga67uaJjg46x6jZLl+uqgzL9UQSNia5BFmG7
	LQEBK9Yg==;
Received: from 85-207-219-154.static.bluetone.cz ([85.207.219.154] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uSN9k-00086P-8T; Thu, 19 Jun 2025 23:50:48 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kever Yang <kever.yang@rock-chips.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Alexey Charkov <alchark@gmail.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	kernel@collabora.com,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v5 0/2] RK3576 USB Enablement
Date: Thu, 19 Jun 2025 23:50:38 +0200
Message-ID: <175036980219.1524492.2279804764361633284.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250619-rk3576-sige5-usb-v5-0-9069a7e750e1@collabora.com>
References: <20250619-rk3576-sige5-usb-v5-0-9069a7e750e1@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 19 Jun 2025 20:36:35 +0200, Nicolas Frattaroli wrote:
> This series is the result of what I thought would be a quick 10 minute
> job, but turned out to be more like 3 days of pain, suffering, and
> confusion. This should be expected with USB Type C though.
> 
> The first patch in the series extends the inno usb2 PHY driver to fiddle
> with some GRF flags in that driver when the PHY is connected to a USB
> Type C port. Without this change, devices on USB-C simply don't
> enumerate at all, as the state machine gets stuck waiting for vbus to go
> low or something along those lines.
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: rockchip: enable USB on Sige5
      commit: 64df8e2e207a2152201ef3515baacd8816c13282

Adapted to the other Sige5 series I just applied.
Please double-check.


Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
