Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74105202C30
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 22:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745707979; cv=none; b=E3a1rVKY2/z5hj79bgvy7Jp3g1jXmGcgi22ID1GXh0tY1522psfqh2T7Ota6vvQmAtRPxgPpR87OjKg7w4m2n7pDYmuN+va+XKxa5ShkFeg8nNiuaUy+GjdhJHBagLgDdnVJjOZY7f7jPl0yvg/oOwbt2SVOVk1G6HU1HFT8H0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745707979; c=relaxed/simple;
	bh=oYplL3jPobyyiniSSfTJjwQu1XLn0TNVmd7ruWaqOYM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hVo4kcb6rDg5XSDlMKSQzDoDGsx9aNR+QHL5RgXVJBNry3QtpcupSYP6bzhtVcLl7L4LXQ22F+Isz1v1TDgPeJX4MLapVuzqra/wTJPiJDc9A41wdg6xBH0bzF/N+ljpP2zUyKe4IX7sESW4WegzRD9P8Z+HGkcPXRrPDm1y93s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p9H++tqx; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p9H++tqx"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cf848528aso25078565e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 15:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745707975; x=1746312775; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N6LtKoNqmDs4Z+HIuoUk2f/x6h6kSVKGtc+/GFYbvUk=;
        b=p9H++tqxFL9m9whM08V+6a4k4KREjO2+zZN4NlFWR8bwPTWXPrxuAj80TRyRieJxT1
         50XenNH+W+6+BIYUflT2379aU7V3t6eRwhC3cnEVjvy9CSUlpEcs9eSLFeVQhy5/uGQt
         KS5RKYu40mj1ZqA0FNnA2EVjQkNOu4N1wko/9+vgWDLkM+Foaz80MFbz1q31CFSICrfX
         Xzba7e8XAHwMnIKAWBtskl5xIGPAoTlyfEPGrAuz0Q9AqdQ2ksRiJC6SQpyiXd/p2FDq
         mNrUywlXlNydjz8/JVDlOvHrsvQOyt1VZLxFLqVzEQNWLLp5KSJZbhr84ICY/+eGGURA
         fN8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745707975; x=1746312775;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N6LtKoNqmDs4Z+HIuoUk2f/x6h6kSVKGtc+/GFYbvUk=;
        b=oD+Ttau95A2PjHsKWp+CZ4cJ5BsCoaVXLio1238mCX31Xpo8I/UPAq6+X112MVaU9S
         HIoVE6tI5aXMo3l+OIL6luR0L1ZxZ0iIw9dKMtvAPcsBq/q4zJl2UjdFxg2HdvlMMG9a
         LW7eDLxAFWaDMu9SMIJ1Dlsr9W04NKAas3Fl4av8oXk35kM5nrU2JAehffDmaqLwjs7r
         xP+GL1YwG6YATyEnr6e5Aqmp4TnJ9WaJ7cLSd3LuZ2xlCIrHo7nJyECFSWUAFc4v1Sj7
         NuIQ2ykJmSVyQVWxGEdc6IDGqwvcDD2RgwNOiXf4eIn+9hNPJkIvhjqfmDg3oxJCZBdx
         GVZA==
X-Forwarded-Encrypted: i=1; AJvYcCVDof84N3hsPI1T6Eu+tQEMo46f1P66oXObee+hGm7mONJPWLyPZIITMOP/BlkFA9lnSQCyuUV9WnhKeuU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNaK3XaxLIWIn869qxJDgOZTk5ed04ZdMS/dqEjHcXowovmr4V
	3y092ZIETnWBcjqCpc7V7/aTwfDYE26+NIOfW+U9z4Lrun/sHF+sv8zuFhb35Bg=
X-Gm-Gg: ASbGncuf+JVIeVuSBaqVcwNbcXFRC4vfYqzlTAvszCS3k9Hx7d72jZmgHdUJ5bCnNg5
	lUzhw2n0mJoYd5l0tNHvkgKGdsHwo9Z5jvykl5qLMnCC5QBaYRp7TWldknaOoSBT4A7JMtKgnEE
	3nmJNuH0k5AXZHj4jGib0uSz/cHk8LYxy/7/yXXSFyVy2mW3ygDoY47ohpblZF+FqDsPeiIC9VM
	i7O76fUyZCyXJt8dOm/GINwvNpWeeqHq3vgdYxbn0WaYJMPtdIlssdeYi6PAQRY3x065A8iNykt
	3Lfp5Ghf32iIxUzrKt7InTHJ+AptVrgYVTQGXMf4sAfEGNCdY2nuHiD9pZzbt3VBWkXJKrYBbhN
	WlvqXTg==
X-Google-Smtp-Source: AGHT+IE0j8mPv59AzBlf2kAxr5g0Q4MWOONuW8h2Cclj9zghBul8Dp1QEHNZtY7j+qJgyMhYPjBBMg==
X-Received: by 2002:a05:600c:1c0a:b0:43c:f64c:44a4 with SMTP id 5b1f17b1804b1-440a65d8130mr60064745e9.8.1745707974767;
        Sat, 26 Apr 2025 15:52:54 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a53044besm75268915e9.14.2025.04.26.15.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 15:52:53 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Sat, 26 Apr 2025 23:52:49 +0100
Subject: [PATCH v3 2/2] media: qcom: camss: x1e80100: Fixup x1e csiphy
 supply names
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250426-b4-media-committers-25-04-25-camss-supplies-v3-2-19e5e72ffc3e@linaro.org>
References: <20250426-b4-media-committers-25-04-25-camss-supplies-v3-0-19e5e72ffc3e@linaro.org>
In-Reply-To: <20250426-b4-media-committers-25-04-25-camss-supplies-v3-0-19e5e72ffc3e@linaro.org>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dmitry.baryshkov@oss.qualcomm.com, loic.poulain@oss.qualcomm.com, 
 vladimir.zapolskiy@linaro.org, krzk@kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2400;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=oYplL3jPobyyiniSSfTJjwQu1XLn0TNVmd7ruWaqOYM=;
 b=owEBbAKT/ZANAwAIASJxO7Ohjcg6AcsmYgBoDWPBOCxFSreQZrtUEjh7dLM0Rmxby3OV11Taf
 QmclmdvSWOJAjIEAAEIAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaA1jwQAKCRAicTuzoY3I
 OgVID/YhzUaLC/bBcK3virA1DszuXr2fmiAcyqRUYKir4BK4P8sJSFZT7haT8XYKSkJpZKz7I6S
 R5HqXw0tBruvAyv7TQLDmiRkluX94N8fCLBdPHHsM9MMRrMz2uWMf/p3aOL7VQM1wy5yqAEFW1v
 SZ7OgX9XVZP6CLShS34gepIuSJWDBhG67Tqz9BybhudZnLeqYLSka/8xtW44Q/myudcGKX3TZPW
 L9L2SQAA/5H2ctAICPQrNlMCrfYX1oYrQojiQ+7O5+yFSBXWHSULdNRZ5HUSofYK8u5efvp5OAb
 Wz1OLzuRh0it7x9yxL1LOZYXNUT1BD3iQroGZjQeiaebxTLDV/2semhfJEppJ0EnoGilwWHAhsV
 pBU74jZaFp8VtzrU+3QHhhMkaEecPVOh9tTjuMm59zBhqaryq8jyCrLHSAIJzSDoliWVF3CLuCD
 7ZL+4iy1VetYFFbcnriYfWfimFqmcWRfmHdKqssTPFiODHyMHN0uPFx8PHsCAmisAk1ODNJyx/q
 5hVMldX/B30yeItvWeHxCCsLwk4Wir0UzN4ZcTfeA8iUwW+dAc8lK9tcFTQwTFaAfQvwrWRvsm3
 KhpTL9h0FlQAFaeOTp6+aJQxU5MAeNs1ZF2BGk8dZW/LPNMfX1IvRum9Bc/D/UsXfx27+etP50j
 w8Rg0RQAyppUJ
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Amend the names of the csiphy supplies to be specific to each CSIPHY thus
allowing for the case where PHYs have individual or shared rails.

Dropping the extraneous "-supply" postfix is not an ABI break as there is
no upstream dependency on this.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 06f42875702f02f9d8d83d06ddaa972eacb593f8..d63bc7dc951690132e07ee0fb8df7cef9b66927d 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2486,8 +2486,8 @@ static const struct resources_icc icc_res_sm8550[] = {
 static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	/* CSIPHY0 */
 	{
-		.regulators = { "vdd-csiphy-0p8-supply",
-				"vdd-csiphy-1p2-supply" },
+		.regulators = { "vdd-csiphy0-0p8",
+				"vdd-csiphy0-1p2" },
 		.clock = { "csiphy0", "csiphy0_timer" },
 		.clock_rate = { { 300000000, 400000000, 480000000 },
 				{ 266666667, 400000000 } },
@@ -2501,8 +2501,8 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	},
 	/* CSIPHY1 */
 	{
-		.regulators = { "vdd-csiphy-0p8-supply",
-				"vdd-csiphy-1p2-supply" },
+		.regulators = { "vdd-csiphy1-0p8",
+				"vdd-csiphy1-1p2" },
 		.clock = { "csiphy1", "csiphy1_timer" },
 		.clock_rate = { { 300000000, 400000000, 480000000 },
 				{ 266666667, 400000000 } },
@@ -2516,8 +2516,8 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	},
 	/* CSIPHY2 */
 	{
-		.regulators = { "vdd-csiphy-0p8-supply",
-				"vdd-csiphy-1p2-supply" },
+		.regulators = { "vdd-csiphy2-0p8",
+				"vdd-csiphy2-1p2" },
 		.clock = { "csiphy2", "csiphy2_timer" },
 		.clock_rate = { { 300000000, 400000000, 480000000 },
 				{ 266666667, 400000000 } },
@@ -2531,8 +2531,8 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	},
 	/* CSIPHY4 */
 	{
-		.regulators = { "vdd-csiphy-0p8-supply",
-				"vdd-csiphy-1p2-supply" },
+		.regulators = { "vdd-csiphy4-0p8",
+				"vdd-csiphy4-1p2" },
 		.clock = { "csiphy4", "csiphy4_timer" },
 		.clock_rate = { { 300000000, 400000000, 480000000 },
 				{ 266666667, 400000000 } },

-- 
2.49.0

