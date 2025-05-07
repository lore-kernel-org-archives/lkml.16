Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098DF2147F6;
	Wed,  7 May 2025 15:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746630636; cv=none; b=oaJDgPfX4cvDhJOTQzqzvKtwB3Z7jZ8cPxCH3/hT2TxN0REeIjj/mvTdNVAIBgjuJYob8uGAqTwjIln8aHJ+9hebIRGY6AeW3fL3lS1Okm7t5+NyHVe1lCm+Fkdpg1T0HovnRUZVw4cz+7fV1z9B0hWDhieQP/cot1yTq+Bpgjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746630636; c=relaxed/simple;
	bh=L+bC89EYpLM/+civW4bVuTh6OrQ/4kJO7ajkneH0L+w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Q3vF/TAZvoa693gcwhcBlYRAe1Kim/qUy7YP5EEzBB+Tqn1F4BGwnL5oaxWUf3LACysJUbK+oLNh1oGlLQrz3xBl8v6uNtLAAHOO0ifDrsAo5z+e2IHzFV42Vwnfdj6bEz5WCPz+rn67fNV6la+tMLmSMl8TNoW0HSw4DF2B6+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tavianator.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tavianator.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-47688ae873fso83005641cf.0;
        Wed, 07 May 2025 08:10:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746630634; x=1747235434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5zApGRQuB9FDDIEaOysudBGgRRMqSXczwPgXCIZrBYU=;
        b=RDzw0ZpBz3dZdqkgRM54emn71F4qS3PezneakuQnzclj9DB+HwHdxgClQPzmR86QZD
         +j6XiyqFfDG/9i3Gma7+WRj1hbXVaJQspS3Xm0d6imtbRdHuUhs9AZ3RdFf80i2yUrby
         rygYPPWW6bDqWQqvQNIt3Yku4W3pECq37FG8QrQIU2L+FvLTI54o0oRDmAc4GmZTCM29
         dthYnAk+WW4KTMYHlesiEJD5HgqD25AkveOYOGQzyHfumC2pqi2hYw7mMbiuTegEE5+s
         FRg2sUd+SegJ2OysJS93ehsuVGBWMNYSLn1cK2KbF83qiTAaVoVM5o2EG/Z50norRkrf
         6rJg==
X-Forwarded-Encrypted: i=1; AJvYcCUoVaM+/glAJntDchr6pyXdjVftK5uLDjk6CTlipdk+STWVPWgxunquxMGa42m6tB8NF8uAzISnh4mfjkU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPYzH9CCYSt6cErTko2yU/CJCjiVaEsV1iZXxYpgKyiKxDZz+4
	6JEejuDh+Wqz/cOcHyQi10TwIkJph7gq4wS2ejpnJARXT+Nzfr0YdHec388G0/E=
X-Gm-Gg: ASbGnctW/rzbpmrPDsG7WMoRYHIG+lgNyNFi5b6oOEWn5NtuYxmuxdK5fyXjpYC1N9+
	ohUcUT1CH1Y4FdspsvImqFqia8NvhRdEitR85LuzTdzK7gV0xOXysiuonrpcTNlj8kauft/8Isx
	pnLJhoHNogAezGQRIcAqjc4OFFPEsdCAyAtgGoes527XL6Vpt7igjsat+aejWe7XB7heiS68Ar7
	Wi8BExvb7DmJMJ9K3la0ESqSDLVtXQEPS5aINTOHtZttGXgMaDc1MV8CrOFUFKE5TD23LoiwgNq
	r199F+dTDDqGsS5TnZm+PsjigfOPrUD6gbYpO5Lfbj6HiphiK1uNJ9Wl1wVpqtGEQ9WOJxS466J
	7fw==
X-Google-Smtp-Source: AGHT+IHzU1cmdblS919MD/oE1I8vV96yqaXyoy/67GgW2BpgoNA+MAQe4AxcDWibc/g1QG8XmX3vxw==
X-Received: by 2002:a05:622a:156:b0:476:aa7a:2f78 with SMTP id d75a77b69052e-4922803c6c5mr58195221cf.49.1746630633415;
        Wed, 07 May 2025 08:10:33 -0700 (PDT)
Received: from tachyon.tail92c87.ts.net ([192.159.180.233])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-49222e95e5asm14936531cf.60.2025.05.07.08.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 08:10:32 -0700 (PDT)
From: Tavian Barnes <tavianator@tavianator.com>
To: linux-sound@vger.kernel.org
Cc: Tavian Barnes <tavianator@tavianator.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
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
Subject: [PATCH v3] ASoC: SOF: Intel: hda: Fix UAF when reloading module
Date: Wed,  7 May 2025 11:10:24 -0400
Message-ID: <fb47a18bdea9e9f86d6fccf1d881434cda3cd5f0.1746627007.git.tavianator@tavianator.com>
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

Fix it by copying the machine with devm_kmemdup() before we modify it.

Fixes: 5458411d7594 ("ASoC: SOF: Intel: hda: refactoring topology name fixup for HDA mach")
Suggested-by: Péter Ujfalusi" <peter.ujfalusi@linux.intel.com>
Signed-off-by: Tavian Barnes <tavianator@tavianator.com>
---
v3: Copy the whole machine struct instead so we can safely modify it
    (instead of storing the name in pdata->tplg_filename, breaking other
    fixups).  The problem with v2 was pointed out by Bard Liao, with the
    alternative fix suggested by Péter Ujfalusi.

 sound/soc/sof/intel/hda.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index b34e5fdf10f1..cbf96b342005 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1049,7 +1049,13 @@ static void hda_generic_machine_select(struct snd_sof_dev *sdev,
 		if (!*mach && codec_num <= 2) {
 			bool tplg_fixup = false;
 
-			hda_mach = snd_soc_acpi_intel_hda_machines;
+			/* make a copy so we can modify it below */
+			hda_mach = devm_kmemdup(sdev->dev,
+						snd_soc_acpi_intel_hda_machines,
+						sizeof(*hda_mach),
+						GFP_KERNEL);
+			if (!hda_mach)
+				return;
 
 			dev_info(bus->dev, "using HDA machine driver %s now\n",
 				 hda_mach->drv_name);
-- 
2.49.0

