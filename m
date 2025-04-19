Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985E61EB5E1
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 22:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745102164; cv=none; b=n7GsKhcYlHduI4MUcpy0/Ge5IOkb2gJ2DIoxZwQ53fVVixSYBCxJwAkFy6rlG0WTDszM++7ZYrt6enDLZolihNfuzQnbRJI6YThd6gPJ/YDs87DpMa64KN4j5XbHr45EQJXI6yUyU+VBybXUMBjRxycDiIXlV8XV5qCB814T0GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745102164; c=relaxed/simple;
	bh=LYUB6ojvp/Jp16vOwOoV897BobFnAnUUIGrNHHNIUfI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rYI9uGPovbSlrzwalk3sc2zcSadcCpyvr70ESOt5Rj0SRGjE4VfDMUrevjpiO135gdWyyoZ/c4H1ikcH24ln7HsHVr+SyGW+VyLwyxn/bFbWDtl85G8BJTwfNfd6L+5m7MqHPPZADnwZ3i8sIq2PoO9W3Rk3O+e8vn+RZnbTpsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qlntZJ/d; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qlntZJ/d"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54d65eb26b2so2640458e87.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 15:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745102160; x=1745706960; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TzY2xOh4ktNlX/Hf1UnvL25R4SqMvTbsJsIcKtlm9vA=;
        b=qlntZJ/dzgo3hGkFumikqkw9ObiWXMNRpEIFK9TcvUHEbE+zfniQOU6V6KvaG/vxmj
         7eFPfhGkc5v9tCKM80HzGbh407xIO60RGxwBdk5MWw54lAowo2FKCkgME707kp7ImgIL
         MPGbQl0Y/RmvhcyCpKs2+B98vzAnRyiH0i6T+LEY/jC+sHO0M0gR3Mfsf1rTKxkcqlDo
         32bKnkA6u77C+lQJa15A5C+0DQPxWXawSJ6pgp4OjIcByktW6thNPcE1xLcBU3PJIKki
         kFQjDSBih0EYpW6iQ04HS9F23q0Trau17FwN+kurXDmoKEvjAmkU74XqH1Gmu3camh/q
         E60g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745102160; x=1745706960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TzY2xOh4ktNlX/Hf1UnvL25R4SqMvTbsJsIcKtlm9vA=;
        b=vuOCC1UW9q+4ABWHwmllrtapoNdDwm7z49o+MR79K2AOyinZJe0x+NWo5PW2xde3bM
         1grMZ8sAXqebpXsgsTZzED036sPMAUEfpqVuYSxC8rNULDUM9HevzHsFU1FNTbRdj3Y7
         rKCu4f7/HWF4+kfExxxcH7T6Ej9SJT/JODwc0M2r0e3cy3yvvRVLmhKW04i9YYtnbIxd
         3Ex4v1o0tU/DXF/Dyt/4dVQ9w2hL2t4Vd770UtulIb1lb23E9RJgizbambD64tfrmkUz
         nZ8N+1X+B1R94LjArp11v8oUvIUoqwzoxi9aES2/oZuJJDmlfdIH+K0Ny3wXRK2squTw
         +MQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVdWC62AhvzYtmsGRSYwZ3bYEF5DM5u2sD/noMtFCj2diyqal2r4Z1eXmXa3QfaZeis+jyFmPK5znsBRo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2B4M4uae1j7lP71gMIJ7Wcz/fHcCAwMyo9WV6pj7U1vdrVo6t
	8WYJ8JImjQ6lxy/+S2bhJK5qSKUYpOdJlAk9LiVxuyfd1+QagNON9xNnzmBEYWtdwTt9T1K7An/
	LYmo=
X-Gm-Gg: ASbGncsOxo54cHMvr9UJX6BNgXWxgbJuZF9bdJ5lFf2CSte42kimu+jRMWb4GrelS/c
	+t+fXcloNaKDBPflZkpcryMO/bm3isWaF7ft7YlMiADrSEkdZC+rwgrDSq0xlC1gv2aNDrZh8Wh
	IcLvnwWgin+WpjsIlwtXWPfv85bBTUMd3pKFqgdwwf3tuJZWTisjc78AF3pQKEp0YZsEDpShsQx
	i1/x6NcbE0rwx8mEym4wWb0uB3SOsqhvjIVfUNnSD0YShq11rG6Wx1hec8uqUlzkE4mbIoDxErU
	KvNlzUvFtgzYdJ9lGKT51EZ5ikimsK/WnONaPoRI7PkKpjsNRlM=
X-Google-Smtp-Source: AGHT+IFH9xGcTNIlSs+IadMVQj6+iIYdg0THeCQHNZBemp4bp++lCg0nA15nRYVihEO1x52fF5YrhA==
X-Received: by 2002:a05:6512:318b:b0:54a:f757:f8ac with SMTP id 2adb3069b0e04-54d6e61c168mr1950777e87.8.1745102160571;
        Sat, 19 Apr 2025 15:36:00 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540daesm535322e87.79.2025.04.19.15.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 15:35:59 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 20 Apr 2025 00:35:50 +0200
Subject: [PATCH v6 03/31] ARM: entry: Skip ret_slow_syscall label
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-arm-generic-entry-v6-3-95f1fcdfeeb2@linaro.org>
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

Don't introduce this extra label anymore now that we have
a clearly defined entry point for ret_to_user.

Acked-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/kernel/entry-common.S | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index f379c852dcb72fa5e960bba5621cc2152f0df0d3..2f93c2f6d5b8fdf6aaf3dda0192bde144fcf238d 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -102,7 +102,6 @@ ENDPROC(ret_fast_syscall)
  * do_work_pending() will update this state if necessary.
  */
 ENTRY(ret_to_user)
-ret_slow_syscall:
 #if IS_ENABLED(CONFIG_DEBUG_RSEQ)
 	/* do_rseq_syscall needs interrupts enabled. */
 	enable_irq_notrace			@ enable interrupts
@@ -136,7 +135,7 @@ ENTRY(ret_from_fork)
 	badrne	lr, 1f
 	retne	r5
 1:	get_thread_info tsk
-	b	ret_slow_syscall
+	b	ret_to_user
 ENDPROC(ret_from_fork)
 
 /*=============================================================================
@@ -310,13 +309,13 @@ __sys_trace_return_nosave:
 	enable_irq_notrace
 	mov	r0, sp
 	bl	syscall_trace_exit
-	b	ret_slow_syscall
+	b	ret_to_user
 
 __sys_trace_return:
 	str	r0, [sp, #S_R0 + S_OFF]!	@ save returned r0
 	mov	r0, sp
 	bl	syscall_trace_exit
-	b	ret_slow_syscall
+	b	ret_to_user
 
 	.macro	syscall_table_start, sym
 	.equ	__sys_nr, 0

-- 
2.49.0

