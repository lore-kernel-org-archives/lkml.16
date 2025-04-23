Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194BA1DF99C
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 03:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745378254; cv=none; b=MT0m1Se3t4ybCBY6FH66XdrnYJs33gDmFEwYGfvcnOZmXpGvt+38/jB+/BjeiOwc1uk2uezcl/AtCRHXYI2SJ5qAGnYECrKgsOBxD9/Uq7/odKHs6oSqvsFQ6HcKC/EKLlEfdSkGrp6ITjQFYUz25l4Og4GBqpz9P2k+9p2lNTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745378254; c=relaxed/simple;
	bh=eG6ycAa7NBOPsjEEV+WJiptwju/2i4Xrk8cvIX0xoSE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IYWrY7vKtPUKC/NVzf6p2V0eO42Rhnd3ZQCDWcopR0Tr92HJ6H6km7yyvCqadt7VLRSKb6wBxbInXElOUSrzATK2EAfRMJwm1XYGQtDsQ+IIDCUWJa8WDbeI9wEhMIV5hQ88U8UXEGwpQ18XPoUfR08SAUsiJpyaacUSmQXgA40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 716836061ff111f0a216b1d71e6e1362-20250423
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NO_NAME, HR_CTE_8B, HR_CTT_MISS
	HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_DIGIT_LEN, HR_FROM_NAME
	HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM
	HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_AS_FROM, HR_TO_COUNT
	HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED
	SA_TRUSTED, SA_EXISTED, SN_TRUSTED, SN_EXISTED, SPF_NOPASS
	DKIM_NOPASS, DMARC_NOPASS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:a0d30755-553e-4842-824b-330d8912cd9c,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:5,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:30
X-CID-INFO: VERSION:1.1.45,REQID:a0d30755-553e-4842-824b-330d8912cd9c,IP:0,URL
	:0,TC:0,Content:0,EDM:25,RT:0,SF:5,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:30
X-CID-META: VersionHash:6493067,CLOUDID:728ee8205c975f1b53505baf479af89f,BulkI
	D:25042311171278DQA7VL,BulkQuantity:0,Recheck:0,SF:19|66|72|78|81|82|102,T
	C:nil,Content:0|50,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:
	nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FSD
X-UUID: 716836061ff111f0a216b1d71e6e1362-20250423
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1997864223; Wed, 23 Apr 2025 11:17:09 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: xiaopei01@kylinos.cn
Cc: andriy.shevchenko@linux.intel.com,
	john.g.garry@oracle.com,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	xiaopeitux@foxmail.com,
	xuwei5@hisilicon.com
Subject: [PATCH v3 1/2] bus: hisi_lpc: clean up included headers
Date: Wed, 23 Apr 2025 11:17:04 +0800
Message-Id: <33d8773f299fa6e448409625b4fb717f66f639e9.1745377493.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1745377493.git.xiaopei01@kylinos.cn>
References: <cover.1745377493.git.xiaopei01@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Revise header inclusions to improve code organization and build hygiene:

1. Remove unnecessary headers:
   - console.h (no console related functions)
   - of.h (OF specific code handled by of_platform.h)
   - pci.h (no PCI dependencies)
   - slab.h (no memory allocation helpers used)

2. Add required headers:
   - bits.h for bit manipulation macros
   - err.h for error handling helpers
   - ioport.h for I/O resource management
   - property.h for device property interfaces
   - spinlock.h for locking primitives
   - types.h for explicit type definitions
   - asm/byteorder.h for endianness handling

Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
changes in v3: according to Andy Shevchenko's suggestion.
changes in v2: fix build error 
---
 drivers/bus/hisi_lpc.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/bus/hisi_lpc.c b/drivers/bus/hisi_lpc.c
index 53dd1573e323..4911afdac316 100644
--- a/drivers/bus/hisi_lpc.c
+++ b/drivers/bus/hisi_lpc.c
@@ -7,17 +7,22 @@
  */
 
 #include <linux/acpi.h>
-#include <linux/console.h>
+#include <linux/bits.h>
 #include <linux/delay.h>
+#include <linux/err.h>
 #include <linux/io.h>
+#include <linux/ioport.h>
 #include <linux/logic_pio.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/of_platform.h>
-#include <linux/pci.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/serial_8250.h>
-#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
+
+#include <asm/byteorder.h>
 
 #define DRV_NAME "hisi-lpc"
 
-- 
2.25.1

