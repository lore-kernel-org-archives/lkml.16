Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A46182BC
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 07:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748590195; cv=none; b=Gv4AW6plFPNDwEK4J1MCJ2WrHajG9ffhEB64yXYsfheel70C9fM6knsjJt6D90xKQGkDC5N+MwX6iyJE6RfogDR7+/8JOM3/OV8eRdmXqiqniScEgiFhPuTiW0G2FHMbjdrG/NAn8hGhuwfCOn0AzG0UJvITxof0s5i/V2gOgJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748590195; c=relaxed/simple;
	bh=lzzvlHQSXjqy3rMmpjuCfFbsEuWsuxNIkCC890RfZDw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=FkSipdKVDVFRAonS54p8716Y21QxWBmHe2HPNWWqPOc+NlxKkZiy1t/94Q0SXTZI5W63/zBjblb7H9KVPoquPksKN7LFiEOM6z6twe096kg56+1cr04Gq0AXcHETdcXFnJXk7LloFOhWwO3tVB6uOmPczFtra7lf6K/orMy+PdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=D+jIjz1j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="D+jIjz1j"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54U0dZvG013716;
	Fri, 30 May 2025 07:29:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=A/4FJmYllYDHyQiJ9derJk
	xxuUpThuwVaYCoWHYqi5o=; b=D+jIjz1jO/SAs9me3gFOApY7VyriYUphGhFQKg
	DVSOZMmHFJjvwNYO0gmJv0wmo2akWOxHxByO0obRp2YDc15kW11hbT1biysCgQdl
	0IlYXO1KcV2iO0H6ACgRrhqrF2fNzRNM28ixFGbtWI8r7koOih7RDzfJof+Ap8sQ
	APNvZEPMAUZKZrSsF1OBXxZMLhtJUAkk45hLXz1wW5d8hVTZZOlPheSF0Tiiknmf
	k205sY8OikgR1Jgkj8Dj8niFN4NkKf9NNtApk+gZj+9tU2u4a2cyiNqhl39Zuuwc
	/bSsjk+Lvj+2kjKbuEk4fiflHcKmJBieXP1mV36OWGcYe4sA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46wavm22ne-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 07:29:42 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54U7TgYG026845
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 07:29:42 GMT
Received: from yuanfang4-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 30 May 2025 00:29:39 -0700
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Date: Fri, 30 May 2025 15:29:14 +0800
Subject: [PATCH] coresight-tpdm: add trace_id sysfs node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250530-showtraceid-v1-1-2761352cf7b4@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAEpeOWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDUyNj3eKM/PKSosTk1MwUXaOUNEvDZAvLpFSLNCWgjoKi1LTMCrBp0bG
 1tQA+uRObXQAAAA==
X-Change-ID: 20250523-showtraceid-2df91c89be8f
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748590179; l=2852;
 i=quic_yuanfang@quicinc.com; s=20241209; h=from:subject:message-id;
 bh=lzzvlHQSXjqy3rMmpjuCfFbsEuWsuxNIkCC890RfZDw=;
 b=bdOBpCFyYyBGlD4IOna7p33RtL9lQG9IRK1udvrdPhuR7+aaSbaZn3qttPxj+BWG8cewlic46
 YdUH8ypQZ27Ds5LjtLu8MqNH7m0UGgOb9mMD1qQBmhq9hrSN+Fkczbv
X-Developer-Key: i=quic_yuanfang@quicinc.com; a=ed25519;
 pk=ZrIjRVq9LN8/zCQGbDEwrZK/sfnVjwQ2elyEZAOaV1Q=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: G5pnpVGpZaeECgjra_qgSV-DTe-sRA6Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDA2MiBTYWx0ZWRfX3aAPgmUQ98FE
 pl5SgetZxmhrEMwyvBvlXy4tIsZ45T1pwlioDib60tvf9MbcFjaaELW/lNeDgpDwcYikSlidvhk
 iDhkcDSm3KM7KCKF1sIqR9+o3IFbWM10LbpqI3cH4ZpzLWZjUcnOKcjAOVLC+rp7/f/qEJChaCM
 jA7mgg1JvIoiJanck6PILvi5CUgQt5DX+o6imBSkS0NK7MiCATBZ2h0HjMk0JkX5mVC0FgHvjV9
 JL92Vjml/2nq2DP5mFu55x24E+yC5IbeQWwH3ZwivM/C5kiOjHTlsOyzIt3s73MzI3Vm8E/VTGh
 QFhUX05/OJjoT0OrzAEChsfpcRSDASn2CyrDhE8V8yyy36wEvJjupyP3K0YuHFO56Y4S+GXzDy6
 bclWvqUAWHVrkTSxzX4+jjO6He+nDyllaRmOY/kYcP/bzMJFh51GFUtE4D7q91YGnNGOF1vB
X-Authority-Analysis: v=2.4 cv=fMk53Yae c=1 sm=1 tr=0 ts=68395e67 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=XC05_-ciSpCNkHTdwDIA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: G5pnpVGpZaeECgjra_qgSV-DTe-sRA6Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_03,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300062

The trace ID of TPMD is the trace ID of the TPDA or TNOC
which it is connected to, this change adds trace_id sysfs
node to expose this trace id to userspace.

Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
---
 drivers/hwtracing/coresight/coresight-tpdm.c | 16 ++++++++++++++++
 drivers/hwtracing/coresight/coresight-tpdm.h |  2 ++
 2 files changed, 18 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
index 7214e65097ec9ac69f6c7c9278bcd28d25945c9e..8a5d115157924f39b09f8e3005827d7d64aa376c 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.c
+++ b/drivers/hwtracing/coresight/coresight-tpdm.c
@@ -497,6 +497,9 @@ static int tpdm_enable(struct coresight_device *csdev, struct perf_event *event,
 
 	__tpdm_enable(drvdata);
 	drvdata->enable = true;
+
+	if (path)
+		drvdata->traceid = path->trace_id;
 	spin_unlock(&drvdata->spinlock);
 
 	dev_dbg(drvdata->dev, "TPDM tracing enabled\n");
@@ -554,6 +557,7 @@ static void tpdm_disable(struct coresight_device *csdev,
 	__tpdm_disable(drvdata);
 	coresight_set_mode(csdev, CS_MODE_DISABLED);
 	drvdata->enable = false;
+	drvdata->traceid = 0;
 	spin_unlock(&drvdata->spinlock);
 
 	dev_dbg(drvdata->dev, "TPDM tracing disabled\n");
@@ -655,9 +659,21 @@ static ssize_t integration_test_store(struct device *dev,
 }
 static DEVICE_ATTR_WO(integration_test);
 
+static ssize_t traceid_show(struct device *dev,
+			    struct device_attribute *attr, char *buf)
+{
+	unsigned long val;
+	struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	val = drvdata->traceid;
+	return sprintf(buf, "%#lx\n", val);
+}
+static DEVICE_ATTR_RO(traceid);
+
 static struct attribute *tpdm_attrs[] = {
 	&dev_attr_reset_dataset.attr,
 	&dev_attr_integration_test.attr,
+	&dev_attr_traceid.attr,
 	NULL,
 };
 
diff --git a/drivers/hwtracing/coresight/coresight-tpdm.h b/drivers/hwtracing/coresight/coresight-tpdm.h
index b117543897344b689f666f6890cabb59c8ee4869..e12a64f265daa86f1b82fa3640e271e8386f99af 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.h
+++ b/drivers/hwtracing/coresight/coresight-tpdm.h
@@ -300,6 +300,7 @@ struct cmb_dataset {
  * @cmb         Specifics associated to TPDM CMB.
  * @dsb_msr_num Number of MSR supported by DSB TPDM
  * @cmb_msr_num Number of MSR supported by CMB TPDM
+ * @traceid:    Value of the current ID for this component.
  */
 
 struct tpdm_drvdata {
@@ -313,6 +314,7 @@ struct tpdm_drvdata {
 	struct cmb_dataset	*cmb;
 	u32			dsb_msr_num;
 	u32			cmb_msr_num;
+	u8			traceid;
 };
 
 /* Enumerate members of various datasets */

---
base-commit: 94305e83eccb3120c921cd3a015cd74731140bac
change-id: 20250523-showtraceid-2df91c89be8f

Best regards,
-- 
Yuanfang Zhang <quic_yuanfang@quicinc.com>

