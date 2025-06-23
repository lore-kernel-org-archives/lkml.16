Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A2329DB73
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 16:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750697042; cv=none; b=lI6C9HBNKjgALsQIHu4cEQGIgaycQ4gOWCU2ud3IMehWHoMVY3Iur/rOspzAzakdIQlS/K4qQy784BqecH0tCjFWCBf3p08PqUfY6PEnHggiwiG2UNWQDfSQiAZxcc2czCS7L3priVFb3GFDl8/OxycoEByjQ9QDejWq18jA2es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750697042; c=relaxed/simple;
	bh=sn1KF/6Ht8dkS8+c6d0VPrkLlRi1uh3h1hk4Rb9e8aw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TbeTYYfYeNOPweFR3EXoEYJEwU0uv52i0MiVWsWBjvjOOa60Bm59++GX7zCaioIgNCgvdK8mCsGKdXCe3hb04fgmfwnA9QZWMdl1bKVuV2sR858GVYR0l8u8nv93Xfw/bmOSVjIeXFRuGvVRt5rJWBRjUaeL6uxvoMJz/ADtZlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y0b8AB0Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y0b8AB0Q"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NGZP7a005909
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 16:43:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qWNqZMKTL0RTyb8f45ntbHnU/u8jjeMVsb9+e79xe8I=; b=Y0b8AB0Qs2iqnAPB
	daDNou9tezI1vzPFipSgtNpZdc6XN5f7wogT+SgGE7hcsK+beaGhlYL77Q8pwcha
	A6ffV+82Qtwq+VGlify2nA3e+kUuNfFt84ygY3UE34c1frSMffqbAIO6SWn2KUMv
	IK8KQQIPMb6Uo5yx1Mhbxwsx5Z6Ty9GTm+0RcH64N0VjusMn8d2/ifEbk4AjvqMf
	K6QcsLNQm/+/QXtBbQ5+/w67cx8VbZsUEbimxQ/b6f54VgC3YIXMwwW5lJtWpxnR
	CJ/T+VIjeSEmDVmoGlX/voKBbtO4sMBsU959x7M9DXdu4g88NVDiJfKm0gh6AT+A
	4LgqOw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bg9e65-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 16:43:59 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-313d6d671ffso4123133a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 09:43:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750697038; x=1751301838;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qWNqZMKTL0RTyb8f45ntbHnU/u8jjeMVsb9+e79xe8I=;
        b=RsIgQKR05iqlW2puTmGRd7cc8nuyH4t9AweaOMAsLF+v5hdQmCowbnHKYtFlRXmS27
         CbwLRgFNbrH7xjr3ZK0NEib+u9zc4QQt+1dN0jNoxTCXKRVaStli0BmrXfVVvspfGN7A
         8mRKim4p27BWGvVYWmS+kLbWPqxoenN8wU0sIDbJcmWTE9eHSDsGqoO/l1029uDWvu0x
         tSPLpLMCMfWIPwD7TUaPRMtiepOQzXwsgxYeNGr0fZLf5zFrJGC1Va4tKdP7us5Y1qNA
         RBsWywz0+fCQ3prcBHzPi80Ntw5yV4s/e0/wDP0ZqlZ5aEzTpZqt7DwJQ29imzXDDAmH
         VVSA==
X-Forwarded-Encrypted: i=1; AJvYcCWBDYpzPiZvaAZsObzy/PFDODJKL9GizLw4fOKUKSYPwubGNFdb6V76YyjBxSzbhILEgv+8NEDRlBFeSzk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSqNYPZ7WImC8xY+mJ4aXaptekkChGnBNRNK4RTWICpMvK4t3h
	pZvkSrSIGd+ez0Ej6UJuuFZC+BaD1LXXlgaKlgSiSMa4WbjZ6NMYhFpyubH0lCgqYi1b6N3Xq/6
	yho+v1yOrjZwo3J635xCAGQV+sMuwVCPdyumRdW7Em5M2kGy+auyIMjNvIXwdMVojWkc=
X-Gm-Gg: ASbGnct5rfiFYzb5S4UjFfpdAy/cAd0j+xSUu7OG2qt3pW+vpNBhrHu3a+fZI04zuKC
	jNYnLNaONGsfMutxxZSdXGJ5YXyYwYWJbOETUDGZlA1GNdXFC/WYNthhLv3Zf/Hc/nZc9JHyH8Y
	hA+WexUlFptT0ZK44lyoi+N8eysg72346I8e6TTSVJvx6m+u2KGVHf0r0s8DIWyvUevJquPIs6a
	fe1SVXaGAe22rRmmzuJQs4XILm+2HIfog9vM37GV9A3y+xsP9DYkVosNlkjBNb7XzM7XEIcWe5m
	bg2RCKqmcmWk590wy5hztnjlfyioSTX886dqD/2/KSpStVsdyGs3
X-Received: by 2002:a17:90b:5826:b0:2fe:e9c6:689e with SMTP id 98e67ed59e1d1-3159d64432cmr20159125a91.8.1750697038076;
        Mon, 23 Jun 2025 09:43:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEc6+DPGexoqt9iFZAUHgGKTSWRV9mQ6Fl4MWUU0bfxuffMek6pig/mwkiOYyr/RXSKgvyvnA==
X-Received: by 2002:a17:90b:5826:b0:2fe:e9c6:689e with SMTP id 98e67ed59e1d1-3159d64432cmr20159094a91.8.1750697037645;
        Mon, 23 Jun 2025 09:43:57 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3159e048346sm9271254a91.26.2025.06.23.09.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 09:43:57 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 22:13:41 +0530
Subject: [PATCH 2/2] regulator: qcom-rpmh: Add support to read regulator
 settings
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-add-rpmh-read-support-v1-2-ae583d260195@oss.qualcomm.com>
References: <20250623-add-rpmh-read-support-v1-0-ae583d260195@oss.qualcomm.com>
In-Reply-To: <20250623-add-rpmh-read-support-v1-0-ae583d260195@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750697028; l=5166;
 i=kamal.wadhwa@oss.qualcomm.com; s=20241018; h=from:subject:message-id;
 bh=sn1KF/6Ht8dkS8+c6d0VPrkLlRi1uh3h1hk4Rb9e8aw=;
 b=EOeQmrffC193kGihEndFlAgPdXhvvTnjn+yaE0LDszh2PJZd0RPEd6NXWQbpmtm38atm5WTCg
 gSkNudxW7jFB3NNqaMBhBuYhALq/nNtQEkfbSZPm9k4fUxq5oqYG9Jo
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=XbPE6DM5/mJi2tsiYwMCJCZ4O5XPMqColJRlGVcM7Hs=
X-Proofpoint-ORIG-GUID: MFIsfhBu1qHMpqqBP-AoJxR_0KvsYYEQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDEwMSBTYWx0ZWRfX3CaMtQy3SbpT
 TQLyCunH1x03a93RCaq/QmXGJG9BFDNxxwxsJD207kfZRvUfIC9uK77aVsBrR5bBtRDwstzny/0
 fc/8M9BtrOKli9mOaqWyxKcSzFFra87MsoGQ4DMEgbiFN16sX4xy6lPu1LVYLQjdA3RQkweVYOV
 r1xtOqWd+mlNT4EsEHn6s6c90/N8odwcMblVCfEoW1huwclfa2LynqPdqTo6ZbgtD/8LQ9CYgwF
 Ht8LsVtgIrZkzzpm8pogpLI/a6BTyxvhPT8gKt59ebi0+dxMx/t1PGKQk10om9Ukv8b7g/MlITx
 vCdUok/DjD70Z4nxfs51RsgC3MjE8wOuswNq2p+siIHNATQcjrnYZ8UKgZWmV/Fgp8b5l+c/4Pc
 CPa4hj4MGWg469I5jrw8s6lxhUBkCZGEw7j6yNwdjuSCtBGFKzk+Py4NnGJ91H14oJIjSlAj
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=6859844f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=oayDomAjHHfHustaWQ8A:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: MFIsfhBu1qHMpqqBP-AoJxR_0KvsYYEQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230101

Currently, the RPMH regulator's `get_voltage_sel()` function only
returns cached values from the last `set_voltage_sel()` operation.
This limitation prevents the regulator framework from accurately
reflecting the regulator configurations set during the bootloader
stage. As a result, the regulator framework may trigger an
unnecessary `set_voltage_sel()` call with the `min_uV` value
specified in the regulator's device tree settings, which can
cause issues for consumers like the display and UFS that require
a consistent voltage setting from the bootloader state until
their drivers are probed.

To address this issue, enhance the `get_voltage_sel()`,
`get_mode()`, and `is_enabled()` callbacks to read the regulator
settings directly from the RPMH hardware using the `rpmh_read()`
function. This change ensures that the regulator framework
accurately reflects the actual state of the regulators, avoiding
unnecessary voltage adjustments and maintaining consistent power
settings across the transition from bootloader to kernel.

Signed-off-by: David Collins <david.collins@oss.qualcomm.com>
Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
---
 drivers/regulator/qcom-rpmh-regulator.c | 71 +++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index 7870722b6ee21ce487c2cf911760fb4a385fc44b..ba5bd4ecec7429a1ada008c237cf7444a37a9cc6 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2018-2021, The Linux Foundation. All rights reserved.
 // Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
 
 #define pr_fmt(fmt) "%s: " fmt, __func__
 
@@ -33,8 +34,13 @@ enum rpmh_regulator_type {
 };
 
 #define RPMH_REGULATOR_REG_VRM_VOLTAGE		0x0
+#define RPMH_REGULATOR_VOLTAGE_MASK		0x1FFF
+
 #define RPMH_REGULATOR_REG_ENABLE		0x4
+#define RPMH_REGULATOR_ENABLE_MASK		0x1
+
 #define RPMH_REGULATOR_REG_VRM_MODE		0x8
+#define RPMH_REGULATOR_MODE_MASK		0x7
 
 #define PMIC4_LDO_MODE_RETENTION		4
 #define PMIC4_LDO_MODE_LPM			5
@@ -174,6 +180,28 @@ static int rpmh_regulator_send_request(struct rpmh_vreg *vreg,
 	return ret;
 }
 
+static int rpmh_regulator_read_data(struct rpmh_vreg *vreg, struct tcs_cmd *cmd)
+{
+	return rpmh_read(vreg->dev, RPMH_ACTIVE_ONLY_STATE, cmd, 1);
+}
+
+static int _rpmh_regulator_vrm_get_voltage(struct regulator_dev *rdev, int *uV)
+{
+	struct rpmh_vreg *vreg = rdev_get_drvdata(rdev);
+	struct tcs_cmd cmd = {
+		.addr = vreg->addr + RPMH_REGULATOR_REG_VRM_VOLTAGE,
+	};
+	int ret;
+
+	ret = rpmh_regulator_read_data(vreg, &cmd);
+	if (!ret)
+		*uV = (cmd.data & RPMH_REGULATOR_VOLTAGE_MASK) * 1000;
+	else
+		dev_err(vreg->dev, "failed to read VOLTAGE ret = %d\n", ret);
+
+	return ret;
+}
+
 static int _rpmh_regulator_vrm_set_voltage_sel(struct regulator_dev *rdev,
 				unsigned int selector, bool wait_for_ack)
 {
@@ -215,6 +243,14 @@ static int rpmh_regulator_vrm_set_voltage_sel(struct regulator_dev *rdev,
 static int rpmh_regulator_vrm_get_voltage_sel(struct regulator_dev *rdev)
 {
 	struct rpmh_vreg *vreg = rdev_get_drvdata(rdev);
+	int ret, uV = 0;
+
+	if (vreg->voltage_selector < 0) {
+		ret = _rpmh_regulator_vrm_get_voltage(rdev, &uV);
+		if (!ret && uV != 0)
+			vreg->voltage_selector = regulator_map_voltage_linear_range(rdev,
+							uV, INT_MAX);
+	}
 
 	return vreg->voltage_selector;
 }
@@ -222,6 +258,18 @@ static int rpmh_regulator_vrm_get_voltage_sel(struct regulator_dev *rdev)
 static int rpmh_regulator_is_enabled(struct regulator_dev *rdev)
 {
 	struct rpmh_vreg *vreg = rdev_get_drvdata(rdev);
+	struct tcs_cmd cmd = {
+		.addr = vreg->addr + RPMH_REGULATOR_REG_ENABLE,
+	};
+	int ret;
+
+	if (vreg->enabled < 0) {
+		ret = rpmh_regulator_read_data(vreg, &cmd);
+		if (!ret)
+			vreg->enabled = cmd.data & RPMH_REGULATOR_ENABLE_MASK;
+		else
+			dev_err(vreg->dev, "failed to read ENABLE status ret = %d\n", ret);
+	}
 
 	return vreg->enabled;
 }
@@ -303,6 +351,29 @@ static int rpmh_regulator_vrm_set_mode(struct regulator_dev *rdev,
 static unsigned int rpmh_regulator_vrm_get_mode(struct regulator_dev *rdev)
 {
 	struct rpmh_vreg *vreg = rdev_get_drvdata(rdev);
+	struct tcs_cmd cmd = {
+		.addr = vreg->addr + RPMH_REGULATOR_REG_VRM_MODE,
+	};
+	int ret, pmic_mode, mode;
+
+	if (vreg->mode > REGULATOR_MODE_INVALID && vreg->mode <= REGULATOR_MODE_STANDBY)
+		return vreg->mode;
+
+	ret = rpmh_regulator_read_data(vreg, &cmd);
+	if (!ret) {
+		pmic_mode = cmd.data & RPMH_REGULATOR_MODE_MASK;
+		if (pmic_mode == 0)
+			return vreg->mode;
+
+		for (mode = 0; mode <= REGULATOR_MODE_STANDBY; mode++) {
+			if (pmic_mode == vreg->hw_data->pmic_mode_map[mode]) {
+				vreg->mode = mode;
+				break;
+			}
+		}
+	} else {
+		dev_err(vreg->dev, "failed to read MODE ret = %d\n", ret);
+	}
 
 	return vreg->mode;
 }

-- 
2.25.1

