Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5D422DA17;
	Fri, 13 Jun 2025 18:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749839078; cv=none; b=AoPjaDYvYciY7qVRErgJTW2kTxH3i1tgPd+PAFxX9d+fkxckEnV1IP2XOoOWeTPbiuLjnlYmAjR8yx81Z18Acw4RkdheC32F37LsccT2zu7+7girqUrrdfywIEug3T6zINYvFBqb12DITWWXVPV+GJNCCkRGVjQuPvFM2my2hdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749839078; c=relaxed/simple;
	bh=u/zWITcOMIRljTDaZ7RdWXJT1XpqzIjlB1a9ruiCQTw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=R4UWGJhDnfj4UejbAQCCnnrWl99L9i7obMJzRO1haEjCfnlXnFMSy6oaNjXL+n39J+PxpBfQkjtCHDAcyuFojTgkK65qMsUVkEZlhrh8ya5LVsuOagCnR3TIZ2IIiYSvLZpdlhupV+C5GBBV9q99158PQhT6YMzLuv5g4Ksi1Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=X0I0IJW/; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="X0I0IJW/"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55DGc2gs012194;
	Fri, 13 Jun 2025 18:24:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=93a2OA8x5WTBOx3V4BM74zkkqwdo71Q9IIak0qIYa
	kk=; b=X0I0IJW/3wBN9hKlyWAq/6FGzFU1tavC5ww8nFLjsGvPSEzpM/WhPVTSY
	SVD5u9LW55wE4rZu2MPsbfWB8LRIzwNlO98FM8d0fYEU6RP97Rpc2rbiWwQTnoHu
	9zl7RK/eQupjg/9RUVx60fFJsPPvZJ9SsP5QxquHq4yaw0K3oM36nsdLO7OcZ8c1
	V7VfoxTqB7ImpLdxGDf1pSQeSMCWl7Rc9I9ZvQCi5AF9ma0vOprr8n8PY1BZkfY5
	SGA+Yj1IqxXHz3duMFDvsSl7o0bOcmoc+sMXiGyqxrah7AHXG1BFtwxIn8WMls/V
	XdKghM8wyCrm7gFNYnoZjEGBIjVfw==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 474hgv1t2y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Jun 2025 18:24:22 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55DEoZY3027940;
	Fri, 13 Jun 2025 18:24:21 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47518mu7fx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Jun 2025 18:24:21 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55DIOH8s918030
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Jun 2025 18:24:18 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A965C58045;
	Fri, 13 Jun 2025 18:24:17 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DBCB558050;
	Fri, 13 Jun 2025 18:24:16 +0000 (GMT)
Received: from spec2code.sl.cloud9.ibm.com (unknown [9.59.201.160])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 13 Jun 2025 18:24:16 +0000 (GMT)
From: Qiushi Wu <qiushi@linux.ibm.com>
To: linux@roeck-us.net, linux-kernel@vger.kernel.org
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org, zohar@linux.ibm.com,
        qiushi.wu@ibm.com, Qiushi Wu <qiushi@linux.ibm.com>
Subject: [PATCH v2] hwmon: ibmaem: match return type of wait_for_completion_timeout
Date: Fri, 13 Jun 2025 14:24:13 -0400
Message-Id: <20250613182413.1426367-1-qiushi@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=Pfr/hjhd c=1 sm=1 tr=0 ts=684c6cd6 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=6IFa9wvqVegA:10 a=VnNF1IyMAAAA:8 a=1kHW3ahkMzfw6R5McVEA:9
X-Proofpoint-GUID: 93Rby3jhY1YasWEmJu87sGQ83iSsTXWv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEzMSBTYWx0ZWRfX/jmC5OOOsrLj zeu0MrTjtPVF9HL8mKazVZlTNRn7g0/OltI7SFqPCMJiChIzx58tkbDX2ApNKZdoN0AwYtQanRt ZFm560jsZNejYmoflGCC37osWCC+lVgNLUllYMiOcGtfAPSXQSk5WFYqAfzMl2kDycFRmgmaYKS
 D5IHNhlPmc/t5S5IAW8cDZPLicj6Bh+8jY6Ss+hgaDWoaiaZBJabC2jlvZPtQ/xxfsgu0Vq4l8x MbEDc9tMjclVnWCGKMMgG44U6d+PbTU2Icw+ZfK0o/WTfid85FdCEt1j/LO2lo97gVlkssBwVcQ /rlOfr2DTopH06ltr913RZqQydhlO3yYMlbRSe14cN/hu4IyeaodWFnHzWQ3J6ooznzJ8znp/8o
 LCTaMpVNmbD3KFVkk8MvcHDPB8IvUJxmjAwC9Mf8yYM66CLSqIgpaT2qfM/uV+eo9d6UPRMr
X-Proofpoint-ORIG-GUID: 93Rby3jhY1YasWEmJu87sGQ83iSsTXWv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_02,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0
 clxscore=1015 phishscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506130131

Return type of wait_for_completion_timeout is unsigned long not int.
Check its return value inline instead of introducing a throw-away
variable.

Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
Signed-off-by: Qiushi Wu <qiushi@linux.ibm.com>
---
 drivers/hwmon/ibmaem.c | 27 ++++++++-------------------
 1 file changed, 8 insertions(+), 19 deletions(-)

diff --git a/drivers/hwmon/ibmaem.c b/drivers/hwmon/ibmaem.c
index 157e232aace0..daed437d34a4 100644
--- a/drivers/hwmon/ibmaem.c
+++ b/drivers/hwmon/ibmaem.c
@@ -349,7 +349,7 @@ static void aem_msg_handler(struct ipmi_recv_msg *msg, void *user_msg_data)
 static int aem_read_sensor(struct aem_data *data, u8 elt, u8 reg,
 			   void *buf, size_t size)
 {
-	int rs_size, res;
+	int rs_size;
 	struct aem_read_sensor_req rs_req;
 	/* Use preallocated rx buffer */
 	struct aem_read_sensor_resp *rs_resp = data->rs_resp;
@@ -383,17 +383,12 @@ static int aem_read_sensor(struct aem_data *data, u8 elt, u8 reg,
 
 	aem_send_message(ipmi);
 
-	res = wait_for_completion_timeout(&ipmi->read_complete, IPMI_TIMEOUT);
-	if (!res) {
-		res = -ETIMEDOUT;
-		goto out;
-	}
+	if (!wait_for_completion_timeout(&ipmi->read_complete, IPMI_TIMEOUT))
+		return -ETIMEDOUT;
 
 	if (ipmi->rx_result || ipmi->rx_msg_len != rs_size ||
-	    memcmp(&rs_resp->id, &system_x_id, sizeof(system_x_id))) {
-		res = -ENOENT;
-		goto out;
-	}
+	    memcmp(&rs_resp->id, &system_x_id, sizeof(system_x_id)))
+		return -ENOENT;
 
 	switch (size) {
 	case 1: {
@@ -417,10 +412,8 @@ static int aem_read_sensor(struct aem_data *data, u8 elt, u8 reg,
 		break;
 	}
 	}
-	res = 0;
 
-out:
-	return res;
+	return 0;
 }
 
 /* Update AEM energy registers */
@@ -491,7 +484,6 @@ static void aem_delete(struct aem_data *data)
 /* Retrieve version and module handle for an AEM1 instance */
 static int aem_find_aem1_count(struct aem_ipmi_data *data)
 {
-	int res;
 	struct aem_find_firmware_req	ff_req;
 	struct aem_find_firmware_resp	ff_resp;
 
@@ -508,8 +500,7 @@ static int aem_find_aem1_count(struct aem_ipmi_data *data)
 
 	aem_send_message(data);
 
-	res = wait_for_completion_timeout(&data->read_complete, IPMI_TIMEOUT);
-	if (!res)
+	if (!wait_for_completion_timeout(&data->read_complete, IPMI_TIMEOUT))
 		return -ETIMEDOUT;
 
 	if (data->rx_result || data->rx_msg_len != sizeof(ff_resp) ||
@@ -632,7 +623,6 @@ static int aem_find_aem2(struct aem_ipmi_data *data,
 			    struct aem_find_instance_resp *fi_resp,
 			    int instance_num)
 {
-	int res;
 	struct aem_find_instance_req fi_req;
 
 	fi_req.id = system_x_id;
@@ -648,8 +638,7 @@ static int aem_find_aem2(struct aem_ipmi_data *data,
 
 	aem_send_message(data);
 
-	res = wait_for_completion_timeout(&data->read_complete, IPMI_TIMEOUT);
-	if (!res)
+	if (!wait_for_completion_timeout(&data->read_complete, IPMI_TIMEOUT))
 		return -ETIMEDOUT;
 
 	if (data->rx_result || data->rx_msg_len != sizeof(*fi_resp) ||
-- 
2.34.1

