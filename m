Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A01E1514F6
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 16:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743698160; cv=none; b=l2JnBdbwv9QA6yb0dKY+p7DGoxM2TkYoeVlawBxvWQPU+cjAFM463AjHq3KcAvic4gqt0Nk7J+5rTeUKuJItNLYqiwn/THZcG6a4WKN4r2846isUIKDiF4c+xEuJLIB4xbhZnkCgEuCQIrH02/ITKGcva1yqgrZDgAsDHDP0Vbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743698160; c=relaxed/simple;
	bh=K1FNdcFBqE84EbtEJKxo8KoJG/wUIPDsp4ufsPdFGYU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kwU1vlE9uBO2tBqQolKs8VLRRC/4b5inIbFaC5jjT3F1+lk9Tlj/keJWnJuZViv5JwUACtibKbq1MCwG+v6dFXkiQh5zkR42f8QwytM8tzhKh6NG/GwJ3pk3XYX3Kr6nlFQnM7OP7ZssOzi9vMDRou63xMQIqOWvFJqDHWlMS+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [221.222.48.127])
	by APP-05 (Coremail) with SMTP id zQCowACHvgbnuO5n8zCJBQ--.6940S2;
	Fri, 04 Apr 2025 00:35:53 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: abbotti@mev.co.uk,
	hsweeten@visionengravers.com
Cc: linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>
Subject: [PATCH] Staging: comedi: Add DMA preparation before mite_dma_arm().
Date: Fri,  4 Apr 2025 00:35:35 +0800
Message-ID: <20250403163535.2494-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.42.0.windows.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowACHvgbnuO5n8zCJBQ--.6940S2
X-Coremail-Antispam: 1UD129KBjvdXoWruF4rWFyUKFyrZF17Zr15twb_yoWkGwc_CF
	1fZryxCrsrKFy2vr1Ygw43u3sa9FWDZ3Z7WryaqrW3Xry7ZayxZr1vvr9xJw18Ar4vvasx
	Jwn2qryfZryxCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb2kFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Jr0_
	Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
	1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVWUMxAI
	w28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr
	4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxG
	rwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8Jw
	CI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2
	z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7sRRXdjtUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwwBA2fuaeLcHwAAsI

The ni_tio_input_inttrig() calls mite_dma_arm() without calling
mite_prep_dma() first. A proper implementation can be found in
ni_cdo_inttrig() in ni_mio_common.c.

Add mite_prep_dma() before mite_dma_arm().

Fixes: cb7859a90af1 ("Staging: comedi: add National Instruments infrastructure")
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/comedi/drivers/ni_tiocmd.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/comedi/drivers/ni_tiocmd.c b/drivers/comedi/drivers/ni_tiocmd.c
index ab6d9e8269f3..b943836ccf1a 100644
--- a/drivers/comedi/drivers/ni_tiocmd.c
+++ b/drivers/comedi/drivers/ni_tiocmd.c
@@ -84,9 +84,10 @@ static int ni_tio_input_inttrig(struct comedi_device *dev,
 		return -EINVAL;
 
 	spin_lock_irqsave(&counter->lock, flags);
-	if (counter->mite_chan)
+	if (counter->mite_chan) {
+		mite_prep_dma(counter->mite_chan, 32, 32);
 		mite_dma_arm(counter->mite_chan);
-	else
+	} else
 		ret = -EIO;
 	spin_unlock_irqrestore(&counter->lock, flags);
 	if (ret < 0)
-- 
2.42.0.windows.2

