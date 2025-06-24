Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5FD242D9A
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750745124; cv=none; b=tz/h5ybswINCimwcqNO8UoVtwRvT2Th9gmC1Z6lEd9KJWldbg+gzTENWFLsG3VZQv05mN61fLg7ASefWnuuyQOQDq68TlqwsF6VEsy6xipdQS0sT3LR6WYhvbMxQpUl+sQUilVFki4gB3NQu3NdqaRLhBEDs2eHtgWX9qv13SCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750745124; c=relaxed/simple;
	bh=d/N/TB61i7GeVIWGxfjbRQ9Z2F1vTqrm+bBemdmjw3Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GGCK7D0kDNc9SMxlgKBX/CuTL1kytiC63tP5CFIVeer2YVrb0XVVqHLE/30cZrbFjIamnW3TWXrOkWH4oVOHilZV/roXJQOkTL0hlrWga6ZRdruiVfsxXzV0MJOGNSXm9txaw09Md1R05rEYLKF/+2JyYTuS07VAFIqaRBZ1eCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FdU6f3Gj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FdU6f3Gj"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NHkHYi032470
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:05:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=x07SNj1YXpj
	6RfRQ48AeQgzrdGK/jYfZ/E/HEUOOxeI=; b=FdU6f3GjHRbFs8m3J6pr3YFOYam
	OchjWHIfYetew5iKxw86RrBnjvgD6LYTBIDRHxeMshXe3QX60V/KTOaxrJgMgwt4
	76SWEZHMC8sv5BUVcPjB8fx5mOx/UuSPiIdbQQc3dL43jPGJs0fnUXcfkuFOaFCY
	raV8CAqeq9Q1iCkhY45zclLyO++C9IcyE7+Dir3uW3Yy0nkfTp90/fQiTS3CJquA
	de38y0LS9NyUXrrP/fH+rqfZXQdcmmnoIev8Lyqr+yhsNFQ5nfV5KatUf0Svj30l
	CmU/Pjp3fMGUUL+OgFOFLA1JY/rgxbhFmu638RgMNLDvPwS241Jp5bNO11Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm1sfdx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:05:22 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2356ce55d33so1097995ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 23:05:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750745120; x=1751349920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x07SNj1YXpj6RfRQ48AeQgzrdGK/jYfZ/E/HEUOOxeI=;
        b=p7JX9pON8r+J5jMKQgJMssKpdk//0Bbr2Skwhs/0Wo8O4KeJ5ffbu5i1R0qX/6g4i2
         K1ulwTw9CLLpBJ7Euqu1OrKuFUe5KKnQBnor1ZGibhq2qPEh49GsirKjDPix9sefSll6
         o6UcfBx/GDfBJKZkcUnxe2JQzJQdq5EQpPRScMMFvb3rnK9Eht2bd6mwuG6RiHyFtVR4
         INsONu2bjNXG08A4CSwtB+NF0hT+uTVNnLV6fplhzxdO0hy7GziDPTmhZfNFa2pLLwqw
         iewnYeNkLa6w++fl3xM2Q5qqstwfYkqPN4evJ/6aBLkAoKmPsYZUWBob1SP0m/8vRi2W
         9JiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXb3dx1irMpOjDG+Zh2AtTnx9AyCMCnsaSnJk/fh5cgTga52iwYgEG0IyyuvlznBoistrzJIr/H46x2/kY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv8P+BGAZS2UjAMguUVxBgoFd79iqko6+SydWDeUv4pSg1+3rp
	gOhph3xkqr6n2lqse837esDt88rKC1v6zNf8RCFcedfukQECvcDt+sgru3V3vIl0Naxs/50E87M
	Frjx7BjcYSMalKht3KTKhDtBENrQkkkDqGjLX7fvmbbI+1TK/qJz2RJfNqXcZX+l/5+w=
X-Gm-Gg: ASbGncugBOMDOMuuIRDDYwgqbd3whWdBgqmEaaYhaZhnzmVUqgKVRCCEyLBgLrWp4nO
	Fq1nAbD6cO7ArU5pcnGjseL+nfogTFEtt/SG5QYqkFVPUL+uDGgYembTpfGfRMZfrjfhLxUsNCx
	klpK67tbLZB0dT+SuCaQUpsLvIk03l/AVIID6g7P2yTEHfC/7qSmV9i28rz385UV2qhHN0UK7Q/
	q4ztEmRjf9uZLYd7KXTcghG3IxPB3oNzfAK/nOoPHQlS+vts0mCGBAvDq+6C+/hT5eNIuy3WEqg
	Eb3HH7+2rBdGuUa1i2lZoH8htiZudtAfMlVey/pvtDmsUNG65hFpA8Uct1tNo5M7lnDY8iFNDgs
	35A==
X-Received: by 2002:a17:903:2d0:b0:234:8a16:d62b with SMTP id d9443c01a7336-237d970f9bamr253275995ad.12.1750745120409;
        Mon, 23 Jun 2025 23:05:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE97aOL/swaHhYhRTiIKSN86TTBXV1K7HhrE7lHhuqfmi5WW9OInNk27uiW+r30tmlu+zChDA==
X-Received: by 2002:a17:903:2d0:b0:234:8a16:d62b with SMTP id d9443c01a7336-237d970f9bamr253275655ad.12.1750745120065;
        Mon, 23 Jun 2025 23:05:20 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83937b1sm101371455ad.52.2025.06.23.23.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 23:05:19 -0700 (PDT)
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
Subject: [PATCH v3 08/10] coresight: tmc: add a switch buffer function for byte-cntr
Date: Tue, 24 Jun 2025 14:04:36 +0800
Message-Id: <20250624060438.7469-9-jie.gan@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685a4022 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=wDWrKlMOwBuH9W2KgGoA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: C_aKqHczI9CxIsLqEmBcXg3xRuDmK9ra
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA1MSBTYWx0ZWRfX/cPaMpgM5+Qj
 bRYUBg01N4l7H+lxtmP+h00nmOUu1vL4hiBJcug8e4geRnfATAOiTPbdrywdQ30EE0qz4brlDGE
 NWO0Gmu/YU+CU+eRCxrV/4QvU2vFFgovNYQsKypG9gKl2/iJ9IoUTdmisK4s+9iIXTW6wUReAzl
 pZvdtu/aILDRP7o/G50ESFRPcgMv5BfdUgwNj5P7Dq1S6QQP/tELN+v6enL/xinMrb726sOlJqR
 FczAGIhG5xI1JdALmc5th70xdtjq5z27cP+Ci5HYf8NNEFMckn3cyxaAyN23+StZe3xEjXHHeE+
 XT0iYFqYjpe3s3uewMhrIa5xTBg8bN4qS3iz/6luY4pFkQpzyCXZ8eC+9WvIcyoAm1Z+cynotfo
 a+Q3RKsfpp4myEbDSsibUzvKMbPSfyvznOtXld/MIb3RB0tkIAues2v2CquRSVUgy6yGuGDc
X-Proofpoint-ORIG-GUID: C_aKqHczI9CxIsLqEmBcXg3xRuDmK9ra
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240051

Switching the sysfs_buf when current buffer is full or the timeout is
triggered and resets rrp and rwp registers after switched the buffer.
Disable the ETR device if it cannot find an available buffer to switch.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../hwtracing/coresight/coresight-tmc-etr.c   | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 2b73bd8074bb..3e3e1b5e78ca 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1287,6 +1287,58 @@ static struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
 	return ret ? ERR_PTR(ret) : drvdata->sysfs_buf;
 }
 
+static bool tmc_byte_cntr_switch_buffer(struct tmc_drvdata *drvdata,
+					struct ctcu_byte_cntr *byte_cntr_data)
+{
+	struct etr_buf_node *nd, *next, *curr_node, *picked_node;
+	struct etr_buf *curr_buf = drvdata->sysfs_buf;
+	bool found_free_buf = false;
+
+	if (WARN_ON(!drvdata || !byte_cntr_data))
+		return found_free_buf;
+
+	/* Stop the ETR before we start the switching process */
+	if (coresight_get_mode(drvdata->csdev) == CS_MODE_SYSFS)
+		__tmc_etr_disable_hw(drvdata);
+
+	list_for_each_entry_safe(nd, next, &drvdata->etr_buf_list, node) {
+		/* curr_buf is free for next round */
+		if (nd->sysfs_buf == curr_buf) {
+			nd->is_free = true;
+			curr_node = nd;
+		}
+
+		if (!found_free_buf && nd->is_free && nd->sysfs_buf != curr_buf) {
+			if (nd->reading)
+				continue;
+
+			picked_node = nd;
+			found_free_buf = true;
+		}
+	}
+
+	if (found_free_buf) {
+		curr_node->reading = true;
+		curr_node->pos = 0;
+		drvdata->reading_node = curr_node;
+		drvdata->sysfs_buf = picked_node->sysfs_buf;
+		drvdata->etr_buf = picked_node->sysfs_buf;
+		picked_node->is_free = false;
+		/* Reset irq_cnt for next etr_buf */
+		atomic_set(&byte_cntr_data->irq_cnt, 0);
+		/* Reset rrp and rwp when the system has switched the buffer*/
+		CS_UNLOCK(drvdata->base);
+		tmc_write_rrp(drvdata, 0);
+		tmc_write_rwp(drvdata, 0);
+		CS_LOCK(drvdata->base);
+		/* Restart the ETR when we find a free buffer */
+		if (coresight_get_mode(drvdata->csdev) == CS_MODE_SYSFS)
+			__tmc_etr_enable_hw(drvdata);
+	}
+
+	return found_free_buf;
+}
+
 static int tmc_enable_etr_sink_sysfs(struct coresight_device *csdev)
 {
 	int ret = 0;
-- 
2.34.1

