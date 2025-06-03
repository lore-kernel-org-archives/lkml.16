Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C587F22DA08
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 11:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748951850; cv=none; b=gBvJG4tI6+E6tcznYGWpsmuJDtc5VB4EVYk1ghR+lMSEd75nHgZ7dkJDd38rBWTVpVPDu44OtzmJw88QuiEAPQ91Ca/8NilqSnJ/0WCOXd2EDXW6h5QZ7ww3PQC3PiRGQlyjlIAX+Km/uftoZuWWHorbjQl2XpF5gWyMUaePzvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748951850; c=relaxed/simple;
	bh=ar5+pdd2TFr1JcFtgPO5JaiU/Jpg3+NCQIURcO8Mub4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s/0SbQ5+7CSgMpQ5OkPHDTsIAh9f9kVmchKueIfSWjL/klIlkEyhQow2miQ77hhPBIJyqa6BTHbWVye75My0yRK1CtX1p4sdYF5OASrfZWxu3bWsDGf7ifUuL1TGDcuJjQ9dUUKhnoOA3qJTtN2x77rS3WIhzC7PUP2j/JPkDGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c2GjH7dQ; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c2GjH7dQ"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-451d41e19d0so2664615e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 04:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748951847; x=1749556647; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ekpXsFXiBQlOEYcI0oMkBbtivVJ9v85D39Ocv5s98/g=;
        b=c2GjH7dQZlQZ9JBt9JiEOwTeA2MdUGu4BS1ykDaKXp5i6LjRStbkM+KxI82qcL4qX8
         WXoVJU8+N1bFHEfEtt4KQn/hkHKt7bOUdwiaOX+nkNEup3N6T4SEDasMzA/v8veKWd0O
         gDPW5YtWBM814WD6eKrd3ot3o/hmCTBH5snUVSG4jJgYvpYC8WqbVl9pdOi9tX80q8SR
         SFWl9qJSwBdF+Egav7kA4giqBf+8nOQrHKz1EOklBjgR5O79ME4S4y+klwQnacIqAOpe
         t8qbXMzlzzdq4FtvjSbL6GYxm+wk0B/sy5rKdb5i0VFaXGokapvFa7kKWYn9KDMW8i6E
         qe1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748951847; x=1749556647;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ekpXsFXiBQlOEYcI0oMkBbtivVJ9v85D39Ocv5s98/g=;
        b=qSs0UIHwj8HhSMGo8YfGh+us53Z3dHUMEd8j7tWmMe2kRp56yiAW+9/XYZ0luE7xzg
         6fixWZXjlbxLgHIx4ZxGyKrWMn836a62ZQbptSmKi9huA/Ly053mxBT70ItqE5yUju0G
         zTDwNwco1qq0/jpBRwWLaAOxa9g9RUYZmtSX0A/o5PRWiLx66THUjvgSn+T1Ufh91kfO
         dzbDg+IwFmd04KTFtlsQIseIi7encZ9R5LXvuDdeqU5nrRNkSxbGXBKykHS+IfvDF/PB
         NYSDYGRNygKvNyWkkguDjl68WP8sWlXpzmg4aYnn5zvu8gonrfc312F4/DylUdFBA5Yj
         UJ9w==
X-Gm-Message-State: AOJu0YwcntubbqvG4x5/CVxG249qCJvsAx/4wZC7T16p0KyglZNzrmaf
	Kq858pULgblY5c2wnoIudGZhGxFIV07lrSGMIVKk0tt+chdSlLamB/lSLu0DofyXu8c=
X-Gm-Gg: ASbGnctrUPrdTiRC1qLdbhgqMURmaT7RUysJI7VNK7PINzRbq4+mbh3sinmdHjVPv2F
	bk8IB9t/VtvwxKS5c9+P6DqfbddUhDJYJqr4EpXovDBV+UfXoVA09LshAJi/tMaXe297+RqeYkj
	8ZEjMT2hiZ+gwpR55tI13SqOXPgargsKxVkyjFpOEUfRhNSATvgiL+H8RzqWLo0jpGi7LGNCye/
	nT1/30BMgnU50f0mTKCGeoCP3ZTMU71mXPe7bQSJ+lpJtFpGD769sFN+sTKd2QpHR/gj+wwC4sp
	GJuXD+vcaWl13apLyOPx3xRwwC4fxG8IbmNLXHYgroBVgszhS6B92GIpLI6seOVI5OBOZyAz79h
	9/m6uCKgq+sCRsuwfK/UYbg==
X-Google-Smtp-Source: AGHT+IHBMSZmFHh0iBBqbg6iYgmvQuQtkRQ7ni42guJxRJHi8RXPAyYfJYKwxYJrmX9gnms5o+3FMw==
X-Received: by 2002:a05:6000:230c:b0:3a4:dc42:a0c2 with SMTP id ffacd0b85a97d-3a512c032ccmr984242f8f.1.1748951847021;
        Tue, 03 Jun 2025 04:57:27 -0700 (PDT)
Received: from [172.16.23.13] (adsl-84-227-104-5.adslplus.ch. [84.227.104.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe6c7adsm17671666f8f.26.2025.06.03.04.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 04:57:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 03 Jun 2025 13:57:08 +0200
Subject: [PATCH 1/5] dt-bindings: mailbox: amlogic,meson-gxbb-mhu: Add
 missing interrupts maxItems
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-dt-bindings-mailbox-cleanup-v1-1-724407563997@linaro.org>
References: <20250603-dt-bindings-mailbox-cleanup-v1-0-724407563997@linaro.org>
In-Reply-To: <20250603-dt-bindings-mailbox-cleanup-v1-0-724407563997@linaro.org>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Nishanth Menon <nm@ti.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Sven Peter <sven@svenpeter.dev>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Suman Anna <s-anna@ti.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, asahi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1020;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ar5+pdd2TFr1JcFtgPO5JaiU/Jpg3+NCQIURcO8Mub4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoPuMafbts+SQHLrCKWoSXydLXFpBuxk4+UMd/K
 nu5qIc0ykGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaD7jGgAKCRDBN2bmhouD
 1ybCD/9RNGsVwuWaYUnIhMCF6XOqANSxF4pvD+oiEd/nFdvuoXKyHPDhNDJkzr5JI+eCG+Ub/MQ
 IFPA1Eq4zim5rKSJGghjZ4QRpCKGP/BiC0e3S+lzj0PcZ47Upq2cpIw5uEGa84l7HVOKXzobLHS
 4dtbpNI66GnxgZ1/hAQyG7cQ+b/JVVCKbo1XzHQdPkwO/sBtnEFmUp36ZDI/u9u2hJTCNd9xwDh
 z8DyRDvM8YT02OvK2sUVR4UoJIaFA43uNXyC0U+o2mZ/XAHLxkOL6t9aY9JhZ1KZ+heKhYVtVDq
 jq6Zz6go76ikVf85UUQkieagE/lk1hxHLb8tPkYIOVn2IR9e9sjHN/DFFOa4m725Ke7rxh2Q4FT
 3xEYfP/AU+h/cHPAK8he55zMq5tzMMHeNybBTtDKzJP6gXsE3UrINKmF/MYJBWgtu9wx5yWcFY1
 VYfpQ7cJNEoGpu/gPhFNVgrNwEs9yeRon6WMn3H12OTKdniyzdgIpnJ7JIqajxRgkZkKb7n/zxM
 zAzeos1xnYnl4qwTwwQHYBwmfVZYlkcYcXUthGxU188ahk3mMCNE5DE2eEzBmKlVUVfoGpETAFD
 xe8BwA6xrgnmksHotq8VKWpDAzKd0sqUmepz4DJDrs9GYrxZuqqnQzCCE7b34Hj7GArCuhFFaYq
 RxgIODOMV9Ib71w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Lists should have fixed constraint, so add missing maxItems to the
"interrupts" property.  Since minItems=maxItems, the minItems is implied
by dtschema so can be dropped.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml b/Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml
index 385809ed1569206a7304b777ea42743321c899ad..0849799ee0c5caaeb27fe1e3e3714a630a7c2b09 100644
--- a/Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml
+++ b/Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml
@@ -27,7 +27,7 @@ properties:
     maxItems: 1
 
   interrupts:
-    minItems: 3
+    maxItems: 3
     description:
       Contains the interrupt information corresponding to each of the 3 links
       of MHU.

-- 
2.45.2

