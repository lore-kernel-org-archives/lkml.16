Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF1B27703E
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 17:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747242812; cv=none; b=HSfKzvDR7tVN8qIrVCBkOxxgtipiI5nJFZgdP2fvOtb/RmS+Mj9HoYsMlUhRQqiwyAQ5iJk+YFRsP/Al5RsF5TCvQamuF4WXQXQxurONKQhiChZWzFimi6WwH+ZT8LqC9OEMu7xTvZt6uJkj909hUOG438hFdHmDM1fbGa9I0q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747242812; c=relaxed/simple;
	bh=1W3PcA8bCbg+zejQozgUTRildrayKUBNtPVVXezDAYM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZASOovJ0Bp4vDGoZPmap1l0IElR/cLX1rYXo8GWxSM5yZKhdkHa8citK6cEn9YPEGyrZHg9o1xpZpL/1pfzNhK6QRcXz/Mhd/O5k0F3LJs0PvYntJjjU585qAm5I6rSKJSLWdGc9B17s+E7RotU3/Snmtfbk5Y5R90RIGjw6Kac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=uyYA6A9q; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="uyYA6A9q"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-30ac24ede15so138889a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 10:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747242809; x=1747847609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DFmrqNw23zFWte6KPawqZJqj+5gefj3fndfHRw4esMo=;
        b=uyYA6A9qnA2zDAHWZMdgeI1xsqB0b6wj4itzplkezunrCXZXbnZeH3r7n8VIjyUfZz
         RIyA5uv2Z5xXrZGw5gHrrDd2yePHT6OQBnMJevPsksLb2cRzaFmTiJFlA5TcMe7rN6OB
         F/TSYXerp3l+0Qk0aqIkidYOZlprU1935pG8tH5nhcGfmUU8wMc9bR0g1XRG7HDCxWZd
         DkYRJv45mayKyNrdLQv+Z83iWUhMcaHUFgBdZ1eprTV7ERSfyQFqkCXIMCWTT0PMm5gF
         HDH/i3uejqmDds8T2FF1WM+ixqu15jv/57R6aRm/p5L+LREVzuPmgVJDN1FnBARdn+RU
         HqEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747242809; x=1747847609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DFmrqNw23zFWte6KPawqZJqj+5gefj3fndfHRw4esMo=;
        b=nM2I0npTD+RMVPyIkbrI9DZGWZXJ0n1vMSv2fl6BDs2FSlghYQ/3s6IXcsbbHSzxON
         BlrSqwOl2w0h1E5J8+rfRTvLhK/3HrZXm+9O2e1+V4eeuO0RcwY3KEiqs48iHRn6fOOH
         Ppi+Ez8a9eWJvOuz6xebZxhiVxy1ZNh7Jld638f6MRQ6zYr9IOOUCfmt71AI3Y1prF4P
         +AN89F4AHxnSaqBEI/4JSbkTSV+XmaV4ZBNxA7YqR9W16Qe7QYcJfjH7BECZ0VXjKbBt
         SVblPG2Z4IaCdxs0E+zdIxluxKIJrbWXkzn/gvjXbCXqARq0ShjDn+xRQcmekCEjb1p1
         D7SQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIQR89wqoAcp4Bai/JK3+zPOXIEAUQNv7LY+XIIUUuuu4utRJSTZQ5vXeXxcONa7myRuDon2XEfOeVbto=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrmG7gFp7MinsiYgxVEB5SaRA7qjt5+ffZcpN+FM2tMFNISsQC
	4gq2S+hZMDsZRHhijFmd54CuFPFPhAfwiEYtXXO4nCM6LNPf0r5+sbCXmSfwYP0=
X-Gm-Gg: ASbGnct20W1k9xzk6p0YFjnNDwR6fzkMyoHh1VsZLRbO1RE/n6u+zSDt9P+9FoU94a/
	xQt/jVxG9HdrInsX4Gx6TNooXvsafOCaij7vnCy1aLCNfUMoD8A2HOc+vuIoaJAon9cKeYwJOnR
	qPSp2ClGSOFPay5ORIj8xpTF0wJ9MVlMMEV2XCQs74TB3Ug+fXM9yvBsVbwh8lHrJG3hw/BcqBC
	2ilfYyypX/OD/SytdgDmWF+3ObwBijkDv4kpl1M2H7k+hipQv3tHV5/roTwoPDbvRQ8PUPFYFyu
	9TfMIjIWaEPWugGk1MilUTkbxWsP/R/ifP3gt2BaSuDBMv4kvSO2mBhlhEFs6+qLxsEbcA==
X-Google-Smtp-Source: AGHT+IHEz09rrp9A5xMq+F70RrKD5NQcRcTQkwXPv03ntDr7BNJbuVIz4Tc+xYk2wF0okCEF9ptrSA==
X-Received: by 2002:a17:90b:520f:b0:306:b65e:13a8 with SMTP id 98e67ed59e1d1-30e2e5ba382mr6771219a91.8.1747242809252;
        Wed, 14 May 2025 10:13:29 -0700 (PDT)
Received: from abrestic.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e334018e0sm1953256a91.2.2025.05.14.10.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 10:13:28 -0700 (PDT)
From: Andrew Bresticker <abrestic@rivosinc.com>
To: Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrew Bresticker <abrestic@rivosinc.com>
Subject: [PATCH] irqchip/riscv-imsic: Start local sync timer on correct CPU
Date: Wed, 14 May 2025 10:13:20 -0700
Message-ID: <20250514171320.3494917-1-abrestic@rivosinc.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When starting the local sync timer to synchronize the state of a remote
CPU it should be added on the CPU to be synchronized, not the initiating
CPU. This results in interrupt delivery being delayed until the timer
eventually runs (due to another mask/unmask/migrate operation) on the
target CPU.

Fixes: 0f67911e821c ("irqchip/riscv-imsic: Separate next and previous pointers in IMSIC vector")
Signed-off-by: Andrew Bresticker <abrestic@rivosinc.com>
---
 drivers/irqchip/irq-riscv-imsic-state.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index bdf5cd2037f2..62f76950a113 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -208,17 +208,17 @@ static bool __imsic_local_sync(struct imsic_local_priv *lpriv)
 }
 
 #ifdef CONFIG_SMP
-static void __imsic_local_timer_start(struct imsic_local_priv *lpriv)
+static void __imsic_local_timer_start(struct imsic_local_priv *lpriv, unsigned int cpu)
 {
 	lockdep_assert_held(&lpriv->lock);
 
 	if (!timer_pending(&lpriv->timer)) {
 		lpriv->timer.expires = jiffies + 1;
-		add_timer_on(&lpriv->timer, smp_processor_id());
+		add_timer_on(&lpriv->timer, cpu);
 	}
 }
 #else
-static inline void __imsic_local_timer_start(struct imsic_local_priv *lpriv)
+static inline void __imsic_local_timer_start(struct imsic_local_priv *lpriv, unsigned int cpu)
 {
 }
 #endif
@@ -233,7 +233,7 @@ void imsic_local_sync_all(bool force_all)
 	if (force_all)
 		bitmap_fill(lpriv->dirty_bitmap, imsic->global.nr_ids + 1);
 	if (!__imsic_local_sync(lpriv))
-		__imsic_local_timer_start(lpriv);
+		__imsic_local_timer_start(lpriv, smp_processor_id());
 
 	raw_spin_unlock_irqrestore(&lpriv->lock, flags);
 }
@@ -278,7 +278,7 @@ static void __imsic_remote_sync(struct imsic_local_priv *lpriv, unsigned int cpu
 				return;
 		}
 
-		__imsic_local_timer_start(lpriv);
+		__imsic_local_timer_start(lpriv, cpu);
 	}
 }
 #else
-- 
2.43.0

