Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.155.80.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16971F4C83;
	Fri,  4 Jul 2025 09:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.155.80.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751619645; cv=none; b=LE/9zmPrFQIYbjsmWxG3+GTuAFz/tnq54bW2L2rO2qk94G8q2HMVpIn/o/NJ0S9PIk2CTdajdIiyWkn3RJ0WMAb3OycD485IOHj9duQieRaqDAsVAPpMVpHLfqZi2ylb6wlrSmFjiUb1L34uK/srlmpffmvCRgi1ZqyEP2lNhlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751619645; c=relaxed/simple;
	bh=w/q0mf9VDsgMFiA/gtkemoS1upQXm3k3QhkFgnYWqbI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DUBcbV1FYpJ3I+yDYC19Qm2Vhmm7+GR4LLPBdn5SqnhnIjvnfZLLAsUUbfSrAR1ry/tXpddEcldQK+fMh5x+gg+886PIaNyGzMtCprKRt7gMtC/71V6MnSgHArMkk7PpCfn/SWMBDS1VVVuOBdJ2qfv7aWM1i1yd0g9BVSgAdqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=YkwxkN/R; arc=none smtp.client-ip=43.155.80.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="YkwxkN/R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1751619601;
	bh=7ADyi98oCBUBFtIDzaErwTJf/MpyAGpx68mKU987mZo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=YkwxkN/Rgnw3VwYFrbR4nPGTrwv8eYjVInshp0KU2DRuokGKethyY7zkcM++Yk/v5
	 AztK0btgrN1846RDR3/bN3EHqG6/WQxSETfphk8HELJkIEOVhFG3QRtEwp4X2JOQ1e
	 wu7DTWCgEa5eZefQKoUMKhebiC+KQl+DP5SmhOdI=
X-QQ-mid: zesmtpip4t1751619588t1456e628
X-QQ-Originating-IP: WrMrknaj4hw3ffa6ykftdBWrGLkPMePuJL2hmLCXUOg=
Received: from avenger-e500 ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 04 Jul 2025 16:59:46 +0800 (CST)
X-QQ-SSF: 0002000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 11834150841567911763
EX-QQ-RecipientCnt: 9
From: WangYuli <wangyuli@uniontech.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	wangyuli@uniontech.com
Cc: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhanjun@uniontech.com,
	niecheng1@uniontech.com,
	guanwentao@uniontech.com,
	wangyuli@deepin.org
Subject: [PATCH RESEND] alpha/boot: Ignore vmlinux
Date: Fri,  4 Jul 2025 16:59:45 +0800
Message-ID: <6269AF2792BA8D05+20250704085945.317850-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MqDJPKMI4IpJgmX5oXdfqoyv03NNkVBno93nu/otMq+MIA8l5HXW8qyT
	8wGaSk4U2Dqz+ISYd4fmlMQlYF64KI92CTJ6gbQZp4LuUAQrKofaVNu+Y/goyRGTWTsG5b+
	QJToj2AYeF79t+Xe+Pzc9aXNBGF6QxMM9VtU41qMUNMlkSOY/6zsiUHDL6lDKHXV4QRTtst
	fgRFx8nrJ3vHnTGmsnAQRxMS4Eww16QenqiH8PaLj86OxhWuFxafvxzQ8kJSbIRVlSppE7A
	XZfSziFNfYRILATzxohuV2fMUFky7jXZn1BFB1bvs80hc49n5qWt25w6oAK4+ZZOhI3+LWX
	BJdbYAzfz62GOu0xy3q+AoTb1nB87TO0JPCoX+rY+uPnyUz+bkG/hKdhq7KjHKHBbRqIxUQ
	HWMMBi27hnNjd7UGJUEdCV+8EgT5KX9RfIYc5uwJuKVSKVmSZ+94R5HtuXmMzTx67RD6lvG
	lAV42TUpyf3ZqTbdZB4gKR7os0BVCahn5XF01SN5qQH2XtQPUUuKoHUX0zxpdhfnsBPt4L0
	o5lpn/ld9kUqu4ouwlAIPTp1VJbOi2HR/kTrKstmLW4VG3Sm/o42icR9FneaUi1HR9NDrIr
	0AnoItDWXVf2QHbptE/bi2TNqnIPFJs8ue5J6X9K6ws/HIbYrTQFnkU7LkLFDZ9QdrFj9KY
	HkHH4XizhPUVBkwxHHHjBqdaD7OGuZcBHIWHqSaazUrbn8Hbpe++QulgA6qkC+14LJRjFqK
	I9ZG54cNlaUerstFbpoJ9hmCJbiV/p+lxr1eQdxS+Z9siPmOYjobfgF52K8FhYxo46yltb1
	IAkDK5HeUxG23w7lincjHQ6vktr4/715l/5z3zUgAYpnbwr92NWr9VAv69c9BXWOeqtHySK
	n1wOkDjHxe3urgGPII6T0fB4cQ4NLSUnIUdkGocdml5JiCoC42ROqKMYnFotc3cigbybZhq
	LCMsrd46nAGBziqe/U0n7SAE8MVwGqd0Q+S37N0Wv5KnD1nQOxZ1od8ZOT3qAQNO7ogb8R2
	pX2E98ZKRIKibiy5YLSgwZq2WFUFW1+R6GqIVUh0fjFlqwMBsi1ggoNdyi0u5cPC8K8CXjb
	w==
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
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
2.50.0

