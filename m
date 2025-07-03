Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BC628DEFC;
	Thu,  3 Jul 2025 07:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751526361; cv=none; b=Jfmiz2M1m2yDFXdkj/89hyFR8/dhPxBvJT8/pbX5oqJUBTtIuIOjdi46Ca4KmmP7yV4GrED0Ze1+Pps7d3R3dEuJbvoQonflRX6dms1uXUfUmdguiD8WERHxzfAFZB4vg5hmEluHz+GVsLUn8wA1+moN8q6S7IIOh8M8LCH2EdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751526361; c=relaxed/simple;
	bh=tBX3Tg3ZfLvRGBRJcdXBb4meVKOpJNXtvcqZIoRXPkg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uCWhZKzMJzQSZp1J4E7gz1GKJiZG/rJu2Ia9WiY8tjf0d7DCG0q5CldvqEEQAsyfSDiMyalLu4m5lN4Rl8TMVsfsiNwDPwKSy8OaNYtmWaZHgq7/Zu5ZqchkUfrb/Ev4b5NM3uMy8cpODQK5VyeclqZr1Hd/NfU/sZVgbjn8pN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=AK+vrpSy; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="AK+vrpSy"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562NgNEf014382;
	Thu, 3 Jul 2025 07:05:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=6fw1m2vaBWJlrtGVTkLjgbYrt5r6+
	Vs0ITunB5NdSY8=; b=AK+vrpSyoVE59XyXPxwUSDqIsrfqcbWAtH0+WZIC0eWEP
	ji/XiBXBTN4tEk3kv6ImXOglnuHQDPTXJoXpm5aUJooXHWWdsLRDYl8Nnt/Vm6sz
	VPsYlh22Hd8z8mGJraXrLplyAko8uuXhVCUxySKQeNIZMfXClnoFDCLj+bKhwTCE
	SEnndhpS0jPvW9ELIpwyB+cs3AdZhXaF/p7UncM9MlzDLNF93db543g0jqfH57LW
	gg2/iRmW9VGDr3QGrpLABGXPZye/DxjutW9x2kkcg9ClwBIxI0yPPG+8rVUF+0fX
	yPhiktaLXSI2EOBj7VKS5fYH4TJKBt3aVbDKdXNQg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47jum7yp74-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 03 Jul 2025 07:05:49 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5635CCrB019238;
	Thu, 3 Jul 2025 07:05:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47jy1h1b9t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 03 Jul 2025 07:05:48 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 56372vVT013043;
	Thu, 3 Jul 2025 07:05:47 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 47jy1h1b89-1;
	Thu, 03 Jul 2025 07:05:47 +0000
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
To: Dave Penkler <dpenkler@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Rubin <matchstick@neverthere.org>,
        Gaston Gonzalez <gascoar@gmail.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        =?UTF-8?q?Paul=20Retourn=C3=A9?= <paul.retourne@orange.fr>,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, error27@gmail.com,
        harshit.m.mogalapalli@oracle.com
Subject: [PATCH] staging: gpib: lpvo_usb_gpib: Remove unreachable return statement
Date: Thu,  3 Jul 2025 00:05:30 -0700
Message-ID: <20250703070542.1957371-1-harshit.m.mogalapalli@oracle.com>
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
 definitions=main-2507030055
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDA1NSBTYWx0ZWRfXwOYQtWWpo+eu /KaI0S0fl9Ax+HNsVMXygXKX/+xPZJaQktcOnfzhsnS+MbKPV+oenjKgwwPa6pCgFNIPeS4UDhq KZfkRmzLoJONVJdtyJfwiaEzrNGLmPK3dPkNZID/8QlRTWsIjotZFKxPqIDwgm1kalh9NZCXjrX
 vQt+ACHDJ0J+AoL2UoC81rPOsRG4UcbmoRVBjbSnOFTQoLa4y/x5lmNiyqCY9sY5l6WHVuPkzIV Ju5yi1/6Z63ZQk4zfKQxjaHcIOe3olF4qpUleTqPXiBntWlVkmzLWX/mfhv9ImMinQVaANDDxxq WoxNXhwCMZXdyL5K8cYEwW8+jmwiEFITaWLy9184eGSIzp741YZLKQj0k7AWPOIvBHRCzLxQ2Kb
 MuyFxHpsHh0nQJzT2IKZqkZs77WpYasB7MASovj0I9R3GcvuY9UnUDy8UtMB1HK4pahjBCIh
X-Authority-Analysis: v=2.4 cv=MvBS63ae c=1 sm=1 tr=0 ts=68662bcd b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=Wb1JkmetP80A:10 a=yPCof4ZbAAAA:8 a=bvPFxI6Er8ueAQ2jocEA:9 cc=ntf awl=host:13216
X-Proofpoint-ORIG-GUID: CLM-6_-k_sNdTvimqN80lWCX9AC06xOw
X-Proofpoint-GUID: CLM-6_-k_sNdTvimqN80lWCX9AC06xOw

usb_gpib_read() has a return statement after if else which is
unreachable, clean this up.

Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
---
This is detected by Smatch
---
 drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
index 3cf5037c0cd2..dd68c4843490 100644
--- a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
+++ b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
@@ -791,7 +791,6 @@ static int usb_gpib_read(struct gpib_board *board,
 			return -EIO;
 		else
 			return -ETIME;
-		return 0;
 	}
 
 	/* allocate buffer for multibyte read */
-- 
2.39.3

