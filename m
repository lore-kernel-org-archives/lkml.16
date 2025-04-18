Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1D31DFFD
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 08:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744965283; cv=none; b=P+kOc25tMjkIS5FL9MRFVA47fz5twBL2RES4/s6A6aaMp1+DLk4plt8C/znRuM8ARwVJHTHdZXBplzOL816dDiHWxg5oGdc4y+kAjRvGZ8anCaxACmLUOVXpTzAZD9lEk9lJVTW5Mu8XWyslqKBqzWkBnG2tRIJHNiutQ/wry+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744965283; c=relaxed/simple;
	bh=pHQ5GLhEPGPW1mDLd2+kWxmQ+nnvuElCVVOOZIcw2s4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QQrOtnufCZHDpce84Z9y2CQeIFpnekNz4UVXZAGyQAZUunP0BkVYfnG0C+drv3NrfqI0GmtQsBfM8vWXBAvn/m0YjxTzpzjAif51n8M1bIXgjSci8OywAquTbgOycD4sJc51s23nXOpj1icCQ+vKPOHUnAMIrn0W700cDX3ky3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DaZFbPkB; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DaZFbPkB"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5f4b7211badso2624935a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 01:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744965279; x=1745570079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oSsbi2h5iBdXyMC+7dv/7ZG1+XGOWqlefVNADp2s6XI=;
        b=DaZFbPkBWRNvGPuT+X8JVl6A7mXSS7lQ4FHTynbt0xq0jjZwkkXbXm+nch2XIpyoTW
         2+lrFoJJev3/tpUJQQcomFdjmutknN9pk5iUAafP6RaP/VSwSD01TWSbPgVwz5UNyhkv
         V/VJ8ynRBeep6IFWd1/NGZR2qbu6ELAUJ87HYfn8LD10eysjdQa7uRgKEi1yBm0bOutt
         YoJIRCpNsw7DVNZ0/0ArqjDYVUteX6Am13uEmbFMNqa3itwckpnQqg1hCm/MCDZjgAyv
         CprESYNTHBz9MCRci9OM7/jQwouL+dsHzVpa5OJys9S6gljHXcJMX0C7IH1WdwUXI6ga
         FrcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744965279; x=1745570079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oSsbi2h5iBdXyMC+7dv/7ZG1+XGOWqlefVNADp2s6XI=;
        b=MJF/UjtXDcBM7JRj/NPM3DM4YXuqf+dDdh4aUjx1aLhmfcIaVWy2hGmlNkos1jnyII
         o0kf+SF+eTgp5eiXq4QQO+7lLMhZb11jUk7ZtOxI4ppoJbnLm1/LHOEKQH0fmKsBQoRv
         HQdSHdefcY1OTf4XN6v9tdxC63UqQq76H69iBgXrPWiqleOVKkvSE4T4WWDpXcRSwEda
         t4I0bjPxDkqx5MPXMD6k0OJ/hbltPVnG+F6qvXfmOqYNzI13lGoYWaTQ5XSJY7q0xJLf
         BKGyH+cGU7bnt6t0xxh9aCuZqqcuTRHOnEr78QnCIN793EdnpNkkPoYSmDRLmn8Dpp1Y
         +Vxw==
X-Forwarded-Encrypted: i=1; AJvYcCUG5kg/L6i8C8opr82pKWsRMPhR2ReISJjSlLeUYEnZPrXKKJAVu1yJh4qGiDNLLengpihTRRrSRpcjIl4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJbCwSgZ2/vPGuryrFPYpYvhOgQwtzfkCwpIUitKJzG3oLFLUR
	QYPzQGZi4L2qXBWW6WRx4Dmuy5DKcFOE0ElVi9XUAXE5PCqWomNGMnCCsLCrs60=
X-Gm-Gg: ASbGnct2n8gHSbI/HqwIY0o1Q/K3FsorpIsb7+G4HSuZlf2zuGkv6bjWjRfJHS7qDZz
	7GMuA34g26g67DF4zV0vy12g8njUUEbyFgVo7uw1vdpoP35nJv++fXyyxmKAKtECw/MeLqKJum4
	uQV94PeWXEUWJqfEYTcQyFfDuY4ltpq+SKPDodyeySt3Vi8SafxMfd4tfTO3CbGPFpK9bPVyrI/
	ErkEbjNW+4sKXM822RpbLfVgxHjKyqbSDZ4t5DGXghI3mG7rjcP2KyBJ8ULANbjezMcb42vRCcl
	3oRfLzqiOHA4cmGUG/VKtjopiPA+WAZ8EzDe0vuPF/g=
X-Google-Smtp-Source: AGHT+IHZThepsKn9V2bVgxwhlSry+Hpg3Ap47euI0LM2zXl31mU1hs3J0coFckefEzlq/PAne98rag==
X-Received: by 2002:a05:6402:2708:b0:5e0:8c55:504 with SMTP id 4fb4d7f45d1cf-5f628509768mr1562849a12.7.1744965279225;
        Fri, 18 Apr 2025 01:34:39 -0700 (PDT)
Received: from fedora.. ([193.77.86.199])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f625833ef1sm720914a12.51.2025.04.18.01.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 01:34:38 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: linux-um@lists.infradead.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	David Laight <david.laight.linux@gmail.com>
Subject: [PATCH v2 1/2] um/asm: Rename rep_nop() to native_pause()
Date: Fri, 18 Apr 2025 10:33:58 +0200
Message-ID: <20250418083436.133148-1-ubizjak@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename rep_nop() function to what it really does.

No functional change intended.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Cc: Johannes Berg <johannes@sipsolutions.net>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: David Laight <david.laight.linux@gmail.com>
---
v2: Rename rep_nop() to native_pause() first.
---
 arch/x86/um/asm/processor.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/um/asm/processor.h b/arch/x86/um/asm/processor.h
index 478710384b34..d50549e0089c 100644
--- a/arch/x86/um/asm/processor.h
+++ b/arch/x86/um/asm/processor.h
@@ -22,7 +22,7 @@
 #include <asm/user.h>
 
 /* REP NOP (PAUSE) is a good thing to insert into busy-wait loops. */
-static __always_inline void rep_nop(void)
+static __always_inline void native_pause(void)
 {
 	__asm__ __volatile__("rep;nop": : :"memory");
 }
@@ -33,7 +33,7 @@ static __always_inline void cpu_relax(void)
 	    time_travel_mode == TT_MODE_EXTERNAL)
 		time_travel_ndelay(1);
 	else
-		rep_nop();
+		native_pause();
 }
 
 #define task_pt_regs(t) (&(t)->thread.regs)
-- 
2.49.0

