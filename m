Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EAEE20E6
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 00:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751068957; cv=none; b=I6O1AuOJmzQKQdbKasXp2Kd+EM12LY0kMObdgLGJUAIkAXdEW+tg7Fj89Tkw0xO/mhbQenKigvRVQFsDRvLKBDZZ23Clqa/duh2ybBjJ+dGa5Eu95krLtfT5QFQ0ewcj47vD7pQhi9kv/jTSEKRkAY1CBw/WSP6houFtjfHs3cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751068957; c=relaxed/simple;
	bh=Sj/eX0Tuqh+sN5LbYLN3mf5yADRyM5dTtMQscDcucHA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UnZOirZUrFiZmeHbR9gsCN2mUpcsiHahrSjSijmG8djnhZcryNqAH0e/m8eUCUo+adLClBxJ9loq6Bwo4RjMg8ZFWb7UptXCON9OrKAmGupxcHQqRm5igT9TxXz31h2EyKgrifaTTnkQLPHPdcoGExQiNfh2eQiSKM1PmvQhOPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com; spf=pass smtp.mailfrom=mandelbit.com; dkim=pass (2048-bit key) header.d=mandelbit.com header.i=@mandelbit.com header.b=WDOnKSBJ; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mandelbit.com header.i=@mandelbit.com header.b="WDOnKSBJ"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a531fcaa05so145911f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 17:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mandelbit.com; s=google; t=1751068954; x=1751673754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VzxBghiapRo0aX1nK0c+nhbUFh9iAun9Qlu08MsGo1c=;
        b=WDOnKSBJVDO82fOuS2sJ8YhvrBOu2+d3bVZLUU6UEMLDanGenh+04GUoODdJn7mmZR
         DKg/mILlftqjaK35FEXfC/aTLFYILVYmIiOo2Beaz5X5yf+8qa541S7vXikIGbN8uITL
         n4oxal3ZkXxHdpmfCmXMpY4t2P6dT8XsQwKWBnkTBirmnToAtDTjZJeKVl1WIH58+m7D
         /PRPdaH57M8VlJhZZslVJvQ5Eycp72L1vUE1lOhvzw85mNt7Ztnp8AuZ1zug0uzLYriE
         8S5Ok9uxch9/pJmijnU0O6Up4okHEVP9QRcB2LUbxtjzXPisWFpxlh1sRz6rAQOefqCN
         jHlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751068954; x=1751673754;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VzxBghiapRo0aX1nK0c+nhbUFh9iAun9Qlu08MsGo1c=;
        b=TTE/zG95q9wJ7c+kOUtsRq0yxCnHIGmpuMljyDYLgV6eqsBKHfD76eBMP16bVPqsGO
         qBp7PvBEq2rxzjqWNo8t/KMGnxXh0ruyQ8CLi6hV540uFJmRwhdG7mTA7z67XWXazD0y
         4Pr8sAZyfShJCJH8Ce/y/kyV8wborBoTXqYs+hZF3SFVrzE1kDhg92rlztPrdcaG1ayw
         x0gPbBtjuLWNiH+yisAJct0anIKuYGbdbweO2epUR+hx7KUKScUnb4Ept7tkufI+4AbO
         CnaeLtycdExzM2yvzhsrTlcRP2UHWy84teki2bmjbm9dq/04gy3gA9knW9MV5589TLjB
         151w==
X-Forwarded-Encrypted: i=1; AJvYcCVw7ZmkXh1JNlcpDJwJ1GJpFL7Zjgbi0xIsX15E2tZW1ZkuRrshxg2Jqd8thM7C5WfsUgfLgWng+FcxxAQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFrhEZEXf14Aw49OP6R1UHMJRazvSt4v1K9oLzAv9CVrxeW3dt
	fLI9UwOV4Ui03LkFZjmGqJgLWNrkP6T4V5//IxyKQqvKAzBxYGPfa1kIMKLYJVmRu9Y=
X-Gm-Gg: ASbGncsEMkOLQRnhgK9hEDQAUs9WL9mNod82YCwEUsEFrnsCl38sRegH1MSN0TpGOY8
	0kcSzV+R+INgXCRLKzvDyJgEbpv9YWlD/ayuHdHdX3iHMbnHXl4+0sVp6yCbitgWLVLk5qAtTlr
	MEw3faFvF10AaAyE92SpTA2EWoIq3waS/pMLNWVdRZASQywPEaKFexwtxnnNaLfIZVvfM0e9kCX
	irrCb8CZ3oVh2OfEzyQ8/HrU/DN2L6EV1Ex5ISd+Iht5SU95rr0HK3e7oL7EL1W85oGYmfhKFx4
	HXkMa0a3N5iS6IWzVEsLnke58wK4Qdchl0tH0Mjo/C4MhLmta7yLNZBhU7fsKNAw+tG8HvkHp7f
	ocRgvPUyBbhz3
X-Google-Smtp-Source: AGHT+IECU//FZnUMFlsTYIRoyghzMGUC/zod9WnPCi6VKfNKXOA/f3HCNrR2SW3KH5umXabnco5DLg==
X-Received: by 2002:a05:6000:248a:b0:3a4:c9d4:2fb2 with SMTP id ffacd0b85a97d-3a8ff149554mr4015024f8f.46.1751068953621;
        Fri, 27 Jun 2025 17:02:33 -0700 (PDT)
Received: from inifinity.homelan.mandelbit.com ([2001:67c:2fbc:1:9bca:2bf0:5e15:c50e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453835798acsm91685845e9.10.2025.06.27.17.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 17:02:33 -0700 (PDT)
From: Antonio Quartulli <antonio@mandelbit.com>
To: linux-spi@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <clement.legoffic@foss.st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Antonio Quartulli <antonio@mandelbit.com>
Subject: [PATCH] spi: stm32: fix NULL check on pointer-to-pointer variable
Date: Sat, 28 Jun 2025 02:02:27 +0200
Message-ID: <20250628000227.22895-1-antonio@mandelbit.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In stm32_spi_prepare_rx_dma_mdma_chaining() both rx_dma_desc
and rx_mdma_desc are passed as pointer-to-pointer arguments.

The goal is to pass back to the caller the value returned
by dmaengine_prep_slave_sg(), when it is not NULL.

However, the NULL check on the result is erroneously
performed without dereferencing the pointer.

Add the proper dereference operator to both checks.

Fixes: d17dd2f1d8a1 ("spi: stm32: use STM32 DMA with STM32 MDMA to enhance DDR use")
Addresses-Coverity-ID: 1644715 ("Null pointer dereferences (REVERSE_INULL)")
Signed-off-by: Antonio Quartulli <antonio@mandelbit.com>
---
 drivers/spi/spi-stm32.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index 3d20f09f1ae7..e9fa17e52fb0 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -1529,7 +1529,7 @@ static int stm32_spi_prepare_rx_dma_mdma_chaining(struct stm32_spi *spi,
 					       DMA_PREP_INTERRUPT);
 	sg_free_table(&dma_sgt);
 
-	if (!rx_dma_desc)
+	if (!*rx_dma_desc)
 		return -EINVAL;
 
 	/* Prepare MDMA slave_sg transfer MEM_TO_MEM (SRAM>DDR) */
@@ -1563,8 +1563,8 @@ static int stm32_spi_prepare_rx_dma_mdma_chaining(struct stm32_spi *spi,
 						DMA_PREP_INTERRUPT);
 	sg_free_table(&mdma_sgt);
 
-	if (!rx_mdma_desc) {
-		rx_dma_desc = NULL;
+	if (!*rx_mdma_desc) {
+		*rx_dma_desc = NULL;
 		return -EINVAL;
 	}
 
-- 
2.49.0

