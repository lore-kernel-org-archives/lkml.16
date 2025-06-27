Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4C82EA146
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 15:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751039502; cv=none; b=M3PME0/KZRagcLut4YRj8BUuxnuA1MfNj5Br+TDHUDbyyX6ZwxySNWpIH6G+t9qPn3JciI4VAmzYZ6sdI9ZwH6p+rwgq4lgZJBvmWyHHJs5MU7ITjDqbVkAcnX7NU/iZXfQCpb3igOUYTJ+Ylng96J5JV2jNpras+ICC7yxAtcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751039502; c=relaxed/simple;
	bh=lKyVz1aHAtW5wZADQysDpTlDrcMAjTf3GNRnaui/Uzw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EoSWJH6x3KCbLej9qGpj5nbVPQkiSmV/HNlTFXAKa34a3yZi34zdUo88pi3cmshPt0RlU/DIMOHJI5JbtgwLtx09XeHqVGI8BvP+XF4j7SliVWSL0TC7/DeHk/Nd6e/tVHGw9/jCqeDgsodWq1tZDFniZAXjRV5I23JlN/plCI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XQUM1MSN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XQUM1MSN"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RBN6NQ006933
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 15:51:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LDHorwnuAdX
	V1WbIuhFcYVwPnTn751yCNIEq0iuBI3w=; b=XQUM1MSNcSUVDOdyhjEOYFtATz4
	PVg8jbT9EmvF+xq1+1abSYZLaK8H2WKVH8kfYIL3viNpQDZvM1Sj9DS77xQPy0ch
	axMakC6PDBd6lckDTrXFXmetO/n9CbD0v5IN77eJgZ2xXpT1iRo6q9rCtnEGpH9l
	IvYn7LGdSPNjVd1RgwoOM93YWi+xUkEHiJV11tghB5+QzX7PJPtbHysRu7yrOqGS
	TfzGb0O7v4je7YpgN9hEzhhhzpG9wGiGJoH0LWDK25AW/Fw7akBAcQQZesSNH8BF
	UaFSMoUpwiLLVGZsH09fYvA7glq8BKqydlGlozgsSnA/jCVXGcqtcKbxT4A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc60he7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 15:51:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d413a10b4cso377961085a.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 08:51:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751039498; x=1751644298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LDHorwnuAdXV1WbIuhFcYVwPnTn751yCNIEq0iuBI3w=;
        b=dhSf0xL5ILFct9RmW6wlJKpfa1q90+yy8CB7l8+cqAA9+/QbBsVvTzeNOfi77zTO0/
         2F4+kaNnfg3gtMYi6MdXy1Bs1perzPU8G5D7YGsDPp8efS+JTKU+CaJxtaAZjNVo4RA4
         uJv72qlvR3OblqWhHaXAIezsKDM5I2ZNGoZ3Qx97ukpYMocUgRJkyca77sfmgP/Gnc/L
         4Gf5TyeF5Eb7pP2AymxiK40+bd9e5P61BB4h1O8R8kooTDkP3LRWHgjxVOkk9+ZSLPsw
         qvnj3Hzyhp3yxG11+Yz4iNRPr05insfSHZuKvDAuNHmdZcigiKnjAxguEVbaJwBoeBRJ
         9+WQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNwadCwr2/Usm6HPRYpHwN1qBuLaYgzmT8X/w0kGUY7hJVASBKdQ+0EWN2IYcSKQNVqWIGZ9z/yGpcROo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjw1b5qLhM+8h+9Q6IKEa7uKyEYso6yl244oDHPPoK13w1CgNn
	manOJb5OPbreLlljrbk2dU28QCkX8WnqUwoxOAC08eEGL1TwQMjVJTF384D3vFXDdM2KCRPlLfL
	p6bTLBTelEFytK9dQjFAJh6rBJRKxHDS7h+5KtQd7xoGEw2hRKlPS1npjXm7tWSAesREixHTCTW
	s=
X-Gm-Gg: ASbGnctDTzfPLNc3pdatb6VClCvWHFCZv5F7TipQC/2kpcia5/m8vZvQZIA14Y/fSyP
	Wyd5sJKmqyTpvAvsPgkalL33NCTjGZPUyRyPIXx8T1euSlaVGvQkCuafW7k+EVz2rQKWaNmkyRm
	KLUXZ3TU4DcOMx5Py1N33FiV/Syh1QUCsYdXkNqo0/SiejSmHrjC9z8GxeGqRsElRd95gdBmKrW
	rhmM+7EJce/iKsfLgcWVMcJmopaE0JiMFaMyAP9Eacgg1VFrLQg0ODFjedpHLLwsw/aFSMW0Ndq
	FfCU1uO+Kf61KRPG37p9d/Qw4tKPa6Y69/VWNljtqoWo7+uQo0twf6M=
X-Received: by 2002:a05:620a:4484:b0:7d3:99d9:3da with SMTP id af79cd13be357-7d443988ef3mr526646085a.38.1751039497963;
        Fri, 27 Jun 2025 08:51:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJkxph6O/jbArRyCSDoDEI4L1/ZQJj4wRXUA2X3/E8kJSQIhQWta3eDD7mnBbK8obJSzGztw==
X-Received: by 2002:a05:620a:4484:b0:7d3:99d9:3da with SMTP id af79cd13be357-7d443988ef3mr526641485a.38.1751039497535;
        Fri, 27 Jun 2025 08:51:37 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e5f8absm3082663f8f.95.2025.06.27.08.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 08:51:37 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: vkoul@kernel.org, broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        krzysztof.kozlowski@linaro.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 2/4] soundwire: bus: add sdw_slave_get_current_bank helper
Date: Fri, 27 Jun 2025 16:51:01 +0100
Message-ID: <20250627155103.441547-3-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: blKXkDg9HqhKUHYSE8CpbQpYbxEmLG0Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEyOSBTYWx0ZWRfX9vcNP91r+/0y
 3V21pCvLWLP2jNXHsP6TVQudwDXMWwFgtJDAjzWDcmVY2/4vNb8dz3LLrW0LyRua2sbPGZnGWpL
 4Wen4I9bTHAU1aopqwZYvINGPCSEY8XlYG0PdbVYm79dRjD1NIc9ari/v/ieypO9zicOo2Li5RW
 BOLYYsQtktxLMZ93gcOWapwluYy25KGse588rryJUmanHejVggbLezSFhRWIHN2ivvtDVEkwrje
 NOwht9WMq1mcAwD9oNM7PhiEz+x+iuZIKSF3UH77pYtHUiftOCuXWjCzLy8ZQOcEAWs9P61gi/f
 jT5MZc0Z/ok5kooohn8sYo0rXHxw8dB0ggqQGqwbq8vX1TTDSNDhzpljE2UkZmKEBg56HG1Z9nM
 btEI5Z5+aygMiSZhubWqa9+ph9z/4/1UfGROxpwPq1p+f1KNv073emU25V7v/EQgs6J8A6jI
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=685ebe0b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=G7Fn18kybrAXfbFeA2QA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: blKXkDg9HqhKUHYSE8CpbQpYbxEmLG0Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=860 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270129

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

There has been 2 instances of this helper in codec drivers,
it does not make sense to keep duplicating this part of code.

Lets add a helper sdw_get_current_bank() for codec drivers to use it.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/soundwire/bus.c       | 7 +++++++
 include/linux/soundwire/sdw.h | 8 ++++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 39aecd34c641..58306c515ccc 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -1363,6 +1363,13 @@ int sdw_slave_get_scale_index(struct sdw_slave *slave, u8 *base)
 }
 EXPORT_SYMBOL(sdw_slave_get_scale_index);
 
+int sdw_slave_get_current_bank(struct sdw_slave *sdev)
+{
+	return FIELD_GET(SDW_SCP_STAT_CURR_BANK,
+			 sdw_read(sdev, SDW_SCP_CTRL));
+}
+EXPORT_SYMBOL_GPL(sdw_slave_get_current_bank);
+
 static int sdw_slave_set_frequency(struct sdw_slave *slave)
 {
 	int scale_index;
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 84d1a101b155..41c36470ad2d 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -1083,6 +1083,8 @@ int sdw_stream_remove_slave(struct sdw_slave *slave,
 
 struct device *of_sdw_find_device_by_node(struct device_node *np);
 
+int sdw_slave_get_current_bank(struct sdw_slave *sdev);
+
 int sdw_slave_get_scale_index(struct sdw_slave *slave, u8 *base);
 
 /* messaging and data APIs */
@@ -1122,6 +1124,12 @@ static inline struct device *of_sdw_find_device_by_node(struct device_node *np)
 	return NULL;
 }
 
+static inline int sdw_slave_get_current_bank(struct sdw_slave *sdev)
+{
+	WARN_ONCE(1, "SoundWire API is disabled");
+	return -EINVAL;
+}
+
 /* messaging and data APIs */
 static inline int sdw_read(struct sdw_slave *slave, u32 addr)
 {
-- 
2.49.0

