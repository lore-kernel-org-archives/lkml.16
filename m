Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364A0189F56
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 20:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750017863; cv=none; b=nNZSJgrRELYN8G4iPBX4C5M5frrehmrMViSqH/5EvVTO/W/w/yAT0+6K7s4jMXzPegENyP9n2h9xd5jslgsjdZQqEZbSOlAaaEfm5ythFrc6Jt6S89Tz07e/QTR5lhMazrwmk+yg1IaMG6VupFDos9JILFacLXpqvW9AeZbm6aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750017863; c=relaxed/simple;
	bh=7u3biifVEkBYK3aFrDxMpRni1k3cCbUKAsXpAfdGZUU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aGCG84uwdCSUVygNv30WyNWxyY9sFZVKUTTkU8NkSc+2zeBxygYnCkqWME/JVYa6BHNQgVvpDd9XxcJz7Ix00B2eYtQ73S6qRvqwYtUIYc7BKZuYkfuH7oifuY3G/tdZZDHGyTwbMElA/f8AgeSh4yxKoy9wA5+EZxLz7WEbDgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QEhPPvWT; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QEhPPvWT"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-74801bc6dc5so2964844b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 13:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750017861; x=1750622661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dkJW2AWqMDnCc0DNw5u/T8JdewTSagS4cvGMq5FVa/E=;
        b=QEhPPvWT2BN1DnumqVKkAiexr6IW9udHv6zQstB8tXpgz9oInOCb/VnWS+7Q0VZqj6
         /s0yYzpD6TcOnyu8lRMN2yhIl2I29eyyFVp0nTaP9bgl7ZFunP2/bhRCPsUs7Uk3McJ2
         erYD5YvznjPvALvFXWcitQzsqETOh58UzqAtrUHlpio10kxFLC1lB9gqAUcdYX+f2/E4
         euoWYzhIAgANT1Rn146vz4Op2SNfvOj8TnDcbIiaISC7ba4zXGt8EkVzALDv5Pn5hkaR
         F0Wx4e43Y5K0QxWzaRu6LiKrpfNk6BvEtQFUTfTJjAAcBdBZ43RdNviPIrYXFx9vee2e
         8NOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750017861; x=1750622661;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dkJW2AWqMDnCc0DNw5u/T8JdewTSagS4cvGMq5FVa/E=;
        b=b2Z+ONhZB5KRCjDLLSlAlSQcG9AOy6D0kM/yUGYey1i3Hfhcd0uavIKiII2gIWti6J
         adKD8+QPAZIfpaF2eCaQHIu7svrqO3twPMqEu+t3giBXMzkwJoUEcPhXXxfjpU7JhIdb
         LwEX7HsCJ2CUflHgDGYz+DX/ddULSblw7O2YXkmnn5Y8QpB6zJbQK71FX6HhfhR8Xc+X
         MsCzj3tTu7RsxDhsiqd7CTasXb9E48omZR0s7dNxbbjIXo86TgnOja6pdCUUDU9X7zdO
         pTPmMI34Pnslr5Ab1hdiTYRRpEGqcTp1xDDyLIxoxqkMH8bhg4L12NwUzCp1Y8N2c2yt
         Wgjg==
X-Gm-Message-State: AOJu0Yw9kM1cvvhgLWivGm0ooEPO6EXe8UTqFygDLE8CsTFiyny7yiR4
	pomrZaru4SaXzsYuEZQwbTBtMu92p8doKsG9ydBCJ4pG29ZzHlSApABRZbxJyOrqZ2Q=
X-Gm-Gg: ASbGncvcMmBKH+B5wQ4n1XldDf77luaucpohsba3xL1AWWqMXFV92w6PeKRgWe4zmJT
	Y/2WUiro9882YVlblk3Tb1H9UmDVkoFTbP3tX6VxNEbMItun3y44IDaitt8Z6vmq9jCUPIcpDqT
	3csbodNGZe2vLlG3BXKTJuspdJip/f1WBLCvhDv1jKA7DQMGCI9vWrT9iePhN40dBgY8xGovkXU
	94HeO8TxuYd46mdb9GIZt7USqiGQLzB0Vn0xJVjSZNlpMeCukvAGcjgG3UN/DkN/QiyJBxzKqua
	vG6hU7M8f35IDqjI2Kq7h1Gvz+wsPnWnl5JBmXJdhcULqd/FDEqMFYwuWOvf8ybxvCmKqxrpKit
	aJWhlVwNJhFq8BgGZOptLeppr33sODwoiEYE9UYKTdRbyJc0=
X-Google-Smtp-Source: AGHT+IG862mpefWPDeWJY0YoLaAc8CbrNqadoNo5XfFmf13Uv/7ssd6iPT1dXMxgbPSznss1GKSM+A==
X-Received: by 2002:a05:6a00:9181:b0:748:a0b9:f873 with SMTP id d2e1a72fcca58-748a0b9f8d2mr7273244b3a.9.1750017861140;
        Sun, 15 Jun 2025 13:04:21 -0700 (PDT)
Received: from eric-acer.tail151456.ts.net (36-225-71-230.dynamic-ip.hinet.net. [36.225.71.230])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7489008303fsm5209655b3a.79.2025.06.15.13.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 13:04:20 -0700 (PDT)
From: Cheng-Yang Chou <yphbchou0911@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: tj@kernel.org,
	void@manifault.com,
	arighi@nvidia.com,
	changwoo@igalia.com,
	jserv@ccns.ncku.edu.tw,
	yphbchou0911@gmail.com
Subject: [PATCH] sched_ext: Return NULL in llc_span
Date: Mon, 16 Jun 2025 04:04:14 +0800
Message-ID: <20250615200414.42827-1-yphbchou0911@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use NULL instead of 0 to signal no LLC domain, matching numa_span() and
the function comment.

No functional change.

Signed-off-by: Cheng-Yang Chou <yphbchou0911@gmail.com>
---
 kernel/sched/ext_idle.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/ext_idle.c b/kernel/sched/ext_idle.c
index b79cbdb7999a..dfacb0ad9b6f 100644
--- a/kernel/sched/ext_idle.c
+++ b/kernel/sched/ext_idle.c
@@ -249,7 +249,7 @@ static struct cpumask *llc_span(s32 cpu)
 
 	sd = rcu_dereference(per_cpu(sd_llc, cpu));
 	if (!sd)
-		return 0;
+		return NULL;
 
 	return sched_domain_span(sd);
 }
-- 
2.48.1

