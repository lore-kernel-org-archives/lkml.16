Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FBD215F48
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 09:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745315659; cv=none; b=OypTZpg8pJobDaFsgam5n4qFDSq/ZBLndt+HRJvEI2teTQBAIwtI81nnDDjM64gtQ9QtcrengEw3vHgUrnwOX3JDhRNQIpnQpRuoEufgCFNI4NX6YJGN5hOqsPLKTBLNrtAURdiJCXo7kMI+FGAwj6RX2PanHPEnLq/rgTAm0Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745315659; c=relaxed/simple;
	bh=M+/pqwhpw1fPajfCHBDUoRbLW6qnHDooYX4AD6Hjgz8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JPaRuzGgQV4Vl9MMeeajRfZbYrJ/P+nAP+PcPKhX/HFE2oDFGx0QlRJpLT1bmfqHxTQmE5RnLbZbWEbYqDzGSm/JfXNJay0CbQ3BCqAdVo/AJAwpSMKmJKdOqZcw7evCZ0vpWvufEOlPbOJJA7dkPu2fUrOUX6rhcmBBR3f3+24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TQWMAAnk; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TQWMAAnk"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-30332dfc820so5864697a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 02:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745315657; x=1745920457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9H3WR3nBCdmpNnYy6QA+g1VB4XUB5xCxQVtKBFhosH0=;
        b=TQWMAAnk9ioHSH7CR85RwGzdglqimDxBC8mNm5IvkxwehRVMRn8x2n5oWU0VqWI5VG
         SexioYq/lwV+yRU/1+PEwf1VKkRTqH+e6KdocF0ZnmvTV4tx1tK8f6VyaS29v4kz7qz0
         qkEtfzzzS1R2L+ZfHejzK8rXiaDd3znU/W3794aUYng1+UzxPTJEp92zp3xzQSneOccw
         edvjt0ygn7x1j1EOk6+3xWDvuL5k4pfQM2pRTukFQX73f+kWjLsa7uATtrzkQmYxMJuZ
         /UbYC8mswVA35W6apV8v6H1+X8aokqkT8Qj7At2fpSft/JcI+I3GJMT0tMSHSoZZzQuj
         epVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745315657; x=1745920457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9H3WR3nBCdmpNnYy6QA+g1VB4XUB5xCxQVtKBFhosH0=;
        b=uO04Ja9GD+GLIP88ld/yaap2EPV1ly8CiCGK6p3ga65CVEO/AdR3E1H09b6dgEsakZ
         ezdn8qrj04VO3MC3BoMwHjg+My7Vw70O176OhlagN4wnZTSkKxVSxf/h5nvSeB8X643r
         48LPogr775/vORSS5Y6b9ON2xJpYRgs2NxVjSLrTMnSg5byki9YohFJI3nwdHUoM3uGn
         /no5xdEmA3axeVbA+Fy43ME55UL0lrU5AVTju0eUgAdSKTqXiYQCMTUdjZKE9zoSAu8H
         f74D14RwN+Ar2yVu02l9dGFqOpiOTP4plC9AkE5tn8b5qZLlo1C2I7RqZFS5BQ/gyARe
         lIKQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2/sBJqfTSgL6HEcQ5nmu6cSvJU25rosjj1xfpD0f6+1pUblPB2BbLkl+zkCb9ejPD9dMaX+oSMteXvFY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkBA/6Vd4KJiRyYJ/2UmYMg8LptJ4AqA2fvVhD4EGf881lbP+B
	RG+wYQmmxaYKXmAgNMmXKTvz67n34SBn+eEjWFhD8XPs2fZUX4qGnHWjjsWGyPJgtJ+olrhOyll
	j
X-Gm-Gg: ASbGncu4C4b6appo33p/P/76uQRL5y0kQh7gyjQ9UA8/eh5BXwNEsm7y0lGgsMLMYZh
	Yf4JoJgQqwH2nKIWlfpSAaMNZJjYOVOmGffk8KHyn/o7FsoMGanu8pXNFLt+TYy38e31k/MxuL+
	8CT3wbVxxZsE2QfA63XdoXdGwEJRZ3a81GCZzXanzZnQW88BoXVp/Ss6W8pt6Weu7MHL16enZZx
	F76HL3Gooy5byvSeLPksL4jDf2PouTRGkadC8ChgTsXauPe+WiAr7FF2oGVHat+pg5iIe6Wg0T+
	DnTkL0L9HO/D1PB2A/Lld8Udr6R6teM0A+TIrk7CHw==
X-Google-Smtp-Source: AGHT+IFBp8nq5mfF9I1/dtj2dn0MaVxqa8vr08jLr5osEFoCWxugzRmsBLS0J5zZhMe46HaAwG6I1Q==
X-Received: by 2002:a17:90b:37c3:b0:305:5f33:980f with SMTP id 98e67ed59e1d1-3087bcc3a75mr20408761a91.27.1745315657498;
        Tue, 22 Apr 2025 02:54:17 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bda4d3sm80994595ad.47.2025.04.22.02.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 02:54:17 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Lifeng Zheng <zhenglifeng1@huawei.com>,
	Nicholas Chin <nic.c3.14@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] cpufreq: Introduce policy_set_boost()
Date: Tue, 22 Apr 2025 15:23:54 +0530
Message-Id: <d2dbb81d7ed19644bcb9da497684d99fa633da27.1745315548.git.viresh.kumar@linaro.org>
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

Introduce policy_set_boost() to update boost state of a cpufreq policy.

No intentional function change.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/cpufreq.c | 49 +++++++++++++++++++++------------------
 1 file changed, 26 insertions(+), 23 deletions(-)

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index e31891c7b500..24745088403b 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -620,6 +620,22 @@ static ssize_t show_local_boost(struct cpufreq_policy *policy, char *buf)
 	return sysfs_emit(buf, "%d\n", policy->boost_enabled);
 }
 
+static int policy_set_boost(struct cpufreq_policy *policy, bool enable)
+{
+	int ret;
+
+	if (policy->boost_enabled == enable)
+		return 0;
+
+	policy->boost_enabled = enable;
+
+	ret = cpufreq_driver->set_boost(policy, enable);
+	if (ret)
+		policy->boost_enabled = !policy->boost_enabled;
+
+	return ret;
+}
+
 static ssize_t store_local_boost(struct cpufreq_policy *policy,
 				 const char *buf, size_t count)
 {
@@ -635,21 +651,14 @@ static ssize_t store_local_boost(struct cpufreq_policy *policy,
 	if (!policy->boost_supported)
 		return -EINVAL;
 
-	if (policy->boost_enabled == enable)
-		return count;
-
-	policy->boost_enabled = enable;
-
 	cpus_read_lock();
-	ret = cpufreq_driver->set_boost(policy, enable);
+	ret = policy_set_boost(policy, enable);
 	cpus_read_unlock();
 
-	if (ret) {
-		policy->boost_enabled = !policy->boost_enabled;
-		return ret;
-	}
+	if (!ret)
+		return count;
 
-	return count;
+	return ret;
 }
 
 static struct freq_attr local_boost = __ATTR(boost, 0644, show_local_boost, store_local_boost);
@@ -1618,15 +1627,12 @@ static int cpufreq_online(unsigned int cpu)
 		policy->cdev = of_cpufreq_cooling_register(policy);
 
 	/* Let the per-policy boost flag mirror the cpufreq_driver boost during init */
-	if (cpufreq_driver->set_boost && policy->boost_supported &&
-	    policy->boost_enabled != cpufreq_boost_enabled()) {
-		policy->boost_enabled = cpufreq_boost_enabled();
-		ret = cpufreq_driver->set_boost(policy, policy->boost_enabled);
+	if (cpufreq_driver->set_boost && policy->boost_supported) {
+		ret = policy_set_boost(policy, cpufreq_boost_enabled());
 		if (ret) {
 			/* If the set_boost fails, the online operation is not affected */
 			pr_info("%s: CPU%d: Cannot %s BOOST\n", __func__, policy->cpu,
-				str_enable_disable(policy->boost_enabled));
-			policy->boost_enabled = !policy->boost_enabled;
+				str_enable_disable(cpufreq_boost_enabled()));
 		}
 	}
 
@@ -2861,15 +2867,12 @@ static int cpufreq_boost_trigger_state(int state)
 
 	cpus_read_lock();
 	for_each_active_policy(policy) {
-		if (!policy->boost_supported || policy->boost_enabled == state)
+		if (!policy->boost_supported)
 			continue;
 
-		policy->boost_enabled = state;
-		ret = cpufreq_driver->set_boost(policy, state);
-		if (ret) {
-			policy->boost_enabled = !policy->boost_enabled;
+		ret = policy_set_boost(policy, state);
+		if (ret)
 			goto err_reset_state;
-		}
 	}
 	cpus_read_unlock();
 
-- 
2.31.1.272.g89b43f80a514

