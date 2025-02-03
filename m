Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C276120103D
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 10:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738580062; cv=none; b=alm5eWhEY66zLsLmjAFI3HvdukgScTx8D10CaQLtH/MEzbyIl528c4Y+n7TbqfJlhOihS8fNjeQ70s90+SsbB6AtVPxATgTjhRop9/eGyk/QgqLMaDABfabQ7D4ioW4meuTO3MNtEjVvGje+xj/LX8C/XLDJbJcRoJB03/2GlqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738580062; c=relaxed/simple;
	bh=aa1FV4l+STIwrscM9YECQHnEnudQCLxRLs9TbwVG6pE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SSRQZq0wss8pbLA431IMl81T3jRtETOlIGNec7pcoKlLywseJ65TX9IB8O2iWHIdHWJWjUTviP/oTRHs7hEVuje/bsEs1gCe2FwVJjFTErweL4BgHRKFSn2T3Kpz5QNZCeuN8j67GYaznAnQdAiQmvU7MgEVCab01wJe/n3OW8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fu/SaBch; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fu/SaBch"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ee67e9287fso7353362a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 02:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738580060; x=1739184860; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zgoepmzow92M5TjxAmUfNkYISiNmmdFHKPfzWUElINg=;
        b=Fu/SaBchJNT51MHHPAGUa+cXrPmDFJAmBUixxYtO3uzmp23UrARRFgwgxpjjSusjuS
         Xqz+1FHfOC8hft7SdAQvAmRXJ9NPTnUuiu2eN6byCysQqHXibqb7sWqMoZV11MdKEDYk
         yMO2DsrzEnP9w5ONmlV3g0S41qTHOcYFviN3WvlPefdfmmXLlacDk36ADoSowz3LXE/D
         rm4x/T6lzA0cUhshtDnTTt2XiuZl+GeN0+BNVM147x7hEgJUekdSN4J3Tv8PgwnpVLqJ
         ZneCMP8j2eo2JX7JwJw4jwMa+XkuT5URF1l7ZAUAK3xp9Gg/QMhSsPEVlfujxE+hX5fm
         +dGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738580060; x=1739184860;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zgoepmzow92M5TjxAmUfNkYISiNmmdFHKPfzWUElINg=;
        b=SHLMNeJPiQes65ed6RNuWo9CNA+lZbVZCvrkGz2Lf8foKPYISiIeQ9KpcEsMdlRwFW
         F0Gx1tI1ZFfOKWfoZv7JgD6kr/mi7H+d88a8n2jewOktyT0aGZp7Ihp4kV+R10IcgMmQ
         sHDk6JtpoHYvGz4Vcnnqd3kBCQfSp7HPhzkPF9PD7wwUB1lV+SK7Tbvs4h/jMWyV6t7T
         MQH4e1BzRxvrnxUpCLwyu75FnbcYde+HxYU6UDu25OzIewGi2hq5weqmJs/F6mtLhx2g
         bFxbnAasfj2sEC9jzvu5o8TA6MUzuqtu/brNkLzESQouQbYJJ1khW/mExKm2+1uBmo5i
         lRnA==
X-Forwarded-Encrypted: i=1; AJvYcCXj4Oq3HdfhMtx3W5YFU30L5Mj9BjXaPzgNejlaYkimzbHLxEsoqaqntp0YVdXzQufTRu6BCdidno5vgM0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzajqHPU0VYtIupg9sJaYHLr7wm9MulNpxH/kpI4sJCc+6KQbOH
	trs+psIbJoxgxLh3eWIc8S7v1zzCe6QZTs3SsfKg0U8TRndVXkHtI2c0Y4PNF2k=
X-Gm-Gg: ASbGncvDx/h7lHsJnHLO/zK51nd4xDVgZtgcY8Cx3hJk17NO0NBl6QY6KE5OoUJrS6l
	qkSJo0WdzrYOW7VmdFiTqxXzm7pXaWiLSJRGwwA0+UvP7G+hvUBks4NY5Wm9hFw+oBwVjS1ZgSd
	B/4x0qQxo1+/evEgE2F8g3YtCPzVz+gQ9diGWIISMriEkOEqpsJja/vsFLJtNpSzPLgq49qJGqt
	9AsGVcJLZpdrZjLuhbs9i8MuGY8DDD64R1cNmyS4cVrXmE8t+0ow6dgB9ZlAjRp+TuMGR1yvBzp
	dfkMb1LG49DMxDdNYw==
X-Google-Smtp-Source: AGHT+IFqfHSwetvYfA/FzIoXp3I2Mqr/lsbSnyEV3QTlwurazJwiw64SL9y1p/I4Ms3nJKLMSyjBcQ==
X-Received: by 2002:a05:6a00:acc:b0:726:f7c9:7b28 with SMTP id d2e1a72fcca58-72fd0be1799mr37521013b3a.8.1738580060025;
        Mon, 03 Feb 2025 02:54:20 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69ba3c1sm8364034b3a.108.2025.02.03.02.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 02:54:19 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Christian Marangi <ansuelsmth@gmail.com>
Cc: linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2] cpufreq: airoha: modify CONFIG_OF dependency
Date: Mon,  3 Feb 2025 16:24:15 +0530
Message-Id: <9d51d2710061dfa7f2568287c6ed125b858b7318.1738580005.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Compile-testing without CONFIG_OF leads to a harmless build warning:

drivers/cpufreq/airoha-cpufreq.c:109:34: error: 'airoha_cpufreq_match_list' defined but not used [-Werror=unused-const-variable=]
  109 | static const struct of_device_id airoha_cpufreq_match_list[] __initconst = {
      |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~

It would be possible to mark the variable as __maybe_unused to shut up
that warning, but a Kconfig dependency seems more appropriate as this still
allows build testing in allmodconfig and randconfig builds on all
architectures.

An earlier commit, b865a8404642 ("cpufreq: airoha: Depends on OF"),
tried to fix it incorrectly. ARCH_AIROHA already requires CONFIG_OF, so
this change does nothing, and the dependency is still missing for the
COMPILE_TEST case.

Fix it properly.

Fixes: 84cf9e541ccc ("cpufreq: airoha: Add EN7581 CPUFreq SMCCC driver")
Fixes: b865a8404642 ("cpufreq: airoha: Depends on OF")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
[ Viresh: updated commit log and fixed rebase conflict ]
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
V2:
- Fixed rebase conflicts.
- Updated commit log.

 drivers/cpufreq/Kconfig.arm | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/cpufreq/Kconfig.arm b/drivers/cpufreq/Kconfig.arm
index 0ee5c691fb36..9e46960f6a86 100644
--- a/drivers/cpufreq/Kconfig.arm
+++ b/drivers/cpufreq/Kconfig.arm
@@ -17,7 +17,8 @@ config ARM_ALLWINNER_SUN50I_CPUFREQ_NVMEM
 
 config ARM_AIROHA_SOC_CPUFREQ
 	tristate "Airoha EN7581 SoC CPUFreq support"
-	depends on (ARCH_AIROHA && OF) || COMPILE_TEST
+	depends on ARCH_AIROHA || COMPILE_TEST
+	depends on OF
 	select PM_OPP
 	default ARCH_AIROHA
 	help
-- 
2.31.1.272.g89b43f80a514

