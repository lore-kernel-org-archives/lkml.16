Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7935222687B
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744012478; cv=none; b=O8Ww47xJit7rBjpgDSCGNBUoXXsQEV0Hr3NP9QAQsr71xE6V53EGi/K/Kyu+ReHGFRhN/fEdJzkyrZyzOaHVbBddBS7ucaig07TrBOXE07xSPR8t9j5EDr1vhDDJbHq/AxcAX1XnNDGjBYf2qrqvy+O67Bv1MEPZHA5Ridmb5uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744012478; c=relaxed/simple;
	bh=3w2pbTsXuYmgwYq1pS1VftJm5W19cRoO89+5tbh2YyM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pKD5dG5VoCRKxQXb1uBvgvaNg2q6aTqrGpNIym9O3DajCJLLKOUM/W2nNd8t13ghyCExTInPhQcKcFwWhSikKY0/oOUh8NIqGaDMPiqAaXO/QJyT9JgkiS+Mvo0yzHlDA+Mncu7y0a+oAHDbWj9kCOTNHDToypmYBvTDofe/xr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-03 (Coremail) with SMTP id rQCowABHtkKzhPNnqjDWBg--.33106S2;
	Mon, 07 Apr 2025 15:54:27 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: jpoimboe@kernel.org,
	peterz@infradead.org
Cc: linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] objtool: Remove unneeded semicolon
Date: Mon,  7 Apr 2025 15:54:05 +0800
Message-Id: <20250407075405.2777365-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowABHtkKzhPNnqjDWBg--.33106S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZFWDuF4rXw4xWF1rWr1rZwb_yoWxAFX_Cw
	1vgFs7WFZ5uFZFyr1UA3409w1vq3WrXws2gw47ZFsxJa45Ca1qgF97uF4DCwnIyry0vFZx
	Cas5AryjkwsF9jkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbsxFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxkIecxEwVAFwVW8CwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
	ZFpf9x0JUVT5LUUUUU=
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Remove unnecessary semicolons reported by Coccinelle/coccicheck and the
semantic patch at scripts/coccinelle/misc/semicolon.cocci.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 tools/objtool/builtin-check.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/objtool/builtin-check.c b/tools/objtool/builtin-check.c
index 80239843e9f0..d86d0154ced8 100644
--- a/tools/objtool/builtin-check.c
+++ b/tools/objtool/builtin-check.c
@@ -241,7 +241,7 @@ static void save_argv(int argc, const char **argv)
 			ERROR_GLIBC("strdup(%s)", argv[i]);
 			exit(1);
 		}
-	};
+	}
 }
 
 void print_args(void)
-- 
2.25.1

