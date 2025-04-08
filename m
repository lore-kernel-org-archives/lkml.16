Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030C8261380;
	Tue,  8 Apr 2025 06:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744092416; cv=none; b=WHcqfT6wWgruc78IhkQRXIFHZOg6TQvD99o4sAMTV4oy8jSYD7h8JIgChQTYKb/1ae2BcsTLaTZ+csl5usulkqGh4O+EhCkJHm+GbbI29NQCjH9nhYLHdyPYgF2hr9s6zgUjoi/UKs1uxzc4TmStR2EYP5O3VoXR+5FMTbv9SDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744092416; c=relaxed/simple;
	bh=GUuT7bTMVUKVp6dEEOPf/226ycpsaZ7FXgep5Yhrybk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M87aOG5U3AWH0JYmiUze6alrVTUUjX4wZ51nWa2MiXIbzjx78rClKTlr+yYr25toZU7XGy7rgHXvafHDw+xNGL/bZ0Faf7KopJmkw+TpK5Z5Cu3gcM4HoHQNCymmhs1YgJqHl3OsMBsy85+KN5H3lW1IPMLk3hCF6rvGXWjr6rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Vz3JrasY; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Vz3JrasY"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53866i6u588116
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 8 Apr 2025 01:06:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744092404;
	bh=YqLD2vCeiPs+6q1xuXlk8xM8QBX+ma3oG/1xC1BKk/w=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Vz3JrasYYyBxloSqBO8Q4VWSxrW+Dxx0zNBOwWFQ/fZY8PKHFaIMmDEQhjTsrr4lH
	 s+Q1AIHbGtecg0fmTVY+Ffq6IGOHy2j0bxNn1JnTaCiiA9BTZpiaIVcdbAevjde4hA
	 foYX+lVKDBQX8YAuTj5v1FkDrHRPqozfsCMlkNXI=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53866ida079146
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 8 Apr 2025 01:06:44 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 8
 Apr 2025 01:06:43 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 8 Apr 2025 01:06:44 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53866bvp080076;
	Tue, 8 Apr 2025 01:06:41 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH 1/2] arm64: dts: ti: k3-j722s-evm: Enable serdes_wiz0 and serdes_wiz1
Date: Tue, 8 Apr 2025 11:36:35 +0530
Message-ID: <20250408060636.3413856-2-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250408060636.3413856-1-s-vadapalli@ti.com>
References: <20250408060636.3413856-1-s-vadapalli@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

In preparation for disabling "serdes_wiz0" and "serdes_wiz1" device-tree
nodes in the SoC file, enable them in the board file.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j722s-evm.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
index 2127316f36a3..0bf2e1821662 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
@@ -843,6 +843,10 @@ &serdes_ln_ctrl {
 		      <J722S_SERDES1_LANE0_PCIE0_LANE0>;
 };
 
+&serdes_wiz0 {
+	status = "okay";
+};
+
 &serdes0 {
 	status = "okay";
 	serdes0_usb_link: phy@0 {
@@ -854,6 +858,10 @@ serdes0_usb_link: phy@0 {
 	};
 };
 
+&serdes_wiz1 {
+	status = "okay";
+};
+
 &serdes1 {
 	status = "okay";
 	serdes1_pcie_link: phy@0 {
-- 
2.34.1

