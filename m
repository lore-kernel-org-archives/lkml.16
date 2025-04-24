Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD1A1C84DF
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 14:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745504854; cv=none; b=NFUcqLW7eppXWIeWj1/pCKLg0PbcRAtEnrNqfe1mi/5DDNIwjWY6oTWAH7T2CoqsfEF9PSydHoeesEF+o0WKvYyfGRRTJKdmGgVul6dQdSCFYbw2i7J5eMK6dL88LckqyYf2Sptprd4GtfHDEwNZyUlxdM/XqjQ9kR5ase8hOPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745504854; c=relaxed/simple;
	bh=F1YJqwR1H6hHO182e1YH6Y4+1p4GU9R6+42/wafryRw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jCo7OAUAmLI5mbSfCMvEEr28Yvb04701PI2nFnyLEFt1LtiXaJWds6RkBSblD33rRbTL9ra5UNSqNybM6rRXpJzNhGgFc/Mr46lbE6yR4r1fT51pLObWYV/8TLNBVFSPSbpgMixUKFmBrPxjtK5SN7cgiUtIy5KrI68JzNFkcd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mwa.re; spf=pass smtp.mailfrom=mwa.re; dkim=pass (2048-bit key) header.d=mwa.re header.i=@mwa.re header.b=ZdQjyXpG; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mwa.re
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mwa.re
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mwa.re header.i=@mwa.re header.b="ZdQjyXpG"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so17407775e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 07:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mwa.re; s=google; t=1745504851; x=1746109651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9d7NqJO4EtxlTXgpDiP0f6RU3e65rl//+9+R1L+ng+k=;
        b=ZdQjyXpGnn6/objJHdwZBw86xsV4OBhHOXxbBn9DvdWQ8hWzAmurgvaDHkU5KdVEMX
         F9P6IcIsHd85ZE7Tj1r9P8KYzVCfiVP+Bi0VifxZevZtB7AWDdHQ/RkIP7sLXALms4K+
         IfCnNm8HereNRsPcDzq4NxfF3PZ+1ySLfAX6vqrbY2kCx3zlkic35epbfMw9dj2xhQ8/
         v3vAppntfAHmCWV8wlDCKNIH6TfYfSzEDPoLifHOJiiZpqT+KuwT1+WQN29ghvyh2/pX
         G3WYcOWhxDhnNCedVhc4DQpLFDUoGVenxkQVYQgQBlUNxfRyA7NDiOjVNN23+F2Je4lC
         dHmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504851; x=1746109651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9d7NqJO4EtxlTXgpDiP0f6RU3e65rl//+9+R1L+ng+k=;
        b=la6CSkHQU2ptaPfdnvIlINPfNRC78V289cZl9IcCjZWBh5n4nLVzRTfDYwf5IPZ2qE
         wA+BolBqO3ROSr2GSvjF12HzM9c4DfnbvHMsEH22/qdvpBYg45DB/mw85RBTLc1x7SXG
         eMHsZF7hpCWrzVq80I8O7dbp8ygDaUIiBRDGBgBF0EynBu+WHHUvmYYJJC+Kxm15QIqn
         vTw8Y+kux/KA84MgPNz9EOm6y0y8/mFKI2LJOH4NR4nDzDYnwnDkGqtAuz7YEri87fgU
         HBWXtFf/bNHe/XD8JaQUwvRX91Pq/I7SVZWmbcCtO7LSJEIEnGpHzKU8JWV+e5FUw0gk
         d7mg==
X-Forwarded-Encrypted: i=1; AJvYcCW+8lqmUQU5FYFT+5eaLw2fEiDLD8n5QuKjiW7UkT3apS9K2F7Uxo3ihDMwvDpBRNP8P20UC/eOd3F4tRQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdzwiDLPO3LsyvulWCVYzZw88ixDzOYhBxD3tMu32gBUgALQ6S
	lnYg9xNivh2LN0xM9RzstXj++dl2pw1uIu1reF2w+S0K3UHygycc04BbgepMqKU=
X-Gm-Gg: ASbGncv9ROzdW5X7ihCIom2LiCB1nPGccLR5uUAWvp5rzF/J39dOP1LelRJufcXpyZa
	LcYQgOHgxclZihrJ6Yet3axP+Onae+clc4HJx/l2lzHaVf+X6vrcjPW1e/kpJ4aXyXB41XEbIGr
	K/8Vky+fHpmpLcY175dlksil/zR1AFjgS7b/Jf517MTPpE4j+p3ST3v3sVcjn+zGAlYVx+VG3oK
	+Rcuhi+O987JYONtzphd9g5xYQW7b/D4onz0b8e54ziSI8ESiBfAeAvFW2MO7R1DIuOuAtou5Ha
	N2uNDAi4UJgGdLeDFjQmBqEROuVXOyXqf8i+y8OqxrIkfsVNHljIuzuKWNpzeAiQ0WRMIlf5yJI
	h
X-Google-Smtp-Source: AGHT+IEMsAKqZvQKv1HURFPLcJMP9q2fFIiW//bzYr0WFnNqRgNJbE3RCkzOZJu0K7dFBbOpVgGL1Q==
X-Received: by 2002:a05:600c:91a:b0:435:edb0:5d27 with SMTP id 5b1f17b1804b1-4409c4938ebmr19886315e9.9.1745504849577;
        Thu, 24 Apr 2025 07:27:29 -0700 (PDT)
Received: from mw-ac-stu-3.corp.mwa.re (static-195-14-251-13.nc.de. [195.14.251.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2b892asm22807565e9.32.2025.04.24.07.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:27:29 -0700 (PDT)
From: Antonios Salios <antonios@mwa.re>
To: rcsekar@samsung.com
Cc: mkl@pengutronix.de,
	mailhol.vincent@wanadoo.fr,
	linux-can@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lukas@mwa.re,
	jan@mwa.re,
	msp@baylibre.com,
	Antonios Salios <antonios@mwa.re>
Subject: [PATCH v2] can: m_can: initialize spin lock on device probe
Date: Thu, 24 Apr 2025 16:25:26 +0200
Message-ID: <20250424142525.69930-2-antonios@mwa.re>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The spin lock tx_handling_spinlock in struct m_can_classdev is not being
initialized. This leads to bug complaints from the kernel, eg. when
trying to send CAN frames with cansend from can-utils.

This patch fixes that by initializing the spin lock in the corresponding
device probe functions.

Fixes: 1fa80e23c150 ("can: m_can: Introduce a tx_fifo_in_flight counter")

Signed-off-by: Antonios Salios <antonios@mwa.re>
---

Changes since v1:
 * Move spin_lock_init from device probe functions to classdev alloc function
 * Add a fixes tag
---
 drivers/net/can/m_can/m_can.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/can/m_can/m_can.c b/drivers/net/can/m_can/m_can.c
index 884a6352c..12e313998 100644
--- a/drivers/net/can/m_can/m_can.c
+++ b/drivers/net/can/m_can/m_can.c
@@ -2379,6 +2379,8 @@ struct m_can_classdev *m_can_class_allocate_dev(struct device *dev,
 	SET_NETDEV_DEV(net_dev, dev);
 
 	m_can_of_parse_mram(class_dev, mram_config_vals);
+
+	spin_lock_init(&class_dev->tx_handling_spinlock);
 out:
 	return class_dev;
 }
-- 
2.49.0

