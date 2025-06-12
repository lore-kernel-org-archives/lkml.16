Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD3610957;
	Thu, 12 Jun 2025 18:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749753828; cv=none; b=Jithc3+e7fi71pVvr7MzlodvcwZ0HilBvVjaocBVstiUfFcCNCNdUqwSlwjuP/HxCMOeZjAuIGnTy1pqveBUD4/lZSR1YSGIKAERDsTdVDeqbmQXoe6JhKa32s97nnDOMAy7Xxz/+fwGavpECjdsX/VDXt411eY1rtSD5WvmTSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749753828; c=relaxed/simple;
	bh=/3k0Je/+h39bAuq8J1HlcAIFG5fJvuyqjCMW1xdl1XY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JPFaFQ2NB09zR7K2dy0FFE6s+1xv41LC6o5Ce2bk6ob7f2vnazegNQTYEoHstBk5mPubPIZenrakokdYV5XO/5u6CQx+gi+wBOvf2f4klb3PvcxfcphDaLYJtva51I4JxsHhMZKC1mO+Wm6yQ+LOeAawjmwQ7Wuq/SXaF/pd6d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=CWP8m4Jt; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="CWP8m4Jt"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55CCoHV0001157;
	Thu, 12 Jun 2025 18:43:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=wr9q00w4ILHr79t+qu7qbDsCjzlNlCWYFL/7rhx0k
	J4=; b=CWP8m4JtDUSDDdccSip2js8r8F7iHaVKPd2JaqRJBcodATjBPGCKFBqoa
	Rgs6eH8eN2ZtV15SOz/ejK7psztCemjTvPw8c/gwtdsHDIL44TEbDdrFrG44X9u3
	NaM+Dy4cQwJ+zp4V5oSSiWaQJ1YlI4Z/haQfkR8gcNA9sGF6+aN+R5Fe8ppglsJm
	RdF2iE9yPn6C+PkKmRagnUV9GFG8D9XQCYZPxrIv/WNBg1ZIn4kkUI+Kg/ou3yuf
	mtAYAzTfSyWKtQBetX/Qo7EzdcyWEk3Dct4F1uxFFIrLaqhgoGQukeeHcu7d/3x5
	ysL2YfKDkMkib9AB1kpfd6R76ZiPQ==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4769x01cd2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 18:43:33 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55CHjDAZ021879;
	Thu, 12 Jun 2025 18:43:31 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47505069n2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 18:43:31 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55CIhRPg27525850
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Jun 2025 18:43:28 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ABAE45805E;
	Thu, 12 Jun 2025 18:43:27 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D4ED858050;
	Thu, 12 Jun 2025 18:43:26 +0000 (GMT)
Received: from spec2code.sl.cloud9.ibm.com (unknown [9.59.201.160])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 12 Jun 2025 18:43:26 +0000 (GMT)
From: Qiushi Wu <qiushi@linux.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: jdelvare@suse.com, linux@roeck-us.net, linux-hwmon@vger.kernel.org,
        zohar@linux.ibm.com, qiushi.wu@ibm.com,
        Qiushi Wu <qiushi@linux.ibm.com>
Subject: [PATCH] hwmon: ibmaem: match return type of wait_for_completion_timeout
Date: Thu, 12 Jun 2025 14:43:24 -0400
Message-Id: <20250612184324.1355854-1-qiushi@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: as2x7WG83AblcHTf1ucP3kP1sy5kDXNt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDE0MSBTYWx0ZWRfX/8zVgA25E157 3TcFLGYdZRxoSyVRsSGTX6xCsvwEcsJVABP6vPSDFXMoLEvphTlODCQXIYxaaU97Eap4RC98Os8 rnqlkRAeXUcbC8kYgSb67ps3O0C4hizBg4ihtYnP+Eo5hWJNtFRcOCne2/6HekpYLaxl56s+j5F
 0tVO0dEfKlW9SEsKDTMUTtK2HkI8CKxFdnWOq+Yrv79TgrgaiMLHCmKM6FhImpGLxSKH56QjCnE 0hBl8w2h5EuB5LiQ2MxSihJ7gBPdZmAoiy40s1a40wUPdfE9z7BPeaW6PtJT92KtGNxEuQrgBo1 KWuJgL2uGk1eNWMyqbReyWz+eH2j3uIi0o3tEy9ldpHSnlfCnJSZhnNEN2drH/MOU7DJX298zej
 u99z2KF7Ni11JX01gkICJfI5XV/iWPJN8Ih2f0glPVmotFC1lZFXnOmPRFZAejgeTrW6v7Ls
X-Authority-Analysis: v=2.4 cv=YKGfyQGx c=1 sm=1 tr=0 ts=684b1fd5 cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=6IFa9wvqVegA:10 a=VnNF1IyMAAAA:8 a=0tZVAJr0HtVguEOAQVkA:9
X-Proofpoint-GUID: as2x7WG83AblcHTf1ucP3kP1sy5kDXNt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_10,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1011
 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0 mlxscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506120141

Return type of wait_for_completion_timeout is unsigned long not int.
Check its return value inline instead of introducing a throw-away
variable.

Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
Signed-off-by: Qiushi Wu <qiushi@linux.ibm.com>
---
 drivers/hwmon/ibmaem.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/ibmaem.c b/drivers/hwmon/ibmaem.c
index 157e232aace0..e52e937a396c 100644
--- a/drivers/hwmon/ibmaem.c
+++ b/drivers/hwmon/ibmaem.c
@@ -383,8 +383,7 @@ static int aem_read_sensor(struct aem_data *data, u8 elt, u8 reg,
 
 	aem_send_message(ipmi);
 
-	res = wait_for_completion_timeout(&ipmi->read_complete, IPMI_TIMEOUT);
-	if (!res) {
+	if (!wait_for_completion_timeout(&ipmi->read_complete, IPMI_TIMEOUT)) {
 		res = -ETIMEDOUT;
 		goto out;
 	}
@@ -491,7 +490,6 @@ static void aem_delete(struct aem_data *data)
 /* Retrieve version and module handle for an AEM1 instance */
 static int aem_find_aem1_count(struct aem_ipmi_data *data)
 {
-	int res;
 	struct aem_find_firmware_req	ff_req;
 	struct aem_find_firmware_resp	ff_resp;
 
@@ -508,8 +506,7 @@ static int aem_find_aem1_count(struct aem_ipmi_data *data)
 
 	aem_send_message(data);
 
-	res = wait_for_completion_timeout(&data->read_complete, IPMI_TIMEOUT);
-	if (!res)
+	if (!wait_for_completion_timeout(&data->read_complete, IPMI_TIMEOUT))
 		return -ETIMEDOUT;
 
 	if (data->rx_result || data->rx_msg_len != sizeof(ff_resp) ||
@@ -632,7 +629,6 @@ static int aem_find_aem2(struct aem_ipmi_data *data,
 			    struct aem_find_instance_resp *fi_resp,
 			    int instance_num)
 {
-	int res;
 	struct aem_find_instance_req fi_req;
 
 	fi_req.id = system_x_id;
@@ -648,8 +644,7 @@ static int aem_find_aem2(struct aem_ipmi_data *data,
 
 	aem_send_message(data);
 
-	res = wait_for_completion_timeout(&data->read_complete, IPMI_TIMEOUT);
-	if (!res)
+	if (!wait_for_completion_timeout(&data->read_complete, IPMI_TIMEOUT))
 		return -ETIMEDOUT;
 
 	if (data->rx_result || data->rx_msg_len != sizeof(*fi_resp) ||
-- 
2.34.1

