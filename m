Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DD01CD1F
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 13:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743858434; cv=none; b=tleKOjmRJbetFULi8X08cD/jEVSrD4zs9wlIu1R+EnVNWVH3IxN6xYGhuyBLT3k6snv3ah1uzHeiyote7d9X65pn72agIXLRPEiCeSG6yMJhci8YNUw69Ti1i8I85/KCdrcY8ACnlau8XMHCC87CSq1F7HhONn7SJsqtjzlpE5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743858434; c=relaxed/simple;
	bh=6DDTKjVJCQNWnEUjcJRlJyeb6IayBG7eLZ6Yj0xmSQE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bmpGS0/9t4N/uC88cKPYsMDKHkMJFpUE3TIX466D/l/T/pUlvje7LmVZLl64DWiTQjqYiSYE+YyEk92cZbbEheHeqCnrA/wL+Q723GVnSP/Zc/ZrsGQJUtMLL6S/KUCOcxG8kWfGppTc+8768dQ/UhfT55gsAHN74EOSfuBzt/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [221.222.48.127])
	by APP-05 (Coremail) with SMTP id zQCowACn3wf0KvFn0XdCBg--.44363S2;
	Sat, 05 Apr 2025 21:07:06 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>
Subject: [PATCH v2] staging: rtl8723bs: Add error handling for sd_read().
Date: Sat,  5 Apr 2025 21:06:42 +0800
Message-ID: <20250405130642.2255-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.42.0.windows.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowACn3wf0KvFn0XdCBg--.44363S2
X-Coremail-Antispam: 1UD129KBjvJXoWrtFyUCFyrAryDZw1DWFW8Xrb_yoW8JrWUpF
	4kKas0yrW5G3WUZ3W7Kr95Ar9YkrWxGFyDGrWqkw4SvFn5ZanavrWrKa4Utr4UWr17Jw4Y
	vF10ka15W3WDGFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkK14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
	6r4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
	0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v2
	6r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
	AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCI
	c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267
	AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_
	Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjuHq7
	UUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwsDA2fwn8Hj7QAAsL

The sdio_read32() calls sd_read(), but does not handle the error if
sd_read() fails. This could lead to subsequent operations processing
invalid data. A proper implementation can be found in sdio_readN().

Add error handling to the sd_read(), ensuring that the memcpy() is
only performed when the read operation is successful.

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/staging/rtl8723bs/hal/sdio_ops.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index 21e9f1858745..b21fd087c9a0 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -185,9 +185,11 @@ static u32 sdio_read32(struct intf_hdl *intfhdl, u32 addr)
 			return SDIO_ERR_VAL32;
 
 		ftaddr &= ~(u16)0x3;
-		sd_read(intfhdl, ftaddr, 8, tmpbuf);
-		memcpy(&le_tmp, tmpbuf + shift, 4);
-		val = le32_to_cpu(le_tmp);
+		val = sd_read(intfhdl, ftaddr, 8, tmpbuf);
+		if (!val) {
+			memcpy(&le_tmp, tmpbuf + shift, 4);
+			val = le32_to_cpu(le_tmp);
+		}
 
 		kfree(tmpbuf);
 	}
-- 
2.42.0.windows.2

