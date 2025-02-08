Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86261F3BA1;
	Sat,  8 Feb 2025 21:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739051177; cv=none; b=faSQwD19LsUDsIk0eQChEHhV4lzxsUaB7AuMoGuUHK8pyUSZSfig7YQmeXz9ynyjLNIsO8grYPyluA4P1s9eX6rUvYgAZyANgs/iiGT9D6I8C3dLmvYx4GqPj0ZVJ5MGeBpyoeCbhavHRkZp1D7GuL9N/n7K4GvOE5Do69k2krE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739051177; c=relaxed/simple;
	bh=Kjv7ZCsUUyrNCcBicE+QP8+XWyl6ZERVAesG2KF7bQI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HUgIXSkGr4U8go5C2hV+ZCzvfdhf7USso1VaCpo/ay19Y3/zKvboL0Bp2eheHYaNghgD2LVs4+n8N2ieflEL+WjyB77RsURuZEBx9DS1Ylqp2l56IqzKQ4lO4vN3gsQePxDWU0UGRaDjDtFKC3qOZVBVKGCEfYl7FeSm9N/Lwts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M8LiqHqm; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M8LiqHqm"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43624b2d453so37711185e9.2;
        Sat, 08 Feb 2025 13:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739051174; x=1739655974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q19doMHjy/HW0toATMm3GOYEfHvzFgO49TFSTqvWJ10=;
        b=M8LiqHqmf0bUXsU/9yZUklPYEwL9/kDDsyiRngBfoSDM2gemxUjiQFfN9PrI76RiwR
         XuSPPAe+r3zdzcg+CMQFNlSIr+HPiGkPxLwTRCjlZR6XFua0TWVP0wFQgxjGk062+Knu
         Gf1dndJSI/UvJBAI6zchq+ytN1VCAFUbZI84AMg1ohN/CYOUs9mI0xDH2II2ME7ViBvk
         7YrEqMPDCFg/A+3R4sE2ODdWqRDpMmnoMQNYi/x5qiM7q7K1GvoUrn1Dkcb9GeMMPi8I
         UE9rKqfMDlcMD/8om4Fq/grNGGi7V/e0SM0vKPROcgrt5OVRZYlF5jc/lRaxaZt3r2Ed
         FI1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739051174; x=1739655974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q19doMHjy/HW0toATMm3GOYEfHvzFgO49TFSTqvWJ10=;
        b=oCsQwUy7HiBhnU6qyJHWKrU45NOPe/NIH9Kx5O2E8JlQzqFBD0jWLx3sLwjjhsmO4w
         Aqj9YoDoOyDYDA0MGKHvEN95NRziyPn2VBveGlfjCV73Ju65i8m2diRMR9SKqHeuBudP
         G02gJGUTVc3avcI3OAfGQbIRmihAjr+ikJOWXmVNw7MJ8gDi2GyATjmRtjkrlIfEAFDO
         GF8SCGf0IaCX5U77a6xuEJoUx+9ELNR1JfgytPThdlJxdZ6/w9x2kqqshicUyjTlAPTj
         L7WNO443vTwPjFGELlXInYhZnGMvivxANB+DRoF0c/UCPYX8tjPB0Smg506eaSvhtB7R
         FkJA==
X-Forwarded-Encrypted: i=1; AJvYcCWKWpSM3mXrqqejSW73jiGjdvWf87StZzZf6TGgC+qOy9MsUiYh62it4/PBrql4+5kHEKFMEeECMoLp+do=@vger.kernel.org, AJvYcCWbWqwvCK31WFqNJhsY5mSDFxCwnAzrRRQd3Oj4NWHLC+i3BiADSOnGn2jSwh7LId2o6hPxGjhxMhwefkA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFMjsViDNx+Iu4cwyurSQcV4q+hbtXpP6Ma829O1JJNOI2qzhX
	Y7zk+0oQ7AZ86565PfzpD7ymvKQ1j43VQ6HS4LTijLcz+wHzaPxa
X-Gm-Gg: ASbGncsk4ptw6QkJ+fGtlegzk8+tfXfdMhPmiOBfKGTLp4RKEoRQ49xFXPBxshXvuEq
	x8dwHRuIPLkx4NpxhAt1DcqmtTugGBTmr16hvrpXu5dvt75x3XL40ZRDX1ZkgD1+zqxhm5altC6
	sIOMQcXxC86GWPdPT+lWxwg1HfGqiYu4NMIdN+oZ2/LyTuXs5Rin6gfIPS+jDWzOfBCMANZro1O
	hA/zpKVoY+NjgiA7xGAMoI89Mh0JvmckYzDQtkLPF8Jqcd6P5aorIZUNxdmH5KjG0micKFRB46p
	4kHx4rnfLggjopbppN79RXKTzFhxm06kh7gRCKkPbQ==
X-Google-Smtp-Source: AGHT+IGWT1E+HON+HTFAh5L+V7G16tLRpVeknxhCvUkAtE4pCtvwvH46MdMs021EU6vgnSr0VJJ6LA==
X-Received: by 2002:adf:f70b:0:b0:385:d7f9:f157 with SMTP id ffacd0b85a97d-38dc9135d53mr5186013f8f.36.1739051173914;
        Sat, 08 Feb 2025 13:46:13 -0800 (PST)
Received: from localhost (tor-exit-1.zbau.f3netze.de. [185.220.100.252])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43935c4f4aasm23921515e9.22.2025.02.08.13.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 13:46:13 -0800 (PST)
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
Subject: [PATCH v2 2/2] ALSA: hda: intel: Add Lenovo IdeaPad Z570 to probe denylist
Date: Sat,  8 Feb 2025 23:46:02 +0200
Message-ID: <20250208214602.39607-3-maxtram95@gmail.com>
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

Lenovo IdeaPad Z570 with NVIDIA GeForce Ge 540M doesn't have sound on
the discrete GPU. The HDA controller in DGPU is disabled by BIOS, but
then reenabled by quirk_nvidia_hda(). The probe fails and ends up with
the "GPU sound probed, but not operational" error.

Add this laptop to DMI-based denylist to prevent probe early. DMI is
used, because the audio device has zero subsystem IDs, and this entry
would be too much, blocking all 540M chips:
    PCI_DEVICE_SUB(0x10de, 0x0bea, 0x0000, 0x0000)
Also, this laptop comes in a variety of modifications with different
NVIDIA GPUs, so the DMI check will cover them all.

Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
---
 sound/pci/hda/hda_intel.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 4155e010064b..3f11f169fe4a 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -37,6 +37,7 @@
 #include <linux/completion.h>
 #include <linux/acpi.h>
 #include <linux/pgtable.h>
+#include <linux/dmi.h>
 
 #ifdef CONFIG_X86
 /* for snoop control */
@@ -2074,6 +2075,27 @@ static const struct pci_device_id driver_denylist[] = {
 	{}
 };
 
+static struct pci_device_id driver_denylist_ideapad_z570[] = {
+	{ PCI_DEVICE_SUB(0x10de, 0x0bea, 0x0000, 0x0000) }, /* NVIDIA GF108 HDA */
+	{}
+};
+
+/* DMI-based denylist, to be used when:
+ *  - PCI subsystem IDs are zero, impossible to distinguish from valid sound cards.
+ *  - Different modifications of the same laptop use different GPU models.
+ */
+static const struct dmi_system_id driver_denylist_dmi[] = {
+	{
+		/* No HDA in NVIDIA DGPU. BIOS disables it, but quirk_nvidia_hda() reenables. */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "Ideapad Z570"),
+		},
+		.driver_data = &driver_denylist_ideapad_z570,
+	},
+	{}
+};
+
 static const struct hda_controller_ops pci_hda_ops = {
 	.disable_msi_reset_irq = disable_msi_reset_irq,
 	.position_check = azx_position_check,
@@ -2084,6 +2106,7 @@ static DECLARE_BITMAP(probed_devs, SNDRV_CARDS);
 static int azx_probe(struct pci_dev *pci,
 		     const struct pci_device_id *pci_id)
 {
+	const struct dmi_system_id *dmi;
 	struct snd_card *card;
 	struct hda_intel *hda;
 	struct azx *chip;
@@ -2096,6 +2119,12 @@ static int azx_probe(struct pci_dev *pci,
 		return -ENODEV;
 	}
 
+	dmi = dmi_first_match(driver_denylist_dmi);
+	if (dmi && pci_match_id(dmi->driver_data, pci)) {
+		dev_info(&pci->dev, "Skipping the device on the DMI denylist\n");
+		return -ENODEV;
+	}
+
 	dev = find_first_zero_bit(probed_devs, SNDRV_CARDS);
 	if (dev >= SNDRV_CARDS)
 		return -ENODEV;
-- 
2.43.0

