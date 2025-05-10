Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83471CA84
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 19:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746905698; cv=none; b=Bn5zSiSbRlKw/piHlbG67KqsxbqqHg2RVgrtQSAaDvVntfB1u8WVdBzPC2+qJN/ahfa5RiUU+ZCF8nykjdraCFk4tavHa7ZVWLxkHvm2owudGrlnhgmmGg2cx+IeP/xCwcTzGqjit3u9z34o+ILKYJ9G4w17y1oT2jecnaTuuek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746905698; c=relaxed/simple;
	bh=tMioPQX0pVyJ3o4jZaR764X0CMWnq2gzkza9bi1CP8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZCX6cn63QlKgK1FyZRdAQDUP0OejiyX5xdHUqpfaQsi8/YQHuqSnS32l75d/0wKHsTA55AASkdFtUdyaHOVb1Ah+sRXp8N5eWQ4QZYwn0EmWNS9fU79hSoNzLXzgwPdkOuoMUTP/CznZGcaFPmpi1GZ1AeUJMA3hddhGeACkO8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lfEx9y5B; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lfEx9y5B"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-739525d4e12so3001315b3a.3
        for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 12:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746905696; x=1747510496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CVsGfWQ8buUPSw0hs7dZBA5g6N+Vx7k04xhAKanYCJU=;
        b=lfEx9y5BZx8ozaEdvIHvbM7UceEzSOGFi/tHMdcm38QN3skJ2qjDCz9W0/cUgbltA3
         UTDqHn+G7ZrS5jHRVWBKwZqM46+1fQVErv0Fm2ZrYFrIxj6H0MsI8ubKProQlJBEHQI0
         nu6qqvuBFrP1u6HDR7StSdyTILNzbFIPUllMAB78mGVF30OUpWxHm5kM6Wc7+fSUHq+r
         hSAf3C8cKbdJdegksZNL4pEIuxH0AQMTl+tepV4p0xGqPQvQ4c2bxVQUpRMVpcpLu3s6
         NpSODnE/Lw+e87FQTqjJENESLr59ArqZ88vuCl9GSY5sY1OIu86CSsVWumGOPEMTKTQB
         1L7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746905696; x=1747510496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CVsGfWQ8buUPSw0hs7dZBA5g6N+Vx7k04xhAKanYCJU=;
        b=beHtg6G9RDlGpikPccr4fLl3patXInG6T1SSRNamMQ4nQwmp0ip1yG2oAvxV//XfCr
         2CJ5U/+edYR79QE6CVOHnoBW/beZoZN3ZhkSx7tNbqb1/gKFYM1iZL2kZCUPek4PnmsE
         Ro1+xZNfRNcqVdo/+GRWmMQXR5mYPL1kiaPA3Q5DAV9Wkt0FRX7mep8U+EPMTc5dJnCw
         SY0Am9qNWfylxim209YW8OUeMv6z0P+8KvnzI2/nJrhWJiYMP0+NcmP8RUb0t9G7z+FL
         utIY3fpmURC8HKopIugcdZPlx1Iqj3lSX595pfvOVCehrqX8eP0uwdrlzdAg7sW8n/1q
         tYqA==
X-Gm-Message-State: AOJu0YxhNwES8uZxqCrsp+glUn1Yk9f7w3Cbx1okU9T7sdpj196/xiz/
	8C37WLEe9ZPJn8FXT77hCEUNprgyfAA+xiuVD2vVBGyNgTz2Kwa15ilYqFev/68=
X-Gm-Gg: ASbGnctmkQ8qvsS7qO6MRsgOMoPYWBRlgq0FUqq+VGmwsTIqmoccQByrKR+d+rzMGrk
	oNwGNrTO2hO3XzOshzWaBXMFmebosDjlcedF88o56OuMmBOtF3EzVjNkz+PfTt/dbecyru1YZ2a
	+JiFJVmYXS8ogFhkjW/nOaVvO+u18lkrlXECInKMGrVigZZFgHggrXrP2JeFoEUQ2t7iMqLjI9O
	jVmVUqwU+4Drl+go0lCBywxi4lPDIXdzkPG3gG9RmKB0lTLn7PNbL4h8kPh8ZlQwTrYGlmN0NFV
	T8nqWbDthYjODDIdNUreU3kvH/VgtmDix7DMKJZarMJoPjHPgA2l3OU3gLXLJP0MkQ==
X-Google-Smtp-Source: AGHT+IEILGZmOaGYbeDaB6qby2u9/rMgMrqD9p6qN7Sq4xb9Kc+yl8rnfNzKED7fDbqMuhG+I9LigQ==
X-Received: by 2002:a05:6a00:2350:b0:736:57cb:f2aa with SMTP id d2e1a72fcca58-7423bfb970amr10893224b3a.13.1746905695748;
        Sat, 10 May 2025 12:34:55 -0700 (PDT)
Received: from localhost.localdomain ([125.177.3.166])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7423775d442sm3519548b3a.74.2025.05.10.12.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 12:34:55 -0700 (PDT)
From: Hyunmin Lee <hyunminrlee@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>
Subject: [PATCH] sched: Fix a typo in the comment for CLONE_THREAD
Date: Sun, 11 May 2025 04:34:29 +0900
Message-ID: <20250510193429.2641-1-hyunminrlee@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Hyunmin Lee <hyunminrlee@gmail.com>
---
 include/uapi/linux/sched.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/sched.h b/include/uapi/linux/sched.h
index 359a14cc76a4..453d365f3c0c 100644
--- a/include/uapi/linux/sched.h
+++ b/include/uapi/linux/sched.h
@@ -16,7 +16,7 @@
 #define CLONE_PTRACE	0x00002000	/* set if we want to let tracing continue on the child too */
 #define CLONE_VFORK	0x00004000	/* set if the parent wants the child to wake it up on mm_release */
 #define CLONE_PARENT	0x00008000	/* set if we want to have the same parent as the cloner */
-#define CLONE_THREAD	0x00010000	/* Same thread group? */
+#define CLONE_THREAD	0x00010000	/* Same thread group */
 #define CLONE_NEWNS	0x00020000	/* New mount namespace group */
 #define CLONE_SYSVSEM	0x00040000	/* share system V SEM_UNDO semantics */
 #define CLONE_SETTLS	0x00080000	/* create a new TLS for the child */
-- 
2.43.0

