Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF0D19A;
	Thu, 12 Jun 2025 06:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749708202; cv=none; b=ARbuYofGl+lqO+RE0QvB+Gh4LI6avHkvJMGaZ0VyP9tRDVc5N89+IWgfX//nD0HGe14JlTCBHzjJHwMI/BvWWgCpU+atzwjhEaY/iV6naYC6OElTZq7U+qN1X1b878CPr8gxj/M7FrB8ShbGQqfPSL0LshXyde9WZNsAifDlAwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749708202; c=relaxed/simple;
	bh=QmqBPG8NonA32v4DbJZ0zNh0hvG9+etFn3ENep3iOpQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VxIdNYRO9E7BTdkNa2b0hZM43oKgJvRDxm1J60MtaMfuOKK5Xn/vlt7L6n6FUXYiDf8xEB8hPB2Bn4iRO4xiqy8aMHJuv42ECCB1a8Zjj5k4U9MVwm7r/ZYScK1jQmKcwLmYy85ZgzVwsaYY5ABFJzFgv4FxVPx27jCXRKxEIGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-01 (Coremail) with SMTP id qwCowAAXyNaObUpo1KP6BQ--.35961S2;
	Thu, 12 Jun 2025 14:02:54 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: perex@perex.cz,
	tiwai@suse.com,
	cristian.ciocaltea@collabora.com,
	franta-linux@frantovo.cz,
	lina+kernel@asahilina.net,
	livvy@base.nu,
	sstistrup@gmail.com,
	s@srd.tw
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] ALSA: usb-audio: Convert comma to semicolon
Date: Thu, 12 Jun 2025 14:02:28 +0800
Message-Id: <20250612060228.1518028-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAAXyNaObUpo1KP6BQ--.35961S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Gr4rCw4kuw4kuw1xGrW3ZFb_yoWkurc_Wa
	nYg3WkXr1jkay0qry2yF1Fkw47G342v34v9F1jqw17Z3WkAr9xCr4kXry7KFn7Ww4rKr95
	JwnxWr4v9ryIgjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbf8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6r47MxAIw28IcxkI7VAKI4
	8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
	wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjx
	v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20E
	Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
	AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjylkDUUUUU==
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Replace comma between expressions with semicolons.

Using a ',' in place of a ';' can have unintended side effects.
Although that is not the case here, it is seems best to use ';'
unless ',' is intended.

Found by inspection.
No functional change intended.
Compile tested only.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 sound/usb/mixer_quirks.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 0769ecd91144..a0ffe8b559dc 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -762,9 +762,9 @@ static int snd_dualsense_jack_create(struct usb_mixer_interface *mixer,
 
 	mei->ih.event = snd_dualsense_ih_event;
 	mei->ih.match = snd_dualsense_ih_match;
-	mei->ih.connect = snd_dualsense_ih_connect,
-	mei->ih.disconnect = snd_dualsense_ih_disconnect,
-	mei->ih.start = snd_dualsense_ih_start,
+	mei->ih.connect = snd_dualsense_ih_connect;
+	mei->ih.disconnect = snd_dualsense_ih_disconnect;
+	mei->ih.start = snd_dualsense_ih_start;
 	mei->ih.name = name;
 	mei->ih.id_table = mei->id_table;
 
-- 
2.25.1

