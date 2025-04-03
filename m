Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D762459FB
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 09:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743673092; cv=none; b=VtVJDGusaiVST3HfkNL13BFLR6zDnxvrA4L/m+lbpfUt/McZKK/2KTe1pdeFrAD3zGJU46jm3aFZW5WUfqP7Q8ebtvQ3Rlu5wuTuzI/2KvCd+iiy8vSFEOmWNU9A/Vwt9SIbOQbmpHu/weEUmhNx3Oo7kvGLPIt9wgt7u3HGSQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743673092; c=relaxed/simple;
	bh=1O5Q4hnDttQpETR9W72KDLMuVDBqZKdtBJ0LLq6WGUA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KQm+GKoRtihFHVzy4XSGMahCxYEKn7NP18WPZqhJqZCiMKhDcfvNYa984BGXFoEL2PSPS/CLKRsY1pclgnG5V1F/dthx3GrD4kSMknrx1y+vKfc7r5McBvfKN0AbKIWZXoTzJZCz42X22WCVxsotr603zoC1LpftPLnUSjJfXSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [124.16.141.245])
	by APP-05 (Coremail) with SMTP id zQCowAA3dg71Vu5nvi1sBQ--.44416S2;
	Thu, 03 Apr 2025 17:37:59 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>
Subject: [PATCH] staging: rtl8723bs: Add error handling for sd_read().
Date: Thu,  3 Apr 2025 17:37:41 +0800
Message-ID: <20250403093741.2372-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.42.0.windows.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAA3dg71Vu5nvi1sBQ--.44416S2
X-Coremail-Antispam: 1UD129KBjvJXoWrtFyUCFyrAryDZw1DWFW8Xrb_yoW8JrWUpF
	4kKas0yr45Ga4UZ3W7Kr95Ar9YkayxGFWDG3yjkw4SvFn8ZwsavrWrKa4Utr4UWr17Aw4Y
	vF10ka15Ww1DGFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkC14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU8miiUU
	UUU
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwsBA2fuKuu+YgAAsa

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
index 21e9f1858745..86776d924c15 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -185,9 +185,11 @@ static u32 sdio_read32(struct intf_hdl *intfhdl, u32 addr)
 			return SDIO_ERR_VAL32;
 
 		ftaddr &= ~(u16)0x3;
-		sd_read(intfhdl, ftaddr, 8, tmpbuf);
-		memcpy(&le_tmp, tmpbuf + shift, 4);
-		val = le32_to_cpu(le_tmp);
+		err = sd_read(intfhdl, ftaddr, 8, tmpbuf);
+		if (!err) {
+			memcpy(&le_tmp, tmpbuf + shift, 4);
+			val = le32_to_cpu(le_tmp);
+		}
 
 		kfree(tmpbuf);
 	}
-- 
2.42.0.windows.2

