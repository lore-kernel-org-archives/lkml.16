Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2314D15AF6;
	Wed, 14 May 2025 13:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747229880; cv=none; b=jiAPZJOnpLDZScEWVa3napk4KfTq8zFfatgtiwpNFtHBIzcy0/3YAR6SGAlTYsjpOC7NyRQSB6jOVUeaZdcM+v0vr8ImAexslYafCFN9l6rwtcN94RUtVeUo+pUVwXfUCi9I8bqQ+mazhOeCaNwjrT01UC4e0EnCWxTbXdPUb9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747229880; c=relaxed/simple;
	bh=ZepZzLIO7dOmpE2MQV/FK9ew8cF/BPgsg3oRN2yJCNY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qXF8DZ8i2gs0T3AcfmW8bF8sp1LOIaCKJwjssid/w4joYw7Zg7HKQF75T9Q5UwtPfDjU8ZQqBw1aQ+Qp0/B9czOCqV5X9HjrJCcYOwtoE5icOrTSmSeR5ZqKpJxOIIg96UmqSXdNCvTbU2T5vCkbZqLtEEDce7JHGlUpNWEqcSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tavianator.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tavianator.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7c922169051so410584085a.0;
        Wed, 14 May 2025 06:37:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747229877; x=1747834677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/IsAbXzh91Q8PuBlOs0s/9HiPsMLpNN7I5T9azSzLhg=;
        b=vpwy0meihT844B8Jb/GZG8ySyXLxyx23W84j/0y437sEvWQi1F4hlIGi5zjRJOa14F
         YTRKf5PLzL6PQVmi5IYAo/i+vpG/YDuO8q+R6blpFmYjBF1siwBVNpQH383SSlvJAHuA
         DLT9gr5pXzqLBmWLQq4YzJ+snAR/Kf6RW055ciREhoh4gXFjbTgXMhIkYDfI5RU3uMT0
         R0etuPATjniRKkYLYtV9nTPAk8aGrHejjU3RyxMGZyZhZ5IrUZlt9NX0HYWMAa0m8a9L
         7MTA0hoRtpdSna4wTA5AwKLgwk/sLvnmG5chmX1LX6QTgjd/OISwcS7RmZM45ilPUqKw
         X30g==
X-Forwarded-Encrypted: i=1; AJvYcCW26FG07A1su6QEsRn/TNvkkPqgpyFrTANzxZEy34NmAOiVAmVZH53i/9mt5mg9/t0lwpMAzai7mI7pilg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5Vr3Y7iV3Q91dkuyP+dlUisSn1fiXTsHOGPaf840ZP+5VNw9K
	/FUSAqjE0/sXKKTgFCsYH4YpoZ9fde1faH+FTSpqOJVqBKPNx6aKLAcTK2RH
X-Gm-Gg: ASbGncsXxhzgoYaP6/3FMYb8+nRIgHZ92+cTFJk4yY2CnCW3yhYRBGtcgN1NE7llJVf
	43Z4YFyD9vVuJtB2tBSgPs7kg7TD2SJkIsWK9K6c0vB+9y3jWkIy5c8uebAJV7ixVnIg3+1I4TK
	INZhoDAdd7Xa4k8nGUY9g/dWp3LA8RGO+4Y2SAjUq+XCPWSBnc36j7cZT1xlynXW+aCVjU3LRdx
	Arn1MqWd4/dXOHrcbEVQBHxTNBMnOWhiqF6bCiNTIDDjt5Tk1iJN3H1i3b8JHkOhQ0cd0XW416o
	CeyDR8g817ncIAzouIwAorwC3maPN9kh5oeb2I3HsIPYMUjpGBj7xvq+J0ky4SqW5rDOuf11raV
	OIw==
X-Google-Smtp-Source: AGHT+IHFH4g3ss66qDbAjeW+ob+M+vGKPfczusRUWfH82PtGDW1Ihq4RAiJiDDPKDJk4yw0DUI89bQ==
X-Received: by 2002:a05:620a:c52:b0:7c5:464b:6718 with SMTP id af79cd13be357-7cd2888faf1mr639600785a.54.1747229877300;
        Wed, 14 May 2025 06:37:57 -0700 (PDT)
Received: from tachyon.tail92c87.ts.net ([192.159.180.233])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd00fe61d2sm852983985a.99.2025.05.14.06.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 06:37:56 -0700 (PDT)
From: Tavian Barnes <tavianator@tavianator.com>
To: linux-sound@vger.kernel.org
Cc: Tavian Barnes <tavianator@tavianator.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	sound-open-firmware@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5] ASoC: SOF: Intel: hda: Fix UAF when reloading module
Date: Wed, 14 May 2025 09:37:49 -0400
Message-ID: <570b15570b274520a0d9052f4e0f064a29c950ef.1747229716.git.tavianator@tavianator.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

hda_generic_machine_select() appends -idisp to the tplg filename by
allocating a new string with devm_kasprintf(), then stores the string
right back into the global variable snd_soc_acpi_intel_hda_machines.
When the module is unloaded, this memory is freed, resulting in a global
variable pointing to freed memory.  Reloading the module then triggers
a use-after-free:

BUG: KFENCE: use-after-free read in string+0x48/0xe0

Use-after-free read at 0x00000000967e0109 (in kfence-#99):
 string+0x48/0xe0
 vsnprintf+0x329/0x6e0
 devm_kvasprintf+0x54/0xb0
 devm_kasprintf+0x58/0x80
 hda_machine_select.cold+0x198/0x17a2 [snd_sof_intel_hda_generic]
 sof_probe_work+0x7f/0x600 [snd_sof]
 process_one_work+0x17b/0x330
 worker_thread+0x2ce/0x3f0
 kthread+0xcf/0x100
 ret_from_fork+0x31/0x50
 ret_from_fork_asm+0x1a/0x30

kfence-#99: 0x00000000198a940f-0x00000000ace47d9d, size=64, cache=kmalloc-64

allocated by task 333 on cpu 8 at 17.798069s (130.453553s ago):
 devm_kmalloc+0x52/0x120
 devm_kvasprintf+0x66/0xb0
 devm_kasprintf+0x58/0x80
 hda_machine_select.cold+0x198/0x17a2 [snd_sof_intel_hda_generic]
 sof_probe_work+0x7f/0x600 [snd_sof]
 process_one_work+0x17b/0x330
 worker_thread+0x2ce/0x3f0
 kthread+0xcf/0x100
 ret_from_fork+0x31/0x50
 ret_from_fork_asm+0x1a/0x30

freed by task 1543 on cpu 4 at 141.586686s (6.665010s ago):
 release_nodes+0x43/0xb0
 devres_release_all+0x90/0xf0
 device_unbind_cleanup+0xe/0x70
 device_release_driver_internal+0x1c1/0x200
 driver_detach+0x48/0x90
 bus_remove_driver+0x6d/0xf0
 pci_unregister_driver+0x42/0xb0
 __do_sys_delete_module+0x1d1/0x310
 do_syscall_64+0x82/0x190
 entry_SYSCALL_64_after_hwframe+0x76/0x7e

Fix it by copying the match array with devm_kmemdup_array() before we
modify it.

Fixes: 5458411d7594 ("ASoC: SOF: Intel: hda: refactoring topology name fixup for HDA mach")
Suggested-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Acked-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Tavian Barnes <tavianator@tavianator.com>
---
v5: Formatting fix.

v4: Copy the whole array, including the sentinel.

v3: Copy the whole machine struct instead so we can safely modify it
    (instead of storing the name in pdata->tplg_filename, breaking other
    fixups).  The problem with v2 was pointed out by Bard Liao, with the
    alternative fix suggested by Péter Ujfalusi.

v2: Typo fix.

 sound/soc/sof/intel/hda.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index b34e5fdf10f1..6a3932d90b43 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1049,7 +1049,21 @@ static void hda_generic_machine_select(struct snd_sof_dev *sdev,
 		if (!*mach && codec_num <= 2) {
 			bool tplg_fixup = false;
 
-			hda_mach = snd_soc_acpi_intel_hda_machines;
+			/*
+			 * make a local copy of the match array since we might
+			 * be modifying it
+			 */
+			hda_mach = devm_kmemdup_array(sdev->dev,
+					snd_soc_acpi_intel_hda_machines,
+					2, /* we have one entry + sentinel in the array */
+					sizeof(snd_soc_acpi_intel_hda_machines[0]),
+					GFP_KERNEL);
+			if (!hda_mach) {
+				dev_err(bus->dev,
+					"%s: failed to duplicate the HDA match table\n",
+					__func__);
+				return;
+			}
 
 			dev_info(bus->dev, "using HDA machine driver %s now\n",
 				 hda_mach->drv_name);
-- 
2.49.0

