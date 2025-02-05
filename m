Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD0D163;
	Wed,  5 Feb 2025 20:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738787452; cv=none; b=s4rNI0hb8kUKLUbVFrY+EuS8/kUZMwmH3WQhY7yfxj3ZJsGh891H2S9euJ5s8UKBvWJl5AWjiAkDQ8TrxFNqGIiUkFetNCF1+9Clrlp9udov2vv9sP/lXjouj6iDBFYQYwakfzaTT78NMmL55QhtjFyFxu9DnVmudfDcn4G/2Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738787452; c=relaxed/simple;
	bh=gsvloyrHQbF5ITKDlmSSkt2ueR1SRS1afrphFsjrNcg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=e7dveMyhfVQTLtVj1GME1kILCVuZiQcoEn2dIC1hUtNfLRnHtdWGETy1dtziYaVH5mGLHTkpmycATgdvpihXymKMJZ1bQJvLLzteJvNXxXoURq9Du+JgH+5e7HuagoeTIpLLB7HLQ/XuwB4CW0gOTE4dMjiIlYTEmmvdatrgMSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hY+MCEB5; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hY+MCEB5"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5dcc38c7c6bso395672a12.1;
        Wed, 05 Feb 2025 12:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738787448; x=1739392248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7quq08y7bRrmivY2j2MkuwnN5G3wZhEJZY8NVvoNqNk=;
        b=hY+MCEB5h+H3hs1x4/Uj7xlueURqzvJxsbg6IPjiCCGX6q/ohELfaPU5tnhHmNOiCv
         5Sn7W08RJYp6GIuNaKcBhDPez+V+WUEgpZ3Dzxfnss+wSWbNa/LJlGmWwna2U8lm3Qws
         kjv6va2C9Uaj/ymSCQKjLiWOtZHyLEmMHsnqH5pU7USELCXJM31Ea5xuW2eajDi1L+9r
         ySGBrPNYHNmtIAIkjZ+C1mfQ4FMmZ+QzzeTOCMA2/+pCsssPyMRCUhO3Iu/EcwxiqPm+
         37+sF6q0qWEsmTTKqhm32ieH4m3GuTucSf6g6tX1Cg10cse6W712MMFfDNsVzaNa7dbN
         O0Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738787448; x=1739392248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7quq08y7bRrmivY2j2MkuwnN5G3wZhEJZY8NVvoNqNk=;
        b=LuMHYt8f+/iJbNwDJ4kvj7nJpKxcFWE43zd4nkF7QKNeEs55E/pc9dPVkUJvHSgOLD
         kqgFTutdgPOyPxU7W7d2tg9zWt91/t6Ad+jiFYQm3BHz7yQcvO8VpASoDwfeUeu16nqL
         kSlIwviv2Xyx8l71GxFJj6cc1tjwW7U43vUV9jwqc+FpSBfYZ2lfdq3N5+TT8zEww1Dp
         vsquOqISP/caGbB3/6G0XxU0+ejPiUet8KUOW4nxxT4TtmY7WEsj2ZUC3rF+pT2Ycpns
         ZqnMeG4DaJqZflPcKbmyxYdv5s0aiiP8h9Yl57G8V2enwCI0tn1QPJ2gj5FlqyHhe532
         pD9Q==
X-Forwarded-Encrypted: i=1; AJvYcCV2IuFGRvLT3Qiyvamf0RqhW/4kce/8kToN4XlhlRECaqfojYnPu/csHu9cOuTN1idP10v6qVzDU2up5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YynPA80u5OX5HY//Tg0OsWjESV/QnddAjMGuz/APnwD1CBTIqA4
	Kz0G7qFGN5E40cArBWYAza/06ZLbwtw5VzjyxzUyYI03v5Cb1C5g
X-Gm-Gg: ASbGncuNYNjaMHqUPJyFiCvaD7o2FJ6KX5ubyIqfBQlHayUH5A+RSmQMc/KQWCqhfEC
	MyYAEir0ZRk3TqfMGchcRScJIghccLDuIQSg65Dd/pv7hqPMeMa4XHAWajz3MJT2GvvCVCdke5+
	mQd3BMoGXtaDkeEkcb9UcbbvlpMiPoUuuasb1ld0LNUwAYcvjbVxT11ymweRcTEfZwMRbbg0WIU
	FBF0WD07EMzA+TpF5dNfGqTZdDH2Hjv2V2Os2ICQkB3wvtOvQgXtbvdAktAPIHk3qliG5rwIpQY
	qW9WawouscMHQrCCxfDSdbtBVQyQ/v7XryPDUhdSvBhr2OjOTt2g3A==
X-Google-Smtp-Source: AGHT+IFOD2JdT4b4zcb0pnGAJjlvVdplZV+7EHudMQJN2SH3I8xeIW0t3W0wFtUyTAAvSp5bA/xr8w==
X-Received: by 2002:a17:906:3583:b0:ab7:66d3:bc88 with SMTP id a640c23a62f3a-ab766d3cbaemr261988466b.52.1738787448480;
        Wed, 05 Feb 2025 12:30:48 -0800 (PST)
Received: from playground.localdomain ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcd309f127sm2848014a12.40.2025.02.05.12.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 12:30:47 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH v2 0/8] Refactor imx drivers and introduce support for imx95
Date: Wed,  5 Feb 2025 15:30:14 -0500
Message-Id: <20250205203022.2754-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

A rather aggressive but arguably much needed refactorization of the SOF
imx drivers. The refactorization is meant to address the code duplication
in the imx drivers and decrease the coding effort required for introducing
a new imx platform.

After refactorization and imx95 introduction, only two drivers remain:
imx8 (meant for the imx8 series: imx8 (imx8qm), imx8x (imx8qxp), imx8m,
and imx8ulp) and imx9 (meant for the imx9 series: imx95 (for now)).

The series also includes the introduction of the imx95 driver.

---
Changes in v2:

- fixed order of includes in "imx-common.c". They're now sorted
alphabetically.

- use reverse xmas tree ordering for variable declarations.

- add missing call to "of_reserved_mem_device_release()"

- add two new fields: "drv" and "num_drv" in "struct imx_chip_info"

- drop previously obtained R-b's on patches affected by aforementioned
changes.

- link to v1: https://lore.kernel.org/imx/20250203171808.4108-10-laurentiumihalcea111@gmail.com/T/
---

Laurentiu Mihalcea (8):
  ASoC: SOF: imx: introduce more common structures and functions
  ASoC: SOF: imx8: use common imx chip interface
  ASoC: SOF: imx8: use IMX_SOF_* macros
  ASoC: SOF: imx8: shuffle structure and function definitions
  ASoC: SOF: imx8: drop unneeded/unused macros/header includes
  ASoC: SOF: imx: merge imx8 and imx8m drivers
  ASoC: SOF: imx: merge imx8 and imx8ulp drivers
  ASoC: SOF: imx: add driver for the imx95 chip

 sound/soc/sof/imx/Kconfig      |  17 +-
 sound/soc/sof/imx/Makefile     |   6 +-
 sound/soc/sof/imx/imx-common.c | 432 ++++++++++++++++++-
 sound/soc/sof/imx/imx-common.h | 151 +++++++
 sound/soc/sof/imx/imx8.c       | 743 ++++++++++++---------------------
 sound/soc/sof/imx/imx8m.c      | 567 -------------------------
 sound/soc/sof/imx/imx8ulp.c    | 520 -----------------------
 sound/soc/sof/imx/imx9.c       | 137 ++++++
 8 files changed, 984 insertions(+), 1589 deletions(-)
 delete mode 100644 sound/soc/sof/imx/imx8m.c
 delete mode 100644 sound/soc/sof/imx/imx8ulp.c
 create mode 100644 sound/soc/sof/imx/imx9.c

-- 
2.34.1

