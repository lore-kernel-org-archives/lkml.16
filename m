Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1719010F9;
	Sun, 22 Jun 2025 17:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750612665; cv=none; b=HEfIiW5hSCMul9dpNhlsIp5l+cYjZNo1ya9V4LMt90Ux25dEimtHtfL05uTcFu50zBjxDJVxS0aiQczo/h67V3+vxedteKPfP7cxNIwtDWhBRM1rA5Q6ej9a1HcAZq0A13QEfD2IRPbdVoAuJEYogZhq7k5PPJTk5tOip7aV0iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750612665; c=relaxed/simple;
	bh=6bio/VA7k9yedYd2ETaZ+blxsWM3wyrSGyiRBz8h+ik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BRstA7u7dCBW1dSiXZYX7++ChdjPIcBpotJBULi4PsTh6DX6o3yF6YZgBd18x4HKzJDBIl19f/aw0XEzebB8/0tTSvAyIG8vWFGi3/tet69TxsPKN7k33UR37sf5ThFXXpKIvAz89iVZlFT8/UhvLagLFuzXWhvsrmpO6HhsM+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PCDLqCgU; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PCDLqCgU"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55MFN0LP012914;
	Sun, 22 Jun 2025 17:17:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=K9rzL
	NcPOcVRexGVfNK3MJBUJ2gnAZrjSa2+15R0IpA=; b=PCDLqCgUBLeb6ZZ4gh91x
	IprrRatDZfj/IWruqEVELfuPyUab6pH3vanVanAWf9O76dv0dr5bN8EralrPEbVj
	JoTAL/PGVhkHRC+UXwsug84K+Zva5ob1Wf8aPUm2+KjoUibr+jXmkYaKAh0l7iIh
	LEhgI2SV/0QPQaw339KOYfdT+SVHcYIXuTqYSyerJYOr93wRe0MfvYzXW3aBM7nf
	RUJI7ErzAUtiv+CFqyoAFoAEJXWSOubyFuPPRr4I1XmePM7lbh2q2SAzlWFugRYo
	SX5+mcN5mkb4xElBUdgO2TLaEv6wxPp3KCN4OG97lTKo2Zrs+xnHsHd57OD4a4OV
	w==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47egumg61c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 22 Jun 2025 17:17:38 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55MCACMt024331;
	Sun, 22 Jun 2025 17:17:37 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ehknkj7w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 22 Jun 2025 17:17:37 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55MHHZKe002548;
	Sun, 22 Jun 2025 17:17:37 GMT
Received: from ca-dev110.us.oracle.com (ca-dev110.us.oracle.com [10.129.136.45])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 47ehknkj7c-2;
	Sun, 22 Jun 2025 17:17:36 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: mika.westerberg@linux.intel.com, andreas.noever@gmail.com,
        michael.jamet@intel.com, westeri@kernel.org, YehezkelShB@gmail.com,
        linux-usb@vger.kernel.org
Cc: alok.a.tiwari@oracle.com, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] thunderbolt: Fix typos in documentation comments
Date: Sun, 22 Jun 2025 10:17:03 -0700
Message-ID: <20250622171705.4148948-2-alok.a.tiwari@oracle.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250622171705.4148948-1-alok.a.tiwari@oracle.com>
References: <20250622171705.4148948-1-alok.a.tiwari@oracle.com>
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 adultscore=0 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506220109
X-Proofpoint-ORIG-GUID: 7o9iXLRFzcD1EDizYhzInR8m_56O1IpY
X-Proofpoint-GUID: 7o9iXLRFzcD1EDizYhzInR8m_56O1IpY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIyMDExMCBTYWx0ZWRfX7rUT+8KLQCJG OVt9EKe2d+E9mtbOJtOxRmBLv1/R7I2OofQBL8GaMSlBTdgDrOxJuDQh7ksrKQo36FKk0Y1H9Sy XJacRBUcINDBOU09Dt9msfBfD7Hi05AsU1l6aEA0BkaaqSfM9r3bl7SdNHCHJzYENYpnxJV6eoq
 kLF5r5vJDC1KruRSYhQK8W7dXKXhqwlAE0xPMTa7rwImsykKOiP14n0E9VwDEHXTWQhBhPz6wAv dLwe4vEKczVfCNQmqRXZPy0khz6+w1W7OJrUrJ4Sl/ics2i/FGw7ohPF3dI/2r3KQ53m06+7q9m pOlUH9B3fxZSyNzh3ZP8Qmn9bGVNfNQmc56NSWipreQxylRYTgMczZN3gOJYhiZWsS6tQgBNihU
 SyoqyYfKa5GoSnAYhFvQhN+PqaycNSw73YzF3InZGxvHkYPQF7kQtf/ktBsw5dYKoFnxUG2e
X-Authority-Analysis: v=2.4 cv=S5rZwJsP c=1 sm=1 tr=0 ts=68583ab2 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=q4LJMcXUggYVvoTylR8A:9 cc=ntf awl=host:13207

Fixes two minor typos in Thunderbolt driver comments:
Correct "passwd" -> "passed" in nvm.c.
Correct "boths" -> "both" in switch.c.

Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
---
 drivers/thunderbolt/nvm.c    | 2 +-
 drivers/thunderbolt/switch.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/nvm.c b/drivers/thunderbolt/nvm.c
index 8901db2de327c..da11c8112e29b 100644
--- a/drivers/thunderbolt/nvm.c
+++ b/drivers/thunderbolt/nvm.c
@@ -588,7 +588,7 @@ int tb_nvm_read_data(unsigned int address, void *buf, size_t size,
  * @size: Size of the buffer in bytes
  * @retries: Number of retries if the block write fails
  * @write_block: Function that writes block to the flash
- * @write_block_data: Data passwd to @write_block
+ * @write_block_data: Data passed to @write_block
  *
  * This is generic function that writes data to NVM or NVM like device.
  *
diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 36918a656f456..3ee16a9ec736c 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -3069,7 +3069,7 @@ static int tb_switch_asym_disable(struct tb_switch *sw)
  * @width: The new link width
  *
  * Set device router link width to @width from router upstream port
- * perspective. Supports also asymmetric links if the routers boths side
+ * perspective. Supports also asymmetric links if the routers both side
  * of the link supports it.
  *
  * Does nothing for host router.
-- 
2.46.0

