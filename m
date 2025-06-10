Received: from zg8tmja2lje4os4yms4ymjma.icoremail.net (zg8tmja2lje4os4yms4ymjma.icoremail.net [206.189.21.223])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA1261FAA;
	Tue, 10 Jun 2025 12:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=206.189.21.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749558726; cv=none; b=C2Ipw85ix4KHtHMe+vbGR/p2zKqYjLickVKpQabzEw/zLY/W9i1gv8SYqcCnD23jHigo9X2iR9iQW1yLCWLdanF9imJIGCrDeqVS5zRwWgFaHf4dWPcgPMfnBn1DAaJ8gAWrl6mohIgziVutekngWtbDxa7727pGA22i/UtaM2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749558726; c=relaxed/simple;
	bh=D0iOthBPbk50OiaIy43p2FFlgka6reBoI3anxUUEo0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RaujIm/MTRkFfLNFZXJ0G6FkwPfjNbgGMHRAMVuZJ4k0JlNLQIU5ieG5mi7RLKQvat+KaDvFrerrYCdjNRuUEydlWpmvMAUCcgp8UyTW6OdsRfmULj954E8Hb7MfwPFy+DMgb6S+mHiQMphujVivfHMJ0bilZT++R73aOuGiDsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=206.189.21.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app1 (Coremail) with SMTP id HgEQrADn7haLJUhoLmbICg--.28011S2;
	Tue, 10 Jun 2025 20:31:07 +0800 (CST)
Received: from pride-PowerEdge-R740.. (unknown [222.20.126.129])
	by gateway (Coremail) with SMTP id _____wB3Ykl1JUhobC0mAA--.19171S4;
	Tue, 10 Jun 2025 20:31:06 +0800 (CST)
From: Dongliang Mu <dzm91@hust.edu.cn>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	corbet@lwn.net,
	Dongliang Mu <dzm91@hust.edu.cn>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] docs/zh_CN: update the translation of process/6.Followthrough.rst
Date: Tue, 10 Jun 2025 20:30:27 +0800
Message-ID: <1c3590dfdbf0177c1735ff662270352b512531b4.1749557444.git.dzm91@hust.edu.cn>
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
X-CM-TRANSID:HgEQrADn7haLJUhoLmbICg--.28011S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW7Zw4fAF4UuF15CFWxGw1Utrb_yoW8Cw4xpF
	yjkryfGa1xC3Z0k3y3Kw48Cw48WF9rGayUtr1vqasaqrn5Gw4Skr9Fq3s0gFZxWrySyayU
	WF1fKrZ5ArW2vwUanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUm2b7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vE
	x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAaw2AFwI0_Jr
	v_JF1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF
	0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26r
	4UJVWxJr1lYx0E74AGY7Cv6cx26r4fZr1UJr1lYx0Ec7CjxVAajcxG14v26r4UJVWxJr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxAIw2
	8IcVCjz48v1sIEY20_GFW3Jr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AK
	xVWUtVW8ZwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67
	AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI
	42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMI
	IF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVF
	xhVjvjDU0xZFpf9x07jfpndUUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/

Update to the commit b45d8f387157 ("docs: remove the tips on how to
submit patches from MAINTAINERS")

scripts/checktransupdate.py reports:

Documentation/translations/zh_CN/process/6.Followthrough.rst
commit b45d8f387157 ("docs: remove the tips on how to submit patches
from MAINTAINERS")
1 commits needs resolving in total

Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
---
 Documentation/translations/zh_CN/process/6.Followthrough.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/translations/zh_CN/process/6.Followthrough.rst b/Documentation/translations/zh_CN/process/6.Followthrough.rst
index 2a127e737b6a..3d19c59ca6e4 100644
--- a/Documentation/translations/zh_CN/process/6.Followthrough.rst
+++ b/Documentation/translations/zh_CN/process/6.Followthrough.rst
@@ -49,6 +49,11 @@
    变。他们真的，几乎毫无例外地，致力于创造他们所能做到的最好的内核；他们并
    没有试图给雇主的竞争对手造成不适。
 
+ - 请准备好应对看似“愚蠢”的代码风格修改请求，以及将部分代码拆分到内核
+   共享模块的要求。维护者的职责之一是保持整体风格的一致性。有时这意味着，
+   你在驱动中为解决某一问题而采用的巧妙取巧方案，实际上需要被提炼为通用的
+   内核特性，以便未来复用。
+
 所有这些归根结底就是，当审阅者向您发送评论时，您需要注意他们正在进行的技术
 评论。不要让他们的表达方式或你自己的骄傲阻止此事。当你在一个补丁上得到评论
 时，花点时间去理解评论人想说什么。如果可能的话，请修复审阅者要求您修复的内
-- 
2.43.0

