Received: from out28-97.mail.aliyun.com (out28-97.mail.aliyun.com [115.124.28.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E180274660;
	Fri,  9 May 2025 08:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746781038; cv=none; b=bzN8VhP2FWIk11pR11qx9NXSEirydZbOuV9I0U4nMdp/9WYqxY/b+MnF738N+jJlrvDGG33S9I8DAi5Lm2v8TqNufwQrSJNCVuzx1yvtLBXqa8+kJfyoSjQDAAnjoBwXW6TsKpww0827+d8/iKrPoObWBgQMynOyYqKakOEbWdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746781038; c=relaxed/simple;
	bh=3JpfoG3Q4i2lWZBeuL+N7tjdXju/3I8ijASYoCjRTqE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=h4lxta/9IrlY65lHq2soXFwgYwMftsHoWgEpVx+JovsQpg71s/9p2OYpY3Ui7dmSAYefl0gd7kSlyTQEvpvD7MhAe6pzMlNtSDwJPot6KnEqzzptNJ2IdWljqFLv0LhnBKcpKhWry7uwdqygI1FKAF233enKlhgUyhOtN/LFA0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=coolkit.cn; spf=pass smtp.mailfrom=coolkit.cn; dkim=pass (1024-bit key) header.d=coolkit.cn header.i=@coolkit.cn header.b=F23MYuPf; arc=none smtp.client-ip=115.124.28.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=coolkit.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=coolkit.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=coolkit.cn header.i=@coolkit.cn header.b="F23MYuPf"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=coolkit.cn; s=default;
	t=1746781023; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=fRMaFKajs8FT8Uo1U+GjWMJn+xnPPEQN51BpCVmEi2s=;
	b=F23MYuPfHeoPEi6Xz28q/uthKKf8vf0X60YhiWQ0IOPhNmfW/b4vTns99LloUftt6/b0Bg2kXYEGfGWqG4seS3lMWV3QZKapfu0PztHoW8RuDwF/VY6UmBsX1Nat9gJTflGSH0YWki5d1I8aDB8lyH44Y/+hVz3Yxf0FyI81Fo8=
Received: from ubuntu-z.lan(mailfrom:hao.zhang@coolkit.cn fp:SMTPD_---.cjnlkfS_1746781022 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 09 May 2025 16:57:02 +0800
From: Hao Zhang <hao.zhang@coolkit.cn>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tim@feathertop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"hao.zhang" <hao.zhang@coolkit.cn>
Subject: [PATCH 0/2] arm: dts: rockchip: Adapt to IO domain and SDIO for Sonoff iHost
Date: Fri,  9 May 2025 16:56:55 +0800
Message-Id: <20250509085657.309934-1-hao.zhang@coolkit.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "hao.zhang" <hao.zhang@coolkit.cn>

This patch series makes two corrections for the RV1126-based 
Sonoff iHost board:

- Patch 1 adjusts the SDIO max-frequency to improve WiFi stability.
- Patch 2 updates the IO domain voltages to match the board schematics.

The voltage fix is based on verified schematics and helps avoid potential
hardware instability due to mismatched IO levels. 

Tested on multiple units with improved long-term WiFi operation.

Tim Lunn is Cc'd as the original board support contributor.

*** BLURB HERE ***

hao.zhang (2):
  ARM: dts: rockchip: Sonoff-iHost: adjust SDIO for stability
  ARM: dts: rockchip: Sonoff-iHost: correct IO domain voltages

 .../arm/boot/dts/rockchip/rv1126-sonoff-ihost.dtsi | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

-- 
2.34.1

