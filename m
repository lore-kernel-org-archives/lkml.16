Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DA381ACA;
	Thu, 10 Apr 2025 00:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.130.44.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744246658; cv=none; b=GI/AnXya6qAHns1NFX9/ECmid+SW650Da35GL7eOS5ko8gn6Nb3yjmYnfGdjDyvq+BB9sc9tQFohC3GkX3IsvTUNnMeQ9jTUh3xnlYnD+vbyodLarmWP0PRr87XMPHfc8b9BcmstNRF24mw1aGChP3iM30913s/StJ+yuRM7bjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744246658; c=relaxed/simple;
	bh=fM367l81ZVlqhLQ8ihVgOm+FItlr1FlkXauQY90YU8c=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BhtPVH5Qcautfa/ekr9eD1SsHL1iSRh87GI2LfRvAxWUNySwM/KM6+jdy5uhaDV2iHU79CsGMuxGEN6tnH7ll0J7PhAplgx0MCfiP1JOrI0/TmPwIJXFV7/Lqiehwi9TWNAC+SCl+WgwBUOiOSt0BPj5GEJS9OEWqL9Jz0JV6vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com; spf=pass smtp.mailfrom=richtek.com; dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b=FaooDOwt; arc=none smtp.client-ip=220.130.44.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=richtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b="FaooDOwt"
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=richtek.com;
	s=richtek; t=1744246647;
	bh=HaSnL3uJ5SkBp2qeEggxqOR1wj/n2eYDjXcSqNaousE=; l=1996;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=FaooDOwtnHRMj71eZQhf7AYfA2v41owcWN0WT+A44ex23o2RhuXQWw/S/GcyoGrXX
	 wc6ms8vuM2K8x2yW1/87dhP4PIt9ecxTN4OocIa+ANJ+44HkLMyFdlDShrMXZikgq/
	 ztWWbwxuDgN2b8sQMHU6BT40MKD4aNPL7XJYWV6Yz8Lz4Bqjo17iEdb5+EAF0LhfkT
	 RC3U2ZeRYi0eQXeXX+VIe2Zj0oc45loStueJ4t6ujMe5iHHP91yyYYVjo3xdUfnEZ/
	 se5rMwXKfsW7hksb32YCoH+wIT2o7FO8W/sFtIQ7X0cNwLfxfVWAcp+OThDqAMI3Wb
	 qhzW39GWF/5jQ==
Received: from 192.168.10.46
	by mg.richtek.com with MailGates ESMTPS Server V6.0(2132240:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256); Thu, 10 Apr 2025 08:56:56 +0800 (CST)
Received: from ex3.rt.l (192.168.10.46) by ex3.rt.l (192.168.10.46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 10 Apr
 2025 08:56:56 +0800
Received: from git-send.richtek.com (192.168.10.154) by ex3.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1544.11 via Frontend
 Transport; Thu, 10 Apr 2025 08:56:56 +0800
From: <cy_huang@richtek.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, ChiYuan Huang <cy_huang@richtek.com>, Otto lin
	<otto_lin@richtek.com>, Allen Lin <allen_lin@richtek.com>,
	<devicetree@vger.kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/4] ASoC: Add Richtek rt9123 and rt9123p support
Date: Thu, 10 Apr 2025 08:58:09 +0800
Message-ID: <cover.1744245663.git.cy_huang@richtek.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: ChiYuan Huang <cy_huang@richtek.com>

This patch series adds Richtek rt9123 and rt9123p support.
It's a 3.2W mono Class-D audio amplifier.

Since v2
[PATCH 2/4]
- include bitfield header file to fix kernel test robot issue
  https://lore.kernel.org/oe-kbuild-all/202504052206.HFqFRXUk-lkp@intel.com/
- Use #ifdef CONFIG_PM to only inlucde 'runtime_resume' and
  'runtime_suspend', this will fix kernel test robot issue
  https://lore.kernel.org/oe-kbuild-all/202504052244.bgS5yxev-lkp@intel.com/
- Check vendor-id before triggering SW_RST
- Fix 'SW_RST' write date non swap issue and add the wait delay for sw_reset
- Rename control name from 'SPK Gain Volume' to 'Speaker Volume'
- Change regmap cache type to _MAPLE
- Since ID check run once, to speed up regmap cache init, modify
  num_reg_defaults_raw from 0xf2 'COMBOID' to 0x36 'ANAFLAG'
- Add comments to describe why use pm runtime for RG special handling
[PATCH 3/4]
- Modify the property name from 'enable-delay' to 'enable-delay-ms' to make the
  time unit more specific
[PATCH 4/4]
- Update the property parsing from 'enable-delay' to 'enable-delay-ms'


ChiYuan Huang (4):
  ASoC: dt-bindings: Add bindings for Richtek rt9123
  ASoC: codecs: Add support for Richtek rt9123
  ASoC: dt-bindings: Add bindings for Richtek rt9123p
  ASoC: codecs: Add support for Richtek rt9123p

 .../bindings/sound/richtek,rt9123.yaml        |  56 ++
 .../bindings/sound/richtek,rt9123p.yaml       |  48 ++
 sound/soc/codecs/Kconfig                      |  15 +
 sound/soc/codecs/Makefile                     |   4 +
 sound/soc/codecs/rt9123.c                     | 503 ++++++++++++++++++
 sound/soc/codecs/rt9123p.c                    | 171 ++++++
 6 files changed, 797 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/richtek,rt9123.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/richtek,rt9123p.yaml
 create mode 100644 sound/soc/codecs/rt9123.c
 create mode 100644 sound/soc/codecs/rt9123p.c


base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
-- 
2.34.1

