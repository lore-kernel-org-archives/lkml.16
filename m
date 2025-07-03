Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6FC2980A3;
	Thu,  3 Jul 2025 06:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751525559; cv=none; b=RPlghQSgZrlFP4U2MnVqJ3zzzMad7NYDsU5204gjZTcsGSnrCa4F7xw23SWGbTwG7zcg5hXZssz26LsZgNjuWMCg1gpQYBoFOAJk6BkW0XRqKIG+vqRBtiQgbvmBkaFToU1fgGCQ1hjCmVKkTOXsttc+OCrvwXv5xgzGaQkGLqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751525559; c=relaxed/simple;
	bh=DqN2N5ueI5IMCu7gG6Cy+ZAUpQ8Bbr6GhxkJYGn1eTk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KQOMVLAoxsUacqWi+WGN9I+U5QPmqf32JFrFVAifWA5wysGEZ4EJ2BA048oRDrDOMucRKXlI6dcMczS0eAnNj0QxuABdDRY8Bg5mMXw9mSh7Kw2zKh/ig4sXc5noGrxA8R8Cpw5lvkGE2v0HO19oKOfSolLw17Wn9gUk9rakgsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=AiAnOF26; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="AiAnOF26"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562NfgVw012956;
	Thu, 3 Jul 2025 06:52:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=e+EyyLxfVVwKroGuM7/9TQt49EDWq
	gpZLGakvFamdiY=; b=AiAnOF26OVMg8RbUdnosu778CgKG2wejUkVWLtYhGiw/+
	3lvPWJw4d4v2sQAVAyumXucaQKZG0F8NtmiHjU03tE2OBCJ13uiAaPKHBe3JBw+r
	c4heDAWj7fsP6Xuy4U+yQye9heqFo69RPRUYDenziC2Ptao5nB7OAxMa2CZccsT9
	oHG3aCexUhBojSmgmGV39dLjW3kmxnJVHZ4rZMynZ+O0YFbIBqMk74MSy9gr2muA
	NKxf6mJdTqTgcNOSwubYyIL5/aks9A5puhOOolwf7Av/wo1Si1Nj0hOuyU78xv9K
	UYwZhOVNaxv2ec90dd9Qko5EKwJHwLfmWHtvZ2lNw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47jum7ynkt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 03 Jul 2025 06:52:29 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 563643bn019310;
	Thu, 3 Jul 2025 06:52:28 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47jy1h0q34-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 03 Jul 2025 06:52:28 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5636qRva013575;
	Thu, 3 Jul 2025 06:52:27 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 47jy1h0q2a-1;
	Thu, 03 Jul 2025 06:52:27 +0000
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
To: Dave Penkler <dpenkler@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Rubin <matchstick@neverthere.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Nihar Chaithanya <niharchaithanya@gmail.com>,
        Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
        error27@gmail.com, harshit.m.mogalapalli@oracle.com
Subject: [PATCH] staging: gpib: cec: Fix inconsistent indentation in cec_pci_attach()
Date: Wed,  2 Jul 2025 23:52:14 -0700
Message-ID: <20250703065224.1956688-1-harshit.m.mogalapalli@oracle.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_01,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 mlxlogscore=999 phishscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507030053
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDA1MyBTYWx0ZWRfX24Zjpo09pDd9 9IZm3uMwNxq1df4b3NjSvtzflmd+QgWATaefPoWZCpvKmh5vSVh2N0M+L1LrdhsEmNHY+jtR1NT j3/Yynof9WKX+12jxtT4LEHgHolEcHfc8BU4TxkCa+7xLaVb1Eu1HYgjbvorNrPBzoNMAZW6RoT
 l94hwY01LB2cAKRnvS+rbnB45IzsPTvNBFGacp7iRnmWfC9vLX/vt4Aye2ZWWkRQ2KRRBs3T7n/ 7xyM6W+77k3oWF8aMWnpx0/LwuX5LDbB0U6SYu4uzEj6iOT2GOXvVXi/TEJCxL5D7Ki8+vVNfVJ x1sUykzwqIjGmPus36zRQgy6WZY/EdXyqnTVVOSf2qdpFk/5Ub1J9uNoHOjSOtH2lDoq++7oLep
 eDI4nuXYdHPrYtmfWufqgfNB+LKB1IduYemvPt1efLs+mF73YHiwEbzPCikVrQ/5IJdbJ1Of
X-Authority-Analysis: v=2.4 cv=MvBS63ae c=1 sm=1 tr=0 ts=686628ad b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=Wb1JkmetP80A:10 a=yPCof4ZbAAAA:8 a=paq7JNiWqQOroC8ECiYA:9 cc=ntf awl=host:13216
X-Proofpoint-ORIG-GUID: KmuWAf26nqlHZmSczEf8XopVzZ4KlFbx
X-Proofpoint-GUID: KmuWAf26nqlHZmSczEf8XopVzZ4KlFbx

This is a cleanup which fixes inconsistent indentation. This is found
with smatch.

	drivers/staging/gpib/cec/cec_gpib.c:305
	cec_pci_attach() warn: inconsistent indenting

Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
---
 drivers/staging/gpib/cec/cec_gpib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/cec/cec_gpib.c b/drivers/staging/gpib/cec/cec_gpib.c
index e8736cbf50e3..0c9d10ee7cd2 100644
--- a/drivers/staging/gpib/cec/cec_gpib.c
+++ b/drivers/staging/gpib/cec/cec_gpib.c
@@ -302,7 +302,7 @@ static int cec_pci_attach(struct gpib_board *board, const struct gpib_board_conf
 		return -EBUSY;
 
 	cec_priv->plx_iobase = pci_resource_start(cec_priv->pci_device, 1);
-		nec_priv->iobase = pci_resource_start(cec_priv->pci_device, 3);
+	nec_priv->iobase = pci_resource_start(cec_priv->pci_device, 3);
 
 	isr_flags |= IRQF_SHARED;
 	if (request_irq(cec_priv->pci_device->irq, cec_interrupt, isr_flags, DRV_NAME, board)) {
-- 
2.39.3

