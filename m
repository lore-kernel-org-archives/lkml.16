Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC3B139E;
	Sat, 26 Apr 2025 21:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745703989; cv=none; b=FzoQgcHJyAO/Kf5A5inOcM5ZM1lO1xzJgUhc4/BBV4uMlSop1CZCj3dUJHLVxutQC6cOJnnZ+uZp1DQ2B6zmXZVPpXSuhRbd5k9uMfIQYwvBc3lAsHwMl7cDAgsQ4jq3hV6v5TXUOtJsGYtrzsx6AaNGVd0SZQVJQ1wSHP/p3FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745703989; c=relaxed/simple;
	bh=damSU/DMJDYd4rrKRAWQuW1uPwaU5hiKUotDw3rURC4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X7iiEAZcJROybYGzkPBsV9vXGX58nrtUluW39N4bN8OJMkIAbHHPV9O8VyCcQyQrARL06FwK7k4Z8GAhTQ4pKzmC6eOCK3ERUzGZWxLuKWdYtIF9UvlytGeGr7quwA5avwh0zDwmceGFHqfDRZimGV+DDuiuGwoEFbYNbLDp24M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=ROfm/sQD; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="ROfm/sQD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=FyVq9gE+8a0STJLL9I8+U45gbX2e/0ltR2qoqQaj8Ak=; b=ROfm/sQD00zi9MxnailTqqRhTM
	QJHzYwMO09uaRoOoAnqWsZlO4FCZCES3PGcRK3BTYgTJhtDK3JrN86sXmgkbEr/virYfaQK8kyXbh
	gnWvTqCZOZcgWYeqj+QP7sUT7jTGjFYk44cN8XYaLhodwwXqp2bFifSXTEi21ezb3qJvJNQR+fGlE
	rvDI+Hr1UGWC6PIF1thAPdgD5wG3AibqpFsSNNOOJ2N6tLvKNIrAv8fKA+LvNFIqW0SY7ZQ42IlOq
	oAGcShv/hqpV2IeU5FGjF6OI5l7Qv1iQ6cE5e9hC1JR9iO1pLFvUAXHWJfKAh6a5MQQm2NPThXeT/
	EOAkWhlg==;
Received: from i53875aba.versanet.de ([83.135.90.186] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u8nLr-0001OR-7D; Sat, 26 Apr 2025 23:46:23 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacobe Zang <jacobe.zang@wesion.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	nick@khadas.com,
	Muhammed Efe Cetin <efectn@protonmail.com>
Subject: Re: [PATCH 0/3] arm64: dts: Add board support for Khadas Edge2
Date: Sat, 26 Apr 2025 23:46:10 +0200
Message-ID: <174570370110.31943.7845871822930134911.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250424-edge-v1-0-314aad01d9ab@wesion.com>
References: <20250424-edge-v1-0-314aad01d9ab@wesion.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 24 Apr 2025 18:14:39 +0800, Jacobe Zang wrote:
> These patches add board support as following:
> 
> - HDMI audio and display out
> - BCM43438 bluetooth
> 
> 

Applied, thanks!

[1/3] arm64: dts: rockchip: Add bluetooth support to Khadas Edge2
      commit: fef7d8834c5646f029f95ff0f3c3e11d449465b6
[2/3] arm64: dts: rockchip: Add HDMI & VOP2 to Khadas Edge2
      commit: 1307bb6e1a4c0b1144a77f77aff728219cf10bb5
[3/3] arm64: dts: rockchip: enable HDMI out audio on Khadas Edge2
      commit: 6bf923a7d0138e8e7d8165f6642c8121fb115571

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
