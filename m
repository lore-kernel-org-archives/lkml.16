Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C358717548;
	Sun, 15 Jun 2025 23:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750031755; cv=none; b=NjeXn5YeH3DujI9NQE7aAeu1+x4KOmGy3JbntWwT58JAWvO1kLajB45Wp7GXVJSTla5+kMKC8Xf0yi7QGomFuz8Ie0goWs/NBg5ZGXomKsfacxaTsaZnVCpbDv9jH3bBwta5ok9rbWLCBZruTPsbZ5+U0zxJgl8q1v/sZ326qEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750031755; c=relaxed/simple;
	bh=L9GfQmJxzHxe4TznI4/9RwlDfpK1DAahnSh5eeCyyWw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=k8wz0MVXiAvdIZuvnjjlbmrFzXy3iJid27YMDG+HbFERRVm9VFT044USOy+K6noFb6riPWxIhA4DdFAvE/9cmmrNxaVUZbm3DTH3DhjpTkHv/McLxl8KBTwjpffT1N3sQLo1TrhZ/+reLD/UYBUTcJLWnuBCo+DU4XmKzdLYRA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eB6WtTgx; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eB6WtTgx"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so2942434b3a.0;
        Sun, 15 Jun 2025 16:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750031753; x=1750636553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3oXTFOZvRBZ3I5wRKU6UJZVyS7BzSZ7iEhJSIGe4VX0=;
        b=eB6WtTgx7NgGJpuBRVgCaM8+qbXlF6sm5xsQb4w+cDmSbHd3kVYov2Hm09ikd+52pT
         ZFl3282stQjjVEJwEzlkuOESci7QTTONMpljh2dIdj7Nwfl7QGOo59IPCiHVsHULpgBw
         +xf/5qq4Khu2vEah7dN3mdeHIL+xZkPN/Ov2fX1+MLaZMRlikvEvFrkVQ2R1UW07jtD1
         2COeiz3uDaR+EjSqjVjeuHpodl3c47Wx0DlQs3a9pm6R/gan70GfxomwckIBpZDhW1hK
         c5yoKzh5QoUJ7rcPABZz2q4ADpz/tj/frJxsvhvs56vTwh/gGO9n8ZXw3QMu1hsTxSFw
         XxfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750031753; x=1750636553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3oXTFOZvRBZ3I5wRKU6UJZVyS7BzSZ7iEhJSIGe4VX0=;
        b=VaHMBX38FYwGlNT7qU/z4Y4C8itcX6dFd8LGIy7+ximOsnji07BVtVWsPf0MpWJiJs
         Ns4+5lniGvkSOsuJTkVvcEjWvdqGmL4jXmG08kmBKlifS4LzmXsmFxq+AAHX1qBa7cYa
         UBxI1RCSrJFC6um0G8q7M4mtAdBMt9QLeWTTYsldadmDaGflJKIFufolTpLwbx9R6I9L
         ZduDCty0c8lBRUu+H6Wm1JslNuGTDM4iSzlZ3d77Mk7gkWAMJhtC5DhpBHa+6U27HXXY
         7kpFA+z58KK23x0zybr8WAFCiavTddGPUtMxvx4qTT5wg0fao6TvGktX8gSAStKw3kLA
         w1jA==
X-Forwarded-Encrypted: i=1; AJvYcCW7izkbLLN49eH08203Cdqrvr5q82EBvn82Bij47c7wwOBW6EeXSy/un0B9g+GMb7WB+QZKe08EogySaXc=@vger.kernel.org, AJvYcCXh1CKjFVStLaNqK4YqjfQFg/TfIf2//+UFO/G0ukBUxa3cJQl5haW4Vyu8PQOUdgXQLyPbmFWe1QIQWnU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrL+g6fVanpZAwxEKFpSVgHkA4t22un6/orK3LV36zYRxWFIyz
	mNS5vdp4kpgx9302wf+RgC2PYXsDJursnd01sNP+wTMPdQYHVUcOHXRy
X-Gm-Gg: ASbGncsgAFg31lJ9ZwKu20bvn7KSEq+P2CJ1Lp2L41GqsAJhysGtLVrx1KnG5pwaZBq
	DrQ8nwa1VWU0F7IJdsH8QKJJrz1b82HkcX/CWZrQeLARUJCi6vcEWQo+QxCAU8mAcAiyfAN6So1
	1gCp2iHyshoonzoBBzr/iEEIZvBQiql5Bop/fkGTxQ6kLuf0heVhmbCWDOEvysl5LyD1Q/Kaxx/
	5MX6NmHF1w3fTa5qzxdJu66nQQSvxSUoz1jWeboHe/7B53OoHPS2c0GgmpLzEp7qga/2+8Gu5we
	5MF4uxBHrwEZMDLnPXLJMTjBqzEDyPEUlq4s5WWh/nt8N9nhZG+Dq/gIrA==
X-Google-Smtp-Source: AGHT+IHts+jc+sEhTgMrw5finIuEPAbVfeCVaotG31uGeSGSXXyjliuHN40sI2hjX+/y27GsvrKVuw==
X-Received: by 2002:a05:6a00:2185:b0:736:a8db:93bb with SMTP id d2e1a72fcca58-7489cdedbb5mr8787611b3a.5.1750031752929;
        Sun, 15 Jun 2025 16:55:52 -0700 (PDT)
Received: from dorado ([2405:6584:3840:2300:3b98:dc25:3fd8:603])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488ffee2aesm5480126b3a.24.2025.06.15.16.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 16:55:52 -0700 (PDT)
From: Tamura Dai <kirinode0@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tamura Dai <kirinode0@gmail.com>
Subject: [PATCH] ASoC: SOF: Intel: hda: Use devm_kstrdup() to avoid memleak.
Date: Mon, 16 Jun 2025 08:55:48 +0900
Message-Id: <20250615235548.8591-1-kirinode0@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sof_pdata->tplg_filename can have address allocated by kstrdup()
and can be overwritten. Memory leak was detected with kmemleak:

unreferenced object 0xffff88812391ff60 (size 16):
  comm "kworker/4:1", pid 161, jiffies 4294802931
  hex dump (first 16 bytes):
    73 6f 66 2d 68 64 61 2d 67 65 6e 65 72 69 63 00  sof-hda-generic.
  backtrace (crc 4bf1675c):
    __kmalloc_node_track_caller_noprof+0x49c/0x6b0
    kstrdup+0x46/0xc0
    hda_machine_select.cold+0x1de/0x12cf [snd_sof_intel_hda_generic]
    sof_init_environment+0x16f/0xb50 [snd_sof]
    sof_probe_continue+0x45/0x7c0 [snd_sof]
    sof_probe_work+0x1e/0x40 [snd_sof]
    process_one_work+0x894/0x14b0
    worker_thread+0x5e5/0xfb0
    kthread+0x39d/0x760
    ret_from_fork+0x31/0x70
    ret_from_fork_asm+0x1a/0x30

Signed-off-by: Tamura Dai <kirinode0@gmail.com>
---
 sound/soc/sof/intel/hda.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index bdfe388da198..3b47191ea7a5 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1257,11 +1257,11 @@ static int check_tplg_quirk_mask(struct snd_soc_acpi_mach *mach)
 	return 0;
 }
 
-static char *remove_file_ext(const char *tplg_filename)
+static char *remove_file_ext(struct device *dev, const char *tplg_filename)
 {
 	char *filename, *tmp;
 
-	filename = kstrdup(tplg_filename, GFP_KERNEL);
+	filename = devm_kstrdup(dev, tplg_filename, GFP_KERNEL);
 	if (!filename)
 		return NULL;
 
@@ -1345,7 +1345,7 @@ struct snd_soc_acpi_mach *hda_machine_select(struct snd_sof_dev *sdev)
 		 */
 		if (!sof_pdata->tplg_filename) {
 			/* remove file extension if it exists */
-			tplg_filename = remove_file_ext(mach->sof_tplg_filename);
+			tplg_filename = remove_file_ext(sdev->dev, mach->sof_tplg_filename);
 			if (!tplg_filename)
 				return NULL;
 
-- 
2.39.5

