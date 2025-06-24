Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3EE19AD48
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750745097; cv=none; b=jhFk9jFhgwZMzldTeA/Iiw9dc02ELelA8+0pVbVPpdRmJOSCvQh+74H9TvpZrkDeCmxUpTtLobj9IBX7EQuPdq4ahcz7NIm5Ygg8b71K6E7NAHiv+hnlgPcFr3F1rf3/kCaliqdn0vtir0WXhtwVxJEcaZ52MrpRPn1DmAUk2BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750745097; c=relaxed/simple;
	bh=klaYK/ndNGf2Zd+yYu/jis1akITo3BCwGWiGHVFp7+s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KVNZs8SEYtIBjYCQFwMN5vHYGMKS2XB9+XVNlA9hVft1+LLVBzMgIi0efhyrDl9bJxTBpHxcxKriWuKtHnkmaLSkfN0rybKDz1kYxIT2wZV+YZQT+AalyUHJCZzjASNf+78fzSx8lODU3CdA+4sC707upmScWEf+nrlS2fO7Uww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iiNcGhzM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iiNcGhzM"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NKlJVS014676
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:04:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NEd0bdzHNq+
	BYGf2pvWM9XNZngsnetWAYruQNmk3PFE=; b=iiNcGhzMZ8TS0FOfsVcLD+w+QEb
	bYnUIlEVPMnkQer7sJIXA/g4O3nAMq+vRVN2LfghQvBn0D+V0Zj3E7t+jsD5L3Pw
	Mv5mgFPXD2sGGEYcySuu1SIo+WIk6O5FyOftob7y+yc3XIoIV/wtGWETsrbF+iH9
	+fQOKeRD03d8SAngv2gMGTikDy92vbeX9NCe+oSRtNLTI+DXgdKPRVk7UppuKmuQ
	7/u9PFP2g9Qs6gkrw9JKlvS4fWiDKIC0l6JlyRZHjXwZhQQN/yhtGv8cshH7zQGP
	CAYMjFSfK4Fxh7Q0ILpchN5fcp/L0YqnQU+ckd0afAfRKS/Mk47OLq0PsWw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f2rpu5pj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:04:55 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b1ffc678adfso46024a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 23:04:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750745094; x=1751349894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NEd0bdzHNq+BYGf2pvWM9XNZngsnetWAYruQNmk3PFE=;
        b=AwdULegpbcZ3OVDTWBYLqWQIFPPTUlr+8DiiKAEgH6ulAxOvQU9DxNy8Qttt/ZKRpO
         u15jDM5JdUwMFG6OkP0poEiRwx41hF4748S7ruVn/xCinPp77riPUI/gxzexQFE5RI+A
         poEbqq8QGR/nEt+hxZXQ5O86ZFXqA9QGtsDrwnDA3VeOabpJij/HlZXCYzV8azWTjFEc
         GGGLeeUOdTWg6Uy+KmZs8XYfqkgQjskl8lOiR6iTPhYRFy1qBIqqHs+THAD9AnLw8ivQ
         VIMPieEebVFIcgT+W6JwLp1VCFtm0yvvpkg0XC9u1hiFA3uxwwUQJU3v4tnAFMDjBfCB
         jcpg==
X-Forwarded-Encrypted: i=1; AJvYcCU9ZQuF3w8LTwKoAiLxXaKhRXvvpj4NK1+0kI5wkCQTR+ErYU8LfWJ6CmKiqxiCVOSn4uKz3cQG99j9ydI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwW/vMyPdymuwxBn42rPcS5SIlaZP02CAYq/JSZVS1TD88QhNfT
	eqtibV8qxDQoRPVsPu2e1wrzvb48FiPOu/N4NdaP0OEQ8HFvn2bgk04NmXkFkgDd8KLMOXY2lhQ
	BKsOeHEUpNr+JxslyM757DMf34dT5q7mQrW94AnuWemeq66sZ/wwiS1Rhqp5sz9tBpdeTCScyLF
	8=
X-Gm-Gg: ASbGncuUzxYkl8tqXStEqw1Budy59maOfYm14l/dPwbuo6Nl111iEdNxsPQ+lwM5Ep9
	EE4u/q+2pB8gqcJ3BtOq11Garii4hGKuytQBbGpNsljw+kfDlGW9IxHuxmX916vLoftOOzffwgJ
	eWTVn+8k6a+nxAT3Nw5M18MsiIhY/t2tTHxCgFtRtZeX8awsh1uxL/Zv3R8K8HKHrfeBw4o1uXv
	W3x24VSzETqieZcvPDkdjVxuZDqVRjJO+Q8IooBm2ovGGExvmKsCwhJwYBMdRd+6haf0fM+Bz5R
	BDN8u/ryvXqUmgrMldPnkVjMqfB2N/tNsHd5fQ+n9Idv8Mtp/I2eVUomUJkoWPdDL+jkTqpkAye
	69w==
X-Received: by 2002:a17:903:2a85:b0:235:eb8d:7fff with SMTP id d9443c01a7336-237d986d5f7mr223071205ad.28.1750745093720;
        Mon, 23 Jun 2025 23:04:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoXzDNPCywsWid/86csyo6/oaM8zIDmOlMe4ad7FzFQmavchj+MmL8XVQyf1Oz3B2TnpP03w==
X-Received: by 2002:a17:903:2a85:b0:235:eb8d:7fff with SMTP id d9443c01a7336-237d986d5f7mr223070365ad.28.1750745092828;
        Mon, 23 Jun 2025 23:04:52 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83937b1sm101371455ad.52.2025.06.23.23.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 23:04:52 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        jie.gan@oss.qualcomm.com
Subject: [PATCH v3 02/10] coresight: core: add a new API to retrieve the helper device
Date: Tue, 24 Jun 2025 14:04:30 +0800
Message-Id: <20250624060438.7469-3-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624060438.7469-1-jie.gan@oss.qualcomm.com>
References: <20250624060438.7469-1-jie.gan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NdDm13D4 c=1 sm=1 tr=0 ts=685a4007 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=Bv2r1u00ER1ubdDhqu4A:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA1MCBTYWx0ZWRfX9tC0IDmx9iG/
 4Y+NhhkuKR4EiV2+rkLKAQDWCxpCsKiPPLtuIJPKtxnof6JvPHjwMTQB3GJ+BhcTkpqordXSOvC
 rga1wepksaAkE1s3JZ7q9QPJndgS7UUnwBQQTkRYy4NGOIgbplZ/y5sYB9d6jElBo81yV7MIAxS
 nafz2I92ow60izTxiRuK+x/w9hA3ZD/a/kHCx5nm92wCd9IgPgo0OdjRYl30KQx3AfHT8xShw5K
 1ll92jf4m7lldkOfrOsDQyNCNExjjKQx4Sel9+UEtlY7CjRKDZ2GE8YSo9noLCn1P0s2OU2r8Me
 Vyi5W3XmtcYqWNJDyGKjkQsiPFWjVUY5wMppLTBZ41ETfyPx/VPn+QyUj2UAVViFKDjEaAgk8zw
 9jGS3NedLPoIQfD0O93TF5fukWriPBbklnf9lTBQALR4oFG3unC5AKrH1eHBm1KXpFRQMKn4
X-Proofpoint-ORIG-GUID: CJEB4nLQEUQ4Av-EyUr4fHIDx33JLoat
X-Proofpoint-GUID: CJEB4nLQEUQ4Av-EyUr4fHIDx33JLoat
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506240050

Retrieving the helper device of the specific coresight device based on
its helper_subtype because a single coresight device may has multiple types
of the helper devices.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 30 ++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-priv.h |  2 ++
 2 files changed, 32 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 8aad2823e28a..c785f8e86777 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -579,6 +579,36 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
 }
 EXPORT_SYMBOL_GPL(coresight_get_sink);
 
+/**
+ * coresight_get_helper: find the helper device of the assigned csdev.
+ *
+ * @csdev: The csdev the helper device is conntected to.
+ * @type:  helper_subtype of the expected helper device.
+ *
+ * Retrieve the helper device for the specific csdev based on its
+ * helper_subtype.
+ *
+ * Return: the helper's csdev upon success or NULL for fail.
+ */
+struct coresight_device *coresight_get_helper(struct coresight_device *csdev,
+					      int type)
+{
+	int i;
+	struct coresight_device *helper;
+
+	for (i = 0; i < csdev->pdata->nr_outconns; ++i) {
+		helper = csdev->pdata->out_conns[i]->dest_dev;
+		if (!helper || !coresight_is_helper(helper))
+			continue;
+
+		if (helper->subtype.helper_subtype == type)
+			return helper;
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(coresight_get_helper);
+
 /**
  * coresight_get_port_helper: get the in-port number of the helper device
  * that is connected to the csdev.
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 07a5f03de81d..5b912eb60401 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -158,6 +158,8 @@ void coresight_path_assign_trace_id(struct coresight_path *path,
 				   enum cs_mode mode);
 int coresight_get_port_helper(struct coresight_device *csdev,
 			      struct coresight_device *helper);
+struct coresight_device *coresight_get_helper(struct coresight_device *csdev,
+					      int type);
 
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
 int etm_readl_cp14(u32 off, unsigned int *val);
-- 
2.34.1

