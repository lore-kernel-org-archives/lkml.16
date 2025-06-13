Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FA124C084
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 03:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749785704; cv=none; b=mKpnxT+qLuc9EF9TgZA1HmA0K7MyWXm7i4zzUZijvJ7qLpRecFjkA5zNNvBEEL7BuwyfZcaM2nAsO1R+tXoSXN11pX9f1mbDZ9fQ5957ROc1HL9N+gec1PVynHdQmMjco5u/FTMZp7FmMi+t6M0zUsAvSszgJNCw3vo6KVqItzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749785704; c=relaxed/simple;
	bh=Vtzq4OfDOPaA3phKqXp3fNWmDWjUoNtA06G+mvdfVLo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Aque2T+12hOUJAjbkTLb/D+DyGoKUtnbA6abaUR++WO7lLyRZBxSJ7Q31R9MSa2iMZtnPSfsTBJe1/bHY+WgohIA8sAQQSYqVWxG+OBoUrLQErNsJ0lNqx4SLeMbeXbmTG2gUY4/QbLyZFKj7++qsQ/D994q+AiXjDb9mdzeKEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g+9j67z9; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g+9j67z9"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3135f3511bcso1467476a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 20:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749785702; x=1750390502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MV4uFc6vVwWL/rbS0pW47KvDrxXYmYxSN6tuasAUz2c=;
        b=g+9j67z9WuMMBF1YFFIRwT+q/JKOPZy0E5uwhIFRiqTFajU6i0pdeiUp3HwTQSLWdO
         a8f1eXeYhUcJv/LycDWu8B2qC4yzNTgLLOCdNGsBCwNUV5/q6dz/3GvDYp3u5fRFTe/u
         hO9k9YxmYkJoQDiXwequjcxJM9cNmzWjnKM5JiIMJ4Z7qzFTihs+z3B14mPFnKqzb6wh
         xTB1Yz4Qc2Dvbh99AnMjTZc1Qu4JYCrjVxHLpbXLrr+MBazm8tX3LIm2R9Gmp3SRCv/t
         bITug72BY7lDbLvjv59qr9GgMMReCYQ+48oUsU2AQa+CFHVFQJiMjhqUetQuIwHVQEuK
         0KSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749785702; x=1750390502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MV4uFc6vVwWL/rbS0pW47KvDrxXYmYxSN6tuasAUz2c=;
        b=N9W6iXeC1jvwB96KZEMEyCIc6m9aYX44vFQ0s/Ny0gCS9tnZtgqapSgbQoqf8xI/16
         x6chnTAeP2cTZ4kbtMCQZGxW8Swc7LnB0vMobd3AfeYb5RQNARHwPspku0N4Uanbc99u
         HG6EXUrAKvJEkUAHtIz8IZAZn5dIbcjVATYrP/WiM78JMPoEE1HkzO9yvPBLF2a9lVEd
         bYbIVMeAxVgIR/2zX9ygrYGL5ny6dzRjFSx3+WKkVLKhyKOJYA/p7W0qBn3s0NN+Sj9N
         oG0g524VIEzfFTOb+ZU0u87xxs+8mcM39wYiVXy+YhP8vwg06LI9oLJuS7BKt7m/nYrb
         p/gw==
X-Forwarded-Encrypted: i=1; AJvYcCVWm1RW3bK18rIofrrGiUndDqwDscPnjo+zBv+84j2EKKy9Eku3zVNPBLxH5BXljjXAH2tNE0EaQ73LxN4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzmxw6ALNo0bOsNgACC4r/pOJlvauCgg7QunlsNF6c4EYBRT7aV
	rct1e0LzaH79wvueC4KKe0YfredBfaZSlLVk4I1pZDBvqb1bCQNQzJvp
X-Gm-Gg: ASbGncvR0G1geUUwsOM9nWP8cL1NlOCcZcd69L/yrGcpGzhc7uNi6GLDCWUSR2t5kaR
	vqu7cz8mm+CZnBO4mD6H5p8C3ccZkRA4GZFqMdyh7LTI0COCm8jytIBUJ12RhWGh3zcFXUncUsk
	RcmLigYEM6WiYWvQBJX5J2HMteosHh5Av7Hx9wcGvagNA9YxG767K0caUp+r3OfoHd86OikMY3R
	tc2P9rK/qL6yJCoRJcjSJGt7rAu1rV7aH8kTmfFeeSnZ/3sFh8za4r/B0zQ6BV19VU4VsR5wwo1
	6oFLQY2WX87uqSVMcUxA08FoRjimyuQauJMt8N9LsHA4yecWDrwYcKnDzqbXXFfr3L6/21/4tfA
	Bo21n3tpJSjRz7KQ=
X-Google-Smtp-Source: AGHT+IFBQD7BrhJhqNst/xSBfOtv3N+sY80Vdm7lbkC+9a42TrW8pSZIA5GyYozmcOrqH1QWVuN73g==
X-Received: by 2002:a17:90b:3f88:b0:313:1e60:584e with SMTP id 98e67ed59e1d1-313d9c34df7mr2348709a91.9.1749785702170;
        Thu, 12 Jun 2025 20:35:02 -0700 (PDT)
Received: from vaxr-ASUSPRO-D840MB-M840MB.. ([2001:288:7001:2703:873:d810:9d97:1c69])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c19d1122sm2339081a91.13.2025.06.12.20.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 20:35:01 -0700 (PDT)
From: I Hsin Cheng <richard120310@gmail.com>
To: yury.norov@gmail.com
Cc: linux@rasmusvillemoes.dk,
	jstultz@google.com,
	tglx@linutronix.de,
	sboyd@kernel.org,
	linux-kernel@vger.kernel.org,
	eleanor15x@gmail.com,
	visitorckw@gmail.com,
	jserv@ccns.ncku.edu.tw,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	I Hsin Cheng <richard120310@gmail.com>
Subject: [RFC PATCH 2/2] clocksource: Use cpumask_first_but() in clocksource_verify_choose_cpus()
Date: Fri, 13 Jun 2025 11:34:47 +0800
Message-ID: <20250613033447.3531709-3-richard120310@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613033447.3531709-1-richard120310@gmail.com>
References: <20250613033447.3531709-1-richard120310@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Utilize cpumask_first_but() helper instead of first using
cpumask_first() and then cpumask_next(). The logic is the same here,
using the new helper will make it more conscious.

Use bloat-o-meter to check the impact on code size, the result is the
same, does not have positive impact nor negative impact.

$ ./scripts/bloat-o-meter vmlinux_old vmlinux_new
add/remove: 0/0 grow/shrink: 0/0 up/down: 0/0 (0)
Function                                     old     new   delta
Total: Before=22590709, After=22590709, chg +0.00%

Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
---
Generally speaking, I think this is just a small tweak on the code,
making it more readable. However, no benefit in code size or performance
as the implementation behind the helper is in fact the same as the one
used here.

Maybe more tests should be done to ensure the change is solid, I hope to
seek some suggestions from everyone who has any ideas, or this is enough
then it's good.

Best regards,
I Hsin Cheng
---
 kernel/time/clocksource.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
index bb48498ebb5a..12ff0c048570 100644
--- a/kernel/time/clocksource.c
+++ b/kernel/time/clocksource.c
@@ -323,9 +323,7 @@ static void clocksource_verify_choose_cpus(void)
 		return;
 
 	/* Make sure to select at least one CPU other than the current CPU. */
-	cpu = cpumask_first(cpu_online_mask);
-	if (cpu == smp_processor_id())
-		cpu = cpumask_next(cpu, cpu_online_mask);
+	cpu = cpumask_first_but(cpu_online_mask, smp_processor_id());
 	if (WARN_ON_ONCE(cpu >= nr_cpu_ids))
 		return;
 	cpumask_set_cpu(cpu, &cpus_chosen);
-- 
2.43.0

