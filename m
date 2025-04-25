Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DCE17A2EE
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 08:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745569558; cv=none; b=umcxz1dwB7Wnv/EnKdMANu0Dbih1CC53mSpPP4spbTP9xtYoFogqluA+O+ojpySk3LtIjEh6o1wrAuWM1FgSHTUUHJMEg+Y5grZnL+FlCsWZAR4uMF9ys7dAcyPO4/IjkIWPZqdSDSIcHbSoD4Vk+y6rCUVghceiDp4KbPhqqVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745569558; c=relaxed/simple;
	bh=/dIw5PCvbjXSX8tu/5SdpFQVt6TqWWXNHc5eW4qJF/4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AEIVBBKvD68Ruxuq5Pw1x1qejgNQEU1LfThLgZKprLYyX3fObZdb0weiFG6QD7Ljs1o4QVH1RT7Iyq4sfZql9GUGUSDk2tINK1yu9Irno4rns5ZBoUy7Hz7KFvvju+/RKW+AMMtWAp6LAf0pTpfdn8XOX4UzS2LL0FphKA49luI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Oa+0sqLr; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Oa+0sqLr"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3018e2d042bso1374182a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 01:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745569556; x=1746174356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jcz9EqU6ZQpMl1zFWZpq4KGu3DkXTYoxIWYCwpKvcbg=;
        b=Oa+0sqLrVqGPPpaZ+H32VwMoNRlOcxq3ssRporMwtNEwbjIRWsFG9gsXxXeFPa386m
         sWL0HmHxZjGu7Zrjq6+eWSGjmlICho/kiSSt4el1Kvg3ZBMMMgTFL5rJi47f4Dli84p9
         mJTFnY+WMSeWmPrF2D++NQcyYBprak1YqXUXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745569556; x=1746174356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jcz9EqU6ZQpMl1zFWZpq4KGu3DkXTYoxIWYCwpKvcbg=;
        b=Z5X0MuRGRwt2n+licPgPXERVt/ff1NChwj6ghY5qd95TOD5+ySKwGkv1/XtTGkp1ah
         NB38KxXBjTfEcg7oKHN0sHJocKPv3kCAe1S7mSYw6QwZt3RddBNC4iS8s5r5jK488CIj
         l5BLbfH07FM+sLy4ekG1RbdCGldbcVMCs0yMunNgfpqCdGxYFUXqUSsq7jOhANE8FXn8
         KqSdPGYWraxTGLzDGtcGdZK93VZ+eIC218Rtys5lJdilqD2hhYMdijqH+m74qLzdygeW
         cBcqq1j4EOmYDxUxZ9kciZYOR9cdnByumn4THBb6dqM6RjLu8EEL2pYB+6d3Hkx/p9f3
         JVEg==
X-Forwarded-Encrypted: i=1; AJvYcCU/3YG0UutXY51j4zkI0rXPYuCSGfj7+lSxYCxQbJrQbcZB2kQlPzfsJlf3MxHq/xyd0bwdcmDk5meaEf0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBN5tCZNoO+MgvD8fjOMbSnUo7AovVJ+6bB+7hk6opMAWB9MgD
	iwq4YP2i4ZNY2UFdrVdK28RL9+rT/LfuJzhOPib4Ce8BmWpS/Y7GQf5IPfydUw==
X-Gm-Gg: ASbGncvqfyf+bBey98yuckSwlkKY1pDpO/b5pLX32fbnQHbWG6vtgoZFH+Mbc2T7pHi
	qwqkmlDbbWQdVAm5XCoq6FGwF6ud+ghoTZ6//sSlO0ryBL9OdKowu/6IFFLXQX114JD8AT6Rdv4
	YkGNBP5Msk3QV6sNe2Y8gDVzqJOIZ1RV3/ZAy644jCpmCZPNS86jnWYkT0JeAOIMj6221Tp7Me2
	gv4J+Uxb68yXEPxL2O521lm75h+VH7oAC4ZxXzl3hu/HkDrp726Vjh6Gu+e9Ll2frDUPrFgSOj8
	O81HJF1BnoAVaCPG2Mj3hxFgYfQZ3NIjtpSy6m+m/Bnk/cKwFCaVqT34+cquZpn2il6s3Q==
X-Google-Smtp-Source: AGHT+IG5Uyfo+8KyJi5NoU797oZIX2TlpTNv7KKnWh9nNRiitklDfGL+r4wwSDuwBFRSrPVBj5U9Gw==
X-Received: by 2002:a17:90b:5448:b0:2fa:157e:c78e with SMTP id 98e67ed59e1d1-309f8d8cdb1mr2089363a91.7.1745569556308;
        Fri, 25 Apr 2025 01:25:56 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:4b10:d9aa:98d0:5bb5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f77417d6sm1019179a91.4.2025.04.25.01.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 01:25:55 -0700 (PDT)
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
Subject: [PATCH 0/3] ASoC: mediatek: mt8183-afe-pcm: Shorten source code
Date: Fri, 25 Apr 2025 16:25:47 +0800
Message-ID: <20250425082551.1467042-1-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.850.g28803427d3-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

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

 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 616 +++++----------------
 1 file changed, 136 insertions(+), 480 deletions(-)

-- 
2.49.0.850.g28803427d3-goog

