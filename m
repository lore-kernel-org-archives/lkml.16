Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051CD238144
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 12:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743595584; cv=none; b=APM2lDyrLhmWdbbWC8+lx9pNFdDN2YaF1K7gGYKkPr9pDhtUgiQ9tinW+YgitBQVJ/e60CDKKj8uJ0SjdJNC9Cq3I+J5YUZW3jEd1lUmowZh5J0R31bjsfWKJy+bsWCxfabY12pmETHsEFHwZ7Wa0ZcLINiNLt/Xgxa88HbfJXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743595584; c=relaxed/simple;
	bh=NqsU/+7oxZL1YCnN3qRWYdYhLF155n2ACcMqk7+Lz9c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tPDjProv3o88327IJJeQ2bkIYFLjB+UHtxxxqsZJQJ79Q4qSPCYmiuKqJW3DKWoZpwz2NsRzos1CwUsgPgX7j+1UZVe3BMX/jJvDmCkS/XIVX2b+gmdBApM8+B/ddma5MRXsc1+IaMn4zoDCYFhbtb/kzh5escZ++sXPY3elz64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hyA4rq+R; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hyA4rq+R"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54af20849adso772389e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 05:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743595581; x=1744200381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zEG4gecI8tD+Jl0eEYFS/WRbrree3429dPKL1Yhc7hE=;
        b=hyA4rq+Rv0BaMBUL7rFuBVDKN/CL4czjJlF/soLUu/NDqDAPgZv7p05t0Hr30tsVWq
         T24ID3iRivFwbDgPUpEvodTxPddaF4vacyV9kCTjrNfJafp+soVcxJXy2qv3+ir8diuN
         SFihR6ZvAYRQVkz+OpiMRBdCDHln368SsqzulhTau1FaP4tIcACWlqn/zHNcAItBvVjn
         wgEAminPRWgrRn5uJvR7xNqqMwEveq9TippRF3AKuOE5FXNF5m0uOsIdZOCugwWlqR75
         F/GFgfUB7SWmzbxDnoxu7x7AwrSdU4BBCbx1V3+yHPkOvZ43P81KjtxHEO2vFhpi/bcF
         jxwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743595581; x=1744200381;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zEG4gecI8tD+Jl0eEYFS/WRbrree3429dPKL1Yhc7hE=;
        b=bHP4yhvutjPh6c+00kyhI+fXDnDxRuijlfowEQDOBCRQIX+ODopEnwEVz8U1XL+GXY
         jnuoTg7a6fLJRDj1+qIIVXpwqRWHVW6bli1CAKRaIghAVZP97sl8Q+c9XuCyxUI/ONKJ
         nFmtldD9zbymIi5D5moS42+uL3CAEjX609p24j36qSCeGj17++ca4ENieN60z/ZpPmfn
         wUMvTIQEu4PHeSxLQVk/jExKsFZ8UI4XD+uLYICmTmaJtUWnBE87YUSDFqjU9ZgnxdXE
         1bzs/LaOWpUh91uB54hAtzXaj5ZtEcu5imE2iJkDf960scjFhxOr5JZRkxWA1DbLGku5
         SYmA==
X-Forwarded-Encrypted: i=1; AJvYcCVvBzJAw6VWSzNXBDJF7Ye/Yy/2OjdLpDlDxCWiZzV6koUuYx4Bf09wDBb+y7Kl6y0njT9neUbko5pR24k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+eHXtWS4shaYlu32rQ2rKjj+IrHGJ2geXYab8QACrOlh6lolb
	J7E02yU+cP5jsnuCUMpN22fkKUrq89QTksrzoCqTONb7jsNqBWSpYZiDzkfgCiFr0+6isAP+wf+
	D
X-Gm-Gg: ASbGncvIs2mUUOJcEhdrcSRHCKAf45NFCOnmYwwlwIUv0sqUwCE+6oC9Aa2LxM3wrJ7
	6oIZst4TxV49tUE/t8N0d4b0Mi1RcTdea8aysf/bz1SHhWjMihio1iozlrShilbDVqC1N96X68n
	2418K+Gwtuu72/AglTSYQLpvEIq6XNHDZkN09yP5VwAOMgbHkY4Jf3rXQ/jb6HoiaueiPZoEdPH
	LlfhZYV+eq4L5z424Oiq2x7yhx2Kf54OX6wE0dW/+3bW76T4psPQKpXFed+Dc/K5vByi1wZrzoi
	crks0PwAT+wRpbDnTW3g0H8Cyi+lFxQXAbCfjO1FO7/YxXCVPGLse0aTz8xX+8zBqfjrV7v+LSV
	c0s0lcKSoMdFwmopk8KI=
X-Google-Smtp-Source: AGHT+IHAorU5HIF63fzGnkivetyexueQYMJ3ZBC4Gy8XB0gdbMI3Klf829/ZF7PMB3Gu1bJ9VZlDzw==
X-Received: by 2002:a05:6512:3d28:b0:548:878b:ccb3 with SMTP id 2adb3069b0e04-54c1a1daf7dmr682827e87.25.1743595581025;
        Wed, 02 Apr 2025 05:06:21 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b09591bc4sm1594858e87.166.2025.04.02.05.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 05:06:20 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	linux-pm@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pmdomain: core: Reset genpd->states to avoid freeing invalid data
Date: Wed,  2 Apr 2025 14:06:13 +0200
Message-ID: <20250402120613.1116711-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If genpd_alloc_data() allocates data for the default power-states for the
genpd, let's make sure to also reset the pointer in the error path. This
makes sure a genpd provider driver doesn't end up trying to free the data
again, but using an invalid pointer.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 9b2f28b34bb5..c179464047fe 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -2229,8 +2229,10 @@ static int genpd_alloc_data(struct generic_pm_domain *genpd)
 	return 0;
 put:
 	put_device(&genpd->dev);
-	if (genpd->free_states == genpd_free_default_power_state)
+	if (genpd->free_states == genpd_free_default_power_state) {
 		kfree(genpd->states);
+		genpd->states = NULL;
+	}
 free:
 	if (genpd_is_cpu_domain(genpd))
 		free_cpumask_var(genpd->cpus);
-- 
2.43.0

