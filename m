Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.58.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F831F3D30
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 11:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.132.58.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739188041; cv=none; b=rKxkhpP0Tk44lBP2ubCrB4bQPK48fFvUEWjw10JgBJV9AnB9GAXMgieX6wu2AC+GPDuBuGwjkvVCURItnz0AoBKQts/nEPRD2gkGJN5kBH5LlSwjW7b+O434eSqqMtizG2PC4+wry/OkCjAa1nlaPw/VrBcj07AnXzud2yGHLtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739188041; c=relaxed/simple;
	bh=GzG9/JewF2R9hgWMnABUvCORIphwvk2NHpyoL5fvoz8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LfR9oft8sFejAo4txmc+xoXjUU5fzcYMnJeqjEk9LQijspLAcAx/1XAafgeiFcFnyx9ZL5KQ/oP5Q0vC40fDbQKGRejq0GNqYxmBijgYzaDqNRp1/h0zsW683cersx6i2qO1Uh5SZlKTcmcOXmQX/t8cjZYnozn4NruE6HyYSZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=I0UPZrP8; arc=none smtp.client-ip=114.132.58.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="I0UPZrP8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1739187987;
	bh=m1grcYhOjtkQFfMg+6V4yipR+q7gHGrp5uZpxwpcixI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=I0UPZrP8mxiWc1HxUM1BRkCF2v1yXjzb6vS09JAtgh4+lxBS1a+MSHNDLxxREA+a2
	 QNij34cZ7qbzkUGhe9Ja+ZZlCoc0UCcK7rnu5Kf6VY/WqXXxuyWLYbJd8Z8FFmYIte
	 hloVlm8kweg+mYlAsUAdM5uAUBlhcwqsu4YPwl7w=
X-QQ-mid: bizesmtpip2t1739187948tanchur
X-QQ-Originating-IP: YjZyhasVfxTRnsGik3pptVUnM9gplCpsHZpfchVxcbY=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 10 Feb 2025 19:45:46 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 10396166132984000817
From: WangYuli <wangyuli@uniontech.com>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	wangyuli@uniontech.com,
	guanwentao@uniontech.com
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	maobibo@loongson.cn,
	zhanjun@uniontech.com,
	chenlinxuan@uniontech.com
Subject: [PATCH] LoongArch: csum: Fix OoB access in IP checksum code for negative lengths
Date: Mon, 10 Feb 2025 19:45:43 +0800
Message-ID: <D4E490BD8F1E672B+20250210114543.1090146-1-wangyuli@uniontech.com>
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
X-QQ-XMAILINFO: NiFdmnmiW14nC9wbGKWXWlrdR2n6UrhxDQwi9XvCzhqvQw1ruDwRMa93
	9uOXFYF6BIpF4Z+byJDx6gPJ5dT9RZjyzarcS1GUDPKRMaR4uERozEpxTfm4SLnu52rh1R7
	pEaNMuTWBdnQo2gKaxHOeF+PaY8uFRvwEwym7EoWWD1WTF/ARDDgmxZpvxopWniACOFzEVI
	q3hqnPxcfJ5lrLNYePWtQP8QTz8jmVhMwpiTAJKHgXjn2WX3bJmktt4FercfDtP6D++61xr
	QBplUfaYFCOZZLTNF+inYTYCkSNS4NBV7AlL5JreHfen0gbXA7j3top5wQqt6KEzyHvEpxh
	PQy2f57/sBqwJTR6cxBBYnWmyU1KLtdziK2eGNUzF2XP53QbzwZAvL1GFfsp0sq21pMwbjx
	ABwyCnwdG6gK+C2iO+Jn55IfXI5rSTLxAW6U6U6LV1lbavbkN/ccrHYyEQmBd/hJ1D8pGxk
	MjC8fwQkeaR6RQduZRk81LHH5h0hJChZL69/aIf/HjGePk68CLkDmdPYcuoQIYtUyH0/ibo
	g9Pn1ObT3UKAqSH7A41gSlovd+PFEieBXYJ2N+Tb2565klX5OXl6giDQaWU8m9KrTBAtKxw
	pAdFQr6qvxG3TC1AwaO5hnm0j34/bD3UJvRTbnjiolqWFtWcpFqQ1pGrUXTbLg34zOa075/
	Wv8P9wGA7MS7F33FCjmc7O0I/UBD7YuHrUVwvwFdH5e4ol/k84oVyG2TbDRQCABx+ikh7nP
	mfTtRKvm7SSiKJmKXmik8JpdggWGt4tF0jQQqNXtglLJ3eqWIIw8BSw6xC0dAKzRlPBQbnF
	OGdCmpBcer63LANayBEBLD/usP3Pi7V4bTjiS+KFZeQLE+xBFpOtsZ6Ue/GfNF1AHMIGl0l
	iH2C1dN5ly8CMBpkqWQ2hICp7ye9phCRNCWDp/bhUdkaR/cwuIdZamlBawuBT9WXsczILc6
	GtPhMZtBzpQdD0vFKlcXdjgD8avJMi6H9dRbPQVcy+L/ryxsc16/ZT0aT6f7xpeT0hRZm++
	RracZIp+AvtaLMV4e6
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0

Commit 69e3a6aa6be2 ("LoongArch: Add checksum optimization for
64-bit system") would cause an undefined shift and an out-of-bounds
read.

Commit 8bd795fedb84 ("arm64: csum: Fix OoB access in IP checksum
code for negative lengths") fixes the same issue on ARM64.

Fixes: 69e3a6aa6be2 ("LoongArch: Add checksum optimization for 64-bit system")
Co-developed-by: Wentao Guan <guanwentao@uniontech.com>
Signed-off-by: Wentao Guan <guanwentao@uniontech.com>
Signed-off-by: Yuli Wang <wangyuli@uniontech.com>
---
 arch/loongarch/lib/csum.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/lib/csum.c b/arch/loongarch/lib/csum.c
index a5e84b403c3b..df309ae4045d 100644
--- a/arch/loongarch/lib/csum.c
+++ b/arch/loongarch/lib/csum.c
@@ -25,7 +25,7 @@ unsigned int __no_sanitize_address do_csum(const unsigned char *buff, int len)
 	const u64 *ptr;
 	u64 data, sum64 = 0;
 
-	if (unlikely(len == 0))
+	if (unlikely(len <= 0))
 		return 0;
 
 	offset = (unsigned long)buff & 7;
-- 
2.47.2

