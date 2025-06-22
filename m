Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FCE3C3C;
	Sun, 22 Jun 2025 18:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750615503; cv=none; b=BifAN2vxj1kRBGgjmDVRwnwfmneOM9GDi+ygzcEl3w3PPC8C2bvY4/iB/YqPIEi9l5RnPI4g6RNK075foyHG0OGGGtyZO+AQtv515MjJPnwhRdmAoNQVdyLqIar+lw89kwehjpfCD/tIwSNj5T6p70nNcfHpx8T/TZK0jHuZ9nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750615503; c=relaxed/simple;
	bh=w8foV68d39JwQr8G+r/PaGRrwf7ZXjBuJQRRkwRncms=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IXr4Zw1wgJAX0Te2gxT4K67+VAMQ8hRomMdxFZWcxvWX8eJiKCtwIiBXGjikcq7JIQAqprFzoMQ877RAvhkx7nXbT3UYfLBbFhtrziqWV0YO+Yr7Z5oOr0WfJteirrcw9iEi8QitKXogI6e7Fc5BP2FeenKO0uV2fs/8gzxmYdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=LgjkSwdF; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="LgjkSwdF"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55MFOsmY012084;
	Sun, 22 Jun 2025 18:04:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=2ZadFmUpgwRwCkvnChkIoUOWgsfQT
	tHLA1DRXKQ/D1I=; b=LgjkSwdFpnuyut+cLviGogaOJXEodYmiPtQGgYndEItrK
	O76AHi9vyskAjOcZHdYYEDbRDu+/Ctnhofoqajp00Qmysk6u2zeT3L29XSpGeFic
	n6dCQ8U4z+Qnzi8DK99rzLHkuN4TpdiHBpnt+w5muSAD581I7n161m2X3ZOReHz1
	hD4KiUXptAkw3ohAhuC8Y1gz+Fjjmsdu7uqwviEuXQL7wI6J6LMno57uHgsZgpwV
	tX1/kLqUD8BIeL7xORQn2fE5KPtAFvuwDB0UT1/OrscWjUfNIparaG2X6WBsvaie
	9KA2lTxsbvzDCErwP1chdeVeO2A3pGnIJC8yDuadA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds87s9v0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 22 Jun 2025 18:04:53 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55MCHR1g005018;
	Sun, 22 Jun 2025 18:04:52 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ehq1kx3v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 22 Jun 2025 18:04:52 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55MI4q8O039284;
	Sun, 22 Jun 2025 18:04:52 GMT
Received: from ca-dev110.us.oracle.com (ca-dev110.us.oracle.com [10.129.136.45])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 47ehq1kx3m-1;
	Sun, 22 Jun 2025 18:04:51 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: conor.dooley@microchip.com, daire.mcnamara@microchip.com,
        mturquette@baylibre.com, sboyd@kernel.org,
        linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org
Cc: alok.a.tiwari@oracle.com, linux-kernel@vger.kernel.org
Subject: [PATCH] clk: microchip: mpfs: Fix incorrect MSSPLL ID in error message
Date: Sun, 22 Jun 2025 11:03:49 -0700
Message-ID: <20250622180352.4151679-1-alok.a.tiwari@oracle.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-22_06,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 spamscore=0 malwarescore=0 suspectscore=0 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506220115
X-Authority-Analysis: v=2.4 cv=a8gw9VSF c=1 sm=1 tr=0 ts=685845c5 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=toDgYEdFdHzvqbp0uI0A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIyMDExNSBTYWx0ZWRfX6PGt+odVXGr2 XfLf9nAOge5rjjx1uBXZogG92CFvN0ScQ2yNRBc0+5wLVkBsdnn1VMLr7i6YUmtLvd2mLagm4l3 glST64u+VBtu8UcLDUiCar6w6yWs1U4ypWKFAWxiG5mzEhQdqm01TjgD94If819sDIBpT1lWawg
 DUyA7XM60JDMUQVsFzRs1xlpPWVkcevT1qRTW4wEACG93Giq+GsGvM6JRoOoxYIVe9EXnPGe/e0 NGcqisiFedSOGNYDX4R8zGncjRsQ690RZi4Sd8TC1hFZOy6e3sy/Fc/xJXhnhYd3j1oETEz5Wtw kCb+H4Bws6FmnERIObvCeQb1o2Dju7n/TFV2wAjqZSm2igsGa/RSaIc1CgXm2vFD/Gl1Jzy3iRo
 U0OAZFdG7IfBMjQyj5Y7Nw7qOZtRF2RN1ZJ+yrg7e36SxkvrJUtYzmwXjUImr/28XV7LG1nn
X-Proofpoint-GUID: iVe1w60Qm8PEt_UYtpad-pB6n6NaiNST
X-Proofpoint-ORIG-GUID: iVe1w60Qm8PEt_UYtpad-pB6n6NaiNST

The error message in mpfs_clk_register_mssplls() incorrectly
printed a constant CLK_MSSPLL_INTERNAL instead of the actual
PLL ID that failed to register.

Update it to msspll_hw->id for accurate diagnostics

Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
---
 drivers/clk/microchip/clk-mpfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk-mpfs.c
index c22632a7439c5..d12b7120f16ff 100644
--- a/drivers/clk/microchip/clk-mpfs.c
+++ b/drivers/clk/microchip/clk-mpfs.c
@@ -160,7 +160,7 @@ static int mpfs_clk_register_mssplls(struct device *dev, struct mpfs_msspll_hw_c
 		ret = devm_clk_hw_register(dev, &msspll_hw->hw);
 		if (ret)
 			return dev_err_probe(dev, ret, "failed to register msspll id: %d\n",
-					     CLK_MSSPLL_INTERNAL);
+					     msspll_hw->id);
 
 		data->hw_data.hws[msspll_hw->id] = &msspll_hw->hw;
 	}
-- 
2.46.0

