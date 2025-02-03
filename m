Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51795207DE4;
	Mon,  3 Feb 2025 08:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738570582; cv=none; b=hG+pjFqbfMBM9opMFb7p9b/kVDobS42hxfJMv7UpIRGdLFJs6CiLxayn343I7P5peY4jrd2w5EdPfKh3wUZmWRjzI0butBmNjrUVM6wZsKI0CCxeaLANoe88U2WTpuJHf6hEQnZf7hD7x1WahO/5KLt/rcfO076n2G4hvRh6GJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738570582; c=relaxed/simple;
	bh=BsauXE9nKeWRfzmzDj0Frx1cH/ntoi+uf87BQGOlPk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gp0puYOcJdVc62lFdgTBJvA1/Q6763CzLEhtL0/V/BY5YEabaYW4MBmxpia/EMgLHO2oXGV3PWfehiEihpXROKOZrZJc6DN/lK2nQBRoIUIgt9Vncd765u4avz2uC9/OpBvUeDRqjaST2U7ZXPU+iwkS6BU9XSeq373FqCNQq/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=nVLjUxqB; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="nVLjUxqB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=reaWstUDNn0gyEm8JVdVpAA3G71FH+2FgWs8P9PO6rU=; b=nVLjUxqBX4etEg5dNV5JFfCarZ
	IXEYAiNM4brMmYnTMeE2CZpsnz/eodjPJxcZFzkqt7/E6HkQhpTDPhI4+eiyKEZaw0Uaydm6qercL
	ja3HZJgnzM94qVzbIHd3rWwykeSprH5AjgepTQBo/SoEmDRdtuF9hS8Lodjs43m/jbXrkK3+thWmT
	eOBukXrqEkj0arHWS+DMj2RZfxUdZZ2t3BxqM+Twp3T+yA82Y96yB+PBcMhDGfFS7beHBDGPHLZ2v
	3YBXYJnOaIgqkWydKz1S6QWF+GeIXA/AQCja8a7wRZWMatStWxxKlWpgsyyk5QVqTErKYRuA77LxU
	xplVYf0w==;
Received: from i53875b5c.versanet.de ([83.135.91.92] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tercj-0005Vr-E8; Mon, 03 Feb 2025 09:16:05 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	krzk+dt@kernel.org,
	dsimic@manjaro.org,
	robh@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: rockchip: Fix lcdpwr_en pin for Cool Pi GenBook
Date: Mon,  3 Feb 2025 09:15:53 +0100
Message-ID: <173857053622.78657.7882688074333021130.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250113104825.2390427-1-andyshrk@163.com>
References: <20250113104825.2390427-1-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 13 Jan 2025 18:47:34 +0800, Andy Yan wrote:
> According to the schematic, the lcdpwr_en pin is GPIO0_C4,
> not GPIO1_C4.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: Fix lcdpwr_en pin for Cool Pi GenBook
      commit: 52f5d7de3dc5ea9350170949d0ec19a9f0676e35

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
