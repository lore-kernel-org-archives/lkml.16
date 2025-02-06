Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B645237169;
	Thu,  6 Feb 2025 16:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738859529; cv=none; b=s4FKhu6HZwmxNgvMQxR6c+r/UStzIpgDHP2MqhFjktddakXw5HkrnjgNk6R3Op319gTG9/d0Cxol09iDw+wl9AgmMtbzMrhuUWcR2xKcpzP+CvvanmNaFpfXh2R9gp/epybmEnHuUg470PKTnV0KKtyiStBSmABttADcIrJ4wNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738859529; c=relaxed/simple;
	bh=sxtHAaBDqWZ8CcHk3osK0mI/wnnUfUVbdv5ILgugBbY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KzFKfpztCygUsGFPZItLlkhthXc10YgPIJksN2ewG9EqkzUiiSF/fUm0XUzoiP1Rdke+Q+JXB1sCPgrewJPewINlzp+xrnZgFrttmbur2cIZURL5kUhJ5jjajvtRlP4/a5pQRf2B8GTubF2w4bknqD5MxOmLGuyyqKyzOhNrD9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=VYSi8w+D; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="VYSi8w+D"
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id E82581F975;
	Thu,  6 Feb 2025 17:32:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1738859525;
	bh=yaxKGO6yJJKmC+LzUU590r0W2R0lxR7lUxylJw41k1E=; h=From:To:Subject;
	b=VYSi8w+DrWcBa06LXkYm4JApQLkiNR4tqQNYqwpCCisDzbPbJrQ7lRh2TLMN6JB9k
	 UWHNQ3GC0ZkJcjPm78BNclE86mxKWXpFAXdMjheOG4TvLKgarS8P5/OsUTd8kHzGcp
	 VcjJEJtRySplmlknrUh+AC7+RisECMFshuTJnbwNq1oX0+dQK8TJVj0HiTsvwPNRkJ
	 CM3e6Sw9Gu2C/FkbFoq5JHttdTkdh/aTYrS4Avhq4uP385eHz7Tp6m9PFWqhLE6/CG
	 rpqV90sDAFBAIbOSPh0YtBvFuJ6ANcuLJqPyinnpIpiGpSmNdaiCOgT/NdOGRLmE2q
	 t6s9LfQwwXfvg==
From: Francesco Dolcini <francesco@dolcini.it>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	patches@opensource.cirrus.com
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/5] ASoC: wm8904: Add DMIC and DRC support
Date: Thu,  6 Feb 2025 17:31:47 +0100
Message-Id: <20250206163152.423199-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

This patch series adds DMIC and DRC support to the WM8904 driver, a new
of_ helper is added to simplify the driver code.

DRC functionality is added in the same patch series to provide the
necessary dynamic range control to make DMIC support useful.

The WM8904 supports digital microphones on two of its inputs:
IN1L/DMICDAT1 and IN1R/DMICDAT2. These two inputs can either be
connected to an ADC or to the DMIC system. There is an ADC for each
line, and only one DMIC block. This DMIC block is either connected to
DMICDAT1 or to DMICDAT2. One DMIC data line supports two digital
microphones via time multiplexing.

The pin's functionality is decided during hardware design (IN1L vs
DMICDAT1 and IN1R vs DMICDAT2). This is reflected in the Device Tree.

If one line is analog and one is DMIC, we need to be able to switch
between ADC and DMIC at runtime. The DMIC source is known from the
Device Tree. If both are DMIC inputs, we need to be able to switch the
DMIC source. There is no need to switch between ADC and DMIC at runtime.

Therefore, kcontrols are dynamically added by the driver depending on
its Device Tree configuration.

This is a heavy rework of a previous patch series provided by Alifer
Moraes and Pierluigi Passaro,
https://lore.kernel.org/lkml/20220307141041.27538-1-alifer.m@variscite.com.

Ernest Van Hoecke (5):
  of: Add of_property_read_u16_index
  ASoC: wm8904: Don't touch GPIO configs set to 0xFFFF
  ASoC: dt-bindings: wm8904: Add DMIC, GPIO, MIC and EQ support
  ASoC: wm8904: get platform data from DT
  ASoC: wm8904: add DMIC support

 .../devicetree/bindings/sound/wlf,wm8904.yaml |  88 ++++++
 drivers/of/property.c                         |  33 +++
 include/linux/of.h                            |   9 +
 include/sound/wm8904.h                        |   3 +
 sound/soc/codecs/wm8904.c                     | 274 +++++++++++++++++-
 5 files changed, 403 insertions(+), 4 deletions(-)

-- 
2.39.5

