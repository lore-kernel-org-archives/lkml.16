Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB9E13D62B
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 20:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743970225; cv=none; b=uOxquEG1ygnV7ay8vDxhJxcYppaqsC5HI1xmHxCKdMPTk3xDWrmoDE6CHhnSC1WMPEUJeKHW9RxfTYA30b7HHioQk6L2/Ni7wdcR8CsFMXnOkcPsvR3cwDUav4QukTkc8Lyp+gbIA+uzI60x7GyZOrMxeen/SuFJnG9oQ7JyboA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743970225; c=relaxed/simple;
	bh=GV1Dls+xp1Io3K00PjLejG1tcKpA8NBFUjY9f+e2188=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u3DAG8+n20EeAa2b+8H8IbdO3zHAsFif4UJfMLOWNRpKZjxyC87ZUsAIhB70oWhjkxwa9cvrYx6bxvJwFXFZdBZRWmVhUVZJboqfwA7ov3YkKILLJiqriHEYu7wdR9LPXwj+zqVoNACUtDR89HVbAc/kd1iXwzKFORuxq7v/wck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OGL4CRkl; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OGL4CRkl"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39c2688e2bbso470595f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 13:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743970222; x=1744575022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d0bCgywlp6kaDxRJG12fl3NMTv2SIFaAtl9wSse2RnE=;
        b=OGL4CRklPjxVIKUoVVQ48pxX+wai46dk4JJ7Z69kTZecrle768XHB02UXPlaUkKt89
         igpyEPPpyY387H6SvIWuC63ez8xKnwmdfNKgUUoFMUYzrsM5f0uYNQvEYyvOaJtWczzs
         tHFaODPKZjTGh0doynNtEyh0CICqQHP4/AtyltkCGNDF1K4vioni+9CXelomriAJoNIf
         56w9YHOGm8Hy7ZyNUGT4x1f2I5NHLve8DTlUCFtxQ+zxKV5qUf+2rM2D16KGqqn0BRD1
         ud9Izh4iGepibj6dWhPafvZ1TtfUOB5YeRZhE/n8PTVAdOq6rrcYVlTX2fmMkALqVncf
         eYMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743970222; x=1744575022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d0bCgywlp6kaDxRJG12fl3NMTv2SIFaAtl9wSse2RnE=;
        b=o/qXtUpuvPFlSB2HuuaHgaPiC5UsV+zoJxJvosqmK0jDoIsVPJUlc1Wtechjsl9arj
         RRSDcWbRDZXAA7knPBPC6T+GNfM7KbGYt8sLBsWPOqZ8wHZ1XzZ3rZ+RLdRF9lVeGdzC
         hmEM3L6CkdGdnRHVm5ypH4TZzEWA5V2fadAWwfn0LQaLf7LZxU5EBJ0vZB6Cf4It0ncY
         bVQLLV0sjBJDycsHNMvwn7I4t620qE6Ipqe0gHX1oVk0DMiLwRbF3g11H7BkIT/xVKwD
         kxDvBBM+i5qaKPW4eOiXimYv35+pm1pBHxfkqww2QOgMZkDgSq6diLt8X7L2H9dlBPBP
         3B+w==
X-Forwarded-Encrypted: i=1; AJvYcCWZW849ZCvcRWIGpSuv7NQX+fjDC71th6YFJjJdhSbVBHb+rmxas4ts0zYsU2jn7/ns6KSrojfHMlwed4w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/nKGu6iOOhZdcDrt+GmHUFKqeL8l7BMhovn6YLV9qwdBbmsNQ
	beS+hT32g90W/ZLXrqtEyeSsHWodARIZxCv4GfWQp7gbbMDySbD2G8ABCBlbcFo=
X-Gm-Gg: ASbGncvG+TlUXyzLzSgIC+kTKRKcFK/RrDpNNnTsHJip+Ejb6NNMyG2jLCAQCTu+EXM
	+vqa5OAVhebnRB8mTlDzA2AjvvZQFM6RCPEaTDTE+DMHROV/sQJRCQtzy+pGQCINSqOWiqmKGJS
	v0nEt7DHbC+VscMV/IYo2P7yw4aYCYhxkmJ3LsDal0jRVLnXPr8+Fana0CHE0zSJNUolaG/Gv98
	qsK6uNoKU7wYfE24L0DkVZ0ZjyeJeQazX0HmfF7J75GM4X/vvANRYYA9GPLG4LhHTmCOvRk7hif
	yWbtQC3/OsiXq1AJZwnrp86YfnXR/EAgBGIBR55Zd2HeZwgeZ4zZ3A==
X-Google-Smtp-Source: AGHT+IHX4ogO0j9l/DVFfDe0o53qqxRjbgFXh9pHpQJLcNqGVqDaNvFPF3GPRIgR8kG8COOn0609yQ==
X-Received: by 2002:a05:6000:4022:b0:391:319c:193f with SMTP id ffacd0b85a97d-39cba93cfc3mr3063727f8f.13.1743970222445;
        Sun, 06 Apr 2025 13:10:22 -0700 (PDT)
Received: from shite.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301acec9sm10080656f8f.40.2025.04.06.13.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 13:10:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] Bluetooth: btmtksdio: Fix wakeup source leaks on device unbind
Date: Sun,  6 Apr 2025 22:10:17 +0200
Message-ID: <20250406201017.47727-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250406201017.47727-1-krzysztof.kozlowski@linaro.org>
References: <20250406201017.47727-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Device can be unbound or probe can fail, so driver must also release
memory for the wakeup source.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/bluetooth/btmtksdio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index edd5eead1e93..566c136e83bf 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -1410,7 +1410,7 @@ static int btmtksdio_probe(struct sdio_func *func,
 	 */
 	pm_runtime_put_noidle(bdev->dev);
 
-	err = device_init_wakeup(bdev->dev, true);
+	err = devm_device_init_wakeup(bdev->dev);
 	if (err)
 		bt_dev_err(hdev, "failed to initialize device wakeup");
 
-- 
2.45.2

