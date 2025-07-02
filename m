Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0106221FD6
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 05:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751433430; cv=none; b=b21Swm4XdCcjNFQzPI1Qp9s3ZHxSeBjHp2fC2LU91+7DWeKZR/VTZxahugS+Ukac9M8PJO3GcauPp1RcLF6OHCPtdeiuwBfvh8WfuFW6xgqhUSK3pCXh3KItyDw9EDUMbuQYqBGZy5Wu7wTCaQmv+wZafSPkAMkda3VkvzAGPQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751433430; c=relaxed/simple;
	bh=SIZVTA1dBlDgHWuqKkMeHUlssl6BYErjNhZuMkc2v6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cRWxRUl/mJ19c47ol1g7XCXRdh4q4hYk35tqZXK9E/tgCdTS2GfdJKVwgHmSDvpNFo+epsj+34BX+EwgJVhOt05BVZqKe6Qo00OEPCoekyTHzO7JHk2JZEr4yGD6T3kncOd5bpG0AlgLhap9s2WdmAhqWBEpxeYi3duy9ehkrZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=CUCd63pG; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="CUCd63pG"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2353a2bc210so37520445ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 22:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751433428; x=1752038228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t84+O6WBdBY0SCc3BtWc+Gw5ZYyMJomoxrVu9jQtsgg=;
        b=CUCd63pGeGu4fUzMEvMVeiJTYiKkqwGwjNi21xlBefLtX/hUB1ogxNyQDNZrl/P1iN
         feJFYgm2b18q4Oirn5PGBEtFyvn8x70pW1I/3mFb7UdRn4q6TSlB2blJ4sChn8XmSCwQ
         s9rfXaikuXMpNZC6KVi7uZd7oO7glF9aCF2bZSSN9WdahH3lF5mQcDtLFoueSnSu/kJy
         N1t3yG3FX4dQQGGY49xs4MfXUexnM3TNJ8Ii88lno/lERrej6ydoNqAAhs1FJQ7pGOFs
         iZWFGRlI5ugSEG9Zsb3a7mzq/ytyNK2FTow2ak7ocZnGoWxWw67Ag6VCrpW/4gcrz6m4
         vvaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751433428; x=1752038228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t84+O6WBdBY0SCc3BtWc+Gw5ZYyMJomoxrVu9jQtsgg=;
        b=OUne4m/CuOkLe2zuzoHMx8i0NSCHlTYjSUrE6zB4yudqGeo2QBhyIkTbcn1wFAj3Cc
         XdWWc1Eenbui9j6gvU6T9V4hm5VtQBBu/iC9klJJQPOEiF/W81kd/5pYRxFU79KHaCNk
         ol+kbPTJAiVex6BTSiADUNVufvYa58GapeQ4kl9B/L/gsIZHq/UwgRv8KftlRROaKyjc
         wIJpZCkrWZuLT1ZbX+jB8TWjPwZrmrw9RpzSJizDcp32G/fTQn3j+MFtF1O4hfWpOQ+M
         MUHwFBKrb2u5Z48fzR0Q0PTa7FuJ1g/95rQs0zWpDltVw+1OOhzVu+eos3ZiOLbAVShk
         RZhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaAe40/Uke2VQbA9kNKvlHjNCPk+9Vg+zpIYDqS9o+6Zsf0Gu7Ls0h7ld6IaJVLW+apJYRfneNSgiy8P0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp3TFQUGJLh98Jq7Ot0uZWYc3FZjNEv/az1E1IpKLPiGYeKVW3
	mveCZ85PkBIMfTp4fwX4YpQ3yTQP+EA/Sfp7ODNjSHOefxMc9Dt+8B8rFh6clJyU4OE=
X-Gm-Gg: ASbGncudIJNt+f5UGanxtNwKoIDgA0s8SYlaOZzo8mAQWzWWErY6P9EFA43Ma1Zy744
	Mby3SP7wP/Pn99L4nQWkmMhXvOrrpQtVscaWGphMyA7dbg+FuXzWtoHAbxsbsk6e7HuyIaCHuR0
	WaoV5+BHvTDP1PpZIdNbg2a4IYAYh1ngFJxzX61xtE21ZFOLfW4RKf1lZV57gVELZzrNNSEb55p
	vCv/QIPu/NfUhJSTz9J5HQvvrhyoRQDnHgnUiIkM31lsWIdOWoh2X3zZ7/QpJeHdG6JNJgh+wf7
	cpAXOx8fh1a+XZgt+p7PYKYm0+ZQxGzX7Qtn5xB6/eHIIkWdTgNoziEd9Lh+Zywdiu2qW7Ti4uw
	dhOwcxgc08hMn6dIK
X-Google-Smtp-Source: AGHT+IHF9jCGgWd1zPtdr7P6gyUcMpmB+BURtwnVFT7vtNKBR1DlMS0ym17Nq8ulkiJ1AGOTzoV1rA==
X-Received: by 2002:a17:902:cf4f:b0:235:27b6:a897 with SMTP id d9443c01a7336-23c6e552a2bmr15106685ad.34.1751433427932;
        Tue, 01 Jul 2025 22:17:07 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c6fe31933sm4719595ad.220.2025.07.01.22.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 22:17:07 -0700 (PDT)
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
Subject: [PATCH v7 24/24] MAINTAINERS: Add entry for RISC-V RPMI and MPXY drivers
Date: Wed,  2 Jul 2025 10:43:45 +0530
Message-ID: <20250702051345.1460497-25-apatel@ventanamicro.com>
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

Add Rahul and myself as maintainers for RISC-V RPMI and MPXY drivers.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 MAINTAINERS | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4bac4ea21b64..c22434a2756b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21397,6 +21397,21 @@ F:	drivers/perf/riscv_pmu.c
 F:	drivers/perf/riscv_pmu_legacy.c
 F:	drivers/perf/riscv_pmu_sbi.c
 
+RISC-V RPMI AND MPXY DRIVERS
+M:	Rahul Pathak <rahul@summations.net>
+M:	Anup Patel <anup@brainfault.org>
+L:	linux-riscv@lists.infradead.org
+F:	Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml
+F:	Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-clock.yaml
+F:	Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml
+F:	Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-system-msi.yaml
+F:	Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml
+F:	Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml
+F:	drivers/clk/clk-rpmi.c
+F:	drivers/irqchip/irq-riscv-rpmi-sysmsi.c
+F:	drivers/mailbox/riscv-sbi-mpxy-mbox.c
+F:	include/linux/mailbox/riscv-rpmi-message.h
+
 RISC-V SPACEMIT SoC Support
 M:	Yixun Lan <dlan@gentoo.org>
 L:	linux-riscv@lists.infradead.org
-- 
2.43.0

