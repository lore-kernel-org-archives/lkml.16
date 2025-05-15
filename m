Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCA71F4C97;
	Thu, 15 May 2025 15:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747323109; cv=none; b=Fvux4efCa8BEyjG/6hqI++7b8U+39Z7MREwAxPRDK1inp+XrlNT0U/6FiK8uFkjYTCoM1D7nLl9ftpF5tt6VEZx0BaH0mSCi4yexW0CaCJf46NA3nR2Ux6zdatmskBAewCWjKJ8K7GNYuyDjT5r5ZwtwJEDEtxpmbcD+brZiRkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747323109; c=relaxed/simple;
	bh=gkYTuJlPPWBN0Mo/59Z5vPhiz9LzDHrqOhq+Ztyl3S4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Lx9wkldr1g7fzQS2zBRC7iUY9/yNJ6Rrm0YUUj58Sfh4iiXLlbB9xvJrjd23QXUrlVS6Cv3eKvs/pFU5AGbpA+lxREgdKj6DyqVWZs9Dopzx7x/hkx2GOlOc+YDutveyZDHiKT/hUlE+8y/KaSQhSsjkzAENnxGGKKnJKgRHTc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W9Q3OVNL; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W9Q3OVNL"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a0bdcd7357so909022f8f.1;
        Thu, 15 May 2025 08:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747323104; x=1747927904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+UMNOScS/nLhEASnWiqg2pAIhCiCnLz2QSJ+NCAvmKU=;
        b=W9Q3OVNL2qQabAaZ5izfjk5ghRv8Ppu6hXE/tMZRKC71Bk30N6Ahgnc3YPiQnqd9Qo
         P4zZty3VNtwLt4nJfM6lm8O/+sV7qjuzYFjZazbNuyYCx+baZ/c3csXAjyX9qZ0qSAuR
         U36+EUJOb+YNAOJTikoRFb14AafgVYE3alK9lVlgv0Uc2CFu0B8zaxzQgvtFjL082nh6
         hzNT7YsrcMlpNmEND9JKKhEUYP8Wfa3dGUUwQ//SG+emx4b82Uw4L4HOQ/fdtDaYWKuz
         t3V9iN7E5isC0K6XDK9IaEt6RA4MAlaq6qe00p+YG1d1hvzceiqMo7krBuU6yA7C5eg9
         qcJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747323104; x=1747927904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+UMNOScS/nLhEASnWiqg2pAIhCiCnLz2QSJ+NCAvmKU=;
        b=GetuN+wwJ3H13oJfRupPaNqxS78BLMsiJWmDdvoN+iwqfJTHjb4nsEodHMcBHJxLgn
         Vczt1FLiJEb47UhgA+SllNXYMjgqBe2SbmPeYWNs3eYdjpTKKkNpIRfdnaJoiRkHAVbL
         XyIQvepoGI4KUSLrZkg8loSOjwb3kQRF60VGSxg8xafsnJxx6BK6hrMFD2SXgiAJqAKx
         pe8GkIDZyMimcaefdzCsNsCw033U0pMYRm+JIGdpG8UzpTM3H3ACdGKYbrB64WzmzqLx
         3s5AUh7jpTgBF7vsauZO6KhMb9H6C/XLoXJYgbxRhnosIcNd/X0radHLpGBzaYfHzCf8
         ldqg==
X-Forwarded-Encrypted: i=1; AJvYcCUPRteV7hks2XdaLB/UHRML6jVy4CKvVWFjws0iePjIa/HAPpmMquH3J0HZPO7ZUKVikZNuG6SJRG7WIA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyugvcfsy36YBxdh6iHH0JHe171anf2AH6sb6j7ysd+AK1iaNIf
	q1tsq6l+pZTfZLE/cuD1Yk79D4eOwpYXKdTArPi9q3Y8yhpUsjj/XaSa
X-Gm-Gg: ASbGncvMmNRYFDkqMnPRkwGOjGBSi3zXycHjN74IUQi8ZLeasZnP+xeOfRngJiZMTyC
	C+Pb/o4ibPmAMsjuOTI8omQCGOnVZCjDilI/odG+ArFBX/xF6f6pAS+XQY9BCuux9zL4EyTSjtn
	Ou0QuEZBkuEdfvX0i/yRVtLmO6yPTI4Xv5TknwqAenY9BkqQg36X9QDVcL6m5BprpvFtCPf6pzS
	CXD0/tfNvF+n/4ZhNG0OgaFWjo35AawDUXeBg8VWVbfixu1Q/ckEtWmyoaH0qxXVSODpAbWRCNu
	zPJDeJXvhuvHa+2Y/il8TKcqDIeRcFKwyREsDwejZT96bxjNIz16is/reQtcu82Bwh2bOqyzZ3U
	jkVL1X1urhDXG
X-Google-Smtp-Source: AGHT+IFCWv7sS0o5RLMAYzy00EVXOEEzZ8epBiVhzCbLF/WOtKr85X0xxKEIvVfQ/4cmLc4GelQZfg==
X-Received: by 2002:a05:6000:2012:b0:391:31c8:ba59 with SMTP id ffacd0b85a97d-3a35c808b6emr237791f8f.4.1747323104135;
        Thu, 15 May 2025 08:31:44 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57ddfd6sm22617986f8f.4.2025.05.15.08.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 08:31:43 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH RFC 1/3] ASoC: re-introduce disable_route_checks flag for OF routes
Date: Thu, 15 May 2025 11:31:26 -0400
Message-Id: <20250515153128.147457-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250515153128.147457-1-laurentiumihalcea111@gmail.com>
References: <20250515153128.147457-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The "disable_route_checks" flag was previously removed via commit
dd2395162c07 ("ASoC: remove disable_route_checks") as it wasn't being
used anywhere.

Re-introduce an OF-specific variant of the flag: "disable_of_route_checks"
as this will be used by audio-graph-card2.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 include/sound/soc.h  |  1 +
 sound/soc/soc-core.c | 12 ++++++++++--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 1fffef311c41..e76da038557d 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1077,6 +1077,7 @@ struct snd_soc_card {
 	unsigned int instantiated:1;
 	unsigned int topology_shortname_created:1;
 	unsigned int fully_routed:1;
+	unsigned int disable_of_route_checks:1;
 	unsigned int probed:1;
 	unsigned int component_chaining:1;
 	struct device *devres_dev;
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 67bebc339148..b14a52d6f550 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2245,8 +2245,16 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 
 	ret = snd_soc_dapm_add_routes(&card->dapm, card->of_dapm_routes,
 				      card->num_of_dapm_routes);
-	if (ret < 0)
-		goto probe_end;
+	if (ret < 0) {
+		if (card->disable_of_route_checks) {
+			ret = 0;
+			dev_info(card->dev,
+				 "%s: disable_of_route_checks set, ignoring errors on add_routes\n",
+				 __func__);
+		} else {
+			goto probe_end;
+		}
+	}
 
 	/* try to set some sane longname if DMI is available */
 	snd_soc_set_dmi_name(card);
-- 
2.34.1

