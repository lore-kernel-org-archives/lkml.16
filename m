Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BD1274B53
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 11:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751370481; cv=none; b=qQdJK5wX4kSxf2fmjdTWjDIR1xSPZddMz40pdAEgCo5rLfpH/teo0C4EEAvenlXxxJ9+nPYVGfImhL5eryKtjmSROZ58ko8hTMJxAoPUUcroiRJitlh1IeUrvVP6MzipzgCskYY3C8BsdgUGPxSPoQnB81fqXatjrhaWDrW7SG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751370481; c=relaxed/simple;
	bh=OJsFSRHDJMTbBK1r1V8gNAI3hYrQDM7YZ37SYXjVX6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LalCrnyna6zwQG95NekFGoaxsmndCsWD+NWuF/xeUkaoPSyU3hIq6e1bPZyqKpuZFhjHkvIbvUyYaxVc//6wGQHhPE7Zx5HoUseREAbesJkXaZi8NXu8d6FNpRRFlNe2gjMjI3PxEr9ZseA3dj+9QfhtI8KpZyvXEt+2bBEYWBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XmER6uV6; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XmER6uV6"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-553c31542b1so3663504e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 04:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751370478; x=1751975278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ok/7cX9BgYxhpHX9QUiDoGepvZnSRp4y0xFThE2KYY=;
        b=XmER6uV68C4W2UtzWeMf6EU10dF38lcd5djL9QVwGpa99lTcCSn0vnTrtEWtL1NSZY
         IZ7dr8ajGVx5dyPvtE2riVJMdFxPoBvUhZv7mkt8j1x5t8CmPPG95Lnr0YYyuRqlYU+x
         +YjDZNUJFm0xYZD+YDXg78n3lXJhnVP9/Oiwz0lPL8xQbk5Jccg5vrDT46BrIzEaS0vR
         coLvTiPkxMTcj7ZctL0gpvrQo/jG/C0iTfGmytxyE8Fk9G+oa3N+vwFnU4fUchtRJK6S
         rY2WYXa9GsZWvlUes5eA//ijqy2joByBghDUDmnYKKnqIsxQ/jy87TVqzc6s4GfbrTNL
         ARvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370478; x=1751975278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ok/7cX9BgYxhpHX9QUiDoGepvZnSRp4y0xFThE2KYY=;
        b=nM75krjrH4qQNMjj9B72J4j/K9KpTuHLXFgAHfU7/7a6TrJBzcYL+GCIMKuwOs4/hG
         AGojm166/hUVaIXa+2Nd2ual8Xzhwp3LHUsAFRrkane4jLkiyPEo8IlEIajDOucJBMlA
         5uW4/UaJCd9agV74I7Ry6EcFZEbX8kStQEWItj8HYETh1xFTQC7zR1lA2VeJgAyKK4I3
         o0ugECkSCxekI7+KhNETygL9VO95z4Ca+2E1teYS4ZccExuSBlWdsdT4kmxj7xnaxaaw
         1ufqJX5DMcjiMHcSEwW1vPiT0DJsIQZP3/m7EItQbUTonMkq1qqXrmNyP3eBrAySMOy/
         3dIw==
X-Forwarded-Encrypted: i=1; AJvYcCUrlio1e8No8ec5SX/2QKf7mbSNyRmiFTTKR6EzCTSgn5VfMMk0TzVw46WUXfn5kD3K635oIhOHdL7wK7M=@vger.kernel.org
X-Gm-Message-State: AOJu0YygyW+tCrifjx6KDm8tcAg966Jof/wUxb6clOgKiBd+cT37nR8R
	L82Fad4o8yVti4oll64MaHNSILBdtS6jX/6Z13xV+A3VbTdPzWnO6Z6rB4L2aGdYt5k=
X-Gm-Gg: ASbGncsptH4scGSQ38PYqX+XBPCz674WgVzbrbJEQOLBo7Q6Os2OFWEy81odSCHpOtJ
	9QIdX9lKUD+mnzQlzZOHgJf66uMAYya5MytwNawZpy4/i1PU6yZn2HBdLapee+iTAfHjfI6VY/w
	5aSylkmdj3oIT4aUOlcsga8vJT5A1C2X9sZigtc8X2TRT5PYmwlS9YB/cD/9uYukQuDTcHxI3VF
	DkEt5QJyWu27qZ2sP5XXCszF1nrL32afyXoBEtjWSmnYoUXPH7UtBbHUl/df1rS7K1B6U6mm4j5
	KxW3HkPSmp7G10TToBOyrOsQGoHvS81B51dcxQALUkTh/p4Cl6lSj4XPrE5+5uCKfgmShx9LL+3
	VuNIO68VZFk4fMjhsYoOMyoCq56GE8EmeAEEjK5UcygmAYdg=
X-Google-Smtp-Source: AGHT+IES0g6TR1bgUHY5vOOeAdnd+P5lreUzwvc4ftLy4qnq0OkpDCoD7RW1WzZ31pUM09XK2xu3aA==
X-Received: by 2002:a05:6512:3ba2:b0:553:3407:eee0 with SMTP id 2adb3069b0e04-5550b860e0dmr6025448e87.4.1751370477847;
        Tue, 01 Jul 2025 04:47:57 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2f162dsm1800592e87.248.2025.07.01.04.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:47:57 -0700 (PDT)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 10/24] cpuidle: psci: Opt-out from genpd's common ->sync_state() support
Date: Tue,  1 Jul 2025 13:47:12 +0200
Message-ID: <20250701114733.636510-11-ulf.hansson@linaro.org>
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

The cpuidle-psci-domain implements its own specific ->sync_state()
callback. Let's set the GENPD_FLAG_NO_SYNC_STATE to inform genpd about it.

Moreover, let's call of_genpd_sync_state() to make sure genpd tries to
power off unused PM domains.

Tested-by: Hiago De Franco <hiago.franco@toradex.com> # Colibri iMX8X
Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> # TI AM62A,Xilinx ZynqMP ZCU106
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/cpuidle/cpuidle-psci-domain.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpuidle-psci-domain.c
index 2041f59116ce..b880ce2df8b5 100644
--- a/drivers/cpuidle/cpuidle-psci-domain.c
+++ b/drivers/cpuidle/cpuidle-psci-domain.c
@@ -63,7 +63,8 @@ static int psci_pd_init(struct device_node *np, bool use_osi)
 	if (!pd_provider)
 		goto free_pd;
 
-	pd->flags |= GENPD_FLAG_IRQ_SAFE | GENPD_FLAG_CPU_DOMAIN;
+	pd->flags |= GENPD_FLAG_IRQ_SAFE | GENPD_FLAG_CPU_DOMAIN |
+		     GENPD_FLAG_NO_SYNC_STATE;
 
 	/*
 	 * Allow power off when OSI has been successfully enabled.
@@ -128,11 +129,16 @@ static void psci_pd_remove(void)
 
 static void psci_cpuidle_domain_sync_state(struct device *dev)
 {
+	struct psci_pd_provider *pd_provider;
+
 	/*
 	 * All devices have now been attached/probed to the PM domain topology,
 	 * hence it's fine to allow domain states to be picked.
 	 */
 	psci_pd_allow_domain_state = true;
+
+	list_for_each_entry(pd_provider, &psci_pd_providers, link)
+		of_genpd_sync_state(pd_provider->node);
 }
 
 static const struct of_device_id psci_of_match[] = {
-- 
2.43.0

