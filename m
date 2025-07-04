Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28EAA274B3E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 07:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751612921; cv=none; b=EnAopTDiPcRGjnuKsv6PjHeLfkNey4oR31gXluOAX616SNu5vCqcOUuJbRjBz44uymWCwynq2QCu11dOXmCmWR3gIZSNiMmNjqTPnMebJ6pCA6yyUZancphwkHgKirU4dUEP2shMtZPS7+OBU9EL/fg9dIZvmZ30vYOj9ixUKq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751612921; c=relaxed/simple;
	bh=do4xgD3FIKiBFCXHybdwqmJMFTQfLzd5+SYEVnCmQ8U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UfYrpe+i62fXN1I5bWHaKv5L7YCBFPLM2mIxkk2Ez/xErDMN94I5Y/rs0vaGusAE0iPxzxJZyUEUYT/vEgM1z5Hv54/D6NpqLL7jlxgwOPd3m5TTEPpcu1oWd6VIFKGa8XWkyIlDzSiascX9SBSBpB8KONGoqC1P0sx0eTQ2h1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=IWf5huiw; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="IWf5huiw"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b2fd091f826so564009a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 00:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751612919; x=1752217719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nCKZPLGMv6q3Gia2CuwihlvGGifXlgSwREijf4CMFzo=;
        b=IWf5huiwWzkoa8wsImGVBJV/Wr0ARIJuaNOjJAFtqi528ROAWGlfuXjbz7OsP1YDnV
         22aFTskteYo6bXRti8lFDxdrGjqG8BWUOWaKQkqnTRrhNiii+1AeZWvJBOGYtCnHRZGC
         Vk7Z2aY8tQkWLfiDvngHNLf95BEkCtsnUciVxDh9nURto131g9qgE34kT9r0xvIT+gnf
         Mj6NfuXDRC+17IzBizdezLUFRi29emLbCjt3SG23wAvTeKo3Q/A5wQDgeNv4Ub4EiwHM
         LvFN1+PoNyfNekhMWXTWKqB6Op4LAKRw8MfseDvqZeuKgZXGh8bYggvbXYEcUh3TAEbY
         smmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751612919; x=1752217719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nCKZPLGMv6q3Gia2CuwihlvGGifXlgSwREijf4CMFzo=;
        b=sfB3+6kRSlOk7xZ5mSWJqN9oronMURix+0uHBi2OilvBtjinz2Mdfx1smQOxen0nsz
         7x3lQ+FsNx5bP+ZNa4plBRs2Zouu6q52rrktQrljZYLuZjkarNfYkwfC5MdYp7KxsX31
         u9i6DdEQHpLzvRkXVvOJJsV9qewBrMMszKpEzpkVNgGFzDn90s8Hy7bv685/O+eDI2YD
         t8WColn7oY0I54nDQjHd6oGMY26Vt00U43YkKQlDVO55mVDI+iVZnaQgM14ieBU6+ZyU
         MDvSb0XjsbhFnyjxwbG5Qi0bg86/pzYtrFQgMYDFEyM4WFi+rxCmTbZXf8H6xBygAScR
         Qtyg==
X-Forwarded-Encrypted: i=1; AJvYcCWcJkI8UYjxkcQbgGB0W8sXdghPSysnxcppFG9LVSpyoK7rkih5/c1t8YfHB5o394KqrwKCfWLItyilZDs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPKlLWwYzr9uNxAvcdcyUFRFPykN2oxPVryn/WO4mlGQwDv+SP
	h0S0Vvzkzp/kqsj340mwMyiu/eqpYFWJE4STS4QYRePbhJtBMw7o7ca5EtBJW+d2H8M=
X-Gm-Gg: ASbGncvpYUbiX7TJetD3VM0C8mm0sn6DSSWY90MKtQz6FDQm6YYeFYl//t6bC5Y2lvr
	rqc5XPwxE/OlJIBMS0xx0WVsv6pnBz4282mp0RdWELYq0vJCPZeXJT3+C6wiSxq0v0hTSZmeVJF
	Z+gykW+7fzhBsmylAs2Gc1RmWzgSdMoDmGGV/tJ9U5NcTAoJ55cjtazSih8s3hVVy60MqbO+YZL
	+kY/CO2tV4x2DuwKne1gdnOgjWbxxSRyFaZR/JoTHQKsv3sDtapqs522CMLQFIyigIOK2l0JxMh
	uCJEESL/Fc+477/yZCNMYNU1SbiUoiCOhm2O+1VH0XqAAOKJeXWA7xxToWYe8EknNLjDVCcZyk3
	MC7q1FqrFrAnhtwfrOXCY+YPCOw==
X-Google-Smtp-Source: AGHT+IFZBNddecKSRV25p51oDjtdR2ftq1DYNinGTFvu7tPEIDtFUw6AiYcQq2JjuNxEVU+rdRoXSg==
X-Received: by 2002:a17:90b:3a05:b0:311:b5ac:6f7d with SMTP id 98e67ed59e1d1-31aab854e04mr2651722a91.6.1751612919264;
        Fri, 04 Jul 2025 00:08:39 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31aaae59a93sm1358697a91.12.2025.07.04.00.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 00:08:38 -0700 (PDT)
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
Subject: [PATCH v8 23/24] RISC-V: Enable GPIO keyboard and event device in RV64 defconfig
Date: Fri,  4 Jul 2025 12:33:55 +0530
Message-ID: <20250704070356.1683992-24-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704070356.1683992-1-apatel@ventanamicro.com>
References: <20250704070356.1683992-1-apatel@ventanamicro.com>
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

