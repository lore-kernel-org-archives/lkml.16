Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35271253329
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 14:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744901957; cv=none; b=TdjBxVncgRCIcHmmg0pKK6uH4X3OGrpGAl/hWMyQeGTkzXrJI+f/czbDeBS2EzUhdbMzQ+z8UZChnXV1Xm3+1asntERveBKU4CTmHWJh4TeTy148mlgykQ6EtToZazNWZyA92s61Mh+TNKbknwn8S+lrOV0p1qRJN0r39vXedkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744901957; c=relaxed/simple;
	bh=k1UpKHn4ETY2lpwXTVm2VtfLMdYT5zXYdB6oYZjUbEQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t2D6+eqjzD3otMKIdoLhry+6FUE7QVzd4uJSXw15U9yq48ysSa0zO5/XfpisHyExITnLUIpnDOlIZoCby+nAFHiy/bXzU9v/fW8PgRdEyGr+nVOGbq9dBTqcnojCEWLhNeeCOz08OrojpJ2b2TZcK/SS3VqgkQB4VKa5Oo3sp08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SGAoeXfs; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SGAoeXfs"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso644692f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 07:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744901951; x=1745506751; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9g0vibFvd/TshtGODQr2SCzCeB7Z7fValwgpiuVqQm0=;
        b=SGAoeXfsYUkO5ggrtuHI4KhWJdCZqr5KCeB6dATKN+DTlS7vb0MJpz8Gq8luOb5BS5
         siJP0d3/qh3Bj8vlX6Yf81jP18UETrONJsCc44ha8mnb9RIL7i2ZMDosX31SoYCkj62Z
         3nhPWj2riH4UmyyMxyegjgqEK+VC9FURLe96A+e5uufHwnJighiE3UaMyMgdIDNPSwyy
         O8pna21655mlllpoO0dA8TNzqieub++pcd9BNG0N7wArmMtWjP29/xScV2NS0MJcajZq
         mYJyfw4PcFlrlTZltLbTGcjaghBP7gj+64Nhb/A/XDdm8zkGsQeh25RX6Vo++yZyEPa/
         28Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744901951; x=1745506751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9g0vibFvd/TshtGODQr2SCzCeB7Z7fValwgpiuVqQm0=;
        b=ilelR/UsdCH4oxx69wrmEzglQvdx+WEzQHsUE/3MvNxyUcBR0VzNJ9KdTKrVWl4w4e
         /9cgVSsy8CnquHuuC730bG5+EYb0tD/kIcLxrB6dnT2ZFvOdtN1FlKEqUgqYZp/Ejmc0
         gdRZhb+AS8VldL6QhLrahRzK9xWYid9e0YdbMpY38+JBjmPtLHquExmiZ+NfVFIFpyMR
         wdnOczPXVjo1tIKH/KGVIoGXNEJEqayKALaCEYefPVLLNxxHpUsj6pEsS13fp3ZIVcbg
         BBH5AUQAGAHeYXBAihXCPsabuCDI/BhDMkYIpmDF4qPd31ltMlvQ437gikWoT4HsgofZ
         ZEhQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5v3EUb+QBYU7xHkuB5LIWIaJCdokKYddCaBNDchE20bQIBWcs1eWUv+k26XFJ8N64OwXJQedLAwZ1Kds=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhh0gQiW7dhPcrRBTHEr0ccz2k8i+X+qtss6IHRqFpilWv/6h7
	azF+0cKJIW8wSOyD8Pq/g5ymaluf+Pa8CWu6G1dlAUCqbbcC4TMqlSNObF5Ly/k=
X-Gm-Gg: ASbGncsfVebn1kKLOmaQD3I4BAkcKVrcNTF3GDlUe6JLejsQC8A6yH9cLV6Xf2NPvjy
	BgD6IxUJVzZVJS1BoD+n4IpQceg5Xl8nllMPRSPDDpfZrbDnkC/bSNANpyeA8RojoNGcyPZlKsc
	jcjqCXpnARPAfu5EXrDNFhCIzDt8P5cfIMPHacdngtu+VIgCJM04wQ0USUZGdfiafd/2AbahPvB
	d/NtECfChj1sObVIiNeHDQB00PI1T5kFAct6JfHrpiAJp7GdQbWRios8gVm2+TpVQwsfnkU6+OD
	sYtnnZHHtJr2uG2lpGxq1+TB2A50tAqejZG0vg2VUEQ1TvnVM5DqXP9bJ4jxHw==
X-Google-Smtp-Source: AGHT+IEIDZNldgI3E0QiHxUpEXaSYGflw207l4MrCtw3130kJlqTyQxR9SBy9Axpx7awbbdV6gD6TA==
X-Received: by 2002:a5d:6d87:0:b0:390:d796:b946 with SMTP id ffacd0b85a97d-39ee5b9f7bfmr6176726f8f.44.1744901951253;
        Thu, 17 Apr 2025 07:59:11 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf447914sm20497743f8f.97.2025.04.17.07.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 07:59:10 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 17 Apr 2025 16:59:07 +0200
Subject: [PATCH v7 7/7] media: platform: qcom/iris: add sm8650 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-topic-sm8x50-iris-v10-v7-7-f020cb1d0e98@linaro.org>
References: <20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org>
In-Reply-To: <20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6047;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=k1UpKHn4ETY2lpwXTVm2VtfLMdYT5zXYdB6oYZjUbEQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBoARc4EItaNHH7QgaIG6q9ddNSCdzoO8zGSPFSXM1g
 VhUFbh+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaAEXOAAKCRB33NvayMhJ0Q+6D/
 4qpuQoEb/v1IZG5KH7BKvT9JHKG+zOqNpYXJuSkY7DG1q3QAqmrbStYdAPh+RbdXUviznIMr+QsNUl
 kdszZ2rw7u2FM9VM9B2Lr/dOjVhzhF8YeHDJOYqMQU4nzWT8nHjm7ikC60vfWkAkswF/RJKpxML/6y
 Js4aREu+w6R78B30Fj6SF/6/rJ5xSqaF2tQmLo2xwXO5WanSeDtXUVh0ZX/G5WHHkPL4n0v8MuHk2+
 M+l4dRzLLflmpsRMjOSEoe7RrFiUx5jvMQeYsTUiGTGRiDEe6FGL/eLzC9/na6BIKKCFEEI+ChZ0w7
 +3TOATpyztWtUziqx1HG7juoH0I/XowlqOsWhVcETCKTE9K1/Llear6gqpeH+rE0dAwLXnV+QxA3T3
 KDkqHLmmY3veRvqPPd2J5Q/ojqDlpNbVIVEobSlXmBbh4qoQ3Ua12MymYMBNx/M08Qxk2RMSOCrhEp
 vEvpv5ZoV7F9dRQzPtXTRQ18Kf5fe2kROE03nRPBHcMXR+5AFvsJe/wCu3WW25cUECEbRLPOov+nF6
 HgfvxA8/TC0uB2M6Ij3OAr2M3+nXQfuRZqpwe/ziKNP4yTDb2Q2aIG6bxqC8cJz3lf0sTRbzseyUaL
 fNZQwba2N1BFq2mBB3iFRUXRUzXJgEdzwYUv2peiQOd4lamdkddWqbSrjuFA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add support for the SM8650 platform by re-using the SM8550
definitions and using the vpu33 ops.

Move the Sm8650 reset tables that differs in a per-SoC platform
header, that will contain mode SoC specific data when
more codecs are introduced.

The SM8650/vpu33 requires more reset lines, but the H.264
decoder capabilities are identical.

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # x1e Dell
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 62 ++++++++++++++++++++++
 .../platform/qcom/iris/iris_platform_sm8650.h      | 13 +++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  4 ++
 4 files changed, 80 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index fdd40fd80178c4c66b37e392d07a0a62f492f108..6bc3a7975b04d612f6c89206eae95dac678695fc 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -35,6 +35,7 @@ enum pipe_type {
 
 extern struct iris_platform_data sm8250_data;
 extern struct iris_platform_data sm8550_data;
+extern struct iris_platform_data sm8650_data;
 
 enum platform_clk_type {
 	IRIS_AXI_CLK,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 35d278996c430f2856d0fe59586930061a271c3e..5ff82296ee8ea5ad3954bd2254594048adcb8404 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -10,6 +10,8 @@
 #include "iris_platform_common.h"
 #include "iris_vpu_common.h"
 
+#include "iris_platform_sm8650.h"
+
 #define VIDEO_ARCH_LX 1
 
 static struct platform_inst_fw_cap inst_fw_cap_sm8550[] = {
@@ -264,3 +266,63 @@ struct iris_platform_data sm8550_data = {
 	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
 	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
 };
+
+/*
+ * Shares most of SM8550 data except:
+ * - vpu_ops to iris_vpu33_ops
+ * - clk_rst_tbl to sm8650_clk_reset_table
+ * - controller_rst_tbl to sm8650_controller_reset_table
+ * - fwname to "qcom/vpu/vpu33_p4.mbn"
+ */
+struct iris_platform_data sm8650_data = {
+	.get_instance = iris_hfi_gen2_get_instance,
+	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
+	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
+	.vpu_ops = &iris_vpu33_ops,
+	.set_preset_registers = iris_set_sm8550_preset_registers,
+	.icc_tbl = sm8550_icc_table,
+	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
+	.clk_rst_tbl = sm8650_clk_reset_table,
+	.clk_rst_tbl_size = ARRAY_SIZE(sm8650_clk_reset_table),
+	.controller_rst_tbl = sm8650_controller_reset_table,
+	.controller_rst_tbl_size = ARRAY_SIZE(sm8650_controller_reset_table),
+	.bw_tbl_dec = sm8550_bw_table_dec,
+	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
+	.pmdomain_tbl = sm8550_pmdomain_table,
+	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
+	.opp_pd_tbl = sm8550_opp_pd_table,
+	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
+	.clk_tbl = sm8550_clk_table,
+	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xe0000000 - 1,
+	.fwname = "qcom/vpu/vpu33_p4.mbn",
+	.pas_id = IRIS_PAS_ID,
+	.inst_caps = &platform_inst_cap_sm8550,
+	.inst_fw_caps = inst_fw_cap_sm8550,
+	.inst_fw_caps_size = ARRAY_SIZE(inst_fw_cap_sm8550),
+	.tz_cp_config_data = &tz_cp_config_sm8550,
+	.core_arch = VIDEO_ARCH_LX,
+	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
+	.ubwc_config = &ubwc_config_sm8550,
+	.num_vpp_pipe = 4,
+	.max_session_count = 16,
+	.max_core_mbpf = ((8192 * 4352) / 256) * 2,
+	.input_config_params =
+		sm8550_vdec_input_config_params,
+	.input_config_params_size =
+		ARRAY_SIZE(sm8550_vdec_input_config_params),
+	.output_config_params =
+		sm8550_vdec_output_config_params,
+	.output_config_params_size =
+		ARRAY_SIZE(sm8550_vdec_output_config_params),
+	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
+	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
+	.dec_output_prop = sm8550_vdec_subscribe_output_properties,
+	.dec_output_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_output_properties),
+
+	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
+	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
+	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
+	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
+};
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8650.h b/drivers/media/platform/qcom/iris/iris_platform_sm8650.h
new file mode 100644
index 0000000000000000000000000000000000000000..75e9d572e788de043a56cf85a4cb634bd02226b9
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8650.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef __IRIS_PLATFORM_SM8650_H__
+#define __IRIS_PLATFORM_SM8650_H__
+
+static const char * const sm8650_clk_reset_table[] = { "bus", "core" };
+
+static const char * const sm8650_controller_reset_table[] = { "xo" };
+
+#endif
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 4f8bce6e2002bffee4c93dcaaf6e52bf4e40992e..7cd8650fbe9c09598670530103e3d5edf32953e7 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -345,6 +345,10 @@ static const struct of_device_id iris_dt_match[] = {
 			.data = &sm8250_data,
 		},
 #endif
+	{
+		.compatible = "qcom,sm8650-iris",
+		.data = &sm8650_data,
+	},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, iris_dt_match);

-- 
2.34.1

