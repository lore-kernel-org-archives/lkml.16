Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E641FE455
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748420756; cv=none; b=Zqh9omYssnauuoYPpvY/JPWcVv0nvAAu1FvQ5cPAY3s9i4MjKIGtk59Pxk4din2Bn2GeUZcZNnD47ZPIQZRzLBcNn23U9Btzh84L7G1fCqVkQEwHQ6oVkckut0QQIYNgrHSBtoboiHVKqlpDNihJNGEH0DAAOt0QAtyqbOc1rGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748420756; c=relaxed/simple;
	bh=VlsN1y4ZMRHLcmrX8scixqd0Vvvyz2jgvsJCDQnq7cE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QpMF6G63iFx894+zh+fM/AnoS8FhUMiax0UEPDy0itOtixQtGW6hZUmr7ov8iCayYooMIxACKSKYmqtskmILTejJjOE0/DNuTkM7jWevDfMUmCOLWqr0aqSnbgRqypXt8qE78AfFmg1zG85cpL5jFFWdfmtXc06o+NY/gUuwAXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openpixelsystems.org; spf=fail smtp.mailfrom=openpixelsystems.org; dkim=pass (2048-bit key) header.d=openpixelsystems-org.20230601.gappssmtp.com header.i=@openpixelsystems-org.20230601.gappssmtp.com header.b=d7aJZPQ9; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openpixelsystems.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=openpixelsystems.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openpixelsystems-org.20230601.gappssmtp.com header.i=@openpixelsystems-org.20230601.gappssmtp.com header.b="d7aJZPQ9"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a4d33f971aso2505736f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 01:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openpixelsystems-org.20230601.gappssmtp.com; s=20230601; t=1748420750; x=1749025550; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UQgBkpDBPRTw134Tn/zp7QWRfZiqjrIZv2nl5UdLNb0=;
        b=d7aJZPQ9/MxuQKtpUx9vVoRkf5cVigXuB14uYOGoUF7gfdEBThVRQj6EJxbqPEiPL4
         AnHst6DCvy9/VYvzp/Rw2wZNo1nwxQftAHJ6znICxdhA2eTwZpSwhH2AxkXHTvMWYnK6
         4MP1i1X/STWxI17sQHc29cmZOMXVWvydDUzLOLU75AUmIQeDBIJ6DV6q9fraGwl6VIX1
         a5mUg53zleeHXgbEX/V+UiMzhi4Tic1gHh0DMVoGk3kZwmVMW+TK8PrqRYdlF9a9ObQ7
         zkThUwy05gbeEgSx3caM+39hwY6pw/eNcgkXHouMbIiXJ2u4WnUH76Jg9AKhMP4mhHLU
         3Mhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748420750; x=1749025550;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UQgBkpDBPRTw134Tn/zp7QWRfZiqjrIZv2nl5UdLNb0=;
        b=ZJIu1OPcJ0UieZffs28nMc95Yj1i7R2Ss/t6yXRdNAb89sV5JlgdiArJTLzspQDlXb
         xjPS1iFgAvHXkZCYiYES0l+RC9T0nxfdNhmhJWUrGX2pWOcRsvkbA1I4+XfiXsO3qDX0
         U01ZtVgLyy3eUJZanVFJYlmXp9rh/cz7tHGMrOwAcVpDGvfd/EOwjVw/DqC3vuhNA12l
         u8zKF2LFqpWgDyoqgRRdlxnzWhMs9BT+XnL/OTciji7w3X2LBqyBwV/fMRhGguZ6zvXD
         IZe+vP1XFK24AyqWF0ETfJhsg3QhPB105ATgK427/VlFbaggBI69tZHvbKgeZfwauEfs
         TQaw==
X-Forwarded-Encrypted: i=1; AJvYcCV/e15wBYXZjzV3CnnV9cHMSkTPhmwac/Viym2a88UmEgD8YCxTVSaT7d2q9x0MUd2i9QJpBpYtlft04Oo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJSps8YSCe5pI1Kr9VHUxJn1keH/nAAF9tXg/yNsEaH9OdhYpI
	8P/dfN9BLb1wKeqdZdxi/ZYfT7zUPYIfPCMe3U/MzZBxHm4lLknJov/WOvBDTxtniDs=
X-Gm-Gg: ASbGncvkbUSdrfnMHAMCBtDDrzXJdZRgf4hyRO1YSA6CAxg0YSg++cmFMFhRtYT1j11
	duYNau2T71wuFyecoziEeOyGxMf2zz3AdxdS7Yx2D2qsW8eDSIX8ZEmBxOIYdhwQs6vUlKB0wDO
	jNfhaHXZ9kkjtl07CUkpM7NPyg/KAf+7EdXtlOozWZ+oaCyZj8f0T0AydsqaznuQEN71044lX09
	qQD+WU0dU+pjxOKyBQXrOBYFBb0BxopJlmo+WK4iazOwWLLogf7Hjgu0IwlDY09LJJfF4CYExj9
	UaQm5AkOT99yeOF1W1OgeWqQPVTMEnq7E5xlBqZwRH7Nu3JMNujyb9BFRFzxzbjMG6QyJXqq1e5
	SaAt3IapWtRelhE1PSP3xprc7fIdnNB151OmVfMG9E6Y=
X-Google-Smtp-Source: AGHT+IHFPkP2u7PmZOuSF74kJDUP1U5Ppd3h9qvZktrhcp3E4VbXOBQgP+zpNOdXBTsKfvKAWbA8VQ==
X-Received: by 2002:a05:6000:1a8f:b0:3a4:df80:7284 with SMTP id ffacd0b85a97d-3a4e9437a5emr1346230f8f.1.1748420749819;
        Wed, 28 May 2025 01:25:49 -0700 (PDT)
Received: from [10.0.12.41] (253.124-78-194.adsl-static.isp.belgacom.be. [194.78.124.253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4eacd78fesm805814f8f.72.2025.05.28.01.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 01:25:49 -0700 (PDT)
From: Bram Vlerick <bram.vlerick@openpixelsystems.org>
Date: Wed, 28 May 2025 10:25:48 +0200
Subject: [PATCH] ASoC: tas571x: fix tas5733 num_controls
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-tas5733-fix-controls-size-v1-1-5c70595accaf@openpixelsystems.org>
X-B4-Tracking: v=1; b=H4sIAIvINmgC/x2MQQqEMAwAvyI5G7Btist+ZfFQNWpA2qUREcW/W
 zwOzMwFyllY4VtdkHkXlRQLmLqCYQlxZpSxMNjG+sbbD25BfescTnLgkOKW06qocjKSNYaIRuq
 dgdL/Mxfpff+6+34AnGGeqWsAAAA=
X-Change-ID: 20250528-tas5733-fix-controls-size-4211444d4b31
To: Kevin Cernekee <cernekee@chromium.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 peter@korsgaard.com, kamel.bouhara@bootlin.com, 
 Bram Vlerick <bram.vlerick@openpixelsystems.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1346;
 i=bram.vlerick@openpixelsystems.org; h=from:subject:message-id;
 bh=VlsN1y4ZMRHLcmrX8scixqd0Vvvyz2jgvsJCDQnq7cE=;
 b=owEBbQKS/ZANAwAIAblauka9BQbwAcsmYgBoNsiM6LMdvtHRZTGKEC1Ur+ZyURKIFZhIjJkQe
 fXnJOIr40yJAjMEAAEIAB0WIQQO7PtG7b77XLxuay25WrpGvQUG8AUCaDbIjAAKCRC5WrpGvQUG
 8OQYD/95OMr8hM8sTip7vn7zRZ8JKHpADTrZUr+WUMSmN2qivhLs7DxMzQGjkQw7hxHb5VCezG+
 0nwxg0GzcHigsD55Xi7yGjFItDd2muZcP2dH2gC+VH2d1jUZoneHfmKVjiZJIeoupREVWhapf/T
 A3M8vIh+D/xmqkb+1NHcV+NkLMjQDscMSVWi3yS92AafDJKpwHb63rFBf0lMKA79L9K8hsMe7Kl
 y3L/KgmB9XOHyogA3FoAXDRfnRwClMGPDrESmmd++GoQiLq3U6tJXL3n6iMMqtCZdirFicjLD6j
 pW7pxHXAKphjVRxCTxg+50BkgyVJBYJyIb4Bq64MXdksTxCqXDTH/+t3mxU9xoSJQmYmhLsyi57
 ct1hq6h8hYCxlZnjsWOonS/8/MwW1JXM9drx/hTkCh5XDcayuoAyG/WClouyq5JwUs1NrWWizkR
 oLRmwFymGgewfbzSQqlcJcjKkjj1f6MZHwyrMXVPi3SmPMZikl5Ej7EHVZ+nmMi3rFDQ8GrlXtm
 AsULVFcBquHAjiQe/pCxCBnD8GDum2O4qjAVEvQbr5LIesCJO7YxmSWOy6KcfFb0gUIP6DvziyQ
 SVuVVwGXJDP+4Txvf6C9XLZNe5U0UlKLhi8RuJrQc6R1m6UWiEGBz81UbKdF9ZZr36arflvzHMN
 ThiCUr8dUiK59/Q==
X-Developer-Key: i=bram.vlerick@openpixelsystems.org; a=openpgp;
 fpr=0EECFB46EDBEFB5CBC6E6B2DB95ABA46BD0506F0

Commit e3de7984e451 ("ASoC: tas571x: add separate tas5733 controls")
introduces a separate struct for the tas5733 controls but did not update
the num_controls with the correct ARRAY_SIZE.

Fixes: e3de7984e451 ("ASoC: tas571x: add separate tas5733 controls")

Signed-off-by: Bram Vlerick <bram.vlerick@openpixelsystems.org>
---
 sound/soc/codecs/tas571x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas571x.c b/sound/soc/codecs/tas571x.c
index 00b131294547812f1406056d17e6c42ddf92003f..6bf37c77f0a77b11464a3560b1680fb89b0ed2dd 100644
--- a/sound/soc/codecs/tas571x.c
+++ b/sound/soc/codecs/tas571x.c
@@ -834,7 +834,7 @@ static const struct tas571x_chip tas5733_chip = {
 	.supply_names                   = tas5733_supply_names,
 	.num_supply_names               = ARRAY_SIZE(tas5733_supply_names),
 	.controls                       = tas5733_controls,
-	.num_controls                   = ARRAY_SIZE(tas5717_controls),
+	.num_controls                   = ARRAY_SIZE(tas5733_controls),
 	.regmap_config                  = &tas5733_regmap_config,
 	.vol_reg_size                   = 2,
 };

---
base-commit: 76f8d35964e4de1b464de22e4f3fdc14937ed854
change-id: 20250528-tas5733-fix-controls-size-4211444d4b31

Best regards,
-- 
Bram Vlerick <bram.vlerick@openpixelsystems.org>

