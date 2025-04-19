Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888AA202F97
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 22:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745102188; cv=none; b=Htn+GgIPRejnLS3N4DvgTf6IEQJ2vRW7zKjhRl9LJ6KIm7SjVmzmSMrrYrXTmNvjYSTyXZ2kvLT7kjIBcWb+8ShVLTMhsqRWryFigLSYvr0HtMWODn6gMjCjUal3eYLlvyAu1oy2ZOteUgPFIxEukPALmtR1cAH3I2Vc6fNgkec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745102188; c=relaxed/simple;
	bh=sHcHdOV0FMAZVdwgRzOwpbk/x68rbhSqA4QMNvokHj0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hxt3mJOgXkCC3bsinW87Pva6pfrpu5/sXcAChahIpaHmMj6YpiormdGPH+DPrbGgj3Q85RJA9ZdPxY4mAdFMlGaUQXEuQ5SRR7/pL9h3G91YxZSP1gPrPnk/3ciy+x7UED2bxr2nxv8R+zk7DkE8ycbbCf4Yn8d7n5AG36sQvWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ytUYqlTz; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ytUYqlTz"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54998f865b8so2880045e87.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 15:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745102185; x=1745706985; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tq3qR1Ach5OqeKvTWWzJNPs8Dto2cBMzy0K+AAmOlZ8=;
        b=ytUYqlTzQGnHO9pgweSHsnj5DV9UfQfoe6ZYXJ07Edwd/YKtd1a3zw9y3YYBQQZPbO
         kizfc/Vg3KRphHjpPOS8wHzwquynOEZ4dIZUYXJPtiJMESGTBT5G9+J9y+Xjv86Lww1A
         5e7atDD0lTf0b5A4FWPgJm9J4Gv1Z8y3tj5taykGly0nJ5P8i9k/kF/9O+Vo9fa4RUCU
         3LHgF6y4IBTGmtMOS7knFyGh8359giXpnvXSg5efO3bE+cAx3jxE4fPI/bMIgKkNx+8m
         czpFP+bMZE7IX/q46TNoSgUBmr013LQrKDrIk5MvrfpSkIoZ++NH+D7qYEpQDuT8Yt4G
         3wEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745102185; x=1745706985;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tq3qR1Ach5OqeKvTWWzJNPs8Dto2cBMzy0K+AAmOlZ8=;
        b=pGbXkml69F0kdITP0AHqz43DYKDnvwrhN9J72yr75R8IfiO1wB4ZvfIfn1ZZUD9RjG
         fvyioYgEK6HtQJwgq61ZVRYxkIRb19QtFOqOIsIIB9dwhyCkTPeuL/2+iNKbuua4++Id
         ZzYxLVXYJYlH/NlUGw0rXuvNmxP3ixtiPxpcRCJotZMRRVqOWTN373vAkbUiU4ZqIZf0
         RxXRjAkpWDEBv+pi7Ts356c5WJkBf7f0yLy/iANd01GeteYw3XPVQTfeTePGiXastdU/
         nPscLPBarSLRm5Z65nKx00JrtHGna0BNCgdg/mV+OwI/eDRu1rLJzQD6FTF1N7hzcS2Y
         352g==
X-Forwarded-Encrypted: i=1; AJvYcCVf0cuO/Ccnyg3GNHASSJr392pmbzYpqx9zncH7fAwkYUi0fGFxRTSOaSDNbWlfULl0X84zzTe5JxW9Pfo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgYqRWjaityXWnZ2LlAQNyrhMsa0CbhIlebzG8m48/SVDNqLDJ
	wlREzRbnCpnO1cpHuusQns/rt0Ts+VAdZwBB2QE1G45mYAJUWj0kLjA2WYQj7iQ=
X-Gm-Gg: ASbGncvaE8r8KHi69TUy/OFV4dOuGzfj4FzA7T9/oY2pBtwdGbdMqqyKDnNHSaKx+1+
	43rpG468Ca1fD49gDtUpGgNMJSSAo20ykAr0LNioNxK6ROMjHqHIXcpdEmKjXnytV/qX2blEaJ4
	iimoW9wGHJxuvlav/19dY9Rfp0Z1ojY1Xhvt6kCFZbu4WrzC/018wF9uXkpuw+NshyWxb920XmT
	PD9l5DvUPqQGQNvN4rhfFo4F7Ad9+Dd0/6dzkPAWfZiFaGHLdoETac6Sl8ibHtZI/K0giy1k+g1
	BeI7XNdPU3FZdElVz66bbCnv4A92E4tBZjyiUFMOZ4NBItAQvHI=
X-Google-Smtp-Source: AGHT+IFNvDhheUhAKpDcu0lfhPrHRPwqRw7FFmLwPqgAooC3jEkoxPnI3ZkuWls+okhqWh9k8jmbkA==
X-Received: by 2002:a05:6512:1309:b0:545:5d:a5ea with SMTP id 2adb3069b0e04-54d6e619700mr2291214e87.3.1745102184594;
        Sat, 19 Apr 2025 15:36:24 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540daesm535322e87.79.2025.04.19.15.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 15:36:23 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 20 Apr 2025 00:36:08 +0200
Subject: [PATCH v6 21/31] ARM: entry: Do not double-call exit functions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-arm-generic-entry-v6-21-95f1fcdfeeb2@linaro.org>
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

This is a semantic change to ret_fast_syscall: if there is no
work pending the function used to jump to ret_to_user, instead
we proceed to return from the syscall.

If we jump to ret_to_user, IRQs are enabled and we call
syscall_exit_to_user_mode a second time; at this point a
this just means a second call to rseq_syscall(), but it
seems wrong and we want syscall_exit_to_user_mode to be called
exactly once.

Apparently the ARM kernel has under some circumstances called
rseq_syscall() twice on the exit to userspace without side effects.

ret_to_user also checks for pending work a second time under
ret_to_user_from_irq, but this isn't even needed any more on
the fast return path: this was needed because the syscall
invocation enabled interrupts when doing syscall tracing, and
all tracing invocation has been moved over to C in earlier
patches.

Acked-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/kernel/entry-common.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index ece9215717143427de7572a18a6dbe620a9193e9..33bc9e7c5b32f62474724f1d47f97af24dba53bf 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -49,7 +49,7 @@ ret_fast_syscall:
 	tst	r1, #_TIF_SYSCALL_WORK
 	beq	1f
 
-	b	ret_to_user
+	b	2f
 
 1:	mov	r0, sp				@ 'regs'
 	bl	do_work_pending

-- 
2.49.0

