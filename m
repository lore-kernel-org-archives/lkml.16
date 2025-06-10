Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C33C282FA
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 13:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749563131; cv=none; b=NDqIHlCQHbYMlni4HwbGLLyJVJLZ11KWUfNLdFra3CEIkg1HXRLmaBAGXYnb8pQuL16LVID8f1LWtmj6/8S4dfFSho7PCM5ENbNTZXheO5ziZYMbYrVPFWN4hBbfQ924Jg1r140/LEo8xPptue9R8NzTzoGlX/Ayr6QLi4x9kMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749563131; c=relaxed/simple;
	bh=dv3Hvk9p48gd7VFAefP+8+Vtb7cmVN0Z2O9TcNsN42s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ABG4AVq/2zVH7L7ZnB7/7gCUb14nHqLaszqJzNB0SepEcV61WKabePCw/ugLi1AzdTd1jPFzTTnAihmFHtqFKdDjRJStfQUfrRi/9aFlfGs/O8YER9WPPoEP/AWkRHWB0MXHrjJH5/wXMaQUOPFAbFIjeqteXdIggvMyBOiOhck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N3FtDsyt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N3FtDsyt"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A8wvjE013805
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 13:45:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xH2KQv7sgrK758uLs/6IyR
	Mr+4xC8wLvLt9nlR+5ejE=; b=N3FtDsytXAVpxCWCKXP2+Q5k5L9my8aJNzN5Ht
	CPm3XspNcY9tcYLDtcLcRto8wBwmv0iwNhs/T7QzQ1dVpJOaO4A0V+VAHQ/AaGov
	F3gtYW9fkhJGu476Igvd5in7fzEO4zMAz1BIVhRtCGRNVWUIPTAbIqZugJmfb1BS
	7hlEX0mWkQQzdbkuxWC63YodLi4t6fQylCEMkPcCHbR7URu8FMLMWJso49Os5jQb
	WHd77RMMYvCejL60RvVynfvE+SmjVn91l96mYo4phST1/NqypRhvl5ZQStdraFfI
	xHfVsl9yjcgPYHADV2y2BDUoUVSBIaUTdMmuD41cR7SzX3EA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dgxsvw2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 13:45:28 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7429fc0bfc8so5333649b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 06:45:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749563127; x=1750167927;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xH2KQv7sgrK758uLs/6IyRMr+4xC8wLvLt9nlR+5ejE=;
        b=vM8ySDSn8MBcF6Lellg2bg5m8wPVsXoj7TFF6VXwI55EXXX2LIb3diRk0tGqadE4k9
         Gy3nyzb+L0uK5AqC6XeFvSEYuoMBOgBI3r5DR2W9MDdwKVoF+pjXRavyqEOg4YPSTjX5
         I49RDbGGYiCPBXBAA/ixumR4nO6JmojcPo12Q5dYFpvOIStc+5iZZuSa+e88bzGKd23b
         YTNGMpF4FdZbbmt//MpmTQnjd0hudbB/nJVFWB3BG244Ovf2jBLlpwxuSwrhEUarhsEv
         iXZVBzLWG+aCpEXDRMQG2xmuQvnYfiQ9yvTREo2eh+m0ehmuNqyay9o9W3f+QMXixlUN
         /2/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVNHsDVpg3cKBjy8HRj0+W6Z8TwBQyt4HyEwQg7xxGVZFK0Cpxi++YoEh0meO3HanBJEiWbbU1yvBxrSLc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzqh+7p0NCnqQUaucrGLfWNfaBnrUUOIlnOyh5ltmb7xuvzphd
	m8criZeGpYtIIp81DA3loA43lA+azOVrPTdkzL0ZIvVkr/vN/q+12Qlf904VrMAgVtHzCKKA3B6
	vEQnLCXq2osrF+K2cvDexxasZQadrcwMiSIrtFp0IeTPHLcKOf2dNV+bVXgF9iTOj/N0=
X-Gm-Gg: ASbGncuI8CUdlKQfDKHm4uTP/ibfDKiXLVlS/C4F4EIj7lIoJVSVCZ5sVuy8mr3o+CT
	NA3YseXKmQVILIYgIUQGS1nTcIMwasCRtsc0DLeEhEdbcINxqDTbNsaa1ttBo+cBCFVLgqMqKfn
	VC9mlempWi2Qn1e1jSVT2P8YRQvbzxw96ykqjp8uZVY+wPaEAxG5t+cNadZC3VPzEug504pGuAI
	3IElFzPSubS9YhYPIMXWC314qMeHiHdieW6fEKHWJA1J+70TAcbHbJMFs1ccrEV1QhkROEed57e
	vtUwWjm+pwmN0W5fVTb/bklm1ixUMLmVMx9MnpELTkgHBH5cmde2S224uEpiupBa1iu8h46R1fk
	zEY+iO6veCPcrAq37Nj1H9y6HHDLiUYvfIjV4AqqFSpt494y6Y3axh5Yn1g==
X-Received: by 2002:a05:6a21:6d92:b0:215:d64d:412e with SMTP id adf61e73a8af0-21f7698b308mr5987081637.20.1749563127481;
        Tue, 10 Jun 2025 06:45:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGcARb34ssWxbNot4ia6+tBWBCtiJuSosdEn5XdfGATdAMmEq5BIaiIvEbLrX9hwPwFyDoGA==
X-Received: by 2002:a05:6a21:6d92:b0:215:d64d:412e with SMTP id adf61e73a8af0-21f7698b308mr5987045637.20.1749563127072;
        Tue, 10 Jun 2025 06:45:27 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5ee70085sm5858107a12.25.2025.06.10.06.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:45:26 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v5 0/5] Add support to read the watchdog bootstatus from
 IMEM
Date: Tue, 10 Jun 2025 19:15:16 +0530
Message-Id: <20250610-wdt_reset_reason-v5-0-2d2835160ab5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOw2SGgC/x2MQQqAIBAAvxJ7TtgEE/pKREiutRcNNyqQ/p51G
 ZjDTAGhzCQwNAUynSycYhXTNrBsLq6k2FcHjdpg36G6/DFnEvroJEVlnXGBLGq0Bmq2Zwp8/8t
 xep4XajbhiGIAAAA=
X-Change-ID: 20250610-wdt_reset_reason-7a5afe702075
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749563123; l=2858;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=dv3Hvk9p48gd7VFAefP+8+Vtb7cmVN0Z2O9TcNsN42s=;
 b=tHyhZgb3CmEiZAspeTy/FvdJvh94GQqCLJKDhTNqSiLazj13Eavw/gBp8apubAnx0OAA7Inxr
 Dj7buW9eM+FCyecTz0aKWzbwrYVQE/nZw4Je/oCi+HXeN6kUfdhU4HK
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: gZp7yC_gXD9tu59o7ovBtL6OR49frFuZ
X-Authority-Analysis: v=2.4 cv=HMbDFptv c=1 sm=1 tr=0 ts=684836f8 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=-Vf3EJXieAsgESLsksMA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: gZp7yC_gXD9tu59o7ovBtL6OR49frFuZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDEwOCBTYWx0ZWRfX6zJ2Db6+yBTo
 9cJGyGFPf78Fd77mmhYA7x/tV1dxXhrxG9EgF0CC5GPpqet9NEHdP/udzcgJsSDg53XzSkYIvnO
 ky1v1S+ZpHIhrLHGMfFLMUIyoHaG/J/NT+WwfwJt3/mvNSmh9gXgrHgYofGO6qTStq1w++yMSAX
 Ys3eQ3AUGwbiRzouiFhTkAppngmwqQXjotEug1APXMOTznDyzWidhzCKMCDib6nJlxcOxZUv2R1
 2JnBH5A4MIxYGDr9c5iC/5h/2PzZk0vOkzsDieqca/eXFn3Ubfz9ii39uAyH12uBspIMhz2c5rJ
 aIalPnb+OQN+Ax02jaWiq25fET1foKK6dd464eNvtAXfg77niUQTsul9YlR1WHTkgr53iukBOP1
 WQyH6xnoLHvxphkF+30JglugjBwHJD8L5gttV6/hCusyZX+Rp+hYPyVmje6HP56eQFdMisUi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100108

In Qualcomm IPQ SoCs, if the system is rebooted due to the watchdog
timeout, there is no way to identify it. Current approach of checking
the EXPIRED_STATUS in WDT_STS is not working.

To achieve this, if the system is rebooted due to watchdog timeout, the
information is captured in the IMEM by the bootloader (along with other
reason codes as well).

This series attempts to address this by adding the support to read the
IMEM and populate the information via bootstatus sysfs file.

With the CONFIG_WATCHDOG_SYSFS enabled, user can extract the information
as below:

cat
/sys/devices/platform/soc@0/f410000.watchdog/watchdog/watchdog0/bootstatus
32

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v5:
- Rename property 'qcom,imem' to 'sram'
- Use dev_err_probe instead of dev_err
- Link to v4:
  https://lore.kernel.org/linux-arm-msm/20250519-wdt_reset_reason-v4-0-d59d21275c75@oss.qualcomm.com/

Changes in v4:
- Kept only the WDIOF_CARDRESET and dropped other codes (Guenter)
- Renamed qcom_wdt_get_restart_reason() to qcom_wdt_get_bootstatus()
- Dropped the device data and describe the required information in the
  DT (Konrad)
- Link to v3:
  https://lore.kernel.org/linux-arm-msm/20250502-wdt_reset_reason-v3-0-b2dc7ace38ca@oss.qualcomm.com/

Changes in v3:
- Picked up the relevant tags
- Dropped the fallback compatible handling
- Split the driver changes into 2. Introduce the device data in one and
  extend the same in another for the use case
- Link to v2:
  https://lore.kernel.org/linux-arm-msm/20250416-wdt_reset_reason-v2-0-c65bba312914@oss.qualcomm.com/

Changes in v2:
- Dropped the RFC tag
- Reworked the driver changes to use the syscon API
- Link to v1:
  https://lore.kernel.org/linux-arm-msm/20250408-wdt_reset_reason-v1-0-e6ec30c2c926@oss.qualcomm.com/

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

---
Kathiravan Thirumoorthy (5):
      dt-bindings: sram: qcom,imem: Document IPQ5424 compatible
      arm64: dts: qcom: ipq5424: Add the IMEM node
      dt-bindings: watchdog: qcom-wdt: Document sram property
      watchdog: qcom: add support to get the bootstatus from IMEM
      arm64: dts: qcom: ipq5424: add support to get watchdog bootstatus from IMEM

 .../devicetree/bindings/sram/qcom,imem.yaml        |  1 +
 .../devicetree/bindings/watchdog/qcom-wdt.yaml     | 20 ++++++++++
 arch/arm64/boot/dts/qcom/ipq5424.dtsi              | 10 +++++
 drivers/watchdog/qcom-wdt.c                        | 43 +++++++++++++++++++++-
 4 files changed, 72 insertions(+), 2 deletions(-)
---
base-commit: b27cc623e01be9de1580eaa913508b237a7a9673
change-id: 20250610-wdt_reset_reason-7a5afe702075

Best regards,
-- 
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

