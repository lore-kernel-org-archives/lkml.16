Received: from mail78-60.sinamail.sina.com.cn (mail78-60.sinamail.sina.com.cn [219.142.78.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACDE12512D1
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 09:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=219.142.78.60
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747215955; cv=none; b=YIGK4KTvum57FNKhJFu5DSKa1amUGuwohLmLbLvwi6GTiWgkxP/dsOFSsBeaHgBno3h7BbSFw1MX9eupnIeR7X+X7l1gJD8sIJFiycmS75zbFf2SQhdrYl73Bt938oPQSkX9CMK1SC++J/0Hvdzizoa/mEVRiLu3IE+Suia/AYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747215955; c=relaxed/simple;
	bh=mtY0bTVm5VhXr+TTF+qVqJJr9B0vaykavLfKF0/XCPI=;
	h=From:To:Cc:Subject:Date:Message-Id; b=bFIKGbTwvWqvBHyzRzlXmPUCx7ikNMFKrer1PlqTgUliNqZjzlumsAbdFBmJrFlJaqdEOi1fyYNDgy3CfS1X8h5agSIAIDMlZumsaiBaDKjx4Z9leTf+7uChUWMGrKGzXCVf3tF4fnC1dhDkYabeilHJohdI1JChmS8CF6/1bDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=219.142.78.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([180.172.39.205])
	by sina.net (10.185.250.30) with ESMTP
	id 6824664C000067F7; Wed, 14 May 2025 17:45:49 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: EE9984FD0F324F48970E86E80AD22A0C
X-SMAIL-UIID: EE9984FD0F324F48970E86E80AD22A0C-20250514-174549
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
Subject: [PATCH v8 0/2] ASoC: codecs: add support for ES8389
Date: Wed, 14 May 2025 17:45:44 +0800
Message-Id: <20250514094546.35508-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The driver is for codec ES8389 of everest-semi.

v8 -> v7: Modifying apply error issue

v7 -> v6:
          - Modify the order in the Kconfig and Makefile
          - Remove ES8390 in description of codec driver
          - Romove unused variable in the codec driver
          - Modify notation for declaring variables

v6 -> v5: add "Reviewed-by" at v6 2/2

v5 -> v4:
          - Modify kcontrol on DMIC in the codec driver
          - Modify the way to set the slot and add es8389_set_tdm_slot
           in the codec driver
          - Modify the problem ablout making the use of a MCLK depend on
           the configuration of a TDM slot in the codec driver
          - Remove the "everest,adc-slot", "everest,dac-slot" and
           "everest,dmic-enabled" in the codec driver and the yaml file,
           because they are unnecessary. 
          - Remove the "prefix_name" in the yaml file.

v4 -> v3:
          - Remove simple probe enter/exit debugs in the codec driver
          - Modify the problem about double free in i2c_probe
          - Modify the problem about coding style and wrapping
          - Modify the problem about Bindings are before the user
          - Modify the ref of "everest,adc-slot" and "everest,dac-slot"
             in the yaml file
          - Add description of "prefix_name" and "everest,dmic-enabled"
             in the yaml file

v3 -> v2: Modify the format of examples in the yaml file

v2 -> v1:
          - Remove a empty switch in the codec driver
          - Modify the format of examples in the yaml file

v1 -> v0:
          - Modify the register names in the codec driver 
          - Use yaml instead of txt to describe dts

Zhang Yi (2):
  ASoC: codecs: add support for ES8389
  ASoC: dt-bindings: Add Everest ES8389 audio CODEC

 .../bindings/sound/everest,es8389.yaml        |  50 +
 sound/soc/codecs/Kconfig                      |   5 +
 sound/soc/codecs/Makefile                     |   4 +-
 sound/soc/codecs/es8389.c                     | 962 ++++++++++++++++++
 sound/soc/codecs/es8389.h                     | 140 +++
 5 files changed, 1160 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/sound/everest,es8389.yaml
 create mode 100644 sound/soc/codecs/es8389.c
 create mode 100644 sound/soc/codecs/es8389.h

-- 
2.17.1

