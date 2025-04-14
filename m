Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32C2202C2D
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 23:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744672942; cv=none; b=nTZiu0J8DPJsVdcSw34qBXkMflrEM9cTFnnG7XRuhbP1WJsZGp3inttL9CI+DmYqfBMoF0eKUfhMlUHEQHf6NeBrWND+zA6ebOa2YSpSjxboF+wTxKxHIy2N4C2GDGkR0piREEO8BH9YXwrjibaiEAWpcWDmNxhMgoKmTHX0zuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744672942; c=relaxed/simple;
	bh=dVTafZM7nNrW0odwI9sCmW7II903oWKn/0+UscbW7lY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZTNIWmhuF+PMnETKT7dfMFTVI/YRCo8ARtU+M9WCtqNpV7fyoEd0q09u3YHgpdhIvavxlW5WRr6H+/rPq+hgRf7wChu7QJ8mBfIBc9+BwfIbbrPfApww0GyKUGWU3zbIItdkfp+eWDY36MO1m4uJ180nF9OC93xyY053XDi3Nss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LrGkhvlv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LrGkhvlv"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53EKdp3L013490
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 23:22:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+u4PHpEM9uHPnCkkX7dLKWHoMPD5G7onl8VQ5TP2auk=; b=LrGkhvlvNg59usQ6
	gkmlnUajQ6hqphmZpHZtFbG4OhBhxklYC4r4zbxuwez8oNBUfu0LjIHgWHhjiLo4
	Vx1f29OoRkXehZZHYlB+L7Z4wNnmog+2VgHPWPP/MQ+2q47r0UXwlPCWVXQjIJcD
	z+WDyuaxt9AJnKroJUkXxrJTaax8JNHzfbPX+kTAmpiwC9//GIz38tqbJSmmP4mI
	ihEbtMsVzuOjxt/Ly3n1QS8dAvrcuRkYwA0X+OpxBqFlRDLkRwtRvWUSEcmfKRZ0
	JCrWJj9cXEKSTLqLyBW8fi5cdckuRk8Wn50gwWUEJu5UHAWj98yOU6Cp6Pf4OCtZ
	KOgzjg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yg8we0wh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 23:22:19 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-af91ea9e884so2449636a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 16:22:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744672938; x=1745277738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+u4PHpEM9uHPnCkkX7dLKWHoMPD5G7onl8VQ5TP2auk=;
        b=Vn+nSjfmaEEgRDdGd68etTt4rytVIwb+KJqj0UCS4VJGSe949zHJAmnbea/pvN4TVK
         42wekx3JMgQEU+9DNGf48wYwH8iN7l09+hqk5VVarQUcIc8orcVd1hEjDloMJpidGYuo
         xY/p5NIUR3kV9k0cUpPMB+w3uvzFdLDQrH3alm3PzIGQ7oIKVhhOfr4fAI24wCyORSr8
         oL07HUaAUspVFkLNVj3vGyf0JkTxRJyRSMJsIvKDNzeG/puBor/qj6B0t/Xn+lT3+/vA
         eIPHKoJeCx39IJuyoDYPgXbJ9iCrR/baPRjcAF61HYrzMbbPCR2jNUQUeMOdnj71Ilzg
         frsA==
X-Forwarded-Encrypted: i=1; AJvYcCW5haiV8L/29mkg25tzmMNsIihYmiKzQne820M1TENKuhBfBWeJDzkInOuS1FVcs3pbtD/dXwrp6tQkAqI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbZGcR9j9FmoCaIHom2CtHz+fV+afpbgCSTP3MKBSC9Jt8KI0m
	0jq0pGTp5ERsl7PJjLDyUF7TVGOB1c4NiJyHtuKyuM0C6/uBMf4WdR7Z2h4YBX6KgO51cOusm+4
	wU9pUyJTxWQ7jD3L2FDyaHSFgNUvnxxjAW+UZB888lTF0NsOyU+/G3i9Ceuy707s=
X-Gm-Gg: ASbGncsbWqQ9oNQSWVu6T86gwTRQGC3q/C5+2DGttxDNGEEAsZoHs4xDExqcyIBshbq
	atX6SvFL+gQ7sJS/LAdhEQIUWohEp6P+yQrpdw5CztzEJtwmRT4qUPF/zd/B6lll4r7TQmrdEu8
	oSGifocJ9K6//mCg39EUsPmxkvPjZYKhPC6PrN7cIewW4CChEg58GLjBUJjnm15awBu6YnKPn7Z
	4NKfHJ0SCmPkmGfK1UbL44wJ/QW7GEgFDX1muSFZijGB23oUAm4JZprlU7Qcwx0qd/8ugTqVfWd
	26m9mszJlM0J9KnoAfM6kr9aPLjp6fV8jzEDcDey5sKqrNjhNtfVB8TbA1daLT1YO/s=
X-Received: by 2002:a05:6a20:430e:b0:1f5:8bf4:fde0 with SMTP id adf61e73a8af0-20398e4a12dmr1733132637.9.1744672937687;
        Mon, 14 Apr 2025 16:22:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLc+jjmTDwN5a1gwMWdAzzogm9EB2ZeGMHNADsmtDU6bMGlncBLGtzbQV/rEUHsv895b5D2g==
X-Received: by 2002:a05:6a20:430e:b0:1f5:8bf4:fde0 with SMTP id adf61e73a8af0-20398e4a12dmr1733097637.9.1744672937299;
        Mon, 14 Apr 2025 16:22:17 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a3221c7bsm9746298a12.71.2025.04.14.16.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 16:22:16 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 16:21:52 -0700
Subject: [PATCH v4 3/4] soc: qcom: llcc-qcom: Add support for SM8750
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250414-sm8750_llcc_master-v4-3-e007f035380c@oss.qualcomm.com>
References: <20250414-sm8750_llcc_master-v4-0-e007f035380c@oss.qualcomm.com>
In-Reply-To: <20250414-sm8750_llcc_master-v4-0-e007f035380c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Melody Olvera <melody.olvera@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744672932; l=8532;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=dVTafZM7nNrW0odwI9sCmW7II903oWKn/0+UscbW7lY=;
 b=SJbH+tgiqm/keD73jUs2xRJ/EpUHPbQafH4AOaev8RXaNpHvRGhz0u3CEANPZR091k7WmCWK0
 svZNkh4AJ7xD9rFyCq+vVZfs4AdFbyvUjBczm1/6W1syU7FOI7iFu0Y
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Authority-Analysis: v=2.4 cv=E9TNpbdl c=1 sm=1 tr=0 ts=67fd98ab cx=c_pps a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=zHNgQWnGFwCULUzyGxAA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: aGwFf6eJvQn0CX33wU_EeZrSsZHtJTuz
X-Proofpoint-GUID: aGwFf6eJvQn0CX33wU_EeZrSsZHtJTuz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_08,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140168

Add system cache table and configs for SM8750 SoCs.

Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
---
 drivers/soc/qcom/llcc-qcom.c       | 273 +++++++++++++++++++++++++++++++++++++
 include/linux/soc/qcom/llcc-qcom.h |   8 ++
 2 files changed, 281 insertions(+)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index cadf7e70ee03cd65d125276eccde5c9f0851e111..b5290655d181f9d3579386eb4fc7cce41c4a349d 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -2689,6 +2689,263 @@ static const struct llcc_slice_config sm8650_data[] = {
 	},
 };
 
+static const struct llcc_slice_config sm8750_data[] = {
+	{
+		.usecase_id = LLCC_CPUSS,
+		.slice_id = 1,
+		.max_cap = 5120,
+		.priority = 1,
+		.bonus_ways = 0xffffffff,
+		.activate_on_init = true,
+		.write_scid_en = true,
+	}, {
+		.usecase_id = LLCC_MDMHPFX,
+		.slice_id = 24,
+		.max_cap = 1024,
+		.priority = 5,
+		.fixed_size = true,
+		.bonus_ways = 0xffffffff,
+	}, {
+		.usecase_id = LLCC_VIDSC0,
+		.slice_id = 2,
+		.max_cap = 512,
+		.priority = 4,
+		.fixed_size = true,
+		.bonus_ways = 0xffffffff,
+	}, {
+		.usecase_id = LLCC_AUDIO,
+		.slice_id = 35,
+		.max_cap = 512,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xffffffff,
+	}, {
+		.usecase_id = LLCC_MDMHPGRW,
+		.slice_id = 25,
+		.max_cap = 1024,
+		.priority = 5,
+		.bonus_ways = 0xffffffff,
+	}, {
+		.usecase_id = LLCC_MODHW,
+		.slice_id = 26,
+		.max_cap = 1024,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xffffffff,
+	}, {
+		.usecase_id = LLCC_CMPT,
+		.slice_id = 34,
+		.max_cap = 4096,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xffffffff,
+	}, {
+		.usecase_id = LLCC_GPUHTW,
+		.slice_id = 11,
+		.max_cap = 512,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xffffffff,
+	}, {
+		.usecase_id = LLCC_GPU,
+		.slice_id = 9,
+		.max_cap = 5632,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xffffffff,
+		.write_scid_en = true,
+		.write_scid_cacheable_en = true
+	}, {
+		.usecase_id = LLCC_MMUHWT,
+		.slice_id = 18,
+		.max_cap = 768,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xffffffff,
+		.activate_on_init = true,
+	}, {
+		.usecase_id = LLCC_DISP,
+		.slice_id = 16,
+		.max_cap = 7168,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xffffffff,
+		.cache_mode = 2,
+		.stale_en = true,
+	}, {
+		.usecase_id = LLCC_VIDFW,
+		.slice_id = 17,
+		.priority = 4,
+		.fixed_size = true,
+		.bonus_ways = 0xffffffff,
+	}, {
+		.usecase_id = LLCC_CAMFW,
+		.slice_id = 20,
+		.priority = 4,
+		.fixed_size = true,
+		.bonus_ways = 0xffffffff,
+	}, {
+		.usecase_id = LLCC_MDMPNG,
+		.slice_id = 27,
+		.max_cap = 256,
+		.priority = 5,
+		.fixed_size = true,
+		.bonus_ways = 0xf0000000,
+	}, {
+		.usecase_id = LLCC_AUDHW,
+		.slice_id = 22,
+		.max_cap = 512,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xffffffff,
+	}, {
+		.usecase_id = LLCC_CVP,
+		.slice_id = 8,
+		.max_cap = 800,
+		.priority = 5,
+		.fixed_size = true,
+		.bonus_ways = 0xffffffff,
+		.vict_prio = true,
+	}, {
+		.usecase_id = LLCC_MODPE,
+		.slice_id = 29,
+		.max_cap = 256,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xf0000000,
+		.alloc_oneway_en = true,
+	}, {
+		.usecase_id = LLCC_WRCACHE,
+		.slice_id = 31,
+		.max_cap = 512,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xffffffff,
+		.activate_on_init = true,
+	}, {
+		.usecase_id = LLCC_CVPFW,
+		.slice_id = 19,
+		.max_cap = 64,
+		.priority = 4,
+		.fixed_size = true,
+		.bonus_ways = 0xffffffff,
+	}, {
+		.usecase_id = LLCC_CMPTHCP,
+		.slice_id = 15,
+		.max_cap = 256,
+		.priority = 4,
+		.fixed_size = true,
+		.bonus_ways = 0xffffffff,
+	}, {
+		.usecase_id = LLCC_LCPDARE,
+		.slice_id = 30,
+		.max_cap = 128,
+		.priority = 5,
+		.fixed_size = true,
+		.bonus_ways = 0xffffffff,
+		.activate_on_init = true,
+		.alloc_oneway_en = true,
+	}, {
+		.usecase_id = LLCC_AENPU,
+		.slice_id = 3,
+		.max_cap = 3072,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xffffffff,
+		.cache_mode = 2,
+	}, {
+		.usecase_id = LLCC_ISLAND1,
+		.slice_id = 12,
+		.max_cap = 7936,
+		.priority = 7,
+		.fixed_size = true,
+		.bonus_ways = 0x7fffffff,
+	}, {
+		.usecase_id = LLCC_DISP_WB,
+		.slice_id = 23,
+		.max_cap = 512,
+		.priority = 4,
+		.fixed_size = true,
+		.bonus_ways = 0xffffffff,
+	}, {
+		.usecase_id = LLCC_VIDVSP,
+		.slice_id = 4,
+		.max_cap = 256,
+		.priority = 4,
+		.fixed_size = true,
+		.bonus_ways = 0xffffffff,
+	}, {
+		.usecase_id = LLCC_VIDDEC,
+		.slice_id = 5,
+		.max_cap = 6144,
+		.priority = 4,
+		.fixed_size = true,
+		.bonus_ways = 0xffffffff,
+		.cache_mode = 2,
+		.ovcap_prio = true,
+		.parent_slice_id = 33,
+	}, {
+		.usecase_id = LLCC_CAMOFE,
+		.slice_id = 33,
+		.max_cap = 6144,
+		.priority = 4,
+		.fixed_size = true,
+		.bonus_ways = 0xffffffff,
+		.stale_en = true,
+		.ovcap_prio = true,
+		.parent_slice_id = 33,
+	}, {
+		.usecase_id = LLCC_CAMRTIP,
+		.slice_id = 13,
+		.max_cap = 1024,
+		.priority = 4,
+		.fixed_size = true,
+		.bonus_ways = 0xffffffff,
+		.stale_en = true,
+		.ovcap_prio = true,
+		.parent_slice_id = 33,
+	}, {
+		.usecase_id = LLCC_CAMSRTIP,
+		.slice_id = 14,
+		.max_cap = 6144,
+		.priority = 4,
+		.fixed_size = true,
+		.bonus_ways = 0xffffffff,
+		.stale_en = true,
+		.ovcap_prio = true,
+		.parent_slice_id = 33,
+	}, {
+		.usecase_id = LLCC_CAMRTRF,
+		.slice_id = 7,
+		.max_cap = 3584,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xffffffff,
+		.stale_en = true,
+		.ovcap_prio = true,
+		.parent_slice_id = 33,
+	}, {
+		.usecase_id = LLCC_CAMSRTRF,
+		.slice_id = 21,
+		.max_cap = 6144,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xffffffff,
+		.stale_en = true,
+		.ovcap_prio = true,
+		.parent_slice_id = 33,
+	}, {
+		.usecase_id = LLCC_CPUSSMPAM,
+		.slice_id = 6,
+		.max_cap = 2048,
+		.priority = 1,
+		.fixed_size = true,
+		.bonus_ways = 0xffffffff,
+		.activate_on_init = true,
+		.write_scid_en = true,
+	},
+};
+
 static const struct llcc_slice_config qcs615_data[] = {
 	{
 		.usecase_id = LLCC_CPUSS,
@@ -3454,6 +3711,16 @@ static const struct qcom_llcc_config sm8650_cfg[] = {
 	},
 };
 
+static const struct qcom_llcc_config sm8750_cfg[] = {
+	{
+		.sct_data		= sm8750_data,
+		.size			= ARRAY_SIZE(sm8750_data),
+		.skip_llcc_cfg	= false,
+		.reg_offset		= llcc_v6_reg_offset,
+		.edac_reg_offset = &llcc_v6_edac_reg_offset,
+	},
+};
+
 static const struct qcom_llcc_config x1e80100_cfg[] = {
 	{
 		.sct_data	= x1e80100_data,
@@ -3564,6 +3831,11 @@ static const struct qcom_sct_config sm8650_cfgs = {
 	.num_config	= ARRAY_SIZE(sm8650_cfg),
 };
 
+static const struct qcom_sct_config sm8750_cfgs = {
+	.llcc_config	= sm8750_cfg,
+	.num_config	= ARRAY_SIZE(sm8750_cfg),
+};
+
 static const struct qcom_sct_config x1e80100_cfgs = {
 	.llcc_config	= x1e80100_cfg,
 	.num_config	= ARRAY_SIZE(x1e80100_cfg),
@@ -4318,6 +4590,7 @@ static const struct of_device_id qcom_llcc_of_match[] = {
 	{ .compatible = "qcom,sm8450-llcc", .data = &sm8450_cfgs },
 	{ .compatible = "qcom,sm8550-llcc", .data = &sm8550_cfgs },
 	{ .compatible = "qcom,sm8650-llcc", .data = &sm8650_cfgs },
+	{ .compatible = "qcom,sm8750-llcc", .data = &sm8750_cfgs },
 	{ .compatible = "qcom,x1e80100-llcc", .data = &x1e80100_cfgs },
 	{ }
 };
diff --git a/include/linux/soc/qcom/llcc-qcom.h b/include/linux/soc/qcom/llcc-qcom.h
index 8e5d78fb4847a232ab17a66c2775552dcb287752..7a69210a250c4646b7fd6cf400995e35d3f00493 100644
--- a/include/linux/soc/qcom/llcc-qcom.h
+++ b/include/linux/soc/qcom/llcc-qcom.h
@@ -24,6 +24,7 @@
 #define LLCC_CMPTDMA     15
 #define LLCC_DISP        16
 #define LLCC_VIDFW       17
+#define LLCC_CAMFW       18
 #define LLCC_MDMHPFX     20
 #define LLCC_MDMPNG      21
 #define LLCC_AUDHW       22
@@ -67,6 +68,13 @@
 #define LLCC_EVCS_LEFT	 67
 #define LLCC_EVCS_RIGHT	 68
 #define LLCC_SPAD	 69
+#define LLCC_VIDDEC	 70
+#define LLCC_CAMOFE	 71
+#define LLCC_CAMRTIP	 72
+#define LLCC_CAMSRTIP	 73
+#define LLCC_CAMRTRF	 74
+#define LLCC_CAMSRTRF	 75
+#define LLCC_CPUSSMPAM	 89
 
 /**
  * struct llcc_slice_desc - Cache slice descriptor

-- 
2.48.1

