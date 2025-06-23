Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3135E545
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750675880; cv=none; b=nzKLF6q7SeDGHH8h9Q64AR24eb2VIIlGmfTS5Hlr78WvWjARYKoPaVG6USMuKMUb2BHmk0AzS1oGjf4w6bidKycPruAjFq0kf8cG/Kc9FUKAjamnJWtieaHnikC6MQYWkcmZWD12TSguZs1mDHnz2hZ0cHWEcXbQ8by1/63Fgvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750675880; c=relaxed/simple;
	bh=3X0Q9xjYg+p0AxsYGt5WqAmwhSOqesmRvFdODnRFo/4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=K7GvWUR6gTSXpzEi5IgKMO1h0drzoF37JgCeoMTg+vbHngwl1JZEuglHmXXTbST9+TtRFC6vAaJHzdZlT0Cg21Mv19XwUzgHcoz7pFP5pfP6yeulVHI7D3L9VmY+uODecpEDZRNMRiBmX4cVz6FjJBTvCgTd1UPXU9oUaOjN9ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oKKBo8Tc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oKKBo8Tc"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N8Lhnk006106
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:51:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=OdKR+vnk3kqs0QLDcZ+yNh+hytijdA6SncW
	RFHlStjE=; b=oKKBo8TcUoRlDf3TRL4+u39fJ5i0PiZunyXRiQoGOfDfMJ9m7b/
	3kbQBnfxJhBq+1bUcpRNWCyyw1ngQ7vSTHe/BL8CwqdK46decMH11xKgQcSy9Owf
	Se4M1DFgwKM7jqKgtzIn+lt7wNjFJeSWYaCbp4CVWH//zFVeve1i9kqTmtyOM4hz
	OQRoHbgbN7wC1KoFi1ERRJ6+Fk1fdlKv9lqM2Le2Kk7kq8hVkq/wx4c3onwbVstj
	LI819VoTzbAeTdc4480MkhZaIZGzd426SijdXMevP1et6JdcQRHQHFctB0W2FzVW
	E44aT4EdHh+iYVldnNIjxYXdrK+EAlPmmnw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bg8dfy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:51:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d3cbf784acso1141010385a.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 03:51:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750675871; x=1751280671;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OdKR+vnk3kqs0QLDcZ+yNh+hytijdA6SncWRFHlStjE=;
        b=v8yGo0trIjnj26dEa5AqHKXhQUH1TuocjWL178HPa6TBf64VfKzu3DiIYBeQYEhfib
         Co0ePrjT8G9s47FQ373v2Uky10IPlAX1fli4NU1Kxz6nj7sjtqv9AJHJ0DgkZYtTOTjS
         dSom2lO2RsZFJBXQr9u2ZzMRcweK+tmKpN8j90FBLQUxkl0USk22YWMY49XfhP8kuFeJ
         9+KkJEirHegnRTo6yUtP6q+klNhU5z2dBkliTe/oPClD8b4bVB5tfNwixJf57xZISV8+
         yvT/574kJ1GciADTveGy8zQ2jaTAbqk5J5ZNoYpyZHE6MvgSMvrWTkRFx5qibeMRw+X/
         3A3g==
X-Forwarded-Encrypted: i=1; AJvYcCU8YtJqXk/qGnGojm7ACFiq7T2OQ8BcVmq6RB9oF5pZp8/73dXiLSJ8DDMQpS0vSEUBYdvXxu7QVbyygPk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvobyOEvFDPLJVKCSVyp/uWEETeqKB49oOd9WZ7QkhCO8xhCgR
	/NNklxZWipiz0Tlz7jZ3ESkF3JXLHVZ+y74hDskYGOsOUEsvoVOAxjle62sw7nLroG5Bec2yVs7
	yTOc4BBrlmypOMx3PdVmV8nsffl+c4iWtyU4nCNMKnSwtJ/7VNJSYZ94CknyaGihN4TQ=
X-Gm-Gg: ASbGncv5T0m3Pc4pzV4Gyr/hSg1LTQDhF1WwV7UT88GU9J6aMNPerXCwDgmPfHY0rvt
	D8fDMuon2ADyhI1nD5svpfkXwmjOPpxlgk6t6cdVpHoIUptq4C4Nin7OdVAlkkkGyEYqK3Q/pGX
	vJjhlrvNcpQKM6NXCSZncNywsgNSUr7vaIxahzoPCqoMsiNptaoRw3PyowTu1BLDQAAo6jG9uKD
	clboIad3hn/bnnGKG69XMq6sAR8OeppeXU9KwbwzRPz6ZPmDGgcvduRyrDlHX9hdWZEiWxDEGvW
	+sm9brHD9gCn9AY7TtL/37SiJ4srtyhugOetRS/7V1ukLqL6nwExXPXTlJP+iyWWNKu5gp1K36/
	T
X-Received: by 2002:a05:620a:4693:b0:7ce:cb67:1ddf with SMTP id af79cd13be357-7d3f99565c3mr1932112985a.49.1750675871509;
        Mon, 23 Jun 2025 03:51:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgKmYE2BKWOH77MPANcbMBiVKZNnLHTBy2ZQenxRjzrzBRykO4Ktk/+3Jw4XiC6T1w7HNNow==
X-Received: by 2002:a05:620a:4693:b0:7ce:cb67:1ddf with SMTP id af79cd13be357-7d3f99565c3mr1932110085a.49.1750675871088;
        Mon, 23 Jun 2025 03:51:11 -0700 (PDT)
Received: from trex.. (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45365af83easm100821835e9.25.2025.06.23.03.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 03:51:10 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/5] media: venus: Add QCM2290 support with AR50_LITE core
Date: Mon, 23 Jun 2025 12:51:02 +0200
Message-Id: <20250623105107.3461661-1-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 5LQM9W4j--qpYRSanKI1_-WvWuk2T82I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA2NSBTYWx0ZWRfXyWbXIzqks9xh
 vm4VhmcDxcUxlp+QwapZFwIQlJj7E9spZwC990d0nBd40bT29cybDiQ9y3ejgBATAf32BzlBKI8
 BIBMa6TahCacZXGXP/p+L60tND/NhNX54uKB/FuJP1pfy1j1auCXb64hNJnoKutnDBJhI5HjKXz
 b4xpZvhJXQghkOsRxoLsxViTtMzcTfqHNrB5293h7jTtNZMyDVTPEDiJD4O+WV+g62frLGYpRQ1
 DABOKTIbcpmHhRhNIxJje5oTpYFKS7F/26yNZ/P1H+YNl3zwgPbH/BRhOhMkWAt3X9xbze9PKp5
 OzY6+eHZL+PgU0yCTyjhNWvjeSfrm5Nn1T6QoXvrWVjJUSFp3CpEWL9eglMRzzu8wgyQos+stSl
 fV4GMaLf+yPUgYrR4KhrCCvDeWsgOrac5gxWAYvvTzjUkpiY2keaUxcgyim0Mg0XQfm54cEg
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685931a0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=6IFa9wvqVegA:10 a=vaIsIKZIAAAA:8 a=qk4D6dgNv6vegSoiKxYA:9
 a=PEH46H7Ffwr30OY-TuGO:22 a=rh-XPM1-DYv4t-UOgbwD:22
X-Proofpoint-GUID: 5LQM9W4j--qpYRSanKI1_-WvWuk2T82I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230065

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

The QCM2290 integrates an AR50_LITE core, a low-power implementation of
Venus supporting H.264, HEVC (H.265), and VP9 decoding.

The series includes:
  - DT binding schema for qcom,qcm2290-venus
  - SoC integration via qcm2290.dtsi
  - Resource table definitions and frequency scaling
  - Platform capability registration for the AR50_LITE core

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

 .../bindings/media/qcom,qcm2290-venus.yaml    | 117 ++++++++++++++
 arch/arm64/boot/dts/qcom/qcm2290.dtsi         |  45 ++++++
 drivers/media/platform/qcom/venus/Makefile    |   2 +-
 drivers/media/platform/qcom/venus/core.c      |  51 +++++-
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
 15 files changed, 482 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
 create mode 100644 drivers/media/platform/qcom/venus/hfi_platform_v6_lite.c

-- 
2.34.1

