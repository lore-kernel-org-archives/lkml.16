Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [52.229.168.213])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E128929292D;
	Tue, 10 Jun 2025 12:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.229.168.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749558715; cv=none; b=RvRJGXfHaz9U2V6tZGnnyZj8cOTe5afly7j8uibkAKm8+BvE5wnbaJ7dCXgrqgjwwwFAFxk2KYhb+kr23E5LzWRCze4Zj7QvVFdifwTMrX8etKU5xaljsVyNlat3GANMC0Z+DKkIONVRNyvpYz5LThxJUXVkrmF7raPCQCPmqQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749558715; c=relaxed/simple;
	bh=DfMZmPpxm8c+PoVae4yYnaM8SKklNxIdOLbeTQUzA9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uUfqciaiitnYbHC6LsnqBPSt2cKPF8e5o/0Mrrv+wXuPFWmMybMaFEAuI0eQsYt+WdyBxpGmcyYYEFh3K/zuHpf/J5xdpFtK/GlZSPPTrHQqFCnluhlP4Ug8BylnTaqisa20m6mm4AIrVIgzZ5VnO2w1YQZ3rylNmm2coodvcLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=52.229.168.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app1 (Coremail) with SMTP id HgEQrACHjBSmJUhoZGfICg--.25494S2;
	Tue, 10 Jun 2025 20:31:34 +0800 (CST)
Received: from pride-PowerEdge-R740.. (unknown [222.20.126.129])
	by gateway (Coremail) with SMTP id _____wB3Ykl1JUhobC0mAA--.19171S7;
	Tue, 10 Jun 2025 20:31:29 +0800 (CST)
From: Dongliang Mu <dzm91@hust.edu.cn>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	corbet@lwn.net,
	Dongliang Mu <dzm91@hust.edu.cn>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] docs/zh_CN: update the translation of process/5.Posting.rst
Date: Tue, 10 Jun 2025 20:30:30 +0800
Message-ID: <ce5603d746e1d64847f572660ea7bc38fcbf74ef.1749557444.git.dzm91@hust.edu.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749557444.git.dzm91@hust.edu.cn>
References: <cover.1749557444.git.dzm91@hust.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HgEQrACHjBSmJUhoZGfICg--.25494S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW7WryfZrykCryDtF4DCF17ZFb_yoW8tF4UpF
	9FkrZ7JayxJ3W2kr1xKFW7X3WUG3ZrGay3Kr1xKa1fXrn5Kay0v3yYyasYgFZ0grySyayj
	vrsIqrWUuryDZ37anT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmIb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r
	1Y6r17M2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	W8Jr0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCF04
	k20xvE74AGY7Cv6cx26r4fZr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAF
	wI0_GFv_Wrylx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zV
	AF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Xr0_Ar1l
	IxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCw
	CI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnI
	WIevJa73UjIFyTuYvjxUVoGHUUUUU
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/

Update to commit 4e6b7141d169 ("docs: clarify rules wrt tagging other
people")

scripts/checktransupdate.py reports:

Documentation/translations/zh_CN/process/5.Posting.rst
commit 4e6b7141d169 ("docs: clarify rules wrt tagging other people")
commit 9734b3e753ad ("docs: 5.Posting: mentioned Suggested-by: tag")
2 commits needs resolving in total

Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
---
 .../translations/zh_CN/process/5.Posting.rst          | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/translations/zh_CN/process/5.Posting.rst b/Documentation/translations/zh_CN/process/5.Posting.rst
index 6c83a8f40310..ce37cf6a60e2 100644
--- a/Documentation/translations/zh_CN/process/5.Posting.rst
+++ b/Documentation/translations/zh_CN/process/5.Posting.rst
@@ -177,10 +177,21 @@
 
  - Reported-by: 指定报告此补丁修复的问题的用户；此标记用于表示感谢。
 
+ - Suggested-by: 表示该补丁思路由所提及的人提出，确保其创意贡献获得认可。
+   这有望激励他们在未来继续提供帮助。
+
  - Cc：指定某人收到了补丁的副本，并有机会对此发表评论。
 
 在补丁中添加标签时要小心：只有Cc:才适合在没有指定人员明确许可的情况下添加。
 
+在补丁中添加上述标签时需谨慎，因为除了 Cc:、Reported-by: 和 Suggested-by:，
+所有其他标签都需要被提及者的明确许可。对于这三个标签，若根据 lore 归档或提交
+历史记录，相关人员使用该姓名和电子邮件地址为 Linux 内核做出过贡献，则隐含许可
+已足够 -- 对于 Reported-by: 和 Suggested-by:，需确保报告或建议是公开进行的。
+请注意，从这个意义上讲，bugzilla.kernel.org 属于公开场合，但其使用的电子邮件地址
+属于私人信息；因此，除非相关人员曾在早期贡献中使用过这些邮箱，否则请勿在标签中
+公开它们。
+
 寄送补丁
 --------
 
-- 
2.43.0

