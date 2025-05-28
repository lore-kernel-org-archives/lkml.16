Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDBC220F36
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 20:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748462409; cv=none; b=NVV0esu7t7N6xT1gyAYus2ahwq1SD7TCQjOCgqHzs8c0ndsaePoE7Agco43xGpqS8DKK6J77Th2t4CG50iKtJoPI8Bna1ndJPmBlMI9Qq7sGnF5+E/xmsF6bjm9xOunBrYam0ZoJMnWltE0iUjQ7vH809F13osg5EMlGgStJEVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748462409; c=relaxed/simple;
	bh=+RSQH1WWEw3OUmjRpYHyCD+79jexEjxzP96wMUdlgH4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AbIDBn6Fb8LrzSrkB6ut/w6sHDkpTPngwqOfw99TXQW2Ted8H7n9HOJi6va1Oal3+qK6paz3dutVARWzJORq0U0qDf/BobR/qngrQJAQaV3EtcdpsZQ7QrWdRiD1Evea0uvztCpssTsu4Zs5TjP/0+d12AVAYSAoPlWat/kL0EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g5hVM02Q; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g5hVM02Q"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-442cd12d28cso88415e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 13:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748462406; x=1749067206; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6vfW+FfH9s8Rae4vVOChz/TDf82CLWQFderngHSXirY=;
        b=g5hVM02QoRNDYVleh7OFYDuPLp+SVTHmSDqSbtMrWtbgk7fa+LQo0xUZlVjsAg9ayw
         3ceOo7VYlqaPCLPwiEBMfRX/oid1+EAVzQClJDiN3ndVIYeRQIl7W453Z5lZzfnTscKe
         SlkMvpXnEYSxPJGSJWLBLCSK3bDL2o05yhmbwhHv5p5gV+Pijny8TXd7x1lfom2iJdNt
         Ed67pQgbpHo+zPfFIFVFiJwVtbNvcU0uaEfs/GYk1c8SUYhd0fTL5zTXKjiX15+puGJd
         4LbyycR0IHQ65qUCdr2YzZ3EelE0TS4MrVqJVduNMJ/5pOSXnx5t9h22gelsCgbf69nH
         7tXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748462406; x=1749067206;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6vfW+FfH9s8Rae4vVOChz/TDf82CLWQFderngHSXirY=;
        b=CZSmuSGHr0TNFVbO3hPJUVlfbUcsgKxuq6+sXUBns6Uq9HmVnD39aM/KJe4b4/pQ5c
         eR950Ky9RsqwOt4JalcYta557FsqQvPFEPBLY/QA2uCHbQgYhTTNAz+N9YptJilMPDwQ
         aSawlpHGW2aATba4LiRi4xy/Rb29Pbb5mVKkI6PQ9C6Asx64kG2+qQXECDVnNq6l2B86
         2xFyn1b87yTGAWK+bNt7dpmiW7kDL2MRw+a0keCShsvE9zZaxDcb4XSksv/fwLznXnw3
         Vyo7sA3wrmWEGd38NUX9cXqxokvQzXpg0lR7goDpn2S+/GFQgbq+Uk8O4J3a/gop6JjD
         G/8w==
X-Forwarded-Encrypted: i=1; AJvYcCXqy35bn1/0WzPGuE/XmJkAsWnIpcgfpBAc6JuMGWHsFhGjnMT9auKhTgl2OqVJt3Hf/rT7aaj+N1mYl2g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKhkEed4IJHsY1YNv00CLX7KyAISuLtlk8wdNVxQtoCdkh46KF
	xki1rwvaLTHmASAEOvRqDnyi9U27F3QgOHE2jTY4JwG5Qz52lBvuYLg3Bs4omrBEfb8=
X-Gm-Gg: ASbGncsej17mnCiWwgpQuIBjY0qt/vpqjD8d2E84rfpS+GlZbK99yqNNOZKLkxMqmci
	i74PK0+WjZKiIJJ+XrJGxFYw52RbWoXcYUap4Mkt/Rj7yWfoWICzrwSh22ygHb8jqAL7I+lpJzC
	A4rcEW1ZuR+zYjVqLm+J8T1JPDZRwrR4XjimtAkDTGzH4r+yG5lIvSBME/IGE15is5ZRdPruBZO
	7fYC2vmf9MkonF7iSGYu1Lza0pt3sTJPB8lZCxMNgkhCqdcGt0a2Pghbyf+SeQG5tpzmbnPeqlb
	dGObCrfZtqXsmFKLXLuTECgExsjC2OWRfc0KxrgNPu4mXkyQJitx5Kh6ywSxWswecKTeT/4=
X-Google-Smtp-Source: AGHT+IE1Mm1hj0KXA6UQHYEYpLLI9gqUavUoSQwksygHkZby3xzXc62jj2qjprP5G8oWcOEhnKqxKQ==
X-Received: by 2002:a05:600c:511b:b0:43b:c0fa:f9c4 with SMTP id 5b1f17b1804b1-44c94c246aemr64196675e9.4.1748462406321;
        Wed, 28 May 2025 13:00:06 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-44fcbd61553sm53347665e9.0.2025.05.28.13.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 13:00:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/8] ASoC: codecs: More const and unused member cleanups
Date: Wed, 28 May 2025 21:59:54 +0200
Message-Id: <20250528-asoc-const-unused-v1-0-19a5d07b9d5c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADprN2gC/0XOQQ6DIBAF0KsQ1p1EAa1wFeNCYWxZiBbQmhjvX
 tQ2TWbzJ/lvZqMBvcVAFdmox8UGO7oU8huh+tm6B4I1KVOWsSIrWAVtGDXo0YUIs5sDGsiRy05
 wgYLdaepNHnu7nmbdXNnja050vJZ/WZGvW0Injjn1tzaSywIWY2Ba4cQg01gKLqteaq2W/DjUt
 QHTK8NgoyIO1wg/jTb7/gEkqKVZ2wAAAA==
X-Change-ID: 20250528-asoc-const-unused-1e39b434e427
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Oder Chiou <oder_chiou@realtek.com>, Srinivas Kandagatla <srini@kernel.org>, 
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2348;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=+RSQH1WWEw3OUmjRpYHyCD+79jexEjxzP96wMUdlgH4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoN2s8GaxaeUdgNhIEnN7feOgfCTXlEE/tNIcfQ
 w7fQgJ/0PiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDdrPAAKCRDBN2bmhouD
 1xbAD/wLQHSFVgebaLynwR9dza3iq6tgF1gSzhFhVcuXsg6P0FrtS/lrgOzQT7LszOt/96uK4oz
 IMidlTHwKDQD+qcjRnRxcDYgJFTMPuZnlOGnqA0xoT+MD4djX2sd4sFdWDTeXXvm8EptQ6iyFQc
 OSnOICEE2zWQaDWE6Bws/ggAFo+dF+qm6bVyRsBA4aRbaNqIi9GbzkMtKDOLx9EXooZrUs7lgkg
 asbGuhUkWdq11XX39sP6/WlaqXpHV7WmSwVJg7EZfrLC+v4Fnts6XCnugBiMcUOmOebSOI7927z
 ue6LjpZWd5+K7SbTthbkuEH3SfdE/FnyRCNPp1m/0Yhh+irzaoVTzCA4Av2uIgOcXtOGA5iW3fO
 9cqwpO5hHeA88z35DAOqACtL0rDv9cHp3JdFPv4PSBtEs2H3ETDCPpeOvDe0egZjA9wVNMVQ87R
 4SvNhBZVK+/f1GTRsGpINzo11Le+Qly8lSkpXRjyPrxiyJy3CBxyqxYzsC92xddruBz/CfQIoIW
 TB8HJZ+FyR5yZ24zR2dYW9vDrkIs2bwiVoPT9peQChkeozUETrkS/CxLZAp22Wo3CMZ+rBleOWn
 JHuvsXTxZ3QypWNF+pcqdzy1u+Fz+VpdMB0MiF45VP3ia9e/yjMs/9juBjWDx1pmDvz/DS2xCoc
 SSChHiV+h9DSBWQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Make static data const for code safety and drop some unused fields in
structs.

This is based on for-v6.16 branch in ASoC tree for context in wcd938x
driver.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (8):
      ASoC: codecs: Constify regmap configuration static variables
      ASoC: fsl: Constify reg_default array
      ASoC: codecs: wcd9335: Drop unused sido_input_src field
      ASoC: codecs: wcd934x: Drop unused num_rx_port/num_tx_port fields
      ASoC: codecs: wcd937x: Drop unused 'struct wcd937x_priv' fields
      ASoC: codecs: wcd938x: Drop unused 'struct wcd938x_priv' fields
      ASoC: codecs: wcd938x: Drop unused variant field
      ASoC: codecs: wcd939x: Drop unused 'struct wcd939x_priv' fields

 sound/soc/codecs/cs35l36.c        |  2 +-
 sound/soc/codecs/da7218.c         |  2 +-
 sound/soc/codecs/da7219.c         |  4 ++--
 sound/soc/codecs/es8375.c         |  2 +-
 sound/soc/codecs/max98363.c       |  2 +-
 sound/soc/codecs/max98373-i2c.c   |  2 +-
 sound/soc/codecs/max98373-sdw.c   |  2 +-
 sound/soc/codecs/max98388.c       |  2 +-
 sound/soc/codecs/max98390.c       |  2 +-
 sound/soc/codecs/max98396.c       |  4 ++--
 sound/soc/codecs/max98504.c       |  2 +-
 sound/soc/codecs/max98520.c       |  2 +-
 sound/soc/codecs/max98927.c       |  2 +-
 sound/soc/codecs/rt722-sdca-sdw.c |  2 +-
 sound/soc/codecs/wcd9335.c        |  5 -----
 sound/soc/codecs/wcd934x.c        |  4 ----
 sound/soc/codecs/wcd937x.c        |  2 --
 sound/soc/codecs/wcd938x.c        | 18 ++++++++----------
 sound/soc/codecs/wcd939x.c        |  2 --
 sound/soc/codecs/wsa881x.c        |  4 ++--
 sound/soc/codecs/wsa883x.c        |  2 +-
 sound/soc/codecs/wsa884x.c        |  2 +-
 sound/soc/fsl/fsl_asrc.c          |  2 +-
 sound/soc/fsl/fsl_sai.c           |  4 ++--
 24 files changed, 31 insertions(+), 46 deletions(-)
---
base-commit: 22d449bcd69e66f25fe847b678738950dcf9301e
change-id: 20250528-asoc-const-unused-1e39b434e427
prerequisite-change-id: 20250526-b4-b4-asoc-wcd9395-vdd-px-fixes-0ce64398f9cc:v1
prerequisite-patch-id: 104000f7254b9cc81be49af9ca584544718e52f1
prerequisite-patch-id: 230fcd1b712c5a3199e7c9d8250e98e5d55c0a40
prerequisite-patch-id: ecdbe74955eb7b710f72af1e3cf32ccac52890d5

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

