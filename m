Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C892E7623
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 13:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750946381; cv=none; b=P6W/qFa1dmpCI0fGrJXfYRIQyuDC11k1uM84FdwyT4jLCo5zVTFEMXmkoVEzB4VIfO5au5+5ttlgZX22ou4hyAnC18RVdpgyS9G2j+J/TzetH9emX+zO4dTUy8vDM5n7CGL7IQCi5QyDsCsO5KQ/kb8f3e7Ec5FFW43DoBcJ0vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750946381; c=relaxed/simple;
	bh=kmEGhYciyMMp4G/GxiAobkj/2CDHouIK6RTlTVRsPMA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LkQnVgY6mVyaHtofnpGYEqptJCYEqeRr6xEdXq76hnj12EroSBwkB9Gy4RRIpGQmC+Fd7SQ3hfMnzm2C2aKNN0U+pdfpS/oUvmICNwcltc5xb4+gLgQfW2n6zBTt57FK0SEXHwQu1p5KEHAQlluCtS/Co4nR5zjq6btsMpqi2JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o5PkjtLx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o5PkjtLx"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q9x1kC013644
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 13:59:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5tgkYFTM5Xrw95Ff69bLBTB8QDp/Y5pR5JN
	HIoSX3ys=; b=o5PkjtLxjpIJg6ia2CjX17OQPVrTV/c0zNWZH4arCQeXVAMHqxO
	GHkuXWB4OmgpW/ZurUn0UIeJ8/UMU3dranvAhqLDGTcTBDJEwy6UBc28vpDnNgjt
	myWjX3AuMWGIvO3KlRuLh6fBBkgJrlwiemKVGf0vScr9zmpFXUprOzSE7dKgKyyd
	daJaUfcBMBUOI1cISCYltTM1IfMKf2jUdhtxtoeMR5/b2soSB+FMsm5RUHu0CkHl
	VdR1xYzHWwxaHUIbvXi1r/KlqCH6vyR/3pQtNN/YSuhCBsI0cDqU5KaayK5tXi77
	grdKvjH8QKTeeXfQo7nGkKAzuvZxWf4esYA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bgkgve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 13:59:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d22790afd2so137987485a.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 06:59:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750946377; x=1751551177;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5tgkYFTM5Xrw95Ff69bLBTB8QDp/Y5pR5JNHIoSX3ys=;
        b=uSHJvOrfbZ8/ruCvYp2xi+Eq7nb/SLemwvKKHoxeokc8OD4kbX1534eumF13jFYD37
         lNWv83ITALi1kiNZsFXpSG/TzFrim45IlWHZLm9HXr0F+qWLNBVlxCooscdC0Cixt6bj
         5+ft0LsdiTxSF0egQjPW6lMh8+K9NWyPqnPy98ejxp27SHIUyyw/EOuXFAAXP/qCo78N
         fv6zl0cTqFjBPAlIGPWhqhtlzMhwl+1ySLm7uIeTaGSrJpb1sL2IVZQA3/tFtHNsJvd1
         16Ap6MUR0mrI8o5jmEppvQBJGNso3yh8m3fQQJVQKxFNeTqckPhRcoW1uOs7mHIZfVes
         EMDw==
X-Forwarded-Encrypted: i=1; AJvYcCWLO4xcWBIMf3j15+hCfxsYzHRt7nQWGnbRaf5W627VA19kYqfO8lvs6hBGdRdtM5AdF82z2z+Ei+zYW48=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+OrLwxp5NV1kSUP+IelXqf6xwFFIWQmadoF1quOdoM3eoKed/
	I35cM+2dn/DXvsLdHFYghd0WSG7r1WGmqci1HOfydLZCOMMN+l5DqRxCUWPCv8qebyBTIsr56BG
	wknsZJHBqa6SdgzZgQDOIBuCzBzBfcYaKTU2hprFOptHTOHi9l6iFic5Cg0xWKL8vrlo=
X-Gm-Gg: ASbGnctez1FHlbYJn9IiXcrOAMiyk1alCTvZ7j3S1oe7koduNFc6wp4uxMIzbiYjqFY
	7z9vAOKzqofncIGPSveWQby0vRxp9+A/7E9dpOynfRpaytjEmKzHWRpPOLXXF43aDl0ZK5COdl/
	QYGsTmx2yXhsdjzFrc9dFuAaC9AK4ExJcIINAVqX9w+y1VIpzhklTQeQuISfaTvZEwh0hfOqQZC
	hHWz4O4VAUwjBgacYznTN0LgMkfCmpH3qJltNsAQC4AXlOqG5j77vLnTMBxG8P6Hgrv4syTzBhY
	nfgGe87gWoy5V+EOqEoOxk3FG/XNy2xeAbVWTJWmfHSs5ogE71PlpU1gU2ravP6nnsO585k2snn
	9
X-Received: by 2002:a05:620a:c4e:b0:7d4:29b8:b573 with SMTP id af79cd13be357-7d429b8f1f2mr955658885a.30.1750946376571;
        Thu, 26 Jun 2025 06:59:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHa+vixNwigHwEtVGLKHaX1GvWyXjxTDO3Co4S7iTaf40s0SAmzfWX9ACUxorf8rQ9eiSSNsg==
X-Received: by 2002:a05:620a:c4e:b0:7d4:29b8:b573 with SMTP id af79cd13be357-7d429b8f1f2mr955653785a.30.1750946375894;
        Thu, 26 Jun 2025 06:59:35 -0700 (PDT)
Received: from trex.. (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823c57d7sm53723365e9.40.2025.06.26.06.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 06:59:35 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, krzk+dt@kernel.org,
        bryan.odonoghue@linaro.org, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, mchehab@kernel.org, robh@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/5] media: venus: Add QCM2290 support with AR50_LITE core
Date: Thu, 26 Jun 2025 15:59:26 +0200
Message-Id: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: T4i_csfQ6FamgfPGWwgHUdK8J5e1Ydwv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDExOCBTYWx0ZWRfX/MGAM5mv5guJ
 0OLxR7NFlZkFbhNP+u/RyGhA8I4A0ae0dRZMRODj56yvTWNKXEX/NflEZiv5BTXdXbqF4VfXnuK
 9cBdEFGGrCHCZIG72uJ8OdPcS07fqwUFAuf2tqvHO4OBEMlMhA39CaSTYsYk0+xmpmQsDt1mdD1
 Z9T1xIFuiRnBEyMw5IzmPQxR/6V5/b4UPdqkvOJCZ9Q+Jl5hqShqUzzLzrOzbW2rjZGS70bHO7L
 gy88mzw7wvbXBabsYnS8W07/PxQKEtX8niQ3MKAQTlF+2rvxFOM7dejEI5YDSquZcCRR2CAERkb
 EYMcVP3MXfX+jjTlfdb4+PpcbVvW5Pu5H0395cKsCdn2t1K36OexWR1gZSpn5oa/dOLT6+6ZD76
 BjtsYgcngFU4mLUvCEqyicvBpXY6sgn/vC7e8sbKF+L0uhRyXoB57Dql7Dh9dSuXdq5U86Bz
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685d5249 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=6IFa9wvqVegA:10 a=vaIsIKZIAAAA:8 a=7WrQi52fQBeieaC-wGsA:9
 a=NFOGd7dJGGMPyQGDc5-O:22 a=rh-XPM1-DYv4t-UOgbwD:22
X-Proofpoint-GUID: T4i_csfQ6FamgfPGWwgHUdK8J5e1Ydwv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260118

Changes since v4:
- patch 1/5:
  - added reviewed by: Krzysztof Kozlowski
  - updated example section
- patch 2/5:
  - added reviewed by: Bryan O'Donoghue
  - Fixed Co-developed-by order
- patch 3/5:
- patch 4/5:
 - removed encode-node (userspace exposure)
 - fixed Co-developed-by order
- patch 5/5:
 - fixed venus register region
 - power-domain-names: one per line
 - clock-names: one per line
 - fixed interconnect tags
 - empty line before subnode
 - enable the venus node

Changes since v3:
- Fixed schema commit subject.

Changes since v2:
- Removed IS_HFI/IS_VPU macros
- checkpatch.pl --strict fixes:
  - convert macro to static inline to avoid argument reuse side effect

Changes since v1:
- Added IS_HFI macro usage
- Moved schema patch to top
- Fixed commit messages

This patch series adds support for the Venus video decoder/encoder block
present on the Qualcomm QCM2290.

Only video decoding is supported in this set - video encoding should
follow up in the coming weeks.

The QCM2290 integrates an AR50_LITE core, a low-power implementation of
Venus supporting H.264, HEVC (H.265), and VP9 decoding.

The series includes:
  - DT binding schema for qcom,qcm2290-venus
  - SoC integration via qcm2290.dtsi
  - Resource table definitions and frequency scaling
  - Platform capability registration for the AR50_LITE core decoding block.

Decoding was verified on the QCOM RB1 platform using GStreamer with V4L2-based
decode plugins. The following pipelines were used for playback 1280x720 and
1920x1080 H.264, HEVC and VP9 videos from https://www.elecard.com/videos.

[H.264]
gst-launch-1.0 filesrc location=videos/xxxxx.mp4 \
  ! qtdemux name=demux demux.video_0 ! queue ! h264parse ! v4l2h264dec \
  ! videoconvert ! autovideosink

[H.265]
gst-launch-1.0 filesrc location=videos/xxxxx.mp4 \
  ! qtdemux name=demux demux.video_0 ! queue ! h265parse ! v4l2h265dec \
  ! videoconvert ! autovideosink

[VP9]
gst-launch-1.0 filesrc location=videos/xxxxx.webm \
  ! matroskademux ! queue ! v4l2vp9dec \
  ! videoconvert ! autovideosink

[Fluster]
The H.264 decoder was also tested using the Fluster test suite
(version: v0.4.0-12-g33566abd0964).
 Target: GStreamer-H.264-V4L2-Gst1.0, Test Suite: JVT-AVC_V1
 Result: 126/135 tests passed
 Failures:
 FM1_BT_B, FM1_FT_E, FM2_SVA_C, BA3_SVA_C, SP1_BT_A,
 SP2_BT_B, MR6_BT_B, MR7_BT_B, MR8_BT_B

---

Jorge Ramirez-Ortiz (5):
  media: dt-bindings: venus: Add qcm2290 dt schema
  media: venus: vdec: AR50_LITE video core support
  media: venus: hfi_plat_v6_lite: Populate decode capabilities
  media: venus: core: Add qcm2290 DT compatible and resource data
  arm64: dts: qcom: qcm2290: Add venus video node

 .../bindings/media/qcom,qcm2290-venus.yaml    | 127 +++++++++++++++
 arch/arm64/boot/dts/qcom/qcm2290.dtsi         |  57 +++++++
 drivers/media/platform/qcom/venus/Makefile    |   2 +-
 drivers/media/platform/qcom/venus/core.c      |  50 +++++-
 drivers/media/platform/qcom/venus/core.h      |  11 +-
 drivers/media/platform/qcom/venus/firmware.c  |   8 +-
 drivers/media/platform/qcom/venus/helpers.c   |  80 ++++++++++
 drivers/media/platform/qcom/venus/helpers.h   |   2 +
 .../media/platform/qcom/venus/hfi_helper.h    |  10 +-
 .../media/platform/qcom/venus/hfi_platform.c  |   2 +
 .../media/platform/qcom/venus/hfi_platform.h  |   1 +
 .../qcom/venus/hfi_platform_v6_lite.c         | 148 ++++++++++++++++++
 drivers/media/platform/qcom/venus/hfi_venus.c |  14 +-
 .../media/platform/qcom/venus/pm_helpers.c    |   1 +
 drivers/media/platform/qcom/venus/vdec.c      |  15 +-
 15 files changed, 503 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
 create mode 100644 drivers/media/platform/qcom/venus/hfi_platform_v6_lite.c

-- 
2.34.1

