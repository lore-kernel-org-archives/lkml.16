Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A61238C2A
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750745092; cv=none; b=J9lRDbUkRRLdkLYekcgvOL7F3VP8pJKgTFAYxZZDdNZa05XiM6CHcdvyvhyAXy/L8vew7rs1tSfZGLUS8qulzbq5sJ9Kst+ImeOup6PY8tgSdeRkiqXdr6yCjW3jy3CKYKZAjA/NFm+J69+ZfP+lUVRFaPjHT/tExPpJxv3+xxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750745092; c=relaxed/simple;
	bh=n3EaXaaNhWYWmkdCOUG9x+pdcHBoegUPElZCXFPVc0k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FNcRYvJ/OQkWRjLWvF3h3EOpMzV0NsIQf9HPHdWJ6beY1e4rCcq4xh9WtUH4uJd0mFPqCaxcQKCEJg8ijlnBhyA8qElA0s6R7JhHLi9VLxtC2HGaKI65tZj4H+vSdx+/EOZaiWK4gGnKJaikTiSKSeIKOqi74QDy2TODB8E+Jy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TyhHVy5r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TyhHVy5r"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NKljU5013198
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:04:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SXDZmqpfj9O
	i17S+KvFoTK0GaAZ2Kfc438E97avizmc=; b=TyhHVy5rcxyPvLe/sRdeKCTKrzN
	qRApGnsNnaQf/VpGRLGJ3oUoWTW+DYHp6U+l7V+Flfx2eHPBQ55pPZdfAbgoz+ud
	Cohw3Ebp+ORsQebZD3culedijJ6er9q8F+7JV2D3CRQn4O1ohiLNMF1UNGPqCe5H
	voC96rCJa4PRb3fs8iQ8vuHG+65M5Gp2fMhBRoUlqZFyumsyejebSdevU9w8oYkY
	nrZwPo9z3zo56l7832wQh9ZNZc78zZwBR+w02RRij6k4m+A3xEsYEGHvg6+AdeLt
	X6Etjs3m4sL5Be+WF8r9PkwwqeDS8ZI0AZCjCYiPcsQoY7iWQruZjlNzX/g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm1sfbf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:04:49 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2356ce66d7cso64060255ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 23:04:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750745089; x=1751349889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SXDZmqpfj9Oi17S+KvFoTK0GaAZ2Kfc438E97avizmc=;
        b=MuUu4gTJIkzPZpxSOietyBGvwClEFp/K/2kxQ/CuQzCBWYH4WPy7m82Rz581U96lwn
         sNsK3/+6Espljwcr8ETw3Ao1CNProowNnRW1F6lKFDFZ47ctSnDEO1Jrlp1cO+9GQtW6
         GCsxzhxsN9got38MThp0mEBHJhxmULBbD6O3PDNyqO+l038QXBwk7Wxe4trm+cEreImi
         G1DWKkOXzmOtwDWCwyYgjG6VyKY0k4+EeTdqcYwrEf8OIm0hUOiajI1uI9qhLnpOgyzP
         RbQc/rLxG9hk7xQyzxl9Vwz3rqYLpvsDvEwj0w+bujMuD52DaJnEMg7ZjDi8w2duoWtO
         5AzA==
X-Forwarded-Encrypted: i=1; AJvYcCWdJyaUnfkjRoqRpUuKu0bEbwcWhqTNfwvoSiCX/fvVRXSNUqSwITy85ePLqtB9ayfsWQ6VZQ33thjLn0o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNgWPeAB1/KghGnHNbKtZ8VNQI1e6rokWH2hsjCqYv6BfM6hVc
	F1xaOXeKlSqRFaM6CrmT+Fd8itUs08+7KH68EMg+7yEWpAwNHpm1GN59rwIeKqmD+MiHySfEmmB
	MsjNoRAEJU/kYowEiEkk+uU+lniWurE8/Shlo0hOaRICq7N+ewh2QBkQW+DBjvPUY8EY=
X-Gm-Gg: ASbGncupE75bHYptBn7hUqH4K/JVTGxEeToK2E2DhSeQggw6hnmXz0zfqXBa6CxU5Ys
	RJaHCfMV9vZPtxYKo8BYIki8HNae19ASh9j8vXSh8oRH1XXkDXXhRqyKUMVYUjiXhfMtoUMmepa
	nl+QuWaEJ7SFySgUPCKV77r76913cv13yVmJyGAUhPBrUiqzQjAxpiSgUToX9j8f5e7/cEh5NnD
	Nic+An50RUU7z5Z1pt7u8p6U+hzxgxunMvf5DGrpu7GYjdwYrHGc520Ps7k4dzUAuOuFvcyfJ33
	PedZ96zrlSTlykgDGdLDyW6EnzRGQUwG0nPHJjA7DgWNDqivU7K7aYmj6L2tHDQo24uy7h9at9P
	HEg==
X-Received: by 2002:a17:903:18e:b0:234:9094:3fb1 with SMTP id d9443c01a7336-237d9a7321dmr269831005ad.35.1750745088743;
        Mon, 23 Jun 2025 23:04:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHGFVEgHMh2e65wgJoSytM+YbUXaFUdaLymaIwIAsqFFbJ5e27Dt9FJEOhG05p9+rpg/ktWw==
X-Received: by 2002:a17:903:18e:b0:234:9094:3fb1 with SMTP id d9443c01a7336-237d9a7321dmr269830575ad.35.1750745088368;
        Mon, 23 Jun 2025 23:04:48 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83937b1sm101371455ad.52.2025.06.23.23.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 23:04:47 -0700 (PDT)
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
Subject: [PATCH v3 01/10] coresight: core: Refactoring ctcu_get_active_port and make it generic
Date: Tue, 24 Jun 2025 14:04:29 +0800
Message-Id: <20250624060438.7469-2-jie.gan@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685a4001 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=UMME_An3wchvczm7DuYA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: f9CsWN7kqW20JKiw8HuXlOzMYZSLo57e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA1MCBTYWx0ZWRfX758tkh7J3Wo+
 86+GuA7wMN8rI96xvq0uJRfEI3nIUPr+l3Mv5YbIl3xUwhnI4jZGBS+mBF4rz+RJXm3VNwTsEgx
 /ZRChL9ozJuSV3qdlsXcXZ/PFZbWKZQ41v4r4SFkgF6tZ0woNHsw588iVmITKEI+YJ66vWRHU1r
 ZnuN6U9jK34tWZ9cOUfQEego13bINMLBoPtH5J3kPhsqM65iQ/wsk06MPdhitgW3FEEAFefVLOo
 Xrx98nrqTokJcqRiUnTSyEeQxFq6TUfWrPohOaqMrgzIvRwb5ERQAgFR4I5N8M5Aihyk//GlM01
 CWkEC2krw8a6sfJeo+MPzpwX1ne92sfNv9AuZB+NwZLGCQYHRxq+/KmsdocLlsNWuphkFl/Jg64
 25fhjAIzIGs0eceCupzkDSvQNgBokeeGGt89fJh8g5KKpDB0OlTNl/VDFMYS9TEi+msFRKJv
X-Proofpoint-ORIG-GUID: f9CsWN7kqW20JKiw8HuXlOzMYZSLo57e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 clxscore=1011 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240050

Remove ctcu_get_active_port from CTCU module and add it to the core
framework.

The port number is crucial for the CTCU device to identify which ETR
it serves. With the port number we can correctly get required parameters
of the CTCU device in TMC module.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-core.c  | 24 +++++++++++++++++++
 .../hwtracing/coresight/coresight-ctcu-core.c | 19 +--------------
 drivers/hwtracing/coresight/coresight-priv.h  |  2 ++
 3 files changed, 27 insertions(+), 18 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index fa758cc21827..8aad2823e28a 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -579,6 +579,30 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
 }
 EXPORT_SYMBOL_GPL(coresight_get_sink);
 
+/**
+ * coresight_get_port_helper: get the in-port number of the helper device
+ * that is connected to the csdev.
+ *
+ * @csdev: csdev of the device that is connected to helper.
+ * @helper: csdev of the helper device.
+ *
+ * Return: port number upson success or -EINVAL for fail.
+ */
+int coresight_get_port_helper(struct coresight_device *csdev,
+			      struct coresight_device *helper)
+{
+	struct coresight_platform_data *pdata = helper->pdata;
+	int i;
+
+	for (i = 0; i < pdata->nr_inconns; ++i) {
+		if (pdata->in_conns[i]->src_dev == csdev)
+			return pdata->in_conns[i]->dest_port;
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(coresight_get_port_helper);
+
 u32 coresight_get_sink_id(struct coresight_device *csdev)
 {
 	if (!csdev->ea)
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index c6bafc96db96..28ea4a216345 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -118,23 +118,6 @@ static int __ctcu_set_etr_traceid(struct coresight_device *csdev, u8 traceid, in
 	return 0;
 }
 
-/*
- * Searching the sink device from helper's view in case there are multiple helper devices
- * connected to the sink device.
- */
-static int ctcu_get_active_port(struct coresight_device *sink, struct coresight_device *helper)
-{
-	struct coresight_platform_data *pdata = helper->pdata;
-	int i;
-
-	for (i = 0; i < pdata->nr_inconns; ++i) {
-		if (pdata->in_conns[i]->src_dev == sink)
-			return pdata->in_conns[i]->dest_port;
-	}
-
-	return -EINVAL;
-}
-
 static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight_path *path,
 				bool enable)
 {
@@ -147,7 +130,7 @@ static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight
 		return -EINVAL;
 	}
 
-	port_num = ctcu_get_active_port(sink, csdev);
+	port_num = coresight_get_port_helper(sink, csdev);
 	if (port_num < 0)
 		return -EINVAL;
 
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 33e22b1ba043..07a5f03de81d 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -156,6 +156,8 @@ void coresight_remove_links(struct coresight_device *orig,
 u32 coresight_get_sink_id(struct coresight_device *csdev);
 void coresight_path_assign_trace_id(struct coresight_path *path,
 				   enum cs_mode mode);
+int coresight_get_port_helper(struct coresight_device *csdev,
+			      struct coresight_device *helper);
 
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
 int etm_readl_cp14(u32 off, unsigned int *val);
-- 
2.34.1

