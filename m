Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6310929AAEF
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 13:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749561377; cv=none; b=b9J2fzrdjTa4kd0v08zgyuknqLnGOqqQpXK9z0tcJtAZEJhCS/DpkM+FjDglhqkaSYRsrAd+hwshaG/CFQpaTnI9SJtNkLIMNYzmBiJ8vH5QOXrpaZTiTC6v8N/pN6tg3zR+9baVKqPvv4KG9BZ+xtQ+tMyRbjb1hPMMtufCxYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749561377; c=relaxed/simple;
	bh=pxIPSpWyE9E27lvmffeV8b8jWChCUi/tb5Gmgol8JtQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dYXsYWJOouzoWqC8mx6plw6YCOei7w41wd/KshA4oAH5/6Ft7WCHOnV5fNvHHbdGXkZ0WjfV5oQtd7L/U+DZg59d6X4I6HX1I1Y7q8zL/j/UzuoIfeDgYCvTSve9joO8cRydlnsJEik6/L4lJycLxKRUPgyNmPVuuSjJJbChp/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oRcc2nn9; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oRcc2nn9"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-adb2e9fd208so1007522066b.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 06:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749561373; x=1750166173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8BDcE4876d7+lQswV9isKuNGeIH7ZLPwvjK7CukY8ng=;
        b=oRcc2nn9IrZNk4wKN72VrCnVXFJEl+aTr32z2h1YGFKd5NWZdZKweFVsTHCrYA+qvD
         TiNgaq6bK0o2QUwWA1LUR/7quue4mT32ezeUVNpInksVYp4sj2AmNtT7+zWYQLKU4p8I
         7/jN5xFQVqECIB/mq8hucPs3YEH8XEtqJLxpkdfOZNLmPep/vyuRmA6i05L591Cq5vY3
         78ypjnddC/v2KlD+h0eIEvz5fowoj41kkTHCUK0o4e9ZjWXJ4EOCiMF1kngxteAxABIo
         tcv4q+Zt8xWPZYlr0RVNoInkJFDK6PjPj4H7DsKypJHYe5jon5cHdeM/nVP1lDt2vW8m
         JXAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749561373; x=1750166173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8BDcE4876d7+lQswV9isKuNGeIH7ZLPwvjK7CukY8ng=;
        b=J5EcyjlLfHsSaFbfPvQHapYnDjczM4NDNGwYurtNz3ebDyzTYJj9ym4fQxEAJ67Xt0
         AYA0SF6qPbTwjAp0fXGfZQdFGU4gE9MS+OLf1JlN4ZVTo19utFgY2NAMvBmEHfl9lxF6
         hBcnnQVYiDMiey3vpIzXFKetAmm8m41B37bVfM0KbGN07yCH0mS12wuM7q8VW/Etfw9A
         9z5PJYqZdcm3Bvf4cpXtwd6yuP1QDy02kbI3kT/TthBJDXxb3BNBBVc7lJzrS86/y8eZ
         y0mBX4dN1JQDh6xFeaOq/WdI5/uNHgU0WignFTWfI4doQvAK1zkX1cXZxzcClBZk3czC
         D6gA==
X-Gm-Message-State: AOJu0YzKaCs+FfRE0OyvS1QawZJ5qWddhNJvctNn+UkU42rKifazyN8v
	mS6W7n368eUqs4RT+2bjbYXtG1u7pm2hmvMJG2a46TCnw3M/v2H3AmFbGzRxv7FLeelobKAgfVY
	UW8PM5SQ=
X-Gm-Gg: ASbGncu3u1aUsJoSM6GcDehGgdKeG2FVb4aSUprLaso7PlbZB68DL1nivKjsf9jzqxC
	Ug7bz+KZTQ1PwW7vQp8Rkpy1SuQVDkV2sAQVNixaCVnAdXca3akzYTCUgvHT9eEb9fzd+OIOQIQ
	VkkO7ya57IbqHhq/HnaAoTalbkCirT4a2E2jc2sM7/viS82JupDFCBp0FHCoaFwkyxQz6nz/Z88
	WOhPg5gbrsiTs6sobvyKJQEWJmd1qB7hNs9eQia8q5YjiYCpyV52s+jPfCS7hUcvltQQrsk3jWk
	sD6Lt0uQ6ThBUvyhgsib+0k2eJUs2Ajfg+gTyqqdrTOX1mSS32Nml8JHGR6j27CWs17sHFvckB8
	REdeCVzTrvC7TZ4vayjBcOu2GatxxLIdCOcl0KWw=
X-Google-Smtp-Source: AGHT+IFOBF4P1tAbssgL5dehUIWLuQRa8S7VHpp+Y5ehx9RZ7YktqSDlhzjcJArhhbW8+ISbCVgNJQ==
X-Received: by 2002:a17:907:9720:b0:adb:413e:2a2f with SMTP id a640c23a62f3a-ade1aa0fbdbmr1346195566b.9.1749561373268;
        Tue, 10 Jun 2025 06:16:13 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade3206a1efsm643651666b.67.2025.06.10.06.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:16:12 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel@lists.infradead.org
Cc: Olivier Masse <olivier.masse@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sumit Garg <sumit.garg@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Daniel Stone <daniel@fooishbar.org>,
	Rouven Czerwinski <rouven.czerwinski@linaro.org>,
	robin.murphy@arm.com,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v10 2/9] dma-buf: dma-heap: export declared functions
Date: Tue, 10 Jun 2025 15:13:46 +0200
Message-ID: <20250610131600.2972232-3-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610131600.2972232-1-jens.wiklander@linaro.org>
References: <20250610131600.2972232-1-jens.wiklander@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Export the dma-buf heap functions to allow them to be used by the OP-TEE
driver. The OP-TEE driver wants to register and manage specific secure
DMA heaps with it.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/dma-buf/dma-heap.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index 3cbe87d4a464..cdddf0e24dce 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -202,6 +202,7 @@ void *dma_heap_get_drvdata(struct dma_heap *heap)
 {
 	return heap->priv;
 }
+EXPORT_SYMBOL(dma_heap_get_drvdata);
 
 /**
  * dma_heap_get_name - get heap name
@@ -214,6 +215,7 @@ const char *dma_heap_get_name(struct dma_heap *heap)
 {
 	return heap->name;
 }
+EXPORT_SYMBOL(dma_heap_get_name);
 
 /**
  * dma_heap_add - adds a heap to dmabuf heaps
@@ -303,6 +305,7 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
 	kfree(heap);
 	return err_ret;
 }
+EXPORT_SYMBOL(dma_heap_add);
 
 static char *dma_heap_devnode(const struct device *dev, umode_t *mode)
 {
-- 
2.43.0

