Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48CF17B506
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 08:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739001815; cv=none; b=QBgF/PwPMVltgXFwLQL3wrpVWGx05SvQw1BtgONRagu+yeYI15W4BAyy8byR5JB3vXjLeu7Ztd35b1o5AGTogyxpWksspEblrXvCE/riNqBzF9o/zyn8lNSXFBoQjK8B8v6X5LiOJ4zSCQ8bGnhaYJy1rrAZBvKvr5RjjM4fhEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739001815; c=relaxed/simple;
	bh=fp3yNdV4dxXMRi80coUOwaKpOJz4Lwgnb74388pRDO0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HaTVMQ3dq92lz6aV2KVJCUfJRSxHmAFxOx8d37HWrt0e7x/xivxM0KEtOA5gsySFKGn79L63JIEjgGIm6uC2VgJv1tJZouuRE4vrJMegBkO2xz0dRFrNv+2mw8j7bN538YfhJc/hHDmjzMNgT0XPaO22/c2b1YcHojfcsGDU+08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=lnB8bVET; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="lnB8bVET"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1739001782;
	bh=3TrnJ9Z/xHsuAJRQWEc2Y4wHAx1RLl4jmH7juixi/sY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=lnB8bVETThOiybRUyft+/lk5sQdxu+rKqq8GvK5q8eMk9ufNVEqPckRLto1SLkuL3
	 4uwzPlvxdN+FIBpAJBMX/fb2/lgIOAI/WLb8Il1Ud0rbkItJd9UOskfJVFHAgLq/Xr
	 Refvjsg7z7zBSfiLlUqjqL7lNCD0gufVOrgcXfaw=
X-QQ-mid: bizesmtpip2t1739001751t3104pp
X-QQ-Originating-IP: E4IyHBnUuc9fRvKJa/yzIGK9PefjtvXqre+Oyu9sS8I=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 08 Feb 2025 16:02:29 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 2714771911060073859
From: WangYuli <wangyuli@uniontech.com>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	guanwentao@uniontech.com,
	jiaxun.yang@flygoat.com,
	wangyuli@uniontech.com
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhanjun@unionetch.com,
	chenlinxuan@uniontech.com
Subject: [PATCH 1/3] LoongArch: kernel: proc: Use str_yes_no() helper function
Date: Sat,  8 Feb 2025 16:02:19 +0800
Message-ID: <66FB3B84EE934511+20250208080221.1083810-2-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250208080221.1083810-1-wangyuli@uniontech.com>
References: <20250208080221.1083810-1-wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: N3SCbsWvOCfFEp4RliRaViCInTKp/l+D/0rtMPbhZ2/fNsRZcDLfymUs
	Vh19A2P8EOfvLQi7A9O3g2aebZS3JqCFhvLJtqjGEIfijRv2gVdPD+7PMeTOmaXawDiYgo3
	knEezFMgKBz0+OV2w5QuXC/G597uMi0YlQ11zItqxey9YK7yg9c8hW5KBKb05wu+lBeuiLi
	nquxP9IxMN64mGRTZybSrAjCue4NwU+ZVfXY4SBTkbPkBRpQp7it9dmZEIVNiUWOJT2vNXz
	qMR/UCKww+BYqBvZ8Ga7YHK/Bs4UQRj7skwYpa4/hBmyemquev43TRCCsjg6FUhHJOV3nPk
	i/y4iIEHCt+z/Uao6xItYQbstk0JgkwU5XGu1A2v+IeCTJMwKL+sftv2K+BaHU4b+HM4l0G
	q0d+WOwVQlJpogZ0mBq1OxSBOo8fCm+HgNwvc3goxvIEnOaMJZoYJiLWly7CXxCiu73pgnS
	LDZqzqadV50M0yMHh4dUeCh0JU9iIKFVzLKG7/7SmwCmii7bHnG+P/kU6Ky6hF8dETdBwA2
	iZ5xaGYXA4Cqap9gL1YXs4sfmLcNYCj3JiOQETJI5nzEUKpMPmkw70mPA3xjDdcqv5KXvNw
	NVHYLy9KXHu06AcuQyMz03GvfwzvecJ+6KSEGuQqWMC3Y08dR5CS1mtvw/PdyrajzHE/9Wc
	4oQ6ZG1LDusqyvAjeH7FttEBmKtFlYlSPYzRlAQUpycrCtty1xz/g43lZiAN2vqkC6AvYxZ
	GhJ3m/LtFkoxRuAEZI2ZyDNblgciZClW7zBH0fYFqQ41QE/62+3M98XbuP0jLIdJoVysJNO
	+yFEGq7gGJrsU8ytucS6GOFb2qVOTBTHXYKJY/rYbIxxMtDA9TjGCjXtu4q6OJ0ZDRkrULC
	u+6xAZbSiitsA01771FlEXnk2/L1lk7t+cxiS6dyCXTz5U/paTYmb1qj6JQSHnG4yvYj5hn
	FuRI8f6C/HR99HlFqqWlWqhP+gw6jgLjarczmKB+mzNfXQLF2bC1UU6Q9Qv0a5JOn+5vyvL
	6YCEOds8XziGJbiLCPwyylfPULRQo=
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0

Remove hard-coded strings by using the str_yes_no() helper function.

Similar to commit c4a0a4a45a45 ("MIPS: kernel: proc: Use str_yes_no()
helper function").

Co-developed-by: Wentao Guan <guanwentao@uniontech.com>
Signed-off-by: Wentao Guan <guanwentao@uniontech.com>
Signed-off-by: Yuli Wang <wangyuli@uniontech.com>
---
 arch/loongarch/kernel/proc.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/loongarch/kernel/proc.c b/arch/loongarch/kernel/proc.c
index 6ce46d92f1f1..56a230238c9c 100644
--- a/arch/loongarch/kernel/proc.c
+++ b/arch/loongarch/kernel/proc.c
@@ -91,10 +91,9 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 	if (cpu_has_lbt_mips)	seq_printf(m, " lbt_mips");
 	seq_printf(m, "\n");
 
-	seq_printf(m, "Hardware Watchpoint\t: %s",
-		      cpu_has_watch ? "yes, " : "no\n");
+	seq_printf(m, "Hardware Watchpoint\t: %s", str_yes_no(cpu_has_watch));
 	if (cpu_has_watch) {
-		seq_printf(m, "iwatch count: %d, dwatch count: %d\n",
+		seq_printf(m, ", iwatch count: %d, dwatch count: %d",
 		      cpu_data[n].watch_ireg_count, cpu_data[n].watch_dreg_count);
 	}
 
@@ -104,7 +103,7 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 	raw_notifier_call_chain(&proc_cpuinfo_chain, 0,
 				&proc_cpuinfo_notifier_args);
 
-	seq_printf(m, "\n");
+	seq_printf(m, "\n\n");
 
 	return 0;
 }
-- 
2.47.2

