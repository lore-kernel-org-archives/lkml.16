Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D5C294A1C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 11:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751022701; cv=none; b=YNMQdkiXatFDXvKBFY43JhFXQTqRBfzLOTPS79fr4iA/x4aAKI9oSjfWjKt19PwSzNqYOGizgHjh2fKghodQ5pnniwyn0eHWmybj3YHSMoWCzVQwxaqjxAhA4inC32c1x1nLIgJiERHojLDc9gpuTzmbXUOfy2Fh7SGC9ZAiOMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751022701; c=relaxed/simple;
	bh=BUYvO1CC878o99f6joPL9/fGOdVBxzpFP5fc6NApHGk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=syfsBRu/pQs6ZF7AiuIgBI2Cs0k2gha/vabc3UANxPjIyIvKTePGRAmmW1nxF18EBirluC5vc7eb4Z4LMneuY3c+FSU+yilp4dd5Rj1oIPx/ODKlNnyP2lf+d6yp73ed34UsN/uXQd9rEEXH/t/ZSh6giqiDjWRqRye3GD+cda0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LP16Sleg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LP16Sleg"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55R4DCPT009537;
	Fri, 27 Jun 2025 11:11:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kliSDo9vvqdteYx7jg54Xh
	Qvy5IMVOpy3AdtlXAThtM=; b=LP16SlegEJrj0nghcZ74XJoqUuwKF194peOGEN
	5aYIJ9czGSB1tiZDDN+NIPoSGkJDzDVkkY7o/qLcbbE193FAI0OccDHXRqv3H6F5
	w4pzlz8rVKGTGG+0Um62WN3k3Swu9A9KkrYIjuJ2kPokP7WJDEe5y2NyKVeO/MYe
	TtZERRaFIrhFS71OEDAK+2YE+ajdo/bjIDtdPvKaPGDN84d4mQt731PEDsdqXnP7
	10nJJxoNqm5An4yzl2o7qOdcru/1BloWBLGEfvGZG0us87hGyS+egMYeeN7fpnB8
	BiRPsfZrWeALzUsofdRGjQFzJpLz/zVTvXfi//vrF129K+iQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f4b46h3s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 11:11:24 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55RBBNvb002694
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 11:11:23 GMT
Received: from yuanfang4-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 27 Jun 2025 04:11:20 -0700
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Date: Fri, 27 Jun 2025 19:10:52 +0800
Subject: [PATCH] coresight-tmc: Add configurable timeout for flush and
 tmcready
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250627-flush_timeout-v1-1-2f46a8e9f842@quicinc.com>
X-B4-Tracking: v=1; b=H4sIADt8XmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMyNz3bSc0uKM+JLM3NT80hLdRFNLiySTZIPkVPMkJaCegqLUtMwKsHn
 RsbW1AN/pTalfAAAA
X-Change-ID: 20250627-flush_timeout-a598b4c0ce7b
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>
CC: <kernel@oss.qualcomm.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751022680; l=3431;
 i=quic_yuanfang@quicinc.com; s=20241209; h=from:subject:message-id;
 bh=BUYvO1CC878o99f6joPL9/fGOdVBxzpFP5fc6NApHGk=;
 b=ZMbobRLqQIet6lV4HOAgbqz0EwWv+pjUNCKDDN8I1BbP5KqlJYmluu4McUUnFtwxKIdzfT6aN
 PhvY8rnUEeKDlCtpBSHPutOr6vo1VMbeNMlaM3d6s3e0/AzJtUnDpW2
X-Developer-Key: i=quic_yuanfang@quicinc.com; a=ed25519;
 pk=ZrIjRVq9LN8/zCQGbDEwrZK/sfnVjwQ2elyEZAOaV1Q=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDA5MiBTYWx0ZWRfX/T9P1UOfd7CW
 Ew8ip9WeJKpnnXLDHVrRgCy1ZQOMbYwS3si/UvqmIUi8nVOFqa2vea2Ld+larMmZ9Z6hDkXpfjA
 rN642C2iQrYI57KRIEtJRK23WdmrFTwJgJ+UxgcueAsu8qE3fOSQm2TzlKWRmYUfdVQ+enYn6Ii
 +3DlC0Z2LGw9jfc4xkKJ5n02/mrQQVa5/fUSPoJhd6P9fAS8e8IymDmVY36l3K6bec0N108o00H
 f3phwANXwJMenUQUoQGEWMYZowpPfEp3vIlZS1FkbtJdCZjCXFx1xcoRcbWS7AGgHxBI0zgxnAg
 d7wT+huYx/70h4NrmKghMwRM3xPbfJKyncDvR2DQ1jwLYuFD+7hsdQ4VVg1liK+Fu5gJHYhppWk
 eYLbtvo5bAZkjtsyYX5vsEfZOcs1O7JSD8uKz9QaL/nwOX9BNVo1iQoV312M+PX0rhCSjkUH
X-Proofpoint-ORIG-GUID: G72L2e7Nu-Ue6sPSnpwEAKQYFwWlNR24
X-Proofpoint-GUID: G72L2e7Nu-Ue6sPSnpwEAKQYFwWlNR24
X-Authority-Analysis: v=2.4 cv=A8BsP7WG c=1 sm=1 tr=0 ts=685e7c5c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=VJN7ZjvJE1eYF0YsODwA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270092

The current implementation uses a fixed timeout via
coresight_timeout(), which may be insufficient when multiple
sources are enabled or under heavy load, leading to TMC
readiness or flush completion timeout.

This patch introduces a configurable timeout mechanism for
flush and tmcready.

Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c | 43 ++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 88afb16bb6bec395ba535155228d176250f38625..286d56ce88fe80fbfa022946dc798f0f4e72f961 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -8,6 +8,7 @@
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/types.h>
+#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/idr.h>
 #include <linux/io.h>
@@ -35,13 +36,31 @@ DEFINE_CORESIGHT_DEVLIST(etb_devs, "tmc_etb");
 DEFINE_CORESIGHT_DEVLIST(etf_devs, "tmc_etf");
 DEFINE_CORESIGHT_DEVLIST(etr_devs, "tmc_etr");
 
+static u32 tmc_timeout;
+
+static void tmc_extend_timeout(struct csdev_access *csa, u32 offset, int pos, int val)
+{
+	int i;
+
+	for (i = tmc_timeout; i > 0; i--) {
+		if (i - 1)
+			udelay(1);
+	}
+}
+
+static int tmc_wait_status(struct csdev_access *csa, u32 offset, int pos, int val)
+{
+	return coresight_timeout_action(csa, offset, pos, val,
+			tmc_extend_timeout);
+}
+
 int tmc_wait_for_tmcready(struct tmc_drvdata *drvdata)
 {
 	struct coresight_device *csdev = drvdata->csdev;
 	struct csdev_access *csa = &csdev->access;
 
 	/* Ensure formatter, unformatter and hardware fifo are empty */
-	if (coresight_timeout(csa, TMC_STS, TMC_STS_TMCREADY_BIT, 1)) {
+	if (tmc_wait_status(csa, TMC_STS, TMC_STS_TMCREADY_BIT, 1)) {
 		dev_err(&csdev->dev,
 			"timeout while waiting for TMC to be Ready\n");
 		return -EBUSY;
@@ -61,7 +80,7 @@ void tmc_flush_and_stop(struct tmc_drvdata *drvdata)
 	ffcr |= BIT(TMC_FFCR_FLUSHMAN_BIT);
 	writel_relaxed(ffcr, drvdata->base + TMC_FFCR);
 	/* Ensure flush completes */
-	if (coresight_timeout(csa, TMC_FFCR, TMC_FFCR_FLUSHMAN_BIT, 0)) {
+	if (tmc_wait_status(csa, TMC_FFCR, TMC_FFCR_FLUSHMAN_BIT, 0)) {
 		dev_err(&csdev->dev,
 		"timeout while waiting for completion of Manual Flush\n");
 	}
@@ -561,11 +580,31 @@ static ssize_t stop_on_flush_store(struct device *dev,
 
 static DEVICE_ATTR_RW(stop_on_flush);
 
+static ssize_t timeout_cfg_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	return scnprintf(buf, PAGE_SIZE, "%d\n", tmc_timeout);
+}
+
+static ssize_t timeout_cfg_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t size)
+{
+	unsigned long val;
+
+	if (kstrtoul(buf, 0, &val))
+		return -EINVAL;
+	tmc_timeout = val;
+
+	return size;
+}
+static DEVICE_ATTR_RW(timeout_cfg);
 
 static struct attribute *coresight_tmc_attrs[] = {
 	&dev_attr_trigger_cntr.attr,
 	&dev_attr_buffer_size.attr,
 	&dev_attr_stop_on_flush.attr,
+	&dev_attr_timeout_cfg.attr,
 	NULL,
 };
 

---
base-commit: 408c97c4a5e0b634dcd15bf8b8808b382e888164
change-id: 20250627-flush_timeout-a598b4c0ce7b

Best regards,
-- 
Yuanfang Zhang <quic_yuanfang@quicinc.com>

