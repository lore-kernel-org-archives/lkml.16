Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BAE2144DF
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 09:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745315653; cv=none; b=hL1axLVpsx8holklN7CK6LmoVK+S/8kHd7cG/oMVArSZkdHDogUhdKPUQgCtDFwNzSV1qvqSvva9rtikUbVq7743Qme1FbG/xt82sS/Cq/GwAgIqdbdw/lo1SqXjF7VDjeUInyQFRcvg8OHH1dJKB10iZUX9uAyZjz0Y8GnWffA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745315653; c=relaxed/simple;
	bh=eyplrmpjKFTUa1W5e9N6rta3lu/Fv+NYAacdGEUT+Oo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Iw/LuOY81fFUxMbiD2moWMwemIPtm4XstNwyyXovHIdEINpZUBniBU/0YlG28j0AYJOsBN9FJe7qYHK6doqXhpMBhCTRxwVL6UljS0ngMBPRFgwckmFpWMnyIWILJuwX2URt5mvHbi3N7SbDMPLNJrTqoWPuaHuSpUpc0GMnVkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OR7w5rkM; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OR7w5rkM"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2254e0b4b79so73527465ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 02:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745315651; x=1745920451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8abPOzFQPY6uZ841DkjOq7rR24N5GWsR8imwcJtx7Uk=;
        b=OR7w5rkM6Abf8NVSwca/9JCEU18uf3LmpX7M5NXLhCnFolnFWA8uy4ydQf+nFV8b7v
         Sz8ckJU1Rhf1dDiCRTI5AmaicaUBERNEJfbcxIf7/UOhCkEV2Z7FCnUA6LEojK9rEn3A
         izyXn/jeTx7Q9JiqyM/9N87C9hp4j05hyyz6j/0bclOdvWy280+dXypOiHltuNd3viq4
         ePqm4OQgR2srZSzONmAWtnUV0rWdVEpI1gx3KjaPcv+ELvL0V/sO1DLbWH8NP7zuDfHO
         mDthE1oly5GYP4vBjnBB6la8GHt66oMjuhm6ldDmmYscfzYwcIAc0rLWDc5ZGALzr0u3
         dCig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745315651; x=1745920451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8abPOzFQPY6uZ841DkjOq7rR24N5GWsR8imwcJtx7Uk=;
        b=aRpHboZKHSrLpHP2NhYdI02sKKxV/Nah8VbNNQ64LXxWWp3zpoMmF8qHXADaNPbCPm
         g2hNYS2C2qXGeKfOKVJDW3qRIfERPez9l3ZnyVIi2JFQ0knaEG4CujNqelr1E39tJiju
         nmNadHhRs7Yz5u4HVlMqNbxzLakiHYv6Fm08zO2XZJzb7VzDLPq9Eu2rsW2WCFrx4v72
         6o7+tH/Aq8Sd2cXg/pr91OTMH0MC8+bm9g2/9RZrsD7T+k+D9DVro0x6XudUbkp5sWnj
         t2e6EmdsBwYjg7g/ysjUwjkQU9WSWBwzFT3oppIBT1H03qTDauKT3laXOr71RyHI7BUc
         7I2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWfFiac1mXP4xIi5thUfdR9laQyOPtDAddWyEK7ot+q8tWe6UbgAc2rjSOOLf7bRrckvrxdEbx0kHkYbDY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMuQ9cZFbAww7uBOerBUbDNH++kqwAIx2tsdEh2VsRlnbqSJhI
	C7noZ7VT6D8lJG6cLLNfXW07dt7vfejojCvmMQsAQjj1fbGLzBqdg3fk26w/TWA=
X-Gm-Gg: ASbGncuo3NLEcD6LrW124rANjUZrd598gOxoyoqh0/wNh3liH/i9KOvv2bGk1eZU+nc
	Okjvi1sh512rrWiocRIZWp81vLrVfl6xT/zKy6SK9HcqR8E3bGbJJJ9Lo+ZlHDhrN2q1fPDsa5A
	plkwv9MhQkWnL0a549qfP5/5GvFrDxxUX+TCwDZrKaY3xEwC7cCRI2vmYclBQlLmb6mi3Vb2aYY
	LQVQZn2Zh65Id0FJLHQHF4cK3cJO/+nnS+YGnu7FjvzvU+JoXhDEJHh0wPNsslG4+gYKY2Y8eLc
	/0jajHVeG8OPaqAUmfSyci0+scaRIKvoipCC0BtGRw==
X-Google-Smtp-Source: AGHT+IEmg8Z6gimIDf9VigivlpBZ67Mu4d5PLElT55+RwEMc1P1qEQb5nY9a+EPjX0zXw8UepdGUvw==
X-Received: by 2002:a17:902:e806:b0:229:1cef:4c83 with SMTP id d9443c01a7336-22c5356797emr251125215ad.4.1745315651107;
        Tue, 22 Apr 2025 02:54:11 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bf5549sm80701565ad.94.2025.04.22.02.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 02:54:10 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Lifeng Zheng <zhenglifeng1@huawei.com>
Cc: linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Nicholas Chin <nic.c3.14@gmail.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] cpufreq: acpi: Re-sync CPU boost state on system resume
Date: Tue, 22 Apr 2025 15:23:52 +0530
Message-Id: <d8651db6d8687a0e37d527267ebfec05f209b1b7.1745315548.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1745315548.git.viresh.kumar@linaro.org>
References: <cover.1745315548.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

During suspend/resume cycles, platform firmware may alter the CPU boost
state.

If boost is disabled before suspend, it correctly remains off after
resume. However, if firmware re-enables boost during suspend, the system
may resume with boost frequencies enabled—even when the boost flag was
originally disabled. This violates expected behavior.

Ensure the boost state is re-synchronized with the kernel policy during
system resume to maintain consistency.

Fixes: 2b16c631832d ("cpufreq: ACPI: Remove set_boost in acpi_cpufreq_cpu_init()")
Reported-by: Nicholas Chin <nic.c3.14@gmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220013
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/acpi-cpufreq.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/acpi-cpufreq.c b/drivers/cpufreq/acpi-cpufreq.c
index 7002e8de8098..0ffabf740ff5 100644
--- a/drivers/cpufreq/acpi-cpufreq.c
+++ b/drivers/cpufreq/acpi-cpufreq.c
@@ -893,8 +893,19 @@ static int acpi_cpufreq_cpu_init(struct cpufreq_policy *policy)
 	if (perf->states[0].core_frequency * 1000 != freq_table[0].frequency)
 		pr_warn(FW_WARN "P-state 0 is not max freq\n");
 
-	if (acpi_cpufreq_driver.set_boost)
-		policy->boost_supported = true;
+	if (acpi_cpufreq_driver.set_boost) {
+		if (policy->boost_supported) {
+			/*
+			 * The firmware may have altered boost state while the
+			 * CPU was offline (for example during a suspend-resume
+			 * cycle).
+			 */
+			if (policy->boost_enabled != boost_state(cpu))
+				set_boost(policy, policy->boost_enabled);
+		} else {
+			policy->boost_supported = true;
+		}
+	}
 
 	return result;
 
-- 
2.31.1.272.g89b43f80a514

