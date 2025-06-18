Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C192E9EA2
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 12:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750249047; cv=none; b=YcyuGInguvAr2EULB0kBg0ATV8oXEirlFAGjfMafdXxGAz4hk9qL0MQkQnJLucfvaLdheCFVcEVVjnn5cC3R/semCMaaDP7c20lRxoZukiV1EdmLNINRWUJP8usn1V4SLAun9CRNJCFesgkvUnAkP7vvr78ZY0dOyzFlc8bYrp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750249047; c=relaxed/simple;
	bh=do4xgD3FIKiBFCXHybdwqmJMFTQfLzd5+SYEVnCmQ8U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T6pq7ee5f95s5Yvlj+zW3I908ambXvHpzce2U8mL6tzE2qIPlGIyFomaTnnDU6aVKwRUVykL7mRZkMx7/CkaT/fhd1j0IQOwSpgpVJoYEQpgTnWknxtcBMpdm3rvbgU6MTDe+/LkUw3M7m/AdMrTplNO4acSi4ytFufjDZmUI9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=l7S/PAeH; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="l7S/PAeH"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b2fd091f826so539219a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 05:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750249045; x=1750853845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nCKZPLGMv6q3Gia2CuwihlvGGifXlgSwREijf4CMFzo=;
        b=l7S/PAeHYHMucSpbkSegg3IzRoCHIq2UoKiez1NxkMKuJpwRvYIjNxNOQWCqA+Ra0V
         8sYc41WnZF7oKv2iqAxPkTWf8U5P9IafGqse64Llq+Ew7d1JBvB+IkApT/UPeSzKZ73M
         3oBCHI7NF/fmLZEVH3nF+nFAfxUKgIn9V/di3drK0mtsBQitNOAgOk9RyEGh6ulrahLr
         mQpdjGWAUrk+WuMy7oUeqjmNCLPrAONSMNVY4UySHh2qu5NkbtnxKrtKp2emNrsCfqj8
         7tbxvwVb/lUjzpzd+EIVpwnNBknwVbb+T0Y3JLleRovqLh8VXMvahu6tJIK8dsaEip0b
         ELBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750249045; x=1750853845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nCKZPLGMv6q3Gia2CuwihlvGGifXlgSwREijf4CMFzo=;
        b=KB52HmYcJvjWhp17V2VHqDX6bZ6sG9ISMqwAPNxg1GIAXt1TXzbzP9HKX5+4ueerlc
         1okmuo0xu1pEsY1QwSrchWAe7V8jR0m0fkNbM/vng7nSAc957NBhR3LAsiaXn7FwGgLS
         VFH1wmMxH3VnNkiQ596z+0BPeW05+klstM2dDwNgpKkCViGC4pDiPUpLxEB3fFvaVqpu
         B7mJgs+W4aG4Iw4o3B0kL1NW/FGUUqtWzZMBvVuGQukBjDwcBXjTXvQ8u0AMUNAo/8zT
         YWxOQfouVuMtYVacy2MHGZSo0Z4J0zJlHITTO8bWhu6YMcRMbXfk3qtpMnYIM9MtBNNA
         jQzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnudOF6/5w/LMFCODTnhuQlITLM59gXkpzKI27qn8yV0qYeIY8/a1yQDSCwmMJecjzW51GisN4NzgeSME=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXN4mlU5sgF9BGZz4Swec3D+dFP6Zl1J+ss8X0xeeS79GNfqlP
	bezbzJ8+JvfuF4r2nqkQWU45pzFcZM9ebNuhIi0frAaB2zL3pwXrfCR42VeB0/7Pdv4=
X-Gm-Gg: ASbGncsYtvhRacIvOQ7yT+n79LBMG4zvWYSYjOrkzPuW0O4kbxO5Hhd5N8qk45Z+M5/
	6AZ6wEqeNh/5VoTVjxHGAczQFhKiIzfBsSwhdm8M72EfiTw7+gxVMLoh06a96C9YKQAwqJ8B5ji
	pQfi+cTXIqQ1ngd9b8AlerL1bZwRj/z9/bvcjzDRys1XHi7Sju2EbvlKTj7ex+75jBc5ROGxdxo
	isjlbdwziXEAgjM5VW17O5LU2BedrTkN0+gfoKuBLH3ZuDTKjaHw9r08ZRsN0YArp2fD/4/7ZjW
	qKydyMnhXTaieWeNVzHWt4J3JVmmyui8w+O5bFHTx/CQxUelxaP0KXUBonIie/iwueQKFIJiT2T
	ExxtaPs5kC7TJ+U1WLA==
X-Google-Smtp-Source: AGHT+IH1xfeewtqn0zTX7kLVKrq4fVYOZXne0D7IDvJs8omDNN2bsZJTXVlzhVc2KfRNGR1IHYBc+A==
X-Received: by 2002:a05:6a21:3942:b0:21a:de8e:5c53 with SMTP id adf61e73a8af0-22003759d05mr4132869637.12.1750249045295;
        Wed, 18 Jun 2025 05:17:25 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d7e0asm11201177b3a.174.2025.06.18.05.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 05:17:24 -0700 (PDT)
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
Subject: [PATCH v6 22/23] RISC-V: Enable GPIO keyboard and event device in RV64 defconfig
Date: Wed, 18 Jun 2025 17:43:57 +0530
Message-ID: <20250618121358.503781-23-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250618121358.503781-1-apatel@ventanamicro.com>
References: <20250618121358.503781-1-apatel@ventanamicro.com>
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

