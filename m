Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C35929405;
	Mon,  3 Feb 2025 17:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738603143; cv=none; b=Lne0DrIIhX6lFqScFYsUHfaZg8tgsLN/SS4qnGv5Pkatab7HJRthI5MVeSpSXd4inXkpXyEFOvHPkZ1y5XnA2O8W9AvH+ny4HgM09yctXT/NzycV0aolNdTFHqOQ9hlTVe/wB2np06gnBgzxzCtraFmLaSoYh6tKpEWtrFDiz7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738603143; c=relaxed/simple;
	bh=b2bP8LitvDNj7CfFRPBpuZHhWhmBIqxUapiyUlqTDyY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nHbpdiaZ7t3HYvpY/mKxrWirs7X4gQ7N+pC/dVlaOUt3X6SiHLVnjc5lJJBoQUITysDSC/ARToKw1RC/WYIQkl6/tSqN28Z+A7fiZKz6xVHLDqLCCfrGVOqpmlvy9gdTmAHBBzj5DkzMYA5e9qRMEDMPad7JjKcVaXF3G1Ve2xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jrIOZWYn; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jrIOZWYn"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aaec111762bso412575466b.2;
        Mon, 03 Feb 2025 09:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738603139; x=1739207939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CYyPN/CoLmZHDGSIz9krlFLu7ZkZcaS755QZ2CPhXfU=;
        b=jrIOZWYnMWTQ3bhHFiUcFSD99KzhBAD1hi+EyihtCxzJag/KhGA2/u0J88NWRVM1JI
         cdlOZtrmxF1ZFI0JifFz33fTTqDxMOJcxtZfy2NuKzbQ5KCTkUukYKy+YYXgUZ921X8F
         d1JWsDDMs/0ik8+0WLcO63Ly3nK+KwYrmZL8Wr011cgvGgT6AiS5/mgHzfZqveiXo32E
         QggzjEjS4qeImcK+TNWL25EUwMsl9HjfPDXrDUP1nIY34pkI+uss18xIkdpIUg6dHwbu
         5yFSpGtdKUXIv95921NR9IThcbhVe2m8W8Zy05xKl+RHDAo5IkwdaomqKL/U8EKx65cA
         pQJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738603139; x=1739207939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CYyPN/CoLmZHDGSIz9krlFLu7ZkZcaS755QZ2CPhXfU=;
        b=KTKcWuCF9s54u9yhvcdHOn1A0xLXDX4qPKVX6qNDg0aYT/mIlfm2LrLVwakR15Pyg2
         Ttk3/GUn5bzhl8/ap2QcN07RRPS+1uF8fYrHTup37/392zz+mIMZME/X2go+BTsaNaAz
         BBXfiTJf2j4vcUwojDQ/SVxkDOr7NnBjhYBIbAVl4cXWuIKB75ENJEP5oRc3r0dVlMSQ
         pep4i8yTrQsrAARjuBpDUZUz48YOVFc7KleBDS32WpCZ1hal8v242ndu14GbKw++OVVL
         TZ+/4P0moREQvDZMRbDdAffnz5A44a1evqnGgtV4yTvi5b2l4PvnVF69QlqmmFSYgebb
         C+ig==
X-Forwarded-Encrypted: i=1; AJvYcCUhPY87WuRjRtdyXCx7VGon9N+FdHPpzX3wzD/u8gbvI2iHS/k4M1vk76bfmjRvGV9j49UglgEJjtgCBg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn4ug8z7L+9pU8I7qP/1WwNhdmRDsFUh1XufxRZAje0UJU9CG2
	MpS8TXCd0Bfsm+YOnvF1GOJ8wpffF1vPph8rPhU7GOM2KhyV1CRt
X-Gm-Gg: ASbGncthEYduImH/juB1LWeR6v63s7XDk5p08jhl+4x9rsHN2XkFzMHd1hZi20u9RZC
	x0Nqb6BcFgdjzcdTxJOxhtYa6qQYFytEeE5DGWbSll5fkR2S5UJF+1TFUQMZiCj7OSnFjBvtia9
	yZ0D3mjhC5Iza2Dn8W2UT1q2J9ZbXeheg8iGp+z5G3QcfX6otv74OKcqn1FYHmY5wiU/xx+yJTt
	PNXeBtHj2pMEgcVgfqrYgQptW3Y/mbyYfAyR6A2lTcVprXYq77iPEkgny2qVPRK5HGwCP8KJ14S
	qyxjWep4Zy0ac+smz64sE9LOS55Yc8hhks3M6eJW5QP0cdwYsQ==
X-Google-Smtp-Source: AGHT+IEv+cl0Fd8s1P7svgvOOR5EpY/b8v5nnTR9TZ2xpr7AWoXyn9Y55BNSQS7sJRYpl7kOaXuXAQ==
X-Received: by 2002:a17:907:7213:b0:aa6:a7ef:7f1f with SMTP id a640c23a62f3a-ab6cfcb3b41mr2987689966b.11.1738603139193;
        Mon, 03 Feb 2025 09:18:59 -0800 (PST)
Received: from playground.localdomain ([92.120.5.2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47d21aasm784253866b.74.2025.02.03.09.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 09:18:58 -0800 (PST)
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
Subject: [PATCH 0/9] Refactor imx drivers and introduce support for imx95
Date: Mon,  3 Feb 2025 12:17:59 -0500
Message-Id: <20250203171808.4108-1-laurentiumihalcea111@gmail.com>
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
imx8 (meant for the imx8 series: imx8 (imx8qm), imx8x (imx8x), imx8m, and
imx8ulp) and imx9 (meant for the imx9 series: imx95 (for now)).

The series also includes the introduction of the imx95 driver.

Laurentiu Mihalcea (9):
  ASoC: SOF: imx: introduce more common structures and functions
  ASoC: SOF: imx8: use common imx chip interface
  ASoC: SOF: imx8: use IMX_SOF_* macros
  ASoC: SOF: imx8: shuffle structure and function definitions
  ASoC: SOF: imx8: drop unneeded/unused macros/header includes
  ASoC: SOF: imx8: make imx8_ops_init() an util function
  ASoC: SOF: imx: merge imx8 and imx8m drivers
  ASoC: SOF: imx: merge imx8 and imx8ulp drivers
  ASoC: SOF: imx: add driver for the imx95 chip

 sound/soc/sof/imx/Kconfig      |  17 +-
 sound/soc/sof/imx/Makefile     |   6 +-
 sound/soc/sof/imx/imx-common.c | 419 +++++++++++++++++-
 sound/soc/sof/imx/imx-common.h | 149 +++++++
 sound/soc/sof/imx/imx8.c       | 751 ++++++++++++---------------------
 sound/soc/sof/imx/imx8m.c      | 567 -------------------------
 sound/soc/sof/imx/imx8ulp.c    | 520 -----------------------
 sound/soc/sof/imx/imx9.c       | 135 ++++++
 8 files changed, 974 insertions(+), 1590 deletions(-)
 delete mode 100644 sound/soc/sof/imx/imx8m.c
 delete mode 100644 sound/soc/sof/imx/imx8ulp.c
 create mode 100644 sound/soc/sof/imx/imx9.c

-- 
2.34.1

