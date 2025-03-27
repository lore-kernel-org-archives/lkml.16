Received: from mail78-50.sinamail.sina.com.cn (mail78-50.sinamail.sina.com.cn [219.142.78.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8505E2BB15
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 06:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=219.142.78.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743057376; cv=none; b=Pe9EFB/sWk2tPAXbQWhEWITzrPaCtya1fbwnftvECSeuxRjNm7YFWAhBLo2MTY2ahdm/S+RmZobxzG4y8lI4bdS0IPLCkHH1Ob/Esppg3B86x/knF5mSOdbZwoZ/gy7HKcGJt5jdpw4PXMl74L77WnLXlKp4IjvjIJ7CeCUAaB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743057376; c=relaxed/simple;
	bh=tgDgvK8zxlfADTgKXtWW6nHjzte5rxlQFMQvWzouIlw=;
	h=From:To:Cc:Subject:Date:Message-Id; b=FkRD1nkeWCpsBlr/OEiaDHzu1GOAs/MAOEwi2FOJYiQ3CEaIPiOfWbGW9mFOaEtkZmmwEpcu2H8ccC4zf9vNot/SkeoERDuAXgLC5/6f+SXCvSF3/EhtfDC/15hAxna2nxTmtUSfG8losnFXLZj9JI/IadCmSc+EIJinbl1H/t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=219.142.78.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([180.159.108.242])
	by sina.net (10.185.250.30) with ESMTP
	id 67E4F1B3000042DA; Thu, 27 Mar 2025 14:35:32 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: E80A13B330964B8798E3ABEC530006F6
X-SMAIL-UIID: E80A13B330964B8798E3ABEC530006F6-20250327-143532
From: Zhang Yi <zhangyi@everest-semi.com>
To: broonie@kernel.org,
	robh@kernel.org,
	tiwai@suse.com,
	devicetree@vger.kernel.org,
	conor+dt@kernel.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	krzk+dt@kernel.org
Cc: amadeuszx.slawinski@linux.intel.com,
	krzk@kernel.org,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [RESEND v5 0/2] ASoC: codecs: add support for ES8389
Date: Thu, 27 Mar 2025 14:35:29 +0800
Message-Id: <20250327063531.47005-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The driver is for codec ES8389 of everest-semi.

Differing from v4, I added es8389_set_tdm_slot.
At the same time I removed some unnecessary properties in the dts

Zhang Yi (2):
  ASoC: codecs: add support for ES8389
  ASoC: dt-bindings: Add Everest ES8389 audio CODEC

 .../bindings/sound/everest,es8389.yaml        |  50 +
 sound/soc/codecs/Kconfig                      |   7 +-
 sound/soc/codecs/Makefile                     |   2 +
 sound/soc/codecs/es8389.c                     | 966 ++++++++++++++++++
 sound/soc/codecs/es8389.h                     | 140 +++
 5 files changed, 1164 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/sound/everest,es8389.yaml
 create mode 100644 sound/soc/codecs/es8389.c
 create mode 100644 sound/soc/codecs/es8389.h

-- 
2.17.1

