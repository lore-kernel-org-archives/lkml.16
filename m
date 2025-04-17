Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4F3210180;
	Thu, 17 Apr 2025 08:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744879479; cv=none; b=I5yKZ0e8hYqK0KO2VHGK7gHnb2uDjiTpAYj4MEP1rZLoD4L+sTgREX9wZDGyh0VfIP5apl/cL4EgcbBYU6kl3Y7I7zvBBngzBImD8Odk69zKkBP4hSgk3GS+yzYAzCk0O/Vi1ePzM6Tbq45GjL5J6eL4RHxVUwlqcveROTl2W0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744879479; c=relaxed/simple;
	bh=oaWT++y0OSwcpZmlTIyBCOuZGKUE0+SBgo9PMt1ddV8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ENr+jy5LC9dR3/Qft3xh38LZchERWn312y12GT9M+sR7x4leNzlEMFx/sG1yk7vM/M3yv8UpXLwbvaw4WMMrzSVmT7GQ3XIzFz3KN3nyTqa8ICXWBraC0Z8q4jqFvN3ebuejYZBmRqyhbQDa0HVQNQ2BBdFn7tOMzZHbXJDSbSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=b9+tPYR8; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="b9+tPYR8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744879475;
	bh=oaWT++y0OSwcpZmlTIyBCOuZGKUE0+SBgo9PMt1ddV8=;
	h=From:Subject:Date:To:Cc:From;
	b=b9+tPYR8aGgbxYUPn0moeEHifiE7zSORuK2Yf9fXzymoNjorIS2ecYwnPGyQ93b4f
	 +PwYbftaWJIX+e+UTbRXdp+e377R8x94BbilGEvdgxtsCIvvb/jOtX8cn5eO/Oekwt
	 FnBDcvRNq5k5gQV95VKiDh/aohIOz16yewFotG7do+JxXmO0xtX9Fq4tXdI9yWKq1/
	 xMEDRmlThS5IGYRbobFC49XGx1/n9afyA6ftJLxObZLwEisMGHts69IZMJFR+cHkO/
	 E/Vbkamu0AwKyPxfklhMyHQPpF8acheWSxP9eh3vj3L0m5XBsfZ/YCje9+fn53UurL
	 73R2cCXueTAkA==
Received: from apertis-1.home (2a01cb0892F2d600c8f85Cf092d4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ACE6317E0FA7;
	Thu, 17 Apr 2025 10:44:34 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Subject: [PATCH 0/6] ASoC: mt8195: Add support for MT8395 Radxa NIO 12L
 with MT6359 codec
Date: Thu, 17 Apr 2025 10:44:31 +0200
Message-Id: <20250417-mt8395-audio-sof-v1-0-30587426e5dd@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG+/AGgC/x3MTQqAIBBA4avErBsw7f8q0cJyrFmUoRWBdPek5
 bd4L0IgzxSgzyJ4ujmw2xOKPIN51ftCyCYZpJCVKIsGt7NVXYX6MuwwOIuT1nKuZSuUsZCyw5P
 l518O4/t+lwsrSGIAAAA=
X-Change-ID: 20250417-mt8395-audio-sof-baa2c62803df
To: kernel@collabora.com, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Trevor Wu <trevor.wu@mediatek.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.2

This patch series adds support for audio playback on the MT8395-based Radxa NIO 12L platform, which uses the integrated MT6359 codec via internal DAI links.

Key additions:
- Support for a new `mediatek,mt8195_mt6359` card configuration that does not rely on external codecs like rt5682.
- Proper memory region declarations and pinctrl setup for the audio front-end (AFE) and audio DSP (ADSP).
- A device tree sound node for headphone audio routing using `DL_SRC_BE` and `AIF1`.
- Enhancements to the DT bindings to document the new compatible string, missing link-name, and additional audio routes (Headphone L/R).

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
Julien Massot (6):
      ASoC: mediatek: mt8195: Move rt5682 specific dapm routes
      ASoC: mediatek: mt8195: Set ETDM1/2 IN/OUT to COMP_DUMMY()
      ASoC: mediatek: mt8195: Add mt8195-mt6359 card
      ASoC: dt-bindings: mt8195: add compatible mt8195_mt6359
      ASoC: dt-bindings: mt8195: add missing audio routing and link-name
      mt8395-radxa-nio-12l: Add sound node for headphone

 .../devicetree/bindings/sound/mt8195-mt6359.yaml   |  4 ++
 .../boot/dts/mediatek/mt8395-radxa-nio-12l.dts     | 58 +++++++++++++++++++++-
 sound/soc/mediatek/mt8195/mt8195-mt6359.c          | 39 ++++++++++++---
 3 files changed, 92 insertions(+), 9 deletions(-)
---
base-commit: f660850bc246fef15ba78c81f686860324396628
change-id: 20250417-mt8395-audio-sof-baa2c62803df

Best regards,
-- 
Julien Massot <julien.massot@collabora.com>

