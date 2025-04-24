Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1E72820AA
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 16:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745511628; cv=none; b=pVyTfWF6/58tDIBAJvHXl6kQAlAIVzAu+YZWIueu9gyiQty73cLXiFq5iIp/3QB18e5yejmIJzK8XTGhrE1GlG9dHMv1sI38mWmZCBuca6CKVezdaJPWGFEppPtQOZb5eL82N3jIeNzYWXeTcTittu2wNuqvCzpsqSt4pWXhPyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745511628; c=relaxed/simple;
	bh=3qPXP5abEoIx66HUunPoFY8QVhFVv3wWgnMK2ckSKL0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=MCq22L4sZhSyfmofF2EYF0pHVVlMLlNLmiKN0i0CosPN2xDJktniZE7IT/CUYSEEXvv8V1/8jTUQh56k1bPzMZGR1WJDmJCcXxRMlpm/Sl0yRdtRWxnWdASJ+cAmsXbKpcPP+ej4QK9BB7o5GNqCY3udTxUGSjVUhMMrH0uYdFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UF7ArqIY; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UF7ArqIY"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-224191d92e4so14145865ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745511626; x=1746116426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZK3U1zqX+QbRkc5CUf+8j98MPDC5LORQqlarEVgjRww=;
        b=UF7ArqIYVIESzY0DmZDLUgrw+qilHJO3LabR8vFf9ECv1kGGkyC3BHWpPMzRm9HRMt
         9nGqA7ODB3+1u5wNo/hMN6r/aYeSLJ3ckBEHY1Rta4hwghJF1Y3JrYKJsZPVp1c7zhlT
         ryrppQjzzVG6RLxuY1jAznTL4qxZVMajmKRpo8PEjB2F3wyAA5vcGbdwVLqgF4dToAId
         TiijfOlEpMx8D7j6kPjVkHmwaSSLdBOzhHiGVzFf4FgNsaiE6T1G90yb1+Pc3VBX4pxV
         fChc0BIUiSVp47d8SGtuZegmh0DYFyvI1l2sQCGVn9tz8AMZUfWw7DFioH36U9LFgVpQ
         w3KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745511626; x=1746116426;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZK3U1zqX+QbRkc5CUf+8j98MPDC5LORQqlarEVgjRww=;
        b=tS2p7HqIaCJPmDvlLvLgawEnAsBO1ZZinpBuGS/hiW1gVyhQ6tYtTckRoZjugwVSWA
         vb0k/j9kD2kt9jbqjwrjZ7TwIwvflvXWSoH4eGLN7uF50z+VcQMsXiPSWpD4OkuQtsQf
         aGGuyp7fdXh4E5Nv+JghjBMJOWBQ7947XTbpL59SzkKBBYXtSjGtJpk9n6E0KDuGOyUk
         v58rYgk51fMidgh4XnWDFpuuREJuXpp4SiGObLv4NOIbSU/YfQJ/PcHz8B8ZDhCPh20i
         HQ8BCBtaENWTYf8S9/iG2FDCDxtFMkv0uAtYgjMcXPEeyiVWc1Av8HiKNzzm3OSpl0yr
         P3jA==
X-Forwarded-Encrypted: i=1; AJvYcCUVR0Wc1e1phLBd6PabhWY8/yJq41Qogi0ZPS+p4j1Kk8vvq7FePXJZ+Ur+Jq3+0e5P9A7qBrLdzlwBOmo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpdapPVwwy00UJOUsO26Fv1BJUhsF6eqhtkLbAy8qo30if4APj
	c9QaMh/BolSQQTSWNKUp75CALALB6/8PCQ6iI/SuSRyO2Lh2D2FJkJY2h7l9NqA=
X-Gm-Gg: ASbGnct0RxA9PeU98Mr9OBC7/vvelX27GIaZlMLLmrkNLgQ6EbxWJ5NRC8xCFFj3ZIk
	RcR3m1CCvRh8i03TltQzZYAEQBK6GbEmwFDHkt1W1AfRe+uexZXa5urhC/dsl+EeCOpgIRKEN8p
	omj6m4QOtU6Pb4fm2Iqq7NNx75G8xpVbHbxPo4irDIPTChzVGnGJ8WYf21kj4KtAl3uYAzh+uZy
	IjUwoG2vznlgQN27HB+VppebgTgrgG7edLHBJsCIYrVfcVA0mbcshLwfJ+sydbFeQe+zavtUNg+
	LMPmQRe3cFZGnNo3jVlpzfXotBkYzIgh7wy7b8cANA==
X-Google-Smtp-Source: AGHT+IEDSR0/PqlNDM2o73GF73qCXfMIvf5kzIhE4JxAny5lKNQoi84TfP+O1loAWvOMlNHIFWnnOQ==
X-Received: by 2002:a17:903:1b0e:b0:21f:45d:21fb with SMTP id d9443c01a7336-22dbd3e86efmr1434585ad.3.1745511626183;
        Thu, 24 Apr 2025 09:20:26 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5216770sm15387365ad.218.2025.04.24.09.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 09:20:25 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Lifeng Zheng <zhenglifeng1@huawei.com>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Nicholas Chin <nic.c3.14@gmail.com>,
	linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Subject: [PATCH V2 0/5] cpufreq: Boost related cleanups / fixes
Date: Thu, 24 Apr 2025 21:50:13 +0530
Message-Id: <cover.1745511526.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

This series tries to fix boost related issues found recently.

The first patch fixes the boost related breakage introduced recently. It should
be applied for v6.15-rc4.

The other four patches are general optimizations and fixes for boost handling in
general. These can be applied to -rc or next merge window.

--
Viresh

V1->V2:
- Drop one patch.
- Fix the commit log of 1/5.
- Add Reviewed-by and Tested-by tags.

Viresh Kumar (5):
  cpufreq: acpi: Re-sync CPU boost state on system resume
  cpufreq: Don't unnecessarily call set_boost()
  cpufreq: Introduce policy_set_boost()
  cpufreq: Preserve policy's boost state after resume
  cpufreq: Force sync policy boost with global boost on sysfs update

 drivers/cpufreq/acpi-cpufreq.c | 15 +++++++--
 drivers/cpufreq/cpufreq.c      | 58 ++++++++++++++++++++--------------
 2 files changed, 47 insertions(+), 26 deletions(-)

-- 
2.31.1.272.g89b43f80a514

