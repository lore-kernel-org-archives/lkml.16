Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B024B1E52;
	Tue,  6 May 2025 15:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746544479; cv=none; b=kz6TJoXKJUVhkUC+8CRXNfhSvIpYwBUwcRx59pPWv8xpVqCnslTb76R427YBhHMrh2/F7MBTT8j658bsYZVCoPwRiu0prU0IVLa+leZlTJICF0HTXmkvx7T352OrmxfXuRSlwDBPDROeWBZmycPAhGGp37yyL8QwkN+uikOK25g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746544479; c=relaxed/simple;
	bh=HsMZWFYrTlUpfltEEjdQQtndO2n500+cj/V9sVjmRw0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cMVx7KlhIRjmHy6IxIuSCrNvYSUA8ElQxjmEX/nBkCOWDn/Ewzn6r9uQNsl2pKsEgc9v4zYI1tJ3dSlo6P5h/D1oCk0v3h6dggIRyLbxzuUxTE5jWmDuXcz0wyweV2UpS+ICUkpFTi8Q6Hl8tFAUNdf5SsPCVNIBxjH9Usjpqg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tavianator.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tavianator.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-476f4e9cf92so44336141cf.3;
        Tue, 06 May 2025 08:14:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746544476; x=1747149276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kT4xkXU3hJWuhsaijF7XFz7GWYoZ+LDhmBYoQDJQIuw=;
        b=fOOrEjX/Rscts1JxuNFUmhOvQZZeUH+Jdk2ReAGLmJMyygnfR7H4OAR2rVY+0T8ufA
         ktzUUw5Dw3B66u3UjwwtS5QhIzWLHWDVQSzWuGCyp9+KxYDz1Geyykdxlf7Jd8SZw3zM
         llqXZ7XotqL1dLkvWRSKVBQfG04MS29ir/A8YKayN5JnIKShxFD1GgvlCoye8dreKYLh
         hckmbpMMwAjuB2FiopvRuvVudcUYRVmitAr05E1ZHHVj9533ALQdJy/RFQ5uP1EdnIMI
         rOkYIgaGYQZlzsK33X6XbF9dwNOo4Rk7+p/zmdNJ6u1IME+3Hnr8hI4uizjmB6X6yyei
         cc/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVN18Y0SkFvZPqZnJPJA33tfhfG8klbNTukAIRmEfI58JrB7O3A3fDdG45XFTTElV+/iNJWmVrWh19O8No=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+5CUE2Rp15D0oRDaqiQ2uW73hehJ8Bg38n99RAricUa+ggBnk
	q1bmEtHFbbFgzEAjujoDXc77yJrCOvqJOnfNoBa8SoVarspvyF1OKlF7x4qr
X-Gm-Gg: ASbGncv/YBPuWWr9dAKalgTlXLkibtKtaJBFEzMdahGbxi4cL9iBMiksSUCPTSH031j
	uyHWmysSm5OWBJxJjmpVRaQ7eVmQ74wh6V0sHopvjYJDzq0GKKgI5F0rqHc5JIyeNw2YwiHvGkX
	CIH6aEkjRZMgjBz3UXbZ7U1op1kJGc9uwfTspqz/i8SkeQxFl3Jo743NQPwVprPGZFGkEms4RLv
	zP+Eay3DU9vcPainorp2xf8ajRHVfec7ljUEEBaZkVKtTYa4RggoRH6sfLioaZGAHgl/SMPoVYQ
	IhEUzTTPsfpY6LvRfGa7iVI8a4MshBg1XsjFPeSwjquBxk9HDs13Ha8lywNiBK5+nU8=
X-Google-Smtp-Source: AGHT+IHTgpzD5N7iat6T0whANXMiua0ja2xH8skfd2tAv8hgDCXuRoP6uiyXoDEkp51l46rCKSnk2A==
X-Received: by 2002:a05:622a:1116:b0:476:b764:e315 with SMTP id d75a77b69052e-48e01552646mr147556321cf.52.1746544475983;
        Tue, 06 May 2025 08:14:35 -0700 (PDT)
Received: from tachyon.tail92c87.ts.net ([192.159.180.233])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-48b966cda7esm74613751cf.21.2025.05.06.08.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 08:14:35 -0700 (PDT)
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
	Brent Lu <brent.lu@intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	sound-open-firmware@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v2] ASoC: SOF: Intel: hda: Fix UAF when reloading module
Date: Tue,  6 May 2025 11:12:33 -0400
Message-ID: <5aaee9fdfe8437ef2566b200bea45e4baaba3fcb.1745426811.git.tavianator@tavianator.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hda_generic_machine_select() appends -idisp to the tplg filename by
allocating a new string with devm_kasprintf(), then stores the string
right back into the global variable snd_soc_acpi_intel_hda_machines.
When the module is unloaded, this memory is freed, resulting in a global
variable pointing to freed memory.  Reloading the modules then triggers
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

Fix it by saving the filename in pdata->tplg_filename instead, just like
every other code path that appends to the tplg filename.

Fixes: 5458411d7594 ("ASoC: SOF: Intel: hda: refactoring topology name fixup for HDA mach")
Signed-off-by: Tavian Barnes <tavianator@tavianator.com>
---
v2: Fix typo

 sound/soc/sof/intel/hda.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index b34e5fdf10f1..1767977e7cff 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1069,7 +1069,7 @@ static void hda_generic_machine_select(struct snd_sof_dev *sdev,
 				if (!tplg_filename)
 					return;
 
-				hda_mach->sof_tplg_filename = tplg_filename;
+				pdata->tplg_filename = tplg_filename;
 			}
 
 			if (codec_num == 2 ||
-- 
2.49.0

