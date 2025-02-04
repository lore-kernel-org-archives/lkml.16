Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4DE2066FE
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 07:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738655724; cv=none; b=YJrfaMAvznANj/T8xyuexYqFoVF9fQomIV/KyuDQ06KFijAa0fZORf5ivU07e0YLES+L7DhVKDtTdGweCQXkZKCNCgXzm8TOPIL881BdwG/0yGAlyfZP6K6rtNJ+lfEepxGjUZBUZ4ULnvwV4k2LjUYok8fJEhHwD7AfxJhR2EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738655724; c=relaxed/simple;
	bh=uce9NaG1FpS3X23DOslrodjhhQ3oLE1kQr7yQKAxN+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cP/sYQBs/zRreqj9wt2Tfo72eKNIxRnn7M4MPRo6W9zo3uuo4sMJzb/kNQnk+tVE2+X0hx/61d7j6OqPQQ3zZiOVMsKlIWQBpVblTXI1a9IMsP5aGzcApC8YrFXZ1y/RwjRrH+c4PHCJoQLwrXnM44MBSX5+GktH+OQONIEnPMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=jHQc80fp; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="jHQc80fp"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7b6ed0de64aso455749185a.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 23:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738655722; x=1739260522; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZnRpk/p9sKuCOyv2KZjNLOO6T+xrx1m13lZc/9SNpSQ=;
        b=jHQc80fpw/d/7vsisayfgMG+sMq4/UNkThpSj5mpoAcOe8S6yN6oLbdhxKrh3JHq8z
         dQPptIoeIWMR7oUAtMszlP4303UJdv65vPPhvfi0wfCQm1ICH3bGu4lPTMHwB8Lln5wo
         51UlHgpwr/aXGfbl66zs6fle7t0Ka2sOcYJgqm+XlnhdkawIsG22FLHbj78xIL0CY+9t
         BB5nJe/YBF6LJoddvD4PyvYr8REnTpJsgLt1U4QPP1u7+lsqYTW7fh8zV1lzce8C3zEx
         Afmuyx+EKJGeBSH7QO2I6wggF6WwWRZvoFdBNsulf0fFmuubdNXK4GHhNW5GPj6r2uU8
         qQnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738655722; x=1739260522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZnRpk/p9sKuCOyv2KZjNLOO6T+xrx1m13lZc/9SNpSQ=;
        b=Yra2ftcXhcWiBp4RF1DavEX1EeNIdhwm3Kc6MADB7Pk7wCYb4W0FQ4lg/+jsJNONiL
         Qj2OSFIbT3HB9cLta5B77PH7TVZduO566OEvujjTgfwoA1sXWvsAHAjXgf7p/WbNavm+
         CRDVQTKn2ZPbC1jskS9Rz4AciFF5F1VeVqb/P/4cHmDHZ0fswKxPsoqe8XsCFVYJrdJb
         QIzAV0+fR1qisOgmUuzBsFNS29+mAD4BhFOWfG8/PDL86b+smWNYI+Bgqas4UXWzrk/+
         bC3YfKyPLeAxj/+BfJ9x9Qm88Lv6L1Lne8vRthKgMM0Kd0SxqWfdppvsajSVB7W51XL3
         ESuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAeaGGjgUw5IXUJkNaoBxO8qsKTl+D1fIZNOTgz8AcWG3XDY256H7loN/OnOoR4stdaQO7xBFrcRJDqi4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoHWx7lb55l0gI5n2/S2ZHGlF+jhp6+uibruc3Hw+kI0Oui+yU
	JnjDk1P0zVIKy3Nvr0ZR6goeFT4Lc3rOzvNu1S2bcL3nkZTHyNgj4r/Kr8lF4cI=
X-Gm-Gg: ASbGncszLIDL5fcQcCbGlVt952+vKdYBSP88W2pwAw2zqFai0uw+dFRGLSiN0VW+IPS
	GN0xdFUC20pYtoyvEpTwYDfUpF1Gz5dW4RxEfKNSIs8KMIiNCHJQ0M6WS1jVcz56w6uYKABsjZi
	vAaoR4trYYHSmXONyqdSHjB5QsGDcU5uWftVxFQO9T6kZAVuGZWKKFIi95i44GUdtmmH1xruPen
	WRC8M2WzhX06pty+8XoJNV8eoq1zetJXcAVRejW4SJBKUoQmOvSmJ05FgROZSJAWyS4+dG/jMcQ
	b+Tcr22bazAjXq5C4sP7nKxKar0pexjByXzBXpymIlo2Zj4lE4J5NN4=
X-Google-Smtp-Source: AGHT+IHxtxKg5RW+0tra7ErqT2l5lv/l4qXvXUJ8U9uiGwIl5QtJCesqdAm7TRDDQSFPGUYW4TnQ4g==
X-Received: by 2002:a05:620a:1993:b0:7b6:d710:22ad with SMTP id af79cd13be357-7c02eca3a0amr362876885a.27.1738655721837;
        Mon, 03 Feb 2025 23:55:21 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a8d05ddsm613373185a.39.2025.02.03.23.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 23:55:20 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v3 06/10] RISC-V: Enable GENERIC_PENDING_IRQ and GENERIC_PENDING_IRQ_CHIPFLAGS
Date: Tue,  4 Feb 2025 13:24:01 +0530
Message-ID: <20250204075405.824721-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250204075405.824721-1-apatel@ventanamicro.com>
References: <20250204075405.824721-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable GENERIC_PENDING_IRQ and GENERIC_PENDING_IRQ_CHIPFLAGS for RISC-V
so that RISC-V irqchips can support delayed irq mirgration in the
interrupt context.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 7612c52e9b1e..3c19e6ca832d 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -111,6 +111,8 @@ config RISCV
 	select GENERIC_IRQ_SHOW
 	select GENERIC_IRQ_SHOW_LEVEL
 	select GENERIC_LIB_DEVMEM_IS_ALLOWED
+	select GENERIC_PENDING_IRQ if SMP
+	select GENERIC_PENDING_IRQ_CHIPFLAGS if SMP
 	select GENERIC_PCI_IOMAP
 	select GENERIC_PTDUMP if MMU
 	select GENERIC_SCHED_CLOCK
-- 
2.43.0

