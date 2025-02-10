Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15621D432D;
	Mon, 10 Feb 2025 22:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739225748; cv=none; b=Sfl6iqWdkZ/yurPFsQ7vJSVxhsn3zDM3TxsGPM30O2o6oovYcBLcXoDWwEFO4hkdV8T9BEd9SkkH6paTus0F1yXpRGhHNDJeHv7X6ga3JT6fMKHxNcJ2zm9RnwzUwHfWFUF+vccovGVB5B5+84jESQoK7DpLjWotuAVgjMn1rKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739225748; c=relaxed/simple;
	bh=9olH7VrEbTqgSC9Q1/dCva+xlWScvwV57lBdUdMMcUI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IRC+y0wiMJNpYqhoGcadYwMwIpBN/ybg5VRZ1VcLq4dMM9bQ7qHv6OhoqH8Qk86c+AO9JJ6Q5QRmOXZwAV33HKpHgoz+9veRv5c9K2OvlgfxRM2hwWnGB0zNuscWsLJzzHUpu8HXHlfQwLBqadrYnft8r7+raxEjo67h9RkSRGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=n2x9bJiA; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="n2x9bJiA"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51AMFVQA3488418
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Feb 2025 16:15:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739225731;
	bh=4nb7bfHAqrLICSDYKjDqnEu9P7//d8KG5QQlegroydk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=n2x9bJiARvM9XSkDMvdzoTx390KgWRpCZPSUwYp0yQd4Tvxhb5Xwg5fylhYmrrXSM
	 XWKjUlEqfQuLk4dBXmbhCL9jyrt/M5KYo2r+vKnx4iZhzURfeeTQ8V+tAOcd/SdzVd
	 wtvykT7CbjGCjzdS5DEBcatJy6a84uV8MRtImnXw=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51AMFVI6113607
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 10 Feb 2025 16:15:31 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 10
 Feb 2025 16:15:30 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 10 Feb 2025 16:15:30 -0600
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51AMFUZ6112628;
	Mon, 10 Feb 2025 16:15:30 -0600
From: Judith Mendez <jm@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Andrew Davis
	<afd@ti.com>,
        Hari Nagalla <hnagalla@ti.com>, Judith Mendez <jm@ti.com>
Subject: [PATCH v5 04/10] arm64: dts: ti: k3-am62a-main: Add C7xv device node
Date: Mon, 10 Feb 2025 16:15:24 -0600
Message-ID: <20250210221530.1234009-5-jm@ti.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250210221530.1234009-1-jm@ti.com>
References: <20250210221530.1234009-1-jm@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

From: Jai Luthra <j-luthra@ti.com>

AM62A SoCs have a C7xv DSP subsystem with Analytics engine capability.
This subsystem is intended for deep learning purposes. Define the
device node for C7xv DSP.

Signed-off-by: Jai Luthra <j-luthra@ti.com>
Signed-off-by: Hari Nagalla <hnagalla@ti.com>
Signed-off-by: Judith Mendez <jm@ti.com>
---
Changes since v4:
- No change
---
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
index a1daba7b1fad5..f6ebc4eabaf14 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
@@ -1123,6 +1123,18 @@ vpu: video-codec@30210000 {
 		power-domains = <&k3_pds 204 TI_SCI_PD_EXCLUSIVE>;
 	};
 
+	c7x_0: dsp@7e000000 {
+		compatible = "ti,am62a-c7xv-dsp";
+		reg = <0x00 0x7e000000 0x00 0x00100000>;
+		reg-names = "l2sram";
+		ti,sci = <&dmsc>;
+		ti,sci-dev-id = <208>;
+		ti,sci-proc-ids = <0x04 0xff>;
+		resets = <&k3_reset 208 1>;
+		firmware-name = "am62a-c71_0-fw";
+		status = "disabled";
+	};
+
 	e5010: jpeg-encoder@fd20000 {
 		compatible = "ti,am62a-jpeg-enc", "img,e5010-jpeg-enc";
 		reg = <0x00 0xfd20000 0x00 0x100>,
-- 
2.48.0

