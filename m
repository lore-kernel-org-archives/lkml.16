Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F8621ADDB
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 08:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744877354; cv=none; b=L+A0vQAsIGr4fmY08s9j0+p7xqUdN9rILIvlW+tNTvShKht5iK+xyc2y6TVSbDCI0RzFPrAEu+XdGgnJd5h0t9fIJM/P+h9sIOEJm2gQCkcz/ocaG+XAr3znq53bOhfaYNfD//PRS153JiqA3pQh3OoLnYb5X0A6bwLtQnAjwxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744877354; c=relaxed/simple;
	bh=LvPXnh51V+FxKza9w5I8Oa/g8MHXOgAa70guwTdd9x4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EstyvMUkpB8Hr301IdeaOhNXuiDVXIBtIxscawZOa5tnu9IQcZrKm5TWNhy5VMmEKFNl1ek6gY7xd/Y2i2YrZEYv+FT7jucNIVDaDQn1xK84df+O45U91LIysKQs+IUdpT9MNB274Bm1krCbdkgmzZk4GHnRimXfwQd482hFYmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=dpP/pLMS; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="dpP/pLMS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1744877292;
	bh=BXpHJIusXX/IjXfyhBs6rYyVHN78GVwZVH7M4sTBy4I=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=dpP/pLMS94WMcr29wC5e3TMBL4p/3MasyT8JtRZ4LYme0zOsxvdFx/ZvFM1B6sJAa
	 uEQ9iNK1+XdqcXbEvNnNR5ip9wUPeLvjrzwH46asES0rfjllNnaeFZnOgf4FiA18Rh
	 A8jUr/jr9W5kbHJl9+ElHm9+GYjn6qErxEFSgeEg=
X-QQ-mid: zesmtpip2t1744877281ta446f0d2
X-QQ-Originating-IP: KgSWvsVE5LlZFuuA8sg1K79V3p+hHggUJiMUP3zDgVU=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 17 Apr 2025 16:07:59 +0800 (CST)
X-QQ-SSF: 0002000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 8397205687042694865
EX-QQ-RecipientCnt: 12
From: WangYuli <wangyuli@uniontech.com>
To: chenhuacai@kernel.org,
	kernel@xen0n.name
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	jiaxun.yang@flygoat.com,
	liuyun@loongson.cn,
	chenhuacai@loongson.cn,
	zhanjun@uniontech.com,
	niecheng1@uniontech.com,
	guanwentao@uniontech.com,
	WangYuli <wangyuli@uniontech.com>,
	Erpeng Xu <xuerpeng@uniontech.com>
Subject: [PATCH] LoongArch: Select ARCH_USE_MEMTEST
Date: Thu, 17 Apr 2025 16:07:46 +0800
Message-ID: <CC80F694AAFA2099+20250417080746.352276-1-wangyuli@uniontech.com>
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
X-QQ-XMAILINFO: ODtOp3q7LZp1JSPzBJGD3Nmsc+fXMszNTto8IS0/OJqetBWt48vcnATg
	aQB5A8b1bReT0/+0KfnXe1dv35vZVNOAbGFT4f04TnjV25RZ+c1LDcA/K5bIdO5Cyi506PR
	pDA5x3I7dlXaSWhj/hrv+ooYjTVkubLDf+1HA1dfkSc0sSonvKIu3cQTWnSYAr41gK2VWSY
	B9DnPZCP6KJJu4CFzlLW5tahR4bjkVqdXvxfPy+rNWal2Rw42LL8G9QmLB0oSdBikxR4lFt
	/1eHTNoeGxMW8NfsRIzdqQx5GvSz4FweUbmnC0+EHY3CByVwS01Z5eYoaPu27Ef/2kiGFV9
	7Dt3Z/Jco6SVUXwCvtW0h2B51Q/FChX51pk/oIvkTZzmdRKP0dja96j94JQFCEnaViq38eG
	MgH6wtc0NSZo0OyEAnmn+uxsleWre05nZ32HLigliNyuHEr2fpRfcQV4dIkdUhrIXCyU16D
	ZiTVBKYx/9O2t8fuHXPkuVpHH+fvHSJMJeNyZvN3DpmYqbp+9vSTv5f+U4I5tH1vK6+Ic29
	hreRlzKdCY9exlf7Co/Tjw3MDbZvg0bxEzTtJYWeZYMI/k13Shxqr11W6ebUGnJP/bVzFHQ
	ryJz3FRwA7/Nat/NCpWoU+KUyumNDCdwPhh1dS09rx54N4fI1kdNIA9DLxziM2DcFkrS9Eo
	V97kATnuVAmwKizq7otIEGd4CZ1hLTBsvPcvLPUGnqW8MGqvtXdaquZ0M14N4AQDnovtdOD
	U7rP2ZQ1qy3pRtAQ0sEb71llSxj4UKd4egupVXmIMwA16juJznJwcJCWKVsA0Bcpluqcfmv
	vsU94Hho3DM7a8r9+dsluiSvzs1rPIE5bVbUfm/MLbvwSX8dmqlUM963WH9t8NQC0bOojZM
	dmQ3rdzd0Is/HxDxT0z+lxPEKklBjSb90HGmh26M80I98+6f6cZgRXb7skh2WX2h60izQzj
	Xacs9OLhKFhQhBCEJWckJipfytDGkctaaNv5iIhnC6cM6uL0AWtVJaSmawKBdhbEpM762I/
	HlF2kBU4Lfaczr1Z7ScHyZMFOrIwj5uVfUz0tpHrOqwEZZGMMt
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0

As of commit dce44566192e ("mm/memtest: add ARCH_USE_MEMTEST"),
architectures must select ARCH_USE_MEMTESET to enable CONFIG_MEMTEST.

Commit 628c3bb40e9a ("LoongArch: Add boot and setup routines") added
support for early_memtest but did not select ARCH_USE_MEMTESET.

Fixes: 628c3bb40e9a ("LoongArch: Add boot and setup routines")
Tested-by: Erpeng Xu <xuerpeng@uniontech.com>
Tested-by: Yuli Wang <wangyuli@uniontech.com>
Signed-off-by: Yuli Wang <wangyuli@uniontech.com>
---
 arch/loongarch/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 54ed5b59a690..1ce9b8f5fd03 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -74,6 +74,7 @@ config LOONGARCH
 	select ARCH_SUPPORTS_RT
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_CMPXCHG_LOCKREF
+	select ARCH_USE_MEMTEST
 	select ARCH_USE_QUEUED_RWLOCKS
 	select ARCH_USE_QUEUED_SPINLOCKS
 	select ARCH_WANT_DEFAULT_BPF_JIT
-- 
2.49.0

