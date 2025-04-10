Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FAE28FFE6
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 15:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744300083; cv=none; b=r/Yg43lRkBcK0hbdCV9IZ19tcrIRZoLVHuoikFYA6gcknkmbWZfQP8+ZQ8eVOYBwajiB+I9AFmi/PssLRBT3YK2K7vypr0l6Q96LAilqzrXk6A2ifRqoBDqV8AIpumMPbGSquxrOwehlnY4qZLDe1xa2EOF8oOLabF/mRiwpbX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744300083; c=relaxed/simple;
	bh=+f1yjCXtyIw2axRjGihgJUT5IiSnyLaHMlnqSebeZtg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lceRcO9yoM68FLJ3eOALJkZ/n5pVHDr92y/rU5Q0sbD1wm+Kq+9e7zCMed/1dSqGce+qQBZDWla5OnU4mxYDF9NJM6ULodX/ZIOJs4eFPCrqFcDUPC1efYQ/VyKG2FepCv1RbX/w1SQMlZqHxGKRlBckL1JHv96hEaToQQPTxKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Wo19Ub8D; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Wo19Ub8D"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744300078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Sa+81DgxWNssyvdo2ddQJ4tBEe/hHHJeQcYjTNvrhp0=;
	b=Wo19Ub8Dqw5M9Vmpn7FXEny7JO+nd4N7j4P4hLmiRnu5AWF18gfWElUlQZR8O75+IindC8
	cpvASUI1NGXj0KYisLBCWbOHIHB+1CbMTcZ43vC3o2NpcL6FhGZQUbbc9W/gE5V3yUcOTQ
	8goQk+x5aaOOgMn7SP8fpuqe7aKljv8=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Jens Axboe <axboe@kernel.dk>,
	Damien Le Moal <dlemoal@kernel.org>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	"Shin'ichiro Kawasaki" <shinichiro.kawasaki@wdc.com>,
	Zhu Yanjun <yanjun.zhu@linux.dev>,
	Zheng Qixing <zhengqixing@huawei.com>,
	Yu Kuai <yukuai3@huawei.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] null_blk: Use strscpy() instead of strscpy_pad() in null_add_dev()
Date: Thu, 10 Apr 2025 17:47:23 +0200
Message-ID: <20250410154727.883207-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

blk_mq_alloc_disk() already zero-initializes the destination buffer,
making strscpy() sufficient for safely copying the disk's name. The
additional NUL-padding performed by strscpy_pad() is unnecessary.

If the destination buffer has a fixed length, strscpy() automatically
determines its size using sizeof() when the argument is omitted. This
makes the explicit size argument unnecessary.

The source string is also NUL-terminated and meets the __must_be_cstr()
requirement of strscpy().

No functional changes intended.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/block/null_blk/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/null_blk/main.c b/drivers/block/null_blk/main.c
index 3bb9cee0a9b5..aa163ae9b2aa 100644
--- a/drivers/block/null_blk/main.c
+++ b/drivers/block/null_blk/main.c
@@ -2031,7 +2031,7 @@ static int null_add_dev(struct nullb_device *dev)
 	nullb->disk->minors = 1;
 	nullb->disk->fops = &null_ops;
 	nullb->disk->private_data = nullb;
-	strscpy_pad(nullb->disk->disk_name, nullb->disk_name, DISK_NAME_LEN);
+	strscpy(nullb->disk->disk_name, nullb->disk_name);
 
 	if (nullb->dev->zoned) {
 		rv = null_register_zoned_dev(nullb);
-- 
2.49.0

