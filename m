Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498072E9EBE
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 15:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751039500; cv=none; b=M5QMLm/32BgkS01SKzivWGcmXmA0QEYvblMQhNZ6QvzU97ZCxpXdH/0cDVpDQOY68i581OW+83E7mph/zJaRG1pFaNJH1LVNEiB8r+LNiTpg+peZ7HwAqJO7u5D+yzWETLEli4Lw9Q4w7c8EYoTPd05LtUNztHNzeiCrPLtJ01w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751039500; c=relaxed/simple;
	bh=kosxl35EfEgbTnzpOOdVO7IGdUHdh5M6/Ni0KGZQblQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L5T72NBlCJrQ/LiN91uA1Tz6JTTfJhBbcO38F0sG8Ws/FKmmBEaSSCjqzYh1cVLwVH520n60cPs0VBvEHLcXIY1wDDkD/Pv0l+1PhKE/WUtvrCL8M6gF4glxfuBEJcbTvSLDJeISnAL4v03RAWYNuvmSx3X/rpnVSS6zv2mEi80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TxdfPwmc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TxdfPwmc"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCCU0l029118
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 15:51:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0/WQwutoxYF
	O60eUV5V7tAQwlc8UzZ0qXtK/lPMjb1E=; b=TxdfPwmcnWw/3KBcJ/6KY8ZcXzh
	10IxG+WOLWpnKepIgEuk6sip9xJgq5nJiCblOAE2ADmArTm76cvyvAl2Ah8qqd4m
	f7ErYgCv2YGEWmheY4cParD9AEglwY386lfrSN3vI/cNzV0Z32bX0WjeasdbX44f
	62YbIra1AzJcuqYxBMsUGXYCYjZMNqcaDJemyxjUDWWILVZbyP7XxYO4tJa8BSQg
	zwfR4MBrrw3E7dLiiaBcT2yLONQZFk5YzFzXmlwy2e+LE70dliDR1cGlL8h/3R5s
	smFXxsV4T82+Q3b82VVk87ISN6EtOGShoEei+vlzFlezujoj+5oF17p5I7g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47hkpbj1vn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 15:51:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d15c975968so389362085a.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 08:51:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751039497; x=1751644297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0/WQwutoxYFO60eUV5V7tAQwlc8UzZ0qXtK/lPMjb1E=;
        b=eBCSUujHbY4H3Jp4mSmwaEAvZuJRb751Iv9t29C/Vt0b3XbwQr1JOq6p2Uood2Kmmx
         78XHLExUEXrH8O7qqXblhjlvnhH+K1lhgugzV9HiB5alf9hV3I9ulOdHjDe/vBJtnPKm
         lzKl9+w5DKs2BMx52hiHaUSM5gZcyYMm57tzBhIcVeojStBjoU4UXCBjoU5U77Jr1teu
         eJZGq/NEXIft3+chBCkMvQNFkHkOWmAtiC4zlcVnHZhIT1esypKDq0IYveEAegd+Lm7j
         75B18eMPwUNFL9N9ledA/+4NtAAFkbDwu4QmNf76Q0q6d+CRDKriP7sqwR6eLXwnVl5y
         UrJQ==
X-Forwarded-Encrypted: i=1; AJvYcCU02ybxAp7YhmIERPD6G8dh7hPyjrZcZDgnOQUL0WkGou8EK2nZQpw2wuiKZGj4Oo3EJ73UEOWfvFl+LUo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7OUrfdU/Se8FVWMNYFSLE43pbVGMiBMw+1VgSodAtPFLt5rau
	nLFMXsLPRLav3PNeUIHr9xqfWt3jpWMYrDKNrWqhIitLaM3fMf5AewpwrwRqh2EwxxaPfoCy6Eo
	45dk4wOtYdxOueaT7sausE5fvctpOfhEHRHbvKawwf5W16XRux+d6P7vo+GyDm7FHHNg=
X-Gm-Gg: ASbGnctPXav6bNxk0whDnpKGZH4T7TC5hzyFQ3cMYWOnXKoYZBrqre5wSW4N7ZxNqe6
	LoQnWthAsM3yZOzvIh2vVz/oy/Cu59PW7HcaFAuZmF5OGB531o3372PZjQTbY7y40idzwQvKsCF
	Ldy+o5E1nrHA7IaxaXYUvVYkaKCKbp/btvRcPNo92YKIRw0QYbJCPyrrOhx1p7KTs85Kv6UWHOy
	S+AVw4hJS9nfXhH6DI4/cfz+XAuFXAew/OivEbCb1R9Qtv2yRE7pMjR4ZwZCQKvQzU73pj8Inys
	ftTGsoPCgORDGFJjW5I/1AZb0UxzDpcIBynQActpQ4otDJsoyH5ME54=
X-Received: by 2002:a05:620a:6588:b0:7c5:9a6c:b7d3 with SMTP id af79cd13be357-7d4439ae47fmr345772885a.37.1751039497155;
        Fri, 27 Jun 2025 08:51:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfa8s9Y0FwOhSzbrQ5pjE93rOdbio/0YW5+sByFJBn5oLIzV0LRQoYDm5jLeIJKqi4k62MAw==
X-Received: by 2002:a05:620a:6588:b0:7c5:9a6c:b7d3 with SMTP id af79cd13be357-7d4439ae47fmr345770085a.37.1751039496536;
        Fri, 27 Jun 2025 08:51:36 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e5f8absm3082663f8f.95.2025.06.27.08.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 08:51:36 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: vkoul@kernel.org, broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        krzysztof.kozlowski@linaro.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 1/4] soundwire: bus: add of_sdw_find_device_by_node helper
Date: Fri, 27 Jun 2025 16:51:00 +0100
Message-ID: <20250627155103.441547-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250627155103.441547-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250627155103.441547-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEyOSBTYWx0ZWRfX2ZQcnOATahUN
 KcnLr0SIMMk0WDdzpCpT0Kh2cYtbH1hSSJ/+jJJuxUV+wELFO/yIQXPs4ZXcFEd9LdzYIF/YcON
 np2Egf3MCYQ9JHmtmDLUPwmq/WKygv5gqFpkgojdFanL5SMwYncQZx9xqP2oz4sPERu+v8UhMeU
 NIhAXzBCjph95gVgwB62wDZSW39NM5SnVTiXGbGe/7JEZ7tYnRLoRnqe7C5kvy3J8OFHQCSl8V1
 B4xmpVca8XrXHOmhxvHdxFS2ZATXwUB5M3GEtwI7PVjJHNon0Hbfah+ITPmOy6vFk4phsMk9rIB
 vzrCy1ShCwUiSdbJDIazwbGzDX2gtwFr/DZNHpik/6KMjSgfzHo6+Wtvegn4z3T8s5kDpv/XKlj
 +CHi8SjcUd1+vRLXamOK4BXp7F7V3RCVqQXgYfKbMlRxAxbtd3qSHXBmkEcKf+jjsjnLAv92
X-Proofpoint-GUID: vXbdJnG4n0_SVFZ_0On3Hg9QdHVVroQv
X-Authority-Analysis: v=2.4 cv=AY2xH2XG c=1 sm=1 tr=0 ts=685ebe0a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=bs95RrtT4r1_5-ck8vEA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: vXbdJnG4n0_SVFZ_0On3Hg9QdHVVroQv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=919 phishscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 adultscore=0 impostorscore=0
 clxscore=1015 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270129

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

There has been more than 3 instances of this helper in multiple codec
drivers, it does not make sense to keep duplicating this part of code.

Lets add a helper of_sdw_find_device_by_node for codec drivers to use it.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/soundwire/slave.c     | 6 ++++++
 include/linux/soundwire/sdw.h | 9 +++++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
index d2d99555ec5a..3d4d00188c26 100644
--- a/drivers/soundwire/slave.c
+++ b/drivers/soundwire/slave.c
@@ -273,4 +273,10 @@ int sdw_of_find_slaves(struct sdw_bus *bus)
 	return 0;
 }
 
+struct device *of_sdw_find_device_by_node(struct device_node *np)
+{
+	return bus_find_device_by_of_node(&sdw_bus_type, np);
+}
+EXPORT_SYMBOL_GPL(of_sdw_find_device_by_node);
+
 MODULE_IMPORT_NS("SND_SOC_SDCA");
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 2362f621d94c..84d1a101b155 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -18,6 +18,7 @@
 
 struct dentry;
 struct fwnode_handle;
+struct device_node;
 
 struct sdw_bus;
 struct sdw_slave;
@@ -1080,6 +1081,8 @@ int sdw_stream_add_slave(struct sdw_slave *slave,
 int sdw_stream_remove_slave(struct sdw_slave *slave,
 			    struct sdw_stream_runtime *stream);
 
+struct device *of_sdw_find_device_by_node(struct device_node *np);
+
 int sdw_slave_get_scale_index(struct sdw_slave *slave, u8 *base);
 
 /* messaging and data APIs */
@@ -1113,6 +1116,12 @@ static inline int sdw_stream_remove_slave(struct sdw_slave *slave,
 	return -EINVAL;
 }
 
+static inline struct device *of_sdw_find_device_by_node(struct device_node *np)
+{
+	WARN_ONCE(1, "SoundWire API is disabled");
+	return NULL;
+}
+
 /* messaging and data APIs */
 static inline int sdw_read(struct sdw_slave *slave, u32 addr)
 {
-- 
2.49.0

