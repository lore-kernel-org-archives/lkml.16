Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670F52E403
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 00:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747875024; cv=none; b=SWa1ozdc6oE62h0GrZyP+ltFbSGt/IzgLCun0j91nnB2jTaAB4vikc3pMlnfrI+D5u4QM1qlIwIYq8XuUjeR4G9BSZUYInbgEPKLcg7C1/KAALVrCFIbFVfQmNpnBtQpppo3bgxIFQCvQ9AXq+rrz6pQsIWfIpcBfWUA2kxCI8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747875024; c=relaxed/simple;
	bh=k3JhTZ4oyNVLHV3cW10MaQ8mQWndnZLQ9kcF1MbS1Ek=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Vqlu+R+0QAFVAVCU2DjbDsAky2DMoT/wVItdvH2KJBUgoOJ/5Ak8zOsm5rhzz5MK4wedOm9JDTXh6rL9FOpRN3vZMp+WmaJRIwQRgKam/4UZT9DRnpKy462wxbXr5mjxjHSBO4lPupNCGUEAxrax2nU2x09mKOdsSXqp8of8anw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XbInCwiL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XbInCwiL"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LIWAYd006792
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 00:50:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=kvRFDBllkI5WXFVFf+HSLljmJBeNY0/grsh
	Lfzg/HAk=; b=XbInCwiLaw5FbYuTgsfUO55FRgp7zLfXoNFGVnUPqMcgQBV+9RZ
	TIwb3zf2fBGt+GWQfxVVLOOu+NlMwQIAVFs3AV/w/3QKXnUS3Li6WGOivDex2PkO
	c1diajuWERm7EuFwxNbC18xzisWYBc98PhfTrOvUF672qijXYikL2EwI4s9B0HCP
	f8xgimnBDdSDNVzHlusV4ujGHIY3j0Vi2+9dVgsgGnANBeMs4jbK2WPlIYya357M
	MV5VHa+wg3jxJVOyBsnWGiOJDSypwSjh2mXBLmwvieTz/DFgNdI5oIAKw+hP1ASs
	WMBPiDno93xuSGStb6tbBrn785HPwx25CwQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf0mn06-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 00:50:22 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-231e3cfc144so51797185ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 17:50:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747875021; x=1748479821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kvRFDBllkI5WXFVFf+HSLljmJBeNY0/grshLfzg/HAk=;
        b=IZOoBh2oC4P+SXXQ3ggI9GthEDq8bsYOZvBY4+8S5jelCS7U+X7jqy+JgZd1DtFPgv
         e3d7biusFfO4AbmekFd7ldbSBGHjMdIJpCFpyh2EtFnL7mISVYns3uC3+5QA5GrEbJaj
         7EPAOmO8SeIaiL4qP0Y1EDIqn8ZpgFCtWN6yjGuDx9IhrlMV4eW6jCYw62Xvd8pUbH5O
         oP4+VtRofTN5kmAGRaOMON2dNRtFAulsZDpbldmxqxaILwLJ6j/XAjCSlCjH0Hjs0Jww
         n9oDjwSWDSzcONCD7EYY/X/Y6Jg3FWhIpuVr91hbz70TPr4/kidSkcyYVlefEhWVhO9o
         HqNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjA7ih8yKTKD/jv1NkNGqDTPpshsQKwV23dsrfsWe0Cc7OE9qNw/2zbYCUTNVroca3Bo4owISCM8XZtTA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZVDAedOeezDoETSmsxZOoMZNMvX+vIzjvpR+Xz4JKLhMkzbK4
	r1DAxpDQsJLtYYaQxpszLiteobIdEn3P+Do0szd/II1lnwJYcpFm3laKNc0cYz8w2XgnVMEwvIO
	3yxBIFujidSG5gITUvvbCNVJoKu3zrc/UweCfQx5cHX8vNfjpEanyAEVPZWrVJkCIZ58=
X-Gm-Gg: ASbGncsDDqSwGb4XLiYYNzztQ+ob+9eEO9KeFWL6PcY9uwFLUJcFvV4cAhzHwsYu8PO
	ryvD43lW6gmMw43bQoq+m4DcKw263loe0sXvOJyb2AZalLYxIUVUv+6U6XidnqVUc4cTWgZh8qD
	9TaWDt99Zloz8YVHFGZJVUg6nol2VYx773DZaLcjrJPhVOSpHiF/yiF4ZC1Rhko0D3JG5YAFTWi
	VmzCl0baQlu0yjH4Oi25tTGiNeNzxl9PJsnsFAu6ver4tPj8K1+iQbUsTfTLdlK6gMlKVoT4uD5
	z/ps9gN7PRI4oqqYIvnKfktMyqmhEJMKBrsWGSCRhcsh2nW5Hww3JXDcOh62B9xasv7e
X-Received: by 2002:a17:903:18d:b0:220:c4e8:3b9d with SMTP id d9443c01a7336-231d4596b26mr286881415ad.37.1747875021534;
        Wed, 21 May 2025 17:50:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFD+durvrDcArPX+SKuH0fS4pfVmA3tYTRltQovIt+W4dSZ7RwU718rsJer/fx40VKW6UJMpg==
X-Received: by 2002:a17:903:18d:b0:220:c4e8:3b9d with SMTP id d9443c01a7336-231d4596b26mr286881155ad.37.1747875021141;
        Wed, 21 May 2025 17:50:21 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4afe8b0sm98325955ad.89.2025.05.21.17.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 17:50:20 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: qcs615: fix a crash issue caused by infinite loop for Coresight
Date: Thu, 22 May 2025 08:50:16 +0800
Message-Id: <20250522005016.2148-1-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: SJflheDpyJNf0R80F-Q-sxf2XbGiQ4ZB
X-Authority-Analysis: v=2.4 cv=J/Sq7BnS c=1 sm=1 tr=0 ts=682e74ce cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=435hUyIJdIdCWuEgtuoA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: SJflheDpyJNf0R80F-Q-sxf2XbGiQ4ZB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDAwNSBTYWx0ZWRfXxDWDCOU7RzsO
 RI1lH1IF4ZqHInLfx0QM5jYlkYKm7umHgzDtZNGNjb82tjnAtoKsQuzW8p+NLRkMLPizE803F+u
 ikb8zl0sSa09bZfT9qwvBvTDkixh6+hZj/V23JgcyvCogw9R8gbslTt4OJMEeWtxG4eydUks0ar
 7C1QPqiFK7QW7eun6GrBIIXyeJvibduTOyEuElnkGjtBTEzWVlJvYigNJKLC72oG4oaQW3zpSCZ
 H2RDO6YTtq90ilj800JYUqEQqjOlYwZy3C38iOW29qp0j1b/AGAWo7RDsaQ43hpA7Yij8LEJ9MR
 U/Ehr9yy7HH9ej15T0SrZO3/A+20V6nOqN/oFFgp7EufWfzkaxexxS5G+RJmudOIKXJ0LMRS1UM
 nGZfjf9uXFFR767XYp4bPnSFQ9O474b2uUV1btr7xDiCFN0KmC7cpyIIe9co/jm2NFWqvr/h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_01,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220005

An infinite loop has been created by the Coresight devices. When only a
source device is enabled, the coresight_find_activated_sysfs_sink function
is recursively invoked in an attempt to locate an active sink device,
ultimately leading to a stack overflow and system crash. Therefore, disable
the replicator1 to break the infinite loop and prevent a potential stack
overflow.

replicator1_out   ->   funnel_swao_in6   ->   tmc_etf_swao_in   ->  tmc_etf_swao_out
     |                                                                     |
replicator1_in                                                     replicator_swao_in
     |                                                                     |
replicator0_out1                                                   replicator_swao_out0
     |                                                                     |
replicator0_in                                                     funnel_in1_in3
     |                                                                     |
tmc_etf_out <- tmc_etf_in <- funnel_merg_out <- funnel_merg_in1 <- funnel_in1_out

[call trace]
   dump_backtrace+0x9c/0x128
   show_stack+0x20/0x38
   dump_stack_lvl+0x48/0x60
   dump_stack+0x18/0x28
   panic+0x340/0x3b0
   nmi_panic+0x94/0xa0
   panic_bad_stack+0x114/0x138
   handle_bad_stack+0x34/0xb8
   __bad_stack+0x78/0x80
   coresight_find_activated_sysfs_sink+0x28/0xa0 [coresight]
   coresight_find_activated_sysfs_sink+0x5c/0xa0 [coresight]
   coresight_find_activated_sysfs_sink+0x5c/0xa0 [coresight]
   coresight_find_activated_sysfs_sink+0x5c/0xa0 [coresight]
   coresight_find_activated_sysfs_sink+0x5c/0xa0 [coresight]
   ...
   coresight_find_activated_sysfs_sink+0x5c/0xa0 [coresight]
   coresight_enable_sysfs+0x80/0x2a0 [coresight]

side effect after the change:
Only trace data originating from AOSS can reach the ETF_SWAO and EUD sinks.

Fixes: bf469630552a ("arm64: dts: qcom: qcs615: Add coresight nodes")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index f08ba09772f3..b67c1f8a1118 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -1902,6 +1902,7 @@ replicator@604a000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			status = "disabled";
 
 			in-ports {
 				port {
-- 
2.34.1

