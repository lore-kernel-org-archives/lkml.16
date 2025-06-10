Received: from zg8tmja2lje4os4yms4ymjma.icoremail.net (zg8tmja2lje4os4yms4ymjma.icoremail.net [206.189.21.223])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AFFB293459;
	Tue, 10 Jun 2025 12:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=206.189.21.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749558717; cv=none; b=jI1axYlzqGFO1/tCSxDahp3G4XTVNxEwtGaUCMcsOlympWPhZ1guXwSQQ0LbTwURxi0MIKPEbeI79JhiaW7+sTxAUw47vrEELU2dAKv776ynP6eOHPDid2PfcqBYYodSB4tCaZz0GW8eB6yOjtH6x1IJte0rSlXmAjHUPTGDBUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749558717; c=relaxed/simple;
	bh=OOoGJQ1I2+xNWK1tTNO1uSYH0VwbFE34AVVSWwOGDPw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CwMn7bEJTC9tV+bbav3nWqbc7bgIdrwxWw7UFaWC9nKijomEyUWBdnkanRt+iMhJLauPZnpf9QbeqQAv3BvNoiSDHQyVPbmLVAqPjpFTit+jwpN7OysvxjzHfFW+Sb4uBlUwcYolEtox65gxyRnlUyvvSKTVl5oHF8fh03niukg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=206.189.21.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app1 (Coremail) with SMTP id HgEQrAA3P3+mJUhoX2fICg--.26920S2;
	Tue, 10 Jun 2025 20:31:34 +0800 (CST)
Received: from pride-PowerEdge-R740.. (unknown [222.20.126.129])
	by gateway (Coremail) with SMTP id _____wB3Ykl1JUhobC0mAA--.19171S5;
	Tue, 10 Jun 2025 20:31:11 +0800 (CST)
From: Dongliang Mu <dzm91@hust.edu.cn>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	corbet@lwn.net,
	Dongliang Mu <dzm91@hust.edu.cn>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] docs/zh_CN: update the translation of process/7.AdvancedTopics.rst
Date: Tue, 10 Jun 2025 20:30:28 +0800
Message-ID: <6cc2550da7ebfe597181d95b744abe22379f6fdb.1749557444.git.dzm91@hust.edu.cn>
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
X-CM-TRANSID:HgEQrAA3P3+mJUhoX2fICg--.26920S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWxWrWkGFy8uw47tF4xXF15XFb_yoW5ur4Dpr
	9rKr1xGan2k3W5t3s5G34xZ34rKa47GrWayFyjva4Sqr1fJrsF9rWak3sxJasag3s7AayU
	WFWvqryfurWav37anT9S1TB71UUUUjJqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQab7Iv0xC_Ar1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vE
	x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAaw2AFwI0_JF
	0_Jw1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF
	0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26r
	4UJVWxJr1lYx0E74AGY7Cv6cx26r4fZr1UJr1lYx0Ec7CjxVAajcxG14v26r4UJVWxJr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r126r1DMx
	AIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_GFW3Jr1UJwCFx2IqxVCFs4IE7xkE
	bVWUJVW8JwCFI7km07C267AKxVW8ZVWrXwC20s026c02F40E14v26r1j6r18MI8I3I0E74
	80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0
	I7IYx2IY67AKxVW5JVW7JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04
	k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7Cj
	xVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0zRuVbgUUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/

Update to the commit 6e55b1cbf05d ("docs: try to encourage (netdev?)
reviewers")

scripts/checktransupdate.py reports:

Documentation/translations/zh_CN/process/7.AdvancedTopics.rst
commit 6e55b1cbf05d ("docs: try to encourage (netdev?) reviewers")
1 commits needs resolving in total

Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
---
 .../zh_CN/process/7.AdvancedTopics.rst             | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/translations/zh_CN/process/7.AdvancedTopics.rst b/Documentation/translations/zh_CN/process/7.AdvancedTopics.rst
index 57beca02181c..92cc06dd5f4e 100644
--- a/Documentation/translations/zh_CN/process/7.AdvancedTopics.rst
+++ b/Documentation/translations/zh_CN/process/7.AdvancedTopics.rst
@@ -113,6 +113,8 @@ Git提供了一些强大的工具，可以让您重写开发历史。一个不
 更改。在这方面 git request-pull 命令非常有用；它将按照其他开发人员所期望的
 格式化请求，并检查以确保您已记得将这些更改推送到公共服务器。
 
+.. _cn_development_advancedtopics_reviews:
+
 审阅补丁
 --------
 
@@ -126,8 +128,20 @@ Git提供了一些强大的工具，可以让您重写开发历史。一个不
 的建议是：把审阅评论当成问题而不是批评。询问“在这条路径中如何释放锁？”
 总是比说“这里的锁是错误的”更好。
 
+当出现分歧时，另一个有用的技巧是邀请他人参与讨论。如果交流数次后讨论陷入僵局，
+可征求其他评审者或维护者的意见。通常，与某一评审者意见一致的人往往会保持沉默，
+除非被主动询问。众人意见会产生成倍的影响力。
+
 不同的开发人员将从不同的角度审查代码。部分人会主要关注代码风格以及代码行是
 否有尾随空格。其他人会主要关注补丁作为一个整体实现的变更是否对内核有好处。
 同时也有人会检查是否存在锁问题、堆栈使用过度、可能的安全问题、在其他地方
 发现的代码重复、足够的文档、对性能的不利影响、用户空间ABI更改等。所有类型
 的检查，只要它们能引导更好的代码进入内核，都是受欢迎和值得的。
+
+使用诸如 ``Reviewed-by`` 这类特定标签并无严格要求。事实上，即便提供了标签，也
+更鼓励用平实的英文撰写评审意见，因为这样的内容信息量更大，例如，“我查看了此次
+提交中 A、B、C 等方面的内容，认为没有问题。”显然，以某种形式提供评审信息或回复
+是必要的，否则维护者将完全无法知晓评审者是否已查看过补丁！
+
+最后但同样重要的是，补丁评审可能会变成一个聚焦于指出问题的负面过程。请偶尔给予
+称赞，尤其是对新手贡献者！
-- 
2.43.0

