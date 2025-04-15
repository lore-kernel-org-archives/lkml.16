Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE64027EC89
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 09:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744708293; cv=none; b=Lwb3DmvUKD3bOI2YMDQ8D62i4A8cb+XlPCwMowC5ffjUaHYT/QGpHttUB4aaPtzY/icH4iUZk3yRBtrinUbhLFACC/5LXO0zfhHQZaFYErSiF12AphnRO7ETZ0u01dmFLdZHersSxSUWoeVMQUPbQiljf8rwrko2WVI3YSvcPTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744708293; c=relaxed/simple;
	bh=MrvbtWyVcwF9RnVgOYkeHUHTLHblRw+PRJpoBp4DgXc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ujlkj4o6CzUHHxtXDUtx12/6J84nKKKpGZIvCaTGX9ZHdxShEE8hgruwvQK2g942W/ErS3/LIbtqc7etCDC1Z/kJyB9mvk9r64sy99do07aGsv82CUPV35/asj6wdpaadOTAL0gFyDbeDzkWwxt1DDHjHqygH239MUAF6th0rhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MrfYnlO7; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MrfYnlO7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744708292; x=1776244292;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MrvbtWyVcwF9RnVgOYkeHUHTLHblRw+PRJpoBp4DgXc=;
  b=MrfYnlO7H//eBnOI1mC5Oar3frpBwM44QGqo1MSCnkUwuHNSBRaWq9QA
   t2g+nc6hxhCXk2saWHUJyvrz7V6Jn/rc+aVzrwqsdqGIsKR+H2+gLhQf/
   EiT0/zYkKqWksSXG57sPnv4pxXD04FZtZkC4tVdtRDD473/H8TfJkHEX3
   ypkAMvevUf63CzbovD2nuixAa/HdeLCL1SyTN5x1O0DGUoliQ6BfvXn23
   lLMBHVi/BeKqNnscojDfMY1o1vbqbPC7tYii08XFHzMxDt69bfyq6/onb
   EseIUStk1bm0n7Ag9wZeAu5LtdFCNVGv1LXEPri13lh/mah8y8CHdoYjZ
   w==;
X-CSE-ConnectionGUID: kySe7IaNTb6tq1zYnvdmow==
X-CSE-MsgGUID: iu2FkHV/TzC8DGKJtjCaww==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="57570998"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="57570998"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 02:10:24 -0700
X-CSE-ConnectionGUID: xKnt04DHRiKMV23XT0IbeQ==
X-CSE-MsgGUID: 2e0VVgcHTFykIH7kY3WIGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="129917956"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP; 15 Apr 2025 02:10:22 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id E758917B; Tue, 15 Apr 2025 12:10:20 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] staging: rtl8723bs: Fix compilation errors for W=1 build
Date: Tue, 15 Apr 2025 12:10:19 +0300
Message-ID: <20250415091019.545905-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When building a kernel with Clang 19 the couple of warnings
become the errors (due to CONFIG_WERROR=y by default).

.../rtl8723bs/core/rtw_xmit.c:1939:13: error: variable 'drop_cnt' set but not used [-Werror,-Wunused-but-set-variable]
.../rtl8723bs/hal/hal_com.c:893:6: error: variable 'res' set but not used [-Werror,-Wunused-but-set-variable]

Fix them accordingly.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c |  9 ++-------
 drivers/staging/rtl8723bs/hal/hal_com.c   | 11 ++++-------
 2 files changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 297c93d65315..e2f7b2415524 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -1936,7 +1936,6 @@ static void do_queue_select(struct adapter	*padapter, struct pkt_attrib *pattrib
 s32 rtw_xmit(struct adapter *padapter, struct sk_buff **ppkt)
 {
 	static unsigned long start;
-	static u32 drop_cnt;
 
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
 	struct xmit_frame *pxmitframe = NULL;
@@ -1948,15 +1947,11 @@ s32 rtw_xmit(struct adapter *padapter, struct sk_buff **ppkt)
 
 	pxmitframe = rtw_alloc_xmitframe(pxmitpriv);
 
-	if (jiffies_to_msecs(jiffies - start) > 2000) {
+	if (jiffies_to_msecs(jiffies - start) > 2000)
 		start = jiffies;
-		drop_cnt = 0;
-	}
 
-	if (!pxmitframe) {
-		drop_cnt++;
+	if (!pxmitframe)
 		return -1;
-	}
 
 	res = update_attrib(padapter, *ppkt, &pxmitframe->attrib);
 
diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 1213a91cffff..d91e2461fd7e 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -890,15 +890,14 @@ static u32 Array_kfreemap[] = {
 void rtw_bb_rf_gain_offset(struct adapter *padapter)
 {
 	u8 value = padapter->eeprompriv.EEPROMRFGainOffset;
-	u32 res, i = 0;
 	u32 *Array = Array_kfreemap;
 	u32 v1 = 0, v2 = 0, target = 0;
+	u32 i = 0;
 
 	if (value & BIT4) {
 		if (padapter->eeprompriv.EEPROMRFGainVal != 0xff) {
-			res = rtw_hal_read_rfreg(padapter, RF_PATH_A, 0x7f, 0xffffffff);
-			res &= 0xfff87fff;
-			/* res &= 0xfff87fff; */
+			rtw_hal_read_rfreg(padapter, RF_PATH_A, 0x7f, 0xffffffff);
+
 			for (i = 0; i < ARRAY_SIZE(Array_kfreemap); i += 2) {
 				v1 = Array[i];
 				v2 = Array[i+1];
@@ -909,9 +908,7 @@ void rtw_bb_rf_gain_offset(struct adapter *padapter)
 			}
 			PHY_SetRFReg(padapter, RF_PATH_A, REG_RF_BB_GAIN_OFFSET, BIT18|BIT17|BIT16|BIT15, target);
 
-			/* res |= (padapter->eeprompriv.EEPROMRFGainVal & 0x0f)<< 15; */
-			/* rtw_hal_write_rfreg(padapter, RF_PATH_A, REG_RF_BB_GAIN_OFFSET, RF_GAIN_OFFSET_MASK, res); */
-			res = rtw_hal_read_rfreg(padapter, RF_PATH_A, 0x7f, 0xffffffff);
+			rtw_hal_read_rfreg(padapter, RF_PATH_A, 0x7f, 0xffffffff);
 		}
 	}
 }
-- 
2.47.2

