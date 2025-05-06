Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3176D28000E
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 13:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746537016; cv=none; b=NMdwcBxrRcppEQTItsHfdzfhel/Cm+WWKOtcWpa8P97Nr21zj9wM4MqY8+fJCYPTV7vvfNnebTU0Q3iGeOG3jWXhEpUHTle5PzeY3173trK0pVK/yX21F/4xNsIQ0znBbCPINXIKXemJVFw/z7a3Tk1rgKCGOTPr6pHgG6jpS7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746537016; c=relaxed/simple;
	bh=oqnUxremHISOuVzgXJvUlTaqJdS7J1eS94fmp04NNlc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nk0rEDj6K54T/TuWueJvglwuiw5D3U15ci4Ecgm1Dqi4tCWcmrEsigB6o/mRG7jIZEwQzHFB9xMqoPnON1iIS8j4PtTCoFgohQ6Q6ZSiP4Dj5sjyGa68LTNcwFBKyTSocZFuxW2HvvMZsEV88Msf1egNX4QhD8t0z6BEE/CBDXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=a5lmD3tX; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=VtIs0gGs reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="a5lmD3tX";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="VtIs0gGs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1746537012; x=1778073012;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7flR5DbV9pTvWMtb7j8Zpa3VQSCSW81rsjiKSP4Ot58=;
  b=a5lmD3tXtbmwDQk0ow7Sb44qo3k6vji7C6hUJrWOmhL10H/cTmzrFoL3
   LhRyEBigyP+hMMs7RnwHzcfp3DMXyHQHwgUvz3qPvDATQ57f9zEwyjeXU
   CGGNU60r6xyQtWgYKEJKXdeeRlOO//ACd9iCqQouxmEiSS/9Us9XOYDCf
   2nysfGAMwaESqLSWLpC26+g6k5bBK/V4GfQurQVpj9NJbh0kRWbXG2DjI
   nq75yTH3z3hp7NF6dnecNAxKo2ii4nkWw7hQhvktrah32e+sPnAAJWf9Q
   Brye7kDBEPpd+8MYpr54IpotHkeNlBzlfgimM1JEM4DATFU1AM+bIgzfq
   Q==;
X-CSE-ConnectionGUID: Q1eSLSEGSGyRrPEtnwsZ6Q==
X-CSE-MsgGUID: 4ZaVbCIiRfWnTqXBDzDuJg==
X-IronPort-AV: E=Sophos;i="6.15,266,1739833200"; 
   d="scan'208";a="43909028"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 06 May 2025 15:10:03 +0200
X-CheckPoint: {681A0A2B-A-68AAF6F9-E177A1A4}
X-MAIL-CPID: 98129684B7364D902E833F2BF2B8F45D_2
X-Control-Analysis: str=0001.0A006398.681A0A3B.005C,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A04A51636AD;
	Tue,  6 May 2025 15:09:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1746536994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7flR5DbV9pTvWMtb7j8Zpa3VQSCSW81rsjiKSP4Ot58=;
	b=VtIs0gGsg/LpVTSw0QA4nX1HA9u92HuNFdEq/6irbAg0c84cqHiVnauSV4RZ6jRV5eVrc/
	p3avYSnxmb0PFc9eyZ4AczU4DOWnsWy75/tjaI2b83wnx+f7yUo25cAWo+2lbU7iO3SxDf
	K0RVnXnT7TScEzzZAU/eijrG4GVOrOcIR+2FBGFBoec7MoRpZKXAJQNbExKFtKBJjuMqFE
	DkzBjW327IWkdI2l+CVi4RTe+5DV+eXurf4H4KsTLb+pyq2+PsvTk9OOcxynXC/NrNhppz
	M8yFYLhwM9JGGUjTpFSXn4HlWHA1RyWwbyhKUXYIGuKib3v5nZneQ2vaTlf8aA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] arm64: defconfig: Enable Marvell WiFi-Ex USB driver
Date: Tue,  6 May 2025 15:09:39 +0200
Message-ID: <20250506130940.2621554-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

This driver is used on imx93-tqma9352-mba91xxca.dts.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 8691f0ee44e66..550b2505b5658 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -437,6 +437,7 @@ CONFIG_IWLMVM=m
 CONFIG_MWIFIEX=m
 CONFIG_MWIFIEX_SDIO=m
 CONFIG_MWIFIEX_PCIE=m
+CONFIG_MWIFIEX_USB=m
 CONFIG_MT7921E=m
 CONFIG_RSI_91X=m
 CONFIG_WL18XX=m
-- 
2.43.0

