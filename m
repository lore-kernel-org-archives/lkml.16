Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B913C465
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 08:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749976157; cv=none; b=J9QxxpIvD1xGoTHhbZw8yo5/xlSIb7v0eJwmds+k1SIMuaTUzzqZ1uNYfVfAruCSo13NKXmytrJ30XB2SzbmIlqtPtjXW0gDhTgWBsQWbb7ovoeJy729af/IwiJtIysse5ZLNeC8kHHIDvbQRfO8RDh/BXIWS/3wvRu/c/xHwbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749976157; c=relaxed/simple;
	bh=EYfiUa5mXtaSIQ7XIPjhBpxotl9+j4Er8WCeASkuVEM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fOxGlSGMraE9OCbNhBu+PDia9MqzpdlHvQ5da1xX3+3rLYbscQ46fnls5ijxOx6Ig8eDHkwiEhZ/1kMtZvTXkvPdme0UqwVXfxhs/tVmb1SSSmgDQGxSIIYh4gOq+yIKuo6z7LOZkqfpyztjqY5a79Dd1rstTGaUQjfBsL+tzXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JqDpN+J5; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JqDpN+J5"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-606ddbda275so6855611a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 01:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749976154; x=1750580954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BCm2IXUL6NGElvr3PCVbEgm92n7TAhNaNv0J9VuTp/E=;
        b=JqDpN+J5R6OzLDDQFzoT74YkEWuEcwz/csm0uZkaVxpviQmiboTPXToKsktfEVSasL
         75yVZVeD5llBqN00DQS0RLAjSfrEXAQPvWwd1DlcoUbH778bQOz2MuQJUhKbVdlzJ17J
         SldHUxCWwXyjrBbUIQlA0SdCn9AYJ/J4ToGaYo35jC0qtJpI77wb+VeninQ5ulg24lw4
         lGKkdpmqONj4cTTJe3No22fScr3lQqTvXps/DXB+HGVQUK4Rr6Z14zy0HDHwCuvGArL8
         kr9HWh5NySCmNF6mxu2NvTrndPNXapZLaMZI7JmhG6yTTx9x7oqjwGijiLdI1Ip1mfqj
         J3Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749976154; x=1750580954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BCm2IXUL6NGElvr3PCVbEgm92n7TAhNaNv0J9VuTp/E=;
        b=vGYDX4yccgmCi9bU6oKMWMfMoHJNCqIZhY+wXjlveANabhbpV0CgQfhHvfratA5iLs
         E5nJqVmWfvBm4oqzOUR3gVs+9rwE2aZMJC/QJwW7admbJcuFwgWA0lL5xBhBN5+SMJG3
         TdnRPMPX7PYi+UNEn+MObpuaxTIorILV0gtHELPKumO8+85vKEsTQHeajjkBjfcaOb+/
         7GIaxTAY317l0cos4EgwjMyzacWYqhi5HJ5w47mhpD7Tmkxl76xbxZ3/JGVgKr7MPm4o
         WB6KfYW3I3KysDm1crZvcpTuiYs21057lNj+7lY8B1rSRF0CsWUbT3TPrBdk6Bafrb/P
         zr2A==
X-Gm-Message-State: AOJu0YwxiU90IrfpwN5GjiGaz4Fu71OaCDmZZpXRbJ/vBhfUwl0Q8hiK
	575+zH8M+PBYz2O8rqe5gyG2oxTK7kzjbxbwyShfwwy3yAzbCzpOEnsq
X-Gm-Gg: ASbGnctWHQc+7BpD3RcGGxnNeas8QKC6sTyL91piKbMz5RB84YN16QtOvxMhQqlC+nB
	tIifM6uMQsEM1o6aMdgbdZ4Xry686+M1HijEbXgpwQavova0AbqG41GGN3mkITLEXYRxgruXprs
	+dLTKeAgm9FNXS73EZ8HLpPoQ6hBtHUZ3kj3B5ZbsIwzUaFhZ++g2vmwil8kO7DkPQc7F7LwoT1
	mHBWdZfY4+9C0pWUSnEyJjisT25Xe8VK/SRgSzdP5C3QOnLu7gSmUzHl6V2pPUPHdozDDLWY5Ak
	STfu6NQpkEvHHMiE9mEztUswiItusxk6JoavF/08UFPxXguJ+y195leTEyod/nuopa1n7jZ67QZ
	1uw==
X-Google-Smtp-Source: AGHT+IEmqT6zTUVA9nZaQ4siMiMpgJ623rDrUhYBNzJ3W3t3Mln3cMZJ5PFRQPY13csr6CyHiD/8hg==
X-Received: by 2002:a05:6402:1d49:b0:607:783e:5970 with SMTP id 4fb4d7f45d1cf-608d0861911mr4564881a12.8.1749976154318;
        Sun, 15 Jun 2025 01:29:14 -0700 (PDT)
Received: from localhost.localdomain ([41.79.198.22])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a5b6b6sm3990792a12.38.2025.06.15.01.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 01:29:14 -0700 (PDT)
From: Khalid Ali <khaliidcaliy@gmail.com>
X-Google-Original-From: Khalid Ali <khaliidcaliy@gmail.com
To: tglx@linutronix.de,
	peterz@infradead.org,
	luto@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Khalid Ali <khaliidcaliy@gmail.com>
Subject: [PATCH v2] kernel/entry: Remove some redundancy checks on syscall works
Date: Sun, 15 Jun 2025 08:28:17 +0000
Message-ID: <20250615082833.858-1-khaliidcaliy@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use SYSCALL_WORK_SYSCALL_AUDIT to check if audit needs to be done
instead of audit context for consistency to other syscall work bit
checks.

Signed-off-by: Khalid Ali <khaliidcaliy@gmail.com>
---
 kernel/entry/common.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/kernel/entry/common.c b/kernel/entry/common.c
index f49e3440204d..3e9f2d40230f 100644
--- a/kernel/entry/common.c
+++ b/kernel/entry/common.c
@@ -17,12 +17,10 @@
 
 static inline void syscall_enter_audit(struct pt_regs *regs, long syscall)
 {
-	if (unlikely(audit_context())) {
-		unsigned long args[6];
+	unsigned long args[6];
 
-		syscall_get_arguments(current, regs, args);
-		audit_syscall_entry(syscall, args[0], args[1], args[2], args[3]);
-	}
+	syscall_get_arguments(current, regs, args);
+	audit_syscall_entry(syscall, args[0], args[1], args[2], args[3]);
 }
 
 long syscall_trace_enter(struct pt_regs *regs, long syscall,
@@ -65,8 +63,9 @@ long syscall_trace_enter(struct pt_regs *regs, long syscall,
 		 */
 		syscall = syscall_get_nr(current, regs);
 	}
-
-	syscall_enter_audit(regs, syscall);
+	
+	if (unlikely(work & SYSCALL_WORK_SYSCALL_AUDIT))
+		syscall_enter_audit(regs, syscall);
 
 	return ret ? : syscall;
 }
-- 
2.49.0

