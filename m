Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D9A81A238C;
	Fri,  4 Apr 2025 14:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.130.44.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743776826; cv=none; b=ZokEVLISfET2pA8UthtH1+WC5c1UFcJU9nLff2y6ijVzRDN3SsKy8EGDK3fe9hUiD9OLUFWc6TofsKGJ04j/Y7z0VgkzCD2O4iyhxmmBMPS6VDTRy9z43t5H9MSkbBh+iEG8IVAFQkhhgtgalt/dHaEPXY0ijfb4y9gevkePrf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743776826; c=relaxed/simple;
	bh=BinFXEu5xJ5P6GQ2tSNl4s/I+Bg9wAd2jeLycIJNcGE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hAP9laUln9+JgZR1o4OmD0RA3w4V+bUDRDgx+mhe7wZiq0nkfL1qcVL+GFXyu3EWr7Hbi3jbAAzosPTwl4DI3MB3KmCIshCC1VAcuyi4e8jUJIRr0YLBB54VLRfccwU6uzh5FPp5FEjHjJFXrQQUZ2gmjzv8SBtiXx/Q65bYJ24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com; spf=pass smtp.mailfrom=richtek.com; dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b=rfO4hfjY; dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b=TF7X/YOc; arc=none smtp.client-ip=220.130.44.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=richtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b="rfO4hfjY";
	dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b="TF7X/YOc"
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=richtek.com;
	s=richtek; t=1743776821;
	bh=lKHyVuep4L/EA1oyYLoYQ61TnGK9fi+8Aheuj8YJrdY=; l=1004;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=rfO4hfjYwgQw1JFYd6QWp/MDWJEL+aPGD5iz8pT3rc8TxnjIZEXDDcGSgLNANT4UB
	 H7nU21AsXU7AX/0CXn8lZqD6JDxlVii0h2bGR/+lB2Y+GTdCeD+INPydl7xKEDF1EE
	 ib1ERPxlq5wZRnfxVadec86MPlOMuJooQOAYmRcLy5zSGNiHXJkyIcrVKWOFxxWll+
	 JPe9TGRt0GuG+BG5ijkOMRXHBcNl2mN+FacCTog82qvKkNhGeWyuaDORH375vc1hI8
	 FdK8JM0hycyLzlSuA21nYhS99XWPEo5kjH8LvQFlTut8yzCHCck7TgqnPw0TvVhSoe
	 w/BVOFFnfAwJA==
Received: from 192.168.8.21
	by mg.richtek.com with MailGates ESMTP Server V3.0(1128086:0:AUTH_RELAY)
	(envelope-from <prvs=11846F16CF=cy_huang@richtek.com>); Fri, 04 Apr 2025 22:26:58 +0800 (CST)
X-MailGates: (compute_score:DELIVER,40,3)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=richtek.com;
	s=richtek; t=1743776818;
	bh=lKHyVuep4L/EA1oyYLoYQ61TnGK9fi+8Aheuj8YJrdY=; l=1004;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=TF7X/YOchb44Ls5Vgdrd7PnEPXBldCfrecLaiopuMxpkuyr0++bnv4z0lNqFd0rkl
	 nL2ijOjM32OmAMomO4EhbowKIFXiCJv8TuUzbPihJwoTqUYUCaHbacjIAcHnJa2SlR
	 xxH9faEzalCZYovHLgk69NadlE5m/9HCc1Rl+SCniMKArJ7KNdiKLsa1tM/oQfHXJf
	 5QQCNjGnFvoEIU14BkDlpuiIvqH3sSuxmaWi+0w5lbt+ngx0rYi9YcvznboXB46QCp
	 TbsDXYFhQq07sa5zLTIaOml9sgf5fu9VeSmlJJEfLEeIPUQ4A6sRqmQDZsfZBFCtTv
	 GrSkVhZJX1Y3w==
Received: from 192.168.10.46
	by mg.richtek.com with MailGates ESMTPS Server V6.0(1629328:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256); Fri, 04 Apr 2025 22:21:09 +0800 (CST)
Received: from ex4.rt.l (192.168.10.47) by ex3.rt.l (192.168.10.46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 4 Apr
 2025 22:21:08 +0800
Received: from git-send.richtek.com (192.168.10.154) by ex4.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1544.11 via Frontend
 Transport; Fri, 4 Apr 2025 22:21:08 +0800
From: <cy_huang@richtek.com>
To: Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
CC: Rob Herring <robh@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, ChiYuan
 Huang <cy_huang@richtek.com>, Otto lin <otto_lin@richtek.com>, Allen Lin
	<allen_lin@richtek.com>, <devicetree@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/4] ASoC: Add Richtek rt9123 and rt9123p support
Date: Fri, 4 Apr 2025 22:22:10 +0800
Message-ID: <cover.1743774849.git.cy_huang@richtek.com>
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

ChiYuan Huang (4):
  ASoC: dt-bindings: Add bindings for Richtek rt9123
  ASoC: codecs: Add support for Richtek rt9123
  ASoC: dt-bindings: Add bindings for Richtek rt9123p
  ASoC: codecs: Add support for Richtek rt9123p

 .../bindings/sound/richtek,rt9123.yaml        |  56 ++
 .../bindings/sound/richtek,rt9123p.yaml       |  50 ++
 sound/soc/codecs/Kconfig                      |  15 +
 sound/soc/codecs/Makefile                     |   4 +
 sound/soc/codecs/rt9123.c                     | 484 ++++++++++++++++++
 sound/soc/codecs/rt9123p.c                    | 171 +++++++
 6 files changed, 780 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/richtek,rt9123.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/richtek,rt9123p.yaml
 create mode 100644 sound/soc/codecs/rt9123.c
 create mode 100644 sound/soc/codecs/rt9123p.c


base-commit: a2cc6ff5ec8f91bc463fd3b0c26b61166a07eb11
-- 
2.34.1

