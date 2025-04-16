Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FD822CBC9
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 08:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744791930; cv=none; b=k2vOW2HWhgDG+mdAoL+58v5KIfRZaQjcG9NaNAVq6qj6C/l5wW6zp8DHWt7BGa1HW1LK14yR5Gj+B14QoJCymIJ0Rne/BASr5cm1N09e8c9blLl/P5kRT6UhUZTNXYN/RGb+Jz9kJpSxFqtQegMgnG0EyqoNOgiq2xZJQfPYaCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744791930; c=relaxed/simple;
	bh=3lHVDWOEyHT1qTAD/MvETxqJ0omNB1zKiacxthQfQzw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PH3g0IkqrF6MWdlpM1xdn+ho3hTTih9EIy6DMu4CyfYu6q5GJhc1I+UD/3HW00APk92JGCVs3Xu+Ncf5h6fTrp4qeIySesUrpa1DtJuEpNkCUuVJuxwGvWEKE1s/cNw8Kd2P1AcUtzj/J/rdYOlyMqfWnJkNfN06xkLvZITO3ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iQVhjU+0; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iQVhjU+0"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43d0782d787so46631165e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 01:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744791927; x=1745396727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r1uQiRHsShfsnhUou+7H5mwvSopx957gJ4JlVS+ceqk=;
        b=iQVhjU+0mAZJVsALcTmDOwheLwAwxhLH05RTbaMPpN5fJ43APcg1ZkHs4J73xhcREF
         wt3kTsE9o//Xgv/wMxYFLkljJq5SpZUmv3vJrXdXy7Dc2rC6GVYRMO7Zsjd5iq5/g14T
         rjjA+8Di40ZRZeeLWLpJNpTBS7fLuJd5D2L+MoJKJiRzIhQdLZRRcOWdzr6VyXsJ1TBv
         wDThZYcfvJR9WairVcyFDf9fGpQilL3bT2VfqKVtASJGwroF3pQLUwmjPQBuyxUUkfjn
         BSN+vHgdcGge702h/Tq8GrOcuKgZLhcdlADTdMC54fAgCp8auNZzfaS13maE3wq6SIX8
         ibIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744791927; x=1745396727;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r1uQiRHsShfsnhUou+7H5mwvSopx957gJ4JlVS+ceqk=;
        b=FC7u5RfdNKC3C/eB+dpFg8uwRSO5k/ZJSJ4dgcdCImw6GObCTZ+SIpbzIGNsOT+u2K
         yRMtgUkRJL9O+xs4ake+Gt8uZx37HokxCFRfcVpZUJkOjDJ8MATD7B8t91BkamBdbdPK
         n1k+xScB0d6SRvW/wX8FtsNzBZHnZzcoWpkPJTlqKNnC3rCI9+r8OKV2Z1wPzr+xIs2L
         0tNKsKlSqs59zR0PNC7hlqUOXpeCXEOWA/xG6OkUX94NjhkBb3qcazfA59xuiKX59GM+
         Y5gUWUJjwDTTOcZTldDJQR2NX2veAqAigYxlXLC2A606QLN9/E6L+Il6mjjRbkYIJGgl
         bf6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXUgm3vvuwBH0JfE1eAzeCVPfI7uqlXoFZLSzQYBz6oYFf2LNeWbq5veE8gG5KZvJ/Kz/q9oTIyqePNhrg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCbRTbFdrayMkfMXkRldG0mXgMbAcd2l9ACss1lymMGW7oFKXm
	P0lmmWkWqffdcp6nPgQkB6txrlQApPVOGa3WBPtkqwsoJReTDycX
X-Gm-Gg: ASbGnctrNYeAb4Qxg2ZvvQD4vyIPvVyaHB/nwwWp3Xyq0MgJMW8tIkYP2HZnbMBbLDM
	qzErGA3XOf92vhNFpdnZ8Mh0jxo/MKbJjxC5xUyxjcyC7CdOstbLDCgBsRhh+97iqPjUIjclrXq
	/D0dWUpE6iC2/ugVKgfhVSrKH/uLcLR2dIHQ1nUJXq0zLdqhMRTwi+6x1WEoD4hgCGQj/CN/3Oq
	PPtdbkYQazY/BZjK7rc3FJCHk5IS7LvclYdTby+/NJ94yvq5cprDrji5G7GWmZPWiqug2c/w8oC
	uTaJBm4AO0TluQ5JMxCSvJPZUTh3LrESSyTbs+V6CQKrgBPbTRKaQV0BGMWq2EQoh3DU5N1l9Oc
	7Dht4QAlEw72i8wbpIkB68tVb/visJ+cGNuV+GEepy1sZL8G/X3hL1sSi2y/FOrrVFKCXYFE95L
	M=
X-Google-Smtp-Source: AGHT+IHDUqi1eQx0/KeIR92bOFcE04EoiMUJKsfmo7Ud6Ppo5FhXkSTld+4PMkD4fwsF+3L01VDAWA==
X-Received: by 2002:a05:600c:6c98:b0:43d:aed:f7de with SMTP id 5b1f17b1804b1-4405d6ad29amr6520995e9.21.1744791926914;
        Wed, 16 Apr 2025 01:25:26 -0700 (PDT)
Received: from cypher.home.roving-it.com (2.c.4.1.7.3.6.4.2.a.a.3.0.f.c.2.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681:2cf0:3aa2:4637:14c2])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39eae977fc8sm16214745f8f.48.2025.04.16.01.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:25:26 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Stanimir Varbanov <svarbanov@suse.de>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH] irqchip/irq-bcm2712-mip: Add ARCH_BCM2835 arch option
Date: Wed, 16 Apr 2025 09:25:17 +0100
Message-ID: <20250416082523.179507-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ARCH_BCM2835 is used widely for platforms enabling
the Raspberry Pi and some drivers that make use of this
driver are enabled using this or the BRCMSTB option so
add this too so the users that want RPi5 without all the
other STB devices end up with the driver as well.

Fixes: 32c6c054661a ("irqchip: Add Broadcom BCM2712 MSI-X interrupt controller")
Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 drivers/irqchip/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index cec05e443083..08bb3b031f23 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -114,8 +114,8 @@ config I8259
 
 config BCM2712_MIP
 	tristate "Broadcom BCM2712 MSI-X Interrupt Peripheral support"
-	depends on ARCH_BRCMSTB || COMPILE_TEST
-	default m if ARCH_BRCMSTB
+	depends on ARCH_BRCMSTB || ARCH_BCM2835 || COMPILE_TEST
+	default m if ARCH_BRCMSTB || ARCH_BCM2835
 	depends on ARM_GIC
 	select GENERIC_IRQ_CHIP
 	select IRQ_DOMAIN_HIERARCHY
-- 
2.49.0

