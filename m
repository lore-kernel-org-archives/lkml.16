Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF968635B
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 13:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744292041; cv=none; b=Yn4noHUYbvJSFxdlz7nSGGqNoNUtqzjzFFgxmG+smLTs2xMD1MPGlJaXnDXwG+fNCrpGBZ7vD3E0nbbPKwy7Y1WcrxtgOj6qcFi6s+fb70kquRVni5ChwIEz/VKbGFhqimqIsh5nc0GqdIlzN9/96hjkxwMoBS+zC6gthxKXpWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744292041; c=relaxed/simple;
	bh=P+UQu2wMMTTQfmICTnasM5H76CMpVO5irmZ+6VVgnUg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gIAMRnD9LRFV1NftsgyChuADRBvEEffoAjfaWnoXW3AeHG1FHvLkTYSdY5jE7FonYQQRglfBXivz6sMRynEBjT6Gq2MJBBNXqpyoDEP7OY5q3+EcL1ztCQi0I8DV97DLYmHgptqRckzpY5wa8uUahL0aJrG/0KsVwrwGpy11PWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e6KyaLLa; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e6KyaLLa"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22580c9ee0aso8012265ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 06:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744292039; x=1744896839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t7/MnhQ+XPTlJRR1H/JsR3WjkkF0jznVuDOQtTNzl7E=;
        b=e6KyaLLaLBPbo5pG9t8IkpliJK70IClriwc/4bvvGDcXXYQ1Jyw4EEleiPjEpe9UVq
         YNjxKJjA0OLfB6EH4DYSzdI1BgFaBHGhxV3P4ZaLhetcP8pjl8K17yWp7Aixpxwjoud8
         DNsjGGa8NpUfNyK2CtkcctNTSS+MVpHh3nfJlczKTrN7ZId51hMBUqteiRxwWaQDZEK3
         QX+nfTne9zReBe3lAW6Ti0lq30H15IG5FSmIX3IWv+ajKuOv7z+mUDTqXVEaTUcGTF1i
         h8cebOdqgMQcHVfBauZlCnLrrZceXyrWn3WZJaOulMAxEZDbBtBwOBOa4ZR2LrTTMeu/
         wmAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744292039; x=1744896839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t7/MnhQ+XPTlJRR1H/JsR3WjkkF0jznVuDOQtTNzl7E=;
        b=h25am2px6wcEZNa7V0Kzg8avRvptMKUxDXEH3jVZm0BBih1GghivgrfB3RaOS83Oej
         vBh8CdHV1pAD5+UK+IomkrAvaoSy7wA21f6TPxyCNHK5LifI4awPgGBcxQY9yyAQEAgw
         4PJy9qncSLCRbkTDM6FP8uZ+aVGLESWV2cIJ3mQe5k2Frmve6aa6z9I+j4nlfCmC9di6
         EJE/0Q9MgCuRnbwwVpnlC2ZT4QedtZ0qXVg7mcdvHs3fSpubBnBBIC+ukYWoxvyOCbwe
         HkhC3NIa4M8375BRUM7soJKnnVX1gmSHpLOdjWjiABdr7n0jmmXg/mwTSBFyZbkyvAgW
         +VbA==
X-Forwarded-Encrypted: i=1; AJvYcCUfmTsd/WJDZipHudYVf9Bh8YVfVEoOdeB2SXq2Yow61gnSGSkUxf9g+RTpPuPS1fRHkGTpNGTPwol5wDA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy99hMe9+MCdAyWV+OJT2B6nqzrzxHht54PMnBHb/Vpu2LxdVM4
	H9lp+7AtRU2dadhdVh64pB9FQCqG5E977Yqc0n+Q/nvZgLB3X8uI
X-Gm-Gg: ASbGncueRBspTPDfD0fKR7VoVFdGZcPXYIhmZDaJwufT5WTd8GMsKx11xjwBAr1yKdj
	i/wThSlR3ySDnE4A6W+/ol7257AdYlelt75g0RYDH8ZLoUiBb4Gix+383vStomhbK7fk6Vaqt2G
	QmBfY3gkpGeh6jHZMmHHYqk2wQx1EUbKw/IG6tma4Dp7rVsTt7uxma2+f3zez9rgvspsswxs3pK
	cpeaCAoXU9MhE2xBpN1cE9WG8R+G5R1U+2CbW/WYIATQsG9Sa/+Ijsk0wpSbSYROhIdVqU6MFeC
	K/VCD6I4p0UWIoFlDcQcSA8CQ2QizXmn2S0KWlxYRj3BUCMZVICxWJg=
X-Google-Smtp-Source: AGHT+IG1oHEnhJcJPMpJXFVc2lblDNzFL0NCm1/z6pryHmDc/E60Sjg2zPGvf+IjlruZt6r44yNjmg==
X-Received: by 2002:a17:903:46cb:b0:224:a74:28cd with SMTP id d9443c01a7336-22be03167bamr34974705ad.31.1744292038682;
        Thu, 10 Apr 2025 06:33:58 -0700 (PDT)
Received: from localhost.localdomain ([103.221.69.50])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cb0400sm30121475ad.160.2025.04.10.06.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 06:33:58 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-phy@lists.infradead.org (open list:GENERIC PHY FRAMEWORK),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-amlogic@lists.infradead.org (open list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v1 2/6] phy: amlogic: phy-meson-g12a-usb2: Simplify error handling with dev_err_probe()
Date: Thu, 10 Apr 2025 19:03:17 +0530
Message-ID: <20250410133332.294556-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410133332.294556-1-linux.amoon@gmail.com>
References: <20250410133332.294556-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use dev_err_probe() for phy resources to indicate the deferral
reason when waiting for the resource to come up.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/phy/amlogic/phy-meson-g12a-usb2.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/amlogic/phy-meson-g12a-usb2.c b/drivers/phy/amlogic/phy-meson-g12a-usb2.c
index 0e0b5c00b676f..66bf0b7ef8ed3 100644
--- a/drivers/phy/amlogic/phy-meson-g12a-usb2.c
+++ b/drivers/phy/amlogic/phy-meson-g12a-usb2.c
@@ -339,13 +339,9 @@ static int phy_meson_g12a_usb2_probe(struct platform_device *pdev)
 		return ret;
 
 	phy = devm_phy_create(dev, NULL, &phy_meson_g12a_usb2_ops);
-	if (IS_ERR(phy)) {
-		ret = PTR_ERR(phy);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to create PHY\n");
-
-		return ret;
-	}
+	if (IS_ERR(phy))
+		return dev_err_probe(dev, PTR_ERR(phy),
+				     "failed to create PHY\n");
 
 	phy_set_bus_width(phy, 8);
 	phy_set_drvdata(phy, priv);
-- 
2.49.0

