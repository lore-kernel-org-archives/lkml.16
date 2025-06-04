Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76F382864
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 09:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749029655; cv=none; b=FtAbNqzPJeJPsJD2ebpELwdgZ7ZGL790SPw+x4lL/1qnrSSoaLFrP9oOiV3vWN5jXcGhzQr3SQ0h/zqxeB66k68m1NIWT97NDu/6fS+f4eeyMYWEsWdQ61Zog060VzYSWmHXUZhl/ZrCvABzeDK/ewLROLpYIXqA2HjxWz9EGzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749029655; c=relaxed/simple;
	bh=Dh5sETOJ4BWJWxUEg/0zRr64l54+54tYBCHbntJjB7g=;
	h=From:To:Cc:Subject:Date:Message-Id; b=YcqULp9Oio4kElijkkqAlm93vVMYDzEX4dfjv4cLWibEY7uTJvNOsfCIbfVQ3uUyjF4iY8QYQ1S5HfCqq1Nz/tXLjzM1GHmT9XqvPrZW+Kw5iHQZQZa5nK7W+M0Luxi6/Y3NXyFce4NJElXBcFBh67aun6OVldn6wMo83o0PkQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=OIq/AXZR; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="OIq/AXZR"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b2f1032e1c4so1067951a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 02:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1749029653; x=1749634453; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C53yfP9noFGLpJoOWOCdlk5vVbd4Mts66+R+0j9vNf4=;
        b=OIq/AXZRWq3kf/iUwdy1RnKW4BVkz3WRFVLCIIFC6XyluyQbSYiXvNbAa5jeDR0tcg
         isONXb/JP4qJY5NxYbrtKQsVExh/6BGs73/WQo9qA3HtXhZigQLbiSWzIOfw/Fd2YsHX
         4DX8ZH1o8dGOWpai3i4JmM4rHZZ6+4QgZWeCotV14XYlF0AzufnyTq4Zrnbb30mg7eme
         3rghYJISIWZp7s1yNvIZIZxLNBOsK+wnBZ7A4uM5qS5zSOVdkc7+mVWG16339DgzPHh3
         w7wIpdwXzXYw6KZ0nkLL2dRrDebCpr/QlUa3Z2mNocOqnKZNaqYWmQ7oaxXsP/oky58B
         5zfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749029653; x=1749634453;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C53yfP9noFGLpJoOWOCdlk5vVbd4Mts66+R+0j9vNf4=;
        b=H1vEqd0biaNUDxWFxhdPz+F+8kAyW4K1MZ0btAvrdgRfNH7JOwExnMn+PRky6q7cT+
         qe/45feEx2vIyFIDBydoooiagnWptsJ8uxlEhTOq2knxkvRpiChPCw4OrfpbbrJAan3N
         Sn5qxXcw7QEBrn7vT2foRT6cy3N8MCNTqeBFA9avKnmB1YRhiSQMiE+4gfn4g2YbsNzc
         MjzbwkkpvatD1QBNWDDrvbf2vvK4l4BRH+//1jewovDqEHXZvyLJJfa5c/HPn+Kh28s5
         8/9eViirAoO6cQsE5ScmU7td0zDHxIUyqpDzA3o5Lpbh8jbOLfdfD96HzRHtXhj6R3P9
         k0cg==
X-Forwarded-Encrypted: i=1; AJvYcCVgYrw8n3JtNLN2Rmm4HA7bRuDc6QA8zwPG/hxDChhISwEpI/jua5B9KmDr046nVhmeZOfdLf3TkP9nPZ4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6DV/TDDTpixloJcz40MvGKk1Pz8wNleXAAwdrDSsXS0jaezTO
	GeDBwshYZ1oGKW9U5yAIx2hINp0zchy7aIzwNxBaghiDUAmQtBWJ2FnUWr8SvlekomE=
X-Gm-Gg: ASbGncsugzVKlldAWGrhJWV1EZGTP00LNwCnv0DXjgQXh/yjt+HwQgzUuwvfjisRjHa
	XdovztN/QAZbDKkrYw65iDxgQb+81XKDDgcY3eU3IBsn3fsXjubOkT3+2Q5oocBcwxV3mkFKSKG
	NT6jxAmApKdbBzOF1cnGO9q+2/NXDJ6OHFPuF0lbbzwGjvn/DXuSrmYkiOhiM6cRwGXvTzNDgvM
	UEJRL9pSgl33VP6bh0bVjvnOYo1+ZCQH7MyV/5cKuOaljrbaQB6lDl8ziR2zN90dxACDxkJKCZx
	cG2nmvyXpBKUfNIAjpp5zFpEhwtMb8XMkRP4NIwIiObNvQCydzfPXvSyVbccKlL7cj9xpAOPQyg
	vmm5XZ826
X-Google-Smtp-Source: AGHT+IEFYjc4Tz4Dt5YRmUTvWxmINOOTd2yv6xcgMuml1Fa440dGfF+Zaiu6SCzXijeP68QhevG6tw==
X-Received: by 2002:a05:6a21:99a0:b0:215:e60b:3bcf with SMTP id adf61e73a8af0-21d22bcd4c6mr3584522637.30.1749029652910;
        Wed, 04 Jun 2025 02:34:12 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2eceb0280csm8406411a12.4.2025.06.04.02.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 02:34:12 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	debug@rivosinc.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v2] riscv: traps: handle uprobe event in software-check exception
Date: Wed,  4 Jun 2025 17:34:03 +0800
Message-Id: <20250604093403.10916-1-zong.li@sifive.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Handle the uprobe event first before handling the CFI violation in
software-check exception handler. Because when the landing pad is
activated, if the uprobe point is set at the lpad instruction at
the beginning of a function, the system triggers a software-check
exception instead of an ebreak exception due to the exception
priority, then uprobe can't work successfully.

Co-developed-by: Deepak Gupta <debug@rivosinc.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Signed-off-by: Zong Li <zong.li@sifive.com>
---

Changed in v2:
- Handle uprobe events only in the forward CFI case
- Move uprobe handling from do_trap_software_check to handle_user_cfi_violation

 arch/riscv/kernel/traps.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index d7b5fd576011..3aa5ecda29a8 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -369,17 +369,25 @@ void do_trap_ecall_u(struct pt_regs *regs)
 /* handle cfi violations */
 bool handle_user_cfi_violation(struct pt_regs *regs)
 {
-	bool ret = false;
 	unsigned long tval = csr_read(CSR_TVAL);
-
-	if ((tval == CFI_TVAL_FCFI_CODE && cpu_supports_indirect_br_lp_instr()) ||
-	    (tval == CFI_TVAL_BCFI_CODE && cpu_supports_shadow_stack())) {
+	bool is_fcfi = (tval == CFI_TVAL_FCFI_CODE && cpu_supports_indirect_br_lp_instr());
+	bool is_bcfi = (tval == CFI_TVAL_BCFI_CODE && cpu_supports_shadow_stack());
+
+	/*
+	 * Handle uprobe event frist. The probe point can be a valid target
+	 * of indirect jumps or calls, in this case, forward cfi violation
+	 * will be triggered instead of breakpoint exception.
+	 */
+	if (is_fcfi && probe_breakpoint_handler(regs))
+		return true;
+
+	if (is_fcfi || is_bcfi) {
 		do_trap_error(regs, SIGSEGV, SEGV_CPERR, regs->epc,
 			      "Oops - control flow violation");
-		ret = true;
+		return true;
 	}
 
-	return ret;
+	return false;
 }
 
 /*
-- 
2.17.1

