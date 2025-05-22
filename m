Received: from smtp134-80.sina.com.cn (smtp134-80.sina.com.cn [180.149.134.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E0A2882BF
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 10:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=180.149.134.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747910162; cv=none; b=fSzCxS7PW3KOkVb2ffu+kmbvJOl/GMvvy5OMV6Wg+P5kQr0ZJOU9RNwqj1lQpI7uKCHzYivyP0qmoqEzjaA85RTgVAMgnHdT7XXJxvImxGptxPUVT1Qid9Xe0VNQlKA1sS6/ue57qRV2DvcZxlsxDbYMYvDeUZ4zLH6j7RCC6BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747910162; c=relaxed/simple;
	bh=EYqSEoUpJAXKNAC/FNIXD4bIkfyj6HFsAf+a5ekxElc=;
	h=From:To:Cc:Subject:Date:Message-Id; b=jVfIW18dT+r1iLFNBevCuBv040aaXPPLf3C0ifVwgrdRsYZX8Ssk0VMOE+jEHZ+HvJ15YwJMEJR7CliBVkdz4wsgypSrv/6TNyaysSCgQYZW/2P2T2+812xDrAn6c6muyeEtVsQm4kh5VR7MapEllRr1SeN9bX6XKVNzISwoc+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=180.149.134.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([180.172.39.205])
	by sina.net (10.185.250.29) with ESMTP
	id 682EFE05000009F7; Thu, 22 May 2025 18:35:51 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 27071B3F91D74D74802D3848FEB6AD01
X-SMAIL-UIID: 27071B3F91D74D74802D3848FEB6AD01-20250522-183551
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
Subject: [PATCH v1 0/2] ASoC: codecs: add support for ES8375
Date: Thu, 22 May 2025 18:35:46 +0800
Message-Id: <20250522103548.20134-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The driver is for codec ES8375 of everest-semi.

v1 -> v0:
          - Add the description of everest,mclk-src in the yaml file
          - Remove attribute es8375->dmic_pol which is not used
            in the codec driver
          - replace SOC_DAPM_ENUM_EXT with SOC_DAPM_ENUM which
            is used for ADC MUX
          - Modify some control-names
          - Replace a number with a specific variable
          - Delete obsolete terminology
          - Remove the default volume setting
          - Modify cache_type in regmap_config

Zhang Yi (2):
  ASoC: dt-bindings: Add Everest ES8375 audio CODEC
  ASoC: codecs: add support for ES8375

 .../bindings/sound/everest,es8375.yaml        |  71 ++
 sound/soc/codecs/Kconfig                      |   5 +
 sound/soc/codecs/Makefile                     |   2 +
 sound/soc/codecs/es8375.c                     | 797 ++++++++++++++++++
 sound/soc/codecs/es8375.h                     | 123 +++
 5 files changed, 998 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/everest,es8375.yaml
 create mode 100644 sound/soc/codecs/es8375.c
 create mode 100644 sound/soc/codecs/es8375.h

-- 
2.17.1

