Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90DE22154A
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 13:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746710012; cv=none; b=gUM/qd/um9/8bsnmzGHDFEA1m+WnCAoglUWOTHK3fjCYTJea/mFiNPKQ+6e4/ZeA3+pxj8iWmfHoKxymUxnCy0jJRS2Ys7EHxnsJvHXKMXTrXUH5GvNdV2DxBOBce8lmXQCqoxX9R3WxFYcfo2kS2kGEE3cI2dpf0wG1X4c5U2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746710012; c=relaxed/simple;
	bh=39lKtowy3pICwEKF1R5izU3l8zKwnzcqGSa95Y+dwBw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nBwQ7Y9PuBdRHBKx8h4KcphfB5Xs9LtkPWjzLUSupbb8ccmancV+mHC2jR8HLkREuMoPq1dDcftfMDrm9CrC9kjmAq+ap60SX+HX7ZTNZZ++u1BZpheCu1r+o1891Ax0dGR1Panu+k2+hpMJqhtBmCgm2I9xaAJyvxxMbdi2+yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M4jUZa9u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M4jUZa9u"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548D0LlK016851
	for <linux-kernel@vger.kernel.org>; Thu, 8 May 2025 13:13:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8KZayw8bWAE
	pG6U2eryKSIHbza6t1WgC9YVOFUXwkQU=; b=M4jUZa9uXkIJ2lrYhWVbfr+WSjy
	0CNNpI8oy+aQeWWLgfnox2qhiDwbDvb7z7g9SU0kA+Qw4FEflXBPlvfiezP7l4gj
	aA0cgcAXeaYpJwifGhA5aaxUtJjjP+XLgoPsKO6N/loqiJz9PQcsbk/rex5Jow9K
	VQEigBrGYYebw2X8F73ZsKz8xjNwga2al6nYXzVc28pB5KMxldIViK7BwmgrQtyj
	Ac4Q3fpsATvGCkF+wvT+VnSIATTUeAEFHIG9EtslKPyuq3zQVjuzZXvfu3chrbQx
	Wxf+4Aj1FnPOEkl3SWcc10llCdqbifHhT++C1Fm7Q+liJZPRPMQzivixVTA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp8sd27-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 13:13:29 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-30ac9855e35so1378773a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 06:13:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746710008; x=1747314808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8KZayw8bWAEpG6U2eryKSIHbza6t1WgC9YVOFUXwkQU=;
        b=eVDtjQkH6YP8C2zWE2Xo2CoysLYk5w2C4vC7991wyeQMR57RT9UbbPqjgj9dhz5CRj
         9/fSxDdQ3lKHGY+qymIwYihFFpijZQwCFwjqHvUCYPiaszfDop9MKHDN2Pc/+BO6CmHU
         eHwIq1mCp4HRqM8Vkcigyq7cRhX/77rhE/wJNNPLaz3YSLIbuWXEnkzBYNl5uEoiKABp
         LrJEQ3hX30/q9bK3DUuD8QfTJ5Nb0KOf1MyuMYpj1gyDbbe7udySd/y2yH+MRwoCXofp
         PRBcIJenAfpOMYtJLlqVdDZ8zWZ/rdUTuCUTwG5ghVweYRewJ3aWZhSVHVWvl6UQUg5a
         vb7A==
X-Forwarded-Encrypted: i=1; AJvYcCWE4VgWLsT72R6HYV7OVUAdFLx870gkzihp1Cu1hxZbR2TEJVuLWtW7+d0qavHA9ZaUcmCQntIveCDs9M0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQDYH1gyNOvlWOtzKCajPRxUqOUIsNa2mSmUmtWuZoZRadFXx8
	Bn35vAF9eJ8TQQmJHtm3ZVWBVbiaKDihmm2TnDd7ZBwTwPnfIRtmhFDE4brSb9IAaD6nL7LPjva
	rFPAT3tS9bOb/YyA6oMOjj3GkEL/tSKaGTj8jIzI6NW1oxUOQRdSGb+WDtGJtNz0=
X-Gm-Gg: ASbGncvmkURVNzUp0tQHA+n9xdyPKFGVSlFpG4O4H8uGQxwTZiWtWCNExIZ9wiY8Gmt
	TBUkk2hhXAnCsXmjChmnNvJw9E4g7TKQ5sGEh4nju70/6HDUzL2oK6wBPEP8NAC4MS/CW9I/70O
	qLrMZJHrgBftcenH6nkv6SkJZcIyK/TzvFWxqKy+DTUF4Nwrm9Zwapecr7YbGezuUOJU8rq27GG
	seOo+QgIu31DekC52yWdoDlYb0U+3q3ygVMmZ9CjFffvoOhJDn1TeLTDOO1Ujk1AneADRqgwz5P
	yHCmkTx49l/crJ+CUSTe5c5akno2E6IeJz+rPqY=
X-Received: by 2002:a17:90b:1d09:b0:2ff:7c2d:6ff3 with SMTP id 98e67ed59e1d1-30aac257b1dmr11703286a91.35.1746710008015;
        Thu, 08 May 2025 06:13:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTtDjE8pqu0/foquZITAqO1yInYezn2eYa5QWjI3Q9Gl6jLwwLSljPRQBSd0OVvMo4aimzyA==
X-Received: by 2002:a17:90b:1d09:b0:2ff:7c2d:6ff3 with SMTP id 98e67ed59e1d1-30aac257b1dmr11703215a91.35.1746710007390;
        Thu, 08 May 2025 06:13:27 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30ad4d2e499sm2135477a91.16.2025.05.08.06.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 06:13:27 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3 2/3] soc: qcom: socinfo: Add support for new fields in revision 21
Date: Thu,  8 May 2025 18:42:57 +0530
Message-Id: <20250508131258.1605086-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250508131258.1605086-1-mukesh.ojha@oss.qualcomm.com>
References: <20250508131258.1605086-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _Lh-hFmVbDrKmRAqIEMNbPNtDbHk1dJ1
X-Proofpoint-ORIG-GUID: _Lh-hFmVbDrKmRAqIEMNbPNtDbHk1dJ1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDExMSBTYWx0ZWRfX+Vudgy0WGx5t
 oeWdD4PBdCxSfNA0liVCxyfWNDPqzVuNgrEU9BK3nBVto3iiuQ/EQq83FOnZWL4oUlSni4cpQLY
 1ROHfnig4aGQBxUZpSRE6cxgiogmJLfYIpA5pYiJ+439oTxMR1x1hj7xVBw/kfgd9Fz+QNrxv6x
 9hTL5szO8uxHXQBmYmhYjNyOJgOawNZthstJT9ZRZNFplBSh7mZlT73rsIBaMuH4GJhnoRPgF5e
 T7GCND/iG2dj3bALCq2m4HU/4uMKlC2mnIJHFoaty2C4gPhnpS6B87DYuX8aqAl/TibTYfT+BeE
 PH93eFIW5g9Dfj3o4yJU+0v/vJwZQoKZi35GwPFzNdThP1J2qpTiuHLeSYwPFXposm307FqCvmj
 m7fCLuSBEINGjsvztsGlHWKWr9gOd6Ts0f9SUJNj8MJ+HQquCvlOP8EHLd3Dz54xbRwNNV6+
X-Authority-Analysis: v=2.4 cv=e/4GSbp/ c=1 sm=1 tr=0 ts=681cadf9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=V04GdxmOTIv6GTtReyUA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_04,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015
 mlxlogscore=999 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505080111

Add the subpartfeature offset field to the socinfo structure
which came for version 21 of socinfo structure.

Subpart_feat_offset is subpart like camera, display, etc.,
and its internal feature available on a bin.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v3:
 - Removed debugfs entry as per comment from [Dmitry B].

Changes in v2: https://lore.kernel.org/lkml/20250425135946.1087065-2-mukesh.ojha@oss.qualcomm.com/
 - Added debugfs entry and described more about the field in commit.

 drivers/soc/qcom/socinfo.c       | 1 +
 include/linux/soc/qcom/socinfo.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 9a92c9c5713e..55acae79ec3a 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -608,6 +608,7 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
 			   &qcom_socinfo->info.fmt);
 
 	switch (qcom_socinfo->info.fmt) {
+	case SOCINFO_VERSION(0, 21):
 	case SOCINFO_VERSION(0, 20):
 		qcom_socinfo->info.raw_package_type = __le32_to_cpu(info->raw_package_type);
 		debugfs_create_u32("raw_package_type", 0444, qcom_socinfo->dbg_root,
diff --git a/include/linux/soc/qcom/socinfo.h b/include/linux/soc/qcom/socinfo.h
index c4dae173cc30..3666870b7988 100644
--- a/include/linux/soc/qcom/socinfo.h
+++ b/include/linux/soc/qcom/socinfo.h
@@ -84,6 +84,8 @@ struct socinfo {
 	__le32 boot_core;
 	/* Version 20 */
 	__le32 raw_package_type;
+	/* Version 21 */
+	__le32 nsubpart_feat_array_offset;
 };
 
 /* Internal feature codes */
-- 
2.34.1

