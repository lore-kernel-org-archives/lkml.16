Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E633F2690F9
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 08:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747643665; cv=none; b=FNbrBSugQzKDfAJYBGxBGz6MAwQiN7dE1dgCiQHgkFZjD6ZgNsrq80LKONd8y0qVrbj2dHposhX1Mz1TMTidKjzWDzqoeRGCZyah003+7WB6eEOzVMfBf0pFfKs42Tq3pnPY+gILVAC5ZBHd8JFTH5z4Ozu7zFOXBde9zdOvkp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747643665; c=relaxed/simple;
	bh=xRHx5bpthJXZJX1dxAfmzDGrwHpyIUrMpOLNkFZ77dk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eAIuHkMl5tHMuJ3nmqGO9NcxtGWpnXmBLmTiWTXrFGPwi4OfU2dJqcYQp61Y1siHngmGn2hbVMIaJNbOK0pm9WVZGgFcnGY7NPoI1T0P8IJT23WinVmrf+2A3ltGt0krYws1uyCzNUTWjtmmJPOdFCaGySS/amTS4f6LYYMjO90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fVieBo5e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fVieBo5e"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J4GGrD016085
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 08:34:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Q4/R4hgjdbOtO5ZJ9iYZdA
	b7zi3KfVSbOE7lczAwJOw=; b=fVieBo5eiSE+tjQZvfh3HfstsH7I/jIbwYsl1G
	/CTEyXvnanoArKXPu8jmQbrRcSntfpAP/nv5CoEmKeg/l7P5vig6zRvzsF3Q7lAu
	wPIxUUBTrBedr+sWqsruapjKlQkFwEPuS55BvMBFjAKfB7ySrOedO2xD03T9i1c6
	Yv03YDQr7kH1mAxWUxvG8OPDyBzJChuGaU28i/Jx0fwCxxYpSo/3Dy2xt7t48dtX
	V1hAP4khsN4ECh4TiojbR5EoRpcI6RQ3zrddfFJaMQk3YH0jD4p23hh9ij/PoIC5
	WGRy3dQi72ygZaD0J+gA/yfyG0gkAQDsTQFJLCnaZ7SeT/8w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46qwengquu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 08:34:22 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7429fc0bfc8so2920120b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 01:34:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747643661; x=1748248461;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q4/R4hgjdbOtO5ZJ9iYZdAb7zi3KfVSbOE7lczAwJOw=;
        b=UIiJoglkVOnKVuWMQZOa+pvhBWsxWRyOmp6Sj5HHNcSJHO+heYBL9C6mrgDG81kUtf
         nEvSKsZFlF5dZ7oH4dC5YmVmefCE5kHTEQYbxd071O9z02D7ZgUDwkhF4rX8Alp6GA6w
         AQT5sQYe5ZLgt2foWZfovf4sb3Hloo38c+K+hZLq3kB2eVRUoeZxRhm16P2OUeq0rt3M
         USRKsM1rXqPntI1TX9ro89iYs00cxKQ/KteylUI13wj5uX0NqKM5Tq2vRHbIjaSBHv6D
         LHdPqUApD2Ei3Bm4XO5yvqFbBLwJXdOeQxRxEAqWFVcAp1RY91kuE+ziXbBIR+1HJUqr
         s0JQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4/hIYSYlITGM1TH9fmB5F3Gy2nWkylkBmzodlMS+ERJ4iJC0A5V5nK0a014jjgnhQx3rJhswU73fjcxo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3tuHeyzTQxWiDjhv4jnQV9VmeGNC3S+M6vDd/T7LmuxPn2W7a
	lNu8S02OYuUGc4yUoxKXV/TUM0WuDZpnIlfZ+vOac+Xsk0gvoWQYoSd+QfnkK8BlIUhpF5kkrez
	nutEYa1jiKSO7h8BWenT3YK9GM4kaKo1qOCN0cwEvtUx6tZz5E6x17A/QY9JOXAdnr9U=
X-Gm-Gg: ASbGncs1kMTg8/TmNdXJO75HL9JbgqSJVJj/Zrvg3KmAhPxUXpM1VXuSZMx07Qdqed9
	3ZFwTR6nfMAiVAA0kxtsFnaL/c3+S3NrovDRTU2MluSYVz1AY/jUXHv9ZGPyDhQq9KOIUyyTTN+
	kTlIa+1aNEnbDWyHJqQ4RBiYC8Xh3TuZedjpVXcMQSp37nAq2cx36fAYOF+FW0r8J4OPRj+6Als
	yPOQ0ngzvuLiFdF0kpQcYoYamCbAcga27MECBzzxM3kf9o881a+L5gtET4xhOPT/6e0z5cuxcHT
	rw9NPAsQGvDzlvtEEBaknfr1aMl5R8ioLGsP/Z10PMnNW6tbO5asBHmROGnPO8DUN2rUecry/6J
	Nmr+YEKTHalumrFcRmt1C9au3kYss2D6T/0HoxxUZhkpVfEk=
X-Received: by 2002:a05:6a20:9c9b:b0:215:e44c:831f with SMTP id adf61e73a8af0-2165f5e3ec6mr18557723637.4.1747643661363;
        Mon, 19 May 2025 01:34:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmFXCPLLPZlhKsFZLGIVodijRVqwRIbYHCJLmZeP7/tDMykTwjAOBThLdU+8Up6APXTwT7og==
X-Received: by 2002:a05:6a20:9c9b:b0:215:e44c:831f with SMTP id adf61e73a8af0-2165f5e3ec6mr18557696637.4.1747643660966;
        Mon, 19 May 2025 01:34:20 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf5a2cesm5705475a12.9.2025.05.19.01.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 01:34:20 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v4 0/5] Add support to read the watchdog bootstatus from
 IMEM
Date: Mon, 19 May 2025 14:04:00 +0530
Message-Id: <20250519-wdt_reset_reason-v4-0-d59d21275c75@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPjsKmgC/x2MQQqAIBAAvxJ7TjCzyL4SEVJb7UXDjQrEv2ddB
 uYwE4ExEDL0RYSAFzF5l0WXBcy7dRsKWrKDkqqRWnbiXs4pIONHy94JrJRRlWnr1baQsyPgSs+
 /HMaUXkp9B9NiAAAA
X-Change-ID: 20250408-wdt_reset_reason-e12921963fa6
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747643657; l=2559;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=xRHx5bpthJXZJX1dxAfmzDGrwHpyIUrMpOLNkFZ77dk=;
 b=sS4rTpgu7WqLlxiIvg3siGTsAKRswXQ9h4Dczgiq5t79y0DssODAX5JW5eo2s/okZekCjTWjb
 hAz1I51+0T2D4xPsqRkhbkWCzEzqzuiga20VB1+YSYUyFgt+Gy4N/vZ
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: pswOS1q_HayXm5X9-MGo3SIbQ6KQpa_R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA4MSBTYWx0ZWRfXylgBzUYs5KX9
 foB1UeBKK8iXX3Zv4mqvYpPEAQdOlxdW4VRdI4b38Hx66XoSkVwR63pD5ukWdK4hqRdxUtFugkB
 PT6bChTMiZQ9/cuYoY6nzII1OnrEBkYKbGoWTFoixqoIdVUOfp6iCBut2hptL1Y5ZshpkqmiNnc
 IbvWBPBrm71MhFI0Pt16TeIrvMJaJAMbOuWdTe3uejLiBQx+cfKyCfTEeIa1oKeFjwxNCEnD1+h
 C4ITgRbZFKVd2GGYtyYWJrvlWmLcJXb7EYixuTMnqbe7nrzxFF7lAayl4FlDU/LbzhGW9E9uLZn
 0hzO57+MrO8mzeD0RQac0VCyY9EzAsB5YMjqeikDhE/maBumwOMtAvLbsJ+DMLYfsTjCSpkWzd2
 Zm0lc9mV1MGTcSXFOXD5TCjpoUOu42sHpgd3Aj9uvS5oGiSkvTb397fof8Ap1InmAb1f7m+v
X-Authority-Analysis: v=2.4 cv=Wd8Ma1hX c=1 sm=1 tr=0 ts=682aed0e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=-Vf3EJXieAsgESLsksMA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: pswOS1q_HayXm5X9-MGo3SIbQ6KQpa_R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_03,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 clxscore=1015 mlxlogscore=999 impostorscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190081

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

cat /sys/devices/platform/soc@0/f410000.watchdog/watchdog/watchdog0/bootstatus
32

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v4:
- Kept only the WDIOF_CARDRESET and dropped other codes (Guenter)
- Renamed qcom_wdt_get_restart_reason() to qcom_wdt_get_bootstatus()
- Dropped the device data and describe the required information in the DT (Konrad)
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

---
Kathiravan Thirumoorthy (5):
      dt-bindings: sram: qcom,imem: Document IPQ5424 compatible
      arm64: dts: qcom: ipq5424: Add the IMEM node
      dt-bindings: watchdog: qcom-wdt: Document qcom,imem property
      watchdog: qcom: add support to get the bootstatus from IMEM
      arm64: dts: qcom: ipq5424: add support to get watchdog bootstatus from IMEM

 .../devicetree/bindings/sram/qcom,imem.yaml        |  1 +
 .../devicetree/bindings/watchdog/qcom-wdt.yaml     | 20 +++++++++++
 arch/arm64/boot/dts/qcom/ipq5424.dtsi              | 10 ++++++
 drivers/watchdog/qcom-wdt.c                        | 42 ++++++++++++++++++++--
 4 files changed, 71 insertions(+), 2 deletions(-)
---
base-commit: 8566fc3b96539e3235909d6bdda198e1282beaed
change-id: 20250408-wdt_reset_reason-e12921963fa6

Best regards,
-- 
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

