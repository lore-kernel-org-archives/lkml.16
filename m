Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21DB247280;
	Mon, 30 Jun 2025 09:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751277062; cv=none; b=p5nyvYUEM3CwE20Bt9EZOls6y6rQaV79fVxLSCLu0Ar13wSP70hf1tj621nPxHCUOUBYsopJVqW9paDpKhqiWbI7YUXpxMmoMargRAU9wlGtookHQ2RBMKpxVtxmOvnN78q0ozqfQpC8jdxsPkiDA8im7ESVGPipKCDrtK5VZhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751277062; c=relaxed/simple;
	bh=O5oLr3bwWsZD8uL73nva/6Unk6JmucG8/TRTyuz5QlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c5sjwtRx4S9INjOCNAw2bQPYnae5112whPPgPI9NGYi46vt8PIZBCieBueaEeHy3ae1Pl2oi+kZfrzXUfFplSdlekBXtqey47ucwXRiOUld+DWIhGeFYh7HLqmb9ebqBvuq3dFzwaBd3SkU/z/3nmQ6jh/amW34MTCrs5YXSoZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cykCsxnM; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cykCsxnM"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U84fBH004461;
	Mon, 30 Jun 2025 09:50:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=DKjS5goKMi5rK2GbghAH6/rgG28ei
	A8yPjSPHnwGwiU=; b=cykCsxnMIgofblcqsKXBVZ2xLbV5R2pH2FBysEBHvaMEl
	GBsbPm4tbiJ6lNF37SwuY8M9mhSzQaD8FM/T7arH4x0uqMNAcY5srRTy2GxNqpmj
	RExaCDGYjvV3MMQaoC2LrFH7Q7zGkuFjALXI7I7bSUs8e4NSR8yYujSLz5Xx0Qup
	aQGbWjX5iP9YZ6JnkmnMuZV7SnysVTty9zhRU/yMlImgqXrEXX8MeXryX0MYlK8L
	MdV76/tNdMae7kzYL7cFHpAikZY6xmA7eHr5jSbYhMJJWpB5DB3Cqmzav10+T9R5
	UNwY8Ev/z3oZD3pTemZkPLHC0HeUVICFOfltSS4fw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j766a600-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Jun 2025 09:50:55 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55U8dmeK028997;
	Mon, 30 Jun 2025 09:50:54 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47j6u84adh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Jun 2025 09:50:54 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55U9orcK038230;
	Mon, 30 Jun 2025 09:50:53 GMT
Received: from ca-dev110.us.oracle.com (ca-dev110.us.oracle.com [10.129.136.45])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 47j6u84abs-1;
	Mon, 30 Jun 2025 09:50:53 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: hansg@kernel.org, ilpo.jarvinen@linux.intel.com, vadimp@nvidia.com,
        platform-driver-x86@vger.kernel.org
Cc: alok.a.tiwari@oracle.com, darren.kenny@oracle.com,
        linux-kernel@vger.kernel.org
Subject: [PATCH] platform/mellanox: Fix logic error in power state check in mlxreg-lc
Date: Mon, 30 Jun 2025 02:49:51 -0700
Message-ID: <20250630095001.598061-1-alok.a.tiwari@oracle.com>
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506300081
X-Proofpoint-GUID: WHia3CpVMJ399UiOZItjb_KNX2mE4riw
X-Proofpoint-ORIG-GUID: WHia3CpVMJ399UiOZItjb_KNX2mE4riw
X-Authority-Analysis: v=2.4 cv=b82y4sGx c=1 sm=1 tr=0 ts=68625dff cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6IFa9wvqVegA:10 a=Ikd4Dj_1AAAA:8 a=yPCof4ZbAAAA:8 a=gBumKNB3FYnGDgap0wUA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDA4MSBTYWx0ZWRfX6NWuw3aMVu1p uI9N3K4onrFfMNpk6+QyhY72nRShtBgwTqMUvukboNbBYRZdZ8ID7m9XAfrr9euRiTHCThauqpP IpFn2nKS7zazKA6FlKpimxFFP4uh3NpwHn75pBHS6RKISkFltYSImqfaFcLnmvbgZ++s8fUPTl4
 5ft4Ag22Fnd/CZE8e5HWjy0ox4+HSqjZIPGXTgFifZtFc1Vq8gwcugHAgkR2/OU5y3LH1tFtnUq vDVfwfSZplwo/sXulJ1EWiE/ST//eKcPr899EMG5x5qkRCabW7oam+g5uZKkhcy3eQBhvM2bGt/ df/vD9x4TD76LvtpMmCCoUWl4DHHynW07Ld4VIiiOX1/c9rrrtA85HoP5jyLbA4GDjl6hvHp2/l
 WQnaMm6U5SYl48BUllvqT7bTOcxj0mcljod4ye1L4CjpvIs2LvwqdRH2+ZT985zYLlDNWp+y

Fixes a logic issue in mlxreg_lc_completion_notify() where the
intention was to check if MLXREG_LC_POWERED flag is not set before
powering on the device.

The original code used "state & ~MLXREG_LC_POWERED" to check for the
absence of the POWERED bit. However this condition evaluates to true
even when other bits are set, leading to potentially incorrect
behavior.

Corrected the logic to explicitly check for the absence of
MLXREG_LC_POWERED using !(state & MLXREG_LC_POWERED).

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

