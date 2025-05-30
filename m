Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7AA2116F5
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 20:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748638633; cv=none; b=exXQ6vLCSWb+UkLjlo7KAa9l0WJ5flAZYdyin3lQoAueT1kqWK+lv6WLKgLOOF81S9Qp9GfZBUrSZJM49QwPVrCuUWJ0D6vVWKccVGchmJIVLSguT9ERMUSeKP4J3WY3jHFXhAYVc+OmcWRctZFHBsVL2i6pHjD5p4XafLivwm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748638633; c=relaxed/simple;
	bh=m86mWweeA9Ak95YLUpC+nPRlhYzIdQ5qKntHnCrwvDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nE1duPw9oVmFtxm59GiNloyB7ZYStPa8WRerQSPnYHzF9Q9y0BOKWCg5jTw3rputUhT6RD82mXo8Bj8tHv6wHO37rqKmnIp1A12CGRIrQY3zNrXYuX4YelNL0auu82ASipAl6J/QceNEj3ydE9SFlwc16bY+wjau16H+pUBbwo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=3QMevVnu; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="3QMevVnu"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-450cb2ddd46so15264765e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 13:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748638630; x=1749243430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=60pgDrU15Q1dZJENX35Q0Xke0F/FZ5IdLg55ZZD51Ko=;
        b=3QMevVnuutR1s2M7RSpv5hejxC6y8L/++lEBuuAUDnyIvMuR7HzFK4DpEl+rlaFkpd
         h6PYycO7eUz8ssLIyzooPCBClxuIqZffUJBiADv8teKieZ8oQS/A18BbwA1U2Jw8wVoe
         yueUjpDgK5WBF9WmqBAW41CxpOefxo3EBCtE9GRfsTLKf1G2DoG3LtMK6De2wvZidOUD
         vm2Y5Ilb5dj8PYcL6AkkT4ehwlrJyV0LnES5oSES4h+KgqJ01oTpuBQEV8hy40osDfmx
         QXeHHvUA/muzgOVSHNz9U2w/aEZo7w94hh/Y3nRgQY6XpOUqdc6AvHPWCWTSgizYRnzm
         YMCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748638630; x=1749243430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=60pgDrU15Q1dZJENX35Q0Xke0F/FZ5IdLg55ZZD51Ko=;
        b=Ol4GlLZRQe3K/PAp+7E9ZkOvW4zU3EOXe9nCjFooRoXhwPrzT8lnmo7m+f+qQzZ152
         q4XFF5MA5Ew+7MQUuRsXhAaGGcA1TLflecCarWlUoputDh0SsJDBT8t6obBJftVWIQZO
         gL4B9eZPZd3q5lC9R3ym4sBho2PvOutrXlPA8GCuCizSSfO5z+BoDfGIsbm8SQjtmUWX
         mdZFGarhYy+U2Qz7AXX6thqizpFl/fRa6n7ZpAHkatULpkkPH5RhAP13X5DSqPHuC+yi
         C4SRp4gbbLGdtO2hZItwwLBJ8E4Km+JvnnZXMDTWJ6z7TI+Aq+CTpDValggIvhPP6L1U
         SH0g==
X-Forwarded-Encrypted: i=1; AJvYcCWs3SumhDz20NXXzlefqE70HtmkMmpAW2t7DeiASiRUji/80Qpacp1wSy3PbkYh5eUHSmB4qgi6aiulK+k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/iznqJdDh74r4IYX+0FJ/ZjeFSNfG8o6y0HtN/hdPPo2uAIH5
	2P+NF9C8iXwbPM32s6mkFgly+HcSAQnvX9BI1otJs3Yz+UqlnBpUK9AcDHKVh4RL9L8=
X-Gm-Gg: ASbGnctmVW9xqspINhE7ABoR1ZPIend4/iykPx7EfwV6a1WlhS5Ob/14B5gdZEiwEK1
	60FLnsvSgVFwcEUynKP6QzL8ltwrj+C0g+Flnq+mvTBFzBGreHjC3Mdmf/bJHC/fx9NTKAmZELj
	91CJ3uQeiJXekgfCBMuOnBa44qBnZDEUbOncH9IlXk7CPIqw5NNqnI1ApGVETsPTSsESE8f9VVK
	Wdx/KVoOAy8IAu9+qcSS4EWU875TJmb0p/gp3VnzocTHDn7bVzqvZSsncfmEPy1n5mj5P4IXBnN
	BOwIMES7W29fO7AreuzICrDaZ7ptLVO6rORAyTheJLpIJ0bHoWc9d+qUQ2X+aJ8g9iS2evtA5F+
	i+cQt0eKb1xX6dqaPEYp91IeP1QIKx++g
X-Google-Smtp-Source: AGHT+IEYp1sZ+H5JxNaIqeOii1gSa/lomV//p3v/Z1Ab5CZmGnWWSMm5ETonNH2yRs4ZJAY9V6/VWQ==
X-Received: by 2002:a05:600c:3b8e:b0:450:c210:a01b with SMTP id 5b1f17b1804b1-450d6504a0cmr50435365e9.17.1748638629932;
        Fri, 30 May 2025 13:57:09 -0700 (PDT)
Received: from carbon-x1.. (amontpellier-552-1-200-51.w109-210.abo.wanadoo.fr. [109.210.255.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe5b79asm5666527f8f.2.2025.05.30.13.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 13:57:09 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH 1/2] riscv: process: use unsigned int instead of unsigned long for put_user()
Date: Fri, 30 May 2025 22:56:57 +0200
Message-ID: <20250530205658.624195-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250530205658.624195-1-cleger@rivosinc.com>
References: <20250530205658.624195-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The specification of prctl() for GET_UNALIGN_CTL states that the value is
returned in an unsigned int * address passed as an unsigned long. Change
the type to match that and avoid an unaligned access as well.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 arch/riscv/kernel/process.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 15d8f75902f8..9ee6d816b98b 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -57,7 +57,7 @@ int get_unalign_ctl(struct task_struct *tsk, unsigned long adr)
 	if (!unaligned_ctl_available())
 		return -EINVAL;
 
-	return put_user(tsk->thread.align_ctl, (unsigned long __user *)adr);
+	return put_user(tsk->thread.align_ctl, (unsigned int __user *)adr);
 }
 
 void __show_regs(struct pt_regs *regs)
-- 
2.49.0

