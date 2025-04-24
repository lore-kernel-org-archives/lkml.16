Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522B3289346
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 16:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745511644; cv=none; b=Mc94om1pMCBxSe+pnSWcGxxanpDQrKFeOlzU3ksER0Qw7Va0fof08g6HebQLs4AYMRKIrvWM3b/2Ru/3IAR66j+kdcDnXdFZOpBnGFn8/51u66RS254MAk8T8ohf30EsmkhotMK5eAQ1M9yWVMGKsPoKYUVqXbTTLzT6OX0BRss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745511644; c=relaxed/simple;
	bh=sr91ZCkfh9/+1qgwRvc7NFp+/ypX7PeuKKUTBWh2e5M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Am3ewCBKmsKVNKBPjtLQgtqLHqYXMEf4cdvOTTrapnZ4UdK0GdZze8T8iBV4/aw5mNAsmbwjgYLdaaY+tWoQtSDiJC1s7bZxRpsI+uunuH/ZiydLkyv+d5kH7uAESbUu5Fjp+sU9WcCkxeDTn9FW2nZXhIR2MYmHpb+cPQ8mntU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ezjT/iNz; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ezjT/iNz"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2240b4de12bso19030765ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745511642; x=1746116442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QSyaOuxRYv6eWeED9vze/Zx1Ra4wgUaI0r8PRqeWN0U=;
        b=ezjT/iNz+b4drFWmN5xEGoQAS/QQfBWV70zcg4XGRg3+y3mb8py47MBHlkz95iwkqx
         eP4pCK26BXLfmDPwJdR9Xjv5y+P0esh6g58flAlhAIjrDpqh26jK6qzeTwBIxhWZ61rC
         6njYkWiHNdIpoGADe0SWeU5Bsk9S37YZAix2SUwEBA4nLAWRppd+/bmFBodDThMJZwem
         /GQDbAXtTaHuAhgz0JsmaOdR9+zDaxFhCJIyYkpbGmJIJAL3uT7Gowg4H1mHpVNXjpfN
         qasDeD6KLxybk0me0GcHOjMtcW7V9+HMxcpaLQlM/aCVn/HXdXxZ++88tqzKUQRBJbjN
         hAxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745511642; x=1746116442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QSyaOuxRYv6eWeED9vze/Zx1Ra4wgUaI0r8PRqeWN0U=;
        b=pp2KTsrI+pzBweLAJOTCzZdZtcTi0AGeDIWfAmplj/+aIeSw2+ACJLQOgC7M4egE+n
         bL0ThoDKrkKegdNslSOAZ/w7icfg6j7tcQKXtlNO0ADCo75PvusMtxPMochoDOk0mm3j
         HV56hmK8NHL6UXj4AxboIMsnaf89a7SYmzdvyb56vsXigrfxbkP12UJExuJwZLULilmK
         SFN+WJhMeV7cqKaTPZEulUy1SJyFFAJAsma/DRbHHlYitwFHPjtYT4qHqYNVao0hrWHc
         6Vq8Cdz5QA68+EecE3Z0ZJpDW5yMwTpe1tO+75F1lgo9xDTgVCVW8fcKStfePgzxcvYU
         fZgg==
X-Forwarded-Encrypted: i=1; AJvYcCUHO2UJblUiv2yHpfQLUCDPXUWEEh+Ar4+PO0Ug+gCF1mc42efxWoRo2hp5Bk8xNyI38WAQI2nURDHoIhA=@vger.kernel.org
X-Gm-Message-State: AOJu0YweEFtoNQR0Z+u8dX9u7IuHAbBBtIpM4ffBiAZ5KiGjaj+o1yjp
	7zOp75WIKGJXz9vE7ZOCbLOF7WI9uzlNZ87Kao6EqrCe35P5pV9Zrb8hUhK347g=
X-Gm-Gg: ASbGncvTAr/OPaU32FrmJUPNY37bJGnOvy50QltA786Q/ersNaoyOvL99oYTOM8om/O
	vfElv/0PBWSHWBNx+k++60OIILxMhC6aLjYgswxQcDzxLj0ySrHaVOeuJ2X1N3Ytn/2ccXw9FQf
	m/fqgalXKjCC6IMONReckzdL0CBYaGhuUDjB+bHE8yXh5dqTfX2+ZAhFWsbTfECLNRIWL5nlTxU
	uNqNkMWjrD5xhaV7JXgtQxvjlzfUnw21uamKNcf0XNxbn1VHilPyu69FC3a9d0EsiWSiw8Hrvu4
	65TD7xRTjqTuzc9PEh7vvuCZoWsnkosmmZvYWzIffQ==
X-Google-Smtp-Source: AGHT+IEYPSmkALRG18EbLkZ4r4Mc9Zk2ENSNaMuK68sqW3bha49PXaIcVchPcu5dRFET7GZx/n/KrQ==
X-Received: by 2002:a17:902:f64d:b0:223:f408:c3e2 with SMTP id d9443c01a7336-22dbd41875bmr1217355ad.14.1745511642636;
        Thu, 24 Apr 2025 09:20:42 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5216b7csm15475485ad.232.2025.04.24.09.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 09:20:42 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Lifeng Zheng <zhenglifeng1@huawei.com>,
	Nicholas Chin <nic.c3.14@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 5/5] cpufreq: Force sync policy boost with global boost on sysfs update
Date: Thu, 24 Apr 2025 21:50:18 +0530
Message-Id: <852ff11c589e6300730d207baac195b2d9d8b95f.1745511526.git.viresh.kumar@linaro.org>
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

If the global boost flag is enabled and policy boost flag is disabled, a
call to `cpufreq_boost_trigger_state(true)` must enable the policy's
boost state.

The current code misses that because of an optimization. Fix it.

Suggested-by: Lifeng Zheng <zhenglifeng1@huawei.com>
Reviewed-by: Lifeng Zheng <zhenglifeng1@huawei.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/cpufreq.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 0ad459bc8f84..4ac5d4fcfdd4 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -2863,8 +2863,10 @@ static int cpufreq_boost_trigger_state(int state)
 	unsigned long flags;
 	int ret = 0;
 
-	if (cpufreq_driver->boost_enabled == state)
-		return 0;
+	/*
+	 * Don't compare 'cpufreq_driver->boost_enabled' with 'state' here to
+	 * make sure all policies are in sync with global boost flag.
+	 */
 
 	write_lock_irqsave(&cpufreq_driver_lock, flags);
 	cpufreq_driver->boost_enabled = state;
-- 
2.31.1.272.g89b43f80a514

