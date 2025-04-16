Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84032220685;
	Wed, 16 Apr 2025 06:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744783685; cv=none; b=ihM6uqCqE6ouA3SrWi665Ik7QfXjDUK//LhdGVu2jQAe9RfvetO6rr50glg81YOrB32Es6bG9ITN8ByW4ISuV8FIcXz4NMz0XVzwG1dCARaqSOlL7axEa/hcLcNpILOoVpjHxUftJHbcpwkN6qZt/3h/GjKahktcmLrkGcR0E7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744783685; c=relaxed/simple;
	bh=689DVZAZIVgk+WY6UuyIP7NgWCzPurdNmOXwm/A8ut8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uA4/HchC697OjUDvYGXRyKqfZAzdD6T2Oai26bdiIi23+g8B9vAUxemdJKyyiac82JYHoDwl+tKNam0oNaDBo6wGBJc9/ppERJFD7kPX/nyoQv0DSf+Pi8QyiuKrdmY9zSz3t9KtyAPIbIfa5W14agoPaZ0xWImxIiagwW0xmtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Bf+n3m6/; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Bf+n3m6/"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53G67wIU238064
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 01:07:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744783678;
	bh=Rekte+N3RPXLXmzmpCOaS5XD2YPDyBRYqwD4rqifLzA=;
	h=From:To:CC:Subject:Date;
	b=Bf+n3m6/zCwN5QuosMuPbK3KXNNeIsDuvAjo+gbr1l9vPOh8meXpmi6auTsF21rcq
	 SfGAKu65pxKPtiRU41jWuj0VScpsOIpieOeGweQaLhNPRKM6Ypz7ba80tvKGJMjeJ2
	 n4C51A99CUV2q0HT8jhhakY5u2lAiLnOIESayUwY=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53G67vsD081089
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 16 Apr 2025 01:07:57 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 16
 Apr 2025 01:07:57 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 16 Apr 2025 01:07:57 -0500
Received: from a-dutta.dhcp.ti.com (a-dutta.dhcp.ti.com [172.24.227.92])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53G67tta080937;
	Wed, 16 Apr 2025 01:07:56 -0500
From: Anurag Dutta <a-dutta@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] arm64: dts: ti: k3-j721e-som-p0: Add bootph-all to HBMC node
Date: Wed, 16 Apr 2025 11:37:54 +0530
Message-ID: <20250416060754.2393701-1-a-dutta@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Add bootph-all to HBMC controller node for successful hyperflash
boot on j721e-evm

Signed-off-by: Anurag Dutta <a-dutta@ti.com>
---
Test log : https://gist.github.com/anuragdutta731/103e84e84f013093fa089803719d997d

Changelog : v1:
1. Added bootph-all to hbmc node in k3-j721e-som-p0.dtsi
2. Removed bootph-all from v1 patch from flash@0,0 node

Link to v1 : https://lore.kernel.org/all/20250411082637.2271746-1-a-dutta@ti.com/

 arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi
index 0722f6361cc8..5665b9490003 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi
@@ -440,6 +440,7 @@ &hbmc {
 	pinctrl-0 = <&mcu_fss0_hpb0_pins_default>;
 	ranges = <0x00 0x00 0x05 0x00000000 0x4000000>, /* 64MB Flash on CS0 */
 		 <0x01 0x00 0x05 0x04000000 0x800000>; /* 8MB RAM on CS1 */
+	bootph-all;
 
 	flash@0,0 {
 		compatible = "cypress,hyperflash", "cfi-flash";
-- 
2.34.1

