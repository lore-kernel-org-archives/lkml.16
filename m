Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8665028466A
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 16:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745511635; cv=none; b=OsOkgORe8pkey+X4U+afcNt7vDvZrXiLw05ceFfMtRuQxlqM7zpvaHGv95z1orKHpOXh3EXpbH0lWnznSuxjxof38vm4Mh9WEZrekACXaO214yCSGa2W4ryjMNbcnY+iiu2VPEbRMs9TJ99EjrQxB0PVf1ETLLwZBp/D0A9ASSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745511635; c=relaxed/simple;
	bh=N86G+xPvh3Fs6OA8eDZ5k/0ObrQcBlpZHqZBKD5QejE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nem95Tf3fmEVVWn+F/gezajcuJVPqFu2LhKNkkbgOd3r4ysd+mRKtG4uTaLzJFCfZBp4OSNZF0lCC8Ra056ogkyaVGkdF4oNAfyonJW9zEC03LSsf6zSE+YeOs79N5HM/9XLfZOHN78SpgMrMGEW2jCRVNhj8cVYMn0tj0j+AFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Czv/FUBV; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Czv/FUBV"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7396f13b750so1355313b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745511633; x=1746116433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=29re1A6IAQcw58La3we0Qeu64CWcO3h8durF8s3FMdc=;
        b=Czv/FUBVFtDpsxyQt6JZM3F3PhUj1i65g3DJlWttU/PYQHRSRFkMbt6xDBTBFHdu7B
         FOlSWPD/fmgkcacag1ccoIU0hAHvu5MiPo9WADLP1PVXUz+f1P056PQtPw87PhD5GIKu
         mYtkyucrqvFrysNVqLQIR1yYsPKgA/KPkglu1sgmYdKiY2mufI9GnTRsgYhVG3oUWhC3
         khwdzoWy5BjOr4/LEdSrER1LtdGSu8+9/UPoKVFCnjol9BDjGE2j+fi50Y89VB+eX+cA
         HyS79E+T8e53Obvw39zb5YsHPJmWIXKLEr6hFKGe1nXI869aQ6b8l2EzgYc5Xfo9kld/
         op9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745511633; x=1746116433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=29re1A6IAQcw58La3we0Qeu64CWcO3h8durF8s3FMdc=;
        b=VFYlVH1M8cPzXCPPO/tqHY1PaHNjklGLH8Je+luC2KJrJoh46Ke9IbiNyqtzkvXDjb
         3aMfW39Op8cNbchw4de6iHV0VONy62V8pf9boSxwpOc38BPzgNNQMRWwEPQRY0H46XCt
         g+9qLQlQV9qNl7PZTeyi11FB4UQwEkiztthNhpWMgPZUsVCci60e0EQFlemErE2burBa
         dU9ot+TatczC9F6eePUw/r5Cu4EuZ88z26Ju8f0A1YkGePLzQQ80hbwHnYWBeqHpOnWX
         hTTAKnLrLWsHwmOjALhvczx0nEDuvf7ftBxAsHG5uXV1o11cP5b4VWIqZ6QI7+cqRLZX
         hMtw==
X-Forwarded-Encrypted: i=1; AJvYcCU6BmGfQMmpyKOtnNsbyOqY0OXl/+7YGTzM1IaKacF68SIDXgTb18BnyuFMDxNMeSHi2bJlOAIFXZ2bUf8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNSacl40BsPSAAMVNwH6OGAm5aV6slH+HUju3wDsJzYk7RWisq
	WGP05InIEGSIbHpzwiW02RdBMDfm6x6+5sRXaXzYEncjZxAy+Hd7xgPXimGKThQ=
X-Gm-Gg: ASbGnctrSRd/sMKVOII7RTSk+0Qwc/2o0etqPC88uzQ87jE94q1TYfUHgkFOvGR0xbr
	VJIcLHRy6ML58GJYAxzW89OROiGO/UCBhPrdfR2r1sFSoJ2PuAYOn4zJeDZj4yqFHWhutvzVQbO
	Qj2Q31pUpWXRmVvJl9cKTM67jrUcNRJnCvdJVn1rFqWvICPSismpBcvqbjfFyCyjLCf98zkATMd
	X+UoNbTrwIIX7gLd/PFb81bApTxeK03xau9qbyl9qT6JXC2XGu8je35eBFulyeMuT12bttG4XUf
	faAG9UF0qsdK3Zc9gJ0hRITQ99BNzEAs20y8tXuaPA==
X-Google-Smtp-Source: AGHT+IG578Ic64K8QbKa3qjFUhYhINjMm+PC0YZTjvGdvoBcCT0kxu+uUXe6zvVhuX1i3Rbt1n0WTQ==
X-Received: by 2002:a05:6a00:3987:b0:73d:b1ff:c758 with SMTP id d2e1a72fcca58-73e247d7bfemr4497488b3a.18.1745511632704;
        Thu, 24 Apr 2025 09:20:32 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a6a415sm1588401b3a.85.2025.04.24.09.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 09:20:32 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Lifeng Zheng <zhenglifeng1@huawei.com>,
	Nicholas Chin <nic.c3.14@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 2/5] cpufreq: Don't unnecessarily call set_boost()
Date: Thu, 24 Apr 2025 21:50:15 +0530
Message-Id: <3003fbdcc1850128fe7fb653d7ddb8afc4d66170.1745511526.git.viresh.kumar@linaro.org>
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

The policy specific boost value may already be set correctly in
cpufreq_boost_trigger_state(), don't update it again unnecessarily.

Reviewed-by: Lifeng Zheng <zhenglifeng1@huawei.com>
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

