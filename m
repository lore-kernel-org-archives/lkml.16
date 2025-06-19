Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5364A1D;
	Thu, 19 Jun 2025 08:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750321859; cv=none; b=GtoGiFZMYwP5VGLhgs8mmUZOkxX5KHxokaOFrLBu/dW7gCmQRrFaIBMvqVQK89mnH+RKd8kvx8AoPuzut6VxfloShj80iU6ADDGSESgNGPl7EVVBqM1NiENmDgpWCYof5389nS1XiC5TKP9mP+8ZCovCmZ8+N+mOGSpZ9FHdV2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750321859; c=relaxed/simple;
	bh=5U1WxsatwH9pCFmpAeShXCBLm1r5I+NDtPeCRXqZVpw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mRayQ9KEewVOOZ82F1EEmdPqVrKrTVox54VuE/+8g8Ofw553w4rKe8gSlA0Mbmi7rME/DBTYYIwns9uMiAYWjucd9jH3CKSQ6h9RE/wdCrzhAkTy0AR9kmjBamDACtGwkLfRTv1VZOqXgWJRP/LNlGzZBBDsiB6H6wXLkS1ZpX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K0LWzaze; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K0LWzaze"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-450cf214200so4385615e9.1;
        Thu, 19 Jun 2025 01:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750321856; x=1750926656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1T6FrQp2okPwOD58MAho0evF8YiqmPgaoUsaoWni2dg=;
        b=K0LWzazeK2rCTbFZMcSxY6kuWtGLS9/fyl1pZ3MWCKvOlyhl6bYc+0i0MOTOLIO3hy
         pyTiaFSexrbmGc0WgkSpS0wJ7qVImr7bt+iz7Ib4MWM8i+VUDqw7fWci4xgPCAWMq5ZF
         ZqmGfFo2cEFgv9RYgTu7ouwE8/HpfKBZifsKoIrIgkfpQVIwcn38sfzbA039WctulEIj
         mUdbZgcPuAqxwDN3DGtyXHRaoJtqK5YGiigNgN7XwCJvAIPyhOU44RrJ+oa+lTPGwX0g
         yVg32fo5JlSuiajSG76wu0NukcwWXNmkiZYf/hKpVqHaIw2hPQyNN/5tgyKwk/byk+Y8
         re8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750321856; x=1750926656;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1T6FrQp2okPwOD58MAho0evF8YiqmPgaoUsaoWni2dg=;
        b=KHm8g/5WRcHjMcj6ChtqUuKZH8MwZ02JmkGh08rbDLjhnGhnWbtYenrF4T3PpnPKyl
         W1+cwlUxmZYTWfO701W+OxsitFXD92aAW6/ZJYroHOCT2o0NDR6IkSxh8jFcG7Iq6Diq
         y8FOUjVFVHgGigc9NAGBV0tSRSPahfWDHLO9C54Atij+dsbhEo+iLpkcVOmZL/EmLdRb
         1XFmH8clGQ89cu9edboKGPWmzbfnVyO8te5+H4tDXDrX9qPaSiZdUoBMNiC9lqXnyML2
         n6uAtYzfy+zBlr+caQlFVvTwIkbTWwhb0DJujTQ6OknfjcF9L1XwcUO3PArhzK5dTE8e
         wE5w==
X-Forwarded-Encrypted: i=1; AJvYcCUPKFeb/bosS0zHvDhZW3GpSgB9I/CZaq2vRAw98pn8+vzTF5R3gP6K6+ftG1yiJJgOl/dg6ed2jbg/EOVb@vger.kernel.org, AJvYcCUqx6SOE+cWG2td39lb8HC3Q88q0NozY7djxenzrshZaEbA5Z7x4Bjjig38g/HCBwrviWnPFL41ZBY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdokKCCpEG1k+vnH+j+1Rcu+uPMQB8PN8NfNaGmnysf3bNsK67
	qQ1zpJl03yPFhyqsIPZrCEwROqzxVQx+L8eLMNIM0Izq8RXP+aS894LJSSG6yp5fEWAlhw==
X-Gm-Gg: ASbGncvdxRNwecJEbit5T3fWzaQdYv5XPME1bIRm8bKL8jT5i3Ix1Jw2wan2uQ4ck+b
	HwlbZL44R20mExwrJBqF+ot6leE/yNZ5wVpYnJRGoiZpPgA8qh9Fe/fRdU+iXJ8QcgzYN+VdCDY
	n5ahhyIM3QbNuGppa9pP7a0gvCdVYDH1UkwimLFZCap8evmkutpdL2ctV54eD4tmZf7shChtALp
	ngWDNnG4M+Zg0qGui6IOFf/Jse5pQQIPRb+a/4UIK9KYcUSETpEzQS+0vkAFvpe/H+0olgO3wNy
	Znb5y6Gcw8/lhRYGrcbTg/4pUwbLOTNZhtoECxeoWax+Kht67S9wyjXws5Bs
X-Google-Smtp-Source: AGHT+IEQpQd/8hmEsQ9eRTPMz052eU5rjSLNmdJtdjr2u9+ZU4TSJSnOXYilvQhtflXrG48W5EC87g==
X-Received: by 2002:a05:600c:1c02:b0:43c:fa52:7d2d with SMTP id 5b1f17b1804b1-4533cab540cmr174416875e9.20.1750321856202;
        Thu, 19 Jun 2025 01:30:56 -0700 (PDT)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-453599c9854sm27663455e9.1.2025.06.19.01.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 01:30:55 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] clk: moxart: Make read-only array div_idx static const
Date: Thu, 19 Jun 2025 09:30:35 +0100
Message-ID: <20250619083035.1835133-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Don't populate the read-only array div_idx on the stack at run time,
instead make it static const.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/clk/clk-moxart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-moxart.c b/drivers/clk/clk-moxart.c
index 3786a0153ad1..4d34d1d18dbd 100644
--- a/drivers/clk/clk-moxart.c
+++ b/drivers/clk/clk-moxart.c
@@ -58,7 +58,7 @@ static void __init moxart_of_apb_clk_init(struct device_node *node)
 	struct clk_hw *hw;
 	struct clk *pll_clk;
 	unsigned int div, val;
-	unsigned int div_idx[] = { 2, 3, 4, 6, 8};
+	static const unsigned int div_idx[] = { 2, 3, 4, 6, 8};
 	const char *name = node->name;
 	const char *parent_name;
 
-- 
2.49.0

