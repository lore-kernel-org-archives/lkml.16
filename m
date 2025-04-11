Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B7A283684
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 07:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744356643; cv=none; b=g82RQz3d+nmPhizrH5AfOZ40u/D1cfauHPpzybZiNthG0BQVFGnvLUzz/BGarUggcAdYK+ICfbFLy+2kodGaHaJ7HQNGHaqwOzTfeof9aji2l57UBaQie5wplBYGc/a2XCVNpXNlckJShRzlG/YfavxWOYyQJKDUd4EPhGl0VeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744356643; c=relaxed/simple;
	bh=wqK8syJvLU3JJqxy66W+Ah/grD1taGKhIRbavOCs+gw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JD7ULAiN7xGUfGF0WbYVkLReED8GL4UF3wU5OdvpcPZotbP4a1alJy9P/5KBp7rZR2DXFpt/kgHEqPJQkXIVd2CsOWUgUqvCo6aKzogPonVtTnn0Bxgse0kl/QGABQB27MQbTph248UuspSTzaKZrkKeQJdB9J0y2ZuL5cg7HJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=D9oHE0fh; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="D9oHE0fh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1744356560;
	bh=uxOm8SHlcWyXtuWQU8WpjfV173mQ5imseKmaQ1ocr88=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=D9oHE0fh6+FHg4F59HaiX+S7cuQhV/h/ToLgup8qbkjmTLVLMdpVD76kPX4PXWiTa
	 plByWVk+Nj9fF1y9QMbJLZvaZGP7zKlY1mWWz5jAATbePWhK16l6PEcaGraWROnbJ7
	 sIDRV5eGfjDQQqQk1GB4cNZRtoCZL5ZbzUWktt3c=
X-QQ-mid: zesmtpip3t1744356550t30aef910
X-QQ-Originating-IP: 5kBarLaAeNoTnPMhtr/u+NgnIMHwSLfBXYa7qBdeBa4=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 11 Apr 2025 15:29:08 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 14869536792913685592
EX-QQ-RecipientCnt: 14
From: WangYuli <wangyuli@uniontech.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: wangyuli@uniontech.com,
	chenhuacai@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	vincent.chen@sifive.com,
	palmerdabbelt@google.com,
	samuel.holland@sifive.com,
	zhanjun@uniontech.com,
	niecheng1@uniontech.com,
	guanwentao@uniontech.com
Subject: [PATCH v4 0/2] riscv: Rework the arch_kgdb_breakpoint() implementation
Date: Fri, 11 Apr 2025 15:29:04 +0800
Message-ID: <D5A83DF3A06E1DF9+20250411072905.55134-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NMRvUBB6DcheiGY8OQyajK5PCKdIR0ZhnYkrsbCGSmh6clcbRt+51l5u
	9yvZ+4L53ph8OOo65AxpaHfSIk+gsoQk9WenpjudxVJxwwW4vwejcrEJQ2ZXBbiZccSQxnL
	LRTWIli1AjY7n6me62/X5GUj/iBiGF/klpXYwkITXIuLewPPQ07cPvOD8M2fAK9oBCPuiN0
	6G4gInK9hGw65OhxJNqB0m9Wjyd11ilhXXXk+5EHuKwxjzGKiQd6bHhr9ZZF0iThR40Sv8J
	SEY5Ij4E6nb7Mb7WuQ4PPNrS/NHuIW568fbO5MfMAQsNHYu/JdSI6MQEq0dq3HmHfITylQc
	mBbWOGcf7E5vG9UZTGF89JBQpyduY5r+xyGHuf0h5wXK6V5daQIVN/xpWgs+0XN7jiib9nn
	vyNZSYrWyt6Nxll5k9fSYX1DvzVAHQApzE1iiU9UdX72ssOtpvom+Tu7Ans60OhoCrXCYPQ
	/4KI5LE0tMMN3iETeX9dFLV0IfpeIqNXjSSL/m5FvKw79vsEnShrSVk0YFQOGgr0ZSJz7ML
	hGtHi+Tz1MR1OG82RyHQjFsZcfGnHDF+RZwKpVtd7IWajkVlJSc+LAmr5zuvlSCOyb2wxzq
	Z7JmEmdH+q6tFJGFhNVMRkAWpnPNTczUb0O9w1auYmyptQKlPfmWzfCRrOtTBtf6nM6M3SA
	tF3N9QJ5wvA4av8nzaTrC6kxCmbHQi7fHUoAB+VHNrMsVWOoq4bg6hLeLNlDJPYyTfnHiih
	8uHTn+pAlFfg3kedBs/QnqPfCgzQgQDZ1F9y4Eq60Wfq2yZ05ZYpYtcKkenGKZdBaEPVh+k
	GBYUuOU+ei8dxpNHeIqhyVoka0BloWcAivtdn/oPOVT1LBMeEaNUTMCLZG7swwa6VrJm5oT
	OaARNsjTelSiQARorpkoskfOPUnr9rLRt4WenN0kLAQ1KoFfM/93erNrKukrnACSn8Cy2ua
	BQCQHwSvzKpk4Lez9QpNKIeYQNWv0Ukg8JEQ8PmHU4lnctG88ZUn4vpKyDrxXgkTLkdvtZo
	raTnt5Ug==
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0

1. The arch_kgdb_breakpoint() function defines the kgdb_compiled_break
   symbol using inline assembly.
    
   There's a potential issue where the compiler might inline
   arch_kgdb_breakpoint(), which would then define the kgdb_compiled_break
   symbol multiple times, leading to fail to link vmlinux.o.
    
   This isn't merely a potential compilation problem. The intent here
   is to determine the global symbol address of kgdb_compiled_break,
   and if this function is inlined multiple times, it would logically
   be a grave error.

2. Remove ".option norvc/.option rvc" to fix a bug that the C extension
   would unconditionally enable even if the kernel is being built with
   CONFIG_RISCV_ISA_C=n.

WangYuli (2):
  riscv: KGDB: Do not inline arch_kgdb_breakpoint()
  riscv: KGDB: Remove ".option norvc/.option rvc" for
    kgdb_compiled_break

 arch/riscv/include/asm/kgdb.h | 9 +--------
 arch/riscv/kernel/kgdb.c      | 6 ++++++
 2 files changed, 7 insertions(+), 8 deletions(-)

-- 
2.49.0

