Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE9C21504E
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 09:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745315656; cv=none; b=eSKOX+HRj3TZCoPtnf2uo7REBEdLp/KATXuT1frVkCmnwQUkhurYQvQpu4/Qm8La52VKg/Vz8ul1rfm5ALe88QxJtpRw9iz4IG0juAYcjTFmWfrl5XOMYlhXJUg01Jhne5rWHVTzBKn8ie8oSh9zhRNyrqjhVEEsrwsbhSp2Ad0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745315656; c=relaxed/simple;
	bh=Hwb5Wg8id68V2WnDvFD72dDP1oue3BffEk4N4k7Vew0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=s7pZzlIRZpRpwXZrpzxdII/Me/rF33b5LPIvh07tclqbzF9KZmOmOsAGcVQB9jFwLG4TMbCUdp3iMtEgGPzaOt6nAhqPz9GRO/XmXYbqLrWTm5pf1LuS1i8uewNILJPg3rbxKlQA8DXbwL0Q9wyTddRSefhPMlyNP5TEDEWwRww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YGlbdwNG; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YGlbdwNG"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b0b2d0b2843so3780542a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 02:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745315654; x=1745920454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N5Kzn75CoyUpVkgbkAVHgMpizfueeVqLotFm0lBfgI4=;
        b=YGlbdwNGAPeOUUFTNkdOnb2i8AmfrcPvKDGsegtFj0tKWo1+jyL8iQQuqcqbjJ46Td
         lW2Q89V+VxQfYOqxMakbQx22n438HMtL34Dkat/9mH9oDuI6A8/qgUn7Sk2B9NMTLFaT
         Bv1Brw4dOX42c9hXunQhrHxK7FnDFTX1Ikkgo8nzT6pwsjTw6ahQTJTdQDPyDtWrbr+u
         P4vpQZ/lWoAPKvtHZa6fcZA02u9z0BEA/buvFjT37C+egHqDnLC4gSq8mFw7tGQQA/6S
         E6GKbicO/13MLlU9E02vJJSjjoGh/OQyqaI3bNqfts0EOYhDbXr0kfOcsgy2L+zs/YR1
         pe+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745315654; x=1745920454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N5Kzn75CoyUpVkgbkAVHgMpizfueeVqLotFm0lBfgI4=;
        b=MxQmNrBPxmp4NLx7R1wilFs89yneEBLu5Jo7Fvx1wPCSUwNhwXjMRRuTh2xnZjy0W0
         az6XdBrIi/4hVYVV8nXdPCdiOX2+lgJG7qT96TZl9+2bmgTJGh51OC7P0cQMoU1wll/d
         VmYMIMvPxjUZSlRGV0dbHxyzj3+RIlVruYKygYKWy2kICyGsO8KzR+8rI0+YAj2EoUcX
         AV5qUazCvEzEinHtq+A+kXv89uDrjgjM4NXm+RUYQKONbS/GWw2W8F8A9jjTrrY5noOP
         qu018OH+9yVSQxAKBtM5mgg7c+kLGSwkBen64l6DHoWPex2F02HbpBicc/I7n0aobYJr
         0zTg==
X-Forwarded-Encrypted: i=1; AJvYcCULo85cQzbMWxQCcf5DYVn/RytjueapSU8XKWD8OozP1X6tfNmP9Jc5Fa3Z4ivxiXI2e0Vdtr6lxdb9F/c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhrk2lkFr/8jzgobLJxibD+2DQTDcJf5AtDXYIvC5k8AfJbre2
	Q6sPriuQcDdRqcrDpWtkb8Z/b56JOANdSdDchC/hgAFoYeEZR/UBcNx6B1abMusE3hpHSkKHKjc
	I
X-Gm-Gg: ASbGncuGzoUf0LO5tcRFdbHEfQlXLzp7TPAJBLTGaObsaMGuFuyYZjVOnOXSQQN1+AV
	hTuXVW8Vn+r/zqfkWeUW1nx1YS0xxqXbWrIcytvX5FFfdtIaBqXaEfd0eQPD7LL2yijPpLQowDe
	hUnTdYQ1op0YP1HqHKgT4ibqhKA25BTGzUCY7oj7dm4rVfdvtEuuvv6ze+nq6xIWpmdryhPr406
	8NW2ZJXrpfBqXTWffngjWw4wg8FZlA146qNhZT5X9dNjo6zxp04U1sXP/uELHp9BlDrirbWRJVD
	Jq/f5a+Nv82KZcQzLJx3OXAFwE3FZNygHWl1Hqy4UA==
X-Google-Smtp-Source: AGHT+IErqjm03tFu5yST3yF0F1z9Zzqt2vjP0tGj95/hMaoPb1Uko0h1jfw4cKpAm3i77EYr44591g==
X-Received: by 2002:a17:90a:d64f:b0:2fe:d766:ad95 with SMTP id 98e67ed59e1d1-3087bb47646mr23455072a91.9.1745315654223;
        Tue, 22 Apr 2025 02:54:14 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3087e12a154sm8221994a91.48.2025.04.22.02.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 02:54:13 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Lifeng Zheng <zhenglifeng1@huawei.com>,
	Nicholas Chin <nic.c3.14@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] cpufreq: Don't unnecessarily call set_boost()
Date: Tue, 22 Apr 2025 15:23:53 +0530
Message-Id: <1ec6ec55f8413b0387a19a531dff0c3194847f24.1745315548.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1745315548.git.viresh.kumar@linaro.org>
References: <cover.1745315548.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The policy specific boost value may already be set correctly in
cpufreq_boost_trigger_state(), don't update it again unnecessarily.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/cpufreq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 3841c9da6cac..e31891c7b500 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -2861,7 +2861,7 @@ static int cpufreq_boost_trigger_state(int state)
 
 	cpus_read_lock();
 	for_each_active_policy(policy) {
-		if (!policy->boost_supported)
+		if (!policy->boost_supported || policy->boost_enabled == state)
 			continue;
 
 		policy->boost_enabled = state;
-- 
2.31.1.272.g89b43f80a514

