Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9978C2E6D3F
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 13:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750945195; cv=none; b=TYm9mj9dCFdw8nCKm4Hq+RIabZY9JItErYYTGKIb3z8a+Mv1FmKKF7w05gFrv1iM0e/UESrfDGiuoMU8aea+QXxzKdDPXot1ujYSWBUnrnANoR4SsD4OpztOn56/okgL/Qr/sADWe6dRMxVi9zSJytdM0PsR0OU3Pgs9I1En0SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750945195; c=relaxed/simple;
	bh=YJKxpkzkvaPo/FyznrjzlhHbFQ6GzaG3tVAbJwEAvHQ=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=hssDyeIlxf9Fiyah5xJjtg9lhBF8nzHkKuT4Vo4uygeMczBzDUwRTbsL0rBSipgl2zY0sKElFbSyHvDm9YmkJ7Kr2oGOGbuBb+Qxzyuy+uCHHI8CVlCD3FZ+wM12XTw0ExqECl4fpZ3LlgtfIUi3RtQP64yWXiTTNdsPtjc2O+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4bSftr73mzz5DXWB;
	Thu, 26 Jun 2025 21:39:48 +0800 (CST)
Received: from xaxapp04.zte.com.cn ([10.99.98.157])
	by mse-fl1.zte.com.cn with SMTP id 55QDdeDM050911;
	Thu, 26 Jun 2025 21:39:40 +0800 (+08)
	(envelope-from liu.xuemei1@zte.com.cn)
Received: from mapi (xaxapp05[null])
	by mapi (Zmail) with MAPI id mid32;
	Thu, 26 Jun 2025 21:39:44 +0800 (CST)
Date: Thu, 26 Jun 2025 21:39:44 +0800 (CST)
X-Zmail-TransId: 2afc685d4da0fffffffff94-54fe5
X-Mailer: Zmail v1.0
Message-ID: <20250626213944317IZBOF3xjZuAg2_MvpZZtY@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <liu.xuemei1@zte.com.cn>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIXSBzeXNjYWxsczogbW1hcCgpOiBBbGlnbiBvZmZzZXQgdHlwZSB3aXRoIG90aGVywqByZWxhdGVkIGludGVyZmFjZXM=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 55QDdeDM050911
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 685D4DA4.001/4bSftr73mzz5DXWB

From: Jessica Liu <liu.xuemei1@zte.com.cn>

The variable type of offset should be consistent with the
relevant interfaces of mmap.
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
2.27.0
