Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB9E1D5CFE
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 14:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749305478; cv=none; b=MdLkEvXYDuUXdTe7WH+trupSQuHDpg2t55LQUUrtoPUwC5J31ejq+PNkoeaQ0CP+naZ1vPAGKDB7ENllg1be2H9Qv3O3629gsNGoL47tjEm6ex5v//cQ0d6cxXhkXUN7nAVUB9iVfhKDsaobdRUYFVxBfJMjs+JclEHcypnieVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749305478; c=relaxed/simple;
	bh=h++zQo5KVSd43ehmoVbT0njvaRILuwxkIQYs5GqU2sg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sXP43KFu8isw4GLFveR+6UsFP2ZdruBtwxHvGJ8/1/fjLyRZfJndUjPITQhEwTeorFsnEIT0fBsaFeNBcoZmfHRqHe4WnBU3U4i2D7OZqsu6cUtAfpp+sxc3Fd2vhPILXWlGsbnaHY13h9FTBVsz7Snnjb6Qe5vwdg95f4sc01M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SktvqQP3; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SktvqQP3"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2352400344aso26779685ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 07:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749305476; x=1749910276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P1p+BuVuPhVA396t/eadAhONNIgyThiDiqyDM9AfU3Q=;
        b=SktvqQP3URzE4c0xaIsD7v+Q60BvkDD1HsyOtLWZNgwQtsoL5sGbY4g9E98X2rXHds
         zaG98EXws/IR6DLH7GUVL9VlTY+ZZn4/lEJApi3DdgVIuVfjU6BmdQWpBVkf38ggvvR0
         0B854vVoXGADsUuwmgUHVRnrxJlt1MjlC82D2UUFCN7kBf0RmKoLx/goUyIfIiXg9bDt
         /1qtaZc+tB0Z/5hPgRHiHN4mRiH9Kv8DMLXOtej1KzFml7Iu7Vfy7O4WLECGjJs+C2cK
         vKRIYmyC4We4vHPtXCvytDr9/jWIR7epB+EYbY2J83OrF5PaPxxO9pniN7nynoA4Es0u
         pUZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749305476; x=1749910276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P1p+BuVuPhVA396t/eadAhONNIgyThiDiqyDM9AfU3Q=;
        b=B2w2Sw35M1qO/9A0VMhOi6CJEjPzeQ5azmf+sIj/PJHEs34I0BTW6xvEq/9tRnD15Y
         COA8623SvXgjPrUdeY3vyxJQzbQAenzBzaVv3yxbqj7OtoldWiS65Cimt4OVxanCBve/
         EgUVYcwmhkDQrusiIMFRvY18cAjpjY5oE28EvqMB1+ptJsJ5q/5vc/74CUtm2eP4UvqZ
         SEwzhXTMFNaNoVY7amkoyxhT495+B9hveAaUAHKc+yEjKRFMT+gqKqynM/40wbTr74V1
         63blBPkm4gFok+mx8Un0FjQL4wihiEogTRyM061GDpNEl+E5/bRuYNNb0KLoEmu26qnu
         9N/Q==
X-Gm-Message-State: AOJu0YyhrUzwylKTdZBKfkPJTsI+KHGHX1cmS+Wkrsi5KMmzOrRg/GLa
	wSni9Mg9CIp6StegoYYk4StYao0DlInlXTMII1KaAJe04yKqsN+hf/hwW77DPA==
X-Gm-Gg: ASbGnctH2LDW1S7uUkWTeGGzcz9q508XPRfHCL/6JqlJu1XzeI62PhUmpbSCjvSNaVS
	P5rscvsiGsVO1PyPuVMIgAG0d7EtEPkYzlCVoVBUKg0fDW2i9b8ArbaZLPWhUccZjuZM1kRn/xg
	nPcUAYOHM1iLiv/plxbX2rhwNwf9izdOCICGBvax43aAPpbdrDKYirV+mdhNoILqPV0TAmC4cVA
	Z9tC0/sbzIuwgJbtIEtA/yEjLfzHcnrwATg8IYZRSa6w4Y1fvgg36mdWsLLr2YlWSWqi2CwahZ/
	ufNIYM/fMm6KRY243VotXVMnizQL27g9ym9Qgyx2VG+SL555cBhrR7vrbyWHTSB/I611TNhA
X-Google-Smtp-Source: AGHT+IH4EVYecR+yiX4hB/xRwN8ZxaIMs3K6Y4uQJMdAtHnmPok1mDRY4oFqrqq3qgUqJKcT9HSEeg==
X-Received: by 2002:a17:902:db12:b0:234:a139:1210 with SMTP id d9443c01a7336-23601dbffffmr105845425ad.53.1749305476495;
        Sat, 07 Jun 2025 07:11:16 -0700 (PDT)
Received: from localhost ([216.228.127.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603078ca1sm27438445ad.35.2025.06.07.07.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 07:11:15 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org,
	John Stultz <jstultz@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Stephen Boyd <sboyd@kernel.org>
Cc: "Yury Norov [NVIDIA]" <yury.norov@gmail.com>
Subject: [PATCH 2/2] clocksource: Fix opencoded cpumask_next_wrap()
Date: Sat,  7 Jun 2025 10:11:05 -0400
Message-ID: <20250607141106.563924-3-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250607141106.563924-1-yury.norov@gmail.com>
References: <20250607141106.563924-1-yury.norov@gmail.com>
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
Signed-off-by: "Yury Norov [NVIDIA]" <yury.norov@gmail.com>
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

