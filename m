Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823801A23A4
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 01:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744248830; cv=none; b=Cpuq0x0ScXEN1DF4lGrYoZo3k4JGBc6LkuWKFWeogUCoEg13AK7+Zo4SXNIB5tU4R+kJ+yfEgV+ZSHg4L7Bi6Dw/bfgCulwYUJX07pDRGFtVzuflQSgqh+D9Q4voIwY8zzHNu9XfitOH6uNvFbN+vpsFKfid8KuGR0I6NDj2Dp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744248830; c=relaxed/simple;
	bh=9EeYc2uLAA+LZVZlS7O1+YEDNxBRhdSs3LsoOwIdgsk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NH4/PmpC0uLqE6kyrXF0MFAYEKV0qgG4vbsvangT5116QUmOwbCFg2SscDq0jORw3DvTp24iL0ao3symlH1ZPN6NEPA7ZYW44pF1TRKEOB6waQ7ocgj/2I7leQSnanN2IO+SkD9cdTe9iPoEW7chDM0KVrvT4YvaAWTOiRQBPPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H9yJUA9b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H9yJUA9b"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539HEAr3028988
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 01:33:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/hbu+J38Osl
	kyyaqUl3TD0hhOvybI072r0nxhEaLcKQ=; b=H9yJUA9bw3vdhwFOIqJSwaKyDPs
	VH7D+VDM0GQ7CVhfxld0MT66iEEwGqU+XnAmi5bFqjn22L85W9fVXZW7IMSfWJ9T
	XUI+zEbIUhB8RiaZ6fddg/RtKp5jaP2vZg1QRg5WNgeAHP2Ixrnw8eUEoB9ETKA2
	M1p52z+mdIRgU4FIW7mwx6rLK2NYKABmFJMelJA2BDu6WtX8nPhkElITkFuw+Ir+
	q7l31eH/ItXMqwT84tH53XwCEYzRv5eYNZkc5XBh7KrqXmYzg5J3a5w3d6yVsZPX
	iZS+8GihNblIq6kFOr2Eyzk5+8PP0QQvLLUzpoIyN432Tl28GS4Ax+SVHaw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpmd5nh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 01:33:47 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-227e2faab6dso2429915ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 18:33:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744248827; x=1744853627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/hbu+J38OslkyyaqUl3TD0hhOvybI072r0nxhEaLcKQ=;
        b=om1XnE5+RFOEaesP/YC7pkYdrmVhmRYK89p58n6Plfw0x44/+g+/qRroAUPRBwdyWP
         +gB/Hz1msEIEE+/Y+UW4pG/8GJC5UIPbr1TjCyVs4ogS5fzA73blkrkue6jFiEA6E8Y+
         6CspP5jtPeB1aamQfEHLo/BKbhrLxPVEwpo3T9QgcEMgWMyoiJUR7BNYWieRjoWjCQ0Q
         qVeQRTCFLtUotNbbfSzXiclcGrTyHuRTZaoDiQaHWXHTcgSeKrtxUYZGcw9j0BZG3Nuc
         EFAXaTNtDYpvuyqWCiQob6xXmG9u1nedcnkT6pO1OcNMP/GoGnImHcvmkZX9UM1aynqR
         TF/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVDbrk4nZxl8WvCw6oD/8armoW7wkuMu1ICO7MtP5ZURb6zcMcdxXs6IP+0njTOeKCHJwEm9kJccCi/Gmo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkfecKwHVyvf4u0TIqHkCOeBX88lSE67pNzw5sIUVxUJt1oT/j
	Wxbh7nt9ewCQV59Gev6jq9AXqxytjDkwgwVMvqmaKbo0KhaIovpjKwOhSwHO7JkSzLSB9a7CocH
	FyKc37k2kPTjp78eFlb+9euPZl6hTkAIN4V5pL3mvX/DGEUeufb2BZqct6cn/jjU=
X-Gm-Gg: ASbGncvXIKbtIzhtX3XWoFWKHFWRjTXh9MlHQ8z2obqU8fDMsHcEVkXdFaWxBxaLUlK
	EaE7LVZJaAk37oC5JwDNKA1IICOJS/69j2kzbi/2FvfeSG/N3Y3bLjTkG1j6SOCIue8KFXXyFL1
	ftjAax9iYj213iwdgfAS4+1TMvO4aNMFsCXvvfTu9BDu69JeqGtAGD4NT05T6jOASjcAGPA4+ys
	mAyP26bG7ZUceB8101MCs7Yae1FVaoEVNHixM7REHwtOscY252cda7Vi1eUnFwbpvQn22Rb/I9b
	K67Mp4Rx+grbGSnmyGbrqP+GvQeILWL3B9J2OvI2HvfcK86zInqcEZAYlHpPpB6VGGh9nDM=
X-Received: by 2002:a17:902:d2ca:b0:223:5a6e:b2c with SMTP id d9443c01a7336-22b2edd2d5amr14924725ad.17.1744248826347;
        Wed, 09 Apr 2025 18:33:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbZM9pDJc+QEgclUt66GbWgtrAL7JKUny/wc6kcLIOC46cExebvjVHkQBn+tXU3uwE77c53w==
X-Received: by 2002:a17:902:d2ca:b0:223:5a6e:b2c with SMTP id d9443c01a7336-22b2edd2d5amr14924405ad.17.1744248825829;
        Wed, 09 Apr 2025 18:33:45 -0700 (PDT)
Received: from jiegan-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccb596sm18801815ad.220.2025.04.09.18.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 18:33:45 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v2 1/5] coresight: tmc: Introduce new APIs to get the RWP offset of ETR buffer
Date: Thu, 10 Apr 2025 09:33:26 +0800
Message-Id: <20250410013330.3609482-2-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250410013330.3609482-1-jie.gan@oss.qualcomm.com>
References: <20250410013330.3609482-1-jie.gan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 725mY5CaT0JhdeL4opmStBDSAO3esyyO
X-Proofpoint-ORIG-GUID: 725mY5CaT0JhdeL4opmStBDSAO3esyyO
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f71ffb cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=QSMfYRlErQPllaMuWGUA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=887 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100010

The new functions calculate and return the offset to the write pointer of
the ETR buffer based on whether the memory mode is SG, flat or reserved.
The functions have the RWP offset can directly read data from ETR buffer,
enabling the transfer of data to any required location.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../hwtracing/coresight/coresight-tmc-etr.c   | 62 +++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h   |  1 +
 2 files changed, 63 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 76a8cb29b68a..ed8a89fcd3fc 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1236,6 +1236,68 @@ void tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
 	drvdata->etr_buf = NULL;
 }
 
+static long tmc_etr_flat_resrv_get_rwp_offset(struct tmc_drvdata *drvdata)
+{
+	dma_addr_t paddr = drvdata->sysfs_buf->hwaddr;
+	u64 rwp;
+
+	rwp = tmc_read_rwp(drvdata);
+	return rwp - paddr;
+}
+
+static long tmc_etr_sg_get_rwp_offset(struct tmc_drvdata *drvdata)
+{
+	struct etr_buf *etr_buf = drvdata->sysfs_buf;
+	struct etr_sg_table *etr_table = etr_buf->private;
+	struct tmc_sg_table *table = etr_table->sg_table;
+	long w_offset;
+	u64 rwp;
+
+	rwp = tmc_read_rwp(drvdata);
+	w_offset = tmc_sg_get_data_page_offset(table, rwp);
+
+	return w_offset;
+}
+
+/**
+ * tmc_etr_get_rwp_offset() - Retrieving the offset to the write pointer.
+ *
+ * @drvdata: driver data of TMC device.
+ *
+ * Retrieve the offset to the write pointer of the ETR
+ * buffer based on whether the memory mode is SG, flat or reserved.
+ *
+ * Return w_offset of the ETR buffer upon success, else the error number.
+ */
+long tmc_etr_get_rwp_offset(struct tmc_drvdata *drvdata)
+{
+	struct etr_buf *etr_buf;
+	long w_offset;
+
+	if (WARN_ON(!drvdata) || WARN_ON(!drvdata->sysfs_buf) ||
+	    WARN_ON(drvdata->config_type != TMC_CONFIG_TYPE_ETR))
+		return -EINVAL;
+
+	etr_buf = drvdata->sysfs_buf;
+	/* Disable the ETR if it is running */
+	if (coresight_get_mode(drvdata->csdev) != CS_MODE_DISABLED)
+		__tmc_etr_disable_hw(drvdata);
+
+	if (etr_buf->mode == ETR_MODE_ETR_SG)
+		w_offset = tmc_etr_sg_get_rwp_offset(drvdata);
+	else if (etr_buf->mode == ETR_MODE_FLAT || etr_buf->mode == ETR_MODE_RESRV)
+		w_offset = tmc_etr_flat_resrv_get_rwp_offset(drvdata);
+	else
+		w_offset = -EINVAL;
+
+	/* Restart the ETR if the mode is not disabled */
+	if (coresight_get_mode(drvdata->csdev) != CS_MODE_DISABLED)
+		__tmc_etr_enable_hw(drvdata);
+
+	return w_offset;
+}
+EXPORT_SYMBOL_GPL(tmc_etr_get_rwp_offset);
+
 static struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
 {
 	int ret = 0;
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 6541a27a018e..945c69f6e6ca 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -442,5 +442,6 @@ void tmc_etr_remove_catu_ops(void);
 struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
 				   enum cs_mode mode, void *data);
 extern const struct attribute_group coresight_etr_group;
+long tmc_etr_get_rwp_offset(struct tmc_drvdata *drvdata);
 
 #endif
-- 
2.34.1

