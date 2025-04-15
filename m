Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4BC13E02A;
	Tue, 15 Apr 2025 09:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744708411; cv=none; b=htW8MAOeGmqUMsbypczYIouGw5athKZqNTCIbhBdYplcTRaN0GMsrdYW0gBda1F+rWrprdOT6HSPahDkIE+H2P3CKt2qVVEcJDrtPpmcvCR97TPnbvprXVIJgisYVBf+6A+WNsn3NZhwrXYkkqKRgof9ouNgzZX/pFx7cYzG8yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744708411; c=relaxed/simple;
	bh=owyLMd8hX1as4LmAee3vfHdMVtC6rPHCe4jax9TXDog=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rK2tvf1vjbhbEGj1QcirdAZEdTz4eVizUil3iceUxFZwKQBkVU99OJXeoqoEfSmOu7LJcpmb/sjPFo+38Ara+FLCeSOR+N3Keu38f+0HmY4uIzQWUGq5CrENmnd7UJnU3zh0xjSWED4boQT/BBUT+i7iPv2x9Lnp9uqAKzSDQsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=YG3av/x+; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="YG3av/x+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1744708375;
	bh=YFMp6fwp6umPvxQeSd6J+Ddieu7ttoj12+2zhkifFpg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=YG3av/x+ZEYlXv5iDRrTGiuXoUQK4QtZjFlZGkxnpBDPvyvTyAkzS4WXPaHIRf4It
	 FL/6uk68vXCd7JCy+0BMJqeEH4Ts80t1Jg5JyDY3QN5L7eeYwZKkt1gvG0ZNNTBypk
	 zo+A0nMVs8znMnEhvJDMBKfIdB/h3alMvwRjfulw=
X-QQ-mid: zesmtpip2t1744708334t7dbe64a7
X-QQ-Originating-IP: SksWeuet9ma3TlVLc6EhOgqSB/dqiOPYlIiBpQRQC48=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 15 Apr 2025 17:12:13 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 4657074941084990627
EX-QQ-RecipientCnt: 8
From: WangYuli <wangyuli@uniontech.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	wangyuli@uniontech.com
Cc: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhanjun@uniontech.com,
	niecheng1@uniontech.com,
	guanwentao@uniontech.com
Subject: [PATCH] alpha/boot: Ignore vmlinux
Date: Tue, 15 Apr 2025 17:12:06 +0800
Message-ID: <90A2E6E70A68DD1E+20250415091206.413647-1-wangyuli@uniontech.com>
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
X-QQ-XMAILINFO: N8Jy6PtD39R8dhcbrMXwyI1knY8Wo74eIFI0kBUrTG6hEv2MF1GN3wXW
	IO95KXnoosekbSDXn3B9yFMYnJIH956Fz8gIWPwaoSGpjsagigCWVgrRjLAMUGE8Qd+mxWE
	LnpHXLDBM+03w7q+BWMrfYMKz6EOHyEb7pOSn9bNWQpLhYQoOzWp+3CF8IF5Kyz22t7Jtd6
	gJAqsjcCmTTi8oq9bxGQSWSzFoL+IYcYhcxov8FskjJhy8bnse6XMBU+D1qcb4MBpqdm7ec
	BYH6yRIOMsRRj7n2ydvPyDrLWzqPoGwqL4Vs5treSTCgjH8jegVN0NVoGMXTDOp6XaUwcOw
	6+wvevPORhMQtWIb4z91H4u1sCd/J5LbG5hUdRzjfLKMhY3MqNDQ72Fbq0JRu4muAZXjfZb
	JkVCFj60o61YbTaTgR+G9XWEB9hzQkY5tiQW81kVJk16GG188RywsJuuQAiXJxoup3e5jr5
	CTC7UF5qevhOkYMmv0Xf4LkGMbw4PHLBIzD8ggVv6w3HlahGpdbQkkNIu2/O5lUOhPhz85j
	Hi6EvUaS50GOYuYTmiOWBj0YW0cuYtMYN+EIi58ivW66xak/silQcEqX8q7o+h+BjVC2JNz
	pqDdTEv3e2wtStgCm7bg38aJhisTRXCrpAmKGXoa5a+GGS4Zy+B9j5PzLh7xDjiMUPNTbZb
	5/hekaknvC3Cwb1RoC163sHQKBx8o/Fqyedf9c+ataQnUOgtILr4J+8ZG6YFWEznOTDxTyE
	zqzEJlGildY68Jw+5shHFZFEg0frUxk54eqJx2MwXoYk3rBl9gTL5kttUzBRnXS/AqqZPkt
	87JG73GUNi8Kb95imRLH470fkdyv9aoaaQoZIUtY0JXjLPEMyclO3CamGnHT2nmHogfPpry
	vjMnpAioHj36zSnfCU26/GHjoWlmf3d0asAErSOXAbxVVqNNFf+bVpeJMlxFrE/8AgRI0Zp
	XocThzksHisOZT60tLOq6Wq9AO+PrAsGyzv4/CR2JycuOHVpIBnQPuHsIumsh/b4m5S2YjI
	bMYV3oM2HSrO6ZrLmBzLVZ/vPpiHk=
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0

The vmlinux file would be generated when building kernel.

Add it to .gitignore to ensure Git does not track it.

Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 arch/alpha/boot/.gitignore | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 arch/alpha/boot/.gitignore

diff --git a/arch/alpha/boot/.gitignore b/arch/alpha/boot/.gitignore
new file mode 100644
index 000000000000..c85710c597e7
--- /dev/null
+++ b/arch/alpha/boot/.gitignore
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+vmlinux
-- 
2.49.0

