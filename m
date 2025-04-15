Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C158E1F4C82
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 14:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744725836; cv=none; b=RQlFu67/V5B30f2AcWcn7p4mLqhthLjLpXc6ulXtUAfn+EcweHspVkkBNQzUVl1hE61XlKPawwIagqRO6A8u82ZYFBWTfaSTzkcTqdiQRM8fyM0p0gBU6i3dXCjgr/cTIznun15iv0mB9V5JRBerXxDvKrz/Xuhc7QmXIPoUdYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744725836; c=relaxed/simple;
	bh=ZUMaY3dlz9lDIRgs1PBOQEps4QcSaiaHIY+Pz/GU5Oc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XjQNmJue9xCWkGWIq2Fh1Ww9rNNzkTiP7FIqsdXdsTsc5AdfHcx77KLv9Kktk/hbPDXkITQV9XD/vvseIDwo+zzB64RMrtafvLAfmYj2vJVAzMzI1HMk8YXF7ra/Wd+bcb3TNybNRQize9vm7prlfXAyNFD1CJoBXMAFBjj7tQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VPYVucay; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VPYVucay"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43d04ea9d9aso28379785e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 07:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744725832; x=1745330632; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=POkWqpZmZzT/QyzZw7C/DVyyTQMZgcCqqfwdkFJOiZE=;
        b=VPYVucay1jJ6ioNH5hpr0hDr8oswMY2JUU7fMW80VlOVCly4EhJPdq26RvDjrMoOcU
         MFV5GLArMkNW3JGx9F04xutxn/pwxAFX4xywmKvtKUXa9EOJtZy62UUqGKlUNd5IMBOv
         q0aZZy6069jXV750Gkl8m3KShCKHktM5o13K9XwKzsu0P/ebnN78kzfUAaGQlMLIpmym
         VYyTemKItqdXDCDigkzJ7OHS5L+fUOdxGEtVTumA1qq/pIbqI0Df/Wh2PNzKG2+ffxQu
         yfLsiM7kV1JENxcEtxUigdN2GkrTs6N/E9kI1vK40nm9DtSASoxbDW2T/jUFbDYHILcd
         Y9yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744725832; x=1745330632;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=POkWqpZmZzT/QyzZw7C/DVyyTQMZgcCqqfwdkFJOiZE=;
        b=hAN69RfflBJ2mTAtGxcN3N4xctuOyvinMkknhg4zujEJ+NHM4CilBHggEIdp6z4Jej
         OoKoZZNw9xtYsf7TsfBfdkuS+4VhtJDc+ONa9bXFIRmv7uhhMETNzrB9w8empGyxLscv
         Ft8x3tGu06kaP+Gik8wzEUvN7MasMAy6pItmIVAZEyfY+KnX6XwMoRpye9kuDoAI04hv
         zns33lkoM/g86O4kTxx0yshIjTo3FjxHSs2WVAI1hAzPdMXfGWyTPyFfOr0mOnbfJtU3
         zZn95jDRur/QUIq8yPHgRQn9kC5BPOwaX6rmwMSMbjwzXkfkw6SpVvkEIi9R7PL9rg+r
         UFug==
X-Forwarded-Encrypted: i=1; AJvYcCVGTRzyKYurDycKMdlU661AisnizeAQHaObxozp7XWM9kzj7sot5GKuzpYpXHVG79RrsN+CB4hZRE6y1LY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkzDwJ4jDzFfeX/fwj+bg3O+4GaQZ3wkxGQdLIWD4U8Ap3SFtl
	a2zgNczBDV3GG/yiyD1F0/NGhq4JHJHY+462Vhs1ICkuPNCuzeYyZW40xTCdTH8=
X-Gm-Gg: ASbGncuPuWm1LhyjGldMpX6foNllhhTAr5MdyfTgiTMx3MkeMmCtob9CLSUN1kzaI/f
	e20GRVGoc4qPVW/Rc5He97lYLBWw8ADLch0QlFFI7UwW0fkyTTTfy7yRJacKI+nDP8+W3a30tWS
	+UKyhMNRZcQuLzVAxbDeawO4MShu6Er+7WFUBC183ssMDQ4cwr60mhFLrMOHjhX0B1d3jBXa8c6
	9RPCvfZfaySbh9lFmyHa5VpMnVlBqUEVfPrCcrbZDCNBqXvSi0N6gw7hBQnCWqHsGhcyH7smVVe
	i1qPh793/eLb9QPSw1MLPXWExaDO+bwYxtRKnOQrtOmt7CuumM8WU+q40PBykzD8nHEtpusu
X-Google-Smtp-Source: AGHT+IEqLgllgG6L0zPJ7hSdFTSoB8uDVAxU+CD5pH/V4v0HUxYGptOrn1f0jN+ptjhwnNLqYFMRZA==
X-Received: by 2002:a05:600c:1e14:b0:43d:ea:51d2 with SMTP id 5b1f17b1804b1-43f3a93f681mr147738345e9.14.1744725831864;
        Tue, 15 Apr 2025 07:03:51 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f206332d9sm210480765e9.13.2025.04.15.07.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 07:03:51 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 15 Apr 2025 16:03:48 +0200
Subject: [PATCH 2/2] interconnect: qcom: sm8650: add the MASTER_APSS_NOC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-topic-sm8650-upstream-icc-apss-noc-v1-2-9e6bea3943d8@linaro.org>
References: <20250415-topic-sm8650-upstream-icc-apss-noc-v1-0-9e6bea3943d8@linaro.org>
In-Reply-To: <20250415-topic-sm8650-upstream-icc-apss-noc-v1-0-9e6bea3943d8@linaro.org>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2017;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=ZUMaY3dlz9lDIRgs1PBOQEps4QcSaiaHIY+Pz/GU5Oc=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBn/mdE4Ap38CwY6Hel8BSUGMRamHbsk/PQ7JDXaAmG
 MPyP3WiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ/5nRAAKCRB33NvayMhJ0f+BD/
 9pVMjvFr+TK+TSCw+AfaNe4Vit91MGZ/8ynFDqqy5oRpeH8WCVJ0M3+nHKtxSps0SAoP+g3McHlbD0
 NGlpDQdJHYFQa6H1ljv9OOZs7CuvVF3jHNF67bmcYFg4dIBlazG/82j7QY9XipEXTXdqEtgQIbHvKy
 GjcQC5oGWnZW0tBOVmlHc7DSLugsqU5fnUug7ZoDJHQGxEkqkrb29jcyVyrRUzezS83Cv0V/vGuA7Y
 Fu7v8HgaZegRoYjzePNftu5/3IG2fDu7ZNwsYepS6pKJ7/JDZmSF6e1d7IyMkeGr05JE5ebsEWRtjn
 FDsgTpQ2ugYjH/xG4Djw/MylMm0hZLTXqZ3rFEDTrvt60IMPjywPMk9s51e456fXWEOUrT15WzFjP4
 gJeTJnGcR/ZmQyEjLvlX0xN7Rc7rC7susuhfuvk5UrMx1mk9JKchb9p/AJslsyARNVczaVoOJxBW8l
 m/tQzQzqe2ID+YsZZByvDOSA8b/BDPtM1rA4zS2WtMxyk9NsYs2EISnsHM+XLdh1gM+6EZWjeEZMtw
 tEYxSRO7Blc8CnTUXugnQjK5cD1tEBtnlMCqbh/WT/qyS/2Af2pd/0dmMzr5Eq7FWvW9LfICwAuKqw
 xp7qLVmGM5uohySkBAVkMHDX1KAPHkDXYVluBWsGVKnVs++BAQT1zFMybSlg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the MASTER_APSS_NOC interconnect node of the system NoC
and the associated QoS configuration.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/interconnect/qcom/sm8650.c | 19 +++++++++++++++++++
 drivers/interconnect/qcom/sm8650.h |  1 +
 2 files changed, 20 insertions(+)

diff --git a/drivers/interconnect/qcom/sm8650.c b/drivers/interconnect/qcom/sm8650.c
index f6911891503a7ed65be8bc37ed600e87d4cfcc42..1eb2cc3bea672a01f88bfcf24fd82395a07ea36f 100644
--- a/drivers/interconnect/qcom/sm8650.c
+++ b/drivers/interconnect/qcom/sm8650.c
@@ -847,6 +847,24 @@ static struct qcom_icc_node qnm_aggre2_noc = {
 	.links = { SM8650_SLAVE_SNOC_GEM_NOC_SF },
 };
 
+static struct qcom_icc_qosbox qnm_apss_noc_qos = {
+	.num_ports = 1,
+	.port_offsets = { 0x1c000 },
+	.prio = 2,
+	.urg_fwd = 0,
+	.prio_fwd_disable = 1,
+};
+
+static struct qcom_icc_node qnm_apss_noc = {
+	.name = "qnm_apss_noc",
+	.id = SM8650_MASTER_APSS_NOC,
+	.channels = 1,
+	.buswidth = 4,
+	.qosbox = &qnm_apss_noc_qos,
+	.num_links = 1,
+	.links = { SM8650_SLAVE_SNOC_GEM_NOC_SF },
+};
+
 static struct qcom_icc_node qns_a1noc_snoc = {
 	.name = "qns_a1noc_snoc",
 	.id = SM8650_SLAVE_A1NOC_SNOC,
@@ -1946,6 +1964,7 @@ static struct qcom_icc_node * const system_noc_nodes[] = {
 	[MASTER_A1NOC_SNOC] = &qnm_aggre1_noc,
 	[MASTER_A2NOC_SNOC] = &qnm_aggre2_noc,
 	[SLAVE_SNOC_GEM_NOC_SF] = &qns_gemnoc_sf,
+	[MASTER_APSS_NOC] = &qnm_apss_noc,
 };
 
 static const struct qcom_icc_desc sm8650_system_noc = {
diff --git a/drivers/interconnect/qcom/sm8650.h b/drivers/interconnect/qcom/sm8650.h
index de35c956fe4995aba9e962e52f47bf773b2211c1..b6610225b38acce12c47046769bb0460a1ae4229 100644
--- a/drivers/interconnect/qcom/sm8650.h
+++ b/drivers/interconnect/qcom/sm8650.h
@@ -139,5 +139,6 @@
 #define SM8650_SLAVE_USB3_0			127
 #define SM8650_SLAVE_VENUS_CFG			128
 #define SM8650_SLAVE_VSENSE_CTRL_CFG		129
+#define SM8650_MASTER_APSS_NOC			130
 
 #endif

-- 
2.34.1

