Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822CD277808
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 09:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748424108; cv=none; b=U2iFrUI+/xtFdxDj1oJM/EpZx/azi2p3fJjdCubH1UDv1qfK0dwFrpgLT6inrYROmdX5h6xJQ5FMg9cri8Bw/470qyNlaN3uH1gHrntnbMUPcra1D9URmq/avQqHOldvdazbeAnfkfLS7FZvK/OYM/1pjX/+Hl2aBazaY5loLQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748424108; c=relaxed/simple;
	bh=T0qYIbqFmqXVvM8maSPUINWxr6ffxALcDRq37QKDpUE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ub7OBXGM+8qKGP0gU7ZveMMQFe/agI5yhQ1rwUiSXO1DTa4NPzX8yMMNjWlimMWLibduaiXykdrjLfhdqZ6dmTV29AyI/XRtFFX3GU3nhlhix4EEFbNCU9+rc2UCPztDe8/5iHxL2Maq9U3/h8aqb0nNuCH/FDwSnHauno/z5+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ppHM1wiz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ppHM1wiz"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S0GWhT025125
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 09:21:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B3e5gD1TIG3daxgo7uyZ1bho3H0+oAlBxtTqaML4VOk=; b=ppHM1wiz35/e14BJ
	rg3mpo6uNPruYpkZuXVhQaJBJnCYjDujdXVcdwnkVNTlrxIZhV+khD4nW2C0GC+U
	XNcZq3a4Yp5sa6YMDHBMZ5sYRiDWwTaHNlNn80TerMqxJV6VOE11X27cjJmUa+tu
	puBCLJ55CesNIHXt51wDVD7ptmfYefM4U8Un3RUrWwKEGDIxbCBz0udzIlNEuRyt
	VtQn//uo0hn+88IVnuzwrGa158NNxY1LPiymPGvV6T2fkFt0YVogblK0ezeHkqIv
	GYpE4kqooAve0ufqdsUpKtphzGi56kYZyogZG40qhZ9Pb2KLD4WxUGthNK6GbH95
	v6L/Gg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u79p9ry9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 09:21:46 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-742c7227d7dso3213288b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 02:21:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748424106; x=1749028906;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B3e5gD1TIG3daxgo7uyZ1bho3H0+oAlBxtTqaML4VOk=;
        b=izYK71Uz+jW0M0j6mu9QAAGQAcjx2Enp3B7+HqspJk4pWsi06+GmebwnqKd/858qET
         R6Qpfv7JmCABFnqif+gQpA42ninPa1x2hrB/58voGZpYvVfJOPL1zgcApRoUXTaSws/0
         r8ZxpycEAe0hZnn2DdKUvCPwS9Y19H8gY+ci2cyi5BmMojsnThcngMPEMxu1wVWL2aho
         LxVQIknhvcXDzlKY/zk0JrsVhYwZxflcVSWCbcFJ9ZJR4J3Eq9IRjPGxyG6m21oXQdqG
         CnBfNhgUG5rZ0wMhC9JOFrqJWhfXlOrddKbTd2GKP/Oc7a9wu5ctd8SX0jNx1W61MMg1
         qOZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnB8MFPIgg8xTSmiwmVLMRRrDNZgbiEvV8bVNFKWHAXNSS03Dvyxlp8kY7mUZmG3WlOmc/hQ7bxBtnx50=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLh002SD0LGank9/x6mJAVeYW5gW4HGCzP9rN6J1UE5L1QD4RB
	lTmNbINX3Wc6Sx4+a1WZB2BPGUayBSWATqh0G01w/HB7VIBB7php7CnZsBXdu7JrRAlg0Xd5B/E
	T2ktONvh+1GElPkWDoKVEX0yHEf1PzorJ/MoZ4ie9IFcNy6sWV6wRMwnNZHJj25cw2dk=
X-Gm-Gg: ASbGncs8eKY8uKGoB5+Yi/QNrioSaOcbMNJIdOkId8e8sMiqK2KgfL/622cbI8pd+Uw
	K7Miuuaq47TX4Mw52sIqiHu/kNjM0/cCf8MecTXAQA1FzzJ92A7GvoSHY4dEdz96rTdwEEXj4Ju
	bn4pXbJqKiTuT3W4oW3AvMp4tAYrtjeKKgmyyQdYo6x561HCNcfxRnb9r7V525qfY9PpT4cBj1u
	tPfh4ZH73gHZua8wPvhPscgl/3O8NJpJcsT9pyMU6W+YhCTDvQeBJHsND4HWlREVfXvGh75kVCV
	621qg8aVLs10NDQn59CNQlWH9A==
X-Received: by 2002:a05:6a00:6f1b:b0:746:2706:a7fc with SMTP id d2e1a72fcca58-7462706a9a7mr8987448b3a.12.1748424105955;
        Wed, 28 May 2025 02:21:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEXmimPDwaXlupcBQXflbX55k4GLlXfzZNdxsktITY1gbSKn/j9w2AKmwk2GPM1FYEG7Z2Mg==
X-Received: by 2002:a05:6a00:6f1b:b0:746:2706:a7fc with SMTP id d2e1a72fcca58-7462706a9a7mr8987413b3a.12.1748424105590;
        Wed, 28 May 2025 02:21:45 -0700 (PDT)
Received: from [10.213.103.17] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-746e343c2c6sm833456b3a.134.2025.05.28.02.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 02:21:45 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Wed, 28 May 2025 14:51:32 +0530
Subject: [PATCH v4 2/3] soc: qcom: qcom_stats: Add QMP support for syncing
 ddr stats
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-ddr_stats_-v4-2-b4b7dae072dc@oss.qualcomm.com>
References: <20250528-ddr_stats_-v4-0-b4b7dae072dc@oss.qualcomm.com>
In-Reply-To: <20250528-ddr_stats_-v4-0-b4b7dae072dc@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Doug Anderson <dianders@chromium.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748424095; l=2841;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=T0qYIbqFmqXVvM8maSPUINWxr6ffxALcDRq37QKDpUE=;
 b=wVOZUEvKvoGhedr3yzrqmQMTShbymVV7iWXl2rRbQJHFFPz/HBRxb11xzEHex1TYPINp7IN3M
 v/DY+hZM1ukCSok/O7Tjx+XdERUg2Ap7re/x4rspVYkVCCnQffJH+Oh
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: uZA3T4dIudFTtEbm1fGYouyEyk-1wyUc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDA4MCBTYWx0ZWRfX/mPLt/WJUul0
 4mpOa9Q5/ys26IUCV3V53s54fcI/xyUfGQewHsHMfQTQdTOQfTFv87FIbRcqHLBRgP6u0fO0YEQ
 B5KAYnG/PtYiGqbgvkx40G8Z7krKtbZtceryp4pdMIrSLBzHLG1rQ+JFaIODlEalm8y7O+0GuI4
 ySIFyTYK9O9ye3V9nkiOvZq4twmitW5NBFD9glg4nqjdSt/YAyAnaM6uhmI+Cgzw/nk3JTGDCAA
 3HId5w6J0JARFKqh2ow6NByY7eosoSjGOT7sZC3dGRnDCNO3ynXQRH+yyNdM5IJFetzB/yC243f
 cVWe9drp9fLZ4xFNSMjM1oA8eJfeuXHFA6m++fd1Oanm2nakAVsrmtSMvRCkoUer+Zcyn3U6sn5
 CWTqR+Nf0d57yoqJiJ48qLUng2q0hvZawNzCIRTOeio6Q17tR89S1MR21S+sMo6GLly8JIWx
X-Authority-Analysis: v=2.4 cv=HNnDFptv c=1 sm=1 tr=0 ts=6836d5aa cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=BT90xxDHZu-g9S-RVkkA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: uZA3T4dIudFTtEbm1fGYouyEyk-1wyUc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_04,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 phishscore=0 mlxscore=0 spamscore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280080

Recent SoCs (SM8450 onwards) require QMP command to be sent before reading
ddr stats. The duration field of ddr stats will get populated only if QMP
command is sent.

Add support to send ddr stats freqsync QMP command.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom_stats.c | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/qcom_stats.c b/drivers/soc/qcom/qcom_stats.c
index 33fd2a1574464768bd07289e743fbb79ba415e84..0545c8cbefb8f18758d4eb51638e4ecb94e05422 100644
--- a/drivers/soc/qcom/qcom_stats.c
+++ b/drivers/soc/qcom/qcom_stats.c
@@ -13,6 +13,7 @@
 #include <linux/platform_device.h>
 #include <linux/seq_file.h>
 
+#include <linux/soc/qcom/qcom_aoss.h>
 #include <linux/soc/qcom/smem.h>
 #include <clocksource/arm_arch_timer.h>
 
@@ -37,6 +38,8 @@
 #define DDR_STATS_TYPE(data)		FIELD_GET(GENMASK(15, 8), data)
 #define DDR_STATS_FREQ(data)		FIELD_GET(GENMASK(31, 16), data)
 
+static struct qmp *qcom_stats_qmp;
+
 struct subsystem_data {
 	const char *name;
 	u32 smem_item;
@@ -188,12 +191,28 @@ static int qcom_ddr_stats_show(struct seq_file *s, void *d)
 	struct ddr_stats_entry data[DDR_STATS_MAX_NUM_MODES];
 	void __iomem *reg = (void __iomem *)s->private;
 	u32 entry_count;
-	int i;
+	int i, ret;
 
 	entry_count = readl_relaxed(reg + DDR_STATS_NUM_MODES_ADDR);
 	if (entry_count > DDR_STATS_MAX_NUM_MODES)
 		return -EINVAL;
 
+	if (qcom_stats_qmp) {
+		/*
+		 * Recent SoCs (SM8450 onwards) do not have duration field
+		 * populated from boot up onwards for both DDR LPM Stats
+		 * and DDR Frequency Stats.
+		 *
+		 * Send QMP message to Always on processor which will
+		 * populate duration field into MSG RAM area.
+		 *
+		 * Sent every time to read latest data.
+		 */
+		ret = qmp_send(qcom_stats_qmp, "{class: ddr, action: freqsync}");
+		if (ret)
+			return ret;
+	}
+
 	reg += DDR_STATS_ENTRY_START_ADDR;
 	memcpy_fromio(data, reg, sizeof(struct ddr_stats_entry) * entry_count);
 
@@ -304,6 +323,19 @@ static int qcom_stats_probe(struct platform_device *pdev)
 
 	for (i = 0; i < config->num_records; i++)
 		d[i].appended_stats_avail = config->appended_stats_avail;
+	/*
+	 * QMP is used for DDR stats syncing to MSG RAM for recent SoCs (SM8450 onwards).
+	 * The prior SoCs do not need QMP handle as the required stats are already present
+	 * in MSG RAM, provided the DDR_STATS_MAGIC_KEY matches.
+	 */
+	qcom_stats_qmp = qmp_get(&pdev->dev);
+	if (IS_ERR(qcom_stats_qmp)) {
+		if (PTR_ERR(qcom_stats_qmp) == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+
+		/* We assume any other error means it's not defined/needed */
+		qcom_stats_qmp = NULL;
+	}
 
 	root = debugfs_create_dir("qcom_stats", NULL);
 

-- 
2.34.1

