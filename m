Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A521C280A52;
	Mon,  9 Jun 2025 07:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.130.44.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749455279; cv=none; b=Hy3xUwFEgtC6KzZuHnuttaZJyv33ykY7jA1W1MjpnuD43AB/aIh9E2typQvZNibW6iMSqPjic105Eb7jm4u/mwH1ruHkdPD82RwC32cUps6QfRvB/Qf7N21T+FrX6sXjEYvJvmBRvOsRQ/bdUOTk7Sr6ejHsNVpmYc8U+lp9QBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749455279; c=relaxed/simple;
	bh=pHiT/m2BXiIP3lv0/1Ix6x0PspGZOFem/8TU5u3+DCI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WZvGnx3Bdixx5RdeoafLPSPI9KQnlyaEnPeIyN/UGjk83R2FF1UbW1iyeL5grxtifsxT6RxVEv1plLM/t7P+fQT6FrgAxhpk50gsZBnreT0LYD9zzzyQqyWfB+RlvoQ15Lif/NbglL9X4DEo5MHAN/Lb+6IZk0CONsHqM5HGUv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com; spf=pass smtp.mailfrom=richtek.com; dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b=bpk6Pb86; arc=none smtp.client-ip=220.130.44.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=richtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b="bpk6Pb86"
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=richtek.com;
	s=richtek; t=1749455268;
	bh=4s1C+hBgY4ybJmSElnyUuaZf7zSmbzvZE+p1okI9Lkk=; l=642;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=bpk6Pb86/SESncyt7tUnmg7616nYzm3gRAM/b1+i7f3xUJMGfMLd57cR9TKYMHaJh
	 CeiVpeixgo/k4hdTdxmyAmWjeIP47zsSdVtmetGwXhFKN/+NRifPITI1Ama6iILuUp
	 /Gw3cl9yasggIuMri8MC/hWHXSAXp0bBvoGw6qbA8Ae15YMvS3tvvUXmMtMm80h9xJ
	 qkgqXjtyd4tUPm9YOZCiVi4sqKEet8o+1i0uzmt4we3AeaVEhwNiO/x7nz4Jt82kGo
	 6l27jTykDZ9HDBrwa3BT4MJhYwnuM6OcsMaLIVT0YA32N1x1zNIoGnK9+RNMN6f9RC
	 3xzd1c6DldTvQ==
Received: from 192.168.10.46
	by mg.richtek.com with MailGates ESMTPS Server V6.0(2288478:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256); Mon, 09 Jun 2025 15:47:22 +0800 (CST)
Received: from ex4.rt.l (192.168.10.47) by ex3.rt.l (192.168.10.46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 9 Jun
 2025 15:47:21 +0800
Received: from git-send.richtek.com (192.168.10.154) by ex4.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1544.11 via Frontend
 Transport; Mon, 9 Jun 2025 15:47:21 +0800
From: <cy_huang@richtek.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "ChiYuan
 Huang" <cy_huang@richtek.com>, Roy Chiu <roy_chiu@richtek.com>,
	<linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/2] ASoC: Add Richtek RTQ9124 support
Date: Mon, 9 Jun 2025 15:47:26 +0800
Message-ID: <cover.1749454717.git.cy_huang@richtek.com>
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

v2:
- Instead to add a dedicated rtq9124 document file, append the
  description to the existed rt9123 yaml

ChiYuan Huang (2):
  ASoC: dt-bindings: rt9123: Append RTQ9124 description
  ASoC: codecs: Add support for Richtek RTQ9124

 .../bindings/sound/richtek,rt9123.yaml        |   9 +-
 sound/soc/codecs/Kconfig                      |   9 +
 sound/soc/codecs/Makefile                     |   4 +-
 sound/soc/codecs/rtq9124.c                    | 543 ++++++++++++++++++
 4 files changed, 563 insertions(+), 2 deletions(-)
 create mode 100644 sound/soc/codecs/rtq9124.c

-- 
2.34.1

