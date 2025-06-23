Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAC1230996;
	Mon, 23 Jun 2025 14:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750688023; cv=none; b=cHZU3AVIqqgn8RA9IEOebyVJMQqCLQAxgJlOrVvhKvrHoEkcZSIulXp5fscb0PylrnJIJb+UKQEJbYD5avUoSnsnt5cIUNa5Plb+r1PFE4tfbWzTGElChqiBVW9DmsLGdhf85Htc4uanOQZ6cuVt1aYMCkMrDZir+U0aphO05dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750688023; c=relaxed/simple;
	bh=swJp51Ns02x1J+qv7owmHtMXFS24MzyrXEjqq8+3cQ4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q0EGqu7zcGZKI9KqMM2qKVS+8sgxORioVUD30zbjvqwCgpeoVKowzT/tctUM5EXrka90eA8/vU4ZYCwAbJqyI4cjPt+IIRjsNQMp9Tor5CjEL/z//t5u2A0xlcGjw+fKMwG5bUKQD7ZS8UJAwdd+hawoFVMyx5lo/no1cFVkeUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=vMCDUPFd; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="vMCDUPFd"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55NEDbxt1572844;
	Mon, 23 Jun 2025 09:13:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750688017;
	bh=qgcwyDvjdg6gqeThBtircADvL3wWT7+Rlfxr+ZKTSHw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=vMCDUPFdGXCndJ3Pf2o8i0GWTX/u7wBgCRrqNkRKXlpQ7RY6Yp13jPnjDiLrLizx7
	 mXLNL7VwUAwGmHHbYzTtgdiUzaxTvB9/CIsepE1FKUt35nDp7Ith+1eeNXEt3POSLv
	 DI6pni6rTTRcv7E3oKPXZOYjQ+LbEJkU3yydFreM=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55NEDbkm574406
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 23 Jun 2025 09:13:37 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 23
 Jun 2025 09:13:37 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 23 Jun 2025 09:13:37 -0500
Received: from localhost (ula0502350.dhcp.ti.com [172.24.227.38])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55NEDa4e050409;
	Mon, 23 Jun 2025 09:13:37 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <khasim@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <bb@ti.com>,
        <devarsht@ti.com>
Subject: [PATCHv4 5/6] arm64: dts: ti: Update firmware-name for IPC
Date: Mon, 23 Jun 2025 19:42:52 +0530
Message-ID: <20250623141253.3519546-6-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250623141253.3519546-1-p-bhagat@ti.com>
References: <20250623141253.3519546-1-p-bhagat@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Update the firmware-name properties in the dts file to point to new IPC
firmware binaries for both the mcu-r5 and c7x core.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
index 8fde89ecba67..c98e4c98c956 100644
--- a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
@@ -487,6 +487,7 @@ &mcu_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster2 &mbox_mcu_r5_0>;
 	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
 			<&mcu_r5fss0_core0_memory_region>;
+	firmware-name = "am62d-mcu-r5f0_0-fw";
 };
 
 &c7x_0 {
@@ -495,6 +496,7 @@ &c7x_0 {
 	mboxes = <&mailbox0_cluster1 &mbox_c7x_0>;
 	memory-region = <&c7x_0_dma_memory_region>,
 			<&c7x_0_memory_region>;
+	firmware-name = "am62d-c71_0-fw";
 };
 
 &cpsw3g {
-- 
2.34.1

