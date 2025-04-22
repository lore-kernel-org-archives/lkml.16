Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E681EDA33
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 12:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745325925; cv=none; b=stb4vTbJ/iQW5ZKe6aFz+/hjEl69pI0JKuqYtAissSuYcj1m/gyKvpqEKAeBSYyWGesUbEjhQRSVHtWY2GpFhyvH+XCtJ/Bb1j3RuxttTAI/DojwD4k84tsRVTTk3jf6UaNrYaw+nkwPtmEKkh3AvXVJNVDRLvJ2NGrwYq//hXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745325925; c=relaxed/simple;
	bh=DTo7fuSGfkaN6anp/V34Dsjk2CqGpbnRDvkB3JAzSws=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WNNl0xUkyaTKuDGxVy1Fn8PbKpZ1S0hP+iXkQvW5X+KgHzJnZJWciq+3EVJNwU1gyk69OtvwJNE176cNfGpgLuE7XTARlxhCad5Wd/cTMY92gcMYwqxdjabLyBQJNOJ3FG0FV3pVB2GAEatR6C0X10B0v8EnvlYSGGeSleMzylU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Zhhgy6Q3Kz2CdFF;
	Tue, 22 Apr 2025 20:41:50 +0800 (CST)
Received: from kwepemo500009.china.huawei.com (unknown [7.202.194.199])
	by mail.maildlp.com (Postfix) with ESMTPS id D9F141402C7;
	Tue, 22 Apr 2025 20:45:19 +0800 (CST)
Received: from huawei.com (10.67.174.162) by kwepemo500009.china.huawei.com
 (7.202.194.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 22 Apr
 2025 20:45:19 +0800
From: Hongbo Li <lihongbo22@huawei.com>
To: <xiang@kernel.org>, <chao@kernel.org>, <huyue2@coolpad.com>,
	<jefflexu@linux.alibaba.com>
CC: <linux-erofs@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<lihongbo22@huawei.com>
Subject: [PATCH RFC 4/4] erofs-utils: lib: remove the compile warning
Date: Tue, 22 Apr 2025 12:36:12 +0000
Message-ID: <20250422123612.261764-5-lihongbo22@huawei.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20250422123612.261764-1-lihongbo22@huawei.com>
References: <20250422123612.261764-1-lihongbo22@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemo500009.china.huawei.com (7.202.194.199)

Add the condition macro to avoid the compile warning.

Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
---
 lib/decompress.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/decompress.c b/lib/decompress.c
index 3f553a8..1e9fad7 100644
--- a/lib/decompress.c
+++ b/lib/decompress.c
@@ -9,6 +9,8 @@
 #include "erofs/err.h"
 #include "erofs/print.h"
 
+#if defined(HAVE_LIBZSTD) || defined(HAVE_QPL) || defined(HAVE_LIBDEFLATE) || \
+    defined(HAVE_ZLIB) || defined(HAVE_LIBLZMA) || defined(LZ4_ENABLED)
 static unsigned int z_erofs_fixup_insize(const u8 *padbuf, unsigned int padbufsize)
 {
 	unsigned int inputmargin;
@@ -17,6 +19,7 @@ static unsigned int z_erofs_fixup_insize(const u8 *padbuf, unsigned int padbufsi
 	     !padbuf[inputmargin]; ++inputmargin);
 	return inputmargin;
 }
+#endif
 
 #ifdef HAVE_LIBZSTD
 #include <zstd.h>
-- 
2.22.0

