Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40B3204C2C
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 22:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745102195; cv=none; b=IzFnn4ohCtHwB7VRkJrPShqqkmxG6tGPBgbjhpA8134S2LTm9WbsYKzxU6fIYJVDXWkRU2XE+WCjJg66JFmhQKGphQI9tc/CsdULOKj5On4ENqD6GbB5D1sTrn/b/OwAOY30pTg5KDEZ/RFAQODRm6j5Lq22itSIAxAorugIaO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745102195; c=relaxed/simple;
	bh=5X6iwV5/5MBsSlre5eP18+z3VeNcP4Fs0AK70ziyo5U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PAu2TPjGCxWT5HWi1F+CXJF5yBp11nD5dlLRZ5sD4FlAYWTH2pXdK8DkftRvWItDE1ydOjW1CV+yQbI69zQwq4bvdXXdpbosVoC+CPV/gQsjJXh+NBawoMkPLAgY7G3VoF2LR3/mY1aoZDbyohTKqubd8PyzdrGUYGdpDZV3ztg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AgOCASoZ; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AgOCASoZ"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54af20849adso2805649e87.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 15:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745102192; x=1745706992; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gfgswIG46fDfailpV8Wq3k2rCv5IayqJioTZZoftrUM=;
        b=AgOCASoZoB8lRh9qNJ1hNf3CxwBkHBWxlW0AxwpTq8fbflKQqHSq/gwbi/eIarvowE
         UeQbhESpjDGuytma/n6S29ZndAyz9wUVKnwUh5mwpBjqR552xzWuXxHD58uObrUSYTK5
         V3SteQ0hzmoIq7GOF2KfsFFLVHJrJxNL/zOx9Zr3l76/z0hTQJSj98awltq9WzTVzzXv
         XbXHZQlrEC7wEMJOioBPHFXuxmo7NQbGsBENIz1H1BklS/uLaBxfQh78zgVC6Hz7Rzq9
         IVDQz+KRJezxwjiipiRep3PC73XPD3AFEA0731M736FJ0FB9g0g4lJ5qFj//v0cYzhOR
         5GNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745102192; x=1745706992;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gfgswIG46fDfailpV8Wq3k2rCv5IayqJioTZZoftrUM=;
        b=NWShSnLYQwRdz5Ba63LAg+QE0cXFWJRzJjSlFoTJBlsZUPZZIGldyiv1UC1Irr7Yff
         A/ZwnWdeY5pNUz6lZ5OaYYDytJoNJTnARvfk68kSSfSeOT0esxGqfIs2POF+odP8Ecah
         +5xt++QNt/uK4Pt8xq+vamomN4lIBnZYLkGZ8xhC4IyZ47wGvVF0cSQQX5nuYZW8eZE5
         U6czuesBYEj+vDS2ZcqjDVNRzwFATK6mbyDzmEGnUY0jOUeg18BjucdIKDwxpWSoioXs
         UCjzQba0Q/f3CvI2Io7IqW2zzBs2lX66TCiptFzXDLWaNuwZHv5FVew7KgOTzztEnoso
         toBA==
X-Forwarded-Encrypted: i=1; AJvYcCWZbkK+G0PKrPooKz13fL15dTnNLvrUWjkLpCwRvrTqYxIauG913PsBJQ91WhHdPgJTb4mWCumlXiIdMzc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywhc+n7Qi++g4H4gSnkO6Nc0R/CtOv5wAFe3u1N2kESD/CEJBmB
	8KqdjLuNDGNG429mAz2AlEZbZa9F5jjFA/Ejp6IyFEW+MOaiHcnab3q1ugsw/xI=
X-Gm-Gg: ASbGncuNHQkkgJGQWe/Mvi/TcHlA+Fc5OlB0OTtahLC+LMtlw14MrOQNRyw95v0Inh4
	ta63g9qRL4lnQpklBnGVFnYZjfHFuUk9T957L3oigckTTFadLDPh6tRT6ZWD13AxpiOVsdwgngy
	acxWLFJulX1EOqOLTyA8wfli9VyRhoKXvTVNYaxUnw6Cufz97nxybqQfRobacI1LWZ1LA/fY9BE
	xVBEVOqpEojeSciHZm+6UWa/S0ZPwizM9le/EeTgXkeokTfyZLDD3cDxEw7PZDWBPEHl1KJcdqT
	1Lm4hx50noBpLKReVusUSY5aL3/A9W15Z30nsnDxu9HeRZtAh1k=
X-Google-Smtp-Source: AGHT+IFfnhm1zNJreqEht0x8JKUibYOmGfzmfZxw7zoZa+K3UUB1bVa8BYsj+GgIiEpufBRw+Qi6pw==
X-Received: by 2002:a05:6512:a95:b0:54a:fe25:43d1 with SMTP id 2adb3069b0e04-54d6dbc431dmr1799555e87.10.1745102191927;
        Sat, 19 Apr 2025 15:36:31 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540daesm535322e87.79.2025.04.19.15.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 15:36:30 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 20 Apr 2025 00:36:14 +0200
Subject: [PATCH v6 27/31] ARM: irq: Add irqstack helper
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-arm-generic-entry-v6-27-95f1fcdfeeb2@linaro.org>
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

Add a helper to dispatch IRQ execution to the IRQ stack:
call_on_irq_stack() so we can explicitly issue handle_irq()
on the IRQ stack from a C program.

Cc: Ard Biesheuvel <ardb@kernel.org>
Acked-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/kernel/irq.c | 6 ++++++
 arch/arm/kernel/irq.h | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/arch/arm/kernel/irq.c b/arch/arm/kernel/irq.c
index e1993e28a9ecfd80b55b2677253ac582467e6c14..f99d6b24d8ff56f901e4a817c61a1e57b7e532cc 100644
--- a/arch/arm/kernel/irq.c
+++ b/arch/arm/kernel/irq.c
@@ -43,6 +43,7 @@
 #include <asm/mach/irq.h>
 #include <asm/mach/time.h>
 
+#include "irq.h"
 #include "reboot.h"
 
 unsigned long irq_err_count;
@@ -71,6 +72,11 @@ static void __init init_irq_stacks(void)
 	}
 }
 
+void call_on_irq_stack(void (*fn)(void *), void *arg)
+{
+	call_with_stack(fn, arg, __this_cpu_read(irq_stack_ptr));
+}
+
 #ifdef CONFIG_SOFTIRQ_ON_OWN_STACK
 static void ____do_softirq(void *arg)
 {
diff --git a/arch/arm/kernel/irq.h b/arch/arm/kernel/irq.h
new file mode 100644
index 0000000000000000000000000000000000000000..80dd5bfe6403d68fc62fab30666d5645748d329f
--- /dev/null
+++ b/arch/arm/kernel/irq.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+void call_on_irq_stack(void (*fn)(void *), void *arg);

-- 
2.49.0

