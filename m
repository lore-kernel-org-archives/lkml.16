Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091CC2571D6
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 13:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746971003; cv=none; b=qAsfalm4eW9lXpnfz4THac+41bT/p06/bkI9vA9FpQnbtJ9b4daXYf1NPAlCbpe7whcC8Vq7lb3VsCdCv6l7xCV8JdbeW0SX/o08bYlw8xScLennkrniKzJN3uVX9QLnLiE8OuFfnISXnVeUn6ifN/v1LZtkkO658NZL6W6p9YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746971003; c=relaxed/simple;
	bh=DGrIKW6QLI5GXj0WJzMWfVKaiU3ubl+sUPYQLJ6Uq80=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y+URVEdprElRSqGZwNRyIPdjRXVc4NExnKgf8JAPRk8JFEs6roQCc1QkTHeEYcewS2n6OaefAViSCJHgKl7NHm3JGl2EBWy25XycniH7D4ayiWvGo5zJXJU5Q2g+sn8Vw82EXibspWTLGhQTzdZ7Hmekuv0zGAVWBZliDGpaa0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=D0/ceyjj; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="D0/ceyjj"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22fa414c497so42037595ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 06:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746971001; x=1747575801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xYGn3XecLxKlXcXghuizRd0ORyv4dXXBBqocKLMzEs4=;
        b=D0/ceyjj/QYLGGdm+n7zPKKEr6+WNeSJD4jliTP0+tsdOMKIQgW9I3xlZU63U6euOF
         ZZG1Rsk7L2CQtpB0RZ8iktR4UqZlSWITCrqePgn+sWAGZjXzGAE6uj8BIh4AAdpCkmQ5
         gtZXLus6S1IhBF50FPZ1JSXejnPsV+JTjmGgFX2pJAR0KC2wZgz+TCA9jQv0yCS5cW1s
         6RPKLbNxs0a1jnRIh1DI+bb7Usd6BEfCpCX3mexoFL4ChW0iV1hv7ExjrKjsz61d5+Jo
         6BGLDzkXEEFYHKENrdr4ERa9aaN9SwmW62PKJOZdaChj7/L8Qz1ymGe18wa3XP7c4opO
         qbjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746971001; x=1747575801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xYGn3XecLxKlXcXghuizRd0ORyv4dXXBBqocKLMzEs4=;
        b=q5NplfX4S0uB2QNadAh0c4HxuU9XUJdCloz0NBBRa5bEWIJHqDuoGoafZue0jmLNxu
         KzmsClt6ozd3z6yBuMSdCsjSW/lz2B8jS7Y/pOc1fSpmCtk8DSXASKa5lrF1ZRtrn5J4
         sISxnyc6yKQboGUOdf3+xEALP91MPB0gMnvbx1eUgcGIGFVXTY0DAn2hc0zHnq0rD0Os
         fX9oGKjkDy0yHNK4CZwWmY7snXs9alud/zKGTYBagDlZCwiAtYgA+zfj+OjXwLZXlbiK
         CASbssjaLXlVlWJUY67qg3QXoS2FPBz4CZ/EoQTWStZmRg16rVLASjEk8Sy6x7VaY5cm
         Vf2A==
X-Forwarded-Encrypted: i=1; AJvYcCXayPnY90AVvx1G6xgYmPc1uDBR/p/pPRkn8xomNwPMpHjU/0q8yEIqtWE/WU74NYLlcQ140HM+hsMJ5ko=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQONHdhcgOk+trVROcJvg3aCXam/JORNU1t9spPMErUOCZz9Y4
	OCzJLzTPxG/N+lojUYaVFl11OkZa8t6aQlQhYlZdR4Ldd5dulv4g0YCIWmcpAGM=
X-Gm-Gg: ASbGncsLTf33Yav2JteuCf/1C92sSBT2RpbU4HZbSdJ8AR/dTPhogzPID9acijm92d1
	yM1ug2G7rsSiqUeOH4Blw54k2PuaPDbUGqwf3JCn6+/vAVjYb9sn2DovdIH7Ny6UI42iHoG5/jH
	zb1v9czrTnl1RL9x90/MMDF5dq5JmFkjPQXa+jq+z91w+mZIeu9NZuEtXNSBPVlfoYJp6w0+p0J
	EJdAWOjByFAcTKoX/zY/eSXGactpT3FDKIyRdaoXwFkSxH8nGK67A4xW/BP9c80wuHtKMF51NIj
	VXfsmCnv8AmB+4INDxcQDdYr5hjKyMywV8/f0XIstM8g9SrBUebBBuUXvtVhcTDsLFOXGxq2RK8
	SxHjsIDqmqTFsog==
X-Google-Smtp-Source: AGHT+IG52LyOtdqyYBdOZ0QKQPhVZkpzaGbfXrQI34jhYPtmLfmrXHBFBAebuBhiCsLhxrZFt4LIYA==
X-Received: by 2002:a17:902:e94d:b0:227:e6fe:2908 with SMTP id d9443c01a7336-22fc91a8448mr169477755ad.48.1746971001231;
        Sun, 11 May 2025 06:43:21 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.17.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc754785bsm46665805ad.20.2025.05.11.06.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 06:43:20 -0700 (PDT)
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
Subject: [PATCH v3 23/23] MAINTAINERS: Add entry for RISC-V RPMI and MPXY drivers
Date: Sun, 11 May 2025 19:09:39 +0530
Message-ID: <20250511133939.801777-24-apatel@ventanamicro.com>
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

Add Rahul and myself as maintainers for RISC-V RPMI and MPXY drivers.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 MAINTAINERS | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 69511c3b2b76..46a0909a17d9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20885,6 +20885,21 @@ F:	drivers/perf/riscv_pmu.c
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

