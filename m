Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6412218AAD;
	Thu, 27 Mar 2025 14:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743086513; cv=none; b=EteQRMqnMQANAjailLGVdKSLw9a3X+fCv7wuSFVakGai4HMr6ngPb+CnBTcYE8tWEFphLr2q0XVGOxwuKS40tRBCDTfAKjXMLTsPXlegPEzxI2aFHcP0wa4io4G20avaTNU7Vrg7huLp3H60Gi4cogG3DY7X+DlpD78wC4T3tsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743086513; c=relaxed/simple;
	bh=29sdMmGop/otbD2K2Jn6lNeHu30luS43fwSNu5UlUy4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JN5o3l9ruXXRZt51vgUWudwxLCMUQwo2ZqvGJObZ3QJF/+Lqal5pX1IpoQEBxCtw1zAfMPvarMLE28BxxdsKFMetmKEBW21G/RVsv3wDSScb67hw3gDCtfGYG5Rt1T9/BwEX3RU1uAgknYGulhe8on+1Ogo5YBoS7LTR6hkqP3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=IluXuIIa; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=R0LhL3U6 reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="IluXuIIa";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="R0LhL3U6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1743086511; x=1774622511;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nggONBo+Nu5Xu61zP6mZqv33pLi6z3i+lgbMAD7phts=;
  b=IluXuIIaxQ9pHHiDklKeTBatfo6CdODebluVScp9WjRQAC8cMZTgh1hy
   sYOR0kE35OykxEmmsCF5H06FmXi8GNzPKGNqBpDT14le+fxtWn2trEge0
   9DSenhq61aLPX4Oye3T9X+fCW6Y6XXKw6qOh9+FZQ9jsjEWqEK1CtIXrr
   v9eHqSQuI/IAtdcBES7jlFQQ8HovqBYFN63I+9J9p+u4k6F/D3J2Sx7gT
   Dc/knrkmqLGbgMcxdANcqdvupOvp8lG5l9v26by0ztR4swzWMvn3wVo07
   umUBc+8DC95RoWqzJbx19k8ni8XNPZ1sSQP80J1bEypMEYAN6zibGVXQC
   A==;
X-CSE-ConnectionGUID: dhs2rlBjRTaogcfyJDEnKQ==
X-CSE-MsgGUID: ZjLvP4viR1GPA7xH7QeG4A==
X-IronPort-AV: E=Sophos;i="6.14,280,1736809200"; 
   d="scan'208";a="43199512"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 27 Mar 2025 15:41:47 +0100
X-CheckPoint: {67E563AB-1D-F35B2447-E1635CDE}
X-MAIL-CPID: 7DA52DD0322B0439F5AA4E8A260EBC7A_1
X-Control-Analysis: str=0001.0A006375.67E563A3.003D,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 35E7516C181;
	Thu, 27 Mar 2025 15:41:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1743086503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nggONBo+Nu5Xu61zP6mZqv33pLi6z3i+lgbMAD7phts=;
	b=R0LhL3U6QHWSBt9GtlhB2EG6LSTR55m/uDAU9doP1Cl1+0uKCIYbD+J4hR365hScLIzDCm
	DU+PLGCHJ7+r0NPHqQxQH93qFiaUuWJeZGzmHGSauVj6B2wFuljGuwllzTLI4VrfQe/GDb
	b9Pm9w6oBBMsfLw6C3DpB06tNw0aVPKUf/3gzHEvX2c/iahorq+bl+VQdKE0TTC3k5Yi0Y
	BCsCr4n7pIJkcHv6z1aSLz1e882hZahb0678ZyOEMLUzMnpvoDm/8sxeo7qak+tBUn6pnW
	Po/xaN3n+Xx90oVAmbnog1qsoDfaXLMF9epU4/5awONigVpldx5nR/AYkD1kBA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] ARM: dts: ls1021a-tqmals1021a: Add vcc-supply for spi-nor
Date: Thu, 27 Mar 2025 15:41:08 +0100
Message-ID: <20250327144118.504260-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250327144118.504260-1-alexander.stein@ew.tq-group.com>
References: <20250327144118.504260-1-alexander.stein@ew.tq-group.com>
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

