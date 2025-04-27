Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08C6247289
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 07:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745739854; cv=none; b=LuEg0RWiUUVxlhTvhYDsjfNd8zWMuNKXxucdz8PJM0bMjBO64Gvz2Lpdgfu67VSvBWmms/zpbKH703xGMGzRS3BkEfun0PGYyTGbZBeSQg3Hqln6vdutHJMkCcpHd1aJkR0iaWzBCg3ElTxPV/RLStkUH1uleMc2ETksMrHUrTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745739854; c=relaxed/simple;
	bh=5/ognVn2gV4roYlrwA3n7Saujcjw7zfVtgoIux2q/NA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bzycs4c3tsrms8yRFeYPID9VdSr1gyXLEU8L3qVAL0WdW8wmuiQCD3dfoSIpPBeW5oYrel+3u7gDMBNaG3QxWL4xjHplH1HEcNZX3Sec+jXmBYBxkvoPLRbkQnO79Caj7uWN52UhJfASBJ9XMzwYg01yNFZS7lNpiQZfPZxtzI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Tk02Lb9q; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Tk02Lb9q"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso34379065e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 00:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745739851; x=1746344651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FpQyYzT4X9HKnHUwrDxKtpV4uiqgR6fRfhBMNjhjrS0=;
        b=Tk02Lb9qYJpXx4zzkppFNH7YLliR84aoVIlxUIKBJkisBMZCS2MNljI6pFctsTYNWQ
         iYLu1UWJrf2ZB1Rjg3DDYsfKn7fq2lukPZuDDb9UkDmMKbueIGtyqqigkiXFE3B7O10e
         QLxvPwm66I52gp5NFjNnHpY0nFzdhLLL1ptrs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745739851; x=1746344651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FpQyYzT4X9HKnHUwrDxKtpV4uiqgR6fRfhBMNjhjrS0=;
        b=HEYSaFuPuYQDwV95tB4N9mQbTIqnfV6x+UTNUpwq8s9R6vST1V48M4/5QNy5DBrisE
         4FK/RrizyTzVUR9XgilhEsYQSqISEpARW091oyUupQ6lK5l5oS11p2UaPJWe5828YWQL
         JtPa7qfka/TTTdmHi9imITBh0H6/CzmSBZveeffQwQeYBRT7rhld7s8FuL5NmB0znvf8
         b5jcetTl/Ca44ISE3GJJrP/g6d7sNdUKiCcVm+3xqoEBgx3p2EJbX/5Yz2SoRMgHwUUb
         49e5ZhWdswqfaLJWA9aGUG1wFyZf+0M/EYDDUG1C3nZqqHiz/DIFNjX4hFz0Nz7ySB0Q
         VXyA==
X-Gm-Message-State: AOJu0YwUl7CZayu9/dBX21S5a49a9kyopCodUAPEYPExzewB6/ickUEX
	L8Rbg+cP5+Ctfe4W82rtn33L6ouWgHAGqXpiM2FLrmN29LwQguSW63lKHn4sEYnwhQr7E94WOc5
	V
X-Gm-Gg: ASbGnctp083R5IoixtWSn2OPIT6awpiQsRJDsNqeUK7cSWGtEtdz4ntXeJrAu/+DlpC
	pEbkFApMTq34c9fs92Hut35H5yje09OvlR2vD3UWo+YYvZorsK/OsuUYlxrQZoM9w3qPrUmeVtJ
	2bu2BkbXV/1kzolt6MxrkqCq2AAUZfCeyukvHmfIz88B7WAfwAr+J3HMbjwRzqwwziwaD4Lxawx
	pL49eTNEuk8dS5g+M2h33Z4sM8T5h6awMBvCpT0v9FyxrJreaxtsVx4tTX1cPWjqv+t1p1B7c6u
	QdVGoYHbRjOqAy7x7xv4GFkYcAbDTnHwRha7GZUclXQpi2UNBTCvOMHUvqRe1nJwD5t8Kw+21mq
	vAMkIow==
X-Google-Smtp-Source: AGHT+IHnx27fFK0oDHbVYzNEsRJgFRPiklQgqUZhae0lH9ygvIp4VX+fSkkY91P89JAIMZaLdkoxOQ==
X-Received: by 2002:a05:600c:a15:b0:439:9e13:2dd7 with SMTP id 5b1f17b1804b1-440a64c159cmr74150165e9.2.1745739851229;
        Sun, 27 Apr 2025 00:44:11 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a52f8915sm87682015e9.7.2025.04.27.00.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 00:44:10 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Marek Vasut <marex@denx.de>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 2/8] dt-bindings: arm: stm32: add compatible for stm32h747i-disco board
Date: Sun, 27 Apr 2025 09:43:21 +0200
Message-ID: <20250427074404.3278732-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250427074404.3278732-1-dario.binacchi@amarulasolutions.com>
References: <20250427074404.3278732-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The board includes an STM32H747XI SoC with the following resources:
 - 2 Mbytes Flash
 - 1 MByte SRAM
 - LCD-TFT controller
 - MIPI-DSI interface
 - FD-CAN
 - USB 2.0 high-speed/full-speed
 - Ethernet MAC
 - camera interface

Detailed information can be found at:
https://www.st.com/en/evaluation-tools/stm32h747i-disco.html

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index 5fee2f38ff25..75ef877530f9 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -42,6 +42,10 @@ properties:
               - st,stm32h743i-disco
               - st,stm32h743i-eval
           - const: st,stm32h743
+      - items:
+          - enum:
+              - st,stm32h747i-disco
+          - const: st,stm32h747
       - items:
           - enum:
               - st,stm32h750i-art-pi
-- 
2.43.0

