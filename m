Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E77186E2E;
	Sun,  6 Jul 2025 20:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751832761; cv=none; b=iwkAMcyEVLqykmfqK+C2n5qSzXy+7VTV2KMXJsxLc59nVWhqqG9eRYBzUL6w2bDD0rNhUwmZyT1vhcnZJzXLd2RJqeXiwjD84jPhWlvp/zOPPEG19R1v9WFr8BAokM7wG3RBaq9vVjZ0x07UJZGJOYJhujWbOeT6P6HI3dkHVT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751832761; c=relaxed/simple;
	bh=JemThpQT4Mwgyp9MEbhDTRBUVRkJFW1Obj0vz65HHO0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tIOEjr0PbDBd8Wi2OoXBSkECk6wz9i6WIwgnTVB3MNiSjcXjWlvn9+OKeNxJI5LZywUkysoPxS41FzC/Ss869FQGz+mjlx0JLKUvVL7Mt38KeHXArCB7VMnt0NVdN+hqFe+16HRQsVJ9F++doLUsfQEw9rqC+67KS9LZlyDmgw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=lrTMXZH9; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lrTMXZH9"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 566K1rqt030512;
	Sun, 6 Jul 2025 20:12:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=mlKlCit7KddioLELQTykxFkx0pZeK
	NfZqCUvvxa16zA=; b=lrTMXZH97aqnuRvrRFispPlgUFsLAtK/+PQY9BBQoqLmH
	lb+SHvUZoA2OZPi35RLNkStmcZhzIm0CcdocxwTPd7rEJUr8x1B8OU9zKtD47JyZ
	rAZZ34TXJGiqyz65aKsZlC5cRG70aPNI7UkU1Y6+jo2GB6AiBjGUx9vvpLNPBVWX
	Ng/4TBgqBAmiItj2nWV3pENNxg4LR8ACHqYSUOouCTpIP7CGE1vAiaNRNorH8eIM
	eso48Zei34vVNNgBHnJ8HoQIzzSuBs2WO+fF5sjxhIP78UbYpbQ/m371RmK+6myX
	+i75DHnAS7kP/8SHWGBTY5/fPe3EFADwKlgIRWJog==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ptu7hggv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 06 Jul 2025 20:12:30 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 566G5uv3014045;
	Sun, 6 Jul 2025 20:12:29 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ptg88s19-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 06 Jul 2025 20:12:29 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 566KCTTJ023146;
	Sun, 6 Jul 2025 20:12:29 GMT
Received: from ca-dev110.us.oracle.com (ca-dev110.us.oracle.com [10.129.136.45])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 47ptg88s14-1;
	Sun, 06 Jul 2025 20:12:29 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: sboyd@kernel.org, vz@mleia.com, linux-clk@vger.kernel.org
Cc: alok.a.tiwari@oracle.com, darren.kenny@oracle.com,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] clk: nxp: Fix pll0 rate check condition in LPC18xx CGU driver
Date: Sun,  6 Jul 2025 13:11:55 -0700
Message-ID: <20250706201158.1371209-1-alok.a.tiwari@oracle.com>
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
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 mlxscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507060129
X-Proofpoint-ORIG-GUID: EO0OIwZfgGTKy9nO_qsIV_01g9htPlqV
X-Proofpoint-GUID: EO0OIwZfgGTKy9nO_qsIV_01g9htPlqV
X-Authority-Analysis: v=2.4 cv=IMQCChvG c=1 sm=1 tr=0 ts=686ad8ae b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=Wb1JkmetP80A:10 a=yPCof4ZbAAAA:8 a=iP8tuSmc3zprJ4ZHs3IA:9 cc=ntf awl=host:13565
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDEyOSBTYWx0ZWRfX2CL2OBE764C6 qIJGE8gMay+tFcHVlGbIjtpX/bCpMx8rigmATsDcITiRQnR+LlLYFQxPAQjENc0jcNYRSeYIuBK cROygX5PctzF1jTS9BG0G/NJlcuG81EVrHtAr9+eGwY1deWo8os2s/M68lRExpvthcUqHCPH0td
 yDA9TZ21DDx63nXv9XkvGc9yxhxFlT7YDlVKm9DdH9iD7lizUsEfsYdEFH7gGZW0XweRWcncI2d seFxKU+IqDyx3zOWoIDoIf8vi6Kc0q3togvOf9DvIAwwOUkDUpBKLviRBQPEAx6Hg1JfS5MWMfw k1SV1TrBXaMef5QzY4LBDalb20Q0+YD2lbMvMmJfTX1V+OHDbZZD7n7pXBoe8omGfuo+F0RQXf6
 XaqugMuJGLSvD0OBLArTAUPl667rGUqvGwGJXD7YSZsZqoZ/q9P1W09XejzlaAwxk48NjNfp

The conditional check for the PLL0 multiplier 'm' used a logical AND
instead of OR, making the range check ineffective. This patch replaces
&& with || to correctly reject invalid values of 'm' that are either
less than or equal to 0 or greater than LPC18XX_PLL0_MSEL_MAX.

This ensures proper bounds checking during clk rate setting and rounding.

Fixes: b04e0b8fd544 ("clk: add lpc18xx cgu clk driver")
Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
---
 drivers/clk/nxp/clk-lpc18xx-cgu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/nxp/clk-lpc18xx-cgu.c b/drivers/clk/nxp/clk-lpc18xx-cgu.c
index 81efa885069b2..7d8b2ed31abdf 100644
--- a/drivers/clk/nxp/clk-lpc18xx-cgu.c
+++ b/drivers/clk/nxp/clk-lpc18xx-cgu.c
@@ -381,7 +381,7 @@ static long lpc18xx_pll0_round_rate(struct clk_hw *hw, unsigned long rate,
 	}
 
 	m = DIV_ROUND_UP_ULL(*prate, rate * 2);
-	if (m <= 0 && m > LPC18XX_PLL0_MSEL_MAX) {
+	if (m <= 0 || m > LPC18XX_PLL0_MSEL_MAX) {
 		pr_warn("%s: unable to support rate %lu\n", __func__, rate);
 		return -EINVAL;
 	}
@@ -402,7 +402,7 @@ static int lpc18xx_pll0_set_rate(struct clk_hw *hw, unsigned long rate,
 	}
 
 	m = DIV_ROUND_UP_ULL(parent_rate, rate * 2);
-	if (m <= 0 && m > LPC18XX_PLL0_MSEL_MAX) {
+	if (m <= 0 || m > LPC18XX_PLL0_MSEL_MAX) {
 		pr_warn("%s: unable to support rate %lu\n", __func__, rate);
 		return -EINVAL;
 	}
-- 
2.46.0

