Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6282E286A1
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 01:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738978553; cv=none; b=j0bSmVcVXRSnxUy8F5lpQChO3xKDoG5FcpujblqB/nEkrPnNUl036cTPbZ2IJNAR/WJ9G827kGIyHvx772qK7SYE73jeUCM0ZHezC8P2i0XBPcqkzxnO4hyqiNZmkea8PovgBfow2FKiZMsHySyq0bKziRnZqYW35ClwKGsKPQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738978553; c=relaxed/simple;
	bh=g6PO1v9uicUWh1r5Tr7vvShV/nqNgAgZew7U3vBV39k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NwvVOe6VMZ2lYfgBIB7LXHf3d1pQ83FfWzSSG3osR7P4ARuRMl/ZKVXRAyJ/YuJgoPuPWzGD7t7QqXaKHuBu7/YZ/bwkWX57XiwpSJEym8yMtS/xjVd2s/CPFqoxYtsX2uKHdpDAf6CxYJrqvNJCAdduanHpZKARIg0NNsDHVjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ZBrylQWG; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ZBrylQWG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=b3YhI
	mgTWo7bwbjWqGJhVMij887Z3UsLMvLi21YCkpA=; b=ZBrylQWGd10UEVgIK7fLq
	b87r5ukudgOoaB1xL/F6jkth455HhOXlKY7pLgJxoE9E9A6ZHsczY+oP1g9EVTJd
	v2J7D+tP7eIhdfyBH+jzumh2OSG0/VMDMPRGLpSb6ihSWaalZ07M4eNZqw/NvTvF
	IDm3SVRHKpuKLPRuFCMYc0=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wDnd+_stKZnH3VRKw--.60201S2;
	Sat, 08 Feb 2025 09:35:40 +0800 (CST)
From: l1138897701@163.com
To: jani.nikula@linux.intel.com
Cc: luoqing@kylinos.cn,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests: i915: Use struct_size() helper in kmalloc()
Date: Sat,  8 Feb 2025 09:35:39 +0800
Message-Id: <20250208013539.3586855-1-l1138897701@163.com>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnd+_stKZnH3VRKw--.60201S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZw18tw4DZFyUXw43XF4DCFg_yoWDWFcEkr
	WUZr97CrsxZanYkr47Gw1rZFy29w17AFWSg3Wxt34Sk347Xr4fuayDuFy2qwn7XFW3CFZx
	ZwsruFySqr9xGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUs2-3UUUUU==
X-CM-SenderInfo: jorrjmiyzxliqr6rljoofrz/1tbiKADtRGemp4+4VwAAsH

From: luoqing <luoqing@kylinos.cn>

Make use of the struct_size() helper instead of an open-coded version,
in order to avoid any potential type mistakes or integer overflows that,
in the worst scenario, could lead to heap overflows.

Signed-off-by: luoqing <luoqing@kylinos.cn>
---
 drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c b/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c
index 075657018739..5cd58e0f0dcf 100644
--- a/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c
@@ -103,8 +103,7 @@ static struct dma_buf *mock_dmabuf(int npages)
 	struct dma_buf *dmabuf;
 	int i;
 
-	mock = kmalloc(sizeof(*mock) + npages * sizeof(struct page *),
-		       GFP_KERNEL);
+	mock = kmalloc(struct_size(mock, pages, npages), GFP_KERNEL);
 	if (!mock)
 		return ERR_PTR(-ENOMEM);
 
-- 
2.27.0

