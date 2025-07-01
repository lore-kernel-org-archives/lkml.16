Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EB8279346
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 11:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751370500; cv=none; b=JEgoSsUfoYGIjt0lZSprbcEe2r02V6ZwNqL+yJgsa783IeCKNfOOHN/TJ/pq9uhZZl1Mxjch50Brpml7/4y938tKvn+2QSNQA4tPfbTUlmcmZX13L6Ha4pq2meixgceIAiacod6LoFzvNi7JDQyJ9u96L+jYdXTZkDTdRSXD6mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751370500; c=relaxed/simple;
	bh=NSYtvyZVf2UzhXwMZ5opV17BEbqx9XvRIjGk3BgINR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T9L+MRnmqZlYuwR3Fb8E3BToRz8+oGTEEtqMm2voYS+gzfAUNdNOhmE4hxEmnNuDcvyB/gh7DlKKcdIoUpWQhRdRmCrdDRNTzDALdufc1yU3vBwHKVke+IXpsdTaPzdyUbW9UUeUNXa015SSmrtnU1sMthRsYunnIvwamEV6rPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kMC0AVPl; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kMC0AVPl"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-32cdc9544ceso27155501fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 04:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751370496; x=1751975296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xubz5AMnVL9fFI2MEMsk3gmMyUmqJIv+eASrf2W14mE=;
        b=kMC0AVPlGx96EsR/V1y8Dk+D8ZPSOSEO0DQL3Lxvx9H7PJJZyXaIGl8pe5ZN0DetJS
         9dmRavX8eAm9qGxndnI/wjIyUvb/MQDC4b6pKTfLQOUjYO+EfsdgL5uIxlSo6IsJpwtx
         4h6h5YO/LkB6xrhCISnOhTbbXgyroiihblNrpSwUyXNNGXLSb+JRFEhyUYJNwW+2PrH4
         OEkYl0nbUVUcA6gq2tV5LceUf0VGkPv4m2Qi22QVmSV5C9XtOaIGJdYNosDcJ4TA0vRe
         ba6ifGpAXjjLCjMMwFPsCkm76zRdLR0MbXyj+5zEgg4tK6EkgNKO5ywp2yPftudN7ReX
         hlDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370496; x=1751975296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xubz5AMnVL9fFI2MEMsk3gmMyUmqJIv+eASrf2W14mE=;
        b=WXtQAbT0n/IhqW3LWyL8E0MyIVAgY+K5FzIGix8VdcTFkaYk17ELLk8NpnUCXAr8RJ
         CTi7flbszyJDZYRDxIlvJW7Hb+flCgf7o4YkoGWpBdwkoPVKR0Ao3a+npL8Q5vVTSAni
         giMIypU5FZ6RaTm6bhlKTMyn7uPsLCsIkyQ67h+EwOPgtRi+56Ddfc7XLOBcRUuBXgKw
         maSBUr605zRO6rW3CXzGUz/50sBMBoFJCDbNTFiWW2CU5B5B6ZOqSa2LCQUB8bNA3brn
         aHO4k/IbwFFRI2ZSUfL3mHnY6mCvJqtpkXLLzN7IrKS6KeXOKvjjUmNJTKCrxQ0BiqPw
         IjDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJAJ4Y9NtW5VIGjwNFxpSP5AidGCs2ChPw6s+BV3YnJ9z5l54RUo0CrZ2JUvvRa2mNfj7/EOHYRTqTNNI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgIBq4fxqngjFbKEHljIHCKfXXJMW05JmLbZqoTGHxXwqQgDmS
	v4xkR0rw/LJd/PXYP3h4oIsxks/uMwUuxVJg+LdVCPdqk8ojJGowyNZD7QL86xyPWA+scRq3R2y
	+uLdG
X-Gm-Gg: ASbGncvsM6GxBE/vCDSlaTODYG+9kFvAgy0KnpdVAYtDh0cKS0F0qdCrx6eKqMw20LA
	2hirDupZy0pdS7fUlcPc96B+qj04hSH1VyqwuUFlrtHWBYPfRg/4VJOdd0h3jRujVozMe6ESE9C
	eHnTtysGMCNglhg74lIKC+SLMeZeofnNiMysZmEttPR9efufU3czw0GPEOqoya7rlFV/70CU1t1
	kY08wT1wwh4KVUgRZ90sZntY2/xG9oVtVipH7HhbQu2jKLDSktZR7J6EdO20+4abr3HEDnErHU6
	joSrVHwN6VumM6lGhhjDLvTRGFQ/PKNs03e9qK5VZqKbgINt6uXlgD/BVdRuy2c0C6jbJ3fPCcS
	aXdKchQt3zGmQ/N62c5Z/QyWRRJAS0iSbsDMbe88vtW5Bfvw=
X-Google-Smtp-Source: AGHT+IFbAm4sSy6xwNDq/uawFwMXkVuPJBi7CK4J/iQSlQCYGGILLP1j4D4YF3zjMC9RJVOr0YdTnw==
X-Received: by 2002:a05:6512:3083:b0:553:ad3f:1597 with SMTP id 2adb3069b0e04-5550ba1de10mr4896071e87.53.1751370495665;
        Tue, 01 Jul 2025 04:48:15 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2f162dsm1800592e87.248.2025.07.01.04.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:48:15 -0700 (PDT)
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
Subject: [PATCH v3 23/24] cpuidle: psci: Drop redundant sync_state support
Date: Tue,  1 Jul 2025 13:47:25 +0200
Message-ID: <20250701114733.636510-24-ulf.hansson@linaro.org>
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

The recent updates to the genpd core, can entirely manage the sync_state
support for the cpuidle-psci-domain. More precisely, genpd prevents our
->power_off() callback from being invoked, until all of our consumers are
ready for it.

Let's therefore drop the sync_state support for the cpuidle-psci-domain as
it has become redundant.

Tested-by: Hiago De Franco <hiago.franco@toradex.com> # Colibri iMX8X
Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> # TI AM62A,Xilinx ZynqMP ZCU106
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/cpuidle/cpuidle-psci-domain.c | 22 +---------------------
 1 file changed, 1 insertion(+), 21 deletions(-)

diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpuidle-psci-domain.c
index b880ce2df8b5..37c41209eaf9 100644
--- a/drivers/cpuidle/cpuidle-psci-domain.c
+++ b/drivers/cpuidle/cpuidle-psci-domain.c
@@ -28,7 +28,6 @@ struct psci_pd_provider {
 };
 
 static LIST_HEAD(psci_pd_providers);
-static bool psci_pd_allow_domain_state;
 
 static int psci_pd_power_off(struct generic_pm_domain *pd)
 {
@@ -38,9 +37,6 @@ static int psci_pd_power_off(struct generic_pm_domain *pd)
 	if (!state->data)
 		return 0;
 
-	if (!psci_pd_allow_domain_state)
-		return -EBUSY;
-
 	/* OSI mode is enabled, set the corresponding domain state. */
 	pd_state = state->data;
 	psci_set_domain_state(pd, pd->state_idx, *pd_state);
@@ -63,8 +59,7 @@ static int psci_pd_init(struct device_node *np, bool use_osi)
 	if (!pd_provider)
 		goto free_pd;
 
-	pd->flags |= GENPD_FLAG_IRQ_SAFE | GENPD_FLAG_CPU_DOMAIN |
-		     GENPD_FLAG_NO_SYNC_STATE;
+	pd->flags |= GENPD_FLAG_IRQ_SAFE | GENPD_FLAG_CPU_DOMAIN;
 
 	/*
 	 * Allow power off when OSI has been successfully enabled.
@@ -127,20 +122,6 @@ static void psci_pd_remove(void)
 	}
 }
 
-static void psci_cpuidle_domain_sync_state(struct device *dev)
-{
-	struct psci_pd_provider *pd_provider;
-
-	/*
-	 * All devices have now been attached/probed to the PM domain topology,
-	 * hence it's fine to allow domain states to be picked.
-	 */
-	psci_pd_allow_domain_state = true;
-
-	list_for_each_entry(pd_provider, &psci_pd_providers, link)
-		of_genpd_sync_state(pd_provider->node);
-}
-
 static const struct of_device_id psci_of_match[] = {
 	{ .compatible = "arm,psci-1.0" },
 	{}
@@ -201,7 +182,6 @@ static struct platform_driver psci_cpuidle_domain_driver = {
 	.driver = {
 		.name = "psci-cpuidle-domain",
 		.of_match_table = psci_of_match,
-		.sync_state = psci_cpuidle_domain_sync_state,
 	},
 };
 
-- 
2.43.0

