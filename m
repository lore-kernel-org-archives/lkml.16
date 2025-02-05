Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8174E1D89FA
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 16:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738771247; cv=none; b=NBJsbsSLLbXIKy8FTq9Zh13criLEE0UxEJKtrdWIFPTrAS8IF46YqWWYH+N+DxtjK/07CO8fsBb8K50zfw21rgMWX1517Q8C7E3BjzIqFa7BGRogQopoLvDRmFRQplay19d/XU9e5GhROHZBFA+0kRCzkQlCmuXwh3WrrTDmPlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738771247; c=relaxed/simple;
	bh=n4slH+wgDA6MSJsnkDzYIOL0zzUU8vlxw6wGI5nPdQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J4qDy3mBPHE+n7YT6GIJccowGDF/murejSs/ciexaMPVQSK5ANMbnCP4BK1zKF+A/tS/isH25T/vJZuYLncXCIARRtRdozUeAO4Q6WfDBltTpF4qbF3IEjT/fcOtWXfHBYVqiAStjplT5wwpoXthuQlZfCv+44xOVrlsD/95Nic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=ocFTyz97; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="ocFTyz97"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2161eb95317so124803695ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 08:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738771246; x=1739376046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JBZXTbuS/jzxIISJXLRWUHAJ1oANsva3E4CzlwWomJY=;
        b=ocFTyz972UdYAJNmYUXuszlfBQkZ9tqYKq+v9kG3O113oYEHBYfvdvq2ZvwpeWGG5C
         u7bimYklT3LuiXxnazwgVvQr/NnfJjgtvXPOqPljIwqAc8vDVc/RWxDWQ7+Sttg6IQ7u
         BtLjOYhCkhlCDOc1rECxfKNofkK8teLlOSSWs9cAX1cRwZbvtOR50tivMtNiK/joGQpq
         eLyL3v8aW0sGHXigwSoIsuPha2XIhTHXPHkRksInNv8AlHIXNA4mJKzULkgBmsJhEgfI
         iupN3ndMQhTXmYubeeZrBIKAOhtswRDRmW9EnLUcqtm4HvJVrpAPWOTQpT7ldtZUCbzt
         PppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738771246; x=1739376046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JBZXTbuS/jzxIISJXLRWUHAJ1oANsva3E4CzlwWomJY=;
        b=JfiIEeQeuyPXlYIJV3xywMDBhZSc4Vhu/bcHSQSyrsqw07nc2MGpVtwSFqpjW25AGi
         44VJoAGo7WP/Ssl51DwiH6PIOTjuhmmVOUcbnN90jtUsFBDgCFbmqOM9kDq4qUmr/iwI
         18WSm95Yz1m+7sVfAmAnMmFXQs8QEt5IDe7BE2x3kYJEvCOLS1xwsrELUhAEJJoRU75F
         mkiAwJplOFAJeZzAQpEYMbn1anJEwXzX2auE5YfRJcbIlgx/+EkFoPCDXRY9lZzVm7F4
         My2NUW8pMQ0QglCOUipN7QNfk24Wtp/JYoMZomNPRET1Uu3fUsmqCoPwPJNr2sILpX9N
         Kt6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVYhnFrqPlUXwZafUaT5NA4/YTzNbpkZW2CofuA7vYU/G2eM4zp7SlgP9wSFYA+yPMBPO1hM59/CRjImtU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv9fowqpgA0CHB+rfEN8VcGieJ67P4CyL9Ox1JfEN5uCqwGgqY
	xMiY3qHRbj3/QGt99Pq0p3j32pkJ1kp4KDzdaAaxJPDvfC5WsrRm0bQUFebFWbI=
X-Gm-Gg: ASbGncs5k/y16vTDoM0bvF9UjKDzGDlACAikiGDLWFrKiE3UmwheH3wdU0fQRYNbCBG
	SL0+hZsu26ypljR3XhQgXuka9Pjdv6pvUNeLHUIC9078T43PI3ineIkHb6zJp4OxLx3sJ2X+Qb4
	4jKKNTHaAac3N/JEOfCWCUClA9gswH4wplpJX73i5WtTBB+5d8Jl36k6NYJHkHQr2m0+gawozxl
	WhVt2nCMkyENuNWOuuBD7dJgXo6+dI+wVQMIbFA/BTHNXO4R8Dt3RR23EPUQmrRkCYNCTfz0hLs
	G9+Q6IcEOF2z3ZV6mjG6iKfC0QXo22E8HQ9eWvk0q8ing7o+BbDA5lA=
X-Google-Smtp-Source: AGHT+IG20/n0MlzHXXlDX+eid7Zzs/iscNjRXbzQaZokFNcd/sGA49bK8WlZsq67OCE4wBBbq10xxQ==
X-Received: by 2002:a17:902:d2d1:b0:21d:3bd7:afe8 with SMTP id d9443c01a7336-21f17ed0ee5mr59541815ad.49.1738771245657;
        Wed, 05 Feb 2025 08:00:45 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21edddf883fsm99369015ad.4.2025.02.05.08.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 08:00:45 -0800 (PST)
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
Subject: [PATCH v4 07/11] RISC-V: Select GENERIC_PENDING_IRQ
Date: Wed,  5 Feb 2025 21:29:43 +0530
Message-ID: <20250205155948.81385-8-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205155948.81385-1-apatel@ventanamicro.com>
References: <20250205155948.81385-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable GENERIC_PENDING_IRQ for RISC-V so that RISC-V irqchips can
support delayed irq mirgration in the interrupt context.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 7612c52e9b1e..a32f39748775 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -111,6 +111,7 @@ config RISCV
 	select GENERIC_IRQ_SHOW
 	select GENERIC_IRQ_SHOW_LEVEL
 	select GENERIC_LIB_DEVMEM_IS_ALLOWED
+	select GENERIC_PENDING_IRQ if SMP
 	select GENERIC_PCI_IOMAP
 	select GENERIC_PTDUMP if MMU
 	select GENERIC_SCHED_CLOCK
-- 
2.43.0

