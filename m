Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58151299A80
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 20:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747083297; cv=none; b=VAaFiqMCjk+RnlZ+bWfuQgeEUY0nON1i0cAspuQErllKB0PfHXIQGgt1/FWWn/C6zQCrCkx8ch35fn4IcVFF+nh1GVIjH2Tb6P5a6ipE5GPegT5tqVILxThd8vwCkNiSpFmgsShdXoGdF2TulWI6VRSzRndONMOhQPSKr7VxCM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747083297; c=relaxed/simple;
	bh=+qxkYO6LWLqJqAQ+Xj/QIDTu2Terv0LqWENxCicP7PU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FdzxFwlMd/HAL8zYEag5nOP7ldT2OPFjEYj5ElbS4WG2IrMiFVHCFL8qJRUmyH6cs0wjXBcZl9TKaZ2KrHFHPEfbhQvtQdKhzRMClYv6rGFcZvMpMgAcU31A6LVOAw+sz5b6VjmCRfx3pJT/XTVl8vcO8AOT63LIN2CJeh/6NXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bGdKma3G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bGdKma3G"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CJeDVJ011347
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 20:54:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fYdMnfSshX04WFneEQP6h3ato83zH/7J1BPEJ0aRSSE=; b=bGdKma3G6NWXDjrb
	xuDOiBd8I8uAgFaZUAgPMMHGzIad5ML8sD4p4WGLvHtxU6P6wt1SRDV7dQ7ZN+pO
	UM7cnApJMR/5mgRNMlaPvdN4XNPb0mL3gNzrHeNDU1qRT4xb+Hv6oBFmIvhEm+Jz
	wCi2ImLRni92LYScPF4k37Jm010nZL7qJNiTxVtzLHUE/WJFhuZneHcessYX/yhn
	ZBHejfc8qvm3PzIJVcZGNCP/mO4fTNuSMYMCIMq66xLvvxGAjJWaCCkCxXyUWVzP
	LXMsWrEvt2uPkK7gfvIq4w4DXb9r4XskQMGY4KxdwJoO682OhnPUuVPbhw2sKux0
	SOiUVA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hyynwf31-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 20:54:53 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-30c1c4a8274so4666945a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 13:54:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747083292; x=1747688092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fYdMnfSshX04WFneEQP6h3ato83zH/7J1BPEJ0aRSSE=;
        b=WtE2krmINqEdFMg6RkihulIWwn9i2xnHS0Vp28LFoQQmZK7wzoX41pSZ2gfifIAn6q
         iLZq/de6oWV9gq6R7unm9iL2gePDapipIxtkzB5ujzHG+x0Z4Mgu/qOkL3vCm79rW5FM
         JaFU11lCmSqE3RBhsNhQM3oiRCXneOSonEtFksk4LUwKkKnpWjJHnWMhZNEvR5oA02v3
         jWtCJF3iwBJ8H9mbsUqE+9AdQ+0Qex9x7u3VpvTLP+GifP1WNKeVWLxtu0KMJQXrGkG9
         Urjrcb/wVOes09VaGWN1XhUbSl0DTMKUXXB5O94DG7FGZpymLlWhJ4e2F3XzZuRKhndI
         x9Ww==
X-Forwarded-Encrypted: i=1; AJvYcCUbEVDuSyQ1mfAQap5zQzywcCNxnGc6yS3mCtsetIvxs+GWcNncPWweUqpCxUtZnffFpsQrTyOvmSxJNGQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWPxFBSwwR0oQ959HbRNXu4uJfqWtCpfkMAQSeXJRKXfMPN5/D
	fmI6xUWA2Q1gcIwes5NxCSolbKrwUIjWGniPww5MUaBPsnJg05H7cl8b3APt3uvXEED8EfVOdUJ
	Aa8J7YIDIW6vE+vTaByddaDoU0GCRbsKzNTeZqw6vQ5G7ilFAQcaFgPnHsaXM430=
X-Gm-Gg: ASbGnctLY20bCLJg9U+K6il4/3ImUeHlIuSJxS2khmXQakoxLZ2G2kioE5gGhCTUyRJ
	rCefo8MqwiRf1eECPI2dK6FQ/9HdyI2VRU0qK2gIOOCQsiMpmFc5Sxwl7AY8hT4Zm65EIjvFA8I
	u5v6i4+Up4fGOeTCZwj2runTB6ny7DYTh3+nAZk44frujw8jlrneMG8SaKpbvw4Bx3ySQEj/Ni1
	xYFxUX/VyRaoSuE07kMMwlmHqKV0ol0ITJdiRcVSxtUh9QUrhUN7Qt0N/sGPMgS6eRdn9smsAKm
	thyOjRG6qlAIZXvi1oPgb7reipl5g10jJ3ZbM8iv3HqtgMjeblv9VWh0tVo8+khNHE4=
X-Received: by 2002:a17:90b:3b4a:b0:30a:a034:bb0c with SMTP id 98e67ed59e1d1-30c3d62ec5dmr22519072a91.28.1747083292364;
        Mon, 12 May 2025 13:54:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF99n1ktaYUUe5cOGGVmNYMnRk7urOfqhv/NeSIl0dAg6V+QWRlqKKmTw8Q/cz+pz6mBiH0ng==
X-Received: by 2002:a17:90b:3b4a:b0:30a:a034:bb0c with SMTP id 98e67ed59e1d1-30c3d62ec5dmr22519046a91.28.1747083291996;
        Mon, 12 May 2025 13:54:51 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30c39df09dbsm7084867a91.26.2025.05.12.13.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 13:54:51 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Mon, 12 May 2025 13:54:43 -0700
Subject: [PATCH v5 3/4] soc: qcom: llcc-qcom: Add support for SM8750
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250512-sm8750_llcc_master-v5-3-d78dca6282a5@oss.qualcomm.com>
References: <20250512-sm8750_llcc_master-v5-0-d78dca6282a5@oss.qualcomm.com>
In-Reply-To: <20250512-sm8750_llcc_master-v5-0-d78dca6282a5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747083286; l=8593;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=+qxkYO6LWLqJqAQ+Xj/QIDTu2Terv0LqWENxCicP7PU=;
 b=uC+QnQOhdzzuxBIyotDLUvhV9PKqEt245loelGlQ9O2xnLrnve3uan16Ac2gPsKrrUWVTU4sK
 EGLKPnojTWBD0n/envEMDTUpty5Gd3j++p+KbPk/NAa6areV7SNVdOy
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDIxNSBTYWx0ZWRfX8nLBc0tkZGeM
 0vyzlU8qwD2drWDSugH3RD+t6YNLGP/nzLaRvqP8GQoHzzw8Bgkw/GywfedfEb/MwOcNVTpRYQl
 tFhjGdfrJ4YLmxzgmorkIdQJoRL+sz4B/ft0u5FCAYkTjl+JBxeMqlj44xi5wDJuTH6qTvhDAiQ
 rn/SlxWGQdAGrEzOeVuGxa/ouC6sePkqYLMcL9aVIfCrRNV4C60qHvVWSCpKbcOyJbQbYh4AZoe
 ec831N9cNFVQOHHciapYCiUi6RhQaEM+7+ldlYOxw+ntfGTws3QnB+PUcmTDnJaZ7q2lsvgN+pO
 hl9Flzi8P47n8q3uMJdX2TGz8yb4rMEaRnTLXBQ+26HRIv6rCRESKfrZaEoJgjy83JnvAOVG077
 m8EayLk8bbHi6tdGckf0pUCrbsGK93XnSYUS13Exh4WtZdGkW3V7SzGaTUmJuO7foF8IPT17
X-Proofpoint-ORIG-GUID: 5P4_6AePHjdvlucxKjH0S3SqumLCslD6
X-Authority-Analysis: v=2.4 cv=Uo9jN/wB c=1 sm=1 tr=0 ts=6822601d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=zHNgQWnGFwCULUzyGxAA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 5P4_6AePHjdvlucxKjH0S3SqumLCslD6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 mlxscore=0 adultscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505120215

Add system cache table and configs for SM8750 SoCs.

Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/soc/qcom/llcc-qcom.c       | 273 +++++++++++++++++++++++++++++++++++++
 include/linux/soc/qcom/llcc-qcom.h |   8 ++
 2 files changed, 281 insertions(+)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index 958f9e03f1d5e4946ca7ed340f05b8e01929794e..192edc3f64dc3eee12ab5ebdb9034cd0e2010891 100644
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

