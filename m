Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4911779D0
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 15:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749916244; cv=none; b=I3vR3SOzMfD011+52IziGf6QStqlmX4b6m6Se2F+fVIpd7N6UqhmHlMp1zga5H0bFju8IiZRmXcUp/eSwY88JHH835rikKPxzJoc1DnrnNr6DwgR8vxpFw8pl0Ae+5zhuS9TD/kbBblZR20QdzZr4QS0HDfMqDA5BuzX66d8cI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749916244; c=relaxed/simple;
	bh=9BwhuhbplSizPaFkXMlp9i7OdrA3PbGHMPNcceP0uvk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q259TmUVu7e7z0t/tB0CCBBP2ZhwFP7Qpv5WqvHeQqith+Tki449TjO0tBFV7oxyWHEHhEkpgekGMvyCjKV45vrMldw4KhQopu3vkYHrJoBOzFDdXcigj6uy42z8+gdHK2TEpPA1EJAqwXZHheE+6uk7VtuvRn7mznWQxA02XEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LbUdHa4H; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LbUdHa4H"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b0db0b6a677so2848079a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 08:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749916241; x=1750521041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CeGPnLGc66vkOnOboIMbEoJovfXSg2LPTdYXC89Y1Go=;
        b=LbUdHa4Hrfo+6I9+OefX+y9PcGKfJ+SBVZepiZ/vw78iccZatKA4uDogTP2ZyE/g6V
         RUerCZ+AGc3Ev6SpreoZDIMBlWSvQTpX+TbCvjwpUE664H4ebih9fNDJkCrU//G4qBz2
         5fOwQ7uNLauzFuHfceJ0qjGEE731kfusgKQAROb1YYtGkx/gnsxb7aUChvtkxWwYHgAR
         tUTsMFUzLHupuESLNmkpkRyaKej6QEPmFkaaYXajR52tiWn4lhTFyxoTNAdUfrgymv3d
         A8pXArS5F1z3XXSqiSiRUgcdUz2K0/8aIRCZQDlH7G1Ue3xNbdaDwIZK2zz/xPB8t0iN
         s0Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749916241; x=1750521041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CeGPnLGc66vkOnOboIMbEoJovfXSg2LPTdYXC89Y1Go=;
        b=xSBl4EBjBj8iX8s1mscBuAqwNwHpPpPjgeL0VWRkzAr1OIcej8geKLj2OF37p3doPA
         rce1RWLS8qfnj9JLeaeOa1INGvw/Bg9xuFDZcws0Cb4Yu20XLr4/sAqq3zB+XzNT3o4R
         Zo3jzRjVhHqgImsihxl5MGl+zud5DCNEoD2waCy9ohD6LVxhHgrvRsvECLi8tezTL8lA
         d+ielyUPAW1DK/MrG9oqpwst7Yl8luF2eyat89mBJCEG08aR/AXELY1l8nO5cuwfThj7
         3QPocBQ2kpIiv8OPNVJjJetBrReRFrQNhC/Cv060wSF0huT19pXM/HuWecKiJbmTSzNg
         p4Lg==
X-Forwarded-Encrypted: i=1; AJvYcCVwKpcGdu5VXMjZQTi3Z25kOOysecxMzizTwWAES3DaYoZDruDaOT2EnAw+mIDBmkWt0px7GM1bIxmaWZI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgsPbMpn7e+oviv6bxzZDBLUq5n/d/OlEaRi9+0Yl/qo/w2tXs
	3Kmu89tayctv16aQ8Eq5AjjmmmGpuG5B1Z4y5T0gtWfvHq4j7/acM3mu
X-Gm-Gg: ASbGncvRPwSVOMu0jSrYR0vzY2hgflIg4LTx4Mrr9nnoBdYmsQxbROS80C83RVaQrBJ
	GG3dLsnIucHsY7G3iEkMdrpLc0xYYKGV0Pkb1DMxptb/JPxQg1woarWRBbpBY2PbRMWWS3GMA2S
	6b2slBqcNoDrHyiraO4mKzX6Gln1pssJHVwtprbzkzXFJG5fRZKKi7aiaaeSbboT5wRKjybz5eJ
	l0+n2fv3XQZLySSDO74PZdDMcYxGCowCoV6DbJoqrIN7cOZqPM9/cbpq6aoST+uj/X8DW4ouTyL
	JxIiMePNXAvkSIg5D3zDbQvgVmEiYSEUTHSn2hkq+kMlC8fc4PHHjTzjdMXfXg==
X-Google-Smtp-Source: AGHT+IGHFYsInfWD0kguh18j7mHqKSC0kIjyJTg5NkgMykjpiT4dr72GnQM29AV316uzLelIfqV3fQ==
X-Received: by 2002:a17:90b:50c7:b0:312:1c83:58ec with SMTP id 98e67ed59e1d1-313f1c0bcb0mr6652967a91.12.1749916241455;
        Sat, 14 Jun 2025 08:50:41 -0700 (PDT)
Received: from localhost ([216.228.127.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de78ce2sm31776985ad.95.2025.06.14.08.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 08:50:40 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org,
	John Stultz <jstultz@google.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: "Yury Norov [NVIDIA]" <yury.norov@gmail.com>
Subject: [PATCH 2/2] clocksource: Use cpumask_next_wrap() in clocksource_watchdog()
Date: Sat, 14 Jun 2025 11:50:30 -0400
Message-ID: <20250614155031.340988-3-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250614155031.340988-1-yury.norov@gmail.com>
References: <20250614155031.340988-1-yury.norov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Yury Norov [NVIDIA]" <yury.norov@gmail.com>

cpumask_next_wrap() is more verbose and efficient comparing to
cpumask_next() followed by cpumask_first().

Acked-by: John Stultz <jstultz@google.com>
Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
---
 kernel/time/clocksource.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
index a2f2e9f4d37b..e400fe150f9d 100644
--- a/kernel/time/clocksource.c
+++ b/kernel/time/clocksource.c
@@ -587,9 +587,7 @@ static void clocksource_watchdog(struct timer_list *unused)
 	 * Cycle through CPUs to check if the CPUs stay synchronized
 	 * to each other.
 	 */
-	next_cpu = cpumask_next(raw_smp_processor_id(), cpu_online_mask);
-	if (next_cpu >= nr_cpu_ids)
-		next_cpu = cpumask_first(cpu_online_mask);
+	next_cpu = cpumask_next_wrap(raw_smp_processor_id(), cpu_online_mask);
 
 	/*
 	 * Arm timer if not already pending: could race with concurrent
-- 
2.43.0

