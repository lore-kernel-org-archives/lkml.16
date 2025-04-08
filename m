Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1221A8F7F;
	Tue,  8 Apr 2025 03:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744083202; cv=none; b=jdM43vVYkY4JBDQNa7iGLxqM/K0fTUMlsWckrsE1mq5a8Uaf/v+tlrLiKscxjx5c8m39OPoXyjoLSidvh+AnTGAjQktDxHJz9nNEHVz8uyd2uMIad9EfyTK74symeYFVvDv+3z3YLV+AYVVOAVGVQIrPW1mcRRwJOi3X4duFRNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744083202; c=relaxed/simple;
	bh=kzUE0pCrzs0/zsHKx2TxeZ5TwBd3IKFaauPSw3FbeNs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hcZha3Cd6QZw3VgQdxk24IwyuPzpvyOxRAt3M6pAqXOtQSL7ySCVliMc+r0xGsf9V7SXZUTNOWeJvJhtL8/hl2KK9+wlymjmx05PYC24OJ+S3WjNkqMu05bmRgy+5mh0sioviZhXtcrXK9JZWcue73c4fFluo0gAA7zBi9d/jeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hisilicon.com; spf=pass smtp.mailfrom=hisilicon.com; arc=none smtp.client-ip=45.249.212.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hisilicon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hisilicon.com
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4ZWrl41h9Zz27hgl;
	Tue,  8 Apr 2025 11:13:52 +0800 (CST)
Received: from dggpemf500008.china.huawei.com (unknown [7.185.36.156])
	by mail.maildlp.com (Postfix) with ESMTPS id 0B99014022E;
	Tue,  8 Apr 2025 11:13:12 +0800 (CST)
Received: from huawei.com (10.189.179.16) by dggpemf500008.china.huawei.com
 (7.185.36.156) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 8 Apr
 2025 11:13:11 +0800
From: Xiquan Zhang <zhangxiquan@hisilicon.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <corbet@lwn.net>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] Documentation (arm64):Advanced SIMD and floating point support condition
Date: Tue, 8 Apr 2025 11:13:09 +0800
Message-ID: <20250408031309.2095-1-zhangxiquan@hisilicon.com>
X-Mailer: git-send-email 2.45.1.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemf500008.china.huawei.com (7.185.36.156)

From: zhangyu <zhangyu550@huawei.com>

Because the kernel code cannot be started from el1
according to the booting.rst.
It is found that CPTR_EL2.FPEN is not configured.
After the configuration, the problem is solved.

Signed-off-by: zhangyu <zhangyu550@huawei.com>
Signed-off-by: zhangxiquan <zhangxiquan@hisilicon.com>
---
 Documentation/arch/arm64/booting.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
index dee7b6de864f..ccefc42b51bc 100644
--- a/Documentation/arch/arm64/booting.rst
+++ b/Documentation/arch/arm64/booting.rst
@@ -309,6 +309,7 @@ Before jumping into the kernel, the following conditions must be met:
   - If EL2 is present and the kernel is entered at EL1:

     - CPTR_EL2.TFP (bit 10) must be initialised to 0b0.
+    - CPTR_EL2.FPEN (bit 21:20) must be initialised to 0b11.

   For CPUs with the Scalable Vector Extension (FEAT_SVE) present:

--
2.45.1.windows.1

