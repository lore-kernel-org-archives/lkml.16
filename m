Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A79D221D92
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 21:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749072093; cv=none; b=ifk5uj5nPbVB7CKedjKLXTVhR2tT9a2lItWV3BhGtTp7eRf2DLpCuQks2E2htA96T7IqSseHmlk05T1uCHpzEhaVwJKQw1D8wnYq+nO2JG5Yng4CG7KfCAz8raDqPPp/JVtN90p5klOEQsM+ZsxQCXn1XOTPlPyJ9/5PjrXnt8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749072093; c=relaxed/simple;
	bh=mb9dGynr3tPwVH+CVGAZtzbl6KYWsmzLrX/rViY9HGc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UeU4y0tUbgUQ9hG16xr/6ZQRpEseasC55yMtvjhCDmYhkQCA18Ehq6BZL9zY8iCH5YWn7X58xZzEm43ctUU5xut4CWpFtuGSQIODTSIAYRlRKLObekb8axVmV5G/VWQlF/u/cRG9FQtK/nGx21vRPkSsNzMaN0hlxpQJ5nMx9t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hKXkfGdn; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hKXkfGdn"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e7311e66a8eso330417276.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 14:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749072091; x=1749676891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Q+rgdt6RTtQZmj//uE/hdIOstitQBp8gtR8Veh5SR0=;
        b=hKXkfGdngvLLV4g/sPddDSZSPM0wQiGDU3CKECNzYFU2oMdmdhIsOyBaRiIYy+Ai1r
         W2hChKpziBAXi10psdiTzE1eRY8LDiw7E8c2PXC+wUePOQ+HJJjeky/3Dfh6uKCWpcHy
         YVw6PBxHFKScYXhvI4j4lwPz2H5bY/qmQLWHLwv+nTDqUcdp0mw75/KE1AMx56aY/FZm
         m/ynPk2S7hEBBU1Hq4hc+tSomdZbPU6kqt9q1g2B04AFZvOg9jNeRbjMcVLmyE0FKyLt
         rSAIIa64i3P9oXlyBp3gjBlYee9By7peRZS+5XzjTxhtV/unCZ15qoKcPC4W+rQfNpkS
         PUKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749072091; x=1749676891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Q+rgdt6RTtQZmj//uE/hdIOstitQBp8gtR8Veh5SR0=;
        b=lWN5ZQcp2rxrHgGhOHY6t+g6mgEZimri29UkNADtI4aKerjGE47RnYb8IikwTMNam9
         59AvaOIJKAPnlzo9msjOwPVRREx39pQlbT1XOOlwvRy+TtdG1URb4IOBEFqwJLbDjiTx
         Jg7kVurG/0l47Yvr2fSF49K7CUS3FKY7/dTx/0vFKDWE1PEc3TrkSp8fQBJ7Mc8WZqmL
         Ud8/UZRAATCUk7n4FpTKC/ocXiNWDpKKVz6tEFpcZ5/1jRlVxkzm1m6a+lJR9RL0T5vk
         oMYO5oKapA4R4bvEb/ngP67gI8wUq2fEvoy4EHn9/epdEKx9P6D9PFUpvAvvDVlq6u5o
         NtUQ==
X-Gm-Message-State: AOJu0YzwIj2szl8piUcYPyyhi4W7Rr4B9tDikuhNs8oOpbmpVcqHZdPb
	9TbshjpRwJ2p69Nx8rQpSgJG8IF58j0YLSNrZY4YYVHzyzKQSeNFvyluUHaZzQ==
X-Gm-Gg: ASbGncvzWrcl5Pymf4A/+/L5eb7kIgJsIK/+FDw5VuAIH5MTpbRdp0eRUFG3lzePb/a
	1itWXlTTrJtTOKEJDChmRJKq0KVCGD//NalKz32er7FHJxmCHp7XRjsJCVxVPvcl1hHJC2HsTUf
	hGBei2Plv/k0ZwtthiNs0VEgMFR6rsvJdDo9zaEqHlSQO+3uzPmMDc7soKFFX31nAEdDjQqtQyL
	5cxAMSdUT/1FXSUWpxzZIPX20uIDh/LEsCa18E7XXiOT7TXCyg0VeMSSmHlZbbB7VVRydmw3lrA
	IT4wYQwyD0zM+e99byE1HpBMB0aBkz9eV+P4lyCvgDh0Ho475pjwBlf1EvCpPsAQ9P8rO6cm4ZY
	2/+2E8ILtrFU=
X-Google-Smtp-Source: AGHT+IHlEaMaostuMnOS8fbl0OyvK+tz6VqMpfjpG8BtVjAlCtXvKB6FvOMue/9oveEtLju8XIRzZA==
X-Received: by 2002:a05:6902:124c:b0:e7b:3d15:10f0 with SMTP id 3f1490d57ef6-e8179de3311mr6121579276.31.1749072091150;
        Wed, 04 Jun 2025 14:21:31 -0700 (PDT)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e7f733cd118sm3315399276.20.2025.06.04.14.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 14:21:30 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	John Stultz <jstultz@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 3/3] clocksource: improve randomness in clocksource_verify_choose_cpus()
Date: Wed,  4 Jun 2025 17:21:23 -0400
Message-ID: <20250604212125.25656-4-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250604212125.25656-1-yury.norov@gmail.com>
References: <20250604212125.25656-1-yury.norov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yury Norov [NVIDIA] <yury.norov@gmail.com>

The current algorithm of picking a random CPU works OK for dence online
cpumask, but if cpumask is non-dence, the distribution of picked CPUs
is skewed.

For example, on 8-CPU board with CPUs 4-7 offlined, the probability of
selecting CPU 0 is 5/8. Accordingly, cpus 1, 2 and 3 are chosen with
probability 1/8 each. The proper algorithm should pick each CPU with
probability 1/4.

Switch it to cpumask_random(), which has better statistical
characteristics.

Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
---
 kernel/time/clocksource.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
index e400fe150f9d..0aef0e349e49 100644
--- a/kernel/time/clocksource.c
+++ b/kernel/time/clocksource.c
@@ -340,10 +340,7 @@ static void clocksource_verify_choose_cpus(void)
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

