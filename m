Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DEA219A8F
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 17:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743097609; cv=none; b=TNlLmNtDNoTeOfoVzyQOxDQuWwHJNgndjM1m7JU7kBIoU5qBMFq0fS29DuSSeLIweHR/Uq1Y30S2dDTabJj+rLPnFuJLFzLcR01OWvp5lvF1OsK9gMpOJrTEvUTqc/0re/027j62KsiVukc87RkrcimdRJUlaiajSJ23KAzIwvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743097609; c=relaxed/simple;
	bh=lvZCFsbLaE/K2JRb3trbOpkbgEQW9KtRlAX0K2bNMKo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=RJC6P6eXu5ZtLhJNFOYeaQmqgkXia0r3eJO9ujc0qpU67yxrxbbQ+EjhTSuFoBl7EJSV4EmOXunQfsv9do3iWJo2wBynJ+rbmj2zs0bexBMsayxBerTvacGRFUVUP3NMQaHYf09PkZe6uX75PdzjFsnH5QPeH+VYExOJJ0MBD2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yd0tcFDu; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yd0tcFDu"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30bfd4d4c63so13734151fa.2;
        Thu, 27 Mar 2025 10:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743097606; x=1743702406; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2v9fY5YvquFYGnnxVXEqXhs7WkaxlazIrr56h7WUAuc=;
        b=Yd0tcFDuUq/vg3Ao2HRptQNG9D3G51udQnVgtzGXQQDH41v6QFKoFNeCt4q/v6B3AF
         zlIlq4SWSpJnhwQvCaMX/4eDBEqFt/NLETrzqv/AfgsKjxtms5qKF80r4OK0DfypIUDP
         AGckc5AQfZcttr5Kok4+LBt0YNB2p0FofeXZQn6GRpWS/BnRBbJwilP4/7McQrAGYA7y
         gdoN4nRekIYJVqag09fPSEdB6ida0oZm2L4lPmURGHcnTcj6284eVw5vjGrex4kIpWya
         TAxA4Dqpr5NHZfbq3wzD/qh2hiNJIsjUvkVqDyVQ6W2Jeu3UZqQuZq+2COB5rpQe7H0a
         xihA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743097606; x=1743702406;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2v9fY5YvquFYGnnxVXEqXhs7WkaxlazIrr56h7WUAuc=;
        b=FMsRN6WzXCnvLj9aTHJsRwOBD8AnJRJZvc2gZRDgEo5zFHGlyyq76wY9Fkg/putyVJ
         YozEX0x3RXLVCk/q6Gdy0H5E/pKPBA8xfmd5U4IZu0kCt79zSxk6hkOi540hGzJeE7ZS
         DNor5dMC/sc+Bbe4lWEzuJuAfq5u/OQYzWhWmTbCJzzS8FAwmyxd3V4Axd4wyafkl5P9
         X1+DUVour56cotOTZBkTCM0oZPckz8UBTrNnqVj73K9vdZcvITWXuRmwSOt031Jq/T30
         2U6U0Kvttx7hwkrRmNVdJkpV4McVELonhzbs60mD8BADZwGfzMIXZtkTUB6FD2h7Jgsm
         sK5g==
X-Forwarded-Encrypted: i=1; AJvYcCUFv/rXRutLoEI+xeoNNeMBdcsd99ofvp3gxHrFi3ZQnyqeIg5fH2igDeTd36w1PbeNeZyb44LiAwNGYU4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf5JTx/AZAJaXMc226F93j056Gaq4NqcJTc7nPnLc3LOQJOeSp
	dIcNQVWQIhVvN2IgZXFY2d1RmcsTIwVJ7LSM3BVQy2dMckVxvR3hjpnfSoj0uG2/m+pUWwaQfev
	WNi1ranpUaOD4pqiX5mxNtt/r5SoQfqC+
X-Gm-Gg: ASbGncswaC0396qD4Mh0004y1n31aALKXtqrKCxrB1BXQuvjI9dtsemQ9/FbVMxkSux
	abnycRwhAGPH03AWAH4tcR4yUmVs1tWdbtHO34EJ0qj/CYDD6vRJlxJvJlXwxcjsEfyC4r9rP0Q
	KbtmKmmvY/vi+Y2b18KGNNkFi7xaFwvreWrewY2K4+S8O/bDmoVuI7aWqiav57
X-Google-Smtp-Source: AGHT+IHR5yqYgsnTZoDIb5FHZp75NyxUBVYevHQmqRIhK0zQdvA00g0tK6YLQmErVE3AGIjs1/CFLXdqqukNHYmCnyc=
X-Received: by 2002:a05:651c:50a:b0:30c:5c6:91cd with SMTP id
 38308e7fff4ca-30dc5e3144fmr19049281fa.13.1743097605340; Thu, 27 Mar 2025
 10:46:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Sharan Kumar Muthu Saravanan <sharweshraajan@gmail.com>
Date: Thu, 27 Mar 2025 23:16:34 +0530
X-Gm-Features: AQ5f1JoA2LVCatsBU7abtKWg8JKbG4rmS9BUmyvc18cxYG2CWo5g9cLZe5GRImQ
Message-ID: <CAGo=CcJaF3bt511abOtgQ0OXjoDmw8bota3dkVQw5fe0SfHLpw@mail.gmail.com>
Subject: ALSA: hda/realtek: Enable Mute LED on HP OMEN Laptop xd000xx
To: tiwai@suse.com
Cc: inux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

This HP Laptop uses ALC245 codec, and this codec was already used but
on your previous patches which i referred said that led off coef can
be set to 0

Signed-off-by: M SHARAN KUMAR <sharweshraajan@gmail.com>

---
 sound/pci/hda/patch_realtek.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index a84857a3c2bf..8c2375476952 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -4739,6 +4739,21 @@ static void
alc245_fixup_hp_mute_led_coefbit(struct hda_codec *codec,
                snd_hda_gen_add_mute_led_cdev(codec, coef_mute_led_set);
        }
 }
+static void alc245_fixup_hp_mute_led_v1_coefbit(struct hda_codec *codec,
+                                           const struct hda_fixup *fix,
+                                               int action)
+{
+       struct alc_spec *spec = codec->spec;
+
+       if (action == HDA_FIXUP_ACT_PRE_PROBE) {
+               spec->mute_led_polarity = 0;
+               spec->mute_led_coef.idx = 0x0b;
+               spec->mute_led_coef.mask = 3 << 2;
+               spec->mute_led_coef.on = 1 << 3;
+               spec->mute_led_coef.off = 0;
+               snd_hda_gen_add_mute_led_cdev(codec, coef_mute_led_set);
+       }
+}

 /* turn on/off mic-mute LED per capture hook by coef bit */
 static int coef_micmute_led_set(struct led_classdev *led_cdev,
@@ -7883,6 +7898,7 @@ enum {
        ALC245_FIXUP_TAS2781_SPI_2,
        ALC287_FIXUP_YOGA7_14ARB7_I2C,
        ALC245_FIXUP_HP_MUTE_LED_COEFBIT,
+       ALC245_FIXUP_HP_MUTE_LED_V1_COEFBIT,
        ALC245_FIXUP_HP_X360_MUTE_LEDS,
        ALC287_FIXUP_THINKPAD_I2S_SPK,
        ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD,
@@ -10126,6 +10142,10 @@ static const struct hda_fixup alc269_fixups[] = {
                .chained = true,
                .chain_id = ALC285_FIXUP_THINKPAD_HEADSET_JACK,
        },
+       [ALC245_FIXUP_HP_MUTE_LED_V1_COEFBIT] = {
+               .type = HDA_FIXUP_FUNC,
+               .v.func = alc245_fixup_hp_mute_led_v1_coefbit,
+       },
        [ALC245_FIXUP_HP_MUTE_LED_COEFBIT] = {
                .type = HDA_FIXUP_FUNC,
                .v.func = alc245_fixup_hp_mute_led_coefbit,
@@ -10569,6 +10589,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
        SND_PCI_QUIRK(0x103c, 0x8a0f, "HP Pavilion 14-ec1xxx",
ALC287_FIXUP_HP_GPIO_LED),
        SND_PCI_QUIRK(0x103c, 0x8a20, "HP Laptop 15s-fq5xxx",
ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
        SND_PCI_QUIRK(0x103c, 0x8a25, "HP Victus 16-d1xxx (MB 8A25)",
ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
+       SND_PCI_QUIRK(0x103c, 0x8bcd, "HP Omen 16-xd0xxx (MB 8BCD)",
ALC245_FIXUP_HP_MUTE_LED_V1_COEFBIT),
        SND_PCI_QUIRK(0x103c, 0x8a28, "HP Envy 13", ALC287_FIXUP_CS35L41_I2C_2),
        SND_PCI_QUIRK(0x103c, 0x8a29, "HP Envy 15", ALC287_FIXUP_CS35L41_I2C_2),
        SND_PCI_QUIRK(0x103c, 0x8a2a, "HP Envy 15", ALC287_FIXUP_CS35L41_I2C_2),
--
