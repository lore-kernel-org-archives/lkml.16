Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E0D1F874F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 09:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745315666; cv=none; b=QTl60x28eLXwN3vM3I650ctrDlkSShc6UEU+OkLcSjV7AK+hlr0tzJk78lGo9PK4vG8dkvDYEDDKBSXBMh3+SOET1FToSTIfKx40IYWNFgZaOvdv6I21XzsqLfNCYozqdLNjBCLxd8CyPABLHJ9HF7rtRgiz6UWtgouEh7lN5J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745315666; c=relaxed/simple;
	bh=h2PlaUDNh+Zo7Zhthf2PkPMeYtfakuR/Qz/FV6Egn6I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TxXn+lD4w1eatbHosbyCwGjauUg7ifWtLQcAWzyOYoB0OJ2iNQKMzt6SXUr+noWFFAjfIpcAgkCYfr5vBmb+JNdllyqToMYA+582QmgEuOdQ8Tb3+wUecLjWMVbnggSyoMqc7vUSO5KoQMNuJtDrFOhouIf3fDQDeCBUotb06fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mdi+q4IL; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mdi+q4IL"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-736c062b1f5so3826688b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 02:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745315664; x=1745920464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cLlCWejYiaj9zuTPSqef+ff7x8m34iah1oXk7eNizuA=;
        b=mdi+q4ILLg8SGqDKvh/yRk+IZ2U2NNBQIbKgzuGhOgNT9zSnD5W1h7TE5CovFA2b9+
         tX3Yx5KgpsixXFVuso51TMrGXExLC/YSc76fwm8Hfli+UyNk9DA6EyWXum1zC5U/Qerr
         CiliVM0gLKaea9/GB8ZlGCHGsyJiHK/jMq98uSpR1xhSIb5g3iWtCkEuOrrJ6anekPpm
         Quwx/lf7EfcI9JjmSQ2ycqt2n9G4M2U6deR1J4sUlZGAsifrUoMBa3NqRFcCSrW6emM6
         ug3+dVGDHv2gcSFk7zoIlGK873oF41RhRUslPJ/z5ObkN/7tggDaUIxUwIVrBGvJG9ti
         BOKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745315664; x=1745920464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cLlCWejYiaj9zuTPSqef+ff7x8m34iah1oXk7eNizuA=;
        b=RLKXu9cyNqS4qkwe4ciojreds/39NSHjsu+Ln0XpkXYR4qehGuKXme/Y2Xwv8azzww
         phFwA534ANm9mVJuihbi6TrFvj2qcTq5rEZIRj7wjTEydazzVlyYvkEWvNHyfRYu0KKZ
         HexBmvZwxaxTCELaH1rAhpopzx3qHTBPtrOfVRrYT2o54FyEAkhv7Q2niCaRIUUCRVPe
         mNKFUIAPMgKDZsfV4o0G3UGXUGu3apW8ye0RGhglzWxCGQI5p8WHwJ2yvCRh30pO5zlk
         ukfViGARHrldTqG3J0JPCDHVyf+4/nBiQvfO4MT1rhZ+/pA+1qphNp29nfq7RsQTEbPu
         Rp4g==
X-Forwarded-Encrypted: i=1; AJvYcCVh2bWIjOrnXVgvuVIcldARd7UpYalMhoB62+H/Ha8FN9HVGEsLTtZMgWTz+3FeRYC1jl2L+hldQiJQDGY=@vger.kernel.org
X-Gm-Message-State: AOJu0YytqmKmEBKHDPMdUzqkE1b5ASi5T4395mJCrUtl+/0+0cHi7g+/
	Uey+/+OTLe5U+1KeinPrjP2pjNXbtIwjDUeCtJ+1QFWHATbRDgNM7zeB/HOC9kU=
X-Gm-Gg: ASbGncs68xBSmmA6asq7vRfhwUSP7w0rsmkX6oYczCpihwZgwMnDd7o7ZBXyQNqrk0R
	8u2kiQtFcv2Mg5IipQk6W7JLOgtHKuR9A26rpSsVmEVGqIVBandM1pAyQ3eHb6d8dIfZyWd0Um3
	GVpa01iGgqs7sDCNAwCk00GbonZUIQgcMdgE9NTOktMoAv/4il3gjMnu0/deV3pIdjGNA2Tu4G8
	Q1IU12kmmANDFcHF5yZZKhmI0tLgbL6gWzsMPR9NPXMYx+GIc6L20JNiDPkZef5HrONQTn5H4p9
	iMNNxnBlXyWvrT5eLfgATbKWATBFwoXNmvVjhv6Cag==
X-Google-Smtp-Source: AGHT+IHqQTHvvzAxnddY26qFGNYR3FXphqrDnq4k6oSYICVoVYNGfaLtcHbgiJNvmduT4S9HNBMjSQ==
X-Received: by 2002:a05:6a00:3928:b0:736:a694:1a0c with SMTP id d2e1a72fcca58-73dc15cc4b4mr20840085b3a.21.1745315664414;
        Tue, 22 Apr 2025 02:54:24 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8e510bsm8463248b3a.66.2025.04.22.02.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 02:54:23 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Lifeng Zheng <zhenglifeng1@huawei.com>,
	Nicholas Chin <nic.c3.14@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] cpufreq: Force sync policy boost with global boost on sysfs update
Date: Tue, 22 Apr 2025 15:23:56 +0530
Message-Id: <73708a14feae46166e9bceeee5e8bf2d0802930d.1745315548.git.viresh.kumar@linaro.org>
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

If the global boost flag is enabled and policy boost flag is disabled, a
call to `cpufreq_boost_trigger_state(true)` must enable the policy's
boost state.

The current code misses that because of an optimization. Fix it.

Suggested-by: Lifeng Zheng <zhenglifeng1@huawei.com>
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

