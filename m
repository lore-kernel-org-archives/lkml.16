Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1521EEA40
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 19:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749411948; cv=none; b=YGT1M4TtG/PY0XfrBIORCpKVyUoYtrBqyxQp6crT9GcUG7YU8sn19gPKERyeRYziCmhTJCWggAosBfE1wO2M4NKibMX3qlaM4tdHlz5Hxr5moKuyY8A9N1HstiKQTI7TSUUAG781p+3cXaR+SfGEObFFV0cgT7OeFq3kZ7MznUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749411948; c=relaxed/simple;
	bh=0z0z7BEAOwGXGFZrG5T/T3uQfwCpzUKGWzDdv99j4io=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=peT3wTUT0ndKBjnuaotLCJj/evjNW7lIkpHoA5YxaZBVhjvDdILv14nffAJ7iidbt7JA50Izh+Jl5x1H6Ve8+0uoouz/m+ABzgsFaMlA9+ChY8EeAQagWqpiFpP9/c9sJ8huMMuqreGMxfAYOb3PcyvDPICx5PIgb8Vc/uHpWc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z2MVTRFP; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z2MVTRFP"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-70dd2d35449so27601787b3.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 12:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749411944; x=1750016744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pdmjI2ThvlwaXhc0+WRx0izpT37E64MmtJ5nQi6GWpw=;
        b=Z2MVTRFPmnfB80wZZTtckN+G2TAFtbtVT6fHH0ggJtEXufVscdd+5zJYCA0+4vX3pV
         pi4EgIvEz45TmvitBGYE5llJMSVcL2Zd3fskI6+m0qxH7nrUmgGoYFrchO1lcOe+XK2j
         bV2Hz2EpqdLirMzV2aW5HL9L9w1Cz9I2R96xDG2HIpesAGvtfg6jywibXtWYRT6gVFee
         +lr2yDCqgOW7ppVtjIZQkSNoSLCNKzlBSOhe2MnRVEvNIfo3vTrDmeGsL3sRIQyfzr3U
         nnAfmGKt0J752kTbTlDrWCAfRGLVcfI1zkWj3OtP2xR1yQgn5t4Ja16KhJMXWjTSBblI
         hgMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749411944; x=1750016744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pdmjI2ThvlwaXhc0+WRx0izpT37E64MmtJ5nQi6GWpw=;
        b=wGoH7oDk1w56ci6SublbOVcP0bq7JKvY+w8YlTcZeJvaHYTW1iW7/mU+CXnObKMkdF
         NinrhwNNvGhQdmQCL61Tcg5wszJp3NO8PuGyldTEknf+n9fI7ntJPJ6/mPU4jrWy/u8t
         FUTRJzDBz1q31pi7xGXfoLrwArQUjzvts8JKe915TY1vIRdCABDZ1vtQ3OHFoK9lNuMW
         c5fmm7CyotQIA6NGT8n97gieTtZEplSY1WXvh+/M47fsm4PFVmTrNAb0OkKr0oBRLqBO
         UYHktMOu4NHgpZw8MHSRLCeeAZzY4q1m3bSSYRNEMMq1ZCP1gJhYQCa26RKMGWuyFyC/
         QFnQ==
X-Gm-Message-State: AOJu0Yzk73ouCgBk1yzjImepkxrYipFokO7LGbMaBQd9dd3YRkAryUyc
	yJwun3c072DQjd5T8bGoF0bXknHf2HzoVxZbkmbTduJ8yqJu+RLb3doQZIXWrQ==
X-Gm-Gg: ASbGnctHq6cry9R5NbiRA9XfCq1XuHS17nZjtMIvQQ42CFbDG7+7zxwlZBSqpHooR5+
	wz462VmPi6I99RYOA9IKkabK4Y8jV4dzRqvt7SLzJV6JSW9Vwr3NgDS02ORlF2Bas2s/ZBn7dQi
	pc+FezFChsH3Gk+Gpe1SFnKXsZfxBqQWql2KzphwTc9co0db3P5xol6XO1JY38tQbBiF07iy4bO
	RCVl3yNzLbxysAzic6md77ObBxcL13b9R7ZOKF4UFvmU3L6Dku0J4km4DEAgvxMuGwZMj5fRjB8
	V4O+ecokTxLKvwVga7Qjzt5Q1A+yU7wdfPQyK0uMJoBUGv9rOkObEuYcjUTcCSz8+gW4Ywcz/Z2
	Jet3oyStMy3Nsdqsl6mgOxwrGO8F1IeVQ
X-Google-Smtp-Source: AGHT+IG26jQrOUA1nsvWxPnchEGSBRX1882EKZVs2X+/4JcMjJI81Q1X/Xxc3iVECqZZloTddp0MEQ==
X-Received: by 2002:a05:690c:4b0d:b0:710:f39f:a2bc with SMTP id 00721157ae682-710f763eb83mr142692157b3.8.1749411943911;
        Sun, 08 Jun 2025 12:45:43 -0700 (PDT)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e81a41575casm1850732276.32.2025.06.08.12.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 12:45:43 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	John Stultz <jstultz@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 3/3] clocksource: Improve randomness in clocksource_verify_choose_cpus()
Date: Sun,  8 Jun 2025 15:45:35 -0400
Message-ID: <20250608194536.28130-4-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250608194536.28130-1-yury.norov@gmail.com>
References: <20250608194536.28130-1-yury.norov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Yury Norov [NVIDIA]" <yury.norov@gmail.com>

The current algorithm of picking a random CPU works OK for dense online
cpumask, but if cpumask is non-dense, the distribution of picked CPUs
is skewed.

For example, on 8-CPU board with CPUs 4-7 offlined, the probability of
selecting CPU 0 is 5/8. Accordingly, cpus 1, 2 and 3 are chosen with
probability 1/8 each. The proper algorithm should pick each online CPU
with probability 1/4.

Switch it to cpumask_random(), which has better statistical
characteristics.

Acked-by: John Stultz <jstultz@google.com>
Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
---
 kernel/time/clocksource.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
index 6a8bc7da9062..4b005b2f3ef5 100644
--- a/kernel/time/clocksource.c
+++ b/kernel/time/clocksource.c
@@ -342,10 +342,7 @@ static void clocksource_verify_choose_cpus(void)
 	 * CPUs that are currently online.
 	 */
 	for (i = 1; i < n; i++) {
-		cpu = get_random_u32_below(nr_cpu_ids);
-		cpu = cpumask_next(cpu - 1, cpu_online_mask);
-		if (cpu >= nr_cpu_ids)
-			cpu = cpumask_first(cpu_online_mask);
+		cpu = cpumask_random(cpu_online_mask);
 		if (!WARN_ON_ONCE(cpu >= nr_cpu_ids))
 			cpumask_set_cpu(cpu, &cpus_chosen);
 	}
-- 
2.43.0

