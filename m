Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48BE25D557
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 17:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746985178; cv=none; b=lR8WvjN+1QJTd6wWGdF3PcF7lrIiuM62u2/qlSR8yr5zJ0aIfAziqmedotXhuw1EbwOqBgwxht2Zm8vuBQ2mAX//TMr58ojhXcYxfD40U698gMP+4NbAnFAIgHUgzxOI5ZEZjiZ/aCiHEvCN+N7C3SIiHESEmu/BQk/BnIiN7Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746985178; c=relaxed/simple;
	bh=IPXduNjdPqXlwZF1nLbl8D7KU2jgmcdSUy8mFKn4DLY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nKBD+8BiAex0tFUeMoM5U7CyGBHYkkZkfp9Pri4Pu/shH1KcW4KnknLtp5+6NXDhNSnZ1i+amPprCUbISJ0jrVt0i5vAykpsH9StHos6GkywsXjyc+mYQ4Sy3RMlqPx5Xwu+Vnjz51J+k/FlXIpl63EluYyulQ0ixArlRYKNxKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=libre.computer; spf=none smtp.mailfrom=libretech.co; dkim=pass (2048-bit key) header.d=libre.computer header.i=@libre.computer header.b=SUvMbhWY; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=libre.computer
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=libretech.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=libre.computer header.i=@libre.computer header.b="SUvMbhWY"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4775ccf3e56so58620771cf.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 10:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1746985176; x=1747589976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xLoioQfYdPBgm49bPKitfsKJOSsTnQU6DqnNOtLxcjQ=;
        b=SUvMbhWYe1AOzh8qEaf8fDuvtdEd4nDyBg09KVt8Cgs3HcMwUAdz/VuylRnUV6iBdh
         jUbcMLmcp6Vxa2sl7Q6YXwCjtynsDBeB13/3XHBUhRutYaCNQ/qlaDt718eLNs/Lun3Z
         MD096u+YMLXx1C3AhdIA6jxPBnlqpauikcf7sK9fc4GDortMFnUkTuxQSIm1WusIYZ1y
         e20Ufqq/FRSP3euK80ff04QGz785i5zZQkOa2sUE/DU2fvpQhhB02Tcs5uZ58OfmqK93
         1lJ65V4h4YAyoMA41+u28PeOCPUuslfw/BfadhCGdNtn5AOiHTP/jBahxsVYkTJRV8gd
         mTjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746985176; x=1747589976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xLoioQfYdPBgm49bPKitfsKJOSsTnQU6DqnNOtLxcjQ=;
        b=JXj0/dE6Rq8u2gWKoNEeKZNjg2fCTlSlQQbhcrPyyPG581ZmEebQ17ymW9I00PW6Lk
         c1l4ci4tr16TDqLl+/R6Mwf25smIGQIf8o9njOuhTPx1ZLfjoVxh+KPU9YDnEYgpk+XJ
         f7+wTKCUjnOrv40bCxk1EwlHEsX8KcQMQ21htJq2i/g7LpQgYCbYsCNJPY9JisRz4tDX
         iXOZPs0vOhAqBSzqm/sCiNKExoV+aWq6hjppPpgrbIOCetbIsrdu5SPK+ReUFq47/9wz
         fghMiEpI+W8OUUZX5o1XwL8QPoCtbgHkcjnzwjI3XKw4Dhq4Gv7TnIWm71JT/QvdatIj
         W2oA==
X-Forwarded-Encrypted: i=1; AJvYcCX7x6z4q/4n8vXmJx/G5iG4E/PpNW8yjGGH7oomoI/BLdI5mwZHAjmh7EMLR+MQhWlHVCa8qeQ54xaXquQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3fanjLSn4Daqtamqi8rnSBmlhtYgvD6+MHTw8d/PFrCAsGFqR
	+Epw7IPobuv+6tSrONzqhm/RsvQMg9jmk9frJHno9JLUSrdV0nniAtwf/gJID7sb/zho/ZQH7sP
	P4mLT
X-Gm-Gg: ASbGncuTRrQgX6vAPH+awviM+j18lZhV7srwzRrdhXuG52DBTc7QN3bfEPFb4ubZ1dF
	9qaS8EHBfYJ7IaYyX3u8cCUzCGHDSsWAI1fhFQ1OgV9M/8kYAASCo4tea1mJ+Gpyp18161Zc7au
	ojXSX8kG3iZa5f4yDUUtE12zeiHOcKUz7CcKs5WpT71HBorFGEBuXbPm3UW/S60ujk1Vj/znA3K
	O6uvGnmatnsp6Gcj8KMrNKljVShxsr3dc0Vk0q21aNzk1c4GccYUimdB2oTMunM+Ej4uB+iskv5
	JqvyOpFZi1Wk853RIEi1tmHks8SOHYeOetBKIo5Q9uJIYJI=
X-Google-Smtp-Source: AGHT+IGbtN6p73kbilpYBJERKanPWex1vuDrJr9UjFDjOEDztJIOHD7xUAEl7SH4fqjj9AVcDWDKXw==
X-Received: by 2002:ac8:5d0d:0:b0:477:6e32:aae2 with SMTP id d75a77b69052e-4945285d6b1mr173557071cf.0.1746985175732;
        Sun, 11 May 2025 10:39:35 -0700 (PDT)
Received: from localhost ([2607:fb91:eb2:c0a0:10e4:4464:87db:3a66])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-49452588d92sm38259301cf.59.2025.05.11.10.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 10:39:35 -0700 (PDT)
From: Da Xue <da@libre.computer>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Da Xue <da@libre.computer>,
	stable@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] clk: meson-g12a: fix missing spicc clks to clk_sel
Date: Sun, 11 May 2025 13:39:26 -0400
Message-Id: <20250511173926.1468374-1-da@libre.computer>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HHI_SPICC_CLK_CNTL bits 25:23 controls spicc clk_sel.

It is missing fclk_div 2 and gp0_pll which causes the spicc module to
output the incorrect clocks for spicc sclk at 2.5x the expected rate.

Add the missing clocks resolves this.

Fixes: a18c8e0b7697 ("clk: meson: g12a: add support for the SPICC SCLK Source clocks")
Cc: <stable@vger.kernel.org> # 6.1
Signed-off-by: Da Xue <da@libre.computer>
---
Changelog:

v1 -> v2: add Fixes as an older version of the patch was incorrectly sent as v1
---
 drivers/clk/meson/g12a.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 4f92b83965d5a..892862bf39996 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -4099,8 +4099,10 @@ static const struct clk_parent_data spicc_sclk_parent_data[] = {
 	{ .hw = &g12a_clk81.hw },
 	{ .hw = &g12a_fclk_div4.hw },
 	{ .hw = &g12a_fclk_div3.hw },
+	{ .hw = &g12a_fclk_div2.hw },
 	{ .hw = &g12a_fclk_div5.hw },
 	{ .hw = &g12a_fclk_div7.hw },
+	{ .hw = &g12a_gp0_pll.hw, },
 };
 
 static struct clk_regmap g12a_spicc0_sclk_sel = {
-- 
2.39.5

