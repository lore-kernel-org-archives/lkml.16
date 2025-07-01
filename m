Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF5E27F4D5;
	Tue,  1 Jul 2025 17:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.144.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751392582; cv=none; b=UKt7y76Z5UElwRSmnN6yJUz3hB40n3KcBciy8mczEdm12kXJgierP1ffC6AsJZFhbGGMM0opeBppC1iSVF6cxnUio/omFFF4ZUE1OZZnGG2c6cOWUpIgJ4mJTppDV1VxCjMdFBBVt54b1rA1PWD7RoVYpygdPdcrXAXE4MYhtHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751392582; c=relaxed/simple;
	bh=wLXAaiC0Gi5y0soIy8yfo2U59MIViibgMdGokCZf+80=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qp1Kb5DAK6/nRVFGGhdutQHsDkP1dEkMs1L5aoq5Y1htFSRqqphYXnnL2nlctUMfclf4S3tubmuQ8dz8E2jMkmvueMejk85rhaFAtle4LagS6jf87veeHcHQF7Yz8zfyJl+TQQjsMWIxCKDsATF96R54bdvKSACX4H+IXW4d2Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=YhpuyuoU; arc=none smtp.client-ip=192.19.144.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="YhpuyuoU"
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 4D2D6C002100;
	Tue,  1 Jul 2025 10:56:14 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 4D2D6C002100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1751392574;
	bh=wLXAaiC0Gi5y0soIy8yfo2U59MIViibgMdGokCZf+80=;
	h=From:To:Cc:Subject:Date:From;
	b=YhpuyuoUPUU184FbdvQ56Wj9cnVDY3rZ3s7kFv6nUV+LBvtEzFBsQ74CQCrsAWZFv
	 XXrlmoSUP+FYqaw9f+LKZWhxd+2RVoR04s4kRNRs2fY1Y/X9WdIhZybjVS3oyCJKNL
	 eiPR+5mc3kZp5U3U8UaQTcPWkzAoFdP3lkJpcqkI=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id D653D1800051E;
	Tue,  1 Jul 2025 10:55:43 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	kernel test robot <lkp@intel.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: broadcom: Fix bcm7445 memory controller compatible
Date: Tue,  1 Jul 2025 10:55:38 -0700
Message-ID: <20250701175538.1633435-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The memory controller node compatible string was incompletely specified
and used the fallback compatible. After commit 501be7cecec9
("dt-bindings: memory-controller: Define fallback compatible") however,
we need to fully specify the compatible string.

Fixes: 501be7cecec9 ("dt-bindings: memory-controller: Define fallback compatible")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202507011302.ZqNlBKWX-lkp@intel.com/
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm/boot/dts/broadcom/bcm7445.dtsi | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm7445.dtsi b/arch/arm/boot/dts/broadcom/bcm7445.dtsi
index 5ac2042515b8..c6307c7437e3 100644
--- a/arch/arm/boot/dts/broadcom/bcm7445.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm7445.dtsi
@@ -237,7 +237,8 @@ memc@0 {
 			ranges = <0x0 0x0 0x80000>;
 
 			memc-ddr@2000 {
-				compatible = "brcm,brcmstb-memc-ddr";
+				compatible = "brcm,brcmstb-memc-ddr-rev-b.1.x",
+					     "brcm,brcmstb-memc-ddr";
 				reg = <0x2000 0x800>;
 			};
 
@@ -259,7 +260,8 @@ memc@80000 {
 			ranges = <0x0 0x80000 0x80000>;
 
 			memc-ddr@2000 {
-				compatible = "brcm,brcmstb-memc-ddr";
+				compatible = "brcm,brcmstb-memc-ddr-rev-b.1.x",
+					     "brcm,brcmstb-memc-ddr";
 				reg = <0x2000 0x800>;
 			};
 
@@ -281,7 +283,8 @@ memc@100000 {
 			ranges = <0x0 0x100000 0x80000>;
 
 			memc-ddr@2000 {
-				compatible = "brcm,brcmstb-memc-ddr";
+				compatible = "brcm,brcmstb-memc-ddr-rev-b.1.x",
+					     "brcm,brcmstb-memc-ddr";
 				reg = <0x2000 0x800>;
 			};
 
-- 
2.43.0

