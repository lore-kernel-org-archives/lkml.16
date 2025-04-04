Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63BC1DF971
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 12:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743769282; cv=none; b=PMiG9X164cL0P7vkP+xb4P0g+iotqCt3yDxsq7yPq8dQhPR8YTnsYHyn0uKs0tG5JPZQK35OvwRkV4GFV0YjXACbI0HIaPPVYpcKhUarMs+pBTAwWVnzQrgXUWxZ4Iz0Ktoy5h9Oi00ZJAvgtBpyzB78qa7ytnrXskXdYHOR2Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743769282; c=relaxed/simple;
	bh=lkeUwkkv2l20qMI8/MMYwTQQP/7YT3AVpqsQN2tYwNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J7P/fiuiEku/trg10dbTVAnnG9wHrNljNy6Kwg/PTmwVaS65/cdUxOefsBgP3PTFujK1Tme0Cu/gTqzyf0H2MkwjF7UVOfi/1lFIWTIIyvea4NKH8EsiRBY7FnvdPXaCeCwcbs5LueAY6044/pRXwRkHyCpcjw3ZEVL/F7n0WlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s1bbu8Gr; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s1bbu8Gr"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43ce4e47a85so2040035e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 05:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743769279; x=1744374079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Tb6uHTtWsK1kFyxyPD5qpzEiabvnAv7+kW+ub5TJjs=;
        b=s1bbu8GrTqMbP6pXVoITX0SE5usnyyZZqM2eFufdpnq07uJ4hYCTgR+90Cugr5Cx9R
         mzGf6VfNvka39JV6KQYzGdJyvrulq3ZGPrOXS9EGkPuiA7I8v8klnMBbYI2GkjUcNyqI
         x3wD+08/v0ccKjxyl+MSHN45SA64NJoBy8bYQaMq++pXVl3dK+4ubjeyy8BfqCr7AoID
         zQmzIsbJmE83RbYQxEN8pWXbUpDWfcmN5KAiMxL+ZOyL5xyczhCJtzaM32ym9V/dpMt1
         OK+Pom4Huq6eQ7jIVJNO/3LqbRpRXqH29lb5ay9/kNkpU89ftS101ciGCFF2IP8UKvdI
         BpAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743769279; x=1744374079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Tb6uHTtWsK1kFyxyPD5qpzEiabvnAv7+kW+ub5TJjs=;
        b=KU4URYy6jzElcaITaEKqVx28h5B5fzavu8MF71bbNkGLAJIK3YbOelSg5Aq3GQ/9Kq
         CgzhoLSq8PQJW60vAjNxshOqDxSDVA86wJmNymhfSe0gY8bj0AekzHUv/WFZ516p8w3k
         ngaRLMjl1rMt2lQtZ2ZBNh5p53GXsJZBxqVPplF89XT5OIFWT0kCkHrw7wEVuNd99K66
         GImIiuwfKCwGVC8m59fxN+5GLko7ct5LJeLKILcOt2ZxHCED6ulV5T4PKqP61UMU8tF9
         JxHSD5ZayQSzwcqKYt38CMW9sDoGVQ2HqsblqN/Djfda9CSBiI8oStjDKTuv2lQXfn0R
         7hvw==
X-Forwarded-Encrypted: i=1; AJvYcCXskVuwC3D0m1hnzQuBjEHHoVo8fS0/fcTJS3feegvJ4Mgs9AhVlViGV1iZ1s/NRNZ58Fmrhl80YBfzA6U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqLEvuKcA6McliduD8EXeM3fiPVvoMAYA2RDS5hD/NJD1UTt2R
	Sa2DhFNps+A2JehSJ4PUYGogFlqtO644WkIp+8doSGxijdI3hlfrwVokgrY0Mw8=
X-Gm-Gg: ASbGncudU7GsW3tjCyJYCw3GrVelsKSnzek6FZcrQpz4o1wjY6wSTehcL9Ern6uxuwB
	W8GQmsWkdjxwpARKgRZxW/WzRuWAK9h9RPI9qUehEyrpGZB7b/eiwtWYedimEc1yIpKfLtwjuHt
	jUvv8sF4Nqsx0BbhAnT/3+y55NhRbhl8gW48T5Myez8pdW+OtWiMAlP4XYosbRRkiE/7G7GTa+7
	4xRTr0OGw3c6YTFfg2dNlUZMBSiAYCDKgYGZii4BieoZEQ2D5rr6tZTA97kYSF04CcNyijyZ5lJ
	J6uVDpB3HUB2FfnSHPUYsoerRzQByqkEh2N70uBBEqh45LANz0kfDg==
X-Google-Smtp-Source: AGHT+IGOy3L1QjCpnMqGZsFw79UEPXtqI6aUxy7enKUtc7JINUL+ImbH8sjMP1fP+pTjtUkMn+AvpA==
X-Received: by 2002:a5d:6da2:0:b0:39c:1258:b36 with SMTP id ffacd0b85a97d-39cba93d1c8mr1014525f8f.14.1743769278978;
        Fri, 04 Apr 2025 05:21:18 -0700 (PDT)
Received: from shite.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a6c89sm4183439f8f.28.2025.04.04.05.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 05:21:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Vinod Koul <vkoul@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] dmaengine: ti: Do not enable by default during compile testing
Date: Fri,  4 Apr 2025 14:21:14 +0200
Message-ID: <20250404122114.359087-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250404122114.359087-1-krzysztof.kozlowski@linaro.org>
References: <20250404122114.359087-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enabling the compile test should not cause automatic enabling of all
drivers.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/dma/ti/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/ti/Kconfig b/drivers/dma/ti/Kconfig
index 2adc2cca10e9..dbf168146d35 100644
--- a/drivers/dma/ti/Kconfig
+++ b/drivers/dma/ti/Kconfig
@@ -17,7 +17,7 @@ config TI_EDMA
 	select DMA_ENGINE
 	select DMA_VIRTUAL_CHANNELS
 	select TI_DMA_CROSSBAR if (ARCH_OMAP || COMPILE_TEST)
-	default y
+	default ARCH_DAVINCI || ARCH_OMAP || ARCH_KEYSTONE
 	help
 	  Enable support for the TI EDMA (Enhanced DMA) controller. This DMA
 	  engine is found on TI DaVinci, AM33xx, AM43xx, DRA7xx and Keystone 2
@@ -29,7 +29,7 @@ config DMA_OMAP
 	select DMA_ENGINE
 	select DMA_VIRTUAL_CHANNELS
 	select TI_DMA_CROSSBAR if (SOC_DRA7XX || COMPILE_TEST)
-	default y
+	default ARCH_OMAP
 	help
 	  Enable support for the TI sDMA (System DMA or DMA4) controller. This
 	  DMA engine is found on OMAP and DRA7xx parts.
-- 
2.45.2

