Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B0F1C860D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 16:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743524869; cv=none; b=t03XE4jTC+mN1bMsfB5UzT3kjXmfzO7eFMUinHaUv/GYHWSQViQttS4/OKo+0xAUuALmlSK1ruR/ls+9ZM0vjuIvidCbFTqMZT3c9SAwAj+1cFIflxwyZ3oGm8/AUlA50J8+UVII5WUbQGV3I0bPrwleiOi0MTfnHSXjX4WP8MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743524869; c=relaxed/simple;
	bh=ZMW460j4yvUXHsvkTIv+BD8ZfXx82a8vjtmTL9t/URQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=f952hNddWvlBpS/0UzaTBbJnvEk/CyzybsiSUJdikCggprPCG3I+DfcBmsSbkrUk5yyV/Wxl3/Rv+iScGgIUwXsMo45M+gxZHSTmmj4/yecANJd58O8dCX0ekVvo7PklAOVR9+cVOYE/Dxiw8VoSQAt3uWR63+6Hv6dh6n+DHMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FrmSTm08; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FrmSTm08"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2260c915749so81262755ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 09:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743524867; x=1744129667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=uUJVpyhXXl0R+Y6u4P5cxjoPTeSqrUrRSHznwsddnWE=;
        b=FrmSTm08YsJgexGokuMqyf7j4+KYtBqzq+n7R0IlGUuotrYrXUFsH5IPczx25A8agJ
         IfKEgMQHNEQ7L4gs/Fec16+Gf+kAWSvfm3JHabRhqzm7nBJecigThkG9vMC6QexsIFV2
         5pqim+Yj+7BcTm5V9fJEg1PymM+ySmBn8cHrcmGBizB9fUg2zPyZO06C7H9T0s8mKejy
         i48GK5K633PcSwxxM/M9MtRoPKgQDOG++mNhASvqFVV6xnVVGRl8jyOe+yf9V6ZS8Gq3
         gJM8A6nCVIwy7sbBeXMFmEPCP1eYZeX6Y+G/mxSdVCKVhC6VGzc+P85uLI+BMY0TIe7F
         XvdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743524867; x=1744129667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uUJVpyhXXl0R+Y6u4P5cxjoPTeSqrUrRSHznwsddnWE=;
        b=hOr/WEt/tDU3+/SzTavDfr1tzR09ao5OVKyIKoo2DcRasuwgDPPYIrXF4GC4znpNQH
         Lb9jjSx1Yvegsevx/D/OQTAYPFe2A+9mYNmN488FCk4fDzJTSRPxnyXORa/CNNCUOR6k
         vM4BZUOXELYNltrJytDq6IKEAqz8rDqOLh+ZLT3EY9w8+fullpheWykdtbH8/N5yfejK
         stFRUHABMX2fJjTTeR3xrO5y3qqnFCZR8m7iZRdTnhUEYlNCeA3Yz9aSJpozbuor9AC2
         ValiPKKv5IdOknDsYZQgPEnNie1lxDlaVnHLAGEKo5YUkV7S61wcW1JWPRKUKPSs2Syg
         L9XA==
X-Gm-Message-State: AOJu0YxKk9TtsUwZ78N7gq26lOtMMbM1enb05Lo3tchWZr0drxevlkGl
	HKV/8kQMpJaZZJedjZEeuXkuSbM+bqZcqemzFoVl5x6qdtdY3BOWWA3y+aD7
X-Gm-Gg: ASbGnctQS896TAYyq5unpkriAIztlkjkmm1P2Py8IfjshJ7lwxmkUI1wsoJcdwEBK1Z
	IG8hfuYu74OIi2kgCK6MA4r3b5XuYqzmuL201WBARqXGSw0v+QxilbT6k1fqNUjcwu3qgOY+NiN
	kOCXQTinXoiy5U3u/BJ9zWEcsStRxXfGnd8CpZ5H+0/7fyFgoJT96NcoEfF6qTku7iBRmJAgjyS
	WQ0jT8OwJkhIDHTiCx98NagquegNID5O00s/ci2lqeTxqJHZlM/9Xt8691Mu2F8YTS5fMOOR7wB
	2DIKnv/zeM6jTO0ixHvAnsPt1IM80L/46C+GDu6D3Kus
X-Google-Smtp-Source: AGHT+IFbvSbuYksS0cUFpnTJ1cNnFU1NZdZ1aRECup4b97Lc3hkwOzBF/Jh86Tgca6Dfc44Z5bm9fg==
X-Received: by 2002:a17:902:f643:b0:224:249f:9734 with SMTP id d9443c01a7336-2292f943ec9mr216630845ad.4.1743524867308;
        Tue, 01 Apr 2025 09:27:47 -0700 (PDT)
Received: from localhost ([216.228.125.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1ded78sm90544625ad.197.2025.04.01.09.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 09:27:46 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH] cpumask: fox comment for cpumask_any_distribute()
Date: Tue,  1 Apr 2025 12:27:40 -0400
Message-ID: <20250401162743.10445-1-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'Return' part is copypasted from the cpumask_any_and_distribute()
and refers to a non-existing intersection. Fix the wording.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 lib/cpumask.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/cpumask.c b/lib/cpumask.c
index 5adb9874fbd0..81f5d2522eba 100644
--- a/lib/cpumask.c
+++ b/lib/cpumask.c
@@ -151,7 +151,7 @@ EXPORT_SYMBOL(cpumask_any_and_distribute);
  * cpumask_any_distribute - Return an arbitrary cpu from srcp
  * @srcp: &cpumask for selection
  *
- * Return: >= nr_cpu_ids if the intersection is empty.
+ * Return: >= nr_cpu_ids if @srcp is empty.
  */
 unsigned int cpumask_any_distribute(const struct cpumask *srcp)
 {
-- 
2.43.0

