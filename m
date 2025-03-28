Received: from out203-205-221-205.mail.qq.com (out203-205-221-205.mail.qq.com [203.205.221.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30897213241
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 10:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743156935; cv=none; b=uRqe8YGUCoNvZRR1wABVBlt08TL8a+EYFCD3HURj2Iz7y4GI9uxg6yl0/v2N5WunZ2/u2IqVB75Hn8vGsLOSuVPHw4aC6qrGsIa48BQ36W9bBzGxAp4fqlCwu2eyIwOjY655fvjt7auerr//AAyn/eVYa0ykzoU6UtxAnGh2GwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743156935; c=relaxed/simple;
	bh=pHw6CEXh6wjbfoZ/9JOEwR+hldQ8fGN5w6ukzfO/6zg=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version:Content-Type; b=ZgQ8WYYVSf3NG+HbfYNK7/l6q7JxhLrT0Fc3lOi5Trm+Ai6R+EaksIe2pHTEoJqe2j3s9Y7+mHwpSvqcuTQWBVph3lS6CqCbFFDWMigg1oy7RrisUjZiFHxg5KGJNyt1gjbjEcUXGjqRfICchNgZOz/KVAzG798ACuwbNId2ahE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=Red54.com; spf=pass smtp.mailfrom=red54.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=cZAaOH9n; arc=none smtp.client-ip=203.205.221.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=Red54.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=red54.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="cZAaOH9n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1743156923; bh=EcuiC7xJsstU7iMIVfSBPGIrko8IzU16J1B4XmArQFQ=;
	h=From:To:Cc:Subject:Date;
	b=cZAaOH9nPWadR1hgx+L69Kx3fTN4bcm3UOtzBk6BgN0t7T2l6qYti1WuHDTUbEH5t
	 GLuUmvfg77+RxRqFS5gADYvnEZCMoGciUX2xVb3adY48f7XxQ7KuH6LWSD21MsUUJ9
	 YO7001qSx5EC5CXSezNJwG7Ucq84XM2cp9LAntPc=
Received: from mail.red54.com ([139.99.8.57])
	by newxmesmtplogicsvrszb20-0.qq.com (NewEsmtp) with SMTP
	id 3C52C2E7; Fri, 28 Mar 2025 18:15:05 +0800
X-QQ-mid: xmsmtpt1743156905traegrmkl
Message-ID: <tencent_A93C7FB46BFD20054AD2FEF4645913FF550A@qq.com>
X-QQ-XMAILINFO: N2zgDHximsrq6XAvK1wKKG3gsLhFL0nvP/GWnZbACO7itADC08NUfqDnGjqbo+
	 /m/BCrc7k4rCDdFU47S0uG5BJkDkMjnHTmi+PbrjajzIw9tIfORusIAa+MwyROTQ8NqjEOD6WpBC
	 enbtYB9kpkrBXrSsRMiTWCKoln2962f+Ebh9gOJvsQrujgHJr+A2q691wjE2XnQ4S+88QWp6pzJw
	 20twSRMP475SqKs8PMm9HnQgvv+NIBgesF0IncKWSah2MxZb9H3pzkwsKDT5iSMiIa4Tda3D8o7t
	 Wllva/NGZWaEX7UcfZbnEfxB5xG1i8TMZ1jsLkBZy0kNlXI+yGkUWFJtSzCRTiQTq6y6e2BBWd2E
	 OsaCUdVJVdreyqhe45roscWbTrj2gujYKYNEmdn0zOmIoj3ctXlnLfC4pLkUQXdRNbOqfL2GPErs
	 K8AnY5uSdA+2WFILIB9/8wOM0NTovlVZKzAqA/EVCJ6FI13Lxh2UJieriRjaVQduGlv6lxb1eDgr
	 cYPgRXLUsE5AWjlG6BvHLLZd3rKKEELEWS47ccRaooWpfqCcID+jvErsFsbUQ8cHFcZfa9GM98fv
	 d4m9+bpOI0qLpbiGqrnt21ShHAFjoiQoCB24felJDzo7WcJmTW0lJtD6OZ0jIKoaDjZbJsB+WS9+
	 YY5LrVYzN/J2EPFi/yLCZvMF59knYOw1gPPC0mGYIWuGwS+92JchDEhem/gmkRKvAqLJfhraLnMY
	 mIE2a960p/fufP0rG5wKpwU2tEv9SGMV8OywoaNxnWXDdnwIGQb09aOIKRcALtYXMNDXhRymWD8p
	 eXzg+cQ4vGM51By4YXD3+4pZowOJbCY+D1C+lBjcaHYilGm7yeUbGx5y6wRvVqTN3YOc23lJ4GuW
	 5XGLmIX/A0joo5Q6HCrQXh+EV6l7GVAvDA7yY+vLxGojOxG+TTV1tr9kE3rdF8oX9a95lsmTFInQ
	 wo2gTaJH1JFTYdUimHk2nKbn3dfbVfVE1lwmBEGsQCd9ud00sIXJc0f2tU8KZLXTORezgUcqbp8E
	 /0dGwUZhYJq40GrGPk
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
Sender: yeking@red54.com
From: Yeking@Red54.com
To: linux-riscv@lists.infradead.org
Cc: =?UTF-8?q?=E8=B0=A2=E8=87=B4=E9=82=A6=20=28XIE=20Zhibang=29?= <Yeking@Red54.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nick Kossifidis <mick@ics.forth.gr>,
	Debbie Maliotaki <dmaliotaki@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] RISC-V: Kconfig: Fix help text of CMDLINE_EXTEND
Date: Fri, 28 Mar 2025 10:14:22 +0000
X-OQ-MSGID: <20250328101422.52851-1-Yeking@Red54.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: 谢致邦 (XIE Zhibang) <Yeking@Red54.com>

It is the built-in command line appended to the bootloader command line,
not the bootloader command line appended to the built-in command line.

Fixes: 3aed8c43267e ("RISC-V: Update Kconfig to better handle CMDLINE")
Signed-off-by: 谢致邦 (XIE Zhibang) <Yeking@Red54.com>
---
 arch/riscv/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 54ed2a8cd7af..4cd18d0d07b3 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -1144,8 +1144,8 @@ config CMDLINE_FALLBACK
 config CMDLINE_EXTEND
 	bool "Extend bootloader kernel arguments"
 	help
-	  The command-line arguments provided during boot will be
-	  appended to the built-in command line. This is useful in
+	  The built-in command line will be appended to the command-
+	  line arguments provided during boot. This is useful in
 	  cases where the provided arguments are insufficient and
 	  you don't want to or cannot modify them.
 
-- 
2.43.0

