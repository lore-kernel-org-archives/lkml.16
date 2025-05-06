Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8142278E4C;
	Tue,  6 May 2025 10:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746528241; cv=pass; b=qA7KaGbVSd+DKPdfIlmDUi3BAFhikE50ibZzWYUUGt4GInQMqV1f0Cv4e8CPZbbZbE+5i2WSk1apQTrEksMDII0Olq8lQze63tZ8k3h43QidbivkvPKu2kcvw33139BPneFtMA5hULB2Gt+Zv2pu3zmkuxuMOzc0Hsz7w1OSQ4s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746528241; c=relaxed/simple;
	bh=h2xXCW1J+bPtQqsZdHOvZDZXr8FOGWs2FbaS3KnaQS0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dyjO0xxsy4WIUPyvABIURnEOUBN6BJShvtbbDZ23BVs+jpwKkazmqdagUk01fD/XDN9prAIAXX2wSr1oUHx4e3CahTK9i/2lo5Q/CGDpcWDfcAaBMe5QoteZlUU57AEeg2ogVMAyE9EQszj/qT1pj9iQHH40euor54Pbv1ZT6cw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=e0K9hppJ; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="e0K9hppJ"
ARC-Seal: i=1; a=rsa-sha256; t=1746528204; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iKuUcYPrIt4A3j4GRckvn6OuopOvq0w0w7TvCCZhvHcECt8sLgrmsZQd3NSpVuDrgJNNHAE/5OTLrKHj2U5uu5tOAGoUbI98DQZnMBA4ci+aD1KSYhxPDWoJP+SxdcqvA05//HhVDmKSI+8ZowFbarnJGrgdpZ7T/Bz122TmJLE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746528204; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=UgAJkWKMCMZiD27pHL8mQDuaU7z5D7GDSVmanYuhkI0=; 
	b=FVZXOzR2kRcKcWeC7uSn3YYNXV2Gi26WyotRYhI8R8FMGz/Ht8sQVn4LSoDfEml47m4bGOPpWoJwNXTiQ9yvK4Ytlt12ctOM1F000s8p/mjZ/WjPsP4zrc0K3+VD9VxvcuZMG7HtaVrwn5LuzI3NUxM3Db9tsQsXwKp7POaMCz4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746528204;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=UgAJkWKMCMZiD27pHL8mQDuaU7z5D7GDSVmanYuhkI0=;
	b=e0K9hppJwiSY7g/ApKXHRTv/TYLOJ3FRJpAqdGpnKcFSFaMhg0XyaXPQ4qApECan
	lMJWZck0shNnvE4hAhsO9BhKsfnpBNiftHgYGMEzPNqrtAQoMiHECztbGmObc+hpReK
	vEdjosWz2CyV2qjRDyQeeDBZa2ZK7zlIj9wbarno=
Received: by mx.zohomail.com with SMTPS id 1746528203603146.97246046476903;
	Tue, 6 May 2025 03:43:23 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Tue, 06 May 2025 12:42:44 +0200
Subject: [PATCH v4 5/5] arm64: defconfig: Enable Rockchip SAI and ES8328
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-rk3576-sai-v4-5-a8b5f5733ceb@collabora.com>
References: <20250506-rk3576-sai-v4-0-a8b5f5733ceb@collabora.com>
In-Reply-To: <20250506-rk3576-sai-v4-0-a8b5f5733ceb@collabora.com>
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

The RK3576 uses Rockchip SAI for audio output. Meanwhile, the Sige5
board, which uses the RK3576 and is supported by mainline, uses an
ES8388 codec over I2C with the ES8328 driver implementing support for
this codec.

Enable both in the defconfig.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 98ad22833282596abbe47acb467464680c2dbb80..c960271e47c1370e5a5c947a40835e5be4184c25 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1010,6 +1010,7 @@ CONFIG_SND_SOC_SC7280=m
 CONFIG_SND_SOC_X1E80100=m
 CONFIG_SND_SOC_ROCKCHIP=m
 CONFIG_SND_SOC_ROCKCHIP_I2S_TDM=m
+CONFIG_SND_SOC_ROCKCHIP_SAI=m
 CONFIG_SND_SOC_ROCKCHIP_SPDIF=m
 CONFIG_SND_SOC_ROCKCHIP_RT5645=m
 CONFIG_SND_SOC_RK3399_GRU_SOUND=m
@@ -1049,6 +1050,8 @@ CONFIG_SND_SOC_DA7213=m
 CONFIG_SND_SOC_ES7134=m
 CONFIG_SND_SOC_ES7241=m
 CONFIG_SND_SOC_ES8316=m
+CONFIG_SND_SOC_ES8328=m
+CONFIG_SND_SOC_ES8328_I2C=m
 CONFIG_SND_SOC_GTM601=m
 CONFIG_SND_SOC_MSM8916_WCD_ANALOG=m
 CONFIG_SND_SOC_MSM8916_WCD_DIGITAL=m

-- 
2.49.0

