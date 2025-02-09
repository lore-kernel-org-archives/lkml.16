Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337046A8D2
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 04:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739074678; cv=none; b=H3uadDXoDeymCEaXzyVDwIVSK2ebtndUh7GvkLToSi7w8mMSZKgRlVWGs4eMSY5/jX+snYaQTxR+jds8ZTZAgGk6d26nTT6c1UgT01OJeVaAgU7p4hqwYrIDx1q7heCC6HBLkACVmRPvo3bvd5d42cMLqy68Rfd7XrIkMSLIkJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739074678; c=relaxed/simple;
	bh=PxpxF0dUlwKn44FGhlpT2SXXiblCpU8cCNLnLI9M4ac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TgPg2hWG7plYOBRKegYoMgr3jfvkBL0mMGuDQC3OFh7pmhbMQM/ePBMlBKB8RUmxxwduwrptnO1fwsC6UjDdLeRc+3o90NumSf3C47uSyw7YCpe6ByQBKOuFwY9wZQpNM31Pw/r4gGHxe1+7i9ochh6pNElHvVopLRZR7EYH0II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=n5NVt22O; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="n5NVt22O"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2f9ba87f5d4so4708500a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 20:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739074676; x=1739679476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3sE/PXdSSokJ0Zgm0Fk4Pk1jUj6qdWvd3FyfD/aEiAI=;
        b=n5NVt22O7pTMiV2ZjJ1czreJR4z81gV8mCjG9XyP6EeZjIQZt0bjrquZ1/fbrF5EU/
         m4j1pueOk48urnuOdkCFdLMYgKvyvV4GzjSQOKx0INU16JBIlo4pFlmW265YZCH1tuYb
         cmEwBz0K8NMDFrGpv6U/EiDCQu7DYlcqgGzhKTBcjERtZYZAARV4WCwZLCS490ech8k9
         fN76pzTnrPAJfHojqAgja7/WdnITyZglLpWQoDwp9UM7IVJF3g3pfX/Kb5yUoyIgKxCL
         KZ4mHHfqKY8ugNcU1JP2r5Ka4nLq2n8iehkQWofYz2dp/pTsMH+gDtx1iPv0G2ut1F9n
         UiTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739074676; x=1739679476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3sE/PXdSSokJ0Zgm0Fk4Pk1jUj6qdWvd3FyfD/aEiAI=;
        b=kuwit91B8SXl+HMctM4JdypQbrnIeY+S2ROzrK7yoVSg+EcqU9EALaiXsl579sfX3/
         rLLLE9C6jHKOX6oyfimuQ5nUswLB1EvT6/AIw5ykLSifRm5UAG7KYcnJcCKhuSKre7UP
         Kp+jAKbs3dDkuT2vH8UoHIucoj1XmMby04csVu6fYAJBQ+gM2kkFU7VhwmuZdNkjAW5n
         TgI1d48Kpr0WdQRP/N6SM/7gcN00yhTD7yYfbaQ9jLWsrjcZQnP8kAMz8RL0NK5HaHJ9
         Z229vZWep7No1EpcdMb0u3mwbJ+D6DdLnUhQfB24G5rUw3eORV0g1ho8UITxMZu09oka
         HEHw==
X-Forwarded-Encrypted: i=1; AJvYcCU6a5I3XW30eADXwfO+iwS09eNmHAhcasFKrG0ey1jWbRgYc8Z+i5pgV0wQD/OCqez47ctQUclPfwkqRXM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcETWM8F767pbnTwB+0sk8iiBYDPAji29KsFXd/8BMTKJqnDGb
	YHp+fVp9GfFmOUWW4hkuk5aOR0nzk+Tbm3NICOUNL0JajPeTsVGOFnwSrRWCBrE=
X-Gm-Gg: ASbGncvCmOW7iLrZMADaGMzpVdlUhJiq0TUdDWKFKtUqF6Hu3zHz7tC4Kj+htgFXYUu
	1KbQ6YuldEZ81TBLEMVXX872JESlFR6eq6szImno4N4a/qHYIDxa6/XdN7XCcXPF7zfNbdlPOfj
	rNIDJR5WKkqsgei4NXCABgT3e16zYl6FR77iDIJ0l3LFJoki/joXdESm025Bi6TkLn7a0e6VphG
	Zeeaxtoi3tzFGlyMueuPcusp1GC7+rp7dnxyGqPbYGKIRP32cRUOc/wcTHva/ytNt/9OMMtB+jn
	5f52IsaCq99gtiExEFRK7QCJXF7S6Kg9nfuMHwrghON/m8I3B/SSVNo=
X-Google-Smtp-Source: AGHT+IHDq8j70VgdWYD0/5rZSoa9FGuz2H9SOfW3ipfEG4foQkrNVKZyKea9+xF989Gz8oAitxsVGw==
X-Received: by 2002:a05:6a00:a15:b0:727:d55e:4be3 with SMTP id d2e1a72fcca58-7305d463732mr13313591b3a.7.1739074676324;
        Sat, 08 Feb 2025 20:17:56 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73073eba116sm1898410b3a.124.2025.02.08.20.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 20:17:55 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Cc: hpa@zytor.com,
	Marc Zyngier <maz@kernel.org>,
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
Subject: [PATCH v5 05/11] genirq: Introduce irq_can_move_in_process_context()
Date: Sun,  9 Feb 2025 09:46:49 +0530
Message-ID: <20250209041655.331470-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250209041655.331470-1-apatel@ventanamicro.com>
References: <20250209041655.331470-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The interrupt controller drivers which use GENERIC_PENDING_IRQ
can move interrupts in process context for downstrean devices
which support atomic MSI configuration.

Introduce irq_can_move_in_process_context() which allows interrupt
controller drivers to test whether a particular interrupt can be
moved process context.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/linux/irq.h    |  2 ++
 kernel/irq/migration.c | 11 +++++++++++
 2 files changed, 13 insertions(+)

diff --git a/include/linux/irq.h b/include/linux/irq.h
index 56f6583093d2..dd5df1e2d032 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -615,6 +615,7 @@ extern int irq_affinity_online_cpu(unsigned int cpu);
 #endif
 
 #if defined(CONFIG_SMP) && defined(CONFIG_GENERIC_PENDING_IRQ)
+bool irq_can_move_in_process_context(struct irq_data *data);
 void __irq_move_irq(struct irq_data *data);
 static inline void irq_move_irq(struct irq_data *data)
 {
@@ -623,6 +624,7 @@ static inline void irq_move_irq(struct irq_data *data)
 }
 void irq_move_masked_irq(struct irq_data *data);
 #else
+static inline bool irq_can_move_in_process_context(struct irq_data *data) { return true; }
 static inline void irq_move_irq(struct irq_data *data) { }
 static inline void irq_move_masked_irq(struct irq_data *data) { }
 #endif
diff --git a/kernel/irq/migration.c b/kernel/irq/migration.c
index e110300ad650..5acea2ac57be 100644
--- a/kernel/irq/migration.c
+++ b/kernel/irq/migration.c
@@ -127,3 +127,14 @@ void __irq_move_irq(struct irq_data *idata)
 	if (!masked)
 		idata->chip->irq_unmask(idata);
 }
+
+bool irq_can_move_in_process_context(struct irq_data *data)
+{
+	/*
+	 * Get top level irq_data when CONFIG_IRQ_DOMAIN_HIERARCHY is enabled,
+	 * and it should be optimized away when CONFIG_IRQ_DOMAIN_HIERARCHY is
+	 * disabled. So we avoid an "#ifdef CONFIG_IRQ_DOMAIN_HIERARCHY" here.
+	 */
+	data = irq_desc_get_irq_data(irq_data_to_desc(data));
+	return irq_can_move_pcntxt(data);
+}
-- 
2.43.0

