Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB491362
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 10:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745230394; cv=none; b=Ympoif72b0lvhg6AWs2tLOXTIB5yAINKTFDXvnMc3R9gnUZ5+lN8ElK6lKm7rj0TBMz9vQd3oHqZu0arB2ojFD9xvSm7ABsd6FmiTvofurOmcyVrAMwjwhU6SShLaFbLjVedO+8IgGxk+FE02cJzVH+g4Uie4Smko2494K0+o6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745230394; c=relaxed/simple;
	bh=FR04IaMx5M3reYvC9Ul0vGkqy5dkFbswq922BLXpjDc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YmPY9zF28x+IGbW7VT06ahiyOHh9dSdlIoI5BjDQRbu/uSXst0t3Kfta+rKPDObhsjZt6L2st3gPQqI38GAg1XYDMRuRvOkcIqZayW/bYILiworqy2rtv/tEVnAbLCSeh3BUz4AIblsEPUn1jlfbn5zVsXrEewkcqkqg35Ui+lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EI7lMEoC; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EI7lMEoC"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-224341bbc1dso34970185ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 03:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745230392; x=1745835192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sTVdf/HTR/Pq03sjtrVZQf/ywmAoP72Oaa16LKk/YT0=;
        b=EI7lMEoC4eos4V7Mtya/yyQHK8GjlXRZkOM9WyEVG1h2dOGy9uNgh/SVB1j3fTtP0N
         iRm4W1dQfuhufPcv7QpNFmJBAyS5dAa6aALvoW5EKWgD3gfA9Rhjprgw7G8ecUSnsrRX
         AverPwptbkKKCMF5Yo9Mr5JR03gIlGw/PdtUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745230392; x=1745835192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sTVdf/HTR/Pq03sjtrVZQf/ywmAoP72Oaa16LKk/YT0=;
        b=l9bPDRV7aGVDl2kak/AfubU0Efu/NSltv3C7GQMkc2j5oLKlojk0TtY4K+NvRsX1i0
         uafB5hpPqu/pq6rP1gi57pwQou1xjPJb7Gk3V+nFmB/NWYkbWPeQJcws9eR/xQm3NmRx
         pFu9TT25rZYVYdmNRH/2L5tacqYbp2Xz3JKtEwCuIavx2GL3l/9g8JcKLKpFbakDMkxY
         /zGhBrzhm/PMmnVxSWdmlrPggPo2iLq2DsXHBPepQWwmf5FiY6DkDjqPYAiYf81C1xOl
         AUK9Xxc2cXM/As4QcYXJIZBLlLpt+Ryup13gKRqiIhIn13lNNmqBDksW2Ua562TB6Kiu
         y7iA==
X-Forwarded-Encrypted: i=1; AJvYcCXVrAD4f0aCzPNRqIHIQR30+pprfiquQmsIrmV9hDHgYxuqBmS4VjnzxOb9rsaqeAdob8fC9CRrDAg4+9U=@vger.kernel.org
X-Gm-Message-State: AOJu0YySKXKByd1YP1Zq9q+Yslo5WeVi9fQmzWbdu9rtvTigWcYP4lzT
	VGlC7XzGFM0F3LgcAPlOTQsIRlnGKBBAxjBvH5PKi+dCfONK2Ba0zH2D9fEg7Q==
X-Gm-Gg: ASbGncuXVcEyYqaZvWID8ICUNcpwIG1T1ct+3SCnC3nWqrGTKiXllEaTtl/aO1xfZLZ
	EDhNvDDlQsmHAKuRx3GBAKBUDI7uwEHGuY3fVUg1o8ZO7L8w/0AOU6KxFgW0Mbb6Q0YIErbpKFU
	Ga61W1E4OGWdTW6gwDK8svLhqDhHgyWmxczegHhWNooTnis/4seLRdpWmQvjwIQmV9mh7L9N0z+
	5QjhvAeQmB7p2Udx3fH8e3gKWMuBPsnvTU+7cM2DycY32eMfy7TUZw9864ZMMKeLXnimINV+ohg
	HKedJ13mGs/jI12UsUORl1m7WlPFxuizBmlKmqKpVaYx34QD82ryUvGok1Q=
X-Google-Smtp-Source: AGHT+IEzP8P3BuI4W7WctpJECwx8nzR8w2GBK/ppnOU1J4/hN4o5Y1Q6ZPLjik3RIkoMMrSDGxWajA==
X-Received: by 2002:a17:903:19eb:b0:223:5e56:a1ce with SMTP id d9443c01a7336-22c536063e3mr184062165ad.32.1745230391767;
        Mon, 21 Apr 2025 03:13:11 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:7633:f42a:d31d:3f9c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22d78db8b04sm38985205ad.238.2025.04.21.03.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 03:13:11 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v2 2/8] dt-bindings: arm: mediatek: Merge MT8186 Voltorb entries
Date: Mon, 21 Apr 2025 18:12:40 +0800
Message-ID: <20250421101248.426929-3-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
In-Reply-To: <20250421101248.426929-1-wenst@chromium.org>
References: <20250421101248.426929-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are only two different SKUs of Voltorb, and the only difference
between them is whether a touchscreen is present or not. This can be
detected by a simple I2C transfer to the address, instead of having
separate compatible strings and device trees.

Drop the SKU-specific compatible strings and just keep the generic
"google,voltorb" one.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes since v1:
- Added Rob's ack
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 108ae5e0185d..49ddc504c160 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -339,9 +339,6 @@ properties:
           - const: mediatek,mt8186
       - description: Google Voltorb (Acer Chromebook 311 C723/C732T)
         items:
-          - enum:
-              - google,voltorb-sku589824
-              - google,voltorb-sku589825
           - const: google,voltorb
           - const: mediatek,mt8186
       - items:
-- 
2.49.0.805.g082f7c87e0-goog

