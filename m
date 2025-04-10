Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C299B2980A4;
	Thu, 10 Apr 2025 19:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744314109; cv=pass; b=F532ogrLKjLGuP2L5U3s31SaSelGHLaBjZ920nJG7sylrHZgo93viTz0Omd8scy/lKXRZhWEVbft+reEvN+zdpv151Ss9VtazZC0cqBvHj8Qyx0TRxBQmZzyniLCvp9uXiZJcf8/OQYHA3pLlcKU4TrcmGQ3vGE0OiE+Ce0o9Vo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744314109; c=relaxed/simple;
	bh=R1OEWQc82aEj2dgJQcUToroohClIvwQ79QPZXLUQSmE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kWnh4eHit+k1k2uY6bEuEqW6xodQBrwEcCq1SCHwHRMoM47rZ6gpmJkp24vcCZyQSi6Sij79yyJsQxgdkiOfpniLigdhwGXwNxPtvoLF/KPjgR6QU/DZBc4Sq4hQWGcAYsd4Jfxw2JljCIZxvshMN6ITOHJ4Ocjxqavg9njX8vs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=LA+ztzZM; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="LA+ztzZM"
ARC-Seal: i=1; a=rsa-sha256; t=1744314077; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PW2V7ubmD7SApc50+9soD97n+s4rw7uBDPMUGkRbOJXYJWTYGMHnYTJU0Gh7mNBXmFgDiYv4ibtxwmNb/ArkUMX2gaAwvusdgbqkt2Jg5BNcZfVeeZIYrKn7G+JZKni1z2B7IWgf1vPwme0DUGPHPCEbn2gSetbBZgIindSk3W8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744314077; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=QlmLIVs2PX6RAiZw67r46XTY/ZM209p1JSqO1Nx5peI=; 
	b=kJx+HM+qKrQ+bNpJgtFaUqyXo9mA8UXVNqJARKNq+u8vQ6j+ejKbCK+enQhsUpT93kAkMeDHL2HCL9VfURw8c3NP/WrYJEMv43gW9NGiMqEHqjOzdCvbgjIs5IInSi88MxEButKUSqDdOoo8N31+zy4btPXBGwYs/n5K7OzTj/k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744314077;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=QlmLIVs2PX6RAiZw67r46XTY/ZM209p1JSqO1Nx5peI=;
	b=LA+ztzZMgld9jbNmCSIXnqi0yrLibQqbP+2dN3SRQDAX3HS5SYa40ArY+g0aRKIM
	5rNeIopHwzmtba6h9mTmVwq4cjm8mkHJsIpUia+I/ckZ/+qP5FJQ/DmqGvxFlrF+hQe
	rbzwCGSkRrDRpTWyNDD+A1ls4WmxcoO5CWCP0DWw=
Received: by mx.zohomail.com with SMTPS id 1744314075380251.2791003000325;
	Thu, 10 Apr 2025 12:41:15 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 10 Apr 2025 21:40:03 +0200
Subject: [PATCH v2 11/11] arm64: defconfig: Enable Rockchip SAI
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-rk3576-sai-v2-11-c64608346be3@collabora.com>
References: <20250410-rk3576-sai-v2-0-c64608346be3@collabora.com>
In-Reply-To: <20250410-rk3576-sai-v2-0-c64608346be3@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Sugar Zhang <sugar.zhang@rock-chips.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, kernel@collabora.com, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2

The RK3576 uses Rockchip SAI for audio output.

Enable it in the defconfig.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5bb8f09422a22116781169611482179b10798c14..17cf29f066b793b47665088084e12d2762d3d832 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1005,6 +1005,7 @@ CONFIG_SND_SOC_SC7280=m
 CONFIG_SND_SOC_X1E80100=m
 CONFIG_SND_SOC_ROCKCHIP=m
 CONFIG_SND_SOC_ROCKCHIP_I2S_TDM=m
+CONFIG_SND_SOC_ROCKCHIP_SAI=m
 CONFIG_SND_SOC_ROCKCHIP_SPDIF=m
 CONFIG_SND_SOC_ROCKCHIP_RT5645=m
 CONFIG_SND_SOC_RK3399_GRU_SOUND=m

-- 
2.49.0

