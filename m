Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F3242A97
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 08:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744879742; cv=none; b=KsApx8LW3cPOgjj0BP67UrSByyW8IlOVl7bIQohgi1W8JEgMoYTwmspkhPG4E5jzSZUd8RVmLbK8CzuP/vs/QjfLsHxBaBpYVRP9+uxvja65Wjh35CcFZKojAFbeG8SjZaUSiOUJB2IDu0CEjK/z1Ug2PK5xz9ARtatOfwHMbOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744879742; c=relaxed/simple;
	bh=F0uOQqpLHruq4l+tIs5Ah6SOn4SpgbFQCnW3maZffxA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OPODeUYyJHY1Zl3wcxkDhXgMpWwD+MVm3iC1GcuA31PvrvhzZ1XMeowI2T2csW0qEYC2LBeoibjYbeWEIr8PD0wGU9sksE05DCLZ2N+bbO5hZjpvZCDHHDoIESwOPZimZ1/0dlp144NTsAiZB4gsjvXMKXPzt9q04P7s91AZyKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-03 (Coremail) with SMTP id rQCowADHcT5zwABooPGACQ--.43279S2;
	Thu, 17 Apr 2025 16:48:52 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: nm@ti.com,
	ssantosh@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] soc: ti: knav_qmss_queue: Remove unnecessary NULL check before free_percpu()
Date: Thu, 17 Apr 2025 16:48:36 +0800
Message-Id: <20250417084836.937452-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowADHcT5zwABooPGACQ--.43279S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Xw43Ww4fGry3Xr1xXFyxKrg_yoWxKwcE9r
	4fZFn8JryvkryYgry7Gr13ZFyI9a4xWa1Iqa1jg3sxAr90vw15WF1IvryfCrW7W390kFy3
	CrWqgr1fX3W7XjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbV8FF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26F4j6r4UJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v2
	6r126r1DMxkIecxEwVAFwVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
	W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
	1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
	IIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvE
	x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
	DU0xZFpf9x0JUf8nOUUUUU=
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

free_percpu() checks for NULL pointers internally.
Remove unneeded NULL check here.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/soc/ti/knav_qmss_queue.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/soc/ti/knav_qmss_queue.c b/drivers/soc/ti/knav_qmss_queue.c
index ea52425864a9..6e56e7609ccd 100644
--- a/drivers/soc/ti/knav_qmss_queue.c
+++ b/drivers/soc/ti/knav_qmss_queue.c
@@ -252,8 +252,7 @@ static struct knav_queue *__knav_queue_open(struct knav_queue_inst *inst,
 	return qh;
 
 err:
-	if (qh->stats)
-		free_percpu(qh->stats);
+	free_percpu(qh->stats);
 	devm_kfree(inst->kdev->dev, qh);
 	return ERR_PTR(ret);
 }
-- 
2.25.1

