Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC932222BF
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 05:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751433422; cv=none; b=W2ROP7V2gKwf0DwbHHelLV1leR+Vc+Gfo+umH5pqECOL3zLPUkLCnnyPUkfirFxNwO0jyYp9KCf9RTOc9ovmfMkQmfK+ZLITSrVpZ/mwRcrzwRnxiaJbN7WPchiIT2rZl81y5vLQzvPeIgLK244Qtu6t0rkxK6e/48Q79z0RkPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751433422; c=relaxed/simple;
	bh=do4xgD3FIKiBFCXHybdwqmJMFTQfLzd5+SYEVnCmQ8U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R/9987RZeZhHKdB3N+7/cMqOEJ+A66yJCoZXoiDVAKF0guPIpPJ/vxe9yimeVGGxHdNqSITfj42gmyq3PE4RS6pi0znnM7wIR9rJgBMj/xEgzr5NkplaLb2EgfuBp3mAk/L4R+zAmqy9y3k1z9YawQ05M7IO4vw3EEKbOz7ZbLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=j6qTJYgW; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="j6qTJYgW"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-235a3dd4f0dso40032345ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 22:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751433420; x=1752038220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nCKZPLGMv6q3Gia2CuwihlvGGifXlgSwREijf4CMFzo=;
        b=j6qTJYgWn7Bn4SY4oOXUfOx7Ll6iG61yqpCkufzYBsuXoBQjCSrnvR49A+Sxtkw6ld
         U1rJ4u11AOYlvn/kqE1UMy1H519B6+ZZowWg14NQiVAoHqipUewsMuKnHo2iguVkTKPZ
         hOdK1Dqn2sa3Bm7OBw1tidJ0EFqS5gE8W6svzOffBZKow9XGx4dRPQhJRJF7piCgmej6
         gz1u5bdkGuFCHmbJyQjQmV7uJ5uOd8uH4UQk4Tds4HJ0uGoLaKfMU8qg1ovwN3QpYDc3
         D+Pi9szeu2ibS3HsxpqMX5GFJnLo5BxpkARLGjFO2e92fELwMxyxpMV6Ki4JwVkzDZve
         NhrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751433420; x=1752038220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nCKZPLGMv6q3Gia2CuwihlvGGifXlgSwREijf4CMFzo=;
        b=KhSyO7GjqpwWj3h4tTFw394Q0kmSlNNXSDWP9Kmnr1TnrdpPHI9eshv6jHh0amLBbR
         fpssbQyWs0U824l1jUchLO27KY8HuO4yK496IN7H8ZI7jqpyK1LgRZV/y2JRIPyIEFHl
         9n2LRyUc8wYdD6UUwleoByMp7z9bjKbpq6kcbn29nQgsys2bdsoS59sFZFakYKYBGTz9
         9SEOWImTZMESkzDrOuuJ4uOrpzU1EpPWBeMWsj2xB8irf/PQVXLpVeIeT14bk/HNzr1+
         LEqEqIiaFskLlhBSMikTODFUwfSCDOvqDTwZCiq9d6uB2Tv3HD5AreoP6z3znFER8/Yd
         ctjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHXOlLBkLHD7EYl0g0rD+9mC+RrMlFTLd3UvY3vDrItq5w8fMWHo/6gVVTgY4UsLVVCLl8Zm3FI2Y8amw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZSzZ+cRgYeA8OOjxuC0D6tIJPrn6cWtLoZnrWzRt8MPdddnzP
	FbdXS/MSLIJjTwh3fjBi9wslSPoYh8HfnpcAFS5xitIqpjHPqnbqMrZVyinMZs8C4+4=
X-Gm-Gg: ASbGncv2uu9JjqxF6xxD/rK6HwotVdRFfulYj4Ppax5rdmrLJTYspz0RbzfCKi40Hht
	OX2MZzA/KYWsPRz7490DkHIkf9/VIUcBxoRjhFcUaESRRXDW/L5n/hLaR0lPVwIRIDeKjT0FbBZ
	sh15brF0pafXfvWTO8ChGgfcj5qFCYhKxqtUpXtv4p/tzqlgLo1cY8jwR0Cne6K4FNlu+Q/DnXu
	h52RMPorYhFQM4LpLb0paGaZbM6Zv6cRZEpeka2+hSR87KA0827G19A4yhPYNm0i9LWiW1WpzdR
	/KeJHG/zDIYLEecE/d6H0nf950vJC9GXmjmXTmvhfcGhqUEgmouGYVnBYKOJ0ngdt+VTjqkHUzf
	xTxzN2mx69fHB95ry
X-Google-Smtp-Source: AGHT+IHlJ+t9cxCWGd2RS36udv84be8wQSLtZiGp/SQb5nMAYqyEcYkpZ750MfgqwwlAexTx+Vl7eQ==
X-Received: by 2002:a17:903:1a27:b0:235:eb8d:7fff with SMTP id d9443c01a7336-23c6e58df66mr23872195ad.28.1751433420424;
        Tue, 01 Jul 2025 22:17:00 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c6fe31933sm4719595ad.220.2025.07.01.22.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 22:16:59 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Len Brown <lenb@kernel.org>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v7 23/24] RISC-V: Enable GPIO keyboard and event device in RV64 defconfig
Date: Wed,  2 Jul 2025 10:43:44 +0530
Message-ID: <20250702051345.1460497-24-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702051345.1460497-1-apatel@ventanamicro.com>
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GPIO keyboard and event device can be used to receive graceful
shutdown or reboot input keys so let us enable it by default for
RV64 (just like ARM64).

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index fe8bd8afb418..bd5f97e1d1a0 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -138,6 +138,8 @@ CONFIG_MICREL_PHY=y
 CONFIG_MICROSEMI_PHY=y
 CONFIG_MOTORCOMM_PHY=y
 CONFIG_INPUT_MOUSEDEV=y
+CONFIG_INPUT_EVDEV=y
+CONFIG_KEYBOARD_GPIO=y
 CONFIG_KEYBOARD_SUN4I_LRADC=m
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
-- 
2.43.0

