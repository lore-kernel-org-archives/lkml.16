Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7838D209F2E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 09:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751360707; cv=none; b=skHkjVacv6doi5hRk1MZZeATjLnDqR8Jw5b/lmrkakP6tHyDiU/VPc8oLrlUL4HXYQow98aycbzCRXPLIQv9KI8pxBQzu/k5/x+OU4RQntKnuXlMGsCHq7IwvtvaK0xhgbS3XITPaACmdHOQf9WVtW2cE8ql+YgV0wkY+Gr594U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751360707; c=relaxed/simple;
	bh=LwXvsYpbCwAEWR7ekcunMqFll7qnOILlUBlJbEUhCeY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HhSw2VviHTNmmiefGAZh9bYWWMbCvpxi6RpGFsyikSM2BOJ5X+TORj2wYOfG8zpyKtCBsjC6ftOAbH7e9vxUGbCH5Oi1fg0I3Wj7kv4NSOnDHtV/iW5kgmS59oJUkQOpYxNdkEA/lWDL5g0ggymq3lT07JbL9L3RudLGkdLX8WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [111.207.111.194])
	by gateway (Coremail) with SMTP id _____8Bx63G0pGNotncgAQ--.5426S3;
	Tue, 01 Jul 2025 17:04:52 +0800 (CST)
Received: from ubuntu.. (unknown [111.207.111.194])
	by front1 (Coremail) with SMTP id qMiowJCxM+SxpGNo0LEEAA--.29147S2;
	Tue, 01 Jul 2025 17:04:50 +0800 (CST)
From: Ming Wang <wangming01@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Andrew Morton <akpm@linux-foundation.org>,
	Bibo Mao <maobibo@loongson.cn>,
	Hari Bathini <hbathini@linux.ibm.com>,
	Guo Weikang <guoweikang.kernel@gmail.com>,
	Ming Wang <wangming01@loongson.cn>,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	Usama Arif <usamaarif642@gmail.com>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: lixuefeng@loongson.cn,
	chenhuacai@loongson.cn,
	gaojuxin@loongson.cn
Subject: [PATCH] LoongArch: Support mem=SIZE kernel parameter
Date: Tue,  1 Jul 2025 17:04:49 +0800
Message-ID: <20250701090449.2426151-1-wangming01@loongson.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxM+SxpGNo0LEEAA--.29147S2
X-CM-SenderInfo: 5zdqwzxlqjiio6or00hjvr0hdfq/1tbiAQEKEmhjeJ0EVQAAsn
X-Coremail-Antispam: 1Uk129KBj93XoW7Ar17JF4DCryUWryrArW7Jrc_yoW8Kryrp3
	4xCrs3trs5Kas7u397Kwn3Wry5Awn3Ga4xWFyakw1rCF15Jr1UAw1Iq3WavFy7X3yIqrWI
	qFs5tFy29a1DZ3cCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUP2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AK
	xVW0oVCq3wAaw2AFwI0_Jrv_JF1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij2
	8IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
	Yx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
	WUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxG
	rwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8pyxtUUUU
	U==

The LoongArch mem= parameter parser was previously limited to the
mem=SIZE@START format. This was inconvenient for the common use case
of simply capping the total system memory, as it forced users to
manually specify a start address. It was also inconsistent with the
behavior on other architectures.

This patch enhances the parser in early_parse_mem() to also support the
more user-friendly mem=SIZE format. The implementation now checks for
the presence of the '@' symbol to determine the user's intent:

- If mem=SIZE is provided (no '@'), the kernel now calls
  memblock_enforce_memory_limit(). This trims memory from the top down
  to the specified size.
- If mem=SIZE@START is used, the original behavior is retained for
  backward compatibility. This allows for defining specific memory
  banks.

This change introduces an important usage rule reflected in the code's
comments: the mem=SIZE format should only be specified once on the
kernel command line. It acts as a single, global cap on total memory. In
contrast, the mem=SIZE@START format can be used multiple times to
define several distinct memory regions.

Signed-off-by: Ming Wang <wangming01@loongson.cn>
---
 arch/loongarch/kernel/setup.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.c
index b99fbb388fe0..af59ba180dc2 100644
--- a/arch/loongarch/kernel/setup.c
+++ b/arch/loongarch/kernel/setup.c
@@ -191,6 +191,16 @@ static int __init early_parse_mem(char *p)
 		return -EINVAL;
 	}
 
+	start = 0;
+	size = memparse(p, &p);
+	if (*p == '@')	/* Every mem=... should contain '@' */
+		start = memparse(p + 1, &p);
+	else {			/* Only one mem=... is allowed if no '@' */
+		usermem = 1;
+		memblock_enforce_memory_limit(size);
+		return 0;
+	}
+
 	/*
 	 * If a user specifies memory size, we
 	 * blow away any automatically generated
@@ -201,14 +211,6 @@ static int __init early_parse_mem(char *p)
 		memblock_remove(memblock_start_of_DRAM(),
 			memblock_end_of_DRAM() - memblock_start_of_DRAM());
 	}
-	start = 0;
-	size = memparse(p, &p);
-	if (*p == '@')
-		start = memparse(p + 1, &p);
-	else {
-		pr_err("Invalid format!\n");
-		return -EINVAL;
-	}
 
 	if (!IS_ENABLED(CONFIG_NUMA))
 		memblock_add(start, size);
-- 
2.43.0

