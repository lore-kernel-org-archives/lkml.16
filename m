Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06178274B4C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 07:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751612933; cv=none; b=MyHcPm/I6YqQtbI3hFhf2TVuuGhIXQqdD5n/68JttIwUSK2QffpVHoRU1b6hGB26z35c6kOu4M03wqFrxK57Zt2n1RVuWhXlEKh69vwMEPbSdsGshGU42xROvOuQHH/+PgJjiEaAjRlBRRYjPU9EwYOHqrM7T5l75HxHwuWMsPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751612933; c=relaxed/simple;
	bh=SIZVTA1dBlDgHWuqKkMeHUlssl6BYErjNhZuMkc2v6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K5IBiMG/VaBA3D7bVQpAVLPnhZO19ghx1K3XrMT0BBfIiCm5/syVDP8xpgDee/ovWG9XOzzkbLl1wMizY4iw1ePcpBDbtsXSbKuyVssDtQuA3+qRgkD6yWy4UAYoBgmTP8s1C5ieqX9EEDf5vMl/1CsoKltUwrw1Z2AuSZVR2HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=QS7eZKNM; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="QS7eZKNM"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-af6a315b491so601021a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 00:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751612931; x=1752217731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t84+O6WBdBY0SCc3BtWc+Gw5ZYyMJomoxrVu9jQtsgg=;
        b=QS7eZKNMY53hyvRMH+ukGp3t+sCVW0o1dQvfFYSO2yAMilWiYARuctZm+wN7/mz4cm
         CEQA8E7/xl1elgQQs+2oO7e39Dh4K3iNR9d07fc9dpemuDqKAETUpI+9ppFATdAu7hoW
         ZjnPhCJslEGcp/jXrm5CIuUCVjhhhly4P+zv2B1k1FDawfW6ftPu2rdbAf290EuseCxd
         7pHJcFaqA85MPFw1Q3/y9i+SYoeQfqqPFjqboQJ6McKMPBJMBf6gImsntek/hhpCtdah
         JoRUSyUREz+oeDYp0FRxrTfudn0SywDAzr2wr8AEfAk2rIgKbdEP89HOzZZi8WbxrS/M
         yq/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751612931; x=1752217731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t84+O6WBdBY0SCc3BtWc+Gw5ZYyMJomoxrVu9jQtsgg=;
        b=QHKdPOhTTf96FcUMG9O2GSB+hAD6N0IruucEZ7n3SecXS+5udz0hYGQ6BFLVFQuKzJ
         KLV5F8OdFAL69bHTfIczUT2F6R8T+Lo0VKSCaABrfcfBD2G1FghWxbAmveqL1IqUPfK1
         B2UeL8ghGkkiEVzzP1z+kZEpYlHPh+UR16ZsdsMFGfEy+w7wHl/MJ5MUBoJ7p6DOIr0B
         rgIgW0A8oEB0GkdaIfSrJ7cq3UsASgJBl639RPWU7Naqg5PGc3JMUk9ORhvU5crEvXTP
         GAG8TkE7u6CcXRotEtU+lSLhljkUOvtQfosffsET5sKp1qpPiHODd5/hwOF8HpXUlaLF
         RNFw==
X-Forwarded-Encrypted: i=1; AJvYcCV+IWB7BWXxljePdAUfi1dhZ1xDgezxD3xdagTuROqbRB9QR6LOSgSUAniZxcP0PPeR23wBVZQgRXARnGU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo7vdbrPouFw+oPLMVi4vGVAAVKQJKao76LQcEg6FppTQvc7ws
	wZaI/tk8PP5SEby1G/j8OnPRrct4UBIttJkDPF6hENlBbFbEXX0I0YYcO5vuCjaVMrc=
X-Gm-Gg: ASbGncvABLes69O5ykIMejtGxWn1mS7Zi6rbwL2tbYDaVRJ/IWGcuHKm+ja6mU5BWTl
	06FNeh0rqFTG7zRM4dzKnlgrgod/pDe3UX/uBqeEIChpCFrifove2kHv5VHBRA8c1zCIcuEZatH
	xd1XxilTfm0udhmDrPovncWlK75xbVXVi/ufkJH33iC8fcc+MudrmDcXoX9oqOJjjXUo4Snh3OL
	cPorQTZ7iWd3xA7S29ndvsZ/0ruyoihBjeV3qWZRjIlXN4NSDISCggWW4Z+aJi++35yRRXcHWu3
	PrvcVpIh7zEODRZAZYZzHm43QWqoNotfG/uNllydQjIY24MoYYX9+4JtVn0fc5w0jbD+A53V6xS
	IgITxfizRI7PtxueF2UMn2j7A/w==
X-Google-Smtp-Source: AGHT+IG39MvNAhukPFseFzyGr10vQC+nwykVpIMjUKJlMsDap7lt+awygLPFDJM3EBPrK5lNZv4S6A==
X-Received: by 2002:a17:90b:2647:b0:312:e51c:af67 with SMTP id 98e67ed59e1d1-31aac433b33mr2347184a91.1.1751612931087;
        Fri, 04 Jul 2025 00:08:51 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31aaae59a93sm1358697a91.12.2025.07.04.00.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 00:08:50 -0700 (PDT)
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
Subject: [PATCH v8 24/24] MAINTAINERS: Add entry for RISC-V RPMI and MPXY drivers
Date: Fri,  4 Jul 2025 12:33:56 +0530
Message-ID: <20250704070356.1683992-25-apatel@ventanamicro.com>
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

