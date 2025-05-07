Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5E53209;
	Wed,  7 May 2025 06:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746597697; cv=none; b=QY13DkEj6rrc6uADajLCcGafFzA8FVNJrv9gSrDLTfKrVUzcSXBlrMBbUyvxoJyP72k84z092k4Y0XfdiBkhW+6iOGdDGY5Fve+dANqW0PjCcZ/gbJFcajD/RTYflH/wuBNXQDH8emf5BGDM8j+uLjbcq1Gm5q+Jf5YJGCw80mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746597697; c=relaxed/simple;
	bh=owyLMd8hX1as4LmAee3vfHdMVtC6rPHCe4jax9TXDog=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NS4aQkTBiM4JqwebBvsDIureB80pDm/StMOI2RGZAk+GcZ97mgg6wv74QaIt7ACZkobv//3NQ9I5IRc+N7bNqSMyWeZWVgiVBVGbZkZ1FzsOPcfhhqL/ufkLTQqEYnxGSjHCR8jlXAGZeIULxKmRuKTuUHVHBQcN6l1lTopu+6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=izJXrBrp; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="izJXrBrp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1746597661;
	bh=YFMp6fwp6umPvxQeSd6J+Ddieu7ttoj12+2zhkifFpg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=izJXrBrpQ/nQwr9dkjZAATfnLCu1Rla96LVU4J1mrh6V/GvTDk6TCahVPkGHosVDB
	 Kz2Ng+yabjAbRT9217YXa4TE+LqHlHUZwbRmkQTiYU2A1F0F2BPvRaHsSQvFLuOMKW
	 l1BZ2z2pi7l0uDyPCy5bfC1x8cLfPeABRv14sDpI=
X-QQ-mid: zesmtpip4t1746597621t17870780
X-QQ-Originating-IP: KjohCj6doj2ziNglKdDLK7u0qW0soYoxYWzSznlG6vg=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 07 May 2025 14:00:20 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 11213127213891153055
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
Subject: [RESEND PATCH] alpha/boot: Ignore vmlinux
Date: Wed,  7 May 2025 14:00:12 +0800
Message-ID: <47F75842218B0DDC+20250507060012.1203990-1-wangyuli@uniontech.com>
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
X-QQ-XMAILINFO: ONJthgsgJlmJPy97owjLVYlHGkmgkKumyluC1ZenO0y9ITX2V/0mzrUA
	0jK+BSq3Wyv0BQQ/wwb3wtGyzlDIjPZtfgUf5Y38A0r0M8obF2RvLfxlCNUQTrd4H137Vrs
	6D+va6IRMxKnSJ0MxTjVOQi6ZTviVRMywJMxfpY8K+CJUTDY9aF0iVUZDiorks+6QwWU5Kq
	c7dh0EhFnjMGEkaKWwipCc+vCi1vORr1vSaUFp3NeMGxh+7cZ9ZAvm3yOskElemIc+3do1l
	FJI8FARJ7gxck6JTwf/m3pj5djOSvrkzKqjzisXXVgga92ETQMBoCq4mVEz9q1ZIg5Xh1To
	dcbAuJHBwtENs2V7n/ll+2m0o8kb3h/qLN02l3ddbb5U/orjLrhp8OXLo/3wawLdG6adxLy
	hyGXzDUXOomQcAUR8pivH0Rw0qy2l5m8RUWotzjRb4DYsMA2FMs0w2sB23mXZdWaAwh+ocE
	gs0XGIXJyoy0xORxaZsQyQaKJ/o7nLV11pTXiiH/JG+OCKHYkeFsWnZc0be91N8f+8pSg+r
	nsmNPkok2JsP3KfG/fODiifIRzkjOBy1cevzIEJBGtZcm8Wi+woPchWBBTjOpYAuI3SfXpl
	D45lYoG22CKPtJoMKbBQqmILNMg8iF0gQDMUMQiIuf1jxUZ6vp7Z1rz8DRVmlh09WWAXcke
	lazJnwFfDNdu96tc16bncHQNT51cx0GyiDD1cABJcvxkuVgwBQkwtmpiJW/NFZpCIfz+Udl
	u6g/XFER22HuZpFledZo+s999emOqH6QTbqwszSnqUoJm2Aro+UaZf4F3aDr1ADCqxM5shI
	WfKt4rKfgrjyn0+bNajO3hyHFUQIQ50gP44K6if/vmw2Y/T4AgnsH2w+KdKucBc1l6yl+S6
	qSLKrK1dZtG0GJi9JmAolVx6n4kv7K/CH6DPbG7aiPg3EOwMcBqRgh+zmzzcvr+o1ElJwBG
	uw26/p5vx/UNyyvgB/GbOdaBZYLzLwdbIf75g4EGLjBRdFUtXtO1SNOFetBd802QWXy6I0k
	uAddM+pn4v2Wg5jBCObdh5dRvjDdQC7eZ9WWQ+7Q==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
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

