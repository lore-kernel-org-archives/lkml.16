Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B812BFC63;
	Tue, 13 May 2025 18:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747161985; cv=none; b=ay+6AEGrcA+1WPRVXZBP6RwO27RJ/9nH6L1gDGIaVNYNynWI6vDPT/VDPK17KJWFio7JsxsLmYPZp7zkeM6q4Vgs+9AXsXNSC8RSzHBz0dfteXTYYhc8zMgxfJDOJK2vNjlBqA/iI6hSUawMR4YgpjmkpLaTFXSEdKO+0mG+3aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747161985; c=relaxed/simple;
	bh=a86Hk1zUh0lw7WnEYZxXZzrjaEcd8l5cOmuifa9DsA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CmzTExaXcojH0+/EEmkOaGTBqeLE+jsE3AH7vO8qX5t8JRdLz663T8bgetjJ6goC50jwUYnDm/C1nziBXpAr5w2TUueD5lw/LpvTjbl0IYiDV0icg5oIi65wTxGEoLxRsA1h9QpjKv4Re6gpNk9CEVOReOoiK0CykFQj49p3BAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=Su1uE+eM; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="Su1uE+eM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=VClIxoKnQSPlpEtPntyY38ibx0Yg+JD3nBRlgh7tJyk=; b=Su1uE+eMIRzUcEzkFiCqxIcUNe
	Tq1rklhRUQZhydAUMLMuPOzZaAAOWdqC74fkyiU7KbpatoYbG48tWqYrMAJa2JK4IAtYxa6GnLZCH
	jWRq07kWgj210M+oi+daswoBMrG/EYg1YeQZDywDo1338H7g7n3cDj8JDk99cHraRPV9+UnVAmoEN
	/jqZ3/7XoLae5SyGbJtyhEjA4fnnSuJaIZ8P9PP+c0s5o4quaI9BFu04BxD5FdAh98N6FLjA3F7o9
	O2Xgi2/mopp+KW74QAAoiuFoBIKTzkh/LYN1iTvpRTqVjtqkR1goQiwthTJelMXcHvWBEfvtus+vN
	ZN9VDemQ==;
Received: from [61.8.147.169] (helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uEudq-0003up-Jp; Tue, 13 May 2025 20:46:14 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Hao Zhang <hao.zhang@coolkit.cn>
Cc: Heiko Stuebner <heiko@sntech.de>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tim@feathertop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] arm: dts: rockchip: Adapt to IO domain and SDIO for Sonoff iHost
Date: Tue, 13 May 2025 20:46:03 +0200
Message-ID: <174716195450.2345121.11352398890391626406.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250509101419.460473-1-hao.zhang@coolkit.cn>
References: <20250509101419.460473-1-hao.zhang@coolkit.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 09 May 2025 18:14:17 +0800, Hao Zhang wrote:
> Changes since v1:
> - Use full name 'Hao Zhang' instead of login in From and Signed-off-by
> 
> This patch series makes two corrections for the RV1126-based
> Sonoff iHost board:
> 
> - Patch 1 adjusts the SDIO max-frequency to improve WiFi stability.
> - Patch 2 updates the IO domain voltages to match the board schematics.
> 
> [...]

Applied, thanks!

[1/2] ARM: dts: rockchip: Sonoff-iHost: adjust SDIO for stability
      commit: f9c7ba983f7b44fe698d580dec67552123520472
[2/2] ARM: dts: rockchip: Sonoff-iHost: correct IO domain voltages
      commit: c2089976772364a3b910676693bf52497ab35475

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
