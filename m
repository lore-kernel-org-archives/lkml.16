Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45326280338
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 12:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746621874; cv=none; b=r2GNUwJnJTU8URg2CSKmkZEKjGUHU4Mc3ReUsFgi4ajvLCIqyBPdGFVfdL+X6onJQWAPuAB3Ga9gY7vNvn16N2QMDY952kk51wk68HJmpaBTkqhbW+o+lU2aiENkA5ItcG1DKoE+YwvA6HOmCCWalTmMd618FFn/IGKRHgmJsaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746621874; c=relaxed/simple;
	bh=nQujC6034IbbV1/Takj+ktYRPduuI1NiEdr6M8Bk9tM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UbliXLh+KO/4+cL2I2lQqOuEDUoXtdouQPp9bZobtn9cHAiV1bAaw9yG35Blvr9t7VrjyGDnscw9wwU1n6WsnOEjXG5q+50/qmRL5Rno9votZ3Jat9LEDfJ5GCbgSxQhqC1saMLok7dKZt8F+V/A+F0aGoXZRNBTuTriewkBwBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=kcxcIV1S; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=kj0fwJqq reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="kcxcIV1S";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="kj0fwJqq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1746621870; x=1778157870;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=UaNOIapp4J5KzxMU+tHJGWnVbFnnDP/ugTkRCJiT7PY=;
  b=kcxcIV1SUWHiDKEmQrHcfBVbAp93yBgLaqQ9msTevKDN+848jZHh3kCw
   N6x5O5OoFNeIoM2EsejADbynAp4HI4idI+CjWWv2MF+LlydBSLX+XUO3r
   PwD6jjVKjrkKPvoRUk2Y9iVhWvoChARWHMojQWtyCWsEEZYe6iEEtXsit
   wMHArzYrVPRMzOfUNnHwlOziznhHRxa7NcIzk9QVX+lmTJHHpakIJEJc5
   8jIATm6uC59emSpj2PEh1goyeLdIXOy/PEeXkqhnZ25Z5vI8s7eh/DDCy
   ZdqUhFygiQCNfwXG25Uq5lF8W9gPU5YSjHv1mkJWAtYRECyCdozPAAhvJ
   w==;
X-CSE-ConnectionGUID: DrLXQv0vSxemKXNx8bmoHA==
X-CSE-MsgGUID: TR8Z33pXRm+v+2x3xaMeBQ==
X-IronPort-AV: E=Sophos;i="6.15,269,1739833200"; 
   d="scan'208";a="43936346"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 May 2025 14:44:27 +0200
X-CheckPoint: {681B55AB-12-C7E25413-F4312D34}
X-MAIL-CPID: 6E8B7F67FFA38057D06757D6A4063F61_4
X-Control-Analysis: str=0001.0A006398.681B55BB.0089,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C0BF21609AF;
	Wed,  7 May 2025 14:44:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1746621863;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UaNOIapp4J5KzxMU+tHJGWnVbFnnDP/ugTkRCJiT7PY=;
	b=kj0fwJqqaZdYnzp02ZZSmaFjCKy0xnCdVTH1vg3rjVYqjeGZF+pLxbMZBh4WxAsvoWwDO+
	lXU1tFBr5T71QnznSaMTc5aPiE4RR0AitCWmZRrqBw6U8emPNxOEnlPfiSzjSIr6h29cdG
	+m35eKK4OAnaBve+dKIcgugoRu1F6TAxFH/OcaRzPhS/Rvs1NJ/6wJrIASjZbipq7R9Zw/
	qh53wh3NX8PTa/UMsDL2Ja0993wOyaWxLzRzBDiWii5BH10/7RnO/9EaLYVCEjmgQqUhwH
	1H/HX5BEjlrUOCidIubhqLpR0KODCxQsOK4c3+iTJ8clmSaH5byHQguhjD7Vzg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] arm64: Kconfig: Enable PINCTRL on i.MX platforms
Date: Wed,  7 May 2025 14:44:13 +0200
Message-ID: <20250507124414.3088510-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Select PINCTRL for NXP i.MX SoCs.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/Kconfig.platforms | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index a541bb029aa4e..49c3bc25e5f68 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -219,6 +219,7 @@ config ARCH_MXC
 	select ARM64_ERRATUM_845719 if COMPAT
 	select IMX_GPCV2
 	select IMX_GPCV2_PM_DOMAINS
+	select PINCTRL
 	select PM
 	select PM_GENERIC_DOMAINS
 	select SOC_BUS
-- 
2.43.0

