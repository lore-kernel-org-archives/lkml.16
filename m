Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6F6211A1D
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 03:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743995509; cv=none; b=UZmV1xuWS7lKEMnP9qXkjrEGntN7VwSHON358srUFZ7CHwny2pOIlwxEkxcUrMWwwFFf6zKTI8X+KYUApFuCBwNJ01lFcA5Cuj++GGMwK9Mmkz/qVGqofaxvBDkoBTqwKwsYVn9AX5AAhcns7lTgt8VSKusK/ekjpljzHz6/qlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743995509; c=relaxed/simple;
	bh=XRJqv+ACq6BmsqXRvcUXVA+EstFBBMEORTugFGWrkiI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YF1W+4XRBBah4N3qswOXkY7jnk3k5+1gXdsU4PimNuP+IOPAoL2tV97pjfLo8HTjquFZkzk+vDs7xhhLLEvjCq8bVjFYASVB+wEtWO9coyE7UfIWfL7Yi8k0vsblwZs+wukbfmwFFqZcAS02EiE4tDHxtUo13OJcO2NMZdNyp8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-01 (Coremail) with SMTP id qwCowABnDv9lQvNnC+jJBg--.63721S2;
	Mon, 07 Apr 2025 11:11:34 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org,
	matchstick@neverthere.org,
	arnd@arndb.de,
	dominik.karol.piatkowski@protonmail.com,
	nathan@kernel.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] staging: gpib: fmh_gpib: Remove unnecessary print function dev_err()
Date: Mon,  7 Apr 2025 11:11:10 +0800
Message-Id: <20250407031110.2382308-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowABnDv9lQvNnC+jJBg--.63721S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZrWrWF43Wr43ur1xCFWkCrg_yoWftFX_CF
	y0kFn7J3WfCa90yw1Yq3W5Cr9FkFn8XF4ftr1vqFW3Cr4aqF4DCryFgF1jqr9rXF47KFy7
	urWrKwsa9w1akjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbV8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
	1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v2
	6r1q6r43MxkIecxEwVAFwVW8GwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
	W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
	1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
	IIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvE
	x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
	DU0xZFpf9x0JUSFAJUUUUU=
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Function dev_err() is redundant because platform_get_irq()
already prints an error.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/staging/gpib/fmh_gpib/fmh_gpib.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/fmh_gpib/fmh_gpib.c b/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
index 53f4b3fccc3c..5f64f3d989ef 100644
--- a/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
+++ b/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
@@ -1424,10 +1424,8 @@ static int fmh_gpib_attach_impl(struct gpib_board *board, const gpib_board_confi
 		(unsigned long)resource_size(e_priv->dma_port_res));
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(board->dev, "request for IRQ failed\n");
+	if (irq < 0)
 		return -EBUSY;
-	}
 	retval = request_irq(irq, fmh_gpib_interrupt, IRQF_SHARED, pdev->name, board);
 	if (retval) {
 		dev_err(board->dev,
-- 
2.25.1

