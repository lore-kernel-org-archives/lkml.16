Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03B71A0BF1
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 13:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744724885; cv=none; b=WZnz1H1udxQfZtApF6z1B4uoqU//UdCEEmgkoQN6szrrbLWDooIEFBgMT0oxOjtk7kK0hTPQHE8zOiyNmT7pPYvIB43GNtji813wOBqLRwf17sA5kkuS0cqqah+uMhJwgnb27p1ZJFkdGi2Y0XG+sNRilqHo7T6pA7rfB2kIcMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744724885; c=relaxed/simple;
	bh=QOJWCRbWocJStZ4O8qKsDFpA9LiVnCH8PZi0Nhn/85o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cfl3DDozJIGIZaMS8Ptv7UrhQ6ZEwBW/crFDxwl73mr+EdvtLMKQdwrro3VJ9c+XJvyfgT5kmCacqynEu4iv+fiYYX0IOP0oQxIBq0KgeyvJkxOS2WkxSO5F6Vw26waqc70Sq6lr8YY8Ae++4mN62J1p4f4EKiL1Sq4Tpg6ttck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c3tJb7JR; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c3tJb7JR"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so58413275e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 06:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744724881; x=1745329681; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VbyfCB9ABt9m7yero1XyRCvGRX9/7VOl0CwvvvzbTLk=;
        b=c3tJb7JRikg4/xI/+6sRQxa5zZUcapwf6px/7PNGC2DCuQCyRGtoZEEWF0Wsi++OQz
         aitfhFfWGh1oWqFRA6cE7+fvJp0hXDVxd1VBUW700G7c+Y3KNssbWvNer3yU4Nw1Ap8l
         Ry1QJEhn4ZywwcCqdu8EjQEmxZhuo/nKnSgrdcpvP0gVWE3vdflgDFBCIm1k7in38SR5
         k0UvTmYj1w7Y162tJ8rIxbUuxU/7uMVXjdTZ8OrYipLEfPK6KfyeRhyuMfxT9h3EvRkJ
         PETViCUKNQZWIKXSMdQAKhVyFCR1WcY69ZFDZh6UrY3Sp+23LL1LpOvj2KRG6zgOme4d
         24RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744724881; x=1745329681;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VbyfCB9ABt9m7yero1XyRCvGRX9/7VOl0CwvvvzbTLk=;
        b=cY4JCurmTilL8QhuNp+Klhu+N4j/2doSD4TUSoH3Q4kvCFOk5UE5LdmpAowq+Na4O3
         nKjuHybUah8PhcYGAi07etz5kc7SgaiBQOJWgCfbP3AqPIe1+6/iuNdKEzGAoD/CU+Ey
         yz9KzoPJfQ94z7VaL4o73jKZEWnG+gPLmyJEefBAflZqQxNswg3hJ2lTp4D1yvC8e/ns
         xQf0quFnCMIfpcyG+SE8lyAyto/prnC+CB5th5IZzueuH/fUwt+V93JsPXwA6zLAMHdj
         iF8NGMhSMywTH9+Eced8nvVvKbeC5JxENQlw6Y4M5O8mEyg2aRIE4lezDCho614p6P1Q
         GQyA==
X-Forwarded-Encrypted: i=1; AJvYcCVqz8DrZi53/NRvG8gnQ9yUw3JDso3I7J8KXvprbHbzUMWWlMIFzvwP3DSfX2u4SJTxLf2TgYbsZwbiAv8=@vger.kernel.org
X-Gm-Message-State: AOJu0YybQKlFuOoIBQNGJfatPUcRCIRqrs0neFl12eA5fb0A+gkeCrnf
	E0lt2cH1vKbijjGmoyaRqGGK5zPdShhYj7GKlYCR0UzcDnHAY15EKfmVXaekRdg=
X-Gm-Gg: ASbGncuYjDWi3HyFM1bk6/JdeEUWkGWUx1zKiCArybD26yL/jdEZ5PdxEb12/uDSVYR
	ZOsPosmNLCZRc4nKEsUiUcrQK0ZaKbMfK+c4xBUoA4UM5WXSzfuiB1UxHF7V+tyJVRzAUGjahQZ
	YjfM2MwsnO2Mai/67vLt7+NPXKGSnQyhH5K8oYiMGFm0in4oTXiGCQfYY4nPb23WnujoEjVO5A2
	N8J1H3bVKRdNnyelmjCycN/gir0dQVaxVCRF8XQB74Drvg6+Q7JJcz4GwCXFAKoSnVb+r3yDK+p
	a6QWKDz/l5qutlHBCJOD/UNWcT8ea/egjO+DBtX6GepMxgCxgVrV7dajykL5Xg==
X-Google-Smtp-Source: AGHT+IFZOwk7PYHY38wWwMBcmuYW3K8BQStofJ4Slz4FVx5HBy5M3wNuQQbdHpwE9XSYImylGHa7pg==
X-Received: by 2002:a05:600c:1f94:b0:43c:fb95:c752 with SMTP id 5b1f17b1804b1-43f3a925de9mr175202925e9.3.1744724881088;
        Tue, 15 Apr 2025 06:48:01 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2066d0fcsm210434195e9.19.2025.04.15.06.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 06:48:00 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 15 Apr 2025 15:47:55 +0200
Subject: [PATCH v6 3/7] media: platform: qcom/iris: introduce optional
 controller_rst_tbl
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-topic-sm8x50-iris-v10-v6-3-8ad319094055@linaro.org>
References: <20250415-topic-sm8x50-iris-v10-v6-0-8ad319094055@linaro.org>
In-Reply-To: <20250415-topic-sm8x50-iris-v10-v6-0-8ad319094055@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4440;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=QOJWCRbWocJStZ4O8qKsDFpA9LiVnCH8PZi0Nhn/85o=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBn/mOLu/Bxq3Wt6izL8RAjbr3TcQvgJrt5HbSeOUUK
 rena6KSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ/5jiwAKCRB33NvayMhJ0SJCD/
 4/Y0DJZp7p+uOttJvVVRDI9e9tvo8gXdwghlmxvzMmmmNH96VSPeE+oWh2Rubk4mmMnCS6jbi8Kn5j
 0zyviBbygdfv9uwOdPSnzFXSy1oOqTrkuOFsvdwN5J0PaP0joDgjPGmtMUAQRwpczD6vU7uCvJlh2m
 Q1FLVpk5hhm6RELCoMrjKuTGbLv4b7eihkHsljrMSAJP5o+382bGZCKV0Em4N26fELcyGV4XlqcZuo
 u0e7jt053vxw4/0L2N4Z+vsMLNrAbGzmWHi0zZGDhRjsvwWE4pc8faSYAxwO/YKr+hSkM9HY4neHcH
 8PH1jPeM6ohbvrliInhi7hJXSN89w1agnO9lHrcDPqDCH4slnWGnk3oIxkOqMSQAfPoBoSCK8lFth1
 CgAvU3EdcaOtkOaFdmLemQuSwSUDiRHoxat9eKXKrOX9GlQBpcRKTN23qmL35LmEOXwLL1WhbZUxT0
 4i5g8AeV7jFb2toMxuxuP2DDPXY69fOQyDLXhw4soDT3jteTD88oJy3+WrOXKQbpaDJG/n0F9iKBYp
 7X9wcrULuoMZtaPrDFAfn18bw/46rq4tayTytNBs+FrTov3JBlQq4XxFviq+bh9afGoIaM/pp2maws
 J5DZwmpqwE53r5nMpGc74PnvvZJPL3nln3hO7TntZfBuHLTlrp06hnrswguA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Introduce an optional controller_rst_tbl use to store reset lines
used to reset part of the controller.

This is necessary for the vpu3 support, when the xo reset line
must be asserted separately from the other reset line
on power off operation.

Factor the iris_init_resets() logic to allow requesting
multiple reset tables.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # x1e Dell
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/media/platform/qcom/iris/iris_core.h       |  2 ++
 .../platform/qcom/iris/iris_platform_common.h      |  2 ++
 drivers/media/platform/qcom/iris/iris_probe.c      | 39 +++++++++++++++-------
 3 files changed, 31 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index 37fb4919fecc62182784b4dca90fcab47dd38a80..aeeac32a1f6d9a9fa7027e8e3db4d95f021c552e 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -43,6 +43,7 @@ struct icc_info {
  * @clock_tbl: table of iris clocks
  * @clk_count: count of iris clocks
  * @resets: table of iris reset clocks
+ * @controller_resets: table of controller reset clocks
  * @iris_platform_data: a structure for platform data
  * @state: current state of core
  * @iface_q_table_daddr: device address for interface queue table memory
@@ -82,6 +83,7 @@ struct iris_core {
 	struct clk_bulk_data			*clock_tbl;
 	u32					clk_count;
 	struct reset_control_bulk_data		*resets;
+	struct reset_control_bulk_data		*controller_resets;
 	const struct iris_platform_data		*iris_platform_data;
 	enum iris_core_state			state;
 	dma_addr_t				iface_q_table_daddr;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index f6b15d2805fb2004699709bb12cd7ce9b052180c..fdd40fd80178c4c66b37e392d07a0a62f492f108 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -156,6 +156,8 @@ struct iris_platform_data {
 	unsigned int clk_tbl_size;
 	const char * const *clk_rst_tbl;
 	unsigned int clk_rst_tbl_size;
+	const char * const *controller_rst_tbl;
+	unsigned int controller_rst_tbl_size;
 	u64 dma_mask;
 	const char *fwname;
 	u32 pas_id;
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index aca442dcc153830e6252d1dca87afb38c0b9eb8f..4f8bce6e2002bffee4c93dcaaf6e52bf4e40992e 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -91,25 +91,40 @@ static int iris_init_clocks(struct iris_core *core)
 	return 0;
 }
 
-static int iris_init_resets(struct iris_core *core)
+static int iris_init_reset_table(struct iris_core *core,
+				 struct reset_control_bulk_data **resets,
+				 const char * const *rst_tbl, u32 rst_tbl_size)
 {
-	const char * const *rst_tbl;
-	u32 rst_tbl_size;
 	u32 i = 0;
 
-	rst_tbl = core->iris_platform_data->clk_rst_tbl;
-	rst_tbl_size = core->iris_platform_data->clk_rst_tbl_size;
-
-	core->resets = devm_kzalloc(core->dev,
-				    sizeof(*core->resets) * rst_tbl_size,
-				    GFP_KERNEL);
-	if (!core->resets)
+	*resets = devm_kzalloc(core->dev,
+			       sizeof(struct reset_control_bulk_data) * rst_tbl_size,
+			       GFP_KERNEL);
+	if (!*resets)
 		return -ENOMEM;
 
 	for (i = 0; i < rst_tbl_size; i++)
-		core->resets[i].id = rst_tbl[i];
+		(*resets)[i].id = rst_tbl[i];
+
+	return devm_reset_control_bulk_get_exclusive(core->dev, rst_tbl_size, *resets);
+}
+
+static int iris_init_resets(struct iris_core *core)
+{
+	int ret;
+
+	ret = iris_init_reset_table(core, &core->resets,
+				    core->iris_platform_data->clk_rst_tbl,
+				    core->iris_platform_data->clk_rst_tbl_size);
+	if (ret)
+		return ret;
+
+	if (!core->iris_platform_data->controller_rst_tbl_size)
+		return 0;
 
-	return devm_reset_control_bulk_get_exclusive(core->dev, rst_tbl_size, core->resets);
+	return iris_init_reset_table(core, &core->controller_resets,
+				     core->iris_platform_data->controller_rst_tbl,
+				     core->iris_platform_data->controller_rst_tbl_size);
 }
 
 static int iris_init_resources(struct iris_core *core)

-- 
2.34.1

