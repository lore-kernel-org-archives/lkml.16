Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B952C2C9D
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 06:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744008349; cv=none; b=KlI+NM5vLIbzVCIgGV8kVOTpalkcBHMqKCpRb1YaQG+p4ndDOLQYGDwL6VG5mQfAcIawF0HkXrd+EpDw9OGTY+Cq7zn86DKGJvY+kh2BvA9ZUi2VCwtpwHGuRRH3zC89iWcC0TRf3IpDOrWhDj5VPX7UCwG0G6QP3EBd3R71coQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744008349; c=relaxed/simple;
	bh=ByweHPYuYuXVax7ZnTRTBgDSAnRV4UA5+GFpddLqzUI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ti4HssbHkkRnu0mKf5A4H7tbun2JVdo5eL9o2Igfhb51OC9LmZas4J63laZD3N177guheF8rHHsFfpG0lYdNGPkfgM9WNrK0ij0HZdMBTWGv1RCXND2xSPqO1fLJsKXQnL4a5+bGy34hoJMu6rzcmyGOKH78KxnxdMGWU52RZ4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=wRl+S62p; arc=none smtp.client-ip=115.124.30.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="wRl+S62p"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1744008336; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=KAev7UvooSdKET25CeCap8Gc/isImxnZ9y6gZMoUjoA=;
	b=wRl+S62prw1KtqqL5kXKLg0hZRxAE8YxxbRw9kNPgBm0kE8vsdEFAO7Z/H5UY/rATvDwNgZ3wYnK4VVn0vpbZvqVbRbDycy3Whv5YHt7qOMoyUNS5No9UuUdOTK9eDf/pWnC+ueHH+UdoOkTpdJrj8l9xXaL7JtgIoQntpOKQYU=
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0WVow-rD_1744008334 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 07 Apr 2025 14:45:35 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Yang Li <yang.lee@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] regulator: pf9453: Improve documentation for pf9453_regulator_set_ramp_delay_regmap
Date: Mon,  7 Apr 2025 14:45:32 +0800
Message-Id: <20250407064532.22680-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function pf9453_regulator_set_ramp_delay_regmap lacked detailed
parameter descriptions and return value explanations in its documentation.
This patch improves the documentation by adding specific details about
the parameters, their usage, and the return values, enhancing clarity for
developers.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=20168
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/regulator/pf9453-regulator.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/regulator/pf9453-regulator.c b/drivers/regulator/pf9453-regulator.c
index ed6bf0f6c4fe..2ae457b3611f 100644
--- a/drivers/regulator/pf9453-regulator.c
+++ b/drivers/regulator/pf9453-regulator.c
@@ -412,6 +412,7 @@ static int find_closest_bigger(unsigned int target, const unsigned int *table,
  * pf9453_regulator_set_ramp_delay_regmap
  *
  * @rdev: regulator to operate on
+ * @ramp_delay: desired ramp delay value in microseconds
  *
  * Regulators that use regmap for their register I/O can set the ramp_reg
  * and ramp_mask fields in their descriptor and then use this as their
-- 
2.32.0.3.g01195cf9f

