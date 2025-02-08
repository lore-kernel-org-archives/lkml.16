Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC661A315A;
	Sat,  8 Feb 2025 21:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739051175; cv=none; b=Qi5y/fPDd9mGxqbOhRzp+6FTtKonbR3hLM0IFumq9hV1LWspTPeJ0MC+Coq6U3wUzmmOguam+P1mJmbD4DHDi2zrTQ4t9+jeWwugd/Iwm/93ssqVn1soKrYWxekD6/25uExPg1S1KksGXpxngiud6eltYRH3eqURQqJvzHc0A4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739051175; c=relaxed/simple;
	bh=SrXwHXDF55N43O6d/ZnzYPRlbEnHrGJ98a+oiuBIpWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GAnvp1lA4PpIWDRQEhSLH3Mxm3YslPZwoKCOOK7heP9M5rAUAYa8r9ICrsMAJNjKe1DwFeq7LSBF7+iwWbG8WGIbllUXcN9i2+HrTBx7i07tYY8a/trVXoUSyvwlfozuqTNRm0F+cllTcJ2T5DXQ8iN+rIvqEjhjn0OR9bvVEcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CrZeuRES; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CrZeuRES"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-436281c8a38so21192935e9.3;
        Sat, 08 Feb 2025 13:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739051172; x=1739655972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jaVRFT7Ysusr40ti19uO+B+2G6r+3d58dZ5OUmd/cHs=;
        b=CrZeuRESkpdne42RAcqJX7U1msCAkWl8ADagjA7WIOdtQF0ZQk6UXejl+QMSwOFe1F
         BsKy5voDkk0iJATz95xt9kQf71jxtglgxKHWquEYReXngTTv1/Q0Z8az1aYC4dm8KL6i
         hulQf53vIOw3rhMATfsiJU9u0ac0w+TC/UTpzcMymmWkNR7vF2tukiGTg7Ytc9aDz0gN
         gicqqtdl0jCQT4t5DvWQSCSZaEgdJ6jK4bJyInQz6OezkMfj4uWoISHmAe9S4+xMHXlw
         CcZOm1Sz7kL0zIBZeuiAPjhNKVGqWfrj+6eeMx9HVjBil2pVGrp4mGFgyf+PlYleD2O4
         o04Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739051172; x=1739655972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jaVRFT7Ysusr40ti19uO+B+2G6r+3d58dZ5OUmd/cHs=;
        b=a9hB0+JAmOvK0PJLuW/y341jiC/dbnUVHUGHbeWyx9TUTv3UQno3b79GgJYLVXOsKj
         e1cx5dPdTNuyNSOYHieivAuEEJtesxwHNncNft//vrq7SKfnlD4PdiQiz9o8Bfsqw54Q
         Li6osSNc1a2TKU1H9AdzPWqug2txe9FcAFthzZpQhdA/TkaLBuYVfn6T19mQCah9MdC3
         67d4dg3jUPcrwF3Fos0x27uRtdiEbuzNZYf92+S800mf9YgcQxRqJ2XChHx/znKQy8nG
         fbmNFvWIvGkeKJnBRacbGBpTlwSDLxEOFEuN2eOp6D72KboDhSt0ZNjHVFGqfi7WoqCS
         CY5A==
X-Forwarded-Encrypted: i=1; AJvYcCUO7oQkLMm6fmW3HsGjOzYzFNanD+SMBSq75B/pDgv9lYp1XataeUdoqZmOicDC0U7fn+0ybf8VKVotSEY=@vger.kernel.org, AJvYcCV18uBb+z51NHezDtIM8Ckw/jLYhyFr7NjP7parVQsP+MiKxc3klNqw6DXDkx0HNu2VjjD6+Airv5tmF7g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzvjmvmW5UlteFlJJQ0h/05GA0J0pVD7/dzn8sR9OiHPSNCKhL
	b7s0aJ6PE7rKLGfjy2bbT5F/mHoPNvxHpIakoSdGCJ6gKyXP0vLa
X-Gm-Gg: ASbGncvS6HGndUB6CedqKFndD1qLqXL9Er0CQLo6Ba4AxViN5WlwCiaq+7bt7tscsHu
	irLeULxi95P+6NbFtUK341BvZulpJkCg3u59MPChgde9dAG7UDx3XgvkR/qFyReb5vcLa5TmZl0
	jlJfGBxYxtrR9ZJkb9SC4AHVMT6Lui1HGcYvPhGmZckqnMj7scA7i3xhxfSd3sLMZyR8lCXVYhT
	XKbPD1kGanaNqy4at3jp5/q+i8oTvSl1n5gXH2z5wa7PS5oxY+hCbdesjfUBrVHhOFRGZh7l6py
	eeKbYvkIfW1jOB74ibrF2Upw3l5DNdwRPaBazEXoWg==
X-Google-Smtp-Source: AGHT+IFt/XA+1SUdAvVRL4IfiJIoY4bBC+5DWf1m3ZbcPDt/hhRk5hV0pKzgDyAlZ7XmBlx+pL7XyQ==
X-Received: by 2002:a5d:5f83:0:b0:38c:617c:ee2f with SMTP id ffacd0b85a97d-38dc8daeb14mr4694594f8f.13.1739051172088;
        Sat, 08 Feb 2025 13:46:12 -0800 (PST)
Received: from localhost (tor-exit-1.zbau.f3netze.de. [185.220.100.252])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38dd9a6153dsm273808f8f.60.2025.02.08.13.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 13:46:11 -0800 (PST)
From: Maxim Mikityanskiy <maxtram95@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	WangYuli <wangyuli@uniontech.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maxim Mikityanskiy <maxtram95@gmail.com>
Subject: [PATCH v2 1/2] ALSA: hda: intel: Fix Optimus when GPU has no sound
Date: Sat,  8 Feb 2025 23:46:01 +0200
Message-ID: <20250208214602.39607-2-maxtram95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250208214602.39607-1-maxtram95@gmail.com>
References: <20250208214602.39607-1-maxtram95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

quirk_nvidia_hda() forcefully enables HDA controller on all NVIDIA GPUs,
because some buggy BIOSes leave it disabled. However, some dual-GPU
laptops do not have a functional HDA controller in DGPU, and BIOS
disables it on purpose. After quirk_nvidia_hda() reenables this dummy
HDA controller, attempting to probe it fails at azx_first_init(), which
is too late to cancel the probe, as it happens in azx_probe_continue().

The sna_hda_intel driver calls azx_free() and stops the chip, however,
it stays probed, and from the runtime PM point of view, the device
remains active (it was set as active by the PCI subsystem on probe). It
prevents vga_switcheroo from turning off the DGPU, because
pci_create_device_link() syncs power management for video and audio
devices.

Affected devices should be added to driver_denylist to prevent them from
probing early. This patch helps identify such devices by printing a
warning, and also forces the device to the suspended state to allow
vga_switcheroo turn off DGPU.

Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
---
 sound/pci/hda/hda_intel.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 7d7f9aac50a9..4155e010064b 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -1352,8 +1352,21 @@ static void azx_free(struct azx *chip)
 	if (use_vga_switcheroo(hda)) {
 		if (chip->disabled && hda->probe_continued)
 			snd_hda_unlock_devices(&chip->bus);
-		if (hda->vga_switcheroo_registered)
+		if (hda->vga_switcheroo_registered) {
 			vga_switcheroo_unregister_client(chip->pci);
+
+			/* Some GPUs don't have sound, and azx_first_init fails,
+			 * leaving the device probed but non-functional. As long
+			 * as it's probed, the PCI subsystem keeps its runtime
+			 * PM status as active. Force it to suspended (as we
+			 * actually stop the chip) to allow GPU to suspend via
+			 * vga_switcheroo, and print a warning.
+			 */
+			dev_warn(&pci->dev, "GPU sound probed, but not operational: please add a quirk to driver_denylist\n");
+			pm_runtime_disable(&pci->dev);
+			pm_runtime_set_suspended(&pci->dev);
+			pm_runtime_enable(&pci->dev);
+		}
 	}
 
 	if (bus->chip_init) {
-- 
2.43.0

