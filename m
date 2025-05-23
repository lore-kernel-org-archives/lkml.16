Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BEC2957D4
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 13:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748007659; cv=none; b=KK8haolvIz6erFmf+66KYWpQ+hdJDAV/yM9+vXbG3/0LzFrMpCJNGF5jm9a9kNv3EDItAgbr/RB25yUQ8rsVd8p2n6dG5qt2GTnDQbhqZBkEFrbyPy7y86AsyrWMaXuKqwlLQeLkLUjr+1slV5kYdiA5EEv3GwfwoQ1nfPLH2XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748007659; c=relaxed/simple;
	bh=T1xgNZltAjtmifp4jfz/spATibuE2uO7MlAk8LyXjGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nzOLhbg54dEfK12euCH7gEOYEWqA7djUci/fGxy/5HAMrUTlQDBlj7ecF6w+Yj3CO67KXpVV6W9l8lROhOtj24x/8HWsQTsHuKsyyCeNVMDMqYwQ5Pwe9yl1lISObBIyH1sgWwFy82VvDsyBUAmhki8aJRXGgVprSVjxvBn8jyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VAdVPC02; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VAdVPC02"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54e816aeca6so12729797e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 06:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748007656; x=1748612456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3dLO5FUnZLNVebsG8JkJQYms3itDlHs2qdSFPmZ+ETY=;
        b=VAdVPC020GdSrjcE+qXPZG+A9jWKcqn+AQMO5uiC6J6suxmRFaz4yw4sCnXZy2PWbo
         K67MM4GuQSKFXDAAw9aYssCOQxb7rBHe12DOxvZuIPlbOcm/br+Kq79pFIGRk9+7QD/C
         3f4T8m1TRE5KkjXJP+lDQAoECjgMb59Q978sNqCxIZ/cs/L2l74JFyaO3ICkU7dWKJYj
         aJG2IHAOeIb6Ee2CDY/k1pjnfSIuLJIr00q4Aik1UIXn8CrStMWqeYA8pyNedrOGS7cU
         Hq1nCodUf2IYTBg6ubGxW0b3dKJGRKJOfhCEfLJaGchmxyoxNz4cMERHkSObl6R/0MUK
         gx5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748007656; x=1748612456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3dLO5FUnZLNVebsG8JkJQYms3itDlHs2qdSFPmZ+ETY=;
        b=TgPtBHv0TmllHAJARMelUP20JqvU/pek0oUWMlVO9zfA2vFxrKFPlHmhAqcRoDHNcn
         9hQ0bazG8Hgm0NBdGcSA00EguuPVF3w0Zo/nTt8r2dmLXKZ8w5KB2ERRtsDAF/GXpWxV
         qaHDeb9T8KkKpC+GCNen8hgaQDKji6mW4JTNugDpwojRTQm36GhD1tgQdcUK8cjhA0Fg
         OsvawVkw6hLJ5PWBV7LIoA0r22QsupbmMGL8LisGk/SzPZ+VBV1rKXP22DmswAOaREP3
         NmtRxGGlx6t82Kqh1lAUfC+kvuru7s91/F8Z5v4wd7ccCyDuH+esoBoMFZik6p0L21Od
         YVeg==
X-Forwarded-Encrypted: i=1; AJvYcCVryj5KPzymxD7U98gk2ZpqbieT3DCbjMyvjkyXhjfYZ+wXp+zKsN2JyGxcdc/T8RG5lGG04mEfgILyC6A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrX4nthwKTG2jK3GsULYfgaVABpAIOBdNQBfszb2XgmFuHrYOI
	XgefQ1exlKMCiO6Lrvq0E1b4MzbB8C4ClxJ+ixRaEqXGUpFmngwKugVB8nSiHSx18YU=
X-Gm-Gg: ASbGnctM34SEgxm1vauT4z66ixmzyd+vG6VywhcEXHMiXjGWNkHkqBrcRz0VLlzWPWZ
	YIwryB/xQWqXVfmh8OgPVvNMehlXesmrxBUN6Hk5oRA+lMl+8sGCNBWtDWzjkjdx/Cxxag0/GkW
	t9x4RrwP6kD+ve1QNJN3d81iA2pjfYcDLVChh0WyC29Rvo0+Cht/ZerXdzsDI98SuutsWaxP8wt
	gkRdvzjvvLuKvkqpcCJeaewFDNXMCSBeh+zjr4SxadQgUhvaidSiqj+rarxMpLhclqfbDi+/UI0
	LBxzww66QOaFmr1KXPRNoJBz88eFp11jw0ntbBPwIFzbfI1tRkbS9F9/N9RNGfLlRSLCuVz9S7s
	MFCBzVF96gXd8V7j8PClDRx6Mkg==
X-Google-Smtp-Source: AGHT+IFf5shMU44TNKwf2RFfAZvM/E6/6pPkbDTOgxsF8Wrk3SQBud7p3rswM2Pdzq/U1CzVLKmBdw==
X-Received: by 2002:a05:6512:31d2:b0:545:3dd:aa69 with SMTP id 2adb3069b0e04-550e7245310mr10207937e87.36.1748007655625;
        Fri, 23 May 2025 06:40:55 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551fc0d473bsm1950609e87.244.2025.05.23.06.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 06:40:54 -0700 (PDT)
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
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/21] pmdomain: qcom: rpmhpd: Use of_genpd_sync_state()
Date: Fri, 23 May 2025 15:40:07 +0200
Message-ID: <20250523134025.75130-11-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250523134025.75130-1-ulf.hansson@linaro.org>
References: <20250523134025.75130-1-ulf.hansson@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To make sure genpd tries to power off unused PM domains, let's call
of_genpd_sync_state() from our own ->sync_state() callback.

Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/qcom/rpmhpd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
index 078323b85b56..d9ad6a94b3ab 100644
--- a/drivers/pmdomain/qcom/rpmhpd.c
+++ b/drivers/pmdomain/qcom/rpmhpd.c
@@ -1027,6 +1027,8 @@ static void rpmhpd_sync_state(struct device *dev)
 	unsigned int i;
 	int ret;
 
+	of_genpd_sync_state(dev->of_node);
+
 	mutex_lock(&rpmhpd_lock);
 	for (i = 0; i < desc->num_pds; i++) {
 		pd = rpmhpds[i];
-- 
2.43.0

