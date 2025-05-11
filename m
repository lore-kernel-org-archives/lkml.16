Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83432257443
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 13:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746970994; cv=none; b=dG2a292V31h9x1ktpsUl2MOXLHh4WZAZiBx521qUL2lS5jZkhvUupIBqQpuwdwK2TSa2mniAgkPtgUqFWCg0/LORjzvNWBGmbvcGHPFwTmOCOPXGzG3KFcB3wTi9hc17p3OkeM8d12JHOsiwpxpWAGbNbTjgu+W22j3tDfajOjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746970994; c=relaxed/simple;
	bh=2bVgrzW+Bo6LaJ/rBpXJ3OijmNJcUVwPRKA5+vz2aAY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=URFfI7LD9y5szIq8mnerO7NlxXwhlsHb7F7hhOc3sN+gLgdA2cPlAOWGgblXABjZ56g9kX9uf3LA+8kTNZpC2YJcMc2S+UeSzQ8dOwiA3mFGWCHdshpOxBgCjyeW4BswZmXSnx0sXzUjIa5VM/UCKJc6lcTOhHwiidfnAZp/2r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=CnIbZ/0D; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="CnIbZ/0D"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b074d908e56so2325519a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 06:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746970993; x=1747575793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+UQe3Qzwvf0SHdVaaWPmVtAnPTdnpZyqkw1bgNcAoZM=;
        b=CnIbZ/0DXIpIpIW9xfxIc6g88qdJF9HL8185KjE4GKkptC5AAOFrhTTmHfg+Rfz+kB
         pGzn/LAkT2BhLGkkjgGORqknuYgnKz7P4KxnYAdennTFYIfL5JswMpxpjaa7TOXwe6sq
         bSmlzRztUpP+b7bCFr1T9yA4w7x400f0Z3p+UsX9ypJuBtq+jESk5tbGDA2WIAHUCjJ3
         KawKRffaZb1u1CuIiBGfnaLgj5XEUkx5KQneLbw0YtejrbGnGHYb274vyPGmfrlPXn/Z
         Tp1OtYdKNqf8MizcwNZYdQwd3RVSoqjx5glLZWVO8uJ+QKzIGqgLdlLPc2SMZTmuPEGl
         qD5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746970993; x=1747575793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+UQe3Qzwvf0SHdVaaWPmVtAnPTdnpZyqkw1bgNcAoZM=;
        b=eC07ilb2ysu+f9VRFXtTs4GJpVO+c4euZuztOHqSV9yhPxLBa4TCdlmWR8ZTWIVbzf
         iiptkUkG3ifQuZ+2bcxQRHLuq3okqTTYZHZb/EewcwG8sf4dPXlKtWU5Q3Xjed+NxSfx
         ZQRSjKP0nbqBi1MyzC56f4D6uP8jp+0UQQ9X1qp/H+TMXppBby0R7xt1b5R7RszI7BbV
         oYcEgv54llC/0m15S5j+KaJcKsL+Sqei2KW6qeh1+Vi/Ap4QU48DXZ+uJ0wsvHWHgNoy
         o4xEVZCIuKTyL4PLf3OhOljiL0Uq7Skmqku4DMvkquHN8t1VQDeLw64RAH7qeetvO/eg
         7zZQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9V9eqxAbFZ1EDTG4ZrN95RPClqYw6stiYG23R25g/qZOUwYTc0isvDuRoHV6G+km4ZCBwZ1jAcE7mezE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwX1W+zVXse328rkXdYhvcxCItfcI+BHznnbXMfaAJtcbgkrk7t
	U445IHYgmUC8OFqU5Qec8YLZ4+//kFYVS11QKDunerucJSP3AYdHTmHfQGgAy2w=
X-Gm-Gg: ASbGncuDHKw3GHMEzajD58xcINWgBRb8Jo6xg22vfRCS6SF15n2Ye51M9xVCUlsAxx8
	DM5W2Rh8+2ZeYn8JCpdujneEdfI3XaypOPs8KHRimnN3dEu9WZReQWc5fxzApTvw0K0qWuMN3Hr
	iATGZh8OMWLsYn+56K01u7r8aTLp3ylxBQ9xRujPzdlLVYyY5wJ7lWJLQ/y6jcBDlw1jLvn7uqZ
	5fkRBpvVIITd/pLh0CRfxAW4Y8KawCL+WbKdu7m/8Ts95tkLnWHZPoO8mJmcoG6aarp9z3NJevA
	SRvkbNoZVcxqTPUgeWb1S5T0HF3armqHFWQ/ZxV+pkwtnGIUfr2lxbNSw1HlprIfQrI/gOa/ZO6
	P5xYfkdKIy8Ed1g==
X-Google-Smtp-Source: AGHT+IF+IkM7F7ey91kYHIIahlVI7rAiG07XaD6sENN6QxvafBbcmD4Potf6FZ1TEDxPieRGjIrvrw==
X-Received: by 2002:a17:902:cecb:b0:22f:a932:5374 with SMTP id d9443c01a7336-22fc918d1a7mr170483985ad.48.1746970992580;
        Sun, 11 May 2025 06:43:12 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.17.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc754785bsm46665805ad.20.2025.05.11.06.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 06:43:12 -0700 (PDT)
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
Subject: [PATCH v3 22/23] RISC-V: Enable GPIO keyboard and event device in RV64 defconfig
Date: Sun, 11 May 2025 19:09:38 +0530
Message-ID: <20250511133939.801777-23-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250511133939.801777-1-apatel@ventanamicro.com>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
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

