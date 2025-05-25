Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7A01F09B6
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 08:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748163027; cv=none; b=bRby+L3skihLn6vJPH7cHpA/1Vt1ClDl9u4pC6LcNi1YDd1QldQsaMyhtNk6g0/3CxtLUsDDaH8e/dnVEVIHB6Dc+LmIJ+A5alNS6kexpwFJK5oL3GJa7Si7jNnTMN42jzPQI6D9UDYZFRRg2fplDto0Ky2Z0PmhNm119MjByP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748163027; c=relaxed/simple;
	bh=2bVgrzW+Bo6LaJ/rBpXJ3OijmNJcUVwPRKA5+vz2aAY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aC1DjtnFLkrQYXJXd3lrW4OvuXInHz2nceBsQacBp4qeMwGj2E351TTlYR/rYtsCt96ATX53uwbCHLZzMGShMfooHuSfoQYrSWTM2KsO/5llrir4ufl1mHm6kBdiW45c6sPduGMKaS66Ol3az1++c7JvveX7nIqPgbJtXkkIlhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Wfsk5Mvy; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Wfsk5Mvy"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-742b0840d98so814208b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 01:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748163025; x=1748767825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+UQe3Qzwvf0SHdVaaWPmVtAnPTdnpZyqkw1bgNcAoZM=;
        b=Wfsk5MvyvtNwFy/fNBBqLxrSuSizGBR5Ggz2H8vv7byNkjKOdzUb+5aBnxgXRW0yqA
         6SuT8SqmQE3ZWNHq75iA3alSpB9jbiJkgeqEBaQlrWgm+xRc6rmRtXukguGpDB5RFl57
         b85TA6PzWI9ho85ccHmw5s97IKCIxyaRCWLtZv+TNTyverQFPKiih/svo+mqbIVFpH1J
         ibHNA3ff3XA85B3IJgqKqWXfzuSVL68bdkCXN8wPsrnyFycjtAW6MBimB1jPrLsBKBE6
         H3IwsSm3iWc9yseFdyB/RQHDj0Cyp8387gw/Jyoc6kuwUoMJ+1xsI0zcNdiR/RiW4moj
         pM4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748163025; x=1748767825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+UQe3Qzwvf0SHdVaaWPmVtAnPTdnpZyqkw1bgNcAoZM=;
        b=T1oI85qI0OuxY9yaG2JCT/CqnupNlAWgUIgVVqxnEiZlIP9WTup6h7ULZTBak6hGft
         UScXeX3+A8W9ZAECi5zOXuaeaaqkEAKxHDiQAgMFq+IMeuDQSCqAi9wO3Sc7QTq0I2dM
         U8HTGju2jL53oSs6F1+VJbgzUUQHy168X4tvW25on/jG+oYzeSXnqq3PxlYUcsxkRpOI
         BxXe303RYnmh/u4KZQuLvO99bCfTNt60Yfs/pnoGvIoPDHmIytQX9hUGJUlDG3EORQYG
         hVv5Ph+IpWtv9k31BXZjKFWLOSbKoOcDJL/wQmAVYk9KSa7TSkR56A1Goq6iPPtMZw2F
         vpFw==
X-Forwarded-Encrypted: i=1; AJvYcCXr60zFMreMZCFR+DWtHyyQKgbIXeEUTWuLTghNCb4r2g3c0WG7+blKxkZZr1hNCRzDIPmsDDEwqr7VPuk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yybjn2GcbickbW5Fmh0iPQhj3bZKVEO9lqtp9+qvAnlcZDlr7YL
	niwb3uuvOsUxgusZFk158lRbrLaE1wo0m0IGE4fD8r9YU2dG/XfP0BiEjigGkHreTUA=
X-Gm-Gg: ASbGncuBGKI3yuHjb4BWkX7BbW7SFQsi4X05KPv2bpdBVgYkTuTksyGCMAX5lI+FhI1
	+X1fkOCglYAk28r7BRLooY55dCTugAOlRfGqTroSidp+pIlOT3+Neoo6ol63Meg7xy3JIcm7uLF
	UpcBvpd8nLqTMFgYOezAFUvH5073hMMCbpywJxiqZhdYOzouIJAY5TSHsfQ/iRrC94IsO86xeI7
	QBlY4Ei9TF7zqkDqOxThJe9hYEWlYqCrY7mo8B6cb+YVV8hwZlSK0VJp6px/NbNvSanR0TgV6ao
	4+KmhYjRF2/zpVAvjYA56rL6Z3DtzQRHAwvRxs+gPwFgByZtnUHvGszZdsl4EEVMfp+XD243kXh
	kgmDESaa/
X-Google-Smtp-Source: AGHT+IFV8zP7Teq2vsm512nvDsFUymwEFpC0Lvaxr4DA6qwGTvoxd+WhM0Vc6uQMO7LrAvHUtRMGMg==
X-Received: by 2002:a05:6a20:cf8a:b0:1fd:f4df:9a89 with SMTP id adf61e73a8af0-2188c299354mr8476555637.25.1748163025062;
        Sun, 25 May 2025 01:50:25 -0700 (PDT)
Received: from localhost.localdomain ([122.171.22.180])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf6dd83sm15250627a12.18.2025.05.25.01.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 01:50:24 -0700 (PDT)
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
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v4 22/23] RISC-V: Enable GPIO keyboard and event device in RV64 defconfig
Date: Sun, 25 May 2025 14:17:09 +0530
Message-ID: <20250525084710.1665648-23-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250525084710.1665648-1-apatel@ventanamicro.com>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
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
index 3c8e16d71e17..6aa330f4b67f 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -141,6 +141,8 @@ CONFIG_MICREL_PHY=y
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

