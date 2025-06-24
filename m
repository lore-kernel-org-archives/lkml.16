Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A75625B677
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 22:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750805609; cv=none; b=BR9jY70pnELyBL1sY+GjhtJNZuq8La37+0DBW3su95oAS6gtFIFxyNjgIxlUUHyCUMPCdlJ53NGaIhDkopSr1vQeHk/wzYrGDLdWLVZeS265AtxCze4j7TZaGhDGeCUevWe0ULkRsKGLChWOv+7c9ztuOKFJB9xclzwzIAYo/fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750805609; c=relaxed/simple;
	bh=Y5CFnkpy6R0kc2uADe2mxWd6zFHIKXS9ZuOjknr+JPE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=W7TuWHHfVG4WIL8gq97aVuPpopA33EpkcybcKJe4yYj2tNl6fM6E59Zvnw45GhlcvhEyyVWbmoy1PaYqS9u+ku+T3nQOPGhBDCUqbI4N7z1dE9uaGU/H0+0jhM1Wm5Y4X7VSkyexlnW5xjNat+jNPNCbxt++vN5dV2FdJ4obEzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yb1Nbg+0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yb1Nbg+0"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OFbj7Y014571
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 22:53:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6NEQLURwDsTloKlZr0oOUC
	qwsReFlsNBCCBhcuqvmg4=; b=Yb1Nbg+05Ju7nAxqtnOqoCRyRrbWFNFWOnGdGP
	3jkT5otDHfyjnfGmibLeIBbq5kJSDwI3iAStVGnOayrWRH/46fEKhWisQjQBcHWj
	qndP0fi2eMrJnFarEHsNWSqR9TWVn+lIy3wLaUs4NCyy4jD85bLO9+OcO0ZDrWaZ
	Mcicoq8Bx14IdNfUn6GUXtLHZXyu2I+2ZKPOZdna/jhZqH5RJnGooeQMWHCWoEaE
	qhLD1MEMi8lUXU0wPvMpLi3WF6R3+Knc3hetrGJjXbSw7Gze3m4ykoAQtulqeKIN
	aRABiZWI+7oOTxGjG/OqTR+FKrkMuV5j1+umMGMPW+bE146w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f2rpx31b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 22:53:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d3e90c3a81so504500985a.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 15:53:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750805605; x=1751410405;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6NEQLURwDsTloKlZr0oOUCqwsReFlsNBCCBhcuqvmg4=;
        b=G0axzrhUbQBXR4P1nTXv1e22ydMztGMA5FPA4DwbYr4OMIinRwlHo4neNyqBGsXft7
         QKqM/wxm1cX06IuGe2ZelFsnBFL1bGv2/JLF/38xavIf6KPtCrilBTfrXEwexW6FC3NX
         iycgwpNoOjAnx3nK1Uuy0FEVFshBMZQfvkRTaZvfVfcVjh0WNH0viZvrScl2S9XC32A6
         VHBP5VJXl50G5xevRd/3ZndYVrz8/CMLPROBVed9f/nco9sOTwPo7+5i7VEUbm/Co+Vn
         TmMQNIXIO5sc4U9srDu5AjhmwTmPuRbSokkQbeey2+a88kbzuh4/FaC4rLOqNVzfUAax
         N3TA==
X-Forwarded-Encrypted: i=1; AJvYcCUi78ao17gUOWyBQUFJXNo6+3naAfT7WdkXsqnc15HqwwB8RqGKXzOeedlPWkayWqkQTmYC9psAwCjYeF0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw/CWg8NBAKJelo2OziNVwUx/ht4dz14D4IAUl68hTwO1keIsz
	xnJAXKZJOkn/I4+0nFbLz7ddNL2TOG4SrSjj5qjuNlvUB123RCnAUHnCCBcLak0O4z6widMWelm
	5iZG9SpKeYOTFD657n/Sru+OdmIPd/H9YPA/F6clgkLqCPGFNLy5vCqFY0+8T6PBsjV8=
X-Gm-Gg: ASbGncsV965e6544FbvC4k/LRI66B4sTqXvfuPL75+2Zxmf5OjI90BNl+rmQ2VSP6in
	GBssTYAxFIH7KSm36/woZSUH4CRi3AEQ8iBxQ8vpOEAndxK+JgTJXFgr+owAnOlMthf+pZGatrm
	YbHzqoar/lLR/Je6o/hqYIZZa0iTxw+h62LF5LtR2Na52+Ch4p7tV8n839UkSEcPWhSQFzycBu0
	68LYK+RJZL00e2Qh5GvjQfe0ELiACIe4fu/jIZGWMurl73y/9ud1NonD5j2zS2+1ZirDOAWu88y
	3zOjiAtVkrf+lVi1Dc5g7gPAYBnOVMQTbBhGyf1DIY8qiLCd43N7Dcaap/NWcIhifooEWy1JOTO
	2HBXYPa1r76p5aINkzE08zi9+z0Dj3glew9o=
X-Received: by 2002:a05:620a:8801:b0:7d4:2b5:adbf with SMTP id af79cd13be357-7d4297a7b3cmr111312085a.45.1750805605432;
        Tue, 24 Jun 2025 15:53:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKJtOlwSZrw9ddmxmM2pYssjiiX21GwgorDa91kZb96ksSc8xZRe2o4Cuzq4PkY5At63yxSQ==
X-Received: by 2002:a05:620a:8801:b0:7d4:2b5:adbf with SMTP id af79cd13be357-7d4297a7b3cmr111309785a.45.1750805604994;
        Tue, 24 Jun 2025 15:53:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b97f5980bsm17843851fa.7.2025.06.24.15.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 15:53:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 0/8] firmware: qcom: enable UEFI variables on Lenovo
 Yoga C630
Date: Wed, 25 Jun 2025 01:53:19 +0300
Message-Id: <20250625-more-qseecom-v4-0-aacca9306cee@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF8sW2gC/3XQTW7DIBAF4KtYrIvLjwebrHKPqguCxwlSbGIgV
 qood+84VqUqajdID+Z90nBnGVPAzHbVnSVcQg5xotC8Vcyf3HREHnrKTAnViFYBH2NCPmdEH0e
 uW2u1PljfGsuockk4hNuT+/ikfAq5xPT11Be53v4DLZJL7gCcBtC9HHB/DpNLsY7pyFZpUT9tE
 EbJl7bighvsBqPBNMLDPuZcz1d3ptexpmMz9G+jeTE0GRaUAN93nffqD+OxrZhwvtJHlW1PdnA
 Z+ToUyq6a8FbeR5cLJpp/fAMOzzPgYAEAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2709;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Y5CFnkpy6R0kc2uADe2mxWd6zFHIKXS9ZuOjknr+JPE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoWyxioD5x/wAi0ASRQ/c6A7VG1UcqoEYZQYIW1
 nrWIjazl8SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaFssYgAKCRCLPIo+Aiko
 1XJ8CAChC6NKlLKOLVoJKWIKw6eML6m545ZtjiG+zkJ85lxF8fx9SKfkUT/+N7W/JQ+kXh1ZY2q
 BnO+RDBEFRrWzldGZcAUahD4ZXROxKXkaR+wFZOOiX7yjspgIoK6xt1wL8iV5poux/565Sflbqw
 SD6gXExkepLMv+aTD2fpOGJrdR6PJ0h5qveDj9mdSqDcnKVTI4upaTOZCtZ6cUDFfQ/w/8E+zBU
 DDA+d1o+yvZyd7tOIjgDEzgQI2cgoXHpmJdlg790VNz2EwhBsdDEBcPa5cU6ie+H7iaBzo6lSoa
 PjdsjugqhxA2nnk3CVYN6Vryncp3/scN9ZBu43na6hK4qqMe
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=NdDm13D4 c=1 sm=1 tr=0 ts=685b2c66 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=pEElvNPFZa0bE_926OUA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDE4MSBTYWx0ZWRfX01hbDBZLwFa2
 FIro2q+neZvg1duAZUUTuTCsrUVQhAYgwcd903bO6xW+eQTGuqCa+GOap1BpbOw/RU2W+GQjh92
 B0T4QK6fJcB4DDVWtLLHWyTSS65l2vVVxfhW3Yp+3g+ZVkZqwth2J+L6WUkFaTFs34AbbWFSa/j
 zgvxZzjKRMj+XOG4eF+Qe415XeJcUn6GXZMrUQWYo2tjD4bTt+baH2voMGPlNlS+S/3QEIKvrZZ
 vHxA/md56WENEv0bIbvzcKTI69wl8FxBJpxE80Ln4FpUttt3+/TvEkveT4s5UDpLtcFoQZdIblQ
 3COaRMU+nQvsLIphatFMyPwU66O8GlN16oYT4LwgKEJhUJvFYi7ArAVbsVfXk7ZmxL5tYZ1YSVb
 cWwJ4DaWpXQwr5/wJVzJxwbrHwn5zzl0bbDhCUfLLhi4NmKRMXg7S9DyqFsoGv78xDEbcWCL
X-Proofpoint-ORIG-GUID: t1yg1B3HoNbAVUIBYZHbZi4vz8oiJ0MF
X-Proofpoint-GUID: t1yg1B3HoNbAVUIBYZHbZi4vz8oiJ0MF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506240181

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
Changes in v4:
- Fixed comment describing how to disable QSEECOM for a particular
  platform (Konrad)
- Link to v3: https://lore.kernel.org/r/20250624-more-qseecom-v3-0-95205cd88cc2@oss.qualcomm.com

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
base-commit: 2ae2aaafb21454f4781c30734959cf223ab486ef
change-id: 20240725-more-qseecom-379933b9c769

Best regards,
-- 
With best wishes
Dmitry

