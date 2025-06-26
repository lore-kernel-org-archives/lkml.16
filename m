Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC6F13C8FF
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 01:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750901079; cv=none; b=O7IPRrCrGH5UnNKEidxlftgnNeQiB8U0i89CfLCUnRBjuniMsx4T9xa/OEcSKq/rMiVJe/uND1H43IQyN7G7ST/JsRYIcrLGukBnJdanSCAZoTgbOFOH2Twc7EgWpG/Rn+3+q+JrwSpYcny9GUbBJvYxhgLszIaxsblxjRXjUZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750901079; c=relaxed/simple;
	bh=UmGP/l8Um9+2msGQYm5eaI/Itrhs9wb11QD4Edoc5NM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uIG1yzVLPGG7yGtElpW2RpFNFItOrX9+Eu/EDf8tarqADwdfncWLPvcwziafOTAHohlyJJrdaxCsQFdtUgDt14eU7Qlbn7JXcjyjPrxwLU1CcGns14+cpiYERgPpC95jFnEzPd+dKRtjFVR3bx8E5W2A/ks6T9xEdQkQnccdR2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=op0oT2Sr; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="op0oT2Sr"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a52874d593so334852f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750901075; x=1751505875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y4u/eN2D/tx7Xb+N1lY9SuoxpnS9Tkv8LbiwG/EEyYE=;
        b=op0oT2SrJC7PsgepruUXwmrG/iwdAliv7Iqu6EGXmkPPZ2YCmRExAgm3jpYe85C1Gp
         kfE4erZ154J+0PYmvAZ7vYimtWVotL/ndCxkZD6zr8G79rpmzOZ7/0BFJt/ODRGm2vGF
         ZKEjfHtC77y7GyFNXpoysx54sSaHSYfR9HtYIQK5ygbCMM/ZrouUU+4Swg9RWqkfve2J
         r1gHjXyEZUudDz7Inw1oygKMkYrw55z1/swkKAvtaJ+7rJ3HIV4CXrdqhmNj4G/RGE61
         TAn27LUsG7soY6fbR84zXfo2KpG5MwDQUGq9ZwrRhkCHL+7jJGrSLBAmOG6wJX1ns2FE
         1rog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750901075; x=1751505875;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y4u/eN2D/tx7Xb+N1lY9SuoxpnS9Tkv8LbiwG/EEyYE=;
        b=LZV6EtS2GZk/JSJJ7OKOljcyzgVlJuqVArx58alTfuY14oOkGpG9OBj4coZLD6Vr3U
         NI0BbJpMWt/QUilfiaH57uxfZ7N2OLc8YMJsew5za3jkxGiYbsLuzmDO89pISHSVLG9L
         B91D9+WtrLf1FYen/Lvms0spwAuez+D7TowgKPv4PYKJZEizpOl8te8HocJL6uhiUZzg
         stVm3VaSWohHjaCd9rWm4wJwT2qTOhNtas+D5LgylbH/LKT+ssaEqpJYrd/R6wAbbkdq
         lZpBKGOwqZHvE8KoZ0kFDdzTA4QuQJVlzwQKsF2Pj60odeS2QDBmw46kfxWc8E+XHA/j
         4etw==
X-Forwarded-Encrypted: i=1; AJvYcCWOeHWd5FVb7mwYmxGZ4SkurSbQKnXxHm7+l51WejNjYEpn2Lf3ShuE7FAn8GkyRFFlmU0pR3A4pnr6IV0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2vmiyTesHIRY0xt+uTtzdgkm8TQjYH5tvmsEh9K/z/1PB90Yk
	bWLvtrf26RMriWigLk3NT/H2KPJ70MLujnyr4yiLQlIt+KVYKvJ/ue6OQzvkqQtA9JE=
X-Gm-Gg: ASbGncuZzwpkR1ft5HFe1kqoA3PMudV/JdzjDjyNp+iMGF+59TKZx95/PfGuVCbfcg9
	ulmgCGh5OUhEcycUZoimdKtmb4qeiKtUMAPcVtqbCEpGtdQVfMvZDGEUh0X9ZIHfZuyIvgYyPgz
	52H9/SPthP80AB4zK775QX2VlIZ3LjQMlmz7KF6wF1BVRvpbb5umzKOx1GPVCc5s6aidErpZr6B
	aFC+TUSDnKoy1gTrSFuLLssgTRyGHV4deVuQDZAVcuKKQJWrzVCOOnKHmWWjOp+vm/sFUnZ2jpI
	yf3exmfLCo/G3Xp/O+XAk1XS1iEfzk9WzVUB9CoRE2GWNW0deZrd+uE4OLg4dZiXYWKyCwIk/+p
	SKrpJNr7J/9tjSYUE76vnxrWDXVFKeYZU/gFo
X-Google-Smtp-Source: AGHT+IFrQbW0/zunPIUA7/e1au7dH4zXrdfTYnz/u0Sj+eVsjA42PkiE7HAee9HE7uLpQZSciOFkxA==
X-Received: by 2002:a05:6000:4007:b0:3a5:2599:4178 with SMTP id ffacd0b85a97d-3a6ed5db0b5mr3770688f8f.19.1750901074792;
        Wed, 25 Jun 2025 18:24:34 -0700 (PDT)
Received: from sagittarius-a.ht.home (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823ad01csm34695025e9.22.2025.06.25.18.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 18:24:34 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: bryan.odonoghue@linaro.org
Cc: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vladimir.zapolskiy@linaro.org
Subject: [PATCH] media: qcom: camss: Remove extraneous -supply postfix on supply names
Date: Thu, 26 Jun 2025 02:24:33 +0100
Message-ID: <20250626012433.261328-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The -supply postfix is wrong but wasn't noticed on the CRD devices or
indeed the Dell devices, however on Lenovo devices the error comes up.

Fixes: 1830cf0f56c3 ("media: qcom: camss: Add x1e80100 specific support")
Cc: stable@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 06f42875702f0..ce79cd8d32787 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2486,8 +2486,8 @@ static const struct resources_icc icc_res_sm8550[] = {
 static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	/* CSIPHY0 */
 	{
-		.regulators = { "vdd-csiphy-0p8-supply",
-				"vdd-csiphy-1p2-supply" },
+		.regulators = { "vdd-csiphy-0p8",
+				"vdd-csiphy-1p2" },
 		.clock = { "csiphy0", "csiphy0_timer" },
 		.clock_rate = { { 300000000, 400000000, 480000000 },
 				{ 266666667, 400000000 } },
@@ -2501,8 +2501,8 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	},
 	/* CSIPHY1 */
 	{
-		.regulators = { "vdd-csiphy-0p8-supply",
-				"vdd-csiphy-1p2-supply" },
+		.regulators = { "vdd-csiphy-0p8",
+				"vdd-csiphy-1p2" },
 		.clock = { "csiphy1", "csiphy1_timer" },
 		.clock_rate = { { 300000000, 400000000, 480000000 },
 				{ 266666667, 400000000 } },
@@ -2516,8 +2516,8 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	},
 	/* CSIPHY2 */
 	{
-		.regulators = { "vdd-csiphy-0p8-supply",
-				"vdd-csiphy-1p2-supply" },
+		.regulators = { "vdd-csiphy-0p8",
+				"vdd-csiphy-1p2" },
 		.clock = { "csiphy2", "csiphy2_timer" },
 		.clock_rate = { { 300000000, 400000000, 480000000 },
 				{ 266666667, 400000000 } },
@@ -2531,8 +2531,8 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	},
 	/* CSIPHY4 */
 	{
-		.regulators = { "vdd-csiphy-0p8-supply",
-				"vdd-csiphy-1p2-supply" },
+		.regulators = { "vdd-csiphy-0p8",
+				"vdd-csiphy-1p2" },
 		.clock = { "csiphy4", "csiphy4_timer" },
 		.clock_rate = { { 300000000, 400000000, 480000000 },
 				{ 266666667, 400000000 } },
-- 
2.49.0

