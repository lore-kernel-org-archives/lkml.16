Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2E438B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 12:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748952943; cv=none; b=RqmDL4UnGMgyyJbr/Mhhco0/Sssl8r1xUXD2PY4086wi8h3piwWThJpQs60cQQRexSgKX6yie7umnM3PsKG6yec4AlYwiVK1I94w1g8m7hW+BgW7aBbdP0ExkPsAOhqWyYCPo5g4EicQ8/kTSzT2ERic9ad44CcTmupF5+mKhfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748952943; c=relaxed/simple;
	bh=ULt2KiwmaSXyN0bY+1pIPmDsHnmYFTNpsywTiGOSQh8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=B4xT3I7SMUPap0V5uQZloCkaRLyTf7fzAZ64+iz7C8ZW8i4xG7hIyjN4D5q7CFJRATVnh8rI699mlnul//K7hF4YPXNWLpACr6cy71X96jfsuMvlSef9w2iU9YiRXtt8kanS5fzspx1pczHEp/wiNqt+Zp82YuM+LCUvNlTZ5oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RfB7/Zjk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RfB7/Zjk"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5539JQoJ013655;
	Tue, 3 Jun 2025 12:15:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AUXzQgcKpKfaXzQcTffYtk
	DlqeC7fxG8KRdyf2Q3Pb8=; b=RfB7/ZjkaKBMVXgr6qe0xkmjiVnR4fA2rYLr/E
	Mar30zAJ8RPxq9BatUZh3s7dtAR9ksP0iwb2jSYlkBMjAOF1/GXErMbxfRc8PJ51
	3VoeBRZypUGY5v1Z2burk0sREKaJP9uo2I2YoNdO+Yc5c2MgRNCxbeC2K8vfXGGx
	MHJkEUZEraAzyvKgjGO3bzasPTcjOVvKnyCMhbAIwNHQ6RX3o/pRTIDURjYuOtuH
	EgLxt7Alu6pZXL9wtaL0xBeY/nKdjbAey8rE5MEazKGKCRErxOspljO19EHX4Hhv
	ev5C8k2KiHSS0F2engdg0m7/JEZ+idJ5QVhQp4SmxwwooWXg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8njge0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Jun 2025 12:15:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 553CFccD000802
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Jun 2025 12:15:38 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 3 Jun 2025 05:15:36 -0700
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: <linux-kernel@vger.kernel.org>
CC: Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Rob Clark
	<robdclark@gmail.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH] mailmap: Update entry for Akhil P Oommen
Date: Tue, 3 Jun 2025 17:45:06 +0530
Message-ID: <20250603121508.296678-1-quic_akhilpo@quicinc.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: iQGnjmFCXAuXyzNos45w21vtTPy2MQJ4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDEwNyBTYWx0ZWRfX+e8xHLt0C2NY
 sDMzQnYhPw7CW4P+bSYAVFr5ujPhEIMAp4XbL75MzIL8Ad/6+2GXN1mJTakCXuM/RlUDLBhOtQB
 3HGHtwgBCpqiW5H/KNTsg0hqpBpaag7yxhB8rh/JTkcqdsn8SKXkHqlIB3ju84VUcaFnqgTT0rD
 yCHx6gOn5zfv30KBpzK9iiwHzCIxrLB5ySFwJjOVn63Y85Nk3f3piiAiF7GdS6QmUiRmeFSKdsr
 nOk0+vMfiwKh/wnPKuBo45QPYxrWPoS2XptUaQI6n5ZClRfz+GxrsazpZZp1qzxEAym57wGolRT
 jmuikgM/HGXJpw8IDAQ7ptqpBhdPPjRKzdfa/dUbU+Ygf4ccKLeU/U8RXt58wnwx1cAdCs6iab6
 +PKfSZaLjm4kVXOVMifAe15PQT6JaaV5Y+c44B/s8GVJkCQn1/R3iD3qbnR8wLzl6veKczIe
X-Proofpoint-ORIG-GUID: iQGnjmFCXAuXyzNos45w21vtTPy2MQJ4
X-Authority-Analysis: v=2.4 cv=UphjN/wB c=1 sm=1 tr=0 ts=683ee76b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=Q-fNiiVtAAAA:8 a=eh1Yez-EAAAA:8
 a=LpQP-O61AAAA:8 a=z1H5ADGQAAAA:8 a=drOt6m5kAAAA:8 a=gPJu0pBYAAAA:8
 a=r_1tXGB3AAAA:8 a=3Xbn_LmjN4UakWFilwwA:9 a=TjNXssC_j7lpFel5tvFf:22
 a=pioyyrs4ZptJ924tMmac:22 a=cNhwqobjEIRUxE0uuXBi:22 a=RMMjzBEyIzXRtoq5n5K6:22
 a=AlIIF0cMT2hfDT4axODj:22 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=746 clxscore=1015 malwarescore=0 adultscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506030107

A new policy within qualcomm requires me to use a new email address
for all future contributions to Linux kernel. Update the mailmap to
map my old email addresses to the new one, ie akhilpo@oss.qualcomm.com

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---
 .mailmap | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index 9ad98690876a..1b239e1445bb 100644
--- a/.mailmap
+++ b/.mailmap
@@ -21,7 +21,8 @@ Adam Radford <aradford@gmail.com>
 Adriana Reus <adi.reus@gmail.com> <adriana.reus@intel.com>
 Adrian Bunk <bunk@stusta.de>
 Ajay Kaher <ajay.kaher@broadcom.com> <akaher@vmware.com>
-Akhil P Oommen <quic_akhilpo@quicinc.com> <akhilpo@codeaurora.org>
+Akhil P Oommen <akhilpo@oss.qualcomm.com> <akhilpo@codeaurora.org>
+Akhil P Oommen <akhilpo@oss.qualcomm.com> <quic_akhilpo@quicinc.com>
 Alan Cox <alan@lxorguk.ukuu.org.uk>
 Alan Cox <root@hraefn.swansea.linux.org.uk>
 Aleksandar Markovic <aleksandar.markovic@mips.com> <aleksandar.markovic@imgtec.com>
-- 
2.48.1

