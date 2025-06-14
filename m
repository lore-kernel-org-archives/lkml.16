Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641542C15BB
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 15:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749916243; cv=none; b=LCElYVS6IrK2OipzT59Irxu3bYMBZ7O0M4bd3Xxjas/r6Z7D+4B4+2JQCnJ+njl796Bpl9ojWZ9IABlwdNSpJTyk3toy3pW1X/tUK2GwSLxhfLUw8XfffqqaZj0Ms+9GifX+1p5uGb7CHSaTq4mvxAQ0owtwPtXnsWc67Aq0VOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749916243; c=relaxed/simple;
	bh=a1jkG0heggBGNtbOcAJiMI0dTv5HBmBbvkEoce1KEvc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UKResbLhHWE6OdlCKAH/RYQrAlz5gjNTpeR0i4xsxrzzyk4U/7tSt82UBLP5Bu5TdZYZJQmeGgAgaUViKs3VgPVWRgST029fDu3MGLAf0GPUWTBF/WjMEy5XVwVI1x/An6W8x7kwWae4EPX4aTaTr+U3QwB/04phq1Y+cFuMHmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CBM4SVmd; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CBM4SVmd"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-234bfe37cccso40229315ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 08:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749916238; x=1750521038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BzabUWbSy5N7ZP+6Rv4SlX3jhjtE7RXtgJ9eaLleLsI=;
        b=CBM4SVmdX1Js9A8qcws/yVvfyCkJinw0hQ6kDURbc945Vg30ML69m60H1AnPJ2OVgk
         2yE73DmcMudzMWF9lyFtqS1mFb50CdKRg2XJd09U1rhH84NSsLAoxAc4yvHriOHP4LvD
         kBNIZjrFyFKMM4ZO8cCMfwSGOyhipgocxLEtRQOgUom/L1TmSIagQBsdCEYzN6ZL3FGP
         +gxk5OOf552Xi9o+8lht6dPZJ/2fb+ARLiqO2YmOg9eYVWM4JcWIx0nbffHkhLfS+Guz
         9tkgjiEh/Aj90rGvxuf4iTmvaj9B/joaNqfucads9t2BjyiaVJvFYWlRs72tT+nKRfzT
         Lu7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749916238; x=1750521038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BzabUWbSy5N7ZP+6Rv4SlX3jhjtE7RXtgJ9eaLleLsI=;
        b=rcorFznnlxsSciuRLgxmqPfbYk3ZYrQJ/D3Tt0cJTZzZwNMRR43AsGZ1n7b3GQUy7U
         vhLMlocMnqpZOd2L4mPD8gOHa9daSAltL/PBPQnP1qrDeojsdf4qLaY64SVUQZ33Rx/K
         GYKZSWgcvKccDzX7nx2C4ICalGQCsimYWeQyxFQhuyiSsacQ3O6eiXO5sHQolP1TZ+R8
         sqWQk6dnFLhLpBkEF+ePKwccsKMWu7Tn/alOddHqwETf3sYY7XqMgfpWZ0vi0CFyLr1X
         ORxjzhrQPhtXhdse9BeQ4YOb2p64F8Hk6WVcmpydG+hW4yZ4KPLFu7KtXl6jviv993WZ
         aL0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXu0v9F0JpcibSPel/o/agLwtmDf5Uq4uiS11q6bjm0/VW7LDhW+RkNtuJCZsekhNs15cSbXZC2aIEfoJE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfcQGuxUbFPuKTK53a2bW4EEprKG377BuBMDa6aWvayzZG8tqk
	MzgEEqpSrgn0meP5lvv6SFuz1P++AkoOosl17H8rONUe3XkV8lTaTcaH
X-Gm-Gg: ASbGnctvabbJUPrq6eWV0N8eGxsecL4CSmCq2OC9Hj8PKOD49qo3X2MnOisdKPJI2t8
	m1ycVeYHTN1K0rN/iRTBRfUMhbvGfz9k3LGZxNd2eiX0008iw5q0vBPMxaN5jYaZ7FuF+uzyfOv
	YBo0I9DLgD0Lwa4iYq4ICEIkkq9CDWRLEx//XG6wQT6rorcfNiACMqU9MxkQyiQ0TnV06eanw0M
	7xOZnd7NFHqZ1ndmYq0X8zHkULNsfp/cp56Z8FUrm3hsiX+3rt9HDYFHgkkuuN8bVmDRPO3Taj5
	aDSodKaZCPyi3Q24fEOoYXE1xan2rVHpBdc6rlk+12gm3IeHSjuvzuYXJjH03GDDnmSIdyrg
X-Google-Smtp-Source: AGHT+IEE/Fb74yNymXitv3odkUirTeJajLfFM5BGtLUXrsH69hRpe/FltojQ+pvwIVp4RH8CNzpe0A==
X-Received: by 2002:a17:903:2ace:b0:234:9068:ed99 with SMTP id d9443c01a7336-2366b14d37amr57492535ad.24.1749916238463;
        Sat, 14 Jun 2025 08:50:38 -0700 (PDT)
Received: from localhost ([216.228.127.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365deaa9b8sm31843725ad.165.2025.06.14.08.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 08:50:37 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org,
	John Stultz <jstultz@google.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: "Yury Norov [NVIDIA]" <yury.norov@gmail.com>
Subject: [PATCH 1/2] clocksource: Use cpumask_any_but() in clocksource_verify_choose_cpus()
Date: Sat, 14 Jun 2025 11:50:29 -0400
Message-ID: <20250614155031.340988-2-yury.norov@gmail.com>
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

cpumask_any_but() is more verbose than cpumask_first() followed by
cpumask_next(). Use it in clocksource_verify_choose_cpus().

Acked-by: John Stultz <jstultz@google.com>
Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
---
 kernel/time/clocksource.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
index 6a8bc7da9062..a2f2e9f4d37b 100644
--- a/kernel/time/clocksource.c
+++ b/kernel/time/clocksource.c
@@ -323,9 +323,7 @@ static void clocksource_verify_choose_cpus(void)
 		return;
 
 	/* Make sure to select at least one CPU other than the current CPU. */
-	cpu = cpumask_first(cpu_online_mask);
-	if (cpu == smp_processor_id())
-		cpu = cpumask_next(cpu, cpu_online_mask);
+	cpu = cpumask_any_but(cpu_online_mask, smp_processor_id());
 	if (WARN_ON_ONCE(cpu >= nr_cpu_ids))
 		return;
 	cpumask_set_cpu(cpu, &cpus_chosen);
-- 
2.43.0

