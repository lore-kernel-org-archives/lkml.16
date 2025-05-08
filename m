Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B171DB366;
	Thu,  8 May 2025 15:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746717710; cv=none; b=qQ0abl3iitIPSqxrDzejCbQTDJvKR0OWor8PUZLQamtgxHO0NSqUGEgP1OOcwCWXHAm+2e2tUb2xwXW8VwvCeCH6fLGaI842C04/63ycSac+pd3K7UTMyYHBWpHKlclN4Jw85XwE7fh7j320sDsVVTRZThgKqecnAFhkqeM/gXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746717710; c=relaxed/simple;
	bh=J4hQFIAH8iSUB1xC+68EL9S54+Y8bMpThg+Dd4PNpwE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=loegcFdROgWqV67LWImXt306zaZqlKAr5wPLkLTxs6/au44G5gOf9H1wbbUXmKtlFRe4OU8x4fnuSC/6sgJqt35Erbb5LW+BtRKuTy6EZtR4mJ8NNkWCAyTs78/teXnvQLBmT3y/VwVCxSWtUOtgIa15vKv2gse/JWetVi5ANN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tavianator.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tavianator.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c5e1b40f68so129548385a.1;
        Thu, 08 May 2025 08:21:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746717707; x=1747322507;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cxr5tCREFP+E8VP7VSkBTdq6NYCvsCRxcmgngaOeapc=;
        b=EF+wdy/mJaFUW6I1i55MiutJP99HSTGNq+TMGG2GusoMKbUorMwn4CG9AxQ46X2WN/
         /PLXkRizbxAQSr8tLDnXZnSAFtGHWxA/JRIRwR7Drq57vgtKivmdSg/NVDw9UDOxEnRt
         1Hu/HkvM1YwZ+xROaEWobQ6i/zNsiuwlbwczzpHeqRK/Ll3gCTyTkQtz6N+M/B0vsLSc
         Y3BmoHKtfW/PSxqcaYB5AvvAffGLqoqzOj8kpaiOatJ1cW+lx86ZLcGV3TGQr7Kwxs97
         2zJhGbnaQ6t+bX1126OOqKD9vKLW7ei/Wqzk2nihhXYR1Zi5nuvsD95rUCK81AxljyIc
         xWSA==
X-Forwarded-Encrypted: i=1; AJvYcCUvqEzu8ddXi3KZ2FWcAP9AbFaPxoUAZG/GKb9atB/v0AM61UM0qoUu4VY00A4KZqe6n5AuXqzgzfTLH9g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3C76tcH0XC+sK5z9Ya69+TRnP5GdUDbAYMe16n+w0+ONmXrqb
	xY4+VOnLNkVf+fCYClb/4Z8HM0/jIlkzixwsKMAMu989IdSNbibkWmPWPWltrMM=
X-Gm-Gg: ASbGncto3GVq/dXR+WkchIo2sib/lri9MQoKSkBRI0iqeyPhtStEXKhn4vkviULIcC3
	DbiiG1pCBgCHA9lXWF6xjM54SQHNH8ayqHOrc2ibEU+5qpV7UNu1RIGoJKhly7HjwVF4tg39L6n
	HB3gMHs4oLGrr+u/SIpXMVcLYhdEr4MhFsTqRb0gubcrL5x7bkPI5Koxt4PM/kxUpjXpeiOyHLA
	DpMLBGv/8cZC0Q+42jS1uEZDr2BZ23ivJwf0Prwjz+NGZIpDv5BdAXhktNmDxU/iWj798SAbRYD
	OfQwlYACmGXejFDThICIkZOoOv/cSTs5TRSW3N+RNbgIP4IsBhvHZS3JPhAcu36fenQ=
X-Google-Smtp-Source: AGHT+IEOf4yY9mCawQTy8uiId+9jX3Wx1QkLhnX80v5PFgkSl2YYWwNEXEi1e+S4NpyTCw/p6r5PfQ==
X-Received: by 2002:a05:620a:4112:b0:7c5:4738:8a0f with SMTP id af79cd13be357-7cd010f7224mr11933585a.15.1746717707391;
        Thu, 08 May 2025 08:21:47 -0700 (PDT)
Received: from tachyon.tail92c87.ts.net ([192.159.180.233])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd00ed3cb4sm6031785a.0.2025.05.08.08.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 08:21:46 -0700 (PDT)
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
Subject: [PATCH v4] ASoC: SOF: Intel: hda: Fix UAF when reloading module
Date: Thu,  8 May 2025 11:21:19 -0400
Message-ID: <832255bf606f9ddcf45167d3f066d603d707731a.1746713571.git.tavianator@tavianator.com>
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
Suggested-by: Péter Ujfalusi" <peter.ujfalusi@linux.intel.com>
Signed-off-by: Tavian Barnes <tavianator@tavianator.com>
---
v4: Copy the whole array, including the sentinel.

v3: Copy the whole machine struct instead so we can safely modify it
    (instead of storing the name in pdata->tplg_filename, breaking other
    fixups).  The problem with v2 was pointed out by Bard Liao, with the
    alternative fix suggested by Péter Ujfalusi.

v2: Typo fix.

 sound/soc/sof/intel/hda.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index b34e5fdf10f1..13ecb9473eb6 100644
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
+					2 /* we have one entry + sentinel in the array */,
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

