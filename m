Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AAAB224B12;
	Thu,  6 Feb 2025 23:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738885930; cv=none; b=hnTM9Cp/lj7giEloPbImf4Bw9cHjS3TUN/+u5POTbco26LObUQntoA8ZCl/tdVwFPhIW3QQbEOCbaiz8eTRRI60pVciUdYUdHjPnNm7iW2adum24BgUO2I19MtYWVdVS2jHv2QK57wGu76E6UyL/OWuh0sW+HBzsb944vl0LH1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738885930; c=relaxed/simple;
	bh=GsHIkMOuGCjJxEvY+F789o8gz9LbTW0OyAT6badSL28=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K1ndzkAKUyhiQSlIK5votSq8GJtpUjdWRQeOYeVg/2iQ7tfEd5Q/jWLZ6fnY8RF7pvvQ02qLb8BdLhSaAIL8jBR7IFadu5ZPRPS6rKUVe1IL6nS20NdCFICa7ASjFvvwuxG5vJHPGp0K5ozhjYmR9Vphl/LDhmx9N29+LwkcVT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=txwHdXJ4; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="txwHdXJ4"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 516Nq16u3642675
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Feb 2025 17:52:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738885921;
	bh=7qwbmdEpjuUvEJ9zZbBb6m11hhz/AufPH/BP4AJH1mM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=txwHdXJ44a8ebYQb2t67D2TCQUhvHeHIhJp5K6EbnRMJNbBh+DjQRNPnAH0Uzlx38
	 dF+BlkQx/ZmRcFyMb8h8VfAj4N9WOtqLhjLmYLVCKKrXrZpgbZFBDCG3Z5uT42Dv7e
	 4us7Q5o9yvJYAyQwXFuplbZ2VcVcAIfx1eoE2/jI=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 516Nq1ml026291
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 6 Feb 2025 17:52:01 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 6
 Feb 2025 17:52:00 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 6 Feb 2025 17:52:00 -0600
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 516Nq0vK021560;
	Thu, 6 Feb 2025 17:52:00 -0600
From: Judith Mendez <jm@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Andrew Davis
	<afd@ti.com>,
        Hari Nagalla <hnagalla@ti.com>, Judith Mendez <jm@ti.com>
Subject: [PATCH v4 9/9] arm64: dts: ti: k3-am62a7-sk: Reserve main_rti4 for C7x DSP
Date: Thu, 6 Feb 2025 17:51:59 -0600
Message-ID: <20250206235200.3128163-10-jm@ti.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250206235200.3128163-1-jm@ti.com>
References: <20250206235200.3128163-1-jm@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

From: Hari Nagalla <hnagalla@ti.com>

The main rti4 watchdog timer is used by the C7x DSP, so reserve the
timer in the linux device tree.

Signed-off-by: Hari Nagalla <hnagalla@ti.com>
Signed-off-by: Judith Mendez <jm@ti.com>
---
Changes since v3:
- No change
---
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index f03b06b7de51d..ffa437873f6d1 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -820,3 +820,8 @@ &c7x_0 {
 			<&c7x_0_memory_region>;
 	status = "okay";
 };
+
+/* main_rti4 is used by C7x DSP */
+&main_rti4 {
+	status = "reserved";
+};
-- 
2.48.0

