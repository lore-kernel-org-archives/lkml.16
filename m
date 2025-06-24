Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C53914A4CC
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 02:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750731244; cv=none; b=P/QBZnbZHTQ4WtdS+VBjqFvc+TvCW9G6G7l0Ky1eWWiYAq+Cz0tkR8pcVaYGIMTgss7EVXdC61aE/50yTrg4TgXVswq+Ial/RK29tmTKhQugH9PVNlhn31rWXQ1nh0qSwtmUu8l5YkPILDILP7QcMXVGROtwTOMo1N45mVsvBh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750731244; c=relaxed/simple;
	bh=tjBly2s6mnuGi9HgjrC+Tb4IXYnpF3vQanWgu9BVuLs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CQ3N493IDRBw4cDN2CAmmYZcFss69xxxg7lMMaCOXwHDgdmdXn2qm5FOeYeKxsi7/xhpGTIEU7dg5aCMEojA4xI4x5zMVa/8uR4x/dJT6LXo0wSz0QLcmcMhrkFVtZRePBvFyQv2jYDEcz/wOlR5oQk1glWEQdVVHDNdUZEYXLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iPHbmBtp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iPHbmBtp"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NKlZe5015564
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 02:14:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kHnh6r0zdR77x91Ki7b9UP
	DR7LpEx1EneI2WJIuSQmo=; b=iPHbmBtp7gr+r7qSK1vUgPpRYJZRGIxJQoI4MG
	UCjGDMOqmg7klVEaDxwYG7ha39CFlJP0m2BLgbHvVzNX3kuuH7t/MU/bbiaUrD15
	bqIH6uwmIJxO21T9S1QbiZre8eV1479Ie9v0/Qu5e/FYS+bHi3UtM54e4+yEjqT7
	DziGCjG+0+2NQC5J9ceu8gjMKDEMvfikzKEmHU+MH7nrQr7Hd5sNFcHv/eINSRH/
	tRcDLjotdc7JZy96dhYpPEmbuFPhaF6squYydgbjxd0zbhAJxZvrcMjNqRUlQDCk
	N7ZAyhPm9FUu14qJv3RAJxMcHPCdYusGldnlN+FGO9wzSTJA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqgy42-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 02:14:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d413a12847so290798785a.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 19:14:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750731240; x=1751336040;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kHnh6r0zdR77x91Ki7b9UPDR7LpEx1EneI2WJIuSQmo=;
        b=UuxYGM0I76IllE+zNJ3bzQ2pLOtS5owqgwcqIvW4x/a3LgpCsVi1pN1X0cTNJ4vHkR
         VrP+0b3sZDJYDDW51Xs25wK1wHZ3px25NSupu6I3Rwx9Q5b6M0EUTDjfSqqbD8k1rmgA
         CO3lt4ctcI2h97kdStkxOHFsfKADPSEM1iDpFjCf9pBiDxApvgEHD9+I0EZ/UiAD7lDZ
         X6YI+Esk4zPQMKtF8s0I5X5ufZEpG0/3VPoQ7K8G1eafoXWY50Z7nQqfv4dtOhFlvmJj
         H3m/DR2FvcOFOYQm/IHldv/zABQ3OeoJjIE89LppQOQli3cCZvMSYFRknNRmHeT4KUHg
         kFfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaFy2Tc8MLcnhIHMaQYHftifHSxYWRTJW1GML8dx7Y9vwTUc7F2gW/4UtliSr+ENZKbkYkTkvOVjWSW70=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVxl7g5S319/oZuBNiJ577Bebfy5nZEgrWeYbVe9pq6BucnDx+
	dIRhzSXVjn01w62JWIpjIzL/L1dQtT9E1matLGawd0hg1hRb+Ii3IbK8ijdpIWjNQv0KOlw8Z2B
	O1A9uh9P2mTD12bL4I2Y60lSX3NKelUUtiMhpOt0TJOopHZx9ChJAQMp5jnK80f9H3aE=
X-Gm-Gg: ASbGncvJLiTlRh43ffcGEC4DdI0To1fDG/++xbUBQig5Qd5tAo6BDNrMUxmfLV70Fjt
	Gjni3/c0Wrn01gRZE171k42f9+W9Kc45NWLSLG0TSe6NbdCNeqiMm+0SA3iFpUd0trMzvcM3UTO
	w9LmQNBuiBs07RIUFqA1TB6SIebvqtMSeX0i9Z1I+83gC9fbGradXw4L4CgvxPMqqUIWlELfK0+
	pxO9A6a2P2czZ/Avfz23IFNv+ANpAQP2uuhqBwmMLlyEjbP4QMq3zF6+yKk/vpEPDZJtWTJ7pe4
	KbvGRIcDu0gdywz3aWMqUHOqPTBOyAp1x+WxkOonL0BzNxk2x0UF5CF7gfLMufT580tIkVWYnbf
	RYVRZRfn3wqjSqc3HKrOyRdGpUdLLvbX6GR8=
X-Received: by 2002:a05:620a:a505:b0:7d4:1ec9:d267 with SMTP id af79cd13be357-7d41ec9d270mr221708285a.11.1750731240464;
        Mon, 23 Jun 2025 19:14:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGjS5BY0iJ2H+V1C6DQrHqElw247aJkhWGwm0mvZnGfA0ak95N5Osv0qEtl4IV8Urb6agVpg==
X-Received: by 2002:a05:620a:a505:b0:7d4:1ec9:d267 with SMTP id af79cd13be357-7d41ec9d270mr221705985a.11.1750731240081;
        Mon, 23 Jun 2025 19:14:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41446e2sm1637764e87.32.2025.06.23.19.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 19:13:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 0/8] firmware: qcom: enable UEFI variables on Lenovo
 Yoga C630
Date: Tue, 24 Jun 2025 05:13:51 +0300
Message-Id: <20250624-more-qseecom-v3-0-95205cd88cc2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN8JWmgC/3WPzY7CMAyEX6XyGZf8kJRy4j1WHEJxIRJttnaoW
 CHefVPQXlbiYmnsmU/jBwhxJIFd9QCmOUpMYxF2VUF3CeOZMJ6KBqPMRjXG4ZCYcBKiLg1om7a
 19th2jW+hRL6Z+nh/4b4ORV+i5MQ/L/qsl+0H0KxRY3AuWOfsSfe0v8YxcKoTn2EhzeYv7ZQ3+
 l/aoEJP295b5zeqc/skUk+3cC3XoS4DDs93PabpVp7M745wDEK4mGLeVSPd83oIkomL//kLs5H
 u0hwBAAA=
X-Change-ID: 20240725-more-qseecom-379933b9c769
To: Bjorn Andersson <andersson@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, Steev Klimaszewski <steev@kali.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-efi@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2504;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=tjBly2s6mnuGi9HgjrC+Tb4IXYnpF3vQanWgu9BVuLs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoWgnlPAiUDAeHKKGJImPg/+wqx2zOWM4/iRMEI
 Qgpjw25j1CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaFoJ5QAKCRCLPIo+Aiko
 1XxCB/4j9iampdS5PHI9XQvQ0EfyUbZhcV2XQObkKFnwYPwH8Ah/H37UAPRnmU8LDYSWpdwm4km
 p3B6P3xtxBS31dQz/n4f+Otx8Fi1Ujihkoo1KHyDENtL2TpE8IMTtDtMId1ZgyAfhPyGqd5zYNh
 4udsBb8JQ133EF5DWCX75sn9ITLOL56rVa8ELuUdYrIPsERvgfCfg1d2rWXq3r59hnD+Wlotevh
 0XkjiTMVCCRDUYX8T/t7IYd+r9NAh7ZzOhRmIU+kFTbZaQUJ2PoQFhGfJoIhXX5Rnsy9UDXrj2K
 B8TTaoZ36xhsuH/WWGuSINDhiDEy/1cZ7R1+r/JMreOYAb24
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: XrwhIgIXD6JAauJdiPoQdmlktwdjewJ6
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685a09e9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=pEElvNPFZa0bE_926OUA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: XrwhIgIXD6JAauJdiPoQdmlktwdjewJ6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDAxNyBTYWx0ZWRfX8yPdBdxpr9sc
 mAjTVC5ulQ0brK3fgNm4ZosIyk90HIXYg97knj8vx2ppVFK6YpaoIdlTt6m59oKv+w+6Off8KeE
 MbLwCvb7JTu3I3G14QdhoKYMOjyydd7aA25hrAoiehBdbwGUZdWH9uYuctTUYnvbrqXM30zg6tS
 KiExZMqV96cy1tWD8I7n9yv0A23Wu4tXqgdhkrqQaGQAW6gxxwJLf2gtC71LoDEefAXsuI9LEKq
 h/58YWlKvqaO+M1eNjeeNkyyHwFtXpgWXnxw8RDuGZCD8BqJqLbExjNaRDcvhlC9DBzfRImqfkT
 1TIDNwey9VIULjpnjeIvLRsUW9Mw0jY0YfSA2OqfGYhxP23bTAZUt+TW+TfYz/bay9m1HtajZF1
 MlgKcVUgipvrNaAdU+IsXiQBjeKmhNLtx3C/ZeCwLix31O6uDZyboa+C5dxnnlxcQsysVc8l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506240017

Lenovo Yoga C630 is a WoA / WoS laptop, which uses a "standard" QSEECOM /
uefisecapp application in order to implement UEFI variables. However as
this platform has only one storage (UFS) shared between Linux and
SecureOS world, uefisecapp can not update variables directly. It
requires some additional steps in order to update variables, which are
not yet reverse engineered.

However even with the current driver it is possible to implement R/O
UEFI vars access, which e.g. lets the RTC driver to read RTC offset,
providing Linux with a correct time.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v3:
- Picked up patches from another series, reworking the QSEECOM
  allowtable
- Added a fix for efivar_set_variable() crashing the machine if R/O UEFI
  vars are provided (Johan)
- Link to v2: https://lore.kernel.org/r/20250621-more-qseecom-v2-0-6e8f635640c5@oss.qualcomm.com
- Link to the merged series: https://lore.kernel.org/r/20241103-rework-qseecom-v1-0-1d75d4eedc1e@linaro.org/

Changes in v2:
- Added QSEECOM quirks in order to make UEFI vars r/o on C630.
- Added DT patch, specifying the use of UEFI vars for RTC offset.
- Link to v1: https://lore.kernel.org/r/20240725-more-qseecom-v1-1-a55a3553d1fe@linaro.org

---
Dmitry Baryshkov (8):
      efi: efivars: don't crash in efivar_set_variable{,_locked} in r/o case
      firmware: qcom: scm: allow specifying quirks for QSEECOM implementations
      firmware: qcom: uefisecapp: add support for R/O UEFI vars
      firmware: qcom: enable QSEECOM on Lenovo Yoga C630
      firmware; qcom: scm: enable QSEECOM on SC8280XP CRD
      firmware: qcom: scm: add modparam to control QSEECOM enablement
      firmware: qcom: scm: rework QSEECOM allowlist
      arm64: dts: qcom: sdm850-lenovo-yoga-c630: fix RTC offset info

 arch/arm64/boot/dts/qcom/pm8998.dtsi               |  2 +-
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      |  4 +
 drivers/firmware/efi/vars.c                        |  2 +
 drivers/firmware/qcom/qcom_qseecom.c               |  6 +-
 drivers/firmware/qcom/qcom_qseecom_uefisecapp.c    | 18 +++-
 drivers/firmware/qcom/qcom_scm.c                   | 99 +++++++++++++---------
 include/linux/firmware/qcom/qcom_qseecom.h         |  3 +
 7 files changed, 93 insertions(+), 41 deletions(-)
---
base-commit: 5d4809e25903ab8e74034c1f23c787fd26d52934
change-id: 20240725-more-qseecom-379933b9c769

Best regards,
-- 
With best wishes
Dmitry

