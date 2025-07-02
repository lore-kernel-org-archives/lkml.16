Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2F0275B06
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 13:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751464197; cv=none; b=NgYEIYLvdSwBT/jbpdGAqG4Gnyv2OAw3JeOuKgCmZSjmBwZtETCJyhXWr1sxKWGVxL5cgJfUL3d7VGveipO/X8TvemwvjvhZuEN2a/gNENKV8r0Bzw/adAGEpBQx1v9gzz4pmxMepWhXCm1mwaq3qbjtu6x0Knk1OC/TQPE5ll8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751464197; c=relaxed/simple;
	bh=w7Xyb40cJn24nN7twBJleYXadnkJ+HhRYSlYtmT9oX0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YwRnlNU3ePzwMJu2z6PmVf47lrXmvgLa8mk+Eq8x0Sar0ulI18k5FbZs+6QakuCgR0to2gze5HwBNVeAwzG7b/+n8Rbo5Z7craTvvoEoLuqA0wYJ6/YOUXVcCdc68aXiSJBMxmbxy4F0iTwQpFSxJjVRhGsTWaFWXQnO01ae/uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=3K63wgx0; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="3K63wgx0"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4537deebb01so23673485e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 06:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751464193; x=1752068993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tp6qbi+ZUsoL8Zvytk6fdxJM4TvJdtmSvks0lRTguZA=;
        b=3K63wgx0kjClNkPRLLN6rQXGVANDR0ScVQwCYi6iPF1hEtRqqa3i+2Hhv3b60xdk1m
         mUKQML+XOJJyr8dxdCuh+B7dCYueI3zAtgLT+OX4xQ050gcuJAfB+2royXCnivDRjaQS
         CkIMkB/Y5XLSmtD0xyB+3BpPmHq/emlqjziZOUm8TOmmPgMyUtKUoDfgjI4Ir4xg7Fxo
         vme0wAIvMAqYxLOu04KFh/LPOdhrbpInlHhxbmMoW2KOnnV/948ZEQjEC9rsl0k408Hv
         jgs6MA9U7bswb76ko5Qec4Fj/Ai6emwYj28OdhLV42CpXB47cC93vdxMtun2UFZ8dmdx
         P/rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751464193; x=1752068993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tp6qbi+ZUsoL8Zvytk6fdxJM4TvJdtmSvks0lRTguZA=;
        b=cMWtBebxqr916NQ/toiMJfbOAPspGB/EV0NY31FvZ90sGsY/1Nycgb7iLs4H7AUlOE
         qJ+An6nvQhp+d0qzjkpnH1zJM1qWr4bgL5vyk4BEFypi6HLXcVWYU1jShJeHCf7nFvzf
         voQSo6TvMgwgK7RIQwdBudi0LGDhmYi+qU/LKFLIrPcDqj26/5FcCXLy1urZh/nmMw0g
         YyL5rF/hQKmE8lVWPnX8oUIGw2E6pymdGQ3nRlwWGtBvFRor/cCBLFQV3n8DsfbNkbcG
         QZ851CQk1kO1UYGRw+h/i5C1TgNX8JRuY3by3xRHdo3uUDTd09tPplSN22pu0/TS7CF2
         mUpw==
X-Forwarded-Encrypted: i=1; AJvYcCXI9oiYsBAxqCQAP8Dt2e9aL6+1WpoXXoM9Lr+nZDUJ+q+GX3uczjuNRk0Rk7Dfc/cD+5c9CLiymiwjJUg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0BuAs/4iYVJXxzkOwVrdZKnMCLOmQcLWCSy/9yh5KyS+oGGp6
	RaqK2HZabq895TQZSePFsemU1VLy9yk8PZOYUx8ZyyhA75a19Jmd8pdmphH7GSVzbdAmBeNhM6C
	wC1yXLlo=
X-Gm-Gg: ASbGncs3R/NlevDNg2eO6hbglFNU0d9s661B9lrqUdD3ijgAaQc7dSzdUO0YYl4X3LQ
	CKyDuEKDadK2IlzrB/vbC/rz4dWf7pVKGyup2CfwWhhPKjqSNP3n5wFzgOMHuA5BNZ8sdcOWfI8
	3nNsYrNP/9e6ifm5rum+dA2vHPguu65nel7+vD+0pmjUABy5NIqWsYBfWd/hZzkpPhHlI+QZ2uE
	exaDR7Y+JANO8QVvlq6pVQM8VIRVIYOUMcHuGnF81TeWkw50gmDDZ+fURwMYZQIN1YNzvCmeX80
	rxsBc+WrH3FacCL51+CCKnVhZguHE4v+UGK9jJpAcC0AF8p0c7S5BUfRCTo9xoSh
X-Google-Smtp-Source: AGHT+IE0aYFuuB17fOVm7tTLCtf+dmCjdxDuykMapL/v/tu9OvfMxXQZ2W+1BibdIhnsoHzg8jgH7g==
X-Received: by 2002:a05:600c:3b15:b0:453:66f:b96e with SMTP id 5b1f17b1804b1-454a36e59e5mr27310635e9.11.1751464192987;
        Wed, 02 Jul 2025 06:49:52 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:5542:4bad:e07b:9489])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4538234be76sm229611545e9.15.2025.07.02.06.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 06:49:52 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 0/3] clk: amlogic: drop clk_regmap tables
Date: Wed,  2 Jul 2025 15:49:47 +0200
Message-ID: <175146414026.853943.10828213278410339328.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250623-amlogic-clk-drop-clk-regmap-tables-v4-0-ff04918211cc@baylibre.com>
References: <20250623-amlogic-clk-drop-clk-regmap-tables-v4-0-ff04918211cc@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Applied to clk-meson (clk-meson-next), thanks!

[1/3] clk: amlogic: get regmap with clk_regmap_init
      https://github.com/BayLibre/clk-meson/commit/21ed19d11863
[2/3] clk: amlogic: drop clk_regmap tables
      https://github.com/BayLibre/clk-meson/commit/4cb53fff9db2
[3/3] clk: amlogic: s4: remove unused data
      https://github.com/BayLibre/clk-meson/commit/8a65268500b0

Best regards,
--
Jerome
