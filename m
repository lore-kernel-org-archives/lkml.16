Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6051D88D0;
	Wed, 30 Apr 2025 06:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745995799; cv=none; b=pPiTByIKqqi1s9L7VdQJngagkppMnTET3Fm5cl7PI/ggFiE5aArB/7KkEqs0I+HfNfMzc/JjDhnDcnKpLqF8CTTjeJcZiNZTWfk8Zbo1wLA+dIA64PjmjP/BnvzJG9c988u32yh33bg0MyJ8QrgfeAT3naKxM/0RQeT8BOpUfYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745995799; c=relaxed/simple;
	bh=SFx8oWniSszRiy6B4lFwh7u9W2vYa9/kg90zKVAlyyE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kKG7MkJd/lEaXZAM3uBCQjkxmH/YxjJ3L1JLx3Xc6+j6KYo1P7UCOXFkfl3gbQ9c5AE4yjmgye1huyBayFp38qkZ19Q8chkAzOMzceJ9m96iplIB9BATh12hkueHQwjmZpujjU7qomG9vYOJjSzmM93FPv+ux8OhF6eWsD6/N+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DNZWvcks; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DNZWvcks"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e5e22e6ed2so11073350a12.3;
        Tue, 29 Apr 2025 23:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745995795; x=1746600595; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eLyyop7f0U7hn4BsyuALWvv5YSEWc2i+7mndRhg6G9g=;
        b=DNZWvcksyis6JyGlaNEmnjpc9HidvUtsCuQnqTBradLPEbzGru2MQPK4hUenH1iTli
         PnZ+DLISPsuvfWhN3Z3t904IrKgmqMvqojolo2+JelKLTxnS3lrIEEBJ6qQpP/Tr85TC
         M92zIHEuohtiZ2H4+uxMLoXySrt4fTZphOLl7Ay6SuAM7kW1yWgylp1ivg3iY43J1a2b
         W+Tent7V0crb7iuW+p+hEd3LhFkl0pqJXvfxGPaINLOeRLcJTrolzYnPaDsa/C02uy3+
         vEktNYGHTYZJPigDHFDVL8UG13KnS3kyZqExfoauLz9RkOMftq/RAoycjRZrqwcqK93i
         5a/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745995795; x=1746600595;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eLyyop7f0U7hn4BsyuALWvv5YSEWc2i+7mndRhg6G9g=;
        b=njhLEQPs4w4MKo58DK/zzU2+D3kQT387JnwTKpV4gJ1rNHA+zl/kiKRfnKhjpzpb6G
         lk+L+aJd29ilyECwy0Y19LLC4cqNtLtBB4udVb3WJFqz9Qb1xTs4+WXEClHVfAVX+nHs
         LASnAeUzO3x9LbasnATW6h8zT1DhF1X9hP1Yrzvrnrko6CRwN/S/iOAxDNnozFXj1uzt
         PNdcZGMAoea9d/7K8gWcluvTgusUsD0cx8thnMgWvixoTC1NqTuaXSBOnDgMSppovfGi
         fBY9XI80LuqK77ZqW35O3DyUOOR1vgJw2FjdPEBaao7P2QH+WfWQQoz5tUqm9o50UcUt
         WAmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQuMHq6wDa6qNIiW+uMtkpoR02RhQardmLJud0Yoz43TQcDqBdFQ8WFxrCs3kikbMnqi9m9FqZ9ONt@vger.kernel.org, AJvYcCW3y8ozyeor+qFyCtXlj0pAdsqWwtXmdqu8dpiMa0tF24J2XSDJZCKV4rLCzBYkgfDEwjZN28sKuBkZl9Mm@vger.kernel.org, AJvYcCXnX8G8GnRIgws2vBG4sxfAZK1FcEmjpFI37ukE+XjUbkcaYv+C4ySGIFgFhwsll/GTB3r/rgYZ/tGC@vger.kernel.org
X-Gm-Message-State: AOJu0YxPGV7pHhUpG37rFzbvuEqflwiUCxc2BCn5FJ4Gk4uGNJWMAZRH
	bq2w0J+nL+xBtEdfTuA2goHRgOqFkoC9dDFHlyEjWuIJAb427C4v
X-Gm-Gg: ASbGncsq+8Ri0IzdYBAb02dyTaLstF44twH1y2i5riXG5CLRZKi9qeupaLyTa5ePG3d
	D5OWytA5EZFPKiEEmYznIqoXPTaW+1Pmenny1ln1TJirg/wDugln3e2SZlenpzaTdqBu1Fj5vVe
	9hPTjaFSXBS4VEVwADRysAtGXV7iTjq/RL+n3KF4wrCuCDl1mf/w2dVPRAEkfP+KdINRSSgjcP+
	5RMHsU5wlqRfPyQURpUwXPdTe9lofNEtw+U1fvBbbHDle3mB4G/AbAEAvjsCnpaHqIP0q5tsEKS
	TMQcF30u6smbAP/Wm3ZAQHGPGcY1YkpHp2DZ+4RheFjIHM51XVTE4uyVT1GaQPaGgS7slB+Q5bk
	TmNPEnU6+OAufssOC0jpmnA==
X-Google-Smtp-Source: AGHT+IERZu5lLwaJ8G/RworpvgWLgc0NfzC2HosrmU8gQCpqmgbsmF1ky9L1zZ4dXr5nGqJ4ci+ZZQ==
X-Received: by 2002:a17:907:980d:b0:ace:7be1:1434 with SMTP id a640c23a62f3a-acedc6291bbmr192289866b.30.1745995795385;
        Tue, 29 Apr 2025 23:49:55 -0700 (PDT)
Received: from hex.my.domain (83.8.121.197.ipv4.supernova.orange.pl. [83.8.121.197])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e5087e4sm881222866b.73.2025.04.29.23.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 23:49:55 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Wed, 30 Apr 2025 08:49:48 +0200
Subject: [PATCH v5 1/8] clk: bcm: kona: Move CLOCK_COUNT defines into the
 driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-kona-bus-clock-v5-1-46766b28b93a@gmail.com>
References: <20250430-kona-bus-clock-v5-0-46766b28b93a@gmail.com>
In-Reply-To: <20250430-kona-bus-clock-v5-0-46766b28b93a@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Alex Elder <elder@kernel.org>, 
 Stanislav Jakubek <stano.jakubek@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745995792; l=6691;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=SFx8oWniSszRiy6B4lFwh7u9W2vYa9/kg90zKVAlyyE=;
 b=yVMDp+d5DvbohDCC0w3m/BapP+Vi8UY3fHYJ2J1/eJga2Tk8BMFOTFS3u6FAK8p5MTgUC8tM5
 QA4fcH+TeFgDpEByO3miqFhUI/91+b7WD1W7YZaUFBlsiP7YyQJyGwd
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=

CLOCK_COUNT defines for each CCU are stored in the DT binding header.
This is not correct - they are not used by device trees, only internally
by the driver.

Move the CLOCK_COUNT defines directly into the driver in preparation
for dropping them from the DT binding include. To avoid conflicts with
the old defines, rename them to use the CLK_COUNT suffix.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v4:
- Rename CLOCK_COUNT to CLK_COUNT to avoid redefinition

Changes in v3:
- Add this commit
---
 drivers/clk/bcm/clk-bcm21664.c | 16 ++++++++++++----
 drivers/clk/bcm/clk-bcm281xx.c | 20 +++++++++++++++-----
 drivers/clk/bcm/clk-kona.h     |  2 +-
 3 files changed, 28 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/bcm/clk-bcm21664.c b/drivers/clk/bcm/clk-bcm21664.c
index 520c3aeb4ea9c4a431512c0909f9545c1761d17a..14b7db824704824b4a6bfcce79308afa44e092c6 100644
--- a/drivers/clk/bcm/clk-bcm21664.c
+++ b/drivers/clk/bcm/clk-bcm21664.c
@@ -17,13 +17,15 @@ static struct peri_clk_data frac_1m_data = {
 	.clocks		= CLOCKS("ref_crystal"),
 };
 
+#define BCM21664_ROOT_CCU_CLK_COUNT	(BCM21664_ROOT_CCU_FRAC_1M + 1)
+
 static struct ccu_data root_ccu_data = {
 	BCM21664_CCU_COMMON(root, ROOT),
 	/* no policy control */
 	.kona_clks	= {
 		[BCM21664_ROOT_CCU_FRAC_1M] =
 			KONA_CLK(root, frac_1m, peri),
-		[BCM21664_ROOT_CCU_CLOCK_COUNT] = LAST_KONA_CLK,
+		[BCM21664_ROOT_CCU_CLK_COUNT] = LAST_KONA_CLK,
 	},
 };
 
@@ -39,6 +41,8 @@ static struct peri_clk_data hub_timer_data = {
 	.trig		= TRIGGER(0x0a40, 4),
 };
 
+#define BCM21664_AON_CCU_CLK_COUNT	(BCM21664_AON_CCU_HUB_TIMER + 1)
+
 static struct ccu_data aon_ccu_data = {
 	BCM21664_CCU_COMMON(aon, AON),
 	.policy		= {
@@ -48,7 +52,7 @@ static struct ccu_data aon_ccu_data = {
 	.kona_clks	= {
 		[BCM21664_AON_CCU_HUB_TIMER] =
 			KONA_CLK(aon, hub_timer, peri),
-		[BCM21664_AON_CCU_CLOCK_COUNT] = LAST_KONA_CLK,
+		[BCM21664_AON_CCU_CLK_COUNT] = LAST_KONA_CLK,
 	},
 };
 
@@ -122,6 +126,8 @@ static struct peri_clk_data sdio4_sleep_data = {
 	.gate		= HW_SW_GATE(0x0360, 18, 2, 3),
 };
 
+#define BCM21664_MASTER_CCU_CLK_COUNT	(BCM21664_MASTER_CCU_SDIO4_SLEEP + 1)
+
 static struct ccu_data master_ccu_data = {
 	BCM21664_CCU_COMMON(master, MASTER),
 	.policy		= {
@@ -145,7 +151,7 @@ static struct ccu_data master_ccu_data = {
 			KONA_CLK(master, sdio3_sleep, peri),
 		[BCM21664_MASTER_CCU_SDIO4_SLEEP] =
 			KONA_CLK(master, sdio4_sleep, peri),
-		[BCM21664_MASTER_CCU_CLOCK_COUNT] = LAST_KONA_CLK,
+		[BCM21664_MASTER_CCU_CLK_COUNT] = LAST_KONA_CLK,
 	},
 };
 
@@ -225,6 +231,8 @@ static struct peri_clk_data bsc4_data = {
 	.trig		= TRIGGER(0x0afc, 19),
 };
 
+#define BCM21664_SLAVE_CCU_CLK_COUNT	(BCM21664_SLAVE_CCU_BSC4 + 1)
+
 static struct ccu_data slave_ccu_data = {
 	BCM21664_CCU_COMMON(slave, SLAVE),
        .policy		= {
@@ -246,7 +254,7 @@ static struct ccu_data slave_ccu_data = {
 			KONA_CLK(slave, bsc3, peri),
 		[BCM21664_SLAVE_CCU_BSC4] =
 			KONA_CLK(slave, bsc4, peri),
-		[BCM21664_SLAVE_CCU_CLOCK_COUNT] = LAST_KONA_CLK,
+		[BCM21664_SLAVE_CCU_CLK_COUNT] = LAST_KONA_CLK,
 	},
 };
 
diff --git a/drivers/clk/bcm/clk-bcm281xx.c b/drivers/clk/bcm/clk-bcm281xx.c
index 823d5dfa31b84f502fcd6ada1eff6d8f4673b3dd..62c3bf4656259261ae4f7d81dae48c90ab26c04e 100644
--- a/drivers/clk/bcm/clk-bcm281xx.c
+++ b/drivers/clk/bcm/clk-bcm281xx.c
@@ -19,12 +19,14 @@ static struct peri_clk_data frac_1m_data = {
 	.clocks		= CLOCKS("ref_crystal"),
 };
 
+#define BCM281XX_ROOT_CCU_CLK_COUNT	(BCM281XX_ROOT_CCU_FRAC_1M + 1)
+
 static struct ccu_data root_ccu_data = {
 	BCM281XX_CCU_COMMON(root, ROOT),
 	.kona_clks	= {
 		[BCM281XX_ROOT_CCU_FRAC_1M] =
 			KONA_CLK(root, frac_1m, peri),
-		[BCM281XX_ROOT_CCU_CLOCK_COUNT] = LAST_KONA_CLK,
+		[BCM281XX_ROOT_CCU_CLK_COUNT] = LAST_KONA_CLK,
 	},
 };
 
@@ -57,6 +59,8 @@ static struct peri_clk_data pmu_bsc_var_data = {
 	.trig		= TRIGGER(0x0a40, 2),
 };
 
+#define BCM281XX_AON_CCU_CLK_COUNT	(BCM281XX_AON_CCU_PMU_BSC_VAR + 1)
+
 static struct ccu_data aon_ccu_data = {
 	BCM281XX_CCU_COMMON(aon, AON),
 	.kona_clks	= {
@@ -66,7 +70,7 @@ static struct ccu_data aon_ccu_data = {
 			KONA_CLK(aon, pmu_bsc, peri),
 		[BCM281XX_AON_CCU_PMU_BSC_VAR] =
 			KONA_CLK(aon, pmu_bsc_var, peri),
-		[BCM281XX_AON_CCU_CLOCK_COUNT] = LAST_KONA_CLK,
+		[BCM281XX_AON_CCU_CLK_COUNT] = LAST_KONA_CLK,
 	},
 };
 
@@ -80,12 +84,14 @@ static struct peri_clk_data tmon_1m_data = {
 	.trig		= TRIGGER(0x0e84, 1),
 };
 
+#define BCM281XX_HUB_CCU_CLK_COUNT	(BCM281XX_HUB_CCU_TMON_1M + 1)
+
 static struct ccu_data hub_ccu_data = {
 	BCM281XX_CCU_COMMON(hub, HUB),
 	.kona_clks	= {
 		[BCM281XX_HUB_CCU_TMON_1M] =
 			KONA_CLK(hub, tmon_1m, peri),
-		[BCM281XX_HUB_CCU_CLOCK_COUNT] = LAST_KONA_CLK,
+		[BCM281XX_HUB_CCU_CLK_COUNT] = LAST_KONA_CLK,
 	},
 };
 
@@ -172,6 +178,8 @@ static struct peri_clk_data hsic2_12m_data = {
 	.trig		= TRIGGER(0x0afc, 5),
 };
 
+#define BCM281XX_MASTER_CCU_CLK_COUNT	(BCM281XX_MASTER_CCU_HSIC2_12M + 1)
+
 static struct ccu_data master_ccu_data = {
 	BCM281XX_CCU_COMMON(master, MASTER),
 	.kona_clks	= {
@@ -189,7 +197,7 @@ static struct ccu_data master_ccu_data = {
 			KONA_CLK(master, hsic2_48m, peri),
 		[BCM281XX_MASTER_CCU_HSIC2_12M] =
 			KONA_CLK(master, hsic2_12m, peri),
-		[BCM281XX_MASTER_CCU_CLOCK_COUNT] = LAST_KONA_CLK,
+		[BCM281XX_MASTER_CCU_CLK_COUNT] = LAST_KONA_CLK,
 	},
 };
 
@@ -301,6 +309,8 @@ static struct peri_clk_data pwm_data = {
 	.trig		= TRIGGER(0x0afc, 15),
 };
 
+#define BCM281XX_SLAVE_CCU_CLK_COUNT	(BCM281XX_SLAVE_CCU_PWM + 1)
+
 static struct ccu_data slave_ccu_data = {
 	BCM281XX_CCU_COMMON(slave, SLAVE),
 	.kona_clks	= {
@@ -324,7 +334,7 @@ static struct ccu_data slave_ccu_data = {
 			KONA_CLK(slave, bsc3, peri),
 		[BCM281XX_SLAVE_CCU_PWM] =
 			KONA_CLK(slave, pwm, peri),
-		[BCM281XX_SLAVE_CCU_CLOCK_COUNT] = LAST_KONA_CLK,
+		[BCM281XX_SLAVE_CCU_CLK_COUNT] = LAST_KONA_CLK,
 	},
 };
 
diff --git a/drivers/clk/bcm/clk-kona.h b/drivers/clk/bcm/clk-kona.h
index e09655024ac2ad42538b924f304b23e87b7db2ce..59dee015a07d749f8ac2a3b4dcfe38d7b92bd0f6 100644
--- a/drivers/clk/bcm/clk-kona.h
+++ b/drivers/clk/bcm/clk-kona.h
@@ -483,7 +483,7 @@ struct ccu_data {
 #define KONA_CCU_COMMON(_prefix, _name, _ccuname)			    \
 	.name		= #_name "_ccu",				    \
 	.lock		= __SPIN_LOCK_UNLOCKED(_name ## _ccu_data.lock),    \
-	.clk_num	= _prefix ## _ ## _ccuname ## _CCU_CLOCK_COUNT
+	.clk_num	= _prefix ## _ ## _ccuname ## _CCU_CLK_COUNT
 
 /* Exported globals */
 

-- 
2.49.0

