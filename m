Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0448B1F4C82;
	Sat, 26 Apr 2025 21:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745704283; cv=none; b=EQwSeXQksDiIsoJBTaktSuqiPRwUhDWCw/oYRYqOMzHbg1NLYGsPwLRGO2PXN49xhwWnaPzC7Z29BDSP2qmo7BoAwx7t+0pMCi5TGOSkGvjZKsb/CrCqPw+c6onrlDBF73kgUNT41VhK8Wcpz6iU/+ymjMJjln7n2maODWSVS78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745704283; c=relaxed/simple;
	bh=VVsFzUfJrhp26XiECJWkpYAaG1jd6UOMNJlhKO/ELgA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Au9rDBL3BQJ7LUHCGuvT+Om2rY3p4EkAkFHpMSwIQ4ci7Ov0lL4N4I00RJI+ZusmZx3VJmcuU18U6FYQG8uJyF1gsG1VaOZB0fJCatdGPzD6Y5imcC+6zgRVPCzLTWDHNG6qACPCGSJxcmOROq//FpETrGI6+GCU0aN+X1ljqbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=Yr7W5+18; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="Yr7W5+18"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=6XrbiVVXrsE/B+PTaSAIPJh0SzK7NoLZKAMpvhcbTBc=; b=Yr7W5+18DsyQVkNm+GoK+jp4Bw
	VB4kKTWM/Ytiq3fh6mkYdS6S60yWJlfkvY9IBfL6QUv9MORSntqY6zO15I9UYsag169oxv6OYQq+q
	mkB3IjUdo1S6B+LLO9gn/D/jcY4ZpXi5CC8b8Sbw5B04nw1Qgl+3y3qFN87jZfV+YfzUtZb6eKcaz
	GMFle8V3BGictHtod1abh1/NfwvvaKrRv8WVu2y94rUcUHVAWGZ9HIvXJgpAuZJ4q+z2cemDtdn6G
	DHwVIifs3Qfk46IXiM91K5RZ/nb070i0MlAgOz8ZlM6I/Xf6yZc6kIWuPKOVqFdd6Ljqxe6Po2/st
	Ls1fovjA==;
Received: from i53875aba.versanet.de ([83.135.90.186] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u8nLt-0001OR-JL; Sat, 26 Apr 2025 23:46:25 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Markus Reichl <m.reichl@fivetechno.de>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Add vcc supply to spi flash on rk3399-roc-pc.
Date: Sat, 26 Apr 2025 23:46:15 +0200
Message-ID: <174570395442.32969.5908465165720861045.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250411140223.1069-1-m.reichl@fivetechno.de>
References: <20250411140223.1069-1-m.reichl@fivetechno.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 11 Apr 2025 16:02:21 +0200, Markus Reichl wrote:
> Add vcc supply to the spi-nor flash chip on rk3399-roc-pc boards
> according to the board schematics ROC-3399-PC-V10-A-20180804 to avoid
> warnings in dmesg output.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: Add vcc supply to spi flash on rk3399-roc-pc.
      commit: 86d8dfd4a5c5df883b7ce07b7e98b8439f468581

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
