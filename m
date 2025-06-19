Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6688930E83A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 18:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750357599; cv=none; b=R2XEGUXOC6BlftetzSdJ0CXKEzpDkDKcDxwkIq5dlK1D32Fnmgmy1YnZMGSTxirWHgQSNFmyamjCrNLWn3DeTovBGC80iRaVPUBb32Oy8sQYAc7Rk1fsPjYea6aP42Q5FTXOVBk0SKxL+UtobPcsSedqoo2y8CvvHgaYaYdpfiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750357599; c=relaxed/simple;
	bh=0z0z7BEAOwGXGFZrG5T/T3uQfwCpzUKGWzDdv99j4io=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a0Ah7FipW5eJMsKweDzdZiWBlkv7MUEVPOV6jZbUhY2zh3JLTYV7VChl2kqOKF3jPaon5qKkOh9lVSH0MIyauOmQPDiRj6Hr587NomH/Be4m7TvFgfzjrLa9G+DAspStBZ5ab+86T69/fW5Iu5n/ulqYy0294qwatYMWYQajZBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cNRmJIOB; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cNRmJIOB"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso1110447b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 11:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750357597; x=1750962397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pdmjI2ThvlwaXhc0+WRx0izpT37E64MmtJ5nQi6GWpw=;
        b=cNRmJIOBx+WOGya2drEE+ifyqTJTDGVH0Lg8E4+bIOt6cCJe2ubsGygfv6WxNoLM0q
         BpFlpFvZ0mmwgBb5byRYhvKUBGzIFGzKnkMzJeeX+RGOicovDZQzRcpvCTv97rXo/cpF
         gUjI8w40ZXb+NJvu6z+Tf8g6GdGJl7Zzui7Vo7xsysfLcqGzm78bbPua5g+oZcmPNRVB
         O5HGYzSg3J15NukQ2sabPSHKy5j+HZO3Bm+td+Fz5TTN9egG/RYHN2VWHZGA/JoFqs+G
         4nM7/F8VvVqUNypHlB1Mqxd3fwAIf6HQHnX8inOxvkY/5WkUyBTwlDWiAHA743Wyljhp
         Kymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750357597; x=1750962397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pdmjI2ThvlwaXhc0+WRx0izpT37E64MmtJ5nQi6GWpw=;
        b=KJr+jK9NTpe2pN9x1naJAsVNDIHvAGnyDEc5yL3LP76whajTPHIXFSBMvVPlzLjjRv
         f0hXVCer7zeJRJZ65UV1Q0tDXTqzRR+TK1MTpk1D9m3MkQ3zJK7HYx8TLZbwZrPsich3
         UQt3q/1fys8jL+XOelV5ON4OB1no/Kx8jmtmOi3gqv5XexKMHDXYt4k6bVOXhutSGaJU
         HwRIVYr6aglqtTOJrELpijJZwf7uYsBGN9A++Pa/mKUpNkmjih1kE3SGmEkAZHDLwdDr
         Mg3QbfeEVD8Kzm/hA9TbGzdTp8t3uoLdsBM1IZFuW27vs4cTJC0Tvu7oMA9BGhjTVRui
         LNaw==
X-Gm-Message-State: AOJu0YzaiKc05DTqORgdhjg8tnDf5dGXV6O5O3Twney0UrsBtcS93gg/
	oED1+XpV22wplMXZnUA7Ai8spZHZzLCeM1ipuWO5a+Mm0rqU7zsKfSCVgrfIKw==
X-Gm-Gg: ASbGncttYTyTtuh1HWSaGt28a3WZ5A2qthA9Vm7QRREqDwvV0x1faCiuEzIGhGIecaR
	dhgCvRSxpTwgrogoOS/c/NYTi8FLtTMFEjyAUOpSDFm7m85SEcqUob9au72tbe954glT7Ak+W65
	bhWk9du+2F33QzlhnI0ZpOpuh3zaiics3UiRtHKKsUwMiV3Y5rKHr9NYUgqz8P21dxMcRQqrc/R
	NuZeCMhhpN71Fac0zR3RPRXqNdAvpNBfpoIctl3zTqBuapUH4xRcd4/LKLYYv9vdGyG/ntgk/v5
	vtLkGoxfHcgPs81cfWzaUIm+bdLOB1A8jcxsaKCG4I5+C7uJBYQbFK3yhNOl6g==
X-Google-Smtp-Source: AGHT+IF3u9HCei4YN1dYK2/yBG1uGQwggDbweoS5Kq+r1qY02NKQRAP5o0tPrUqTFS6jzyrPUsA40g==
X-Received: by 2002:a05:6a00:2e24:b0:748:3385:a4a with SMTP id d2e1a72fcca58-7489d19b134mr30214375b3a.23.1750357597621;
        Thu, 19 Jun 2025 11:26:37 -0700 (PDT)
Received: from localhost ([216.228.127.128])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a64d289sm344286b3a.132.2025.06.19.11.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 11:26:37 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org,
	"Yury Norov [NVIDIA]" <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	John Stultz <jstultz@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v4 3/3] clocksource: Improve randomness in clocksource_verify_choose_cpus()
Date: Thu, 19 Jun 2025 14:26:25 -0400
Message-ID: <20250619182626.393541-4-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250619182626.393541-1-yury.norov@gmail.com>
References: <20250619182626.393541-1-yury.norov@gmail.com>
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

