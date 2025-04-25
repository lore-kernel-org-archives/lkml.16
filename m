Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F154B18E1A
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 14:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745589618; cv=none; b=putVNSQhjjX1SUtfPG2aXd4ReWJ5HkW4WGiNQFu1Q2n0XHRmpPVfEvqhTBGgkTwo2V6cC0+fXSJ5O7o6SyP+wdi1zD9LscsUxpE82QqQd87y+1bss0tKzPSz5j7t12akwH/g4GVaIQT0OSkzi/HZZ3Wi2Y8+1ViGS/caS7suWE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745589618; c=relaxed/simple;
	bh=niGpra8Jkq0c4F0+dPF9q2bhKVjcAH2yAfPH/XKp29M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bH2NSJ2zo7MRouAtO0TAaHTl/3leSSDFZJ/VkDGE1roPlF0UO3/u61ybOQfmRqchHD/WkyBBPZRRj26c8BKOy3HZwM3C0q3JPGHBpQrkgm6ci37qaevELMq7wUGTE7Yp9DdGopkRKZaoFsSEFs2OwvvcrSJqzJd9c9g6AsZJ/Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QGMB4lZI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QGMB4lZI"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8T6In019786
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 14:00:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=R8mXcE8GBrKkalZ3E2QfwH4IJLsCVriQeYb
	lZ4B4VhA=; b=QGMB4lZIv8kVafaaZ31L8xGrqVIc3yuKjdNR7PU1ZYX00rJnYZS
	nNg8zkVBc+cW/eeWsaGX/DWM7Ibhetj4lZXCucYsQ3YrGvCHH7nhXgZsYzoafoZb
	rq9i0Hl9gkOcwCUgIVoi65kshcLORX020sVeDGUnRUSmtS0n1QvOpugm1YSkkTbw
	vTcRC64VGx9HVQ+VqsXVaysp7o0Gvv62T3SF+g1vvWYPXFeQISO9QqK++eqWknE3
	3hY3hM9qAR+dYrns312eM4avQrv1Y08zoOrBi9MZkohHEu84KBnajxm/BUSlJ8oT
	h/8Cd/sCa5oBoO1Z1U0UFqsoTJPRSDyK4og==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2h8m3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 14:00:14 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3032f4ea8cfso2302982a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 07:00:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745589614; x=1746194414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R8mXcE8GBrKkalZ3E2QfwH4IJLsCVriQeYblZ4B4VhA=;
        b=vZt6h4PRJpHrNnB8SPPENNpLdhO6EyinqWiEmT9p13iJOiDAIT7anC1v+TNFTW+Qlg
         JDhvciCc6mR+1GF+FquZQYYEeQuVeIqm0ehW+rxIEGG/thcH/6v/y2KQMOeceBIUYu9E
         84f0HuVs+Ipzuesqzu6oR4f+Vs6fmx9m7aXbKMH9vbmSDXaL5G7bmEdWMpKQ749cNGA1
         9CR9j7LSyqJrDrWj/2j/xo0y+U2cTW1HC5mf8zWZsEK1yNyWQfAr4gehqHv/R6++JZ5x
         gykAmWEfB+MJafBRSfsMHMKCaTU7hvcmPq052puoStRKHl4R6QstTPhZA0YtQM+IgcuX
         DTxA==
X-Forwarded-Encrypted: i=1; AJvYcCV+tvkW4wt2w+Ho9BXc81+eRSVIJuVcGIFbeXf9oeFeG4KvydewE7/ZwTk/QlCgodk1v4VHP+MI+25aTCA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5a25/Gl3sZwSl0gPu9WMGGl6k1FQ13waJA06WKhyabH5hU9tz
	6EiUAocuIil7Bhovs0QWPluckhb8qthA9vTYJ31A0HzR0D0PgSVGCxDBj+7mbA5NA8omCEMPoG8
	wU8kbYmAoM851CJoRUjb+i2BHefcKbAfEkp5l7DntltcnGIv3cRHIZuOrJDIV2jk=
X-Gm-Gg: ASbGncvBv66FSLGfhkQRIDjCQNdLeUhH8UNIGbtumCgJvG8dzD5ZXBRsXoGYh5OJJyu
	v006UUTJUUt0G1i8I9niAUlQ9qvvuWUDXUyVMpcWQ2Ld/Go6OxIsypUHVDAi5Zte0gTa64teE7H
	NjtBGwDhnlrsbNkfsK0jRHqbEETst5t7ckmP1kHyvgP21aRSdP3u009eGb+JjWWXzceb4rUldD1
	H5xGaOkQxrF/4EpGccp3JLPM7uZA+4eEY0bBdLcpUgF4sWQN7SVh1u8Q2RtVPjSIkDDV2qGc5/e
	WNs/pHDjGxUWFSXnYPylRBBLCMwmBQCZchaiQPA=
X-Received: by 2002:a17:90b:4a46:b0:308:7a70:489a with SMTP id 98e67ed59e1d1-309f7eb2e1amr3532924a91.30.1745589613406;
        Fri, 25 Apr 2025 07:00:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNNIJYXro2LB2aA33RiU7904xrzr2j5MWTnNc/IjINAQLFzeh1hCAoOroDXwzC71r1iymLPw==
X-Received: by 2002:a17:90b:4a46:b0:308:7a70:489a with SMTP id 98e67ed59e1d1-309f7eb2e1amr3532824a91.30.1745589612552;
        Fri, 25 Apr 2025 07:00:12 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef03ca86sm3470432a91.3.2025.04.25.07.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 07:00:12 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 1/3] soc: qcom: socinfo: Add support for new fields in revision 20
Date: Fri, 25 Apr 2025 19:29:44 +0530
Message-Id: <20250425135946.1087065-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: R8zVMr9orEYwZ3xfAUaJLlb4udjdCmam
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA5OSBTYWx0ZWRfXzUmGS0U957LD 30ZyD64YHoIyXNVLCZPLKmbbH/2rMsEY2/lodQ92WuPcmb1hKVjDsZ2karJVjKqShLT3fMQ088N 7kDlhxNuuEHCpYfjw6OJ0W375F00ovqkD/fipq16Hynp8c0ZDe2fR1ZLBxmMAKj1xg7tybT3GY/
 V/5hIajbYoik7vmXWgY+FKfkyeso49UmbDEfMMI6nNp8r5PAobeGC1kQPxb2reYNkcFRIwzEbIX LMSQMzgY+x6jkxU5X9BoCUuXmF41wHbr5p7g1ckawXCyElPDpLpn0BlWPAnJt6XRGQ7Mtr4YbkV aiZonBxjmpL3L12BJm3vE0sfV6f6zHKS8DudywXB84d+9hIP+X5a9Bq/1ieGTWZAEURX9UGntaf
 g/2bhlyk9gXLYzW3vpz/MXvux/3kVjTmcQVKATcf4kHruGUAfj2YDlZd0HNuHu7CcWpZWUSd
X-Authority-Analysis: v=2.4 cv=Tu/mhCXh c=1 sm=1 tr=0 ts=680b956e cx=c_pps a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=jD0WNwiO3up7LfJkFJoA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: R8zVMr9orEYwZ3xfAUaJLlb4udjdCmam
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=999 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250099

Add support for socinfo version 20. Version 20 adds a new field
package id and its zeroth bit contain information that can be
can be used to tune temperature thresholds on devices which might
be able to withstand higher temperatures. Zeroth bit value 1 means
that its heat dissipation is better and more relaxed thermal
scheme can be put in place and 0 means a more aggressive scheme
may be needed.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v2:
 - Added debugfs entry and described more about the field in commit
   text.

 drivers/soc/qcom/socinfo.c       | 5 +++++
 include/linux/soc/qcom/socinfo.h | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 18d7f1be9093..5800ebf9ceea 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -153,6 +153,7 @@ struct socinfo_params {
 	u32 num_func_clusters;
 	u32 boot_cluster;
 	u32 boot_core;
+	u32 raw_package_type;
 };
 
 struct smem_image_version {
@@ -607,6 +608,10 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
 			   &qcom_socinfo->info.fmt);
 
 	switch (qcom_socinfo->info.fmt) {
+	case SOCINFO_VERSION(0, 20):
+		qcom_socinfo->info.raw_package_type = __le32_to_cpu(info->raw_package_type);
+		debugfs_create_u32("raw_package_type", 0444, qcom_socinfo->dbg_root,
+				   &qcom_socinfo->info.raw_package_type);
 	case SOCINFO_VERSION(0, 19):
 		qcom_socinfo->info.num_func_clusters = __le32_to_cpu(info->num_func_clusters);
 		qcom_socinfo->info.boot_cluster = __le32_to_cpu(info->boot_cluster);
diff --git a/include/linux/soc/qcom/socinfo.h b/include/linux/soc/qcom/socinfo.h
index 608950443eee..c4dae173cc30 100644
--- a/include/linux/soc/qcom/socinfo.h
+++ b/include/linux/soc/qcom/socinfo.h
@@ -82,6 +82,8 @@ struct socinfo {
 	__le32 num_func_clusters;
 	__le32 boot_cluster;
 	__le32 boot_core;
+	/* Version 20 */
+	__le32 raw_package_type;
 };
 
 /* Internal feature codes */
-- 
2.34.1

