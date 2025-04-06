Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE7238FA3
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 20:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743970224; cv=none; b=dvPTqC6jBcnupY1iJHTh22m80ZGWBNexhRM1Uz3tB3tc54iTjbj2IVHLjyvxXawFETgoXJejEejmeFrIWSMtgvcj1CKhPvFQTx/E94lMioeiV/NyWI2e7WUGb74hH3rgtaB74Rf++dPRdr3YKzMd/c8B1T0vr0cT9LTdP95qO+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743970224; c=relaxed/simple;
	bh=jH2cvGtBsvpZMSJ6OaDrQFL28kzgcLYK9NbsocgnfaM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cLuyAFBaPCyT8JNjjbPJ94BAFhZ8q5TKDDQtFzSK+TGRcOb0H7voQFrxeK4yxUsx6HrTDm2sc5C7ETq1zsg86euts9+FmPIYI2lyrr5awe6wddibj7ag/t2M4tI5cmeKc9jMxmXasa0+u0ecs5mdYezkYvTM4wfpWxiIeyrzIJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SNBLhkj3; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SNBLhkj3"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-391295490c8so469371f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 13:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743970221; x=1744575021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9DTqIB1KXItguWXeNYQcNwaI7W5L7sSNfK7n5CdOhYU=;
        b=SNBLhkj3LJ+9ok8ivRsJIjHka/YPKO8qeO8C5QmhQzsgLT6mMfwaUkDdrrluSBr4Mu
         qkQK/Bs9PLQI/qX7SUkCvd3IOjLQWzVe3JeHkerZmKR4HR43wOfp4XGLhzsfwwRxcTLu
         0RwdPQAlOwK9do8tE0UeUXaeNTT9NX+mmkObZNnyg4WqF0J76lEh0LY+OtL3YL2J1Tuo
         n9oA+hTni5Tl7HdE4usLu1fgYnEYnRWFy8tcI5WUezdOfVlXJVi/UaK2TUNOykqL3bfI
         +Mh7EIYWXAYEx3YW8UZSONXxvS2gUa6xpA0t9tEz5MSy3V1MDDUYUHJMHy35oodFc+c7
         7PNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743970221; x=1744575021;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9DTqIB1KXItguWXeNYQcNwaI7W5L7sSNfK7n5CdOhYU=;
        b=qF+SYCjZmApmN3H9QXj6ZuR9NGKM5/m/coTSCUEVf6hVTvnYXGpLWXRdAwSWiT2mH0
         tTNbp99LpEYv/rbiRrEb9wpkqsR9fGw/DcjXK+hTM8gyuQHtxil5Lu8mA+3MPYCiqSIG
         Kf5bENtDnewXkR0dd3Nzb8nbSsSHijUmB1j39yPbxzKKv0qwTnai01p7EcZC1pXiPUpe
         MVkSLiDI/wNvAWXGy/lm8TFzzHKroC68hMI4/2FfrL7+KeCs7mT15FUmTm3DDMussRxl
         opFA+kNDDYDjRjP6eZxTbGZcGew4zeg/pKj1k7ceHc6i5Mmr/c0lQ+2jstaB9yqvSo4r
         4FLg==
X-Forwarded-Encrypted: i=1; AJvYcCXQqsncb+fvFY+lh+7CGePD8u2FCUNXjgoDEzwOeOXsFVa3INTrvqZDzSynyIs7jpy9tVt/5mhuRvDeR+g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9YWYZ6+vQCHPWCdS+fMMVApwvzaLAXQqQ/SYFsDsQfXkHaras
	BbahkDNMLWPgG22tz3OR2uaLl6gRVSBI2B9tpcKgVmQ7bmiCcOypjZlxizAnN6g=
X-Gm-Gg: ASbGncvabxmeVbfXknS5rkqeSyL6dXOyisOj0wBsADdVnnL3n9zI37JVFDhn3EfvdFT
	FRQ/Im9b+jxVgWGe6MQ0hr4E901Lh11f3ndZUkv7mEPV6LWKCYOHrGX8xRXwcrTFA/6yCeesTVs
	xW3xlA08t/fs0dZtazUB3iZ34DQZ1/cwkLlzn90yp3I0y07Y7TqoPuouK/Q2tFQwM451ngIPv74
	secGthUP4a74hLtZL5qvHegSO2GwARlfzKm4H/VQFxphnWJZ6/aY4IOWEI/yMguvQph/4+EQI2S
	A0rmFZ1PQ1g2HQ6ErjrhI9JaqADpfqAmIKUN/IES63rJf3BYAu2e/Q==
X-Google-Smtp-Source: AGHT+IEaJAv7cq8up/ZJcJ41xkkrRi1H6wbFP+rMyncmJcukHJubfsFDxahu/j9T6NCNJr3cSnjNkA==
X-Received: by 2002:a05:600c:548c:b0:43b:bbb9:e25f with SMTP id 5b1f17b1804b1-43ecfa05765mr31050015e9.6.1743970221127;
        Sun, 06 Apr 2025 13:10:21 -0700 (PDT)
Received: from shite.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301acec9sm10080656f8f.40.2025.04.06.13.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 13:10:20 -0700 (PDT)
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
Subject: [PATCH 1/2] Bluetooth: btmrvl_sdio: Fix wakeup source leaks on device unbind
Date: Sun,  6 Apr 2025 22:10:16 +0200
Message-ID: <20250406201017.47727-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
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
 drivers/bluetooth/btmrvl_sdio.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btmrvl_sdio.c b/drivers/bluetooth/btmrvl_sdio.c
index 07cd308f7abf..93932a0d8625 100644
--- a/drivers/bluetooth/btmrvl_sdio.c
+++ b/drivers/bluetooth/btmrvl_sdio.c
@@ -100,7 +100,9 @@ static int btmrvl_sdio_probe_of(struct device *dev,
 			}
 
 			/* Configure wakeup (enabled by default) */
-			device_init_wakeup(dev, true);
+			ret = devm_device_init_wakeup(dev);
+			if (ret)
+				return dev_err_probe(dev, ret, "Failed to init wakeup\n");
 		}
 	}
 
-- 
2.45.2

