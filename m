Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39EA1AAA10;
	Fri, 28 Mar 2025 11:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743160504; cv=none; b=dYooMrl9IjVIKEi/mJ4FAmbJyZFTFX4QIjBWJMWDVqPJN6+kUBRxsvgNTUjLuM4MIQwYqzWqECaXHRMivcD5tnMB0xHaY6gu5tGIwgMFW9p+weFX49yjZ4lUZQA17phlmSzJf30hkVV9tHXTQ/zkHmxi4xVK8L4uJ7hWHT/+/gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743160504; c=relaxed/simple;
	bh=5c2e7RFxGmphr4QYN8PR63htK2uI66WtWzG1gxhV8KQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gVklNQCxLkTFfTHpVLLAsmyJL1WJRyDmBNo9+nVrfSWz96Sk674h9S+vsDD8xKkC3mBo14iBw2htbYR/9dvbjwTrcL1CFtvNOl1zdMy0AbtopsohtUSQTfID6EZAtB3hqxMcHr5UykP1MZWI1RGK7+FY49NWyUslC+U2G0fMf/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=j/CoxrzS; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="j/CoxrzS"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52SBEpYE2764925
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Mar 2025 06:14:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743160491;
	bh=mIw0t7Irad6cHrY25tR6Xsp0ZhDpEetGKLQiwxwdT+I=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=j/CoxrzS/TEM2Tp8Yt/1RA7MoInaFBgBDvDzFvwEWz0TZ5O46In0wp/OrMNHFVyLd
	 ZmYYU/OuGa4PadPC6fsNGjlRRvrJAuqXWF2DsLifmlnzZOgEF8u5jk8aW8eiitlRRH
	 IWAlIjWFf+ukbLjJ5MENGD8e+ohIxU6dkds9Tkl4=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52SBEpfx049909
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 28 Mar 2025 06:14:51 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 28
 Mar 2025 06:14:51 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 28 Mar 2025 06:14:50 -0500
Received: from a0497641-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (a0497641-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.69.37] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52SBEeIr029420;
	Fri, 28 Mar 2025 06:14:47 -0500
From: Neha Malcom Francis <n-francis@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>, <n-francis@ti.com>
Subject: [PATCH v2 2/2] arm64: dts: ti: k3-j784s4-main: Add PBIST_14 node
Date: Fri, 28 Mar 2025 16:44:39 +0530
Message-ID: <20250328111439.374748-3-n-francis@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250328111439.374748-1-n-francis@ti.com>
References: <20250328111439.374748-1-n-francis@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Add DT node for PBIST_14 that is responsible for triggering the PBIST
self-tests for the MAIN_R5_2_x cores.

Signed-off-by: Neha Malcom Francis <n-francis@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
index 0160fe0da983..1a26f5e4ace6 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
@@ -113,6 +113,17 @@ serdes2: serdes@5020000 {
 			status = "disabled";
 		};
 	};
+
+	bist_main14: bist@33c0000 {
+		compatible = "ti,j784s4-bist";
+		reg = <0x00 0x033c0000 0x00 0x400>,
+		      <0x00 0x0010c1a0 0x00 0x01c>;
+		reg-names = "cfg", "ctrl_mmr";
+		clocks = <&k3_clks 237 7>;
+		power-domains = <&k3_pds 237 TI_SCI_PD_EXCLUSIVE>;
+		bootph-pre-ram;
+		ti,bist-under-test = <343>, <344>, <365>, <366>;
+	};
 };
 
 &scm_conf {
-- 
2.34.1

