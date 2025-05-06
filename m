Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE68335BA
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 07:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746518289; cv=none; b=d/EXCmjffSRNJOpZVNzZPnBI7rfDfJxaZ8uw3IeWe37fZdaAmwN78WjA+ON+fXItJtXqCfFdcqliwNNkV2c+rmiii6Mc+4/43phK/SOSnUAtSHlVVSNfqb5BxLMxIsEOQc7pyoiXd/WhvIDk7mw3+I8ED3H23/ZANS4iyfRppac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746518289; c=relaxed/simple;
	bh=AQ4Bb0VLW7e1ui85vWcSm3HQyeJ062lsUi/lQFbOLS0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kM6sB0PNfvPYiy9fX+EpTknL3ZBux4I2Ibe3hEYRssbP6hns+/LzF0fl0Oo18Cwwr0aaOkC53TC+L7DnfB5IxUagGvBl+XgexVl3kq+9Mem+F35cKXMyZ9p/NwpQzn0g6wpJR+qIgM/S3KOv/OqDbhi0yVqvYsNTjqkxeElMh7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=P3MwjMtW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="P3MwjMtW"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545KTaM2007918;
	Tue, 6 May 2025 07:57:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=R8dssKgp38bn+aPY1QZCiT
	mgUUPkrCM2qDFlCseHqvA=; b=P3MwjMtWXAUk9RRAQHSNscda3U4Cn5XVd1/vwO
	B0Uff7fgVeA9b/yjcZX/p/wVzyEOyQzelBPCIbVIfl7awZ/7a20j4r22Z3BEFvyz
	Xoe5em4h8JT6+gHPntCh+lvxKdG3ku3opHscpkR1EThsC3OMsjsoPI+PqyJ4qCkn
	es71mgybxDeWKiRoLwBO39wC/aPcwdHyA3heDnX61V37AjFiS7KWYsjmeVb0n/pr
	VoRpYN3EMKpp9lH7uB3hdl1H4YPLeFrUx6IgmHp3fgt2RL3ytlXc6vPA3rYYllIh
	619SJcu64sgeBGP3G+uf+PU+D8NYIkAToLLVvaLBjP5ppV3w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9ep6wpe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 07:57:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5467vvlp009306
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 6 May 2025 07:57:57 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 6 May 2025 00:57:56 -0700
From: Mao Jinlong <quic_jinlmao@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        Leo Yan <leo.yan@arm.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>
CC: Mao Jinlong <quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] coresight: Disable MMIO logging for coresight stm driver
Date: Tue, 6 May 2025 00:57:43 -0700
Message-ID: <20250506075743.1398257-1-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=EOUG00ZC c=1 sm=1 tr=0 ts=6819c106 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=3H110R4YSZwA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=7CQSdrXTAAAA:8
 a=21C3pMOLxur-W5BfXY8A:9 a=TjNXssC_j7lpFel5tvFf:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: dpmJSzssu7uMYa7nqJtrEP3vru78PRkK
X-Proofpoint-GUID: dpmJSzssu7uMYa7nqJtrEP3vru78PRkK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDA3NCBTYWx0ZWRfX23bFD/n/kS0r
 AQp2zfE2yOs5Z3sc9Oz/9jurnwaWrWKXNim8MInnnmbcd6+/PF/g3MLbYH1zMWcuhWtl/s5bcq5
 dMzHYLu9li1a/UcZO35CWL5Yld8QhzTVeMrRECqdLKNd49f23VP5B5AYOGkDKYyK78wPZJaH7ck
 hyNPK6/Osw+VLca+TlmjVm7COCIXrC6gF9dqCYBz179X/vxj8Yd4knl/IPInVt3vVCuv9vCwg/G
 I5Zkr+SbUlC3Rrhca0wZQd6c9EEM9SNAFp7+UHBdvyroNd6QWhJlbBiupfX38KWPgvpdapnGvmB
 FqfczTRuSN6uXOUKQYtn8jJFRpSsx+/U8RsrQTHfCDaDkSIraG4RM7jg09aSBXdVobMcqlb/sWr
 fNbeWsEKe3H/BZuwsmFNxoEWoVTraEDcfyIT67NUE0reJv1I5JUi06e2HYSy/ghCZTIUoZpJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_03,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 impostorscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxlogscore=995 mlxscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505060074

With MMIO logging enabled, the MMIO access are traced and could be
sent to an STM device. Thus, an STM driver MMIO access could create
circular call chain with MMIO logging. Disable it for STM driver.

[] stm_source_write[stm_core]+0xc4
[] stm_ftrace_write[stm_ftrace]+0x40
[] trace_event_buffer_commit+0x238
[] trace_event_raw_event_rwmmio_rw_template+0x8c
[] log_post_write_mmio+0xb4
[] writel_relaxed[coresight_stm]+0x80
[] stm_generic_packet[coresight_stm]+0x1a8
[] stm_data_write[stm_core]+0x78
[] stm_source_write[stm_core]+0x7c
[] stm_ftrace_write[stm_ftrace]+0x40
[] trace_event_buffer_commit+0x238
[] trace_event_raw_event_rwmmio_read+0x84
[] log_read_mmio+0xac
[] readl_relaxed[coresight_tmc]+0x50

Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
Reviewed-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
Changes in V2:
update the commit message

 drivers/hwtracing/coresight/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
index 4ba478211b31..f3158266f75e 100644
--- a/drivers/hwtracing/coresight/Makefile
+++ b/drivers/hwtracing/coresight/Makefile
@@ -22,6 +22,8 @@ condflags := \
 	$(call cc-option, -Wstringop-truncation)
 subdir-ccflags-y += $(condflags)
 
+CFLAGS_coresight-stm.o := -D__DISABLE_TRACE_MMIO__
+
 obj-$(CONFIG_CORESIGHT) += coresight.o
 coresight-y := coresight-core.o  coresight-etm-perf.o coresight-platform.o \
 		coresight-sysfs.o coresight-syscfg.o coresight-config.o \
-- 
2.25.1

