Received: from sgoci-sdnproxy-4.icoremail.net (sgoci-sdnproxy-4.icoremail.net [129.150.39.64])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0825285C98;
	Mon, 16 Jun 2025 13:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.150.39.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750081313; cv=none; b=SsVTl5EudXP7gVnhDG8Ruud9i3nLfioS/45AUV5NmuJCDFKOk4Jq4NbxsMT8B3FN1+Jy/POXQL6OoCt2SJNa3ATyyoOdUiCbAaOGD8ASH31Ir83acii8FDkhdH0+/8n8km+y5T2DJNUdgpg5RyJYNSqwZ4OGSOmn9ymZQK57U78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750081313; c=relaxed/simple;
	bh=UG52tGL5lemW+BQ7mx7lKFDNox+1XXbApeUAxe3ql90=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MaIMAlekvN1J79hZWubkcOOPPXMZgixFXiJCPJ6/idBoqdFXJP7FfYNL0tg6D5QiYU1do2tSYoWxAAQvOdGo8OPOCZq8tVD/2u8L74Z+/GO1fvPqqRihf31M7S3bKsIk4l1INaPwk03ZnTlSD/NYutxX3ZkeThxUQUuXTi0pwxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=129.150.39.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app2 (Coremail) with SMTP id HwEQrAD3J7DhHlBoJl2aAQ--.19222S2;
	Mon, 16 Jun 2025 21:40:49 +0800 (CST)
Received: from pride-PowerEdge-R740.. (unknown [222.20.126.129])
	by gateway (Coremail) with SMTP id _____wDngNnfHlBoWuZCAA--.2378S2;
	Mon, 16 Jun 2025 21:40:48 +0800 (CST)
From: Dongliang Mu <dzm91@hust.edu.cn>
To: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs/zh_CN: update git command examples in how-to.rst
Date: Mon, 16 Jun 2025 21:40:01 +0800
Message-ID: <20250616134003.3981866-1-dzm91@hust.edu.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HwEQrAD3J7DhHlBoJl2aAQ--.19222S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvdXoWrtw4UGw15WrWxurykXw4UXFb_yoWDtFbE9F
	93JF4fAwsrAr4xJFn5Z34jqF18uF409wn7Arn0y3yDJw17W3yDWrWDXrWkZF15XanI9Fyr
	CFZ3uayrXF9IvjkaLaAFLSUrUUUU8b8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbv8YjsxI4VWxJwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
	s7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI
	8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vE
	x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAaw2AFwI0_Jr
	v_JF1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF
	0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26r
	4UJVWxJr1lYx0E74AGY7Cv6cx26r4fZr1UJr1lYx0Ec7CjxVAajcxG14v26r4UJVWxJr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxAIw2
	8IcVCjz48v1sIEY20_GFW3Jr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AK
	xVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67
	AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI
	42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMI
	IF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2
	KfnxnUUI43ZEXa7IU0X_-JUUUUU==
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/

This patch leverages `checkout -b` to shorten branch & checkout
and fix the missing checkout.

Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
---
 Documentation/translations/zh_CN/how-to.rst | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/translations/zh_CN/how-to.rst b/Documentation/translations/zh_CN/how-to.rst
index 569b0209385a..0896f13d8b8d 100644
--- a/Documentation/translations/zh_CN/how-to.rst
+++ b/Documentation/translations/zh_CN/how-to.rst
@@ -177,8 +177,7 @@ git和邮箱配置
 请执行以下命令，新建开发分支::
 
 	git checkout docs-next
-	git branch my-trans
-	git checkout my-trans
+	git checkout -b my-trans
 
 译文格式要求
 ------------
@@ -286,7 +285,7 @@ warning 不需要解决::
 然后执行以下命令为补丁追加更改::
 
 	git checkout docs-next
-	git branch test-trans
+	git checkout -b test-trans-new
 	git am 0001-xxxxx.patch
 	./scripts/checkpatch.pl 0001-xxxxx.patch
 	直接修改您的翻译
-- 
2.43.0

