Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B422441B4
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750745126; cv=none; b=AJv5ziLWKdT3eA18P/gsugphi9Of8qKdxNtLyAFkAilELD4IyGFsS9ZQ48lF+ioJ74O/SCNbI64M1vz+nNx0aQeUCiH9Np+cfav6QVL1SEovdneFxudJFNoUrGIQKZzcTY1uk6HQXwzihYcMFAIEtJF+LSORsZei0c9U6GP+Q3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750745126; c=relaxed/simple;
	bh=gbGSvUxtrQfj4wK9v01MzbTUWNeRHpvRuORydIUDJO8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=h7iX5Cy895pG+UpP8YvJS3Lmq9f7JiKpndAGsAds5XXBMf8ArLeBbmUfftTCCdYIYRfpXsLWW3xxzrepdFsaWsWm3kklrBH6P/2XHHAF2NecZD3Oto/aDnIk7HawFUcLLDJV2QlbHFVgcDv3kA8mVD/zQdNo0+i6z1PT1znqKXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ejweXddL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ejweXddL"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NJ3Tve020978
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:05:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ViTNhJOtGjt
	6lfMBtp1FlF2uEsyGJpyKBN1SPAXTMJ4=; b=ejweXddLN4cdGC90vxtxRWcRdLx
	RMM4f7qzZoQeV/H0MekdTNVpiYLf5SGw91kKougV3ZclEhoJ/gBJd8a8MssJINSN
	XbnSn8Xb+eR7OmOa4JHrv8hcoZfxKo+CqkAKYc/v2IPe4FutOPFHkjtQn/fbptUT
	1GhyjgUf830Bsyvelj+dw3K5/z+fe8M7VI2drwGZS928OdUbeZZWSvvaoGVu+lAG
	H2Q4yvvKWtbaLvt9YwdsO9Wot6yTOED0mZUpS5nopIFpwpcWj+a/AoSJWj5niwsK
	1f24fhNecJ6FIOUdMLF0/jRoXlOeIpMOhb968JBO9owi1cIWXwDYlrLq6Vw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f4b3tv5a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:05:22 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-235196dfc50so48262385ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 23:05:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750745116; x=1751349916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ViTNhJOtGjt6lfMBtp1FlF2uEsyGJpyKBN1SPAXTMJ4=;
        b=hJniZwaF8m5bjWRri3DiYK/W6oajSajIBPfMa33r9IQxz3UhJCc9+mreoxyrBuY0h2
         QZngkbhDLTJn6Z2WWjana79QdJCosbuXvyFQlufoeCu1Su4WKDOqwmVLQCjoWCr5kvOc
         wolgXY8iyholFmkZ4A6MtN2IGbK4ajJ38ACzqnB2RqmYglcrmQzcUcLa1U0K7+RtbrhR
         utgDCT5P8E74PEdtyFolwgoCnd2+gF0MJ//Cqu+BA4FFd40OkiDIbdGlDBnj4TJOddIx
         RQPm5sdIa+XhtPGxspBRrDM9zUF6QmmhnGaTtHF/e/A139GdYUB7+SJwngQVqR9tifxi
         hQFA==
X-Forwarded-Encrypted: i=1; AJvYcCUcGKBnWnSYXx2VD7EEmsxhubiA0/7q1ad4flGvDtWsXBd5VXXmNKf3u8DbXv0Fa+hP7rXElLvwht4tPEI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmD4UFcIL6k1jPlyp8V0Ly8iZH4d3JTuPLf59slC6kE8msOUmy
	QzHsYyfix01jsSLhPbtU+PP5pgF8NoD/N+eh7hIir5MpQ7TJOpXQ4PgXPGTEwGXKazPo0GTwreT
	rEBmDbL/lMEmVAVVUgcQl47bL1Ugru1RW4sDBjBbl9GNl/iSSH5RY3QNgIuHS/yoxFTo=
X-Gm-Gg: ASbGnctXzFgQL2bpg1fFpAH8skg+BmHZLJ0L3niqgJwQ/Wi2r05HhsmOo/evBCqlb1I
	Imkbu/Ts4A2Q+00MwaoAdd75ZuFupv9b2STbQctePRs3IjqrLLarh/uK0cdyBCJSGAtHaI4AuYd
	t2QspGaaaBbu8Q5jNdHN+MKzhIAEnlTSfkkd1uWUQkBC1qIevJ6imOiv6QayabGsflL6cvMKa5x
	UfQPfiK0/a7nrULpQV0/2e7ov/UsHD5hl6XilixZpcIUcDF7zsCscp9dLILuSdO+0QlmeUF8LYi
	o8z5aQ72X2/HYSgsRQsyJLtHKQkxeZFpo4KXM5F/hEVaHAdXm2+0ln4cKVKNREaM0UePjyagAdo
	KpA==
X-Received: by 2002:a17:902:da8d:b0:231:e413:986c with SMTP id d9443c01a7336-2380245eabbmr32408715ad.11.1750745115990;
        Mon, 23 Jun 2025 23:05:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqWPFCk1vGIK6OC6QmCXLMh+OHz10tmlUnDaYKRcbgjljEq4H6EvG36i6gTOPY5fL0FezOsw==
X-Received: by 2002:a17:902:da8d:b0:231:e413:986c with SMTP id d9443c01a7336-2380245eabbmr32408275ad.11.1750745115520;
        Mon, 23 Jun 2025 23:05:15 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83937b1sm101371455ad.52.2025.06.23.23.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 23:05:14 -0700 (PDT)
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
Subject: [PATCH v3 07/10] coresight: tmc: add prepare/unprepare functions for byte-cntr
Date: Tue, 24 Jun 2025 14:04:35 +0800
Message-Id: <20250624060438.7469-8-jie.gan@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA1MSBTYWx0ZWRfX8ZROFmVE6r8D
 D20MAp4tpqNV3NN0Wy3EtBNj+Xo+0vLkgiyOaOgr0/gYqnVEtoQ0npSpaSd2nuADnftkJg40XEF
 4ua0apbD4O+6gOs9OWDgMyUbIiBmqM5LURHKCjrhEklU6fGB+a4mIoNcBANOLteLSWuW5DconPh
 m+ayZP9GHcoFWp/0oLieDMS/98ecIuYnSB/RhP8Sz0fnVKB8eaAgAREyNcTNBiNZevY5UKoMrUP
 V3hvWYaidwtcKBWG+Tq2DBZgYkSF1nuQ9Vc1lTF/D4EJabGCfEEUplZEj4808uCB2UO1uB7RK9Y
 c3TKz6HHuEigWNWaVcB62wNnI27Bn8PdSuPmhcJ3OSQJanKo4UHvpTyAgwYlQHhl2Z7p4wTv1Yk
 szgndbsrv8D5zk+aYPaOxiRW1V7UkMlk/FlIUUmCVldKjE1b2Wpxwz8lQHqYCOu2Kj5MekpG
X-Proofpoint-ORIG-GUID: ozN6YcCRPw7jvGm162_8_4yyAxjjzkwm
X-Proofpoint-GUID: ozN6YcCRPw7jvGm162_8_4yyAxjjzkwm
X-Authority-Analysis: v=2.4 cv=A8BsP7WG c=1 sm=1 tr=0 ts=685a4023 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=xC7plfDI9GgKYcT3xssA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxlogscore=799 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240051

Prepare for byte-cntr reading. An additional sysfs_buf is required to
receive trace data, as byte-cntr always reads from the deactivated
and filled sysfs_buf.

The unprepare function releases the additional deactivated sysfs_buf
allocated during the prepare phase.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../hwtracing/coresight/coresight-tmc-core.c  | 38 ++++++++-
 .../hwtracing/coresight/coresight-tmc-etr.c   | 79 +++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h   |  8 ++
 3 files changed, 121 insertions(+), 4 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 8531bac79211..40605310240d 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -229,7 +229,11 @@ static int tmc_prepare_crashdata(struct tmc_drvdata *drvdata)
 
 static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 {
-	int ret = 0;
+	struct coresight_device *helper = coresight_get_helper(drvdata->csdev,
+						CORESIGHT_DEV_SUBTYPE_HELPER_CTCU);
+	struct ctcu_byte_cntr *byte_cntr_data = NULL;
+	struct ctcu_drvdata *ctcu_drvdata = NULL;
+	int port, ret = 0;
 
 	switch (drvdata->config_type) {
 	case TMC_CONFIG_TYPE_ETB:
@@ -237,7 +241,18 @@ static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 		ret = tmc_read_prepare_etb(drvdata);
 		break;
 	case TMC_CONFIG_TYPE_ETR:
-		ret = tmc_read_prepare_etr(drvdata);
+		if (helper) {
+			port = coresight_get_port_helper(drvdata->csdev, helper);
+			if (port >= 0) {
+				ctcu_drvdata = dev_get_drvdata(helper->dev.parent);
+				byte_cntr_data = &ctcu_drvdata->byte_cntr_data[port];
+			}
+		}
+
+		if (byte_cntr_data && byte_cntr_data->thresh_val)
+			ret = tmc_read_prepare_byte_cntr(drvdata, byte_cntr_data);
+		else
+			ret = tmc_read_prepare_etr(drvdata);
 		break;
 	default:
 		ret = -EINVAL;
@@ -251,7 +266,11 @@ static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 
 static int tmc_read_unprepare(struct tmc_drvdata *drvdata)
 {
-	int ret = 0;
+	struct coresight_device *helper = coresight_get_helper(drvdata->csdev,
+						CORESIGHT_DEV_SUBTYPE_HELPER_CTCU);
+	struct ctcu_byte_cntr *byte_cntr_data = NULL;
+	struct ctcu_drvdata *ctcu_drvdata = NULL;
+	int port, ret = 0;
 
 	switch (drvdata->config_type) {
 	case TMC_CONFIG_TYPE_ETB:
@@ -259,7 +278,18 @@ static int tmc_read_unprepare(struct tmc_drvdata *drvdata)
 		ret = tmc_read_unprepare_etb(drvdata);
 		break;
 	case TMC_CONFIG_TYPE_ETR:
-		ret = tmc_read_unprepare_etr(drvdata);
+		if (helper) {
+			port = coresight_get_port_helper(drvdata->csdev, helper);
+			if (port >= 0) {
+				ctcu_drvdata = dev_get_drvdata(helper->dev.parent);
+				byte_cntr_data = &ctcu_drvdata->byte_cntr_data[port];
+			}
+		}
+
+		if (byte_cntr_data && byte_cntr_data->thresh_val)
+			ret = tmc_read_unprepare_byte_cntr(drvdata, byte_cntr_data);
+		else
+			ret = tmc_read_unprepare_etr(drvdata);
 		break;
 	default:
 		ret = -EINVAL;
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 4609df80ae38..2b73bd8074bb 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -2032,6 +2032,85 @@ int tmc_read_unprepare_etr(struct tmc_drvdata *drvdata)
 	return 0;
 }
 
+int tmc_read_prepare_byte_cntr(struct tmc_drvdata *drvdata,
+			       struct ctcu_byte_cntr *byte_cntr_data)
+{
+	unsigned long flags;
+	int ret = 0;
+
+	/* config types are set a boot time and never change */
+	if (WARN_ON_ONCE(drvdata->config_type != TMC_CONFIG_TYPE_ETR))
+		return -EINVAL;
+
+	if (coresight_get_mode(drvdata->csdev) != CS_MODE_SYSFS)
+		return -EINVAL;
+
+	/*
+	 * The threshold value must not exceed the buffer size.
+	 * A margin should be maintained between the two values to account
+	 * for the time gap between the interrupt and buffer switching.
+	 */
+	if (byte_cntr_data->thresh_val + SZ_16K >= drvdata->size) {
+		dev_err(&drvdata->csdev->dev, "The threshold value is too large\n");
+		return -EINVAL;
+	}
+
+	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+	if (byte_cntr_data->reading) {
+		ret = -EBUSY;
+		goto out_unlock;
+	}
+
+	byte_cntr_data->reading = true;
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+	/* Insert current sysfs_buf into the list */
+	ret = tmc_create_etr_buf_node(drvdata, drvdata->sysfs_buf);
+	if (!ret) {
+		/*
+		 * Add one more sysfs_buf for byte-cntr function, byte-cntr always reads
+		 * the data from the buffer which has been synced. Switch the buffer when
+		 * the used buffer is nearly full. The used buffer will be synced and made
+		 * available for reading before switch.
+		 */
+		ret = tmc_create_etr_buf_node(drvdata, NULL);
+		if (ret) {
+			dev_err(&drvdata->csdev->dev, "Failed to create etr_buf_node\n");
+			tmc_delete_etr_buf_node(drvdata);
+			byte_cntr_data->reading = false;
+			goto out;
+		}
+	}
+
+	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+	atomic_set(&byte_cntr_data->irq_cnt, 0);
+	enable_irq(byte_cntr_data->byte_cntr_irq);
+	enable_irq_wake(byte_cntr_data->byte_cntr_irq);
+	byte_cntr_data->total_size = 0;
+	byte_cntr_data->irq_num = 0;
+
+out_unlock:
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+
+out:
+	return ret;
+}
+
+int tmc_read_unprepare_byte_cntr(struct tmc_drvdata *drvdata,
+				 struct ctcu_byte_cntr *byte_cntr_data)
+{
+	struct device *dev = &drvdata->csdev->dev;
+
+	guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
+	disable_irq_wake(byte_cntr_data->byte_cntr_irq);
+	disable_irq(byte_cntr_data->byte_cntr_irq);
+	byte_cntr_data->reading = false;
+	tmc_delete_etr_buf_node(drvdata);
+	dev_dbg(dev, "send data total size:%llu bytes, irq_cnt:%d\n",
+		byte_cntr_data->total_size, byte_cntr_data->irq_num);
+
+	return 0;
+}
+
 static const char *const buf_modes_str[] = {
 	[ETR_MODE_FLAT]		= "flat",
 	[ETR_MODE_ETR_SG]	= "tmc-sg",
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index f6b05639aeca..f95df0a34ad6 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -14,6 +14,8 @@
 #include <linux/refcount.h>
 #include <linux/crc32.h>
 
+#include "coresight-ctcu.h"
+
 #define TMC_RSZ			0x004
 #define TMC_STS			0x00c
 #define TMC_RRD			0x010
@@ -357,6 +359,12 @@ extern const struct coresight_ops tmc_etr_cs_ops;
 ssize_t tmc_etr_get_sysfs_trace(struct tmc_drvdata *drvdata,
 				loff_t pos, size_t len, char **bufpp);
 
+/* Byte-cntr functions */
+int tmc_read_prepare_byte_cntr(struct tmc_drvdata *drvdata,
+			       struct ctcu_byte_cntr *byte_cntr_data);
+int tmc_read_unprepare_byte_cntr(struct tmc_drvdata *drvdata,
+				 struct ctcu_byte_cntr *byte_cntr_data);
+
 
 #define TMC_REG_PAIR(name, lo_off, hi_off)				\
 static inline u64							\
-- 
2.34.1

