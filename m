Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DA520299B
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 12:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747225214; cv=none; b=dFbIcR//HxuVL0gj91FPVD41Q426EDULOXRsp1eLUR+nJ9cYAaQeQGzw8LjsURwhETadoI/Xx21Q2ezbrKhcjTYNtVFwCAVBfshPTXE7OHN2n80lhjpq51beyfoMsoUqANz6wfaITbFijX4NHDoT8ts6mQpmT9KJVu6h2uVe9k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747225214; c=relaxed/simple;
	bh=nQujC6034IbbV1/Takj+ktYRPduuI1NiEdr6M8Bk9tM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ilV5hzRX7gwMKfwhfyU3++d14MZjo+rlUnc8ezU2UqdOVWAQS67lTSpc6L9kJ2o3duSxritxiw23rbsoFtKe2zJygabxpM9meeQRDko5oIbxYF1eiFI9cOqXwUCtA3Kby+TZw3sWlvTC9G0Qoh7mRxQi9KkSah7021225UZFByA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=Cbyiefzc; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=nCjGAj7c reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="Cbyiefzc";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="nCjGAj7c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1747225212; x=1778761212;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=UaNOIapp4J5KzxMU+tHJGWnVbFnnDP/ugTkRCJiT7PY=;
  b=Cbyiefzcu3OxiuGZ30Zub1TjDgkubV3JrdPlPsmP2mgBCWIbELQMogw8
   0xm6Dkjiriz3UhML1EbCYMz3HZaZaWwp7SFEnD3vMjYgwpyrtqbUYd1WK
   7zEWldqUDe+UTBMO0Cw3madjllbJSz5ljCZKxh2l1vKBMWkylqtU6oioP
   iy3B6M2pmzPHudAcNYHO/i77tyRGrmez68IQPIXdFmFrQa3eopw2spUZ7
   tS1VNY89tmWMVRUTQf+2JEFcSgxF1k5xb0tA9OB6QGX6029MsIS5udAht
   g2EeF3ItZP/+O+XXO5Q1ZBvD65tApS17+swPzuNeqmybZOrSoopTELySm
   Q==;
X-CSE-ConnectionGUID: HAcQnEHfShqHv1+SBVGxZw==
X-CSE-MsgGUID: mbQtCp59SpSYqWIfPy6W4A==
X-IronPort-AV: E=Sophos;i="6.15,288,1739833200"; 
   d="scan'208";a="44071281"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 14 May 2025 14:20:08 +0200
X-CheckPoint: {68248A77-2D-68AAF6F9-E177A1A4}
X-MAIL-CPID: 4549570F796F46B7B2130055CA730564_2
X-Control-Analysis: str=0001.0A006399.68248A86.0043,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 31CEC16943A;
	Wed, 14 May 2025 14:20:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1747225203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UaNOIapp4J5KzxMU+tHJGWnVbFnnDP/ugTkRCJiT7PY=;
	b=nCjGAj7cjlzcLzHErOoBUFEnftHlEuyYPnQh6/QZAJWos7YEO3xx0qhP+GkXR5Vpk3I++P
	B7An+cwjkc8gfI5EaOdToZgHZrZSHNIVJj1TeO4FjTzfljerS7JP+HDyvkFdLbX8p24r7u
	/PieN2D6UmH43MzIj94SB4bKnYbCt99J9PvZznicSq2meEpkTRiHlgf+xniIpRkHnNWJk1
	nm6PnWJ45Ei2aUIc8XpTOc4SeEptV76Fq9M+9r2U+lkI8Tt8hToHSnto8O2Wbn/KhvknJn
	h6p9vOpCI+Cdsdb+PkkCs1KbF/6tPk/5Z1btqb8ofC+Yrq0YJfUcHlVUIZHUPQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] arm64: Kconfig: Enable PINCTRL on i.MX platforms
Date: Wed, 14 May 2025 14:19:54 +0200
Message-ID: <20250514121954.707596-1-alexander.stein@ew.tq-group.com>
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

