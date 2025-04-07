Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB492253E9;
	Mon,  7 Apr 2025 06:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744007726; cv=none; b=DHOXWedE9YIZFaqh2PJvGYNf7ZtJSUcpcL3CXpFhxKKx4ISgbTw6IDOq8OQm/g2tNuXdCCYejtELfTehjhBtPCVWulT22ErUEaxAC9Yzx0XkfGRwARYWYVKZR+s7qBhZYm9vRAyGn46Z4QA0zQjWBBA4OUKpwYdYbjqZ9YJHhOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744007726; c=relaxed/simple;
	bh=/1Tn3fdh1YmHdKYpDHBh99LOXaHvuuJ86z8clOnHlIU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kX4rB9DZrIBBjkJlpd2SWWQfONoqrOAt2Vdk9jex4j1sSLZK+rxcgL8Yrxabx5VI/9PMb6I08bEbsdh0JA486qTzd96gQr53WWsQLxQHTeBRQUEi4N2/whY7vG3CSL5GCt7GXE+Ipg3Uv6Qv1FZM+86h9n2px00wpkT9U1LP90Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-05 (Coremail) with SMTP id zQCowAC37gYdcvNnHnHQBg--.10866S2;
	Mon, 07 Apr 2025 14:35:10 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	ckeepax@opensource.cirrus.com,
	rf@opensource.cirrus.com,
	simont@opensource.cirrus.com,
	peterz@infradead.org
Cc: patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] ASoC: wm_adsp: Remove unnecessary NULL check before release_firmware()
Date: Mon,  7 Apr 2025 14:34:03 +0800
Message-Id: <20250407063403.2772040-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAC37gYdcvNnHnHQBg--.10866S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtw18ZF4ktr4xXry8JrW5KFg_yoWfXrg_Aa
	ykCw18GryxtrW3X347ur1avrW3uay5ur1rJrnFyayUJryDJw4Sqw1UWan5ua18X3yIka4f
	ZF1DZrWDC398JjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbfxFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
	xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
	8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxkIecxEwVAFwVW8AwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUcjjkUUUUU=
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

release_firmware() checks for NULL pointers internally.
Remove unneeded NULL check for fmw here.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 sound/soc/codecs/wm_adsp.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index 91c8697c29c3..ffd826f30e15 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -718,12 +718,10 @@ static void wm_adsp_release_firmware_files(struct wm_adsp *dsp,
 					   const struct firmware *coeff_firmware,
 					   char *coeff_filename)
 {
-	if (wmfw_firmware)
-		release_firmware(wmfw_firmware);
+	release_firmware(wmfw_firmware);
 	kfree(wmfw_filename);
 
-	if (coeff_firmware)
-		release_firmware(coeff_firmware);
+	release_firmware(coeff_firmware);
 	kfree(coeff_filename);
 }
 
-- 
2.25.1

