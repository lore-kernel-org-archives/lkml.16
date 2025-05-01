Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827431EB1B4
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 17:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746121992; cv=none; b=IqiHlX1xrDB8riA7s3GgWkjwhJOcULEkQr7fkPID2/N2PDVz4P8oHU5WpiisfekptE6/sq+6vX7kNzeHn86YnieE9zSxPw5X1Rzy80sUr+2LkCHUuFeJIecrGuh7JYHwmn1+fDTbUnUx3tIMQ8RCOIRBI2Qpl30dhJAMUhCQgOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746121992; c=relaxed/simple;
	bh=zTeCqKJx8BOxa+h0ofXzQ9/TJ9TJg5Vg7QJjVTToSco=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=rjYY6GLHJBA7AIX/fH1hFJe1gGwma4GIbhJk+qFboaqRoI0af7KX+6iIbxpEcsD3Dz8a2te+lkXBwSfa/kD0ndmII6QMnIAG2A5mvzZqQP1Uj0TCNbYnSeJiVFYacnxJMAUDUCAvkT1RJEfCAHKIHJ474s+MjRNjeOEQfskh0E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ASP8242L; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ASP8242L"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43e9ccaa1ebso1559525e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 10:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746121988; x=1746726788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ofglR+z1wrtIzd5IUN8TgeJfq/CdwPf4h4KTYvjt73s=;
        b=ASP8242LDxRjNVAPztLVsv0ltNZmmgQvgDAFo/LGAX0Kx+uWOU8RKbcXAVAQqPIpqz
         Vyv5xZdTDJxV9gOcbNpnsKc852ORS6Wcn45HeTHOcibWou1Frj6pPInp2H528OhPDVVy
         IApQkBKIu/O+GlsZRx3sjAOlEA6g6M8EdbTGuhmfL9x8UhNXASfsJDHEBsve+WXIQ66a
         NsfwJ+Cv/mgCXsvFdajfM4IHcqIj1znXYtUoOu3IvEwLYZx5A07UTaMmlpUHjWVLeanS
         wNlN2Mti6vaD4N85cGPw5YQUA8qPxTdjDBlC7sq515IAt7DMpwOOo+SZa74NMTSrk55Y
         biVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746121988; x=1746726788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ofglR+z1wrtIzd5IUN8TgeJfq/CdwPf4h4KTYvjt73s=;
        b=iUiH3j1pUXzezuo4gpmdg9aDRxhOUdxZiVuZYztsuFVAlmDoRdJwNU6cwLCt9XMle+
         PCZpWLAbg6FQUYGDZHDTFwBndQqzxY/jjfZuOKW2T817e9QawGy6040M0iA2mheTubdA
         lktV1bpLEeIfBUXNUT0Nm/04hEWnge6zff3XTGoChSDqyjmWHXTcNvTO/Ty00HrYtRjo
         DAvQcY303vSbpGAzgSVeNNpfSS4k+O+8q7zuULhTktgR0hyI9XEjaUbvPRWtDD2lYbIO
         O7IhiZvPaZm0xSM7jjBhGIAJAlUDUGxzkbTtj+bgnesuDhdOH0F+BwDsTt146c7LCBOi
         WR/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWoajNUww1fgzeSCwaOv6S4prtSBrDjRtqBUWcHWDHmgI/t0ZpDYeTqzsbm3PiJ2XVmMewQlaPUmzrJK68=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkL3fnQlDIRCUU5jSYoNaHo6MX7gekyKnhl/WKK6/GOBvd5sEQ
	aKRjKouutCP78NdfgHBy3TISmDrZdrGuB1dODPRCGYZKtA/YJhm2zqODIVrXeWM=
X-Gm-Gg: ASbGncuiIe2rTUtBGcTEObYIXd6D2HqMi9m6wAsXrKrCzQrfwX/iOurJ9BjRYp3Resy
	2x9rcA6R6QFHl/jxU0+CG1flzSZQgGRusJFf0STbsVrCxouGNxUkx8gdwvsMcMTaUNJ8IcM5bCP
	/3RCY7PY11OZZjO5PczrlDIdNl2De8rddtBtL2esBJqhnrw/YM5g9NBAhP9SRuqHd9bG2S5Vwcl
	2fjr3L5M4vEZRATmNtqhVUrMLaXLZDBb6g7GF+j+7x3LtUCT777d1yaBKvqFUthrfTLiJipT5U1
	4XlyEIFCAofpqfptWMhTvZrOXBoeugN0+nv+sKuAkm43AGS6Qg==
X-Google-Smtp-Source: AGHT+IE1JJYbgiJTCHxvqvTaZhyczJnaikw2TP4VxAJ38N+vIsqIz0kMXTpDnk/qXGv1uUN2WXbr9Q==
X-Received: by 2002:a05:600c:3b90:b0:43b:cab3:1fd1 with SMTP id 5b1f17b1804b1-441b74766a6mr9075785e9.1.1746121987761;
        Thu, 01 May 2025 10:53:07 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b89cc7d9sm19656235e9.7.2025.05.01.10.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 10:53:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Peter Rosin <peda@axentia.se>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] mux: MAINTAINERS: Mark as Odd Fixes
Date: Thu,  1 May 2025 19:53:04 +0200
Message-ID: <20250501175303.144102-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1403; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=zTeCqKJx8BOxa+h0ofXzQ9/TJ9TJg5Vg7QJjVTToSco=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoE7T/aNve2OwAbzWwQ48s5jg0yxuK0agbCe3+q
 lN9MqbDOPeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBO0/wAKCRDBN2bmhouD
 1+GiD/9ulwSZTGP7oyl8ttZgBbfN9WpbWyH9puVp5j28G1Lb0QOIVJwsjVTeIwkLkzOeHpMFkzM
 2nDbOF9koXAijVM/3cYslzTwrtQxRv93D4zX0ioZ/aeRpFJVFice8Cza0srQ9Np+2M3K518KYL6
 w1a8vBsuRopda9UlFaxnThZF1SbyeNMq4rfJ+P6/xctmKPPjK6K564YxvInVV0HDtONHsdGXjR0
 zlRoYFHtMM5uv8crgbnpAvcF9J6vbfmHMY1kWhCrQt4l5ieYdq/HE+Jtad7xBGobmKyST39ZuUb
 If4k4hl/vu9CaZG9TB+b+S/Db3Bt3wGTjPI8ep82AlhqLiTVx4Fj7CElmTuh33PzqXM77D/Rooy
 rxM1vO79DEph6QWYfvBHY881j4ONuVPBh57lDpL7q82b9aN54sB6Zo32ECy4VNYU4gS+tfCl5ha
 aQaNIs5JrnXRwE68o9YsJPRJTq74/BlWaBAcLD81Fr/Ojh2JrAItLXIbBwRPR29rMWFxUEv1ITC
 UPGGNnY2Vc6RopOutqgvUQTtB7Z77YyqvQoGgKNp49MLkoGUdkGQ4fJ/iFPb0UEOEdWXAo7ghuB
 teTloGNUlRatVzKhZE2bI6+pHstO3J2E+3Vq5J9a8QLongsmCgArhJZ19kJ/TCZ5im8FKFkaq/V xbPeqDJlva+tgWw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Over last year, several patches for drivers/mux/ were not picked up,
even after multiple pings or resends, so mark the mux subsystem as odd
fixes to clarify actual status of lack of maintainers with dedicated
time and indicate that someone could help here.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

I will collect remaining easy mux patches and send them to Greg.

See:
https://lore.kernel.org/lkml/f82e013abe4c71f1c7d06819f96472f298acdcf3.1713089554.git.christophe.jaillet@wanadoo.fr/
https://lore.kernel.org/lkml/20250409122314.2848028-4-arnd@kernel.org/
https://lore.kernel.org/lkml/20250501173758.135465-2-krzysztof.kozlowski@linaro.org/
https://lore.kernel.org/lkml/20250407-mux-mmio-resume-support-v3-1-cb88abc04db7@bootlin.com/
https://lore.kernel.org/lkml/20250318162739.100593-2-thorsten.blum@linux.dev/
https://lore.kernel.org/lkml/20250316135857.1584-2-thorsten.blum@linux.dev/
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index b2c3be5f6131..107ac11bafde 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16685,7 +16685,7 @@ F:	include/uapi/linux/mmc/
 
 MULTIPLEXER SUBSYSTEM
 M:	Peter Rosin <peda@axentia.se>
-S:	Maintained
+S:	Odd Fixes
 F:	Documentation/ABI/testing/sysfs-class-mux*
 F:	Documentation/devicetree/bindings/mux/
 F:	drivers/mux/
-- 
2.45.2

