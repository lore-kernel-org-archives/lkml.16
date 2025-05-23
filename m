Received: from smtp134-88.sina.com.cn (smtp134-88.sina.com.cn [180.149.134.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265AE27466
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 02:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=180.149.134.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747968948; cv=none; b=MuN5UnirYA8amZJdwUMbgGaQqkZlJO5J2DgS7jf738T4PwdD9ghOV8URJ83VcVvdkPduBMCp5JYlRDJaYDfTwyYPxX6kbq6IOzJVaaKfv2h0/56AKyd72T7AA6OyaWyhfjTzbMiCFOHq3aFNiAXCQ1QoyV3/GuQhhSYNgB26mXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747968948; c=relaxed/simple;
	bh=qBJ2kAcdBrQpxlLTDIPnYHciYA93QxLSjDqWR8b1urM=;
	h=From:To:Cc:Subject:Date:Message-Id; b=qyrjkPyys8o68w2J5BICGVO++sItf/yQQcp3AfvRa0VYvRUfR+739aMs/y4aIvMlhr2VAOR78O+mTHu/NA/5+4YaWNkWNjD1ByAQsmfeaHObhzgW3rCDL1KWsNtZxeq4BGyEqMreAQzXTROup5JrB3h0Ig8hozoZ2vzO/Tfhrtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=180.149.134.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([180.172.39.205])
	by sina.net (10.185.250.30) with ESMTP
	id 682FE38700005A34; Fri, 23 May 2025 10:55:04 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: D6906CBCAF9D4E02BDB4CEF5B0E70A5A
X-SMAIL-UIID: D6906CBCAF9D4E02BDB4CEF5B0E70A5A-20250523-105504
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
Subject: [PATCH v3 0/2] ASoC: codecs: add support for ES8375
Date: Fri, 23 May 2025 10:55:00 +0800
Message-Id: <20250523025502.23214-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The driver is for codec ES8375 of everest-semi.

v3 -> v2:
          - Modify some control-names
          - Delete obsolete terminology
          - Modify tags of v2

v2 -> v1:
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
 sound/soc/codecs/es8375.c                     | 793 ++++++++++++++++++
 sound/soc/codecs/es8375.h                     | 123 +++
 5 files changed, 994 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/everest,es8375.yaml
 create mode 100644 sound/soc/codecs/es8375.c
 create mode 100644 sound/soc/codecs/es8375.h

-- 
2.17.1

