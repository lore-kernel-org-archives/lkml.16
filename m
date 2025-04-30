Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976EB25A2D9
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 12:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746017321; cv=none; b=Q3xTQKcDrih3oSVzkntrX205LeGZ66svqX9pDZZx1LsiRSmkU8tEXalJpXhaqoaCg9HTOR3mNE/hwQAxAo6zdrOeJ6ys0RomKotZ8k+zSpLuermotztfLE43LJGR2LYyfNDGt/4FIl5ZeXT/qQrmHNg7W4979xcnZYj6lCOdnmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746017321; c=relaxed/simple;
	bh=QeRn1NU2eea+J6yNvboMoLakg9XsO3BWpGKxT3f5vgY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xr4Il6/NvG+uRXvDBAfgC5gpgmznbekJadgwRJH7U5ruGk9tTu0QsPlyxdI+M370W0BQvjbwDWxMO0a604GeBsJtkxACHQVGcgaT7DVJ/EtdrKDRtAcGBjGeKgMYyWqOy8p5bJ0rKpWimAmfq6XXl1knPEYs5S44QXu5O/M+vB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=ePaCClld; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="ePaCClld"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39c14016868so7802732f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 05:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746017318; x=1746622118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r87uiOS2eZepV6da/asr0cY6efgFF096A1rdC7Nhh6U=;
        b=ePaCClld8Hthh2szr167GP5U5XUp+WNuGU0ZfZ6kL4P/lJ9zyiAXb6YUK7jghkFADo
         XlUVHBIKy2SkCm9dm01OL6vluG4miOxUUMEaw2BffVJTNgrYOy0WdjN3EK10kMj/Nrx2
         /ZaiQmgd3EiYqXvcHO1ny9ZoA8qk8PyjgevdvJYoki+XqMmLxWkJ10qL5gigD46Y1Mgi
         W2ViH1VGrDs+3tyPvXN8Jtm+m7Gt64dxVAHuAOR4HeTQ2sM3D/R+/IFLVLeRoi9UKxbK
         rDtYNiCdZ8TqfAQ3BaJNMjRY9arOlJMYcqqf8lzNhZXPdByfqtHyCMbs4Dy+ySucw2R+
         gRGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746017318; x=1746622118;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r87uiOS2eZepV6da/asr0cY6efgFF096A1rdC7Nhh6U=;
        b=Q2bUSzjmiO4Z/TxE8JyTqQeLZp2QzBUFMDM1AROawMo5gnvNH/lLL70rItUsVg305Z
         wrZRyx2a2jkILTDQ4V91o6/VACbZuFsooXzxJ/JpCnYIr5Lzv/M7ELSZZYe40bV3z7Gt
         wbWSbtNOZZ2Ru66ykvUIltd33xAEBKwWZaTqFDrEG+tUERd8QelDxj2lM1pJzhmWZ5io
         B3RlALKgg+WFNeg+mcnh+Usqt+68/fxFw8FG88/D1c36rXnOIQSw0t70s2bIWbrTG3LM
         gGr4gmWDxTkaLJJ1dlghYgZaydfNoIHt/GOwSjS9mVm8P1FZlfQ2xPwOS/kwZfWWdEQ2
         7Yow==
X-Gm-Message-State: AOJu0YyaIlcqo/ozasAT54+dyUpB+TYehMEy6w8421JdeHE6WcZ+Bgg7
	owsz3uh1zF1QFoMim7rm/0SrvjYlgZWuuO2n5etikcnlPp0hmfx5rxTXPyHhviuV8q6PDIX665Q
	Pmso=
X-Gm-Gg: ASbGncto7iKx7bKDQJXg0KimCTP2zSBHDher7xeSEEK8tm3BpNc0411+mmRA9CluJQ0
	WLnt/QuVQ+V+54wETiYzHTjJ/HGyzXMfWRO70Q4ZMFxcVjvTqI2LQVn8NPrFn3oUHrr1euBOJ/Y
	OnW2sTKlCDrH+PW9Zo+I/cPW12tsJglUDYZE2zvzLTa8mSxl7PCosAxOcdtl49uwR51MPIc/RVy
	0W3RFQ1Ry8sjso13U7GvZIrv51ETcpKQOcq0vJajTPPM7z+Gg1KsOEG+yJvQxwNHDADXrhPa65H
	FBQfHNj0zGivKbgSsWIiU/u1xWmT
X-Google-Smtp-Source: AGHT+IH+MPKHXUZJF7idCbMWvelbL3DnTQQbuFuKaiLNPpRAhogqBOwEjJB5QdJ/DipqR8WDBm6WcA==
X-Received: by 2002:a05:6000:420e:b0:3a0:847d:8326 with SMTP id ffacd0b85a97d-3a08f777d82mr2987308f8f.25.1746017317749;
        Wed, 30 Apr 2025 05:48:37 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::f716])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca52e5sm17233581f8f.36.2025.04.30.05.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 05:48:37 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-kernel@vger.kernel.org
Cc: tglx@linutronix.de,
	18255117159@163.com
Subject: [PATCH] genirq/msi: Fix MSI domain debugfs show
Date: Wed, 30 Apr 2025 14:48:37 +0200
Message-ID: <20250430124836.49964-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

irq_domain_debug_show_one() calls the irqdomain's debug_show() with
a non-null domain pointer and a null irqdata pointer
(irq_debug_show_data() calls debug_show() with those the other way
around). Ensure we have a non-null irqdata pointer in
msi_domain_debug_show() before dereferencing it.

Fixes: 01499ae673dc ("genirq/msi: Expose MSI message data in debugfs")
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 kernel/irq/msi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
index 5c8d43cdb0a3..c05ba7ca00fa 100644
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -761,7 +761,7 @@ static int msi_domain_translate(struct irq_domain *domain, struct irq_fwspec *fw
 static void msi_domain_debug_show(struct seq_file *m, struct irq_domain *d,
 				  struct irq_data *irqd, int ind)
 {
-	struct msi_desc *desc = irq_data_get_msi_desc(irqd);
+	struct msi_desc *desc = irqd ? irq_data_get_msi_desc(irqd) : NULL;
 
 	if (!desc)
 		return;
-- 
2.49.0

