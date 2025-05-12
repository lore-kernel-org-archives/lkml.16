Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20CF217719
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 14:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747060018; cv=none; b=anASM6iECsoRcbypqOmjYtZ7VCcPOTBYJesxT6+RmwkOhWxHiYFkUPmonvtFCymv4NeQvGUOYO0X7fysKEsOy6c32l+R8AnMV0U8iCdD/CgeQrQBm4pXT5AcTEJTectM93BSZknM0gsbuynlrfD2BZfa+WlnvK1yaLPOv6KT754=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747060018; c=relaxed/simple;
	bh=6T2kDON1dhsNnU+XjIY2oPcsXbHsrN2ApoTFS8oDyVs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bCLiHLAzIKP8xTuUZUiukTR91pmJHWXWbSx5Xk1RKlOefY4+IwX6TdLvLkubvSCXfFyBEr1sMcMhdixiHmPDadbQ+64LPfeXwpTG5dEXsakVTypuW+ar+NrdLhEBrqbQ2OcL4UGzKSUh+PQaGxWi9nbzCjQdovEuw+sVKfR0vYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=libre.computer; spf=none smtp.mailfrom=libretech.co; dkim=pass (2048-bit key) header.d=libre.computer header.i=@libre.computer header.b=XKPL7R/Z; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=libre.computer
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=libretech.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=libre.computer header.i=@libre.computer header.b="XKPL7R/Z"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6ecf99dd567so66572196d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 07:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1747060015; x=1747664815; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RKMd5G0cFDMucPOpi+tWbuy3t/lyFnn71icIWCgXypM=;
        b=XKPL7R/ZhanEz962li/zfhA6mK3Kl4Wt4vgXw4oWSqjQdvTjwsg1UByr6HxxrH+HEK
         78lp9LNx4oZxILKw/eBgl2TF4mK8j5WtEXf1h4EY0c07yNDTkyJRK145B/Sm84JkTMFc
         h9fNZ7BrufrfHJdbkFPb1MX+40dPVKMUNPEKr9sGKC466AQRDO2MsJaohVgdnbvIeB2W
         EFJjgTG/CB2DXl6m14GG6uot9gOkQvg050Yfnydg+o75fcpufAAO/J3yJROqdUUTA6H7
         nDODuaXp4gm/AKOVdi3zoGF98PBqmAbPg+IPi01j9ZUcCRuc8CcsbsGXtD4Pikh5TOsa
         tgNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747060015; x=1747664815;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RKMd5G0cFDMucPOpi+tWbuy3t/lyFnn71icIWCgXypM=;
        b=Bl4CorGac73q52Vtrieb7aoWM3gNI/xHXdoQ08fI1Z9jPgelXUzX+Dd90SZom2LXc+
         b++ZpZR1IVhBoJOKtjW9XylQiHTxUyWkAOKHcahKrVg6fieSl4Tn0hvPaa93P+eoNlbP
         WQAAeAmFgzAUaJL9bzO6YF0g1HgvqFBQp3Mtkw0dflo9lIqdPdOnE5eOGTIrsldKJ/dL
         pWikPEI0rNK7SuAcV1/mPLpMpz77HkzRv6KjvZvAkB3vC/Fw/ddTcxgOLMaRxpaMsZZD
         /7e4R7IXJ9T9OtZpiSdgjNV6cjQE+eTc6OzZyYTrZSBfFy5LjCzCrZWJoT9kgiPieuwe
         pw2w==
X-Forwarded-Encrypted: i=1; AJvYcCUdWqZBCqhYP5SO5FfkzeUvDxnw0jCr3bBlVLmOpKT5U4yQ/Dy9JfvV1tYqi4r+pj8HIVlcFxdKK/jo+OA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+zM0dw09/sRxsdGlMhJ/3hkTlX4de7gWcdKmVztbZ3kUDMuUh
	JDv1ztNenHNCLNXubSq4NwR+uLvv/NSrTv6cJFnbunYj7M1bO4DaqFs2QZsyZw==
X-Gm-Gg: ASbGnctNQMnYahPU8lSRqa0Ee7VTzSZhW2vNIfHkkMwuh8zh+vpbXLMEz5TGpgy7M6H
	oOjPHn27E5wD3LB/Tl3p+s/7/1t8OfIpFILmMeaY91PjxatYMxMPoHBOlEGHlZg9DcBaRc7JyRz
	5Xq0OIdfJYS08dgqd75o4nxYl0VyeQFNIlJtW3/Zww5DLgxezMgD6ozqpcfMLf1wO5nTkKRWjd4
	gDtzAUHKgQ8Tdw8lrCdFP/IqOHtm7DZHHeFt4aWxAZVt4eu9LMLNXyFJtBt9Te3aVG9DrjsMMM2
	zdgYNfNj7XvKJlcPP3c54ZAvJuI+jpn+IlylZgSxMDrnqpGn
X-Google-Smtp-Source: AGHT+IHwLWxHT8fQlj2kksRDBg+A0JhtXKo+AreGOwt+ETP5hLx/Dy37l3apsuA9OkV+nl0kGKBq4w==
X-Received: by 2002:a05:6214:300e:b0:6cb:ee08:c1e8 with SMTP id 6a1803df08f44-6f6e47fa918mr229336596d6.23.1747060013390;
        Mon, 12 May 2025 07:26:53 -0700 (PDT)
Received: from localhost ([2607:fb91:214c:42a4:3793:dd95:dfa1:719a])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f6e393df31sm53362726d6.0.2025.05.12.07.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 07:26:53 -0700 (PDT)
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
Subject: [PATCH v3] clk: meson-g12a: add missing fclk_div2 to spicc
Date: Mon, 12 May 2025 10:26:16 -0400
Message-Id: <20250512142617.2175291-1-da@libre.computer>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SPICC is missing fclk_div2 which causes the spicc module to output sclk at
2.5x the expected rate. Adding the missing fclk_div2 resolves this.

Fixes: a18c8e0b7697 ("clk: meson: g12a: add support for the SPICC SCLK Source clocks")
Cc: <stable@vger.kernel.org> # 6.1
Signed-off-by: Da Xue <da@libre.computer>
---
Changelog:

v2 -> v3: remove gp0
v1 -> v2: add Fixes as an older version of the patch was sent as v1
---
 drivers/clk/meson/g12a.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 4f92b83965d5a..b72eebd0fa474 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -4099,6 +4099,7 @@ static const struct clk_parent_data spicc_sclk_parent_data[] = {
 	{ .hw = &g12a_clk81.hw },
 	{ .hw = &g12a_fclk_div4.hw },
 	{ .hw = &g12a_fclk_div3.hw },
+	{ .hw = &g12a_fclk_div2.hw },
 	{ .hw = &g12a_fclk_div5.hw },
 	{ .hw = &g12a_fclk_div7.hw },
 };
-- 
2.39.5

