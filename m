Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A92213E7A
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 09:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745315650; cv=none; b=VHzanGWtdQEqWgVtLiB/wwEAMXI8/WyAZFjkMLZL1a1uJUn86N7PELUkTBNvMkdElJ4noE4ft4AKyIklAxOp6/nVzng1Xaw6bC+GIfbVJhNXFe4oLNc0F/i5dd8E4sh7O3GpA3PimJKZTto5ZpnoSJeAlLH+HTybM1HVxtZgcZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745315650; c=relaxed/simple;
	bh=L2eTTuTa1eQwii4P70WWj60+AqgdSCjTwbfYuCR+exI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WpQESr9AJBlf8iV2y/9TqPcchr2JNGexagkzIEHzWKGA9BLv844qUl+g1MIaHQgMp12Wk7OywkEH/a5x9V0yDkkdO9rAmwUh4o6fpaEp5wPGV6XHuGeuNSBsizyfLe2BDnnxFIcj4V4qZyqlfQSjN/6ZWE0QBQHtvcaRzIjl/ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=El46f7pB; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="El46f7pB"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-736e52948ebso5562126b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 02:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745315648; x=1745920448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6gXRQ3l/ZDI7m3p/8+vMXIVMOdLVmbzl70e5WfDPUXI=;
        b=El46f7pBW5AY3T/pW8ccCde9pT8HEfOL4tJyCzbKl4MObmTKgcLTI3hWJDEVHyq35p
         IXBrshZIgp2r7zZN7anakE12qwwBa4l0yGwwYxgLdCj5xfjHjFC4bSyXF9SGexGX+34o
         zvtHDcnU2rFmfMccd1wW7PWWCFzD511w2Jm/+L6WFGema53B5XdoGTi6vK3al6rfrWLx
         fxUOOtPxpwN4byRtSq9vC8KnhYJ5lsA3jzKkDO2EOuPk7JLJp6vzRAkRuSS9hXSJZdut
         gLSDg3NeqkCIpAtxcFtzRADZoqNCWLR0JgMdOwmlyNQea/3zivp6nQI0Q4/RwZuuTmTU
         HEGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745315648; x=1745920448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6gXRQ3l/ZDI7m3p/8+vMXIVMOdLVmbzl70e5WfDPUXI=;
        b=QUy8ht5CAcWE4tgEdEfxG31GUaImqPBMlRBwnpH0yG6fp1MP51vYbJzPzMU3tnXacZ
         ZMJ7QNHwUD13ejzSWxyV9iHhKnh+v3cISWsKPuJyLOMqJVU6DvfDsX3P9E3sKEB4rkhh
         SisS1I8Rvk/WE9ZFJWEH5Gwmz0UcKizjGUCemVfaC/59tBMBSMvs3/rlxEW/d8OTMz0I
         10ZGc20NK3VnFV9b3Yl+y1K7XbZoNG3L7gSUCFzaqw4/IuFhncwOb9OT6bMXO+wFdOj0
         c5orjCvN/EydK9JymBu5XhSEujaRUfFRptujSS49XX1lLIjonmgh8cqvx2mE2mZcpxhE
         WvEw==
X-Forwarded-Encrypted: i=1; AJvYcCWz/XzSGNbGXpPbu2/QZfuhVQ1tCjt4x7NM32LtRfFzr+OAmorRDidLb4gSFrJBr4jrOmLMoSB3tgLcOTw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjNVt0oZRCD9trxxsiuevdrOvzRqwc3A2704YQptdRMpWRhUH+
	6N05/8eUwSZjHNQ9nTCeh0rI6pXZGFaVmrfcf4d7IRdQC2UMoeKgHO27o5AODhpFHKslTZItBJw
	U
X-Gm-Gg: ASbGncsEB50j3vCAJZXuRFrvcsjBWE2C++A2VQWDB5aAl5kRWKopT23BvVRaakD5RDi
	FR7Mso5I1K6q4dl2g6gna74nrPnZcoiq/Kf+bSho8Ro1XiN6FIcpMqwZC+TQyVwgwobJoqoSGD9
	DPklFjYi+i/nWlm1Ofq5/+eaPT52gKLfwqHvP5dXj9BWz87RUbWKbV0lirXkTIYRf7xG1bP0G+Z
	pSYWxmn2O/IKJ9C+Ag9f3YB8mad2y1vFoEM9LwwPCPwsVSNbNSS0Wx9ifD6HJ2QQWG4fWYujMwP
	2vz8xVPbnS2iX6tHvpS66aJ9wJqm9cFTTHv+ILqN6y03BIXUwOVP
X-Google-Smtp-Source: AGHT+IE/wvqq9gqVFeBQZ9f+2ocmH5VwKgVfi/GMhqbq95+Km5GimJ+CgXmeQp3d6qdUw6qoPnp7hQ==
X-Received: by 2002:a17:90b:544c:b0:2fe:6942:3710 with SMTP id 98e67ed59e1d1-3087bb3978cmr17322956a91.3.1745315647911;
        Tue, 22 Apr 2025 02:54:07 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3087df1e5bbsm8138605a91.24.2025.04.22.02.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 02:54:07 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Lifeng Zheng <zhenglifeng1@huawei.com>
Cc: linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Nicholas Chin <nic.c3.14@gmail.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] cpufreq: acpi: Don't enable boost on policy exit
Date: Tue, 22 Apr 2025 15:23:51 +0530
Message-Id: <7ce4ffb166beef83cf1bd703a41bf91622011585.1745315548.git.viresh.kumar@linaro.org>
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

The boost-related code in cpufreq has undergone several changes over the
years, but this particular piece remained unchanged and is now outdated.

The cpufreq core currently manages boost settings during initialization,
and only when necessary. As such, there's no longer a need to enable
boost explicitly when entering system suspend.

Previously, this wasn’t causing issues because boost settings were
force-updated during policy initialization. However, commit 2b16c631832d
("cpufreq: ACPI: Remove set_boost in acpi_cpufreq_cpu_init()") changed
that behavior—correctly—by avoiding unnecessary updates.

As a result of this change, if boost was disabled prior to suspend, it
remains disabled on resume as expected. But due to the current code
forcibly enabling boost at suspend time, the system ends up with boost
frequencies enabled after resume, even if the global boost flag was
disabled. This contradicts the intended behavior.

Don't enable boost on policy exit.

Fixes: 2b16c631832d ("cpufreq: ACPI: Remove set_boost in acpi_cpufreq_cpu_init()")
Reported-by: Nicholas Chin <nic.c3.14@gmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220013
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
This was sent separately earlier. No changes from that.

 drivers/cpufreq/acpi-cpufreq.c | 23 +++--------------------
 1 file changed, 3 insertions(+), 20 deletions(-)

diff --git a/drivers/cpufreq/acpi-cpufreq.c b/drivers/cpufreq/acpi-cpufreq.c
index 924314cdeebc..7002e8de8098 100644
--- a/drivers/cpufreq/acpi-cpufreq.c
+++ b/drivers/cpufreq/acpi-cpufreq.c
@@ -89,8 +89,9 @@ static bool boost_state(unsigned int cpu)
 	return false;
 }
 
-static int boost_set_msr(bool enable)
+static void boost_set_msr_each(void *p_en)
 {
+	bool enable = (bool)p_en;
 	u32 msr_addr;
 	u64 msr_mask, val;
 
@@ -107,7 +108,7 @@ static int boost_set_msr(bool enable)
 		msr_mask = MSR_K7_HWCR_CPB_DIS;
 		break;
 	default:
-		return -EINVAL;
+		return;
 	}
 
 	rdmsrl(msr_addr, val);
@@ -118,14 +119,6 @@ static int boost_set_msr(bool enable)
 		val |= msr_mask;
 
 	wrmsrl(msr_addr, val);
-	return 0;
-}
-
-static void boost_set_msr_each(void *p_en)
-{
-	bool enable = (bool) p_en;
-
-	boost_set_msr(enable);
 }
 
 static int set_boost(struct cpufreq_policy *policy, int val)
@@ -532,15 +525,6 @@ static void free_acpi_perf_data(void)
 	free_percpu(acpi_perf_data);
 }
 
-static int cpufreq_boost_down_prep(unsigned int cpu)
-{
-	/*
-	 * Clear the boost-disable bit on the CPU_DOWN path so that
-	 * this cpu cannot block the remaining ones from boosting.
-	 */
-	return boost_set_msr(1);
-}
-
 /*
  * acpi_cpufreq_early_init - initialize ACPI P-States library
  *
@@ -931,7 +915,6 @@ static void acpi_cpufreq_cpu_exit(struct cpufreq_policy *policy)
 
 	pr_debug("%s\n", __func__);
 
-	cpufreq_boost_down_prep(policy->cpu);
 	policy->fast_switch_possible = false;
 	policy->driver_data = NULL;
 	acpi_processor_unregister_performance(data->acpi_perf_cpu);
-- 
2.31.1.272.g89b43f80a514

