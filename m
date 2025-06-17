Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3222F0C42
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 20:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750190948; cv=none; b=EHnwcaoTp9cfb9ICAmt1E6QxC4k8kNLmVvSDqTzZiAiVAHeJD1AIa9OzPRZ/RlsCHiZFp5dX2iod5chhOZsUUXdqRZM/FUiIUMeP7B1udkG4OAUk2KSlIw8Tn8ofrj+uNK0ZIhSOZZWqOWWpGyr9wbrFriVHrBAIS7vxECdtZNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750190948; c=relaxed/simple;
	bh=7ei3L9lEn3+xeaSdgHDRVafFEwUVf71uRbYEuYYerWY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eJQ985VjuodCkedn5xOi/CWfnRStz2G+/+IszHxxO1bpvR0MOqOrnkykabafezN771xdIYgpGfw4c1KH8MVD3IaN89+qsdPTwKNm6L4NxuYypBwV/2KE0+vCdNvkgW4Bca8UOeTVPW63DUb0HkQnmqMIQXqCU5WyL8BrXhHuiXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jk3gAxF1; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jk3gAxF1"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-23636167afeso61255035ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 13:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750190946; x=1750795746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SfL28LVHKWglO5omWIJDP+fyYvb9oxAH/n51aHNb2+Y=;
        b=jk3gAxF1Uk+iCORa4C34eDFPQTqw5iPvKK035pMkIVWFPiO3KMsgxnWAU157NmTRcp
         XIjNklsXC06MzlPa5doz9Kq1oMkHhHDirAJ8F9dezQjqq/XYK+tKRuRbIQEpwRqV6ySd
         bFJl5Sa9B/sAdHShsm/6DZvKTtxJJidz9Wbjzfs9qNE9s08BHXfWBY14NaGKz724o3ax
         jZihW7EXEm6J8KGNtCcOQhb0Ez+frDRiIrWpkG+K1zvwERf/UyEWZkI+QB5cU05Tv5B6
         HlBXVhHHsvBOHpVVyZcPNfcsO06Lkk22snIxbTXuy3NcNBeCf0bGAt1eajre9mHvjumh
         6NKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750190946; x=1750795746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SfL28LVHKWglO5omWIJDP+fyYvb9oxAH/n51aHNb2+Y=;
        b=jDZSl5HHYRjBfzUvlzk/FxyyiTkDcNA7egChZ1WBAtJAtaMQ9uyGbxeq1mFh8NGAxG
         qsVvSj4E+IGSLVaDapxuOJO9hshQDkLDvM7RjXk3GPaIbyX2tG4+aBpyE/UFameKsO35
         uSmzJlO1zcGJ6FT9Pjx7YPnauDHdSWzXzRs685i1JCNusOqwH3b5Y1Zm4VDle42xzTT/
         5Z852Rw5dGEJIzCnhnjj8HAtAFeD0+jiCJWn/SLaxBLUyHVgj0Gv1afAJo5GJNH6wQA4
         wBjFKDfgOOtuhtAtOG3+KguGSi0y6cRxajPl1RwsVtGwSmJRTRSAzRloRyfNr6FJ7Fk1
         kQ3A==
X-Gm-Message-State: AOJu0YyQbFj+mpUjRIfi0zgJh8mVdei+WlShVYmhiT1EN4JlSHvgb8jj
	HJdYX7WiokVOOeJFz/kvP413zDQGBP9c7SV/tvYp6x9G+x8fAH+TRyF1lIWhNw==
X-Gm-Gg: ASbGncsXDRhH6+E48qpLV4FY8069w0bDyprXw7uA8UmbGTmX3lwG6pszawvL1No31bR
	TiFJ2q/YOoPHg9RF4Sdl12VHFghYxYY4RzKNN/i3KXPOzBFvh2jPRVow6IZsK32UO+7Rjjw+cRd
	JoYJ+nS5hdOrCjh22aaypLM5k1czSSZH+sixs8aBZkLAZmkMcEZKUEvPQFPQsNRHrcKxrx+sqjQ
	utA2DAyyyBciYV5qpZvTvZVUn28A2Rd2YDjPMbsjFAUsX/U2LHZwfC8H/s9UhPdLyxR2psBWum0
	g3o728r82jghr8yRofw9SajhQxKbSzr9SPal297ugRRM0DD8NUg+uWsP/SXIBDdlCH26zZ7z
X-Google-Smtp-Source: AGHT+IHify4GZoSFFDiUXHB2yZ7FWrkl8YZ+uOy6ft/nbP1onf695Li9V8iAefEVOtrM60TrxsPvPg==
X-Received: by 2002:a17:902:d4c9:b0:234:b430:cea7 with SMTP id d9443c01a7336-2366b32cdf5mr242241465ad.22.1750190946566;
        Tue, 17 Jun 2025 13:09:06 -0700 (PDT)
Received: from localhost ([216.228.127.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d88be76sm84383085ad.32.2025.06.17.13.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 13:09:06 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org,
	"Yury Norov [NVIDIA]" <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	John Stultz <jstultz@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 3/3] clocksource: Improve randomness in clocksource_verify_choose_cpus()
Date: Tue, 17 Jun 2025 16:08:53 -0400
Message-ID: <20250617200854.60753-4-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617200854.60753-1-yury.norov@gmail.com>
References: <20250617200854.60753-1-yury.norov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Yury Norov [NVIDIA]" <yury.norov@gmail.com>

The current algorithm of picking a random CPU works OK for dense online
cpumask, but if cpumask is non-dense, the distribution of selected CPUs
is skewed.

For example, on 8-CPU board with CPUs 4-7 offlined, the probability of
selecting CPU 0 is 5/8. Accordingly, CPUs 1, 2 and 3 are chosen with
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

