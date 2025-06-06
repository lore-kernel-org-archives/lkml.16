Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85DC8284671;
	Fri,  6 Jun 2025 08:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.130.44.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749198556; cv=none; b=qMMdtmkodhQ4GAHDLWaWRCwk1zidkP1hhvhaW0WNg+gJtWbkx6lfqKp++U8zrw7T0rHCdShriyMqRq+xj+ka/55n0cg3SLX1cVlkBXi5uVBUroomm9Ukti0sKEj5ksaQH1HZ54Z8OTuqsbXdOUu8tEZN9AEguFnYDcmHsV7QjYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749198556; c=relaxed/simple;
	bh=pblMsJYtxiiZ6yuEH5DaphOkBKMWFKnMY1K9Q8i9KAw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BZDIq657T68NWc31Ngg7u39oxXKMKiPW/kANp4KBnjdjx9rUUuaK2pZ5+I6V4t4n0GFUJymWgD/DOY9q153l8PY7psYPATH0sNRkMdQ7IUs6Ug0b5Q4GPuFT96pA1RaOqVpl2YDar708qn3zdNaOK/DraBCLwZZM7Q6oTr3OV/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com; spf=pass smtp.mailfrom=richtek.com; dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b=embAW6M2; dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b=rDg4xYjw; arc=none smtp.client-ip=220.130.44.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=richtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b="embAW6M2";
	dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b="rDg4xYjw"
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=richtek.com;
	s=richtek; t=1749198552;
	bh=BizGSGq8YkmyrHuFxE0dr4I8x+bWGGHz/dkaj1X3gqA=; l=655;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=embAW6M2thQrhswkGvt0PMOp8HOAMVLmIJHwftJN4TFLy71Vk2AACTnWgfHljRx9q
	 buC+N/TNv9g5iR1WhCXO74ZT1TmP5uEYyg+6IFyhl25wtzQTw355x7qfetdX564Y9L
	 m6pz6c2vAaAR1/5eur+/hC4he/EBqrjEtOYPchHp/MFaLzitk8uRzWmiLzfW0MBwNM
	 YA0QIC7D9dkEvpbZVjPwo0w/vMiapzuj5rLnoTLAThAJASy9XEMvDR+7vQ1JfN9Gy2
	 wdIKUoQhHHfcNfe0VG0jkKFMOAihqCR7v9/4tWKZJm1l895okHwHeuqT2BLdMHoJhn
	 /XqpG2TbXipJQ==
Received: from 192.168.8.21
	by mg.richtek.com with MailGates ESMTP Server V3.0(1128079:0:AUTH_RELAY)
	(envelope-from <prvs=1247BEB82F=cy_huang@richtek.com>); Fri, 06 Jun 2025 16:29:11 +0800 (CST)
X-MailGates: (compute_score:DELIVER,40,3)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=richtek.com;
	s=richtek; t=1749198551;
	bh=BizGSGq8YkmyrHuFxE0dr4I8x+bWGGHz/dkaj1X3gqA=; l=655;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=rDg4xYjwlu+9CuBQ5jRtvIRTOuWuBRf7wmnZiJQPfQ+QfeR69Sd119hOOIsFONCMV
	 Jm3o3Uy4WUPn+5KETT+SpbWVymcadr8ZONnrJItybDHCAmeq4SVORY6LByHQfPccRB
	 DJo3PShzeN9rXgvhd6RjtsjrbogMldwMC36TGIevEGIyT6IqHjm9Lf34Ncim8UuxV3
	 Jx/zRSoIp1FXo40FKEvhydunskyjdg4z81SyFcuXdcOB8+dH9HeL6Oe+7kTPlGAdbJ
	 TvID2bAQO6Ok1ohAwC99RfXRMXjt7iDYlXj7U0noSCVucqyocF45lmuNNkgF+9bJGF
	 BY95tfQFz0WAA==
Received: from 192.168.10.47
	by mg.richtek.com with MailGates ESMTPS Server V6.0(2288473:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256); Fri, 06 Jun 2025 16:24:25 +0800 (CST)
Received: from ex3.rt.l (192.168.10.46) by ex4.rt.l (192.168.10.47) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 6 Jun
 2025 16:24:25 +0800
Received: from git-send.richtek.com (192.168.10.154) by ex3.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1544.11 via Frontend
 Transport; Fri, 6 Jun 2025 16:24:25 +0800
From: <cy_huang@richtek.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, ChiYuan
 Huang <cy_huang@richtek.com>, Roy Chiu <roy_chiu@richtek.com>,
	<linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 0/2] ASoC: Add Richtek RTQ9124 support
Date: Fri, 6 Jun 2025 16:24:33 +0800
Message-ID: <cover.1749197773.git.cy_huang@richtek.com>
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

This patch series adds Richtek RTQ9124 1x30W audio amplifier support.

ChiYuan Huang (2):
  ASoC: dt-bindings: Add Richtek RTQ9124
  ASoC: codecs: Add support for Richtek RTQ9124

 .../bindings/sound/richtek,rtq9124.yaml       |  57 ++
 sound/soc/codecs/Kconfig                      |   9 +
 sound/soc/codecs/Makefile                     |   4 +-
 sound/soc/codecs/rtq9124.c                    | 543 ++++++++++++++++++
 4 files changed, 612 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/sound/richtek,rtq9124.yaml
 create mode 100644 sound/soc/codecs/rtq9124.c


base-commit: 61e36be334b06716d81eeafb105bc953bb37f48c
-- 
2.34.1

