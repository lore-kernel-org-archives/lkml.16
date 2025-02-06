Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4E919BBA
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 06:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738823975; cv=none; b=Na1FWSPHU2sos6wQkg0RKJG2RWm82L7Tj7BaXBD0oXJ/6Cxjz4QXun9QmGHIvajHvyRenFPRDagYnUS8HK6N9POfjjcpxP8EDG89XBwWs8pRNVXIdQRO0Ogx4e9J92IXM21zJohhU4PV9Ar+P6ZXqzLCx3AzICAX+cB4vc5/qdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738823975; c=relaxed/simple;
	bh=1FYmeQXb0irK9DSBp4iCMcbDXGxEqWM24DclFvSHfck=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m3oJ6UGYpldNQjsLKMwB6sZm2rHuRiPDF9bgza5gxay3NjN7IqpNaOwhigTlVvaaFKm6wdO4q5ZnZeZ3Ltr0N+dACvNvSsvGNIprnK/uAqPJ7szCtki5sB4UmdZ9v6U61HCIRPwzQvM14VZIo6Bjue2jjbgixrLBWxn29QzibZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=n59msTRU; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="n59msTRU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1738823924;
	bh=AAp31+S7qZRt6X6DuZRyeJe6cR/74lVRhZAfm765wTs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=n59msTRUhB/TAwBHE+fWZO4LA+BGFqa3+6gyXgxgCqIcST3jozfxciE2lT6ROfXEF
	 dmulc4zHTglbkrFSuhO/FB5EwOVhYeLJYSLtzgCVqaO8UM3t13aDDChUSDQyIOvk+E
	 NQRWtxT+trJW7Ph/sis+TFE5xv+OW2JlOPjpC77w=
X-QQ-mid: bizesmtpip3t1738823911t6xn07j
X-QQ-Originating-IP: XUneXnfm0Vu1d2u1w6VZSbwGvOoqOoxXYTFaRVq+FYs=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 06 Feb 2025 14:38:29 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 11609521196791142020
From: WangYuli <wangyuli@uniontech.com>
To: chenhuacai@kernel.org,
	kernel@xen0n.name
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhanjun@uniontech.com,
	guanwentao@uniontech.com,
	chenlinxuan@uniontech.com,
	WangYuli <wangyuli@uniontech.com>
Subject: [PATCH] LoongArch: Enable Undefined Behavior Sanitizer UBSAN
Date: Thu,  6 Feb 2025 14:38:20 +0800
Message-ID: <10CEA19AD9D3FA2A+20250206063820.30558-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: OST2d686M2k2G3zilR5bKK07ECa5aJJRituO2N0OKr3mr+tGqkHDb3rc
	mC2BzS+7auqDRHMObjZAJAtSlPJ+wTRBj1QV86RBZwny5u5fJ/xWOyKH6bD2UcuSAONOs8I
	0Xdl+r89n0NTi6ohRdlJhYkiGYHVmD8Ozw9mso7mL35IDGBW9NcGR8EvR2E3wsqbeqYCGHb
	iJpFy9h0V8Z3uuCXmXYlN6JBMYDmSOgOWqYo+EzeqPwZlX4D49h7kBue2NfAQdIzfB8q4AU
	XfJ+qQspgxtei7wQFZjTwf+8X2b4wgzi09Kcp/mTwFUJ8sfTlYUwt0vFgC3utktl3k+78w/
	SlIj0TwygZhZt1TUFSTfsJToiJxGFHkWT+lu36ROeNeOwA3iBaFdUtTzo7LFBnacZIyUE4C
	0ZrIv/ZDCQd5qtzdmiYHe5UTBu7hwEh9J96uxUoKiv/uPnU9IskDF5ib84fXXtXqLpWumbr
	8byIcJuaL4ySTjOKfVRucn9G5sDD1QZ3TxD5tUYUQ+UZ3Nae+sjWtYy3d0wjwx0SVLpFHzM
	C9nSNmxhvsGfzPzpse+TA5aZKmECgGX/dZcnx3wm5E2fZMIqh0BxM8GKJJmEYvi3GYfdipD
	Lrot56s2A55mtc0LqEzPzYxfr/sp3MLAE3PkhM9A8mMDg5tBEpMJI0Z9oHN3gwZv5FiUcOR
	Z/uDOKpZZEy8JsX/CRp+S5pxe4TtYGlMrX9lR3/w2sJq95xG9N8uu/TY2+Wh08Z8Xe1T2a6
	Kf24V5zC6pgi3NMRtJLehvL1cnRKB6+mmIR3xTcuMh6l515yuDph9Vgb3AmkX9SUNVbjDSa
	g+ud/J7ouWTkqmUiEQEH38ACCD/tjSfBbF9FB+7nZLzGR4khM/LQUTJTYcyWVQWYHGbGSyH
	fTMzftxaiU8ygdLo6m5O5aAX2zR4UhbRQ1bS7hAfO30qvsdvNE/64VomwJJuLv8gy7BCXiu
	HJmFaFIF/I/77iN/YfYwNFjmYwSia9jAFcv+S8QbF6R//Y4FJzth0/DKmopkDmQlU4f0=
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0

Select ARCH_HAS_UBSAN_SANITIZE_ALL in order to allow the user to
enable CONFIG_UBSAN_SANITIZE_ALL and instrument the entire kernel for
ubsan checks.

Co-developed-by: Wentao Guan <guanwentao@uniontech.com>
Signed-off-by: Wentao Guan <guanwentao@uniontech.com>
Tested-by: Yuli Wang <wangyuli@uniontech.com>
Signed-off-by: Yuli Wang <wangyuli@uniontech.com>
---
 arch/loongarch/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 2b8bd27a852f..9d20aac7bc14 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -30,6 +30,7 @@ config LOONGARCH
 	select ARCH_HAS_SET_MEMORY
 	select ARCH_HAS_SET_DIRECT_MAP
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
+	select ARCH_HAS_UBSAN
 	select ARCH_INLINE_READ_LOCK if !PREEMPTION
 	select ARCH_INLINE_READ_LOCK_BH if !PREEMPTION
 	select ARCH_INLINE_READ_LOCK_IRQ if !PREEMPTION
-- 
2.47.2

