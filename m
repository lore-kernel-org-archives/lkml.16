Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1702E92B2
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 13:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750946386; cv=none; b=JhfdcFHEqsyDecyyTA6rW2hlfUoweASNncNpY1tdRm8jjIZLbtsVjZUbkVdYh0dPUJ1AENsgYML/8/ryPXpyuJuoulGrQILGL8XRTp5qu5zSlz8x3IxlFI7s9zXbK6ULAN6zXT5a50dOTiW6kJInZ4RIQHv3pWW08CJD4qkLGPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750946386; c=relaxed/simple;
	bh=9LSytQPyTFkBJt9YzIaXb6/U5LogpeOg/rPyGmYojDo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=enZLV+vPH8TgvUpx6ZKgFyHSUx5sikdZzw97rHCs3lEVZ4RtOKcjt5rPBBgxEpLkeYyvTmW0kHBipdfR3d46UiyVTv8UQwiEJyGGJrBbHoK+2fnkPek5r4qYiEbdVt7lQeeSeeifcBlFgbH3AHZS51xSOvAMx5L+Y3+1JyTjHm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=USrbd66W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="USrbd66W"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q9SJSl015250
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 13:59:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=x740bfZ74Zy
	o3mZSJA/M7WOOgB+n7paS30h2fBwgGpY=; b=USrbd66W7FbtC9NGE/CEzqs62cA
	F7AFgEQvsxiBcE+wIpZWUXR9+lYNleeq6V87A/I2Wo7+81yaSBAYjabFS60Q/A9D
	oqgzrhlZNgzmErFlxtQEhGXiYPR+FFMTAwUw6plJMkp+cBRDu6tFP3XpydTcM6CG
	wd89Gvp7vl2helQ3qBxIDRuTzP6E4K7Foy9jWAj8M92uA09QGMZGcw9hwIm8rBOR
	kmlud9BVf1NUu6+gugT3j9k8wU2+wTpow4IKBoyea5zXnUXqojeB0AzTPkRHR/qc
	8b7FV/xPp8TB2QL2QAMhQsJxaVkoTFM+Kplwlg0Yop3FeEW1F8J1aJCwTzQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm223em-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 13:59:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d3f0958112so160076285a.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 06:59:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750946382; x=1751551182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x740bfZ74Zyo3mZSJA/M7WOOgB+n7paS30h2fBwgGpY=;
        b=nG025Zg/3hvugrRcMB/vynptNrrhRcBswTWAuflFN8YhckE5UUJybFmMvpN1FYRIdj
         47gpMbS6hKb1JKKbku38VO4ztiJ4RCbK6P6AyXqoSRhZeGFriATVSohxzsKCWFAFi8B3
         sOPA86atgvWSBJ9qLNd7pba70iauwj5lriDW+z82XdWkD3KdIqejZLH8xf+Y4lcj/lIJ
         AAfhvUYyAaVwrW3+cMkFLlyfAf65vZkSpt5lDajvdTszagzbnoxKrb1UDpFNgxu5PwF2
         8UVhIVRtYAQzXi5WvZIVSzPGIKbiMEyIG+Nj8BKpXhLggBdixIMKb5yzzXVg+OyhO/YZ
         O1ig==
X-Forwarded-Encrypted: i=1; AJvYcCWHr3BSSj+j6OE8jC1S1VHxt06Do7XTLvCoLT1sysndt73bagipeZ/CozudoEyK3wYuaUO6dPiB2oGcqcQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0oxRqHDkrJnT6tgNO2qwxv4H/7MsOo3bst9Ab5KsnNfsG3XWH
	9BkfP/bybcqDTemr0k5AjjQ/VvToByOQuNmaLpQa3iqUpygZO6VxZcKaML8MuSumnTfax2+mrzS
	rdliMHYCbB9m09+OOIHcMmNJl25EB5V6mAvi76WAh9Zam43qZRwP3y4p4PfmYpzeu6WM=
X-Gm-Gg: ASbGncvzW4Iew6iccXskoUDIb2Cixg7EZgBpndMDWuWJOu8oJolY8y2gzSF3NiRJQZJ
	08D4H1tS363HSPR79eyDa10FkkbpgHzAZRO6GtF3i1+uS8AaCcovHwATYeWb1DvvK6LQyD4MDuA
	i/W1xuVKwjlKUpRXt+IwYj2ZbFb19H24LJhPeXDpwuGTDu+oj3b4No3Wao3sRfX0NskYUuMr+Op
	tw1rFLLIcDZiiqSadxaf+OwxRtJZlxxS424oHZKAuoFnVX7Se8utpfGMhxwh2b2k9QhHn1BcjAK
	CTfcuy4TyKqYuAVuko6CVEeE6mWUS6RICJIENdhy6EW0bJheXMpnIv8ImrNgXVI4OLIYJn3Niiy
	h
X-Received: by 2002:a05:620a:178d:b0:7d4:3bc6:1df4 with SMTP id af79cd13be357-7d43bc61e4amr502468985a.16.1750946381945;
        Thu, 26 Jun 2025 06:59:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE33xf6gEeKEUwWwZuydWiCEXbrdtFVO0IT0lVJhS8+C1Fp592pQ42B8OvnUTcON9/v8pCOig==
X-Received: by 2002:a05:620a:178d:b0:7d4:3bc6:1df4 with SMTP id af79cd13be357-7d43bc61e4amr502462985a.16.1750946381235;
        Thu, 26 Jun 2025 06:59:41 -0700 (PDT)
Received: from trex.. (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823c57d7sm53723365e9.40.2025.06.26.06.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 06:59:40 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, krzk+dt@kernel.org,
        bryan.odonoghue@linaro.org, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, mchehab@kernel.org, robh@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/5] media: venus: hfi_plat_v6_lite: Populate decode capabilities
Date: Thu, 26 Jun 2025 15:59:29 +0200
Message-Id: <20250626135931.700937-4-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
References: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685d524f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=hV3zkybWQsGKz9K1FyYA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: ER9DwdXBLczuYcPOqbO8f-jqD2dytRkR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDExOCBTYWx0ZWRfXy0R1NbLptS5i
 +n0Fjq12Lu0fuykKrnCT2z8TlE5/iir5OJRzm9IKo+ROto923S7sGglCQFbv91l6Janc9pUwqLq
 0zEyq2c6KQK12Kl2p1YRYYO9s6063X3vQqrjoVYo9Uo7A5ZZs8p063rmWWbsdGvH/Jds+6bHe52
 eASmoJBNJStj4JVL8yzlvhkm+Fc4aWGn7n9G86X6mp7nWsnVamGEMouc6Bhb4fowg8J7umBAsKW
 QEsWkdRxSAtARV9FRysO+zgnb+5R0o1qjiyTEEQEXvXCMfQTkgi2IdXW9r8kpjoR8tISoZEOG1R
 7+PMJLWBkvakAkEg1LHTnePU67vAKPirOYzdZlKdeDPB6AGRefd+5YGbQyXRXtNc9Q5zMfv+Sbr
 MpdJHTwrEQ90uSFRS9I/IPyvWDU5C6PWKh7KdkA+IP7ZZlfi/Jaj1zrxJE1PrPq0l3E+wgNq
X-Proofpoint-ORIG-GUID: ER9DwdXBLczuYcPOqbO8f-jqD2dytRkR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260118

Add hfi platform file with decoding capabilities for hfi v6_lite.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/Makefile    |   2 +-
 .../media/platform/qcom/venus/hfi_platform.c  |   2 +
 .../media/platform/qcom/venus/hfi_platform.h  |   1 +
 .../qcom/venus/hfi_platform_v6_lite.c         | 148 ++++++++++++++++++
 4 files changed, 152 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/platform/qcom/venus/hfi_platform_v6_lite.c

diff --git a/drivers/media/platform/qcom/venus/Makefile b/drivers/media/platform/qcom/venus/Makefile
index 91ee6be10292..4a6a942db58b 100644
--- a/drivers/media/platform/qcom/venus/Makefile
+++ b/drivers/media/platform/qcom/venus/Makefile
@@ -5,7 +5,7 @@ venus-core-objs += core.o helpers.o firmware.o \
 		   hfi_venus.o hfi_msgs.o hfi_cmds.o hfi.o \
 		   hfi_parser.o pm_helpers.o dbgfs.o \
 		   hfi_platform.o hfi_platform_v4.o \
-		   hfi_platform_v6.o hfi_plat_bufs_v6.o \
+		   hfi_platform_v6.o hfi_plat_bufs_v6.o hfi_platform_v6_lite.o \
 
 venus-dec-objs += vdec.o vdec_ctrls.o
 venus-enc-objs += venc.o venc_ctrls.o
diff --git a/drivers/media/platform/qcom/venus/hfi_platform.c b/drivers/media/platform/qcom/venus/hfi_platform.c
index 643e5aa138f5..f56b8f9946d7 100644
--- a/drivers/media/platform/qcom/venus/hfi_platform.c
+++ b/drivers/media/platform/qcom/venus/hfi_platform.c
@@ -13,6 +13,8 @@ const struct hfi_platform *hfi_platform_get(enum hfi_version version)
 		return &hfi_plat_v4;
 	case HFI_VERSION_6XX:
 		return &hfi_plat_v6;
+	case HFI_VERSION_6XX_LITE:
+		return &hfi_plat_v6_lite;
 	default:
 		break;
 	}
diff --git a/drivers/media/platform/qcom/venus/hfi_platform.h b/drivers/media/platform/qcom/venus/hfi_platform.h
index ec89a90a8129..6356e4bd0de2 100644
--- a/drivers/media/platform/qcom/venus/hfi_platform.h
+++ b/drivers/media/platform/qcom/venus/hfi_platform.h
@@ -58,6 +58,7 @@ struct hfi_platform {
 
 extern const struct hfi_platform hfi_plat_v4;
 extern const struct hfi_platform hfi_plat_v6;
+extern const struct hfi_platform hfi_plat_v6_lite;
 
 const struct hfi_platform *hfi_platform_get(enum hfi_version version);
 unsigned long hfi_platform_get_codec_vpp_freq(enum hfi_version version, u32 codec,
diff --git a/drivers/media/platform/qcom/venus/hfi_platform_v6_lite.c b/drivers/media/platform/qcom/venus/hfi_platform_v6_lite.c
new file mode 100644
index 000000000000..41958a3e353b
--- /dev/null
+++ b/drivers/media/platform/qcom/venus/hfi_platform_v6_lite.c
@@ -0,0 +1,148 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025, The Linux Foundation. All rights reserved.
+ */
+#include "hfi_platform.h"
+
+static const struct hfi_plat_caps caps[] = {
+{
+	.codec = HFI_VIDEO_CODEC_H264,
+	.domain = VIDC_SESSION_TYPE_DEC,
+	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 128, 1920, 1},
+	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 1080, 1},
+	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 64, 8160, 1},
+	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 60000000, 1 },
+	.caps[4] = {HFI_CAPABILITY_MBS_PER_SECOND, 64, 244800, 1},
+	.caps[5] = {HFI_CAPABILITY_FRAMERATE, 1, 120, 1},
+	.caps[6] = {HFI_CAPABILITY_MAX_VIDEOCORES, 0, 1, 1},
+	.num_caps = 7,
+	.pl[0] = {HFI_H264_PROFILE_BASELINE, HFI_H264_LEVEL_1},
+	.pl[1] = {HFI_H264_PROFILE_MAIN, HFI_H264_LEVEL_41},
+	.pl[2] = {HFI_H264_PROFILE_HIGH, HFI_H264_LEVEL_5},
+	.pl[3] = {HFI_H264_PROFILE_CONSTRAINED_BASE, HFI_H264_LEVEL_41},
+	.pl[4] = {HFI_H264_PROFILE_CONSTRAINED_HIGH, HFI_H264_LEVEL_41},
+	.num_pl = 5,
+	.fmts[0] = {HFI_BUFFER_OUTPUT, HFI_COLOR_FORMAT_NV12_UBWC},
+	.fmts[1] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV12_UBWC},
+	.fmts[2] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV12},
+	.fmts[3] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV21},
+	.num_fmts = 4,
+}, {
+	.codec = HFI_VIDEO_CODEC_HEVC,
+	.domain = VIDC_SESSION_TYPE_DEC,
+	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 128, 1920, 1},
+	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 1080, 1},
+	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 64, 8160, 1},
+	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 60000000, 1 },
+	.caps[4] = {HFI_CAPABILITY_MBS_PER_SECOND, 64, 244800, 1},
+	.caps[5] = {HFI_CAPABILITY_FRAMERATE, 1, 120, 1},
+	.caps[6] = {HFI_CAPABILITY_MAX_VIDEOCORES, 0, 1, 1},
+	.num_caps = 7,
+	.pl[0] = {HFI_HEVC_PROFILE_MAIN, HFI_HEVC_LEVEL_5 | HFI_HEVC_TIER_MAIN},
+	.pl[1] = {HFI_HEVC_PROFILE_MAIN10, HFI_HEVC_LEVEL_5 | HFI_HEVC_TIER_MAIN},
+	.num_pl = 2,
+	.fmts[0] = {HFI_BUFFER_OUTPUT, HFI_COLOR_FORMAT_NV12_UBWC},
+	.fmts[1] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV12_UBWC},
+	.fmts[2] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV12},
+	.fmts[3] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV21},
+	.num_fmts = 4,
+}, {
+	.codec = HFI_VIDEO_CODEC_VP9,
+	.domain = VIDC_SESSION_TYPE_DEC,
+	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 128, 1920, 1},
+	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 1080, 1},
+	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 64, 8160, 1},
+	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 60000000, 1 },
+	.caps[4] = {HFI_CAPABILITY_MBS_PER_SECOND, 64, 244800, 1},
+	.caps[5] = {HFI_CAPABILITY_FRAMERATE, 1, 120, 1},
+	.caps[6] = {HFI_CAPABILITY_MAX_VIDEOCORES, 0, 1, 1},
+	.num_caps = 7,
+	.pl[0] = {HFI_VP9_PROFILE_P0, 200},
+	.pl[1] = {HFI_VP9_PROFILE_P2_10B, 200},
+	.num_pl = 2,
+	.fmts[0] = {HFI_BUFFER_OUTPUT, HFI_COLOR_FORMAT_NV12_UBWC},
+	.fmts[1] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV12_UBWC},
+	.fmts[2] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV12},
+	.fmts[3] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV21},
+	.num_fmts = 4,
+} };
+
+static const struct hfi_plat_caps *get_capabilities(unsigned int *entries)
+{
+	*entries = ARRAY_SIZE(caps);
+	return caps;
+}
+
+static void get_codecs(u32 *enc_codecs, u32 *dec_codecs, u32 *count)
+{
+	*enc_codecs = 0x0;
+	*dec_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC |
+		      HFI_VIDEO_CODEC_VP9;
+	*count = 3;
+}
+
+static const struct hfi_platform_codec_freq_data codec_freq_data[] = {
+	{ V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_DEC, 440, 0, 440 },
+	{ V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_DEC, 440, 0, 440 },
+	{ V4L2_PIX_FMT_VP9, VIDC_SESSION_TYPE_DEC, 440, 0, 440 },
+};
+
+static const struct hfi_platform_codec_freq_data *
+get_codec_freq_data(u32 session_type, u32 pixfmt)
+{
+	const struct hfi_platform_codec_freq_data *data = codec_freq_data;
+	unsigned int i, data_size = ARRAY_SIZE(codec_freq_data);
+	const struct hfi_platform_codec_freq_data *found = NULL;
+
+	for (i = 0; i < data_size; i++) {
+		if (data[i].pixfmt == pixfmt &&
+		    data[i].session_type == session_type) {
+			found = &data[i];
+			break;
+		}
+	}
+
+	return found;
+}
+
+static unsigned long codec_vpp_freq(u32 session_type, u32 codec)
+{
+	const struct hfi_platform_codec_freq_data *data;
+
+	data = get_codec_freq_data(session_type, codec);
+	if (data)
+		return data->vpp_freq;
+
+	return 0;
+}
+
+static unsigned long codec_vsp_freq(u32 session_type, u32 codec)
+{
+	const struct hfi_platform_codec_freq_data *data;
+
+	data = get_codec_freq_data(session_type, codec);
+	if (data)
+		return data->vsp_freq;
+
+	return 0;
+}
+
+static unsigned long codec_lp_freq(u32 session_type, u32 codec)
+{
+	const struct hfi_platform_codec_freq_data *data;
+
+	data = get_codec_freq_data(session_type, codec);
+	if (data)
+		return data->low_power_freq;
+
+	return 0;
+}
+
+const struct hfi_platform hfi_plat_v6_lite = {
+	.codec_vpp_freq = codec_vpp_freq,
+	.codec_vsp_freq = codec_vsp_freq,
+	.codec_lp_freq = codec_lp_freq,
+	.codecs = get_codecs,
+	.capabilities = get_capabilities,
+	.bufreq = hfi_plat_bufreq_v6,
+};
-- 
2.34.1

