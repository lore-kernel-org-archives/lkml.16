Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D0E234963
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 07:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747294714; cv=none; b=uIWG4ZDCDyXNYHt4Z0EaO+IPS9BWTMCPgYlFLw14dg3kjcB3cj8gOvPn6f/P/a97Oo5OupyA+X3n+SohOAsxhlA65/vidM2dIBGKifc8heKHluW3Pm+JcyddHJ3kxUK2Lgkd/mF9M/4teW42+4U3D9SyErwDJHef4CAR/k1sdpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747294714; c=relaxed/simple;
	bh=A7YTQEvxzdjN/uPXGiOZhVl7xg2CZBthDtu/Z0dxqIM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oKg5nPqNBN1iHUYN2TfqdaJZusJsNTydTFOji6KjhZLbUjvbmVRmR9DGcmCUHxn5u/xLdHheITsNylIKyg7xj3ZnLFdFn9kCEfTgT/ZuKXf4esm5iTgzQfAWaMMdMm8MYmsblG3UYnlXqiLQCSFPEhGRn5xQTTEoYqxwtmV6xcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FlJFZoUE; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FlJFZoUE"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22e6344326dso6574905ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 00:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747294712; x=1747899512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UTuhmwgeL8CMgAtrwpyLwhvwNVYclkrjjEa64TIcJ/A=;
        b=FlJFZoUExZGyDkT078gsEjRFHQuEePzz17LUtkpA+hBDPwzdfUEB7SFCrjwvbB+W1j
         esFU+eBDq5KTa+z5O9so5Z3XcgS6jK1cMYrwWnkXd/zdPyZv5/vzZ11Y6s99x4Z6ppHo
         PIf2rFY/XvKOaswkAJ5D0McLo7GlE3wH78CqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747294712; x=1747899512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UTuhmwgeL8CMgAtrwpyLwhvwNVYclkrjjEa64TIcJ/A=;
        b=eXPJ5oNTXrxe1zcHGqD10hkCqhs5yBkASLv+DTl6C0IKPSGMY82J7lav2QFgTbSE8A
         udXomQXMwmLpqtkG+XQfHMjrvaIDg6HY+4D4Ff7J9cJ0E8Q4kr8n3Qkvo2je8MxMnJKh
         CC+pbHmLHL1zdZspYwM61dpqkquK36DoYpUPI9nAvxKA5fswQ9Ctg/s82FdAP6CaZ5JU
         NhQx8wFSb+iF20cnaWarTqumjlPO1P+PVQXFoS8KPzdb0o5UmjGfWS8gKhN7vjyaKYAt
         M2BvbRptfOVeTF9IQgugqQlEMxTDga7Fc8yZRU1zDev6xp4iNcLjAgURsskyclhVKpm1
         uQsA==
X-Forwarded-Encrypted: i=1; AJvYcCVuYEaZA47K508Tq1IBj1YtvLFXy1ijuT75PtjLunVgOs8EzEfrRCu6qNa/b0ynQbE1bWT7KpN2DnYyLQw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/dmZCOjBBgk5Y3C7O3CFMWVCnBigl3HFOjS31KVXWuoGSsL58
	1Qid2oQD/cCJ46+g9qHUR2PXv7mcT50l+5coCoFXAvlCKNxlIRjbQ6ojCCxvUg==
X-Gm-Gg: ASbGncu9pBgrq7GGR4UtpySZUxS7UPrjizuO4Ldk8PlqpSnFmuJnqbsF3VbeDTGyA99
	YXj1YaiVabq5taANC3r8RkpFZm8VKiVlt8Nk69X4oxg6Im5SChig1LWhxGRrgFH9OCC1BAXnDUu
	FlzJ6KgXmA8rlqhigR5Fk6qK7PLIy2OqO0DYdo6blHEnaNf2vwKbzmvfVxlJ9UCl2jeccAAb86g
	eHDIkCt1pACgSjONIdE/spGlrETsWKLiuAQnpsTS4HIxi+E0RjS48I6XUtxiZfJOmxJ2bOrPAyG
	f/wKDYgWZcCaIFa2akt4NxSMvTpD0XX1PheV6QPJoyKDglQD5XUcYKAKA0Yp5kwCODsiMbNzzyR
	9yGKb
X-Google-Smtp-Source: AGHT+IHd+tTQ1WkK+zV3TpgzWBvKz1U7eVTGR5TBqP6q/kPdJhkugAruaqhe6ky7C8X/88yU/ln4KA==
X-Received: by 2002:a17:903:11c9:b0:223:3b76:4e22 with SMTP id d9443c01a7336-2319810ffa6mr73889445ad.6.1747294712457;
        Thu, 15 May 2025 00:38:32 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:c43a:aaea:5f52:5763])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271f61sm109750825ad.142.2025.05.15.00.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 00:38:32 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Darren Ye <darren.ye@mediatek.com>
Subject: [PATCH v2 0/3] ASoC: mediatek: mt8183-afe-pcm: Shorten source code
Date: Thu, 15 May 2025 15:38:20 +0800
Message-ID: <20250515073825.4155297-1-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

Changes since v1:
- Rebased on top of -next, dropping changes that cover the DMA address
  MSB registers

This series is meant as an example on how to use macros and range cases
to shorten the MediaTek audio frontend drivers. The drivers have large
tables describing the registers and register fields for every supported
audio DMA interface. (Some are actually skipped!) There's a lot of
duplication which can be eliminated using macros. This should serve as
a reference for the MT8196 AFE driver that I had commented on.

The three patches tackle separate tables in the driver. The remaining
one that could be tackled is the list of DAIs; but that one has more
differences between each entry, so I haven't done it yet.

Please take a look.


Thanks
ChenYu


Chen-Yu Tsai (3):
  ASoC: mediatek: mt8183-afe-pcm: Shorten memif_data table using macros
  ASoC: mediatek: mt8183-afe-pcm: Shorten irq_data table using macros
  ASoC: mediatek: mt8183-afe-pcm: shorten mt8183_is_volatile_reg()

 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 571 +++++----------------
 1 file changed, 127 insertions(+), 444 deletions(-)

-- 
2.49.0.1045.g170613ef41-goog

