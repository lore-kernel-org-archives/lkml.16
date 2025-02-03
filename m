Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816DF1FC7D6
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 08:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738572774; cv=none; b=aTRzPUvJbF30z7x6M4iWD+8uXNTEaF8HKoDwiQNoR0eftfVHo/iDOok5s5wuwCk5bcFLtJLPSJvwg169bZXcPTguXeO5/rxUo3/MBTeD8E04WfLhuNqMUkA8ocyB8ICtcU2uxTZsmaUD8+adIalaeVXGNKzSC3qX3Z0doeU7pyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738572774; c=relaxed/simple;
	bh=22AgTEVKq+xXA4vNaqP0QKEUOoUwv4sTkP/v4MXPynA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jZ0CVzMWpJAh3qKVTAlLs+qKXyrMbNpKk+/VAzVafRORoO0W0q7CZ+Dz6+pV1Rwq6+3e2lIkoiX0oSA8uaChKRvGNTTyDp8dfpBQ76ujt01z2a1Lr7jNcKE54shdLkumuZFW6olxJXV8Rsjrl/Sv+wzeRr+gLxGHrKl2aHOwxkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=dUANwQF4; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="dUANwQF4"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-46783d44db0so38916951cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 00:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738572771; x=1739177571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lrS6UZq8voK5d6I6M8hMOQP+PQdCTVat6aZNVhGKd/U=;
        b=dUANwQF4WM1HeceqvS2bUw+eqQiPF5DsiLySq1rPsHRCOEQU59r++p2bF/aSpadXyy
         BPcCpv0fhgAYy+yVwm4zp9fy0YkGbxUkA97jXrPAJs/rptxC8OjqvG8pqvFqi7Ou7LSy
         fa56H/seQ5tnGEdApiTcCo8moYGVEgCMZjIMesiKlbwO167f7oy5Uk+Nf4/heCjIINZY
         RvcmBgZk+h7j2Hxz7WyHZSSkUVk6tPe5tNrF2bg11wOMkwu98/vQ+qmDsV+EN/UKqCJr
         V0KfwKAM95lIwG0gd17xZFxynfYBMM/QOW+JgST/xZeY9CJ5zFk24UAwn39/2a4e6ljG
         Oa2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738572771; x=1739177571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lrS6UZq8voK5d6I6M8hMOQP+PQdCTVat6aZNVhGKd/U=;
        b=tlMfT9VwFPQcVPqmH1rI7hHRHFY2t3LPZjTTZ7hwB4Ou/V34l6LVPsoCMA0dfSTIBy
         1Vgow2vlnVLFfwncmbsqUvMkaxFua3tV7auzl/pxeXnr6hhfFkU0CKmaDzJtoUu32g+/
         U99G4KZzikYc+d6rg2lS95u9ZF7p27tK+YKaSG/6L2QecaO9CQG1TfXx6E4oKWDcL2al
         iM7EFZgX0RSZ2iMG+LI8+H+sK9eZGnjqHeNTHJfkjkddJgxXxRcuLV3hyUWni3D2FvAL
         Vvm8h2l3vIAUuwq2One3AlSzzweHRYST2d6biK8lnYR2k92CW0BhxOB5SD8mrZSeuaXf
         V5+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXi1V9JfH+vg+HQsxT5LhWK4yM0N2yKMbwIc3UoSttptDa0hNMQ77w6jCLaG3tzJEpykRSJVM1ucM/UUkA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlE7A4ShSLbsB6AeTmqBSafBW/ERl1cwDxT0w0Woatz0ZW34/y
	+6QoGNINsCOgzAsbJpz1yXN9MTbWd4xj8xNoJseyQzOgRfDMTTVWzeLH/jAxqmg=
X-Gm-Gg: ASbGncsgIBhRlecgKbg85lR4sMRhyEK6RT48Df4nuqr9dQHNV8KwfzUxOuv3kJxeyXK
	pGU2arZDfGx5CtHvJ2hxrauVtJ+iUBIb/QnrP5LioW/Ya6uGqEQZKJuWdsvjG+VrxaTqFH/f1CR
	ewtjhVUK3+VEAXwI62qizU0Pfa0GSPW2STNkbBp0m9aePswDgHh+NIBH/nw9SKf/+ibGTg5Stks
	0jHQHezIMRpFw5WjoPogRgFlOa2SN+SLQry7BigocQrqLYAwuz9IZX+wNSBgX+wE2u/MODgx6mn
	LTzjOawpQAUsYfPgONb3NvAAsHmg5xNtMatGj9eIOtOz/JUuG78zDT8=
X-Google-Smtp-Source: AGHT+IHCJxve5T10aPiQPDTrvWu69tjDV21FWaMmTfndSVMbeYY2fptctuonpJUVJro58XKkYYFZeQ==
X-Received: by 2002:ac8:5f8f:0:b0:467:672a:abb6 with SMTP id d75a77b69052e-46fd0acbcebmr285604751cf.23.1738572771412;
        Mon, 03 Feb 2025 00:52:51 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf0e3089sm47657911cf.46.2025.02.03.00.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 00:52:50 -0800 (PST)
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
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [RFC PATCH v2 17/17] RISC-V: Enable GPIO keyboard and event device in RV64 defconfig
Date: Mon,  3 Feb 2025 14:19:06 +0530
Message-ID: <20250203084906.681418-18-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250203084906.681418-1-apatel@ventanamicro.com>
References: <20250203084906.681418-1-apatel@ventanamicro.com>
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
index 0f7dcbe3c45b..06265b6febba 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -142,6 +142,8 @@ CONFIG_MICREL_PHY=y
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

