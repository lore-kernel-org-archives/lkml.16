Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFA522A4D6
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 11:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746789703; cv=none; b=o6E223kcS22b63+oNGnH1HMjUHfHYZ9V37BQCK9DzIERHxYItzzJH9i4+tpPlEJVZyRiU0hZcVYkNlFmBN1cW5XG20Ertnc7SgyaBMQm3dzW3FFyQBtqEV035/O7vfmUHu4rtrLMm9LOiP3PXgYPt6ybp2j6HuI8bdHK9SSNERI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746789703; c=relaxed/simple;
	bh=0BuO/miu0FNdGeIwKI4Igcv8UGoaQFfIol3GnMmPqqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ekPPzkf76Jz0VM1hYakjyeKWm1MjJG8BJ4THg8D0sm9VfDmobte4cvOoIf7p1XekMj2nC9fxSULSAHSEmcJYq0mkM97wkGCpNp4Q8tlxq+j69vqc75yY0XSDl5sETsyfXfFZhCm2Wj+eo+EPU7b9BqHjn3aGj3x0Z74C9c9r9rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pIDfMFGg; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pIDfMFGg"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43d4ff56136so1880575e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 04:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746789700; x=1747394500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0zvaxLdQ0qhtC7Jg6xocbXcJy/vEo+u7LRWPS1JM5/o=;
        b=pIDfMFGgO0Hrlt8MMl0kZ9RISa2qcjnwC3tO8RCk6eDiBXdZUcw+0Ar+QyClfzjjZy
         q7rcmL7awLcC34ICwfPrZeq/wiwJaHqDPX6H/ajLjV466tOFN9TNhpAiOdW3yCwMdSr2
         rOh36bgF1jWPEXBP+kcLn+mrYhM/1fGrb9R+UQBfyssoShzTwB9LV2LMet077oelBZnP
         M7ievaT+a/NedGigYAbg8JbMIz2iNJvbcTjP7MJTQ6dWQ4zHRxOecc6PvWo1/s30197N
         rIQY7W3sO/zbL6+WbkWpVsr3TBrPlskz6WJWPSNjiMYQ/bum8QWKus1rFmZlGJcagngz
         Av8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746789700; x=1747394500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0zvaxLdQ0qhtC7Jg6xocbXcJy/vEo+u7LRWPS1JM5/o=;
        b=JLRhJ6IO084NhLCjjho7MpzSGGt385yxu6PF3uJjqv79kXEuhIMMK6hShe3xaZpYD5
         hrfNmHTn9lXbDDHzKpftk5HYqpmlaQ+3CfWNArNWzPceBDLfA/aqkdPs3myo0YQMQ0aB
         t3LSj66eA2ey1bR8EREMMuINnCR8Rb3RBGvp1l97QlrXeD+TKYwKrqMA6MHbi3lrSBcN
         X4fLET3f5WctmrTwICXapVum3D71IUDLw86IZDsEOzbuYxfi5824zhgswlfnkqA0rLWA
         T2XTR+JYo8utvgZyx2GUB8U0b0SBsLTmYoqfsVy8rJU7GuLp/n70SrY5/D+/9oGteZel
         jCQw==
X-Forwarded-Encrypted: i=1; AJvYcCVIspUFd5uqS/KQ8LRvRiAkDLzBsFvAMNvJ3SnQ9bxcp8gWUtujNXDf7EARGD5kaIqQN3I222xg3zKbOQs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmOKyfPY/YJb3pfeBjGbc8o780+VPqNPRWp2LWr3Txb75vyEKq
	z7mV1IovnGPrJwfkutaFtMPWvA9UO+7RjQlvCTPoqpJ5nVKS74jfb9RRpjWcCig=
X-Gm-Gg: ASbGnctGqkXS9KwRH2Bfz6pn91g0Hk/3rY3Bz+RfTx7GjHwY6pb0ifWlGSvCiSKaIJ0
	9nNT2VcxAWnrHMf0koljTu/o6eGQWZhc8RYb6A3ybyI9lkkoA7vK8HEe5oLhJ6W6CSnKCCIqjQh
	CUyiWay7urc7I76vvi5mMkcY3eg0WoBfhuWTeOTdnsfGv8YHkZ7vDg+I6zAsOwd/mqQEaphKJAD
	lZSZKilnkHTvCawuWm/7hTT9c3GqGC/RUYelTNQpeCw8jNGtfeDHKzyF3UKJdp/4HFt5DobXO6b
	YHkiqtpvcVC247lwlwIwbqpaLTcvjqPlDcdwjhovsqTqoNAOZg==
X-Google-Smtp-Source: AGHT+IEuDuBg93OxIQQoW+nylcXuRFPBeBathaUSkxBNEQ4jD3mR42Jzx1DI1Z0ON8bFZOIloNRtJQ==
X-Received: by 2002:a05:600c:1382:b0:439:a30f:2e49 with SMTP id 5b1f17b1804b1-442d6dd5413mr8885805e9.5.1746789699803;
        Fri, 09 May 2025 04:21:39 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd328455sm69946945e9.2.2025.05.09.04.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:21:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Vladimir Oltean <olteanv@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Frank Li <Frank.Li@nxp.com>,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] spi: dt-bindings: nuvoton,wpcm450-fiu: Drop unrelated nodes from DTS example
Date: Fri,  9 May 2025 13:21:32 +0200
Message-ID: <20250509112130.123462-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250509112130.123462-3-krzysztof.kozlowski@linaro.org>
References: <20250509112130.123462-3-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=869; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=0BuO/miu0FNdGeIwKI4Igcv8UGoaQFfIol3GnMmPqqQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoHeU9Raekbf2tG03zWC6ko3skitxMRci9RwRJu
 8slhDM2iNaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaB3lPQAKCRDBN2bmhouD
 14v3D/9iuwKe4zn277rUfVsmgt/II8fADdf1u/LFF8b+e1VT3f1aiSpH7QsV6sp6QMDJZT/Sjan
 EA5EpUVZRySb6x1OoQPqh9geb8YTnuzu+1mWMxtmBwBzSqNa/ip2dEhYZIkq+zUlobn5dkMP6/N
 z0P5+VQc/vFc6uFcTHXE4h3Ngj/l7NEMSlEJzaV5zdlAJh6LqF1L7x04TAc9S7KqAEwToyaJENd
 LX0+FVaiwpPNKbElXgizKP16egYtBw+RTrZjsUxgOfIccAbaCPDSWQbw5Dd2tsfLhlD56fuQ//U
 bkTV252AgvsA0CBs5BFD1CN7zHWsKzQF6SYkq+LlHWC8dTO8IViLSn09zJnknFgQCsUiYh8y5jE
 xav332eHokzZ/JmqqM1BjdCrVPnlsxrvgaHLhJLu8h3bW4bucGZCs3LNUC+U2deDOeYbrAXE6D6
 5jqPWdMYxx5FLKVIJkMSJyDtTPV0YiXrqDmFsPJKYUNJAnIZFKGpN0Wpk6VYWZ9rDtepU0781rB
 oO3zGPlWD4Snadvawz9PIqeEAueNplqWUjDezYjF3SvujhiPpmZpXkQ+Q1jV4stqNtnVPNXh3HW
 nSGGYwfk/aaVVWfKANaOQqz0C69xQIXbDORTrC1Ts5aDxeQa4LgzFEkrxuJ4aZyTW7vw1Crk4AP WWtlsOiCaLqiCxg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Binding example should not contain other nodes, including other
providers like syscon, because this is redundant and only adds
unnecessary bloat.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/spi/nuvoton,wpcm450-fiu.yaml         | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/nuvoton,wpcm450-fiu.yaml b/Documentation/devicetree/bindings/spi/nuvoton,wpcm450-fiu.yaml
index 4e0d391e1d69..c97bf48b56b4 100644
--- a/Documentation/devicetree/bindings/spi/nuvoton,wpcm450-fiu.yaml
+++ b/Documentation/devicetree/bindings/spi/nuvoton,wpcm450-fiu.yaml
@@ -59,8 +59,3 @@ examples:
         reg = <0>;
       };
     };
-
-    shm: syscon@c8001000 {
-      compatible = "nuvoton,wpcm450-shm", "syscon";
-      reg = <0xc8001000 0x1000>;
-    };
-- 
2.45.2

