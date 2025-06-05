Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1291FDA
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 00:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749082377; cv=none; b=PzcFtlnHeKnGNfgcFXNl2euGYrBQgrouCqjRjjnvwSMAzv/j9aBLHAVRJOgMHiV5llO0HqX0D86pU2qKN4ettYIm8QR61PBNOwIWiNyLjzSWNgfTQzJqEF8/0yqtRfizhUVkwf8iIKEAqJAv2Dp/29ABYaR2oDgAOlSfNj1MuAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749082377; c=relaxed/simple;
	bh=YJZMDDgQc/tb1CWECbjN53f528oXKyowfHYEh9X4nLY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=asdLXgbIw51lXrCDhESBHTq1pMJmEs3lnDRal185Tannzc7VAueln3HD31c0GfRF3iF8PVCfPXeKFefM+LR1nLevu/ZBjJsDZUBsS13kRqvZX5J3pfGZfGCytxglEeoZSnizTEdtAUT7pW9aHG7axqFw1spbTBjvRHIXNEhxPYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J7XK6+av; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J7XK6+av"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-70e5d953c0bso5251227b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 17:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749082375; x=1749687175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vlm5LuAw0F30K4NgAcQzPC3OcpN/icRBRjLVeEN9Y98=;
        b=J7XK6+av53M/Gws684hFSKC0mD1mcvpXoH55l2+Z5Q6UkGhithYyOFooIwgweAT7Vb
         JFmTz67lT0/9Vy1FJR/DScUqfGBy52AhxNVdeaoGxCKMLl6suMF9ggQuHcn6qZGmeJd6
         M85Z11SDSBivNO8anPxIynl2HGzOVQRln41Wwu4vH/++kgIhmWdlmph4sdQY9WZoLPfv
         PH7pTOsXndkciY7HQmwGoNDDqOzCAaBEMPKkzCr0oZpi2rBheX55ZoOM1LkdZaTWxhK2
         aWG/NXNjdURRuaM1GfAUzkZyDq6DLwnP62QGlzA6IsHJaN6mYkoi4qSmGNqhdbLOHoed
         aTIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749082375; x=1749687175;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vlm5LuAw0F30K4NgAcQzPC3OcpN/icRBRjLVeEN9Y98=;
        b=UoOEOq45eVw4PJu60ucDnwMWJBt4xrzhKk2fmGQTs5vvnN+LjZP4kfA7mLw12NbL7U
         5pSs9e2x4dqBOq6ib+7vD3TSv0iQBq8AJzfiLWYG2rlKYhLRCOoK2KD9HXQeGsB9uSFt
         A9YtHfIyMAyDe1mHAnyefoWa4Wg6ZiqCgN85iJBu2uod5yysd5KVsFox5PDYYFx0r1I/
         Si5bsCnyqMvOCOC8eR4vjsbpzpSThglqZibFYsvPX93WJ7LJohJjXhtqVz6JH7iNn6S4
         vo0itD9XlSR6005Y7SoIG3shYLMaJFzXbe8NPtC69qQeQGuCLPPn2+uLhlGtHCrTeyfN
         EJfw==
X-Forwarded-Encrypted: i=1; AJvYcCWdr8fFhQz35r97oPaJOVhlwQSYG+5601kvZqEhBzrMd0Qj8dqwrRUY0kOvamFAJnmTMFE4h6b2G9O2o1A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHrDXazN+cWUrmGO9KuPp9G0CHyzdbDs7B+m3bdGyzDfGjlUNV
	t124Eftl7HLUP+VAIp1CLfFjzgPcRrq5vYrOq7qBOIQziIGz6EKgeWSezkVXUA==
X-Gm-Gg: ASbGncvxsUJERb+G590rYUYFwHoT7dpOQTtmCILJRdE4iGZMs68aluqmtU3EUG1oT5W
	eGAV50X3s5uoY/0AOhFmXGvtj9fZywxQFCxMYwvgC5H7uyBV6j8t+Gfgtr2r9iuofa4hsVkFj2x
	tFyg8zIw3v8w56jNF/vdSPoySnAaJuRcIZzHq2vpyliYkReSjcg5p9pUkAuSTkjJNvNZmCkwNRy
	rvzTNOd/s00IUsRb3GkCOyzi+h05iuoS+g+Q8nOuxIGJJxnehDPc6emR0eozQ81q7V1cp6Od3wQ
	j6nDVglkMShMAX4hSunAAyk3kRJFjDxLbj1fBNFrk+EWGBGbDNYCwtqIwVFm9njVptjLSjq+/91
	QOMi+JX4UnzCquInIe92izw==
X-Google-Smtp-Source: AGHT+IF6zesAyyqbWv+wh5yA/pft9gVeSHofM9dgbJwAmX9S21FxoAcoddOyYfaoENiGKEaQrOHVBQ==
X-Received: by 2002:a05:690c:45c6:b0:6fb:91a9:94d9 with SMTP id 00721157ae682-710d9d6e428mr76793657b3.2.1749082375373;
        Wed, 04 Jun 2025 17:12:55 -0700 (PDT)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70f8abce4bbsm32743167b3.20.2025.06.04.17.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 17:12:54 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: Douglas Anderson <dianders@chromium.org>,
	"Yury Norov [NVIDIA]" <yury.norov@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] watchdog: fix opencoded cpumask_next_wrap() in watchdog_next_cpu()
Date: Wed,  4 Jun 2025 20:12:52 -0400
Message-ID: <20250605001253.46084-1-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yury Norov [NVIDIA] <yury.norov@gmail.com>

The dedicated helper is more verbose and efficient comparing to
cpumask_next() followed by cpumask_first().

Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
---
 kernel/watchdog_buddy.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/kernel/watchdog_buddy.c b/kernel/watchdog_buddy.c
index 34dbfe091f4b..ee754d767c21 100644
--- a/kernel/watchdog_buddy.c
+++ b/kernel/watchdog_buddy.c
@@ -12,10 +12,7 @@ static unsigned int watchdog_next_cpu(unsigned int cpu)
 {
 	unsigned int next_cpu;
 
-	next_cpu = cpumask_next(cpu, &watchdog_cpus);
-	if (next_cpu >= nr_cpu_ids)
-		next_cpu = cpumask_first(&watchdog_cpus);
-
+	next_cpu = cpumask_next_wrap(cpu, &watchdog_cpus);
 	if (next_cpu == cpu)
 		return nr_cpu_ids;
 
-- 
2.43.0

