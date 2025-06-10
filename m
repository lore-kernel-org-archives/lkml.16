Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BD3246BD8
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 13:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749560524; cv=none; b=ZgNul7ckYBMGCJsHIPwo1EW3R/8BfsFm649aWBaKN4H2v2kfklyrSlUAjhA6M6TF1PG8ZtZ4c/E0Ik9hRHCqhTx1ZCSIeeS/GcIWIr1VGh3RVBUBA0ODwh/MgSM0Yh89vcn4cLt7ChCowpJIMDti841QCexhUc6Tz5OT1T+tR4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749560524; c=relaxed/simple;
	bh=LLw1WVY7iM1gl3bHq8eSytlehWa9u57SPPp8NFt4Qt0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uCfUxNa5A/FurIBeeToptCQoIrtRPfzUE7yVM+d31rxE3iWjteXa18Dgj3fgbeFqjuv2RtcrF88u1NPZm9bkQwCkR7YSgzVZClxt1TfDA0q4Vb1ED0D8xD04CH1pV+fvPmiHk7yAD+3Z4PsyHnEyXN3Ja6gGMI5RtTOb4K7dlpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HvH+9U8X; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HvH+9U8X"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-74800b81f1bso4155896b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 06:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749560522; x=1750165322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3mr9Kkxjz3uVhC+CHfSBBb3SSQ2+EGeu87igD9Qo4SI=;
        b=HvH+9U8XjCNnJ5LvjBjtmLVQikZYe3RcKDLFYDHlE8SL10nOF8SJdh6npV7vHFFjqp
         2VSLZ1rPnIj2ZUJB4WIbLvQ39f3/yVG/cHSzspUtt9thAEZssADzby36CN9nXlHxo0sa
         fWnfcn5oJlotljcTpO61xKD/gYz7KfzJByAMaI1t99zO0D5PqQ59dFJbIqm/XGZQ8yD5
         d3f3MIzs5zeSk4dXMskU7XvH8xXOViN792P1jja9u1HD4u96buh+JjcvKec5h9p05KWN
         NgLX4A7doO2krRC5atJeaqxXpIxQhhnpj2/I3mLQ6Cr6vY5jPBquwIByHmvAVZ7X82Ax
         QkIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749560522; x=1750165322;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3mr9Kkxjz3uVhC+CHfSBBb3SSQ2+EGeu87igD9Qo4SI=;
        b=r7QCTMS8nwuQWyg5FcHueDpWCfCN6KKQyCUYEHYvjfPLpWGPZy9Dn1N1LxeLe2B1BC
         TTHGksG9OYD9Ob7grGgkznj4KGq44nrb16Bmt50pMF6wvsvTh/3m/uoy8pHXBnAdcplw
         RUQ28U+I6FUbHDOex6oR/vLbq0NZ5AAdiVSwTlkyyL99Jy84lVgMzDDr9QgyYsBFKVdr
         dNLdN4CbvkUIzH8wMYpMPBCcMDVcKGgWC+X32lEF/K7xmld22Bf2/DImJucZX0nr12AW
         KQfE49h/8+gPtjlny7BHmKZKBC6yeBEepEdgv+RwxOWr/2yRN577CeSDCEuA3DqRcXca
         lcgw==
X-Gm-Message-State: AOJu0YyCATqs2+t982ihdSQtKLbrH5UhK7VXsldL/c0ENfKklKC+z9vY
	njFINHcz3uSptIiVBoYeIG+7bWmNmgGSx1ff9tmyiD73eUiAgaPcbLaF
X-Gm-Gg: ASbGncuAPJX/DTOpZK4KJVVXKZtwvkXewpMFOwL4gZxzv+TWfPMVZ60aweJo4SPrCsp
	mtHnS6az/Qs9Vp2LIbXENy57AXfgO8FrlDtaHEUizC1aImPyTHyUj8JCDN8ga0XPrhswj53IbXH
	Snudw49Of9rBiFLVwiJZhPwyj+T2xT+U86aqmOPDeUUWr5zJC4e1F+djp1+WNePDB+EwTBi56L0
	VTbJXinhxDo4rA8+A7YHRoCJ5ShUp1ilFFdKqlTtRo19Qdo6d1imZj+r1++RfTU3b16HOUL8QrV
	KdczIqNQLhl/CvAjAG/ieL7uLBohXyF0LVV0bSNUNoxk426WFsza7Pg7EfHFpvSKGEXL097Tpw=
	=
X-Google-Smtp-Source: AGHT+IGgjqR89jbAFAvmQDefPM47LN0oPyUNWwW5mmjYBaiRh/0OF7U43DScCO5p/t7yNA/skdUoFA==
X-Received: by 2002:a05:6a21:600f:b0:1f3:418d:91b5 with SMTP id adf61e73a8af0-21ee256942amr27062065637.24.1749560521851;
        Tue, 10 Jun 2025 06:02:01 -0700 (PDT)
Received: from VM-16-38-fedora.. ([43.135.149.86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482af3825bsm7368353b3a.24.2025.06.10.06.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:02:01 -0700 (PDT)
From: alexjlzheng@gmail.com
X-Google-Original-From: alexjlzheng@tencent.com
To: peterz@infradead.org,
	will@kernel.org,
	boqun.feng@gmail.com,
	longman@redhat.com
Cc: linux-kernel@vger.kernel.org,
	Jinliang Zheng <alexjlzheng@tencent.com>
Subject: [PATCH] locking/rwsem: use OWNER_NONSPINNABLE directly instead of OWNER_SPINNABLE
Date: Tue, 10 Jun 2025 21:01:58 +0800
Message-ID: <20250610130158.4876-1-alexjlzheng@tencent.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jinliang Zheng <alexjlzheng@tencent.com>

After commit 7d43f1ce9dd0 ("locking/rwsem: Enable time-based spinning on
reader-owned rwsem"), OWNER_SPINNABLE contains all possible values except
OWNER_NONSPINNABLE, namely OWNER_NULL | OWNER_WRITER | OWNER_READER.

Therefore, it is better to use OWNER_NONSPINNABLE directly to determine
whether to exit optimistic spin.

And, remove useless OWNER_SPINNABLE to simplify the code.

Signed-off-by: Jinliang Zheng <alexjlzheng@tencent.com>
---
 kernel/locking/rwsem.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/kernel/locking/rwsem.c b/kernel/locking/rwsem.c
index 2ddb827e3bea..8572dba95af4 100644
--- a/kernel/locking/rwsem.c
+++ b/kernel/locking/rwsem.c
@@ -727,8 +727,6 @@ static inline bool rwsem_can_spin_on_owner(struct rw_semaphore *sem)
 	return ret;
 }
 
-#define OWNER_SPINNABLE		(OWNER_NULL | OWNER_WRITER | OWNER_READER)
-
 static inline enum owner_state
 rwsem_owner_state(struct task_struct *owner, unsigned long flags)
 {
@@ -835,7 +833,7 @@ static bool rwsem_optimistic_spin(struct rw_semaphore *sem)
 		enum owner_state owner_state;
 
 		owner_state = rwsem_spin_on_owner(sem);
-		if (!(owner_state & OWNER_SPINNABLE))
+		if (owner_state == OWNER_NONSPINNABLE)
 			break;
 
 		/*
-- 
2.49.0

