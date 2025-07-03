Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189672CA8;
	Thu,  3 Jul 2025 06:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751525211; cv=none; b=iJlTpLZ7WSeUMRzF0LUedKK53MPcLeTAnqo67tfTVb9gbYYkGoHI1u1W1Lioi5E5ghwI2YrikiV3vptlCO4mRHLtG0G/HjwFR2UvybjEll7LsIOhQA6gfLIOpsH+JRh5bliI7kC4zF1oewXKn/YcEExCY85sXlCjhUuJIPDUOag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751525211; c=relaxed/simple;
	bh=1h5TPd55ltb1cF5HiLS1oUhT/olWSyif6crgqvuQYs8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S7EL9BxoihVy6ORFslkEsemGZheBuBfuDGbbBOWrrDjdG2AiUypclHPzM/H5L2qAAD/OB/9ApApicVDEAoHTlvmdFAqB3zNbs9BYZiSxAYQHYcKE21oUv2HyT4A/vCeUgF9MZ/Gh8ssr1F2wLxkSQL0oBN9HvHgD+leHLU0jIqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Oztd8u0v; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Oztd8u0v"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562NgAAB003318;
	Thu, 3 Jul 2025 06:46:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=hD3988gsGj7I9mn2vdMIRzbpeY1nu
	ln71Ph7htv6RGY=; b=Oztd8u0vFKWM+g61pNiEucdm2gR90bVYAmB5Ce3p7zFer
	FUQcGH9j0hLab0FgIk6iUsfr1t36LwF7kVBsaPMFPd0zdXc2VSbDqtKfgtsemsfo
	t+PqHIlayaufK1i/ctYZ2LEEHddNLxZLgrws75n3ZzKM7iLj6nZ4QETiPqaj1QmL
	Mza4e6Dwy1KE+C+vvy2+XzNfAtGaMTAsuPGLqwuTI1nZyJOX7wHzi4+U+iL6v9/9
	8lZMbZViMwyg+E4lDdN+6fGrku2w9vF+o/0Bsfp5G7/+34NO3yi63WSQ/0GGydAh
	X0Qgr7QvVbTh5AQSD3emPDesnkVzOZp1oU0XzRJxQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j7af8ctx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 03 Jul 2025 06:46:38 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5635ZbU0019529;
	Thu, 3 Jul 2025 06:46:37 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47j6ubysk5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 03 Jul 2025 06:46:37 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5636kbpo034806;
	Thu, 3 Jul 2025 06:46:37 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 47j6ubysjv-1;
	Thu, 03 Jul 2025 06:46:37 +0000
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
To: Dave Penkler <dpenkler@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Rubin <matchstick@neverthere.org>,
        Arnd Bergmann <arnd@arndb.de>, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
        error27@gmail.com, harshit.m.mogalapalli@oracle.com
Subject: [PATCH] staging: gpib: Fix error code in board_type_ioctl()
Date: Wed,  2 Jul 2025 23:46:20 -0700
Message-ID: <20250703064633.1955893-1-harshit.m.mogalapalli@oracle.com>
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 suspectscore=0 mlxscore=0 bulkscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507030052
X-Proofpoint-ORIG-GUID: E43C2pg2vA-XahmRHDaigJYFf7jR5ekb
X-Proofpoint-GUID: E43C2pg2vA-XahmRHDaigJYFf7jR5ekb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDA1MyBTYWx0ZWRfX/oxgroFtb3Mk o0fcoKYg7gmgKUZp/iPL9RTVbNIJFzFKzmGEaFTrkJdWWvvXigv9yKLikWkOSCBD/PivfpnLfhV Jd5MyClDAsAciD9TgTqpNryDRa/pvSsVnLtkWpluagvWJuu33VuPq9SdDBtL132XzPDGkUqf9Ni
 GxoZctmEGiEq/GnpOCeS+rhkwdL1U4S1W+yCbZRAkSipnqxBBTZxq22j4pOypZrlZVsTxKPNtOD Ax/2ODn7d3N9R9HcNi2qtx5tGIeQWfMd1r589ARitEoFqAC62RW20m41D9kfbA8n2zWZD+zmemC 819y7nrSYiDKfvoja36GpNRUE9YvrCBo78HVQe6ggPBfDjbQ/DjdP7aTDOz1NKrvIf3wA8twbcC
 /LeTrZyy3hPX0Ic4qOdoE9QGNmdAdI5RHy5jg1giK63oC/ecd/eG1Ys/qnnAzDXBBYVKnO1T
X-Authority-Analysis: v=2.4 cv=b5Cy4sGx c=1 sm=1 tr=0 ts=6866274e b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=Wb1JkmetP80A:10 a=yPCof4ZbAAAA:8 a=NzpKSrqDcg9nmPDAc5gA:9

When copy_from_user() fails it return number of bytes it wasn't able to
copy. So the correct return value when copy_from_user() fails is
-EFAULT.

Fixes: 9dde4559e939 ("staging: gpib: Add GPIB common core driver")
Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
---
This is found using static analysis with Smatch. Only compile tested
---
 drivers/staging/gpib/common/gpib_os.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index a193d64db033..cd7ea7f4fbae 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -831,7 +831,7 @@ static int board_type_ioctl(struct gpib_file_private *file_priv,
 	retval = copy_from_user(&cmd, (void __user *)arg,
 				sizeof(struct gpib_board_type_ioctl));
 	if (retval)
-		return retval;
+		return -EFAULT;
 
 	for (list_ptr = registered_drivers.next; list_ptr != &registered_drivers;
 	     list_ptr = list_ptr->next) {
-- 
2.39.3

