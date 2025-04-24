Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2FB288C9F
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 16:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745511641; cv=none; b=Fcd2ghgIhxXs/AI4y2x6ikUGTcAIOcUK6snHkAgd7OypUnuKO2+ky42ul7UMtZVWuTeB8VKkJW3UYrvXnfGferp/3EJtHrvXCCr2vx65dhV5mtpqG2Id33vlPrm4QXypTCR6KmUtokqQKl5NG3ynuvGXzLOSWklBvQNeeqxIaOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745511641; c=relaxed/simple;
	bh=aQN5teKVGNGQm4z2BGpbj1y8aIdHhsEm4YbiL+C0864=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OR7v5gxs7dzKqZf5TRHdyL/oW1JuKvqWqfk7ADbqvjLdGgeH5dEB/jfBkiWXggMno3P311JCVbdh8b6CZBR1S8KVUe4q3eEH5R6w+Cva8avoUQLyxEho2SxVPLVJLQpCRQSuZc20hVqCxdTURBxbLmLYRiTyQUQy0zUxAemEbz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uhauOXai; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uhauOXai"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-af589091049so868907a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745511639; x=1746116439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z1EcXJf5+RLLmpglmtLJhsY9yapkHMCfsVON2VNDCH0=;
        b=uhauOXaie3VIlx6jiF279viqG4pZgd6vYYbugKuNKexgresp5jqsG/otA9RknSXMYS
         Bugnq9kR+aLzqHpz0BOH2vYCl18eqNuiWF6VWsXyGvUEuxKKnz/Nzb/5q49DaraqyH4F
         zFlg867D1IaZA4O/QfD9T3dG+XcyAvxkovvdx1qeZpVq+dSyK1TGyJYTqO/QQxeKFX2z
         FPP5ZHwJ61hRaP5qumvoayM8AYawicEkiuiVT+d3EeZm5JL9hRZHO/HvMnvORUw19paf
         Uf6soZ3eCekUGU4Dnci1SBjSxSkNe+2piOywW5TrXQgXcaHXxK35ZSvweZpO5Tjk8B06
         0bhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745511639; x=1746116439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z1EcXJf5+RLLmpglmtLJhsY9yapkHMCfsVON2VNDCH0=;
        b=t+C/lUnZEXKSe7ywmFpN7onRvYIvCdeZMb1DWoL9XM+MduPUijy5I5bDCEqe1dlrD3
         zv30yOKNmhMyntPvLgkawpk2Ov5LK1HOzltUzIdP5CnI7ZUq/CBVpRoVw4FTiuAhBWyX
         jWHFrmZ3sklxCaBAsdVNnM2nC7ELZex0qjAyNlXzzXgS/Jyd4wsAI7qmMFeNvh64DDNl
         2twRyCOL0dw1KrYSpsH2XMQhYdBSd72l+Ssp+ioVdbibLqLyVAf0LltI5oL4I0izA6vE
         +6/g0Wtb2ztnAAEgQxQ89oSgf9o4PvM61rZJ1E5goX/lqyUsBFphTTIN6K/qtnMrSo6G
         B1oA==
X-Forwarded-Encrypted: i=1; AJvYcCVDj18Q7Ms+hx54ID4MA/xqof8SeJkDB/za6JDGd7iFLbx+N7smthavfKP7ZqlLqqI7Fu+QwaadllpEkr0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlOdjkYKcDTJmE0xJcl9zcI1jaLtejslMwgsAm3S6kFUkDtPzU
	+atizzDu7V+XPPU2Tuf6v0I7TU9F52YVbJnrgolSD4UYBP6H/KnCDYelfQWLAdY=
X-Gm-Gg: ASbGncsHWZqUjr+VKOTGelAYtqrn6qAJerUIHDKWYRc3Y/+DofSgHECXf52k7MbIyrB
	qgdehEMruJ/pd2llUrkw8zhaxpo0LC7KSjwagldlKt0G1gCx2BhWaiFuWY0L9e3Y5AK9ABdzkOI
	OvGoCkW4OHNu+tMB/5zXu4d+sK+ry/g5bfyiVJdmumzRPP/j7ogoOa7IryGqK1zO6iiqE2atrC/
	9tEXGYmd25EvHvL1ZHm+YYJ7ztcKs8HIqtF6vEs5Ngwmt7k4eybtRToKPT7yPoNhXy6mZXnXWD8
	t7ip+ZaK1Ps4TKrbzRWn3+fwLny/rQqRGEEzI7nmpg==
X-Google-Smtp-Source: AGHT+IF2xaoqZl8hWDUiXJ8nEem/xafyn/QQzYjrSVu1qxUZTPGra1ixV/+mmDNdtV5/54Q+x2U2eA==
X-Received: by 2002:a17:90a:d88c:b0:2ff:6788:cc67 with SMTP id 98e67ed59e1d1-309ed36e9d0mr4033176a91.34.1745511639284;
        Thu, 24 Apr 2025 09:20:39 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef03c806sm1581702a91.8.2025.04.24.09.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 09:20:38 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Lifeng Zheng <zhenglifeng1@huawei.com>,
	Nicholas Chin <nic.c3.14@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 4/5] cpufreq: Preserve policy's boost state after resume
Date: Thu, 24 Apr 2025 21:50:17 +0530
Message-Id: <de5c72a0af101049204305c73cd30eb3a3e7b4a0.1745511526.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1745511526.git.viresh.kumar@linaro.org>
References: <cover.1745511526.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the global boost flag was enabled and policy boost flag was disabled
before a suspend resume cycle, cpufreq_online() will enable the policy
boost flag on resume.

While it is important for the policy boost flag to mirror the global
boost flag when a policy is first created, it should be avoided when the
policy is reinitialized (for example after a suspend resume cycle).

Though, if the global boost flag is disabled at this point of time, we
want to make sure policy boost flag is disabled too.

Reviewed-by: Lifeng Zheng <zhenglifeng1@huawei.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/cpufreq.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 24745088403b..0ad459bc8f84 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -1626,8 +1626,13 @@ static int cpufreq_online(unsigned int cpu)
 	if (new_policy && cpufreq_thermal_control_enabled(cpufreq_driver))
 		policy->cdev = of_cpufreq_cooling_register(policy);
 
-	/* Let the per-policy boost flag mirror the cpufreq_driver boost during init */
-	if (cpufreq_driver->set_boost && policy->boost_supported) {
+	/*
+	 * Let the per-policy boost flag mirror the cpufreq_driver boost during
+	 * initialization for a new policy. For an existing policy, maintain the
+	 * previous boost value unless global boost is disabled.
+	 */
+	if (cpufreq_driver->set_boost && policy->boost_supported &&
+	    (new_policy || !cpufreq_boost_enabled())) {
 		ret = policy_set_boost(policy, cpufreq_boost_enabled());
 		if (ret) {
 			/* If the set_boost fails, the online operation is not affected */
-- 
2.31.1.272.g89b43f80a514

