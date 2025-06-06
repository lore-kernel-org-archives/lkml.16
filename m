Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631A81DF739
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 09:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749200893; cv=none; b=F6A8IPHtjiwWrCvMQ2T6HLKJtlD853vKn+9QWg+3atEI03tK9tAd6JTfuL4HRox/ABCs7n9ZTQty/Yl4N7t7TCcKLfEG0rZXEkIPde9Ie2sDKwR0LE/IEkvSVl8z7bd19UCCkuyJfmA/pDHgKFifdnxVC9hebmWI7kUYsvO62dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749200893; c=relaxed/simple;
	bh=ZFnM3PDhFbSJjWsyk0zkU5H5rASBj60HHgmc53ZHy8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fmF/7yCn9iJbEC4sScBFSLH3qINhX8qeTMrg9jxzyWK/JGUV9iMGDCJD9lQ3bMbD1CWez9KN2UjcnZoa/bkV3waG5zuN5ShocK+Y53MJTRgbCK9GNjCXWtLG4FRC7qFFVFJggFI1f5EW1imwpN4fOnBSF4t7dQ7gJCUWw8vrhvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hEESVUea; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hEESVUea"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749200890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zY1UJXwwdXuV/sjsPfipNC1p4dsxIugLMJFfrvt+Ih0=;
	b=hEESVUeaznH0JxUOK+TKxspAkTxbnqyAS0j5WVhE+1A2OpMhECei2lwVSGSDfJwuYsYjIg
	d9lFNwiYGzYu2dD8itVrqTu0GgSFgcIqu+MdP3BQez8dl9uAT4XS1URimP3IjUw1pW8bCY
	r5H/e60QwPUpJtBRKuSdMlJUso3JoZI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-527-ZXPD1VVzM96-c-URO3yaJw-1; Fri, 06 Jun 2025 05:08:09 -0400
X-MC-Unique: ZXPD1VVzM96-c-URO3yaJw-1
X-Mimecast-MFC-AGG-ID: ZXPD1VVzM96-c-URO3yaJw_1749200888
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-450eaae2934so15764445e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 02:08:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749200888; x=1749805688;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zY1UJXwwdXuV/sjsPfipNC1p4dsxIugLMJFfrvt+Ih0=;
        b=f3126r/twVX/M++Ts8wUuybTHTNCrGyqVdrdBsw5salP9K4/U1Sjg1dfatcUxTyyPU
         BsRt1abNU2jnl1AAMkosVUUFlGKcRW0nk4Lc8VlP336+PTiip7yIVVzoIuyhagCfcqtm
         Ox7O9wa/LE4P+XktkAaOtV5+G2ZTYKPAYEmr8ANhGeRmSR5inyHEXoQoR0A1l06wocnF
         a3M+1MqqwwuwBF+jw3sD/o45CRReIgZh1NN9lDm5Pt458LpSxrmY4Cts62ZNLvqDUmrJ
         TMGBs/tmEpnxisL3ZoRXXdO2HidKb85JE6UbJib7ltVrZwXT31tcITtKkRUKCYO1Mh7O
         /M8A==
X-Forwarded-Encrypted: i=1; AJvYcCXkO58p5k3LS3Ad+hOMzkdzXf03xYsNywxdpKvHB2lm92r5Xcp6MAvL9ORiQZf4lHSM8LJ0rOLxl8vjR2k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ8OOPH/Kwmp8pM7yW7iPtps5RJ4QjFjH+aR6WN3oYw7cB/9Z4
	PvfjIotT+dyTNUw9Ay8welAlwwWx+WzLLxog300GtuAM7PWEWNSljp8rEL2e5gKULT8EFEkPTth
	3SR5bi2BFmv3rYc5fFZBfgfqp6qrfEAKNDujl/VN24PyTukm37RqBhzX54v4/Q4O/UV2in/RhJA
	==
X-Gm-Gg: ASbGnctcyoCyH9znmdd73UPlBvpOODIuDS8Cwkno2RGsLo74DNpD7rji67KiiARLvCF
	sMF7763QGRtdadBsaNyuxCOBNJtWEZ9k3Nbyrf1VSfv7ejb6x+iuQH8n+22/F2+LrkukttSwtxc
	a8eeCjsCVqgOMgmp5WhAheLEWxW0TKyXpQiM71XB/rAOw0HPCwHOC1PK9mGqXZVhXlgQeuaclB2
	0if/+bRVw3/vdZrfx0G3D5+SGczWk7CaQcL8sWo+AaLQihl/Gfx40JzLXfRbPdfINZZXIaU6e10
	rvU+fiBJ0uC2WnCAUNanNIwPtyOtFZXDJFEIX4Vz5n0G1DvveYq5EzvQyg==
X-Received: by 2002:a05:600c:b86:b0:450:cd25:e68f with SMTP id 5b1f17b1804b1-452014e9325mr24877475e9.27.1749200887747;
        Fri, 06 Jun 2025 02:08:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFgCfJhv5D4WKiJLVPtf7WFxx5mFScPGVIDDWdSB4TB7uCI+iacBtSoT4d2UV7tlwIeLe0gg==
X-Received: by 2002:a05:600c:b86:b0:450:cd25:e68f with SMTP id 5b1f17b1804b1-452014e9325mr24877175e9.27.1749200887316;
        Fri, 06 Jun 2025 02:08:07 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e01:ef00:b52:2ad9:f357:f709])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452137290b9sm17000835e9.34.2025.06.06.02.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 02:08:06 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Cc: Javier Martinez Canillas <javierm@redhat.com>,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] pmdomain: arm: scmi_pm_domain: remove code clutter
Date: Fri,  6 Jun 2025 11:08:02 +0200
Message-ID: <20250606090802.597504-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

There is no need to introduce the boolean power_on to select the constant
value for state. Simply pass the value for state as argument. Just remove
this code clutter.

No functional change.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 drivers/pmdomain/arm/scmi_pm_domain.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/pmdomain/arm/scmi_pm_domain.c b/drivers/pmdomain/arm/scmi_pm_domain.c
index 2a213c218126..8fe1c0a501c9 100644
--- a/drivers/pmdomain/arm/scmi_pm_domain.c
+++ b/drivers/pmdomain/arm/scmi_pm_domain.c
@@ -22,27 +22,21 @@ struct scmi_pm_domain {
 
 #define to_scmi_pd(gpd) container_of(gpd, struct scmi_pm_domain, genpd)
 
-static int scmi_pd_power(struct generic_pm_domain *domain, bool power_on)
+static int scmi_pd_power(struct generic_pm_domain *domain, u32 state)
 {
-	u32 state;
 	struct scmi_pm_domain *pd = to_scmi_pd(domain);
 
-	if (power_on)
-		state = SCMI_POWER_STATE_GENERIC_ON;
-	else
-		state = SCMI_POWER_STATE_GENERIC_OFF;
-
 	return power_ops->state_set(pd->ph, pd->domain, state);
 }
 
 static int scmi_pd_power_on(struct generic_pm_domain *domain)
 {
-	return scmi_pd_power(domain, true);
+	return scmi_pd_power(domain, SCMI_POWER_STATE_GENERIC_ON);
 }
 
 static int scmi_pd_power_off(struct generic_pm_domain *domain)
 {
-	return scmi_pd_power(domain, false);
+	return scmi_pd_power(domain, SCMI_POWER_STATE_GENERIC_OFF);
 }
 
 static int scmi_pm_domain_probe(struct scmi_device *sdev)
-- 
2.49.0

