Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15ECF1EA7CC
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 22:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745102161; cv=none; b=UDGvlUrjynfBUmUbwpKB9JxXCqDc4PQqkmDFZ1YLnVpSzyIDKx7uWHRXBAA9jVmAkNwQI4ik4GV+RRTX0L5l0D7VB63iz0e3RPzLL9u4Qi0VhVmONiH5kY4OUn3H8fhtRpMsI4Bg4KvQT5jCKdHv3A+t0BscV2Gil+Z1VGSoXzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745102161; c=relaxed/simple;
	bh=O1OoucjBrhFHCd0WkL97vrJaw60M6S6g08VBYJMvcEg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JVyN3+WpwiWJmt1LcSLObr13N61MzgIvy/1+Lf/ouGxG6YPvB0WTtfzT6oslp9uuemx+DaPpt28gHRJ04EeRVef75kqZqSwQ7rP1XtlX5HsFfgeQ7pZj5MzSw7A0aUZuAsSToU7yRWOcBkHD21yXpKT6Z0amzzI6CojNb4lVclQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HZv4ooEt; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HZv4ooEt"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54ac9d57173so4205407e87.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 15:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745102158; x=1745706958; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IQ5CSP2wGdcgzWF//+b4znU12TMJTdW+6/VKhNWGia4=;
        b=HZv4ooEtOdKEhz3QJ8wE6VfVjeWjlcfjnB/jAOVhOQe36ypiDnQFmwhhR4dpxdML54
         g1Ss/GuLLHEfSnK2UWF9PQLo7t+4IkKmMjVSScHeWa9QttUry6pjVCllt/y94sw9oGh4
         LcETzwrVsqH8laP8JhGw2ei/8oMSpNHAanfdawy68I92gcjmMEpdO/Hi4y05U4z7Z40k
         F+DnSCUzuSD0MzmPDybHgy/VzaxdH3arTipD1JowEbArv3mxAEgCU3q5q7bskdlBg+9s
         OHYDP8mlmhBvAFvzHSxTE4LjhhuSikZTXp0p+aHmmokzcyF3KgyviAJkiPJtONBAAMr2
         mbxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745102158; x=1745706958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IQ5CSP2wGdcgzWF//+b4znU12TMJTdW+6/VKhNWGia4=;
        b=KNBM3iqGHwzxS//Cap7pWLKADZWQVCQzi833O8gSXyWXZCVKWw15g4q3WeAOVna/GX
         zf4HC9swg1SJIZpzDYDwzNmNfoTPpxI3X+7KFiWxtUUc5fCADctOD2HTSCPlNOszU8Bv
         ZSKV96CXxi5ISuun54Kw2c727P2oAGtof8qrnLKKrsUryhzJOkVSB9oBQQvm9COO+200
         j63CgeziZIFhs4WZY41QvWNw23hcBjTHcqcyzYGEsjqNpQ+riUjEJzW0sK4WwJNWeuKH
         mr4Oh8dgSmZNjSRuOrTqBLaRDuvKI6eR/r7/5R5s+8zTMVH3uv3DzBKLfbk7+CD21Em8
         YIng==
X-Forwarded-Encrypted: i=1; AJvYcCVMYGPJBrMpAYT3rzhVWluCIV0oNurv7G2GcJgA0a8VsoV9UJJ6qyGHiNy5SMIK38ZKWSmAeNbeH+ybpTE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz69usMtCle3vh45RD+XgP+Nj+PRzw4NJPffolFyCLq0hGE3MM
	3aQhZWKPbVNfxvvLjyLo723OfFOkVq4t/tHi41iuq3fFCUaiYH6P13EZIqqg+KY=
X-Gm-Gg: ASbGncupx8N8FeXkXjwYuIGsunNxClPWlDW8LfU1Tma1wSJ9IVfcTCNe6P9AejgG7G2
	mggAyJX48XuaplAAZMES5e7140UIzpIBShxom/2nhMEDm6WKcQJEoVNC93f/AzBNbgr2HvXe/pf
	EeubC2AipgxLkOOWauNdBrreknvwx7hP7dv0Z6YtMTXvvXUvHB98KyGMQx0/FfCAbPmE5iA3pf1
	646LJ+ZPk/p5FhG1wgfrGaWQt2bUJdja3esiMBNyzzMyAINBVpzjp1Oeij6e/nanFZN019+VsLk
	Zru+8Z4etkMS8SkCN61LtWXrMkcWcnPc+oYa9Kl9C7YjmnXQHBE=
X-Google-Smtp-Source: AGHT+IGLMvDVq11ln0AcImjW5loG4OTpHEIEWmQKeTgHMYpB1Kkl5IPq2/e++cLfj64OrAhwHsThtw==
X-Received: by 2002:a05:6512:3d29:b0:54d:6c14:3caf with SMTP id 2adb3069b0e04-54d6e780055mr1794485e87.11.1745102158136;
        Sat, 19 Apr 2025 15:35:58 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540daesm535322e87.79.2025.04.19.15.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 15:35:57 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 20 Apr 2025 00:35:48 +0200
Subject: [PATCH v6 01/31] ARM: Prepare includes for generic entry
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-arm-generic-entry-v6-1-95f1fcdfeeb2@linaro.org>
References: <20250420-arm-generic-entry-v6-0-95f1fcdfeeb2@linaro.org>
In-Reply-To: <20250420-arm-generic-entry-v6-0-95f1fcdfeeb2@linaro.org>
To: Dmitry Vyukov <dvyukov@google.com>, Oleg Nesterov <oleg@redhat.com>, 
 Russell King <linux@armlinux.org.uk>, Kees Cook <kees@kernel.org>, 
 Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 "Paul E. McKenney" <paulmck@kernel.org>, 
 Jinjie Ruan <ruanjinjie@huawei.com>, Arnd Bergmann <arnd@arndb.de>, 
 Ard Biesheuvel <ardb@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>
X-Mailer: b4 0.14.2

The generic entry code needs a static inline function for
regs_irq_disabled() so add this, in further requires the signature
of on_thread_stack() to be __always_inline so add this as
well.

Acked-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/include/asm/ptrace.h     | 5 +++++
 arch/arm/include/asm/stacktrace.h | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm/include/asm/ptrace.h b/arch/arm/include/asm/ptrace.h
index 6eb311fb2da06fa393f8be7caec8d997637a88b2..a01c66f0ad907882af2a383e53de8aca68c551e5 100644
--- a/arch/arm/include/asm/ptrace.h
+++ b/arch/arm/include/asm/ptrace.h
@@ -52,6 +52,11 @@ struct svc_pt_regs {
 #define fast_interrupts_enabled(regs) \
 	(!((regs)->ARM_cpsr & PSR_F_BIT))
 
+static inline int regs_irqs_disabled(struct pt_regs *regs)
+{
+	return !interrupts_enabled(regs);
+}
+
 /* Are the current registers suitable for user mode?
  * (used to maintain security in signal handlers)
  */
diff --git a/arch/arm/include/asm/stacktrace.h b/arch/arm/include/asm/stacktrace.h
index f80a85b091d6c4ff365e15ae7100af1c3aed597f..815b5f256af164daa053f3bfd6cb2f54042a8d2b 100644
--- a/arch/arm/include/asm/stacktrace.h
+++ b/arch/arm/include/asm/stacktrace.h
@@ -26,7 +26,7 @@ struct stackframe {
 #endif
 };
 
-static inline bool on_thread_stack(void)
+static __always_inline bool on_thread_stack(void)
 {
 	unsigned long delta = current_stack_pointer ^ (unsigned long)current->stack;
 

-- 
2.49.0

