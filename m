Received: from zg8tmja2lje4os4yms4ymjma.icoremail.net (zg8tmja2lje4os4yms4ymjma.icoremail.net [206.189.21.223])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B61C292933;
	Tue, 10 Jun 2025 12:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=206.189.21.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749558713; cv=none; b=h+y6mTHhOFrTDlWYevY5kH5z+RY/IEv1Zj5gtLb5SnnqDynb9G8TIXiDba+hqCC16RwFf/FJQddiL8Hk+5E6Ms3mdJ/sF9xnG39mtWn3NkNl7ExRN5W/cFABz1P0jZl5TcEH6wUYbbO7Qm2yyREvAzIBxQbzgMO4hjETxj9UpWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749558713; c=relaxed/simple;
	bh=UrhxQrMR7r1lFOhnld4WionzPvCFCoHIw1rdzKIyqDg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uJmxnL6cQ4clqnC22WTKlLE/5kPZ1EuxTudXhhgEYDB7+gQAOt1BH/udO46UfpY3FPhWeuPRmKtA1acUPHjiHV6SQg2gJGtEuhKu7vrfZeVY2TgrRBdVluz9MlNW2IpFJw3Cz2lgq3BqEpd9k6lQbjpuigch3uds1t9nzbYuNio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=206.189.21.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app1 (Coremail) with SMTP id HgEQrABnSR59JUhoJWXICg--.22961S2;
	Tue, 10 Jun 2025 20:30:53 +0800 (CST)
Received: from pride-PowerEdge-R740.. (unknown [222.20.126.129])
	by gateway (Coremail) with SMTP id _____wB3Ykl1JUhobC0mAA--.19171S3;
	Tue, 10 Jun 2025 20:30:52 +0800 (CST)
From: Dongliang Mu <dzm91@hust.edu.cn>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	corbet@lwn.net,
	Dongliang Mu <dzm91@hust.edu.cn>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] docs/zh_CN: update the translation of process/1.Intro.rst
Date: Tue, 10 Jun 2025 20:30:26 +0800
Message-ID: <a9a9c7f57db10713c477fcb0398a43687f92213e.1749557444.git.dzm91@hust.edu.cn>
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
X-CM-TRANSID:HgEQrABnSR59JUhoJWXICg--.22961S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWxur4DGr1UJrWfGFyrtF15CFg_yoW5Gryrpa
	4q93yxW3WxW3Wjv3s5Kw1kJF1kGFW7C3y3Gr4xKa4rGrn3J3WYv3yUJw13XasxAa4xZayD
	uFW0yrWDZr42yaDanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUm2b7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vE
	x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAaw2AFwI0_Jr
	v_JF1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF
	0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26r
	4UJVWxJr1lYx0E74AGY7Cv6cx26r4fZr1UJr1lYx0Ec7CjxVAajcxG14v26r4UJVWxJr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxAIw2
	8IcVCjz48v1sIEY20_GFW3Jr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AK
	xVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67
	AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI
	42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMI
	IF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVF
	xhVjvjDU0xZFpf9x07jfpndUUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/

Update to commit 43e9076a00b1 ("docs: Fix conflicting contributor
identity info")

scripts/checktransupdate.py reports:
Documentation/translations/zh_CN/process/1.Intro.rst
commit 43e9076a00b1 ("docs: Fix conflicting contributor identity info")
1 commits needs resolving in total

Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
---
 Documentation/translations/zh_CN/process/1.Intro.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/translations/zh_CN/process/1.Intro.rst b/Documentation/translations/zh_CN/process/1.Intro.rst
index 4f9284cbe33b..e314cce49d27 100644
--- a/Documentation/translations/zh_CN/process/1.Intro.rst
+++ b/Documentation/translations/zh_CN/process/1.Intro.rst
@@ -182,11 +182,11 @@ Andrew Morton, Andrew Price, Tsugikazu Shibata 和 Jochen Voß 。
 可以获得所有版权所有者的同意（或者从内核中删除他们的代码）。因此，尤其是在
 可预见的将来，许可证不大可能迁移到GPL的版本3。
 
-所有贡献给内核的代码都必须是合法的免费软件。因此，不接受匿名（或化名）贡献
-者的代码。所有贡献者都需要在他们的代码上“sign off（签发）”，声明代码可以
-在GPL下与内核一起分发。无法提供未被其所有者许可为免费软件的代码，或可能为
-内核造成版权相关问题的代码（例如，由缺乏适当保护的反向工程工作派生的代码）
-不能被接受。
+所有贡献给内核的代码都必须是合法的免费软件。因此，出于这个原因，身份不明的
+贡献者或匿名贡献者提交的代码将不予接受。所有贡献者都需要在他们的代码上
+“sign off（签发）”，声明代码可以在GPL下与内核一起分发。无法提供未被其所有者
+许可为免费软件的代码，或可能为内核造成版权相关问题的代码（例如，由缺乏适当
+保护的反向工程工作派生的代码）不能被接受。
 
 有关版权问题的提问在Linux开发邮件列表中很常见。这样的问题通常会得到不少答案，
 但请记住，回答这些问题的人不是律师，不能提供法律咨询。如果您有关于Linux源代码
-- 
2.43.0

