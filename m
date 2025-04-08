Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42F0265CDA;
	Tue,  8 Apr 2025 09:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104690; cv=none; b=MQWA+LMkR7aKrr6wsKtXUAYymD24mefIvYSgl/8LI5uJJ8om54H5kFaxDTt7JHWzcf7oC26kknQ4VbYRPeP7pHHT9q2oxaxkYVyphFnkoEDUDhF6psluYeD4SIaI4q2emEdip6bQ+43fUrn0mM43a0X3QrJDDrkDFHYB6cdxjD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104690; c=relaxed/simple;
	bh=T8Graqqo8ZMahOv8qeu3j8CgtQTUdh78VYKeWT6HVpM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E4lGkv0vnR0acpu99dqaLUI5ns3RAuaCzNfUps8hsKxUOMcw1WV8IxZ0oA+6lkfNphuBfuLsdcDx7A7N717VLwbbEk44OrxknkBlbJ0JG7N3y7uCu6ZiWSvAiec1dqv65U4G6V8XtMS+4I+nC+Lvq19GTcWLo7jSb69dJmsxR9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=OpWpFEot; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=thSt+zHq reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="OpWpFEot";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="thSt+zHq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1744104688; x=1775640688;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WRswDAiOD+LBGvXy93dQk2897CsfhogQ6IW+astVOLo=;
  b=OpWpFEot79SgJV4RuJ9SB+Q4o7SUtHbuox6P+scrQ02+LO4vwHRIAd+P
   1UoVAdqZzSyknuSGrnctz+Mi3iw3eF9+Qic9heP3UreBAiaH5cpYKotqF
   dBQhwlMLD6jeGai+G89LV1NXfUqDuiZpf563mIBnFbmZCjzg2+tWJPpPg
   d0tLltQ41NiAuA9Ilwf7j9o+gfmWIJ5ap86wIRdkVW3orirAatoeJk15R
   Zsxsc5w/teaaqb8tYyZw+7ZEZZ1p7xfXR5zusmqifbsCaoQPOv2H74Ya6
   W+ARLlI6AcdWEK1WaaWhq29Wl4VQKSbAMtV1Gnjsr9lipMS18JbChC22P
   w==;
X-CSE-ConnectionGUID: 6CML3dGcQrOTskgWc0I4dw==
X-CSE-MsgGUID: JGW0LmgeQh+wLi8tP2y6MA==
X-IronPort-AV: E=Sophos;i="6.15,197,1739833200"; 
   d="scan'208";a="43397365"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 08 Apr 2025 11:31:26 +0200
X-CheckPoint: {67F4ECEE-26-2417938-F0170C2B}
X-MAIL-CPID: FE639B333D6B3657B3650F6C5D3D3014_2
X-Control-Analysis: str=0001.0A006368.67F4ECF8.009F,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 581B31697D4;
	Tue,  8 Apr 2025 11:31:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1744104682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WRswDAiOD+LBGvXy93dQk2897CsfhogQ6IW+astVOLo=;
	b=thSt+zHqDTS08DWUmgk51gxrYeIs0Sk2vyToNFp/iulsY0RdR7xZggG5l85BNzNfEqdcOR
	VjQwx6OaJe6OjaRwbK9KTdWq8IR4d8c+IHubSZ1CpjTrHnielorFYW0DQR+QcA5nLVNBKm
	c3X/dmTQvf7jk6LhI1r1fsEaeonZf2OJ3pEnBALUTC7OSvZwpl3DPOIIo0xI25I3uyV3xz
	Wfg0aOMBgirvS+FJmeTJrINrVWkKe4mQRW3lE2v21oER5/bFq7YWoXXITFtPZb1RI9mlQr
	5sZdGE7vw+HizCxZ0haVBRNFnQCQXJjfZcd5STwKsZcBzir5eLUI9bwuzyfxUw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v2 2/7] ARM: dts: ls1021a-tqmals1021a: Add vcc-supply for spi-nor
Date: Tue,  8 Apr 2025 11:30:49 +0200
Message-ID: <20250408093059.551700-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408093059.551700-1-alexander.stein@ew.tq-group.com>
References: <20250408093059.551700-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

(Q)SPI NOR flash is supplied by 3.3V. Add the corresponding supply.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a.dtsi b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a.dtsi
index f7fe8581a23fa..271001eb5ad7f 100644
--- a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a.dtsi
+++ b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a.dtsi
@@ -72,6 +72,7 @@ qflash0: flash@0 {
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <4>;
 		reg = <0>;
+		vcc-supply = <&reg_3p3v_som>;
 
 		partitions {
 			compatible = "fixed-partitions";
-- 
2.43.0

