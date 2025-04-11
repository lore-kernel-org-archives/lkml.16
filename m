Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AA3293B4F
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 07:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744356429; cv=none; b=KmdrFsfIOoLCfxycbwOhWcX6dNjvDbggSjfELAQfS315ItKMVNR/XTKAFNBHziNxQ2WuVLrab8PN2Ly7Mka1Ll9u92EodLQezd1ywcsR8OONHlfPmorjFNi4nuwsaLbv7gpnLUuuxX67in80ShF37+QA6ItiUCgHSh1jEQx8rKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744356429; c=relaxed/simple;
	bh=6iospfpiXarFhMAbeZMPrqrrUAFFsDXq8Q7IfWRbt20=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pKMD4V/Z32O9lsvGE/RGV5tnIN8VtWra4dWThGtx4KBou/EGBm6Si/7KPUfXu0PZUH6c9Vj6nrLWtGpzesoAAEmzBs+6frmNtYyY2tTVXnW5gqmsy8cU6lsnx6LTaGlH9vfsxPcg9Gc5jy5pkqjnq472/e+TDmCiXNlT3s6F8bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=KBk2pUoI; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="KBk2pUoI"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22403cbb47fso17589165ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 00:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1744356427; x=1744961227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OEkz9sj9aVBNDIp/tCSuFWlfQARpupwyYG7ODnJ3fr0=;
        b=KBk2pUoIqmLeNBYYBDfS1/HiT+ojwrIwqpMIiK+aIU6Bpyau5/o2NeMMuu0Dq5aVjI
         J/RMienB9K3eXrwwNrKCXxy2LfBD/TGtej77T4eBfrb9Y2QAdG1wYPz8PZVc5c3bnkR+
         bbIxshFOdd4UiVmoQjIZZ58K+fHBn3w0PHNwqERXxvj9TpykGdFA6698MItO7XVvKMrN
         8YrboybcIGyQbfrIGjkUSbTPLGpFmPkx6vf485eK6kxfPv2Fo3tEI3cXTnCjAt/K4crd
         5r0U6YPrn9ZoTcyH1biWqYQCoyp6k8+pkNZVjouUMXI4mzzHuNcITjLaPLnXORTHzfAW
         JvrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744356427; x=1744961227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OEkz9sj9aVBNDIp/tCSuFWlfQARpupwyYG7ODnJ3fr0=;
        b=RCg2rhLed+E/DPCR2fu3wYqupXUxnHOZNe23LdWI17zuvNAKVxdPRuwSgKaEWHptdN
         zeDSrAwA85YetGDaibU8C2TPIrYP3OtSChTCMV71yNOSSSrOjbhTwcEfKBN6DEMKEOmn
         YhbXoCfIV+gNRbaJLSIj7Ljxojbxqc4VlybtpnRzC9dPTznUj0cfboJKqq6aGJfX2RBp
         e5laG1WN5XvSaH1Su+7CFeVZqmyAzpyEOunYBZngvkgEFL2C4qSxbjO109+BjX8ZXTuN
         bv+xC2h86CES/Lfr5IJpA2KNdPj5op+lTRh2jt2bAMxHX2i+TpcB+n9wwXq4EaTPkmlh
         Y0dA==
X-Gm-Message-State: AOJu0YxiRxGC16ulo8PmdP+Tk/sQDrGOrXIMx3rayts2RHJbuYBdn8kw
	5svp2MKpj/+NxdSuUqfQ+3sedrxZtRA4MfALMdjYhtD/5jloB4Fs9X5ycbxYbFzmLNFQwIsJ35l
	opRMGX0LxvxqRmdXy+3KtHCqeAMFSMyWAF7HYd8q7RtXnsogkTgj4I7C0kbGIb0TX+j+MGYDw3I
	C8VhBjCdtWK4sHt+dh8YTn8SxVVCw4dyIRrhnBkXH1NLMkD3g=
X-Gm-Gg: ASbGnctc19MrA34lgu3JlVLMdrL6dYrFHYVpYsPUqr4YKkCWcPtF7OGo7ZQEhZesyWE
	TsyZ2KVhhIGEi1yMHHMjoBC/OXNYQNqzbJhjwMn9VU+fYSiFnXA/6mV6I5rGWvHLsYw2vB2OpY0
	+6yf0snSv2HiL9J6f+024DzOJKPxBn6VpZqEnis5BjAuAWT6MlDZu/977f4FLCHLBOjjs7ZDR9e
	qFqiaaY14U7n750FjfhqG6wW8g4ObxHq/fnkxAzigTsY1KKRHCXH3/yomsh0Z7Y25fDFB7CCtxm
	vFeKvhceiVIsqtSUxUp67RQsCvPh4h8KGXakYCux7I9Et7IFo9lZLiktR8B0tAi5yP/10hA5xLi
	dUg==
X-Google-Smtp-Source: AGHT+IHGaeBskLQLYpXz2YaNwdKixufR57YYfZ8SkaOfywMMlz5BGlU3CvKcG4DzeH1HMJO/YjugXQ==
X-Received: by 2002:a17:903:1a08:b0:224:1294:1d26 with SMTP id d9443c01a7336-22bea4b6dd7mr24156105ad.13.1744356426996;
        Fri, 11 Apr 2025 00:27:06 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b654adsm42523585ad.1.2025.04.11.00.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 00:27:06 -0700 (PDT)
From: Nylon Chen <nylon.chen@sifive.com>
To: linux-kernel@vger.kernel.org
Cc: linux-riscv@lists.infradead.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	charlie@rivosinc.com,
	jesse@rivosinc.com,
	evan@rivosinc.com,
	nylon.chen@sifive.com,
	cleger@rivosinc.com,
	zhangchunyan@iscas.ac.cn,
	samuel.holland@sifive.com,
	zong.li@sifive.com
Subject: [PATCH 2/2] riscv: misaligned: fix sleeping function called during misaligned access handling
Date: Fri, 11 Apr 2025 15:38:50 +0800
Message-Id: <20250411073850.3699180-3-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250411073850.3699180-1-nylon.chen@sifive.com>
References: <20250411073850.3699180-1-nylon.chen@sifive.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use copy_from_user_nofault() and copy_to_user_nofault() instead of
copy_from/to_user functions in the misaligned access trap handlers.

The following bug report was found when executing misaligned memory
accesses:

BUG: sleeping function called from invalid context at ./include/linux/uaccess.h:162
in_atomic(): 0, irqs_disabled(): 1, non_block: 0, pid: 115, name: two
preempt_count: 0, expected: 0
CPU: 0 UID: 0 PID: 115 Comm: two Not tainted 6.14.0-rc5 #24
Hardware name: riscv-virtio,qemu (DT)
Call Trace:
 [<ffffffff800160ea>] dump_backtrace+0x1c/0x24
 [<ffffffff80002304>] show_stack+0x28/0x34
 [<ffffffff80010fae>] dump_stack_lvl+0x4a/0x68
 [<ffffffff80010fe0>] dump_stack+0x14/0x1c
 [<ffffffff8004e44e>] __might_resched+0xfa/0x104
 [<ffffffff8004e496>] __might_sleep+0x3e/0x62
 [<ffffffff801963c4>] __might_fault+0x1c/0x24
 [<ffffffff80425352>] _copy_from_user+0x28/0xaa
 [<ffffffff8000296c>] handle_misaligned_store+0x204/0x254
 [<ffffffff809eae82>] do_trap_store_misaligned+0x24/0xee
 [<ffffffff809f4f1a>] handle_exception+0x146/0x152

Fixes: b686ecdeacf6 ("riscv: misaligned: Restrict user access to kernel memory")
Fixes: 441381506ba7 ("riscv: misaligned: remove CONFIG_RISCV_M_MODE specific code")

Signed-off-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
---
 arch/riscv/kernel/traps_misaligned.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index d7275dfb6b7e..563f73f88fa8 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -455,7 +455,7 @@ static int handle_scalar_misaligned_load(struct pt_regs *regs)
 
 	val.data_u64 = 0;
 	if (user_mode(regs)) {
-		if (copy_from_user(&val, (u8 __user *)addr, len))
+		if (copy_from_user_nofault(&val, (u8 __user *)addr, len))
 			return -1;
 	} else {
 		memcpy(&val, (u8 *)addr, len);
@@ -556,7 +556,7 @@ static int handle_scalar_misaligned_store(struct pt_regs *regs)
 		return -EOPNOTSUPP;
 
 	if (user_mode(regs)) {
-		if (copy_to_user((u8 __user *)addr, &val, len))
+		if (copy_to_user_nofault((u8 __user *)addr, &val, len))
 			return -1;
 	} else {
 		memcpy((u8 *)addr, &val, len);
-- 
2.34.1

