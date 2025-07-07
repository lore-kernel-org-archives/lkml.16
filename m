Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE0A1B3925
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 11:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751888071; cv=none; b=nWTGEMKMj75K63DWr3VidpaL+ffm44TppPsZDJMc+pPZf7k4RsxgU7BfooMscCh7yOaKooNsn1qHLv83x0XiC3Q9bpJYyY1TbhSALpNp9fc/Y4MfYi7C8Dtg09YpJI6/4B5/5tpcjkIJDx/eXE5NWxOey3HwEqkCh+vH+FYA2u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751888071; c=relaxed/simple;
	bh=3Xu5CxujneynmxR14L7aGbB9NfUqBleRdlNSIRc4bo4=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=MD0FoQHOpulhfd53QBheuv+D8lqwEsaBaRJGMe8bs1ffF8FPKJ5CUixiIRFFp3wdKSphz5j+8MAL00S3w7SK0W/23wLUreu84jUW/pxq7mury5KIosG1YJ0zUdiVWBv+uVTIWoNCIxqEgwvUbcj176Nuv0RKIg519/f8LUTEMlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4bbMZz5wxqz5F2lj;
	Mon,  7 Jul 2025 19:34:19 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl2.zte.com.cn with SMTP id 567BY9ui054882;
	Mon, 7 Jul 2025 19:34:09 +0800 (+08)
	(envelope-from liu.xuemei1@zte.com.cn)
Received: from mapi (xaxapp05[null])
	by mapi (Zmail) with MAPI id mid32;
	Mon, 7 Jul 2025 19:34:11 +0800 (CST)
Date: Mon, 7 Jul 2025 19:34:11 +0800 (CST)
X-Zmail-TransId: 2afc686bb0b3ffffffffd8c-e36cd
X-Mailer: Zmail v1.0
Message-ID: <20250707193411886Kc-TWknP0PER2_sEg-byb@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <liu.xuemei1@zte.com.cn>
To: <paul.walmsley@sifive.com>
Cc: <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
        <liu.xuemei1@zte.com.cn>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIXSByaXNjdjogbW1hcCgpOiB1c2UgdW5zaWduZWQgb2Zmc2V0IHR5cGUgaW4gcmlzY3Zfc3lzX21tYXA=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 567BY9ui054882
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 686BB0BB.003/4bbMZz5wxqz5F2lj

From: Jessica Liu <liu.xuemei1@zte.com.cn>

The variable type of offset should be consistent with the relevant
interfaces of mmap which described in commit 295f10061af0 ("syscalls:
mmap(): use unsigned offset type consistently). Otherwise, a user input
with the top bit set would result in a negative page offset rather than a
large one.

Signed-off-by: Jessica Liu <liu.xuemei1@zte.com.cn>
---
 arch/riscv/kernel/sys_riscv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index d77afe05578f..795b2e815ac9 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -10,7 +10,7 @@

 static long riscv_sys_mmap(unsigned long addr, unsigned long len,
 			   unsigned long prot, unsigned long flags,
-			   unsigned long fd, off_t offset,
+			   unsigned long fd, unsigned long offset,
 			   unsigned long page_shift_offset)
 {
 	if (unlikely(offset & (~PAGE_MASK >> page_shift_offset)))
-- 
2.25.1
