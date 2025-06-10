Received: from zg8tmja2lje4os4yms4ymjma.icoremail.net (zg8tmja2lje4os4yms4ymjma.icoremail.net [206.189.21.223])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C92D1293B73;
	Tue, 10 Jun 2025 12:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=206.189.21.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749558720; cv=none; b=Y43etQbcuRGvS16EpAhAFeIx5H/KmDxKAIHKZ7lcDr+pj4R6rFSV1T3WlfT7UTdRV8IOZ8boUBmXDJeg7G1TLj+SlJHppBXV//8fyOlu2so75QizcRYKK2gi+cQTuexiSza/IiiBQmaw40vmg7Ac2/Ho0qyXbCP7Rd3xjLMkBaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749558720; c=relaxed/simple;
	bh=7v/zlhp7+OGVQ+ZMGrXfSLvf+WdwyiNeJ7Bslhc74HM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=vB1o0eFT7odTaQqNIMju0tC0YW7qNy8y1JbM7XrUi4aMbPHdXgTOeiHm5YITJl+qR/tuD0MlZj/hhK7VzFlVkXmHYQFiC4Zk4AMDrmvF59/Z6hMOLQhiM+3KfXJnt3VFYeFm7Czl1UMCwbad0+VYDV6KVKlBL/6s7xw9zXJWDuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=206.189.21.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app1 (Coremail) with SMTP id HgEQrAB3fBSmJUhoaGfICg--.23713S2;
	Tue, 10 Jun 2025 20:31:34 +0800 (CST)
Received: from pride-PowerEdge-R740.. (unknown [222.20.126.129])
	by gateway (Coremail) with SMTP id _____wB3Ykl1JUhobC0mAA--.19171S6;
	Tue, 10 Jun 2025 20:31:15 +0800 (CST)
From: Dongliang Mu <dzm91@hust.edu.cn>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	corbet@lwn.net,
	Dongliang Mu <dzm91@hust.edu.cn>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] docs/zh_CN: update the translation of process/2.Process.rst
Date: Tue, 10 Jun 2025 20:30:29 +0800
Message-ID: <5e43fda6c7e3597e9e11192f959df65e9de57e7a.1749557444.git.dzm91@hust.edu.cn>
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
X-CM-TRANSID:HgEQrAB3fBSmJUhoaGfICg--.23713S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW7WryDur45Ww1UAw45GFW5trb_yoW8CF4kpF
	y7Krn7Ka1xt3Z5C3y7G3yxWF1UGayxCay3Kr47t3WvqF1ayws2qrsxtr9Yg3yaqr93Aayk
	WF1ayrWI9ryIvw7anT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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

Update to commit 413e775efaec ("Documentation: fix links to mailing list
services")

scripts/checktransupdate.py reports:

Documentation/translations/zh_CN/process/2.Process.rst
commit 413e775efaec ("Documentation: fix links to mailing list services")
1 commits needs resolving in total

Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
---
 Documentation/translations/zh_CN/process/2.Process.rst | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/Documentation/translations/zh_CN/process/2.Process.rst b/Documentation/translations/zh_CN/process/2.Process.rst
index e68c9de0f7f8..31b0e2c994f6 100644
--- a/Documentation/translations/zh_CN/process/2.Process.rst
+++ b/Documentation/translations/zh_CN/process/2.Process.rst
@@ -292,12 +292,11 @@ Quilt 是一个补丁管理系统，而不是源代码管理系统。它不会
 一个潜在的危险，他们可能会被一堆电子邮件淹没、违反Linux列表上使用的约定，
 或者两者兼而有之。
 
-大多数内核邮件列表都在vger.kernel.org上运行；主列表位于：
+大多数内核邮件列表都托管在 kernel.org；主列表位于：
 
-        http://vger.kernel.org/vger-lists.html
+        https://subspace.kernel.org
 
-不过，也有一些列表托管在别处；其中一些列表位于
-redhat.com/mailman/listinfo。
+其他地方也有邮件列表；请查看 MAINTAINERS 文件，获取与特定子系统相关的列表。
 
 当然，内核开发的核心邮件列表是linux-kernel。这个列表是一个令人生畏的地方：
 每天的信息量可以达到500条，噪音很高，谈话技术性很强，且参与者并不总是表现出
-- 
2.43.0

