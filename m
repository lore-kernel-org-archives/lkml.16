Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77ED4239E67
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 15:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748877551; cv=none; b=sOhC/kiIRgOrnPeGH1/sQn9D8gAzJVFVU97gIFy8BtZOXO8CjywhupuzOJ+HYpG+xKlPVeu2jxPzQHMHI67EjMsF+6Aoc9/vL4XNEW+AsOcQg9/fk2EHIQ00yOG/Pwg407BzGaCJOyJPnPC0MHbrYxQ5RZejLtttMZuF+w8AbpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748877551; c=relaxed/simple;
	bh=GxbSdL0PyZ8UlejUoxlDIdlFpATxnSdyF2KX6oHR03A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zavgx0wHZYEy+XruQhq73KeVq5nZ2U8zud2xSEtjIdaFO61t6VMpk0KKuKRXeP4ZYiwOjeAqk+WYeUCZbjXmjjcSdDL8zjhA1QAZ3pDqTEfX5zJ2cCVzcRRughjoIqgA6RRTsUK5G/8+MeUzaL70P5+HDQUOK/vkjOTlWfkzJpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q1Ht0zWV; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q1Ht0zWV"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a5123c1533so127927f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 08:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748877546; x=1749482346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h4kATdXtYuRJowbluuoUfq4iaqlYfYT07dwMRu/eijw=;
        b=q1Ht0zWVmXyQXOxoXmReB/1O6jeMdlz5oaNDqn+KKfsTcemeYF/cWZff6Jucji0rZx
         L9BuslqtLxJHpy2EaXOX3uNx5u9qZmdYMW1FJFkgdVLTI3W+g02DIhsj45UGQL8uFgKj
         QVE2LMVrATzGalVID2OybgjblihUuI0LoOUALUaI0YjjmmutX5rv5vgK1YNuSB/HRn15
         p83eNbwJeY4LPD6KZqGewBAcNaluhiDxtec1at/zWZZz2CPHsz+uyLaVShpJk2oIAZNZ
         HMDE0QHiJ22gy15jTq07FOrXi0icJltEKeYAh1/qh+eY4i2aiLtwz9f6uK5h2C/1F23X
         mUWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748877546; x=1749482346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h4kATdXtYuRJowbluuoUfq4iaqlYfYT07dwMRu/eijw=;
        b=tZkNt8xc7anfegb4DVvy0esr76GvBbOPEqILcgKaGbWQ1jaZQzuZiSYfYg2r7CosN/
         1VkAJcCWBxGe1ERq8OUNemB6nl6/QNzgAcvN/HNwzHTmVtplEHD76RbfbDkF88JTSBGp
         W5n32ahqIIFEHgbsXbkB14BLnWGB8gD4D7sAIUOf67XXWOz9PnGqBnhfF7/tGNglMyMb
         regllcwMhWUhWxrAZeX1AxTgqZgvlCq2F/GVLRyn1P/YhJOlHJZ1wCFqRc6UX0wckaVj
         z+7CcXDYVDZKKwzkP+nTAulYMB1jvHR6UwwuJcQbahXuyX/OCK8O6f/0WCM5FMXgJLt5
         OfFA==
X-Forwarded-Encrypted: i=1; AJvYcCUF7CEOfMGw9FciVd6XS6HWEPr48x460X4UUKPMINxorvZJjDrTUO80KiJ9t+apqHTLc85L1/CpCoe/u/E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdgWVZR9v5tHfSANqIUtRD+wI/uMEWSoK0ULrCJCiJqrnoQSU9
	BWoMt67+kepAS3F1KiaAfGxawi97SOs9VvDQT+yATqnRBUe7jLSXTWWwPZAZXDkJm0A=
X-Gm-Gg: ASbGncvNOH/hmROYaFG1WzgE4gaF5XfvMp/6mm8BoEgyJM6lM/dqG9UP6IhfF3QXidG
	zBV2rrOtKa/SC7I+ZcyHZpoBCnSe8z49W8J4WDLDTlV7V77ybDGmsPSRv8k7ctym4howW6mJLsT
	vVtsjp9ulV/ugRRqZjCkihkZFKESFT1B9+K5tkOOkaYQVkOuluH1vCuws58bMuyZJCW/jNIQJcQ
	X/tnJVDkGUx+8l/8zR6DhX7lonHq2Jt64sHnq/D/v8+AubrfShrOJbAUXr14wwdIL6p6dB5XTHj
	7TF1UmfTxTM/j6Y5UkQmHdkN0ViJTR7RPh2GJ4tVpgSlUvq59Rjegtnypy+qnmPLIG5Y07uwDCT
	dgQ==
X-Google-Smtp-Source: AGHT+IGo3+b4mB4bJZk3jsrIr83JxAnU/93JoVte/2RVs9090BDS0xWFY0i+YN16EfaKcepr/Do0FQ==
X-Received: by 2002:a5d:588f:0:b0:3a4:de13:2a25 with SMTP id ffacd0b85a97d-3a4f89dcb7cmr10264360f8f.45.1748877546552;
        Mon, 02 Jun 2025 08:19:06 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe74111sm15619844f8f.56.2025.06.02.08.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 08:19:06 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Cc: Jim Cromie <jim.cromie@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Marco Elver <elver@google.com>,
	Nam Cao <namcao@linutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	John Stulz <jstultz@google.com>,
	Will McVicker <willmcvicker@google.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Saravan Kanna <saravanak@google.com>
Subject: [PATCH v1 7/7] time: Export symbol for sched_clock register function
Date: Mon,  2 Jun 2025 17:18:51 +0200
Message-ID: <20250602151853.1942521-8-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The timer drivers could be converted into modules. The different
functions to register the clocksource or the clockevent are already
exporting their symbols for modules but the sched_clock_register()
function is missing.

Export the symbols so the drivers using this function can be converted
into modules.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 kernel/time/sched_clock.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/time/sched_clock.c b/kernel/time/sched_clock.c
index cc15fe293719..cc1afec306b3 100644
--- a/kernel/time/sched_clock.c
+++ b/kernel/time/sched_clock.c
@@ -174,8 +174,7 @@ static enum hrtimer_restart sched_clock_poll(struct hrtimer *hrt)
 	return HRTIMER_RESTART;
 }
 
-void __init
-sched_clock_register(u64 (*read)(void), int bits, unsigned long rate)
+void sched_clock_register(u64 (*read)(void), int bits, unsigned long rate)
 {
 	u64 res, wrap, new_mask, new_epoch, cyc, ns;
 	u32 new_mult, new_shift;
@@ -247,6 +246,7 @@ sched_clock_register(u64 (*read)(void), int bits, unsigned long rate)
 
 	pr_debug("Registered %pS as sched_clock source\n", read);
 }
+EXPORT_SYMBOL_GPL(sched_clock_register);
 
 void __init generic_sched_clock_init(void)
 {
-- 
2.43.0

