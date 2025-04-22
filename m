Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D386327CCD3;
	Tue, 22 Apr 2025 12:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745323266; cv=none; b=YwCNesyCgwAkhQ4SqV3IBNdx4H6SUpoLw8pLGIZ+0MLDuz+BbqY4UqRQKLPCC1zQlhNe3t+DHHE1INQN2d+RH9CN4rBQm/bjAfd3Ro37ymTs+ZmLDBmAwkRNx3MRbYiV8FgYBYDf6TkjEHWInrM1sSg0JHXZpnDOe/fI9qc0Usk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745323266; c=relaxed/simple;
	bh=K6+K5GTmjQh2i5UHfh1oE6JyV1gjbp2jd6Crqz9M6uU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EfNhaLUiU+xea2SFEr9vJd2JoB8qE5/m/eJ9zZ48QQvjaYpGvUg6ubSJQv6fEe5pEHr/OjLqFjccn3MSKv/JyossrwoAavlrxojyigjmbh22zl1Ikrq3Xf583oRrq8XGI/egympbuvSIuu17cy4GzYSXCw0H/obuU0H+k7phLEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=p0efe0ht; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="p0efe0ht"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53MC0wLt1937099
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 07:00:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745323258;
	bh=Cp7CugV3E71KCFTsfKY0RoJeakadhrjoUilMuFvJ6dI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=p0efe0htBHs8bzFh8dv9iC13cynBVS2+98HFBeKonfkrrCj8CDxnurhKcker1UxSx
	 eYJvyIZiKdAs0Nmi2g+fj37V5LYvhv+XQ7tOH3aNSG6wv4dhDfgsyIUUHmYug83qby
	 zLr4I8TcMjSyy3gGt0ye8dBJBYt4ghMYWXksBqMM=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53MC0wOU130736
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Apr 2025 07:00:58 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 22
 Apr 2025 07:00:58 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 22 Apr 2025 07:00:58 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53MC0hW0094623;
	Tue, 22 Apr 2025 07:00:54 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <u-kumar1@ti.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH v2 3/7] arm64: dts: ti: k3-j721e: add ranges for PCIe0 DAT1 and PCIe1 DAT1
Date: Tue, 22 Apr 2025 17:30:38 +0530
Message-ID: <20250422120042.3746004-4-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250422120042.3746004-1-s-vadapalli@ti.com>
References: <20250422120042.3746004-1-s-vadapalli@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

The PCIe0 DAT1 and PCIe1 DAT1 are 4 GB address regions in the 64-bit
address space of the respective PCIe Controllers. Hence, update the
ranges to include them.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

Link to v1 patch:
https://lore.kernel.org/r/20250417120407.2646929-4-s-vadapalli@ti.com/
Changes since v1:
- Fixed the 'ranges' to set the size as 4 GB instead of the incorrect
  value of 128 MB.

Regards,
Siddharth.

 arch/arm64/boot/dts/ti/k3-j721e.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e.dtsi b/arch/arm64/boot/dts/ti/k3-j721e.dtsi
index a7f2f52f42f7..b6e22c242951 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e.dtsi
@@ -126,6 +126,8 @@ cbass_main: bus@100000 {
 			 <0x00 0x10000000 0x00 0x10000000 0x00 0x10000000>, /* PCIe DAT */
 			 <0x00 0x64800000 0x00 0x64800000 0x00 0x00800000>, /* C71 */
 			 <0x00 0x6f000000 0x00 0x6f000000 0x00 0x00310000>, /* A72 PERIPHBASE */
+			 <0x40 0x00000000 0x40 0x00000000 0x01 0x00000000>, /* PCIe0 DAT1 */
+			 <0x41 0x00000000 0x41 0x00000000 0x01 0x00000000>, /* PCIe1 DAT1 */
 			 <0x44 0x00000000 0x44 0x00000000 0x00 0x08000000>, /* PCIe2 DAT */
 			 <0x44 0x10000000 0x44 0x10000000 0x00 0x08000000>, /* PCIe3 DAT */
 			 <0x4d 0x80800000 0x4d 0x80800000 0x00 0x00800000>, /* C66_0 */
-- 
2.34.1

