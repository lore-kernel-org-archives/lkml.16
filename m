Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDE6224AE1
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 06:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744007193; cv=none; b=pqyCnQjyhno8ZDbTE8idW3JrvpjZGRHAZwSp7oznTNWWpQUsxAfJuvTYpVDE/P8SEBBkjvD80Iw8vh45C0N30sJHzj0gWp5jYygNqjdQf/NfUO7ZbehwIxiAVE+Kj+Z3LmH3KZC9v0efSWbopZCa4v54hdSOu5Zyv14Z7pL/bOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744007193; c=relaxed/simple;
	bh=AwdFiZJgFvpy4NpCVC2LYrX4c4Oa3HfTHQ/IqTo/uK0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UnPAT2k+4M8TpG2vKuydEVolHd1N769BDtxesmWb7tbgLLxAP9dj4qpJ6yDwJeZ2lYW2Y5qEgRm3rJOdVUBsKsJr4R+6t4Etf3/ZPCiBqDfMVit3Bh3RnNsa5ChTc4UYlm6dD+6jQLnC7+rwyWSpLdFQECIBRxIXeMImQAeHu6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=aIpTaz5G; arc=none smtp.client-ip=115.124.30.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="aIpTaz5G"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1744007181; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=DObvmwmunJaaAhLjmCutZTbFoMNGkv4Jl5PNPWs0lKw=;
	b=aIpTaz5GuEgoCSq56wl3LZFpvwyez6z04xAxXRP7M4A+ujPKgFy1vOVQTXWuDYP8qw5/4UJR1SOPPzsYP+o9T6E+xwd5+irTykGsYH3YIKTS0By3cpXm5GxhmmJ8u5QcfVFQjB+Xng0eod43bwzBm37LH6mz5mKqcOcolMFBrx0=
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0WVoemxs_1744007180 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 07 Apr 2025 14:26:21 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: alexander.deucher@amd.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	christian.koenig@amd.com
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Yang Li <yang.lee@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] drm/amdgpu: Improve documentation for amdgpu_sdma_register_on_reset_callbacks
Date: Mon,  7 Apr 2025 14:26:19 +0800
Message-Id: <20250407062619.62026-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function amdgpu_sdma_register_on_reset_callbacks lacked detailed
parameter descriptions in its documentation. This patch improves the
documentation by adding specific details about the parameters and their
usage, enhancing clarity for developers.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=20167
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
index 529c9696c2f3..add252368dc2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
@@ -539,6 +539,7 @@ bool amdgpu_sdma_is_shared_inv_eng(struct amdgpu_device *adev, struct amdgpu_rin
 
 /**
  * amdgpu_sdma_register_on_reset_callbacks - Register SDMA reset callbacks
+ * @adev: Pointer to the amdgpu_device structure representing the GPU device
  * @funcs: Pointer to the callback structure containing pre_reset and post_reset functions
  *
  * This function allows KFD and AMDGPU to register their own callbacks for handling
-- 
2.32.0.3.g01195cf9f

