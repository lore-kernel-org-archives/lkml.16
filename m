Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4791EF36B
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 22:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745102170; cv=none; b=EdxXo49/ZAA8ixxDmnI4U28tnCVTPZ7wBTJUTiUJpNiIWhwJyrED23KrhuNmPYZSPum/UvVtykOs2jj7mtjqA7afZs1eXhvUxoPAXvUJ8jMJK54iM4Kh5KVjdfh05ng2mhk5x1cLQROMv+n/wc2OQsfeY5SRIWXePclWmQANf8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745102170; c=relaxed/simple;
	bh=GjuzgP6o/H3QbhkPNB4rDABhts4Jsa/gdYzzkN8CaaE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OAwPh1mIquvSdkgIpICt74IJhg6/evSMooNm+7hWvg9I+81KyY4r4bcsQzRiOIO5yzwrGw29hZMs0AQ5BhBWwc+GWgbu8EBXJynp6jPNBhclChoUzbDIGy1y0gaYFFVjxv1PpmKaghvPmH+Z3ILhlRO1Jt4cEdmEqqR0kBOEf38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VV8vOEqc; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VV8vOEqc"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-549b116321aso3285346e87.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 15:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745102167; x=1745706967; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZVzjh4CI2wdh2Lb2nY0LTHSQ875qMVuhPD3D7+BHQLo=;
        b=VV8vOEqchbICg1PiY0tSlYtvgq8+tVF7CMYzRoRIzx8z/rIXuYZaHqWjWqmCdsOpaC
         kWTbsJVjoKWqZT1W1sjjHN51YVYmwVEvD38wr8gZTsPN+i6v6hEInqAt6OYfhYpJzvUM
         YkiZR2uYehcjgWil/6lEtIf+7hzaVIA2ytNbX9Txf3JUAwylaTCqH4YqXhvCRKKw5Azj
         sge1kRHNV6RZOFv/Wv4sZggE/s8IS69WDYdyncxBZtdW4DP6lxd5ES11mhU3R5dkfr0r
         dXijPZEyTMWEKDo13sETxhqizpSEO1v7R3+WFWgjkTcVebwoXoUmfUNK39DrdAP0i7M8
         Alaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745102167; x=1745706967;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZVzjh4CI2wdh2Lb2nY0LTHSQ875qMVuhPD3D7+BHQLo=;
        b=XDvCDoQ+lFobSFELBF0d6xbSqW+rKqdRFNZuHHP0a+TpxTvFbq0e+f8BkoimrPsYy7
         AHOwO2jHLWAna5qsxzOhkoco8TVRL+dV90s1qYNyxqS5Ib4WVYG6IWEirq8Jwu1iWIAn
         LbsFnIDHqZc+pSrOoNJvKXUKnBRJkUKPpykP36QjZ451lJvWMSSEuWFHKbDm/u74Cz4g
         kuSz+2t+Wnvwrg5jlPVG3idwHrfJxLbEFtxfJJT80Tgmf5h7ksb+uTAQ99OfsRP7kQvB
         uZk3Ll3eYzWw82EL9tcXdA5/otyZuOEDf671iFVK19lzbZ+HcABGNQ8lALc+5M+rw46Z
         jRYw==
X-Forwarded-Encrypted: i=1; AJvYcCWwpyCQqry82YiTxdw0HiVpQRtAi/xQ1n1+LbMbLarYZdrnO1zs6TUKUDIYdLie9o7I/ABDSHJPpYZ0TeM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRc6355n0iYueT61Jkf5qA2kY0jTYoZunxxamPpIipVxHbyOaY
	OFWKP6yH2Zg4Fd1F40YOjeiFatGKqxWq+07N2K0fvAzZ9KvWEEbBz4Nt+eFCa/0=
X-Gm-Gg: ASbGncs/SzdEO3Y9dkosatJOl/GXo+dYyrAnF7RJZP21jDBerxbdom90MllfVrCbWtH
	9z7hwqca1vWn9k2SOC4nQt5Snt5Us9Td7bauyodde2gyHt49suE54RrxADw+N0Rvit1JvZCJji1
	NrLZXv5H6U0Sink5D/LX3W6BuXzgZL4A/8BArN8u7QwGa5hukF9Q1D8DtxHXVObQ8pst4ekh8NM
	gu3WvnRi2ShTiO/UUDuyuILSDYFIEAWHFlEp8loeFNYwUVHkw5LLQr66K3RV0QWCOIYRqEzZhBo
	9xjyEIgpDchKjxK19+1pSEUCIjuOdUDOTsbHLlBGSKNl1NFK5B8=
X-Google-Smtp-Source: AGHT+IG1pK5ONP5zwkjmb5F3Kh3pNns2KgCXtbBbSCQoJiPI86cXUdyKSiDMdutuwP1A2HrNm1AC0g==
X-Received: by 2002:a05:6512:3d28:b0:54d:65e8:31e0 with SMTP id 2adb3069b0e04-54d6e61be01mr1979159e87.5.1745102166756;
        Sat, 19 Apr 2025 15:36:06 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540daesm535322e87.79.2025.04.19.15.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 15:36:06 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 20 Apr 2025 00:35:55 +0200
Subject: [PATCH v6 08/31] ARM: entry: Move trace entry to C function
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-arm-generic-entry-v6-8-95f1fcdfeeb2@linaro.org>
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

This moves over the code entering into tracing into the
C syscall invocation code. As syscall_trace_enter() will
provide the current syscall number from the regs we need
not provide the syscall number to the invocation function
any more.

Acked-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/include/asm/syscall.h | 2 +-
 arch/arm/kernel/entry-common.S | 6 +-----
 arch/arm/kernel/syscall.c      | 5 ++++-
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/arm/include/asm/syscall.h b/arch/arm/include/asm/syscall.h
index 1d21f26ecf510ac00a878b4d51a5753ee49475f5..66067d165ba3fbbe0f840a89ae396eb1a311bacc 100644
--- a/arch/arm/include/asm/syscall.h
+++ b/arch/arm/include/asm/syscall.h
@@ -20,7 +20,7 @@
 extern const unsigned long sys_call_table[];
 
 int invoke_syscall(void *table, struct pt_regs *regs, int scno, void *retp);
-int invoke_syscall_trace(void *table, struct pt_regs *regs, int scno, void *retp);
+int invoke_syscall_trace(void *table, struct pt_regs *regs, void *retp);
 
 static inline int syscall_get_nr(struct task_struct *task,
 				 struct pt_regs *regs)
diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index 77801d039b5f6562b231a6fd4979e318c7e736a6..3cfc6d952ff99be9c4c1be4481ac3039260e3e57 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -292,13 +292,9 @@ ENDPROC(vector_swi)
 	 * context switches, and waiting for our parent to respond.
 	 */
 __sys_trace:
-	add	r0, sp, #S_OFF
-	bl	syscall_trace_enter
-	mov	scno, r0
-	mov	r2, r0				@ scno into r2
 	add	r1, sp, #S_R0 + S_OFF		@ pointer to regs
 	mov	r0, tbl
-	badr	r3, __sys_trace_return
+	badr	r2, __sys_trace_return
 	bl	invoke_syscall_trace
 	cmp	r0, #-1
 	bne	__sys_trace_return
diff --git a/arch/arm/kernel/syscall.c b/arch/arm/kernel/syscall.c
index d637dc74b1c70415933898fbcadbedc71df5f654..377e16c8c53c8e809e3f8b157a889ef115d5c043 100644
--- a/arch/arm/kernel/syscall.c
+++ b/arch/arm/kernel/syscall.c
@@ -21,8 +21,11 @@ __visible int invoke_syscall(void *table, struct pt_regs *regs, int scno, void *
 int invoke_syscall_trace_asm(void *table, struct pt_regs *regs, int scno, void *retp);
 __ADDRESSABLE(invoke_syscall_trace_asm);
 
-__visible int invoke_syscall_trace(void *table, struct pt_regs *regs, int scno, void *retp)
+__visible int invoke_syscall_trace(void *table, struct pt_regs *regs, void *retp)
 {
+	int scno;
+
+	scno = syscall_trace_enter(regs);
 	if (scno == -1)
 		return -1;
 

-- 
2.49.0

