Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3626215FD13
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 06:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738911098; cv=none; b=okOO1ZpZxPr7YIL1YnLfXqx3FWQjb++oY2cdHD6+ot6xDtk/KK8PazhCNWVbMK2W0GwWVw939QUJju852lW1ovQzAduhV8zpRTW01ULEWvtQo8+GlzuHRBPCLD17NZaSYueciyZIgltUnFhO7uBJ6nZxDSuN7HrUdwflUPTaba8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738911098; c=relaxed/simple;
	bh=J5EvIBkpfYwy4ghAD/3NeXxP0S1c6oS/QuQFHDRb8jw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oNzdbmAdaqcKuwS0aSZZGfdbeat3ZAUCRAbcxoH6+jH3cSxmLjOXeEXY/4QvoapxgSy93kHtwIuie0ZktA2+f0dazn1/E5a1hEQPzY7UoCSPu2P8r2MDXq15e1w4R4ZdvW7k3YwhvgLFPDclwuu71Mxj0FFZh8CaDjyE22K77oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=x4uN012B; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="x4uN012B"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5176pS6F3777752
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 7 Feb 2025 00:51:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738911088;
	bh=yEy4iUEQRwnQgoFRJSbVa2XrH/UVGGcgBH3QNERPzdM=;
	h=From:To:CC:Subject:Date;
	b=x4uN012BIh7LsG+twhT0FOQ+32fYslGI/rGRtOs5sJJpiYgkSi11ddWrts5UovQ9f
	 kYEyNwuKYG60eCJjIBYHbkpZMc8T4Yghb7Auilz0ofRlfvxrLO62cbSwwnuaZbRkrR
	 aK887DEHLHSpWfvemLOTq4KDO3JnW9EquFBETP/Y=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5176pSxn032038
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 7 Feb 2025 00:51:28 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 7
 Feb 2025 00:51:27 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 7 Feb 2025 00:51:27 -0600
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.104])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5176pOX8077856;
	Fri, 7 Feb 2025 00:51:25 -0600
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <u-kumar1@ti.com>, <vigneshr@ti.com>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH] soc: ti: k3-ringacc: include platform_device header
Date: Fri, 7 Feb 2025 12:21:23 +0530
Message-ID: <20250207065123.879863-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Users of "k3-ringacc" APIs may not necessarily be platform devices. Such
users therefore will not include "platform_device.h", resulting in
compilation warnings for the APIs declared in "k3-ringacc.h" which assume
inclusion of "platform_device.h" by its users.

Fix the compilation warnings by including the "platform_device" header
file, which should ideally have been included since commit under Fixes.

Fixes: d782298c6f6b ("soc: ti: k3-ringacc: add AM64 DMA rings support.")
Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

Hello,

This patch is based on commit
bb066fe812d6 Merge tag 'pci-v6.14-fixes-2' of git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci
of Mainline Linux.

Regards,
Siddharth.

 include/linux/soc/ti/k3-ringacc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/soc/ti/k3-ringacc.h b/include/linux/soc/ti/k3-ringacc.h
index 39b022b92598..6bbb58068048 100644
--- a/include/linux/soc/ti/k3-ringacc.h
+++ b/include/linux/soc/ti/k3-ringacc.h
@@ -8,6 +8,7 @@
 #ifndef __SOC_TI_K3_RINGACC_API_H_
 #define __SOC_TI_K3_RINGACC_API_H_
 
+#include <linux/platform_device.h>
 #include <linux/types.h>
 
 struct device_node;
-- 
2.43.0

