Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28162550C2
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750745130; cv=none; b=PaSdKRxbHQRfrQD37UnPxqnFxwVlOXJQFFujXUUdJWSWcXfhjt4RjKk3QKh3VoTgmrgJygehpW5HlzWxkiK+ITcXAOa7ByUR0NhfGMMtank3kpJU9i7Plnho2ls5++EOnKG31iHNKeyzIg18v1o2cZTOfeQxYsBncfyg/Gu2M3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750745130; c=relaxed/simple;
	bh=KepZY8zi4khOQ+LkoB9ldagpD9linYgqNDUu7qBt0Ug=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FXAa3FyTfv1tDm+zwZrtXNy4JOVwXW0GEr/WXjNbu0a3PA9Y/mexICBHXVDFJuIFHnMx/yclibAnakuPIOE2d14ckWcUXXPuroMzw1gGIc5EcNTA6hRcGcVbWcaZE0DE0cYO1cG/CJkQ4PNxTs5Pn65fZo1CLZ7N8ziEQw66x/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y2Io+6Kl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y2Io+6Kl"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NNxWxR017387
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:05:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gbtexVl8cn7
	s6dLp3Pk/zhJx463eI0itM2/mzeX7Ixo=; b=Y2Io+6KlVtGgDnl8eTkmBjbzuiD
	vusDMEAoAl/dEprcwBUvXhP1l1zht8LOP3KcxwxSRVOXEVSGgUoBtjE1FOkSiTzJ
	XOxU5gyGVt5lLG6i/1UjVPLcYra480HMDUzd+DLUkgjngUQSP5ruWibU6pOAgqMj
	H/rsq0JBoTafxJL3EMumuOlnP897x2xWj3ozSmHxNb8NkC3VOlOZCpR7X9TJml2H
	mtFF489O8ebMCwkzgOz9bNXKHIFW5bYFqlS++4ZloxpvNiA5AkELs2/hM9EP4U8L
	GnDwG4JKAemJvjfZh9Ick/w9clactHXhGjV6TtSHa+8piM1M1tj829pk6mg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bgb0dv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:05:27 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b2eb60594e8so3312973a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 23:05:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750745111; x=1751349911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gbtexVl8cn7s6dLp3Pk/zhJx463eI0itM2/mzeX7Ixo=;
        b=sKmKMYMZqqdU3OnJU7fhRKcFRzqN5pTs8Kg68Y9n4AlFeNsm6gYT09mqa+kKvDlOxJ
         TatIMO6GwD/z534/meGwJ7aJZDK4k4wUu03gHrcH3a9kVKZLSfL5UqVqCMxcCUK92ojA
         CW4Ri/BPVzFbepOAfWTFXaem5VviK1KpGaZDfURO3xGsatw0vPrFVhuyWNeXd09CFqEQ
         wF1h+LAlPAoM99vcg6Qznm5wIRyoicGjpNoJuEm0GHcmSGYj73DjCShoYRYMsN3oDFXY
         Ut+yNJ61mBg3YX8GUe5RY/pSOypVUrL+dChdl2V1vTFpx+cKOpHr+eF5E9W+nD8xAV0u
         wP4g==
X-Forwarded-Encrypted: i=1; AJvYcCW3UbNYsfUx0snvvq+OuSSJ2FQ3q+6Y49QrLAs+Wg9JTCrL4DkvQPMEyP57nEXm3e77MI+L3eHoqKgLWnY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzlw7dyfNDKNeeo1BWm0p9k5ti9RKzVkgXNjlNW0kljvUCe2inq
	aUnmVjE/JVIE96/pAM++bfy+IQZGEtbUCdGA18rt8xdhUT/iG4IXjY/R8Nb5xGvh0sN0rAL0ncH
	n4G4uKtJ8ZLTZJxsgZYjgE2t6/49OaPQ+zNy17fn3/KxeG8BhgH1HljrbtlncIYcVGZc=
X-Gm-Gg: ASbGncvTtZQoQL/pZcNHSoy9SdKLVNj0Wrp66xUhY+zVSAj7VD1iAu6lT4BUeokpHzf
	ep1Vjr245vMUfUA/raaHQxdddG7njLKyKWC7aXI3NliWFlG2L+HUgdmj8aAYhb+kpPG/FuV9FlY
	uDiU5g+9aEA4+fASoxfkuZoqgHfW7SjPk6Ac3d2wblPg8mGTiFkx5wxQSQKOF/1hWbJN8Df1Sa3
	dGQ8Pmm4aj0dqH26vg0Bh1TBd5C9IgCA6eeFDGHdWHGZPKCuMHktfvy8Im9nVRgC/wMk4hNeiws
	NyiYY+KQ+grX2xkBhWW/QfYUhOuETf+xVoCEZh6+cjhu3GaZi5rshnWsFvWhVk/L4TA4MywDIm0
	Zhg==
X-Received: by 2002:a17:903:1111:b0:235:880:cf70 with SMTP id d9443c01a7336-237d97f8c47mr201278775ad.14.1750745111416;
        Mon, 23 Jun 2025 23:05:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/6alQ8oVUf4oBoB/kDRpinRzRgdoo/fUtBrPtywrip1OTrzz7TjJGaNQaFksnjaq2AYvlSg==
X-Received: by 2002:a17:903:1111:b0:235:880:cf70 with SMTP id d9443c01a7336-237d97f8c47mr201278405ad.14.1750745111051;
        Mon, 23 Jun 2025 23:05:11 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83937b1sm101371455ad.52.2025.06.23.23.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 23:05:10 -0700 (PDT)
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
Subject: [PATCH v3 06/10] coresight: tmc: add create/delete functions for etr_buf_node
Date: Tue, 24 Jun 2025 14:04:34 +0800
Message-Id: <20250624060438.7469-7-jie.gan@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: b1kJkaUh3QQu1Ly9SwwBXdTJH6UZYhEQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA1MSBTYWx0ZWRfXwBC99zu9hKEE
 pPsF4Tau6DEImO6E2vjbimYpoKJvKeOgRz38rl6WlRj5mGKctVoKWirO3kNPGyQHWl4mmdveK7o
 MW75/by+n4V57lEZgAy6lveHHk551Zxjv78qDUXsnAhi/CdMe19knARlcnl129yAm79010zPPzB
 H3v9I69S0LkdBzA8evHe+Eg3ysjIR1383z374NlZbc+OwqZv3DzHuX1eFdGcsIST9pa4QFmd62n
 NjJ9fva5KLwjmsSaAQEJl4ae9Y58yVnuCIV3mL0HHSKS5DkXPhxM9ywtb/a+vDv0jdlbxP7uK5t
 g19X40yw8gFXcV3lj6/BocR3mZk9CNxyUvNGtZxuinFpNlTEqP6Tj0P5CkNlpccACGUpNPZEIO7
 v+7qOQe9WxQ8Y2ta7Kzsvg2Nf53sQ/cj0kEbkD4u1P43JqCTIkqRCk+xWviJoxh8y4+Uoxam
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685a4027 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=k3jFKW3szlTOC2bxmxAA:9
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: b1kJkaUh3QQu1Ly9SwwBXdTJH6UZYhEQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240051

Create and insert or remove the etr_buf_node to/from the etr_buf_list.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../hwtracing/coresight/coresight-tmc-etr.c   | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index b07fcdb3fe1a..4609df80ae38 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1909,6 +1909,55 @@ const struct coresight_ops tmc_etr_cs_ops = {
 	.panic_ops	= &tmc_etr_sync_ops,
 };
 
+static void tmc_delete_etr_buf_node(struct tmc_drvdata *drvdata)
+{
+	struct etr_buf_node *nd, *next;
+
+	list_for_each_entry_safe(nd, next, &drvdata->etr_buf_list, node) {
+		if (nd->sysfs_buf == drvdata->sysfs_buf) {
+			list_del(&nd->node);
+			kfree(nd);
+		} else {
+			/* Free allocated buffers which are not utilized by ETR */
+			list_del(&nd->node);
+			tmc_free_etr_buf(nd->sysfs_buf);
+			nd->sysfs_buf = NULL;
+			kfree(nd);
+		}
+	}
+}
+
+static int tmc_create_etr_buf_node(struct tmc_drvdata *drvdata, struct etr_buf *alloc_buf)
+{
+	struct etr_buf_node *sysfs_buf_node;
+	struct etr_buf *sysfs_buf;
+
+	if (!alloc_buf) {
+		sysfs_buf = tmc_alloc_etr_buf(drvdata, drvdata->size, 0, cpu_to_node(0), NULL);
+		if (IS_ERR(sysfs_buf))
+			return PTR_ERR(sysfs_buf);
+	} else {
+		sysfs_buf = alloc_buf;
+	}
+
+	sysfs_buf_node = kzalloc(sizeof(struct etr_buf_node), GFP_KERNEL);
+	if (IS_ERR(sysfs_buf_node)) {
+		if (!alloc_buf)
+			tmc_free_etr_buf(sysfs_buf);
+		return PTR_ERR(sysfs_buf_node);
+	}
+
+	sysfs_buf_node->sysfs_buf = sysfs_buf;
+	sysfs_buf_node->reading = false;
+	if (!alloc_buf)
+		sysfs_buf_node->is_free = true;
+	else
+		sysfs_buf_node->is_free = false;
+	list_add(&sysfs_buf_node->node, &drvdata->etr_buf_list);
+
+	return 0;
+}
+
 int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
-- 
2.34.1

