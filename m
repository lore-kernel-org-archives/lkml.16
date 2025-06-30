Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA472AF1B
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 10:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751279226; cv=none; b=TH+vS3D05I+2rnO26RtnU+uBd8V71ATbv2dai/jlcUuCud4QGmOWOnckYLVsVzrcwGw61eGgXBmtOOGhmuPzF8wArbVoAy8RjQmwcy6b9/4EQGBcRfruKzHfPetYfeYcAAMqbRW7US8+bDR0X4YKlTxo3QAsbRTDWVutfYkC3+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751279226; c=relaxed/simple;
	bh=H0MaE5zBOSHO3LkNCLftptGerNAPEoWExbl9pw4hqbk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=PgkE3FEDmLrNfZ7fMMhio29B3DiQUsxI8lL5s0lp+Sd96PFtsoMm5zBcBvkpSHuyyNCnBtv/VKjseXgh4fBVB6pJjLSiZ6YxssLtDNlejCX5Zntqeq7DdV9iGQzWTvywgGfP+WBMgzGXUZKWW2BD4+m943KBsXH+/4VEN/rQm7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GQ7lQFld; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GQ7lQFld"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U8D5D9008138;
	Mon, 30 Jun 2025 10:26:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=RNwyz2uPyTgf5iTMXJhK4t
	1OLAWKnwrjx6NHrYAot/k=; b=GQ7lQFld32m1MZciqSayJxeeWOAXoJ6L1PBpzy
	oK1XDRoK6gt2Snee14kqS+W47yGJvpuvvNyBPtXgqgLEpk+mN31Oyb62b9o66jd9
	K2JkbWTrZCVhDVqP8Vl8+R0Epjcdc9AHWPyCHLdjwYfqc/OrjoCpJmpbB/te1vZp
	O6VzZtL2M1YTLYBEHMGpwNy7dw+qeHQ/t1h/hnebfx8jLigYO56z/m/+7LDbbHAp
	6/BGRBTPNfAU3wWOkC05Fh5TI1f7tuHDdTvgx5of2yfufZwcgr5+Pat4iLv51hfp
	XUe5gXVFb2UmOaNhV4ILTn1/X+1LDaq+bvdr4v7SxjO1MUiQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kkfms0e1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jun 2025 10:26:56 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55UAQtLr028282
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jun 2025 10:26:55 GMT
Received: from yuanfang4-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 30 Jun 2025 03:26:53 -0700
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Date: Mon, 30 Jun 2025 18:26:19 +0800
Subject: [PATCH] coresight: Only register perf symlink for sinks with
 alloc_buffer
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250630-etm_perf_sink-v1-1-e4a7211f9ad7@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAEpmYmgC/x3M0QpAQBBG4VfRXNsaK5JXkaT1D5Ms7UpK3t3m8
 rs456GIoIjUZg8FXBp19wlFnpFbRj/D6JRMlm3FdckG5zYcCDJE9asBWJyIqxvLlJojQPT+f13
 /vh+gPyWtXwAAAA==
X-Change-ID: 20250630-etm_perf_sink-ee0fcffc6820
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751279213; l=1521;
 i=quic_yuanfang@quicinc.com; s=20241209; h=from:subject:message-id;
 bh=H0MaE5zBOSHO3LkNCLftptGerNAPEoWExbl9pw4hqbk=;
 b=vnAxtFOL7djNa+vwjH/7/Runb2sNbuIdgf67egd/SWFD/dYSYcr2rIv7OP0+2xsrWLoFZX6FR
 oCNia01W7hCBe8E5Mg2tTmPjq6h4Q6rpiTbWCi56U2naomwflbxVPrn
X-Developer-Key: i=quic_yuanfang@quicinc.com; a=ed25519;
 pk=ZrIjRVq9LN8/zCQGbDEwrZK/sfnVjwQ2elyEZAOaV1Q=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _DvWm0v9RiTWO0ItHcZ0r8IqVpA07VDo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDA4NiBTYWx0ZWRfX2RpDxWFY9W5M
 rLypVQu84WV8EWsCb4fGbsgF9Y7dSDUxJarec3Vh4DWv7+YQcUp3L8MVX2pShiSRKM1y+80U1Jx
 17ChT9LDERo0WBdIQcelkm6M1Ghhf6E1h9vWweQ+zC9VI1nyI+E0L/GH5ts99tHEerqbJ2srM+u
 5bS/28quVylRTPB0w4b8rmytbzXb9Izzska9NYRy6ylLa6A/yrGCEaqtypq2AeYh6VWy87Z8j2S
 XyfNjBDounZ0ES/2Gj6cF/kb2M4YuyPLTuNoFa/ZY04Cwq2A79glx8gesOe3MBcyLUvEQ5uKPxE
 KMZhtc5hO60j/UzMVv5Agmhm5pwxEU6ksGmBjiztRmx5eIHED6peZg/Vxb/yAZ1H+quvwJaXUvT
 Wv9CYygC7T67sdM2AdsCYBUsWEdZyvNLf/pKek/zi2fnShCNPIgIeRqTjmmzAJCzb73SZgTC
X-Authority-Analysis: v=2.4 cv=L9sdQ/T8 c=1 sm=1 tr=0 ts=68626670 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=biE8C0GMo9j7lGmchtYA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: _DvWm0v9RiTWO0ItHcZ0r8IqVpA07VDo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxlogscore=961
 bulkscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506300086

Ensure that etm_perf_add_symlink_sink() is only called for devices
that implement the alloc_buffer operation. This prevents invalid
symlink creation for dummy sinks that do not implement alloc_buffer.

Without this check, perf may attempt to use a dummy sink that lacks
alloc_buffer operationsu to initialise perf's ring buffer, leading
to runtime failures.

Fixes: 9d3ba0b6c0569 ("Coresight: Add coresight dummy driver")
Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index fa758cc21827552a5c97b6bdd05d22dec4994b22..fddf04c5ee46eb4d559416296f7e85ce6c5689fa 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1374,8 +1374,9 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 		goto out_unlock;
 	}
 
-	if (csdev->type == CORESIGHT_DEV_TYPE_SINK ||
-	    csdev->type == CORESIGHT_DEV_TYPE_LINKSINK) {
+	if ((csdev->type == CORESIGHT_DEV_TYPE_SINK ||
+	     csdev->type == CORESIGHT_DEV_TYPE_LINKSINK) &&
+	    sink_ops(csdev)->alloc_buffer) {
 		ret = etm_perf_add_symlink_sink(csdev);
 
 		if (ret) {

---
base-commit: 408c97c4a5e0b634dcd15bf8b8808b382e888164
change-id: 20250630-etm_perf_sink-ee0fcffc6820

Best regards,
-- 
Yuanfang Zhang <quic_yuanfang@quicinc.com>

