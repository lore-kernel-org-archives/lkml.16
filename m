Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C476522FF35
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750745122; cv=none; b=MCHkZ+wwTfCB9/dh0WymbGdNmBCVUuuUf+y6IFhWVDfWuuog/V9DzN9et7TegB+MFiDTbF7WRBmM7VcR0WO8a3WUA2Lke42IwuByyyzfKm7i2MKr5KSiRXitarOsbwD8yhjQPEbenrQKUnBf4/MvhHHfPfD5OQ8ve6lPFDeHv88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750745122; c=relaxed/simple;
	bh=NXbdrziIeuB5pcaSxjAzniV7Y1VF/HCxTAevsWleWaU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pVB4IeFgCmiOnA9Au/LyRWc8d26jnu0NOhPllcJxSpcRN47jmvOcHL5+S5aeKwTltToSXMCCax3TCzBCYl5i06mR+Sg/BZASwDC10hmIqxxZwDip+ezHeeXvZG5kW11URrwLeln++DLbVitj9m6MOeV/Wu+2SxdmeiMJkFCFlbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A1Bqo/Tq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A1Bqo/Tq"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NKlXjD021092
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:05:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pon7MrhUMFa
	eGhGyVgauqCCEFXCkk5I04yNnyLGhKTc=; b=A1Bqo/Tqq9UBD9AlarPJzaoD2Ne
	KU/qTD72PJzjaINh1EPSAlkXyd0OF+rUqA3Sw8/2qHpbVOuz78ZjNobRnXR5RtMc
	bJ0v/Jb4NaJ2jLzCM4ixTLyFe3E8XyRM6Wje0b5U83B6hJSERDt6xRdwRTVY6yTB
	C3Ip8CgEw3NNaVd+1Cd/GzVreZdFFK1Oj2PPbvIOrfasK9WuBY7GGVc1votFZj4E
	nyYaPI7BPSrRSGYkTzb5ITseMz4WL2520mB/bkntpfEu+icGMAMBk3dZ7qkrPq4R
	p+GBsiI6h60gG6QVfFAEDZMZUxRsuf1vi9UqeW3fBJSy4vDJ06xchJEwATA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fdfws56f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:05:18 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-235e7550f7bso463805ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 23:05:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750745107; x=1751349907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pon7MrhUMFaeGhGyVgauqCCEFXCkk5I04yNnyLGhKTc=;
        b=RsFx6O9Nwx6bcQiuAI2wdshg5v9q0bwRdl6UQKeDAnx+chZSvUvyRp+fbvgRD9rXiF
         8+58+0p4rpzLJ5Vkg1cb71GCJ8fKcItrHD3xXXshi7F/mEbK4NNkrURAQGLhYcm3vd+L
         0Cmv2wEwFy3Te1CeGrdmkB+BFwL2eDF2uObYkjl/7Har3MszdH6Q6GQXOIWUsnB5lnyk
         v0cArfj6hUl2gtby9ngqMJu6Ov+C91MtwjFXID7sCXcj0O56pNgCxp0Ib/hUeDbP8H4D
         eR4UYg9DhWN6ZCJF4ZpSEVLNKG9HLcJWtiiLE1bq528fQ4+JHYqioc6Y4K65yOgGSawG
         yjXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGSu0kezIZQirvi57CwL/DJXnGGKZTZK8To1VSBVM6x2bWgk6re94kWLwYfxRzFKN0haENLEQwB/LPxF4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzInOFPVEjxmtyPXKi/jlH126L/bFHPCZbqFMJMcAWLza3w818e
	9NoJiOKOKAbN9ah0+MCsqRz0AHSieTUTraE9mnRJOD48tBUrf5GNWOcYnI8+wpBEXIZ3tuy9uzX
	Ieh1GHTM7AnICXk7stXj5eKzw8fxce91ONFF1Snuvkhc1pXXs6eM4LcApLNU7JDm9yj0=
X-Gm-Gg: ASbGnct5ovomrorL1EYStIOfd0M4hObxduRqtuTKMpqNx8u9BrdDVn+nq+BIHzvMU/z
	MzcgRZcnZUugQTFiQC30XDIBNXi+pIE5ooSOqi7rUJnIfSP8QoNm3m7v7R2qTptg+rIzHaXJMJT
	acvunNDaaGu+qlpFip1mliGZt2tBHhgHzVL3h0sLoYEjIVRQON1Pmfx/W0p/oYJwoV2RK6XmKNR
	t6ngaCTZOrK6/pidUedAQV0AKf8lra8o6fU+B7ligaDhnv/0J/yJs8YrFa4WDiICcUbyyF2Qhct
	COiN3L7D3eq5a11CBrEQLKMP8ICX7Oq/nByXO5u3U1uaLqB3QKn2jgh4o4nhPLSefP7Ry0mDGlM
	pwA==
X-Received: by 2002:a17:902:da8c:b0:234:986c:66f9 with SMTP id d9443c01a7336-237d983d37fmr250600065ad.22.1750745106921;
        Mon, 23 Jun 2025 23:05:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyxi/2L5RpxT7jQrCkp0XQD4t5nbonOAsYnD3NIf9AfeQ4K63zfMYh1t30n1bwNRgtIh/QhQ==
X-Received: by 2002:a17:902:da8c:b0:234:986c:66f9 with SMTP id d9443c01a7336-237d983d37fmr250599855ad.22.1750745106562;
        Mon, 23 Jun 2025 23:05:06 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83937b1sm101371455ad.52.2025.06.23.23.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 23:05:05 -0700 (PDT)
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
Subject: [PATCH v3 05/10] coresight: tmc: add etr_buf_list to store allocated etr_buf
Date: Tue, 24 Jun 2025 14:04:33 +0800
Message-Id: <20250624060438.7469-6-jie.gan@oss.qualcomm.com>
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
X-Proofpoint-GUID: KOc85cD2pE6lMPvLR3885Orck1ozfTLf
X-Proofpoint-ORIG-GUID: KOc85cD2pE6lMPvLR3885Orck1ozfTLf
X-Authority-Analysis: v=2.4 cv=MtZS63ae c=1 sm=1 tr=0 ts=685a401e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=ORm1qb0EFYpRwVLUulEA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA1MSBTYWx0ZWRfXzo3FEdvQbDkL
 MnYH0HQs1U+0LHbUl1bGbJlzF6l1qvZHa1VRdTPdstD4B07d4nBJApPKTwGuvbfQa3nu3GQMHsB
 cu4Cbkd3FFsPN7xYIe8lWiNbbaww3XjGrLLrGbeC4KIFHxfpzL4zoHozv3S3LWy2HSaZg+U9Db6
 y9kyFEYCbYJv42BWrzaVaPFXFX/XRgimFrOTOIuvk/TXRZKNyN6CS0uTXR5iCVOPaw5W6pa03nQ
 z0DmI0WDTHBVtkFOKSXgyhF+XsM6o+JuES1skbEM0KImAiNbu/G6E4sJhNG234d8EoHvt2ldKn3
 mnsL7TIqF2Arf+5N5hKVbcYwdKXCNk2kfI5rh5C3yNwbA5ZzCd0rLK5k65jOlaS0KVufC9tuO/a
 dWjlTKLN0NN7YsLooNiBFuPS7lBGLINbB0WnUFiTST1iZ4KCHM8CjpQ6kOMkOeyfqGjonbn/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240051

Add a list to store allocated etr_buf.

The byte-cntr functionality requires two etr_buf to receive trace data.
The active etr_buf collects the trace data from source device, while the
byte-cntr reading function accesses the deactivated etr_buf after is
has been filled and synced, transferring data to the userspace.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../hwtracing/coresight/coresight-tmc-core.c  |  1 +
 drivers/hwtracing/coresight/coresight-tmc.h   | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 88afb16bb6be..8531bac79211 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -840,6 +840,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		idr_init(&drvdata->idr);
 		mutex_init(&drvdata->idr_mutex);
 		dev_list = &etr_devs;
+		INIT_LIST_HEAD(&drvdata->etr_buf_list);
 		break;
 	case TMC_CONFIG_TYPE_ETF:
 		desc.groups = coresight_etf_groups;
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 6541a27a018e..f6b05639aeca 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -208,6 +208,21 @@ struct tmc_resrv_buf {
 	s64		len;
 };
 
+/**
+ * @sysfs_buf:	Allocated sysfs_buf.
+ * @is_free:	Indicates whether the buffer is free to choose.
+ * @reading:	Indicates whether the buffer is reading.
+ * @pos:	Position of the buffer.
+ * @node:	Node in etr_buf_list.
+ */
+struct etr_buf_node {
+	struct etr_buf		*sysfs_buf;
+	bool			is_free;
+	bool			reading;
+	loff_t			pos;
+	struct list_head	node;
+};
+
 /**
  * struct tmc_drvdata - specifics associated to an TMC component
  * @pclk:	APB clock if present, otherwise NULL
@@ -242,6 +257,8 @@ struct tmc_resrv_buf {
  *		(after crash) by default.
  * @crash_mdata: Reserved memory for storing tmc crash metadata.
  *		 Used by ETR/ETF.
+ * @etr_buf_list: List that is used to manage allocated etr_buf.
+ * @reading_node:  Available buffer for byte-cntr reading.
  */
 struct tmc_drvdata {
 	struct clk		*pclk;
@@ -271,6 +288,8 @@ struct tmc_drvdata {
 	struct etr_buf		*perf_buf;
 	struct tmc_resrv_buf	resrv_buf;
 	struct tmc_resrv_buf	crash_mdata;
+	struct list_head        etr_buf_list;
+	struct etr_buf_node     *reading_node;
 };
 
 struct etr_buf_operations {
-- 
2.34.1

