Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E1B274FD8
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 11:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751370482; cv=none; b=gErGbu3E1t3FP/frS7RceLiEwLgQZ7lSRH3cyp69vkZ88VtSRi8wRMPfIhk2TthaFxj+rIuUFElsUhmJtTyLvn2LRzk6x4QqqdzyYCAUv4JfrCfL48oRCE/IjOEPOMZOuM6UwWB4EwKYLZHP7Ve6wIRMMtsHn57GuHnp9DOW9D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751370482; c=relaxed/simple;
	bh=WI4ggVmMvJ2qYROTcAQQ6DFmZPKl6TNhurfC6UWuJzs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bl0E6jQos/SUwSkWrLof6rrcivri1VpDA7t6dU9vTfk429ZpVQPQGctfS+w0vUvq0Lh/QLOx1VfO2CU7CnFOZNXTPPJrl/x6ys3QuNYHG2bIN/+QC0Fn2jbc75ddaWMYUQe+FsXRYaSKBP9B0zr275pybwabTMNoOIGAN/C8WjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QwG8MWKv; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QwG8MWKv"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54d98aa5981so4727717e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 04:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751370479; x=1751975279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yHynz9mWDead3UZZabeI741cKQ7wi8Dc9CTNMBrKiZk=;
        b=QwG8MWKvHCX7YYJ8drHyTcvAVkHunW2k2OaSVVbu4n35Q79yhOoUrOgaNv3bJz/iID
         UmMDIN6MM9rCHU3zPew4JUHQsA6EfYo1Vz1lK4hiReIv6KK9WXk4gLigM2hkT8ynt6FX
         dEv9YNcpgV2JwzdD0hpsa9LuXEE50sIjP+gnSdFqYuT6RvYQf4+8nlwU3Vui34ABkxCX
         gVYJ56eXXheQzTM2q49mBREj1GxW2WrpDj1k8z+crgnXk+lf4NIYklm6ZHsPl8AYgRZu
         /5d6j5PDRZGm7kCJau3mz9763macTVgvteFwEL6h2jhSquL9DPfv4x72adbOBo93dX7L
         DHXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370479; x=1751975279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yHynz9mWDead3UZZabeI741cKQ7wi8Dc9CTNMBrKiZk=;
        b=IcWSwlXODRGLT4+8u1+7/xlBJ1rcE1traWtbFU6Xf/dCxKqVvKQAhRHEB2msae2fk9
         JIjhVk+oUp9DGr6zM1c3oLGOFquOCA4fcP7oeLKzAWTsLG7p1xk7fpVCMKnF0TmQIzE+
         4LkbUXVfP/pQ383kiHmTTZqrL0AQTqGDDt/V5qzMk06/ij3Yb6KdIl/DtyK8q8aus8zr
         owoQsKMSfCWv0xaOM4A0bxXUKp4drnbp5fTKAzMcwhCtsyQzAq6BQkOV07sVEdPyH5SZ
         rsKmu4XCBck1vsVIc5Dx1ahy03TTPO0cQ/b1Qo8qv/+9jAzN3GK0bpFtbu0FTzTZNyeC
         tVuA==
X-Forwarded-Encrypted: i=1; AJvYcCU99KkPbm0zbL+PcgvjE6Tr+8ouDYFacZXzDsE6s86WzExzuV6zCPad9vw+HJcvWzd6BZgAk1j/sOwTHGE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMKz+jaE/M8ZxQvJ0acGSrdU8ger4ImyOvCGRCLY1mAtDC4XZA
	Y8gmRS6kOXNZUhdse61cV9GZnlA92+I+nGGwaO79detBFdX82bFs5xwBV6mtDGz6gbU=
X-Gm-Gg: ASbGncsCzSvxK7igemC3/F1a/u0M4vUkgIstJf/AypvArJQ5e5oB6T8pOtHRh/TjB2z
	dDtAIjSQ2pMToQIgnP7LmpnMI7yuZaJ6zQiPKmTW016KFWYshTMsoWYE9eaQ/vq72GOfiFoznV/
	DI4DUC7RWCMSewj717pvjExaX85RwHK6wPBxP4ou6ULsugTv+CB3WZnhzJ769UkbXzoMeKTTgO5
	Qi2DhHetIMrt1fRk07IF51Nya0ksi7zSTpcppYH7lHcEjNpdxpsZ3xMJO0GO23uJ1RBd4X6aGSW
	P8EdQtMgwr4/e4r4jyQzA3pRtkO5EGlP/Z0Cv6/28iTmPz09X01yQf9tfTu8iLktuzaJkR1q06T
	KbLS0YnsVk6//gOXQ8k/8ZQ/CqwbAWVMJbOr9
X-Google-Smtp-Source: AGHT+IFqyMXKCb8elAwuQdxdqHT2scTfHnmyox7XhrjqrojZnvfr/F02wddlYBxLw5k9BSZ0P+ueUg==
X-Received: by 2002:a05:6512:114a:b0:553:a867:8dd6 with SMTP id 2adb3069b0e04-5550b7ecd57mr5857067e87.9.1751370479219;
        Tue, 01 Jul 2025 04:47:59 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2f162dsm1800592e87.248.2025.07.01.04.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:47:58 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Saravana Kannan <saravanak@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-pm@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Johan Hovold <johan@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Michal Simek <michal.simek@amd.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 11/24] cpuidle: riscv-sbi: Opt-out from genpd's common ->sync_state() support
Date: Tue,  1 Jul 2025 13:47:13 +0200
Message-ID: <20250701114733.636510-12-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250701114733.636510-1-ulf.hansson@linaro.org>
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The riscv-sbi-domain implements its own specific ->sync_state() callback.
Let's set the GENPD_FLAG_NO_SYNC_STATE to inform genpd about it.

Moreover, let's call of_genpd_sync_state() to make sure genpd tries to
power off unused PM domains.

Cc: Anup Patel <anup@brainfault.org>
Cc: linux-riscv@lists.infradead.org
Tested-by: Hiago De Franco <hiago.franco@toradex.com> # Colibri iMX8X
Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> # TI AM62A,Xilinx ZynqMP ZCU106
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/cpuidle/cpuidle-riscv-sbi.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidle-riscv-sbi.c
index 0fe1ece9fbdc..83d58d00872f 100644
--- a/drivers/cpuidle/cpuidle-riscv-sbi.c
+++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
@@ -347,11 +347,16 @@ static int sbi_cpuidle_init_cpu(struct device *dev, int cpu)
 
 static void sbi_cpuidle_domain_sync_state(struct device *dev)
 {
+	struct sbi_pd_provider *pd_provider;
+
 	/*
 	 * All devices have now been attached/probed to the PM domain
 	 * topology, hence it's fine to allow domain states to be picked.
 	 */
 	sbi_cpuidle_pd_allow_domain_state = true;
+
+	list_for_each_entry(pd_provider, &sbi_pd_providers, link)
+		of_genpd_sync_state(pd_provider->node);
 }
 
 #ifdef CONFIG_DT_IDLE_GENPD
@@ -396,7 +401,8 @@ static int sbi_pd_init(struct device_node *np)
 	if (!pd_provider)
 		goto free_pd;
 
-	pd->flags |= GENPD_FLAG_IRQ_SAFE | GENPD_FLAG_CPU_DOMAIN;
+	pd->flags |= GENPD_FLAG_IRQ_SAFE | GENPD_FLAG_CPU_DOMAIN |
+		     GENPD_FLAG_NO_SYNC_STATE;
 
 	/* Allow power off when OSI is available. */
 	if (sbi_cpuidle_use_osi)
-- 
2.43.0

