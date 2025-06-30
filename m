Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108BE84A2B;
	Mon, 30 Jun 2025 10:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751281129; cv=none; b=SbH/fLUONEMbwBWuQNLW6JwsfUXCgxBFCEr9yTKlvDjsFXmkiE3BlGUv0QIWRi3YotG4/V84ExCSoontK04qwYToFK9y8VQ4fnr7/u/ReHjvN//Lc74IJ7dPfXOrTKzoPoXKtt6avILH+XGQ4mlVh7445ZHE239tNfRbscq2jqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751281129; c=relaxed/simple;
	bh=c01+prwLt3Z4uzPP3P6c3b8DwK0aebzLgzpARx2p0mM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B9fKMTYwa5DI0R3PdsOazECS64Xart6hAn2qN/huMCogYiPildQftcupetIHNlYufM2ds3NzQ1XfMiZ0sp63Pcbdm1RkFWaD7EuPUrafVGnRi9es2VECDXpGOrs3K1AK2gQ7rXeu013S67/87/I5kLrgc460ZXmR6VkqW//9z1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PPCLG5v0; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PPCLG5v0"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U84cdV008767;
	Mon, 30 Jun 2025 10:58:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=tVek2cu/fX9vb11AdxYkBeTfTfEnW
	2qEG+yUYqSTTM8=; b=PPCLG5v0Spf4Pb04+hU3AQcDDAZWQnMr/SK3+f+gsRudf
	rkKZq0Syk5v32ts8ZWGs849mL5sMCO2Vi78YMPRts4rBLWkhFKJ+llz/lV8boHZi
	x2netIvbUTS2mWgzBoKVCsFIRDgnIqKaTVnl+ucEfcGCU+tTSSYf0oGsoWh+tMdP
	8RqpI8ruwWdKNOnHZwQxxXFgF0UduGTznM1UOS+BLtVLDAQeb8m6AZl0OkJ5BDRr
	06gMQ8MdSgWP+7V3zoKHaOwO+z8KA6MkssaqLXZC5Jc+XtCOZfwwyol8/++oyynU
	JzOE5C3hKmGQtfWeWUWILzCmm6KEW/whUr9Xl1yyw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j8xx273g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Jun 2025 10:58:43 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55UAtcUa017089;
	Mon, 30 Jun 2025 10:58:42 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47j6u7xgpw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Jun 2025 10:58:42 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55UAwgBm015032;
	Mon, 30 Jun 2025 10:58:42 GMT
Received: from ca-dev110.us.oracle.com (ca-dev110.us.oracle.com [10.129.136.45])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 47j6u7xgpf-1;
	Mon, 30 Jun 2025 10:58:42 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: hansg@kernel.org, ilpo.jarvinen@linux.intel.com, vadimp@nvidia.com,
        platform-driver-x86@vger.kernel.org
Cc: alok.a.tiwari@oracle.com, darren.kenny@oracle.com,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] platform/mellanox: mlxreg-lc: Fix logic error in power state check
Date: Mon, 30 Jun 2025 03:58:08 -0700
Message-ID: <20250630105812.601014-1-alok.a.tiwari@oracle.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 suspectscore=0 mlxscore=0 bulkscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506300090
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDA5MCBTYWx0ZWRfX0AXknf2lDP9Z wlSCzK9jRT7upHog1MI/2atNq0WULZy4vxTWjKdKwHHlwkclyRVtMS/r36vA+6CLO0IoMJmEePQ EcrgbNfbVuNt8CAnq7WhNMSYkrPzv1IgaL8aZqGC05Swf4xpQoE8MUqxyo6Rgb9kT0tWZr1FkGr
 jnpc/xwYT4skNFfEjWlGsDxbwGNjtOBHud2Q7kTk++f+ssS01tCFH/+wGzQoh3y0zg1yQT0nI+p 4yub62zVm8PUpG8UpyZPIEKW2r/wcGUphlJaF/OHBcxMbHCoccK/PuH5Cp63YliyPY99r6103NC MnODjU3BaAh5SlD3inh0BlOT8ZziiI1367ZD20DSStmni2dFaH/zAFtFkRC/onxmYf3S+1lJIqa
 XaENMD74rgNBwKw5BvJrqvepeJtktex3Ht3VMovHexWJ8MoWYRLzwOitJCMCRa+mVtgHUo/j
X-Proofpoint-ORIG-GUID: YmC8SlpdMejEOUyZamoEO-OY-7S3jLRN
X-Proofpoint-GUID: YmC8SlpdMejEOUyZamoEO-OY-7S3jLRN
X-Authority-Analysis: v=2.4 cv=QfRmvtbv c=1 sm=1 tr=0 ts=68626de3 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6IFa9wvqVegA:10 a=Ikd4Dj_1AAAA:8 a=yPCof4ZbAAAA:8 a=gBumKNB3FYnGDgap0wUA:9

Fixes a logic issue in mlxreg_lc_completion_notify() where the
intention was to check if MLXREG_LC_POWERED flag is not set before
powering on the device.

The original code used "state & ~MLXREG_LC_POWERED" to check for the
absence of the POWERED bit. However this condition evaluates to true
even when other bits are set, leading to potentially incorrect
behavior.

Corrected the logic to explicitly check for the absence of
MLXREG_LC_POWERED using !(state & MLXREG_LC_POWERED).

Fixes: 62f9529b8d5c ("platform/mellanox: mlxreg-lc: Add initial support for Nvidia line card devices")
Suggested-by: Vadim Pasternak <vadimp@nvidia.com>
Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
---
 drivers/platform/mellanox/mlxreg-lc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/mellanox/mlxreg-lc.c b/drivers/platform/mellanox/mlxreg-lc.c
index aee395bb48ae4..8681ceb7144ba 100644
--- a/drivers/platform/mellanox/mlxreg-lc.c
+++ b/drivers/platform/mellanox/mlxreg-lc.c
@@ -688,7 +688,7 @@ static int mlxreg_lc_completion_notify(void *handle, struct i2c_adapter *parent,
 	if (regval & mlxreg_lc->data->mask) {
 		mlxreg_lc->state |= MLXREG_LC_SYNCED;
 		mlxreg_lc_state_update_locked(mlxreg_lc, MLXREG_LC_SYNCED, 1);
-		if (mlxreg_lc->state & ~MLXREG_LC_POWERED) {
+		if (!(mlxreg_lc->state & MLXREG_LC_POWERED)) {
 			err = mlxreg_lc_power_on_off(mlxreg_lc, 1);
 			if (err)
 				goto mlxreg_lc_regmap_power_on_off_fail;
-- 
2.46.0

