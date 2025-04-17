Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4CD206F18
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 08:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744879762; cv=none; b=iL0TNUIAIwFnXXWFoVG1iKK15VXWdRkkxIuKyoEx0tWbG/IgEZZ9IkWa4NtsrZRNnUnF4lgEYPu9drHHJUCzLUWdo8yAEy1Lv1M7Qz6OMa83SnNtsnraIHN3mbyrH2niXj824TPAP9n4aJD5CD1+a8wCRy5qLcJ1AJZUp/w0h/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744879762; c=relaxed/simple;
	bh=lwFT2om0gA0NMLnET6K2sX/lZXnSg1xuKywK/RoGYwY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=V7wqHTamR8yRDaBHjMAXqZPOvJDCGKESphmbWiBsPtNZjmEVuIOF/N02SD3gZK10InoAq6RpdlLvBTbglrc9SUXYcqPXaCHVDBRxFoDh8CNgpWvr4UVA1/HWodIaXMPpEFGpl+vY1B1mQNG8qrRpd0AIhrWhWbkGisjGdXrFe4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=BQ+wC7Fc; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="BQ+wC7Fc"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53H8n9wE585312
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 03:49:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744879749;
	bh=fDmzne7+xTc8To/XJ2g3KJqulYJmb1DMD0eRayD9sOA=;
	h=From:To:CC:Subject:Date;
	b=BQ+wC7FcKGIUtIX4J0WfiJtmZ9CCnlta4k14Nap1Bn3AnvG7MjYG+Yj7Kqst7WgBB
	 efBoRNcQM71xHjrMSepivZCShTVNPzluKlqmEU8xjPB0VaKDhieHZLg+NWzemAfFHE
	 4zpbVkI3x35gvn0YIhj23FO77NkXxJi73SzhOxu4=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53H8n9tf081642
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Apr 2025 03:49:09 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 17
 Apr 2025 03:49:08 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 17 Apr 2025 03:49:08 -0500
Received: from uda0132425.dhcp.ti.com (dhcp-10-24-69-185.dhcp.ti.com [10.24.69.185])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53H8n6LK046219;
	Thu, 17 Apr 2025 03:49:06 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, <bb@ti.com>
Subject: [PATCH] soc: ti: k3-socinfo: Add JTAG ID for AM62LX
Date: Thu, 17 Apr 2025 14:19:03 +0530
Message-ID: <20250417084904.2869369-1-vigneshr@ti.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Add JTAG ID information for AM62Lx SoC so as to enable SoC detection in
kernel.

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 drivers/soc/ti/k3-socinfo.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/ti/k3-socinfo.c b/drivers/soc/ti/k3-socinfo.c
index 704039eb3c07..d716be113c84 100644
--- a/drivers/soc/ti/k3-socinfo.c
+++ b/drivers/soc/ti/k3-socinfo.c
@@ -43,6 +43,7 @@
 #define JTAG_ID_PARTNO_AM62AX		0xBB8D
 #define JTAG_ID_PARTNO_AM62PX		0xBB9D
 #define JTAG_ID_PARTNO_J722S		0xBBA0
+#define JTAG_ID_PARTNO_AM62LX		0xBBA7
 
 static const struct k3_soc_id {
 	unsigned int id;
@@ -58,6 +59,7 @@ static const struct k3_soc_id {
 	{ JTAG_ID_PARTNO_AM62AX, "AM62AX" },
 	{ JTAG_ID_PARTNO_AM62PX, "AM62PX" },
 	{ JTAG_ID_PARTNO_J722S, "J722S" },
+	{ JTAG_ID_PARTNO_AM62LX, "AM62LX" },
 };
 
 static const char * const j721e_rev_string_map[] = {
-- 
2.49.0

