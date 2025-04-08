Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467E82638B0;
	Tue,  8 Apr 2025 09:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104716; cv=none; b=aPD4UQJ6Ux7/HUW+IY42MEBDhOeEDAEDRXygTdG0QeixQ5wthdKpwysYCieNCbgSn5vxJrP9eS2k+oJlYCXjpK46nBre0/BvqHfzFpdb1jmouBekVoWSQj1E282UYx8rikiL5A+dirVpIiAQXXwMI15Cnx2B1x8rTTGDT4BXrrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104716; c=relaxed/simple;
	bh=aZIBSFALC/gWmKJb+8VewxdBOL8Dcul95zyo9NwOpdc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A8inttQDsUuBIsRMmH+HBon96znEx12ExVyjC560HnN5UOMu3FP/pADLxn11+1+cqO3nG1Zkt+K7IFmiPJI/HnB/H67USlneIqL5buUangvMahj8sV0cPEWzT0C7hWYW8pyhvishJNJlVrDMmeYHCoBR9Zzjt6q8AB0KRyYnuYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=NNPnQ4Dw; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Ra5PtcIJ reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="NNPnQ4Dw";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Ra5PtcIJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1744104714; x=1775640714;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AckmueFcdt0W23SueItleJPhRc4kKUpsswgxRfizL5o=;
  b=NNPnQ4DwkLVVdCTXtf5isgUKQwJ6s5IpqkbL77jSh4cKDnqYy+6PVWER
   G5Y9t0G7alFKmI1U+HtJtrHqf5kvzuAwLtYSR9YHAxpAf/25PaBv6MMLH
   ioIibIygLBLgsVEKUQpAEe+n4nD3pfOMGeeTGqH2wP5tPVURd5waC40pY
   fJrToLG1xbsY1olFJQSc6nkLS84bDKRoetzLw0EJhiHkOAerKK9VY8RWI
   yiKwp0RQkZv6aBY7uO+8l1N4QDAud9oaYgjR4zWM+MFrAkqgQ941VkQed
   7EeIc7FeLSxIf+QXPlUUiBwPXxHDEvonXAxZs+tASU9FBy3VcJXLpQ3Qd
   g==;
X-CSE-ConnectionGUID: 4FoT1ObOQFGxPd2lIWTCQg==
X-CSE-MsgGUID: EskZjJRaQdGXBz0LN5/6qg==
X-IronPort-AV: E=Sophos;i="6.15,197,1739833200"; 
   d="scan'208";a="43397420"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 08 Apr 2025 11:31:53 +0200
X-CheckPoint: {67F4ED09-1E-903EAEAC-E04C76C8}
X-MAIL-CPID: 98DAD71A01D231204733A360F0E25679_5
X-Control-Analysis: str=0001.0A006368.67F4ED13.004F,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E9ADC1697CE;
	Tue,  8 Apr 2025 11:31:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1744104709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AckmueFcdt0W23SueItleJPhRc4kKUpsswgxRfizL5o=;
	b=Ra5PtcIJL3Nr2bC0BZs7PGuW1Nrg7fnXJbAbgemcTjfit61ZJX2gQKIAOcGuxpFqUNvIO1
	SEGBMWGIe4e+9xoxmNhRxKWXXST6nGkRcP//hokUWpk+0aJO209salYAu5eHAbCBVrp1YG
	aHXvwyjFLj4k6v1Mvw5CID1pzCNNAlTrwv4Omfc6IXgPOTBimeaufw9GjxE9NdlXvc2mET
	wfhcnXxKY7yam0Q5ZLQIgW6ClqTauGTZncbpXepVjd31l45ssZ4PzIKYR8urK15of3TI7v
	XpQxl/mpcku8MZjLxD4qLNF1xjtNLQnuEyoWh34Q4oU72n1IvmCSizeix0CDFw==
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
Subject: [PATCH v2 7/7] ARM: dts: ls1021a-tqmals1021a: change sound card model name
Date: Tue,  8 Apr 2025 11:30:54 +0200
Message-ID: <20250408093059.551700-8-alexander.stein@ew.tq-group.com>
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

The card name for ALSA is generated from the model name string and
is limited to 16 characters. Use a shorter name to prevent cutting the
name.
MBLS1021A uses the same audio codec as most i.MX based starter kits
by TQ-Systems. Adjust the sound card model to i.MX based platforms,
as done by commit e6303798b6ac4 ("arm64: dts: imx8mp-tqma8mpql-mba8mpxl:
change sound card model name"). This allows sharing a default asound.conf
in BSP over all the kits.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts
index 80dae0c09542d..5606585dd5607 100644
--- a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts
+++ b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts
@@ -157,7 +157,7 @@ port {
 
 	sound {
 		compatible = "fsl,imx-audio-tlv320aic32x4";
-		model = "ls1021a-mbls1021a-tlv320aic32";
+		model = "tqm-tlv320aic32";
 		ssi-controller = <&sai1>;
 		audio-codec = <&tlv320aic32x4>;
 	};
-- 
2.43.0

