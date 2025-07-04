Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2956A2D63FB
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 12:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751631164; cv=none; b=FTwknar6O+zqzPWym5bPGZvoK89vMCD1QJiyUjbF4cKm5omMZppjnGdJ4m978RFgCAyjaSNS2IaGnmyW7iCwF0qaS+A9hbBI+U2b63Lp2a5N5jMGs0ITvWIrRne6mZ1hFxsIFs4/e/n36hecNe4zVsFXRHhQ1VfuYETDaBfpJnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751631164; c=relaxed/simple;
	bh=RWcMcENuzadS5pKo+gf9BqH0aTezwUdBlEwlff9kRkM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hpUPQ3ZRw6AE3MsOM1oTyL0rZQlmELraEITKiU3pfKF9f91e+xZMg5fN77rKkPdS4bJkCBiY4LwOdR44DfTqNonskGLxMQbxTw5hLEsRarl3wLuRE25BcWqQEJo9SpYqzGgwA7pTLnm0/qS9xPVp6ouhqIfHI04SiNtMp5BbrCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vz94Nr3d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vz94Nr3d"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564B62jE019884
	for <linux-kernel@vger.kernel.org>; Fri, 4 Jul 2025 12:12:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LR3fVYUOH7o
	ec8B/p5wHCcMyr6Oxyk+LtpFmeCILY0Q=; b=Vz94Nr3dXhZ1V0u1N7LN6CBomqh
	tKLc7oBFCZspB4OUD0OC5iWwTtd+Fxy4mEr4niwdvKy0wjx/03v0Vnv0aNvHdVsT
	hgmzK6LUZ8pEnLVl0+5L0vVtFjXvnqEUwhXoUkmjSw0j/KOysR77VE0JsbNpOyrm
	SRuneknDB8ZpcCkxcHHDod1Ypdvl3pk4BlB718HEgGWy/PZ1Syh+3StyLVL0yWx4
	lMaNB0uzF4m4DZcQiYGqH0gW9O6epq5kClgztOwUeY1IHkRQDR1RauzNCZkoCqHH
	WQ5KoZ7770HS2lBOu9QT9SYw2qXK7GZBvtUE7HU0/tDmqMUibPocwb9sujw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pdsh86ej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 12:12:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c760637fe5so124120185a.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 05:12:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751631160; x=1752235960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LR3fVYUOH7oec8B/p5wHCcMyr6Oxyk+LtpFmeCILY0Q=;
        b=ao+oPweAhObHdjy9cKXW9gVlimIvHh2xcIp/xbPMwE1wPqw1orb+Qqqi2gZmCDJrMi
         BlRLPrTj0tgzhacjT3yeM1DTdGhaIhSmai2vtRkGbiOMdWVyF7NSrFzJxk7V6hkQKPYK
         41Kv+oy6rIxsdmBLBVjKBqHfkrA33N4jj6l2ri3nsxI8OF12mPbUZc+xACcSo5Y1wlpV
         yoKt4e09hDjDuh8NOO/EefrSzkH47I/aaxCKQLPa4ReRQQbpY1fDXtQRO6SVyQgqbOIN
         c/1EFyMn2JghOITV3+NauYZF5Vc7BFm5r+X+xpIjUI5Z9gd7pDHa3YJQvcuYgM3K2Upd
         VcDg==
X-Forwarded-Encrypted: i=1; AJvYcCX60DPJrb1vxcg9B1vHCIo4fzvZlw7uXG1Edp3MiG1kxke8fQYNCQ2drQdjWF4FEe7znWnfe3XMPgx9EwY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRdZQ6/cmf/SN6867LmT3ASaOYAXvP+lQly0Sm01bU8i0hcyOY
	jOnRzkeK/gl/IGFEE//uCzVemBvBEUDoVVVlk3MWXlYd9Mj+8AeXI6MX/zzNPpkdFDr7D33LLQs
	FRNPVc0L2Fn82teY6tkN0dM2D0ItoBBgQS90ioiX31gSvWgsHcl0gT5irc9cXtFFItSU=
X-Gm-Gg: ASbGncsZ63m9XMjHAH6SXw+AjzbxnDGIzJXanC6HA0II45lDIyC1u21lG+rgXTLvmg+
	nq8Qvp/GE2U/I78Ceea4G/qyaSPR3ff9fT7M/ofB418Y4sEPE7vExA27tMF4ij9hoeW+GZlnZ4A
	hFDi6fgu+AE/AEF5SsEf1PBUAY8xCf+g77oNfYpB4L6SSdx+NSIRdDIVLDhzCqA6GlO1RngSzTa
	W2K1GtAHbq0TRMTB2IqhVjGXYwhLoQSkeDiziKHFw+q9m+9isGqwbhYoDEfSHr/RuvqjzkcKIjY
	vLEnZVmw4oewq4NUy62iBNorIH3vZTNYEh8KUEv7pPyQ9eTjoIc2vjI=
X-Received: by 2002:a05:620a:1924:b0:7d0:9c51:498a with SMTP id af79cd13be357-7d5ddb56b75mr297332185a.13.1751631160162;
        Fri, 04 Jul 2025 05:12:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzjkILAwypMIZUshaZVGJonIlhgRWDFAm9d5sNhdyHQ5r3X/FUqOT+lCNh7XuKnxet9HlSNA==
X-Received: by 2002:a05:620a:1924:b0:7d0:9c51:498a with SMTP id af79cd13be357-7d5ddb56b75mr297329385a.13.1751631159751;
        Fri, 04 Jul 2025 05:12:39 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a997de2asm53656745e9.12.2025.07.04.05.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 05:12:38 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: vkoul@kernel.org, broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        krzysztof.kozlowski@linaro.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 2/4] soundwire: bus: add sdw_slave_get_current_bank helper
Date: Fri,  4 Jul 2025 13:12:16 +0100
Message-ID: <20250704121218.1225806-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250704121218.1225806-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250704121218.1225806-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA5MyBTYWx0ZWRfX4ic9ZbrVD/Np
 gvlydNZL6I3Npf3pNjk/U7f1SWJporyoCaIG2HfSGfXtXwfPVOuILXmR5jlzPsYL+ceCZshlhW5
 vB91JLWk4prQjv8VExPzVC8EPR13mfuixtPFfZTT3rqiiGy/LiYfrQ4aMF+3o8oOymTuYMgYU9U
 MoXHXYi9Ii0B65o3oGvwU+m4ff0/5vLVc5Vx5nzsIB5qvxPU6S2rL5Q8UVEknMSeDdBNEB/LZAM
 Ut7w8NTuyPbZK2pYvDHWUYCTj0CxqO+cgFycm5VpJBrTY98OiL64sKSkxfVOa93gjEDUTCaUOXr
 SI84k0f1kEF/ByM8NgsHI8fPdgTpwUZ8Xj8lzrhciCkoI6eFInclqKMA6A0W6eUhLqKrvshV+JR
 Shys+Kl/I2ri9oSJg8hnzA6Tn7T4my2PGS58rgccrPrHxaSdKkWJ1pik0mxVeszFM/PVNccC
X-Authority-Analysis: v=2.4 cv=RJKzH5i+ c=1 sm=1 tr=0 ts=6867c539 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=G7Fn18kybrAXfbFeA2QA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: Ki0gdxZZ4vOozAF1KXsIWpdXvDB6_nxc
X-Proofpoint-GUID: Ki0gdxZZ4vOozAF1KXsIWpdXvDB6_nxc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_04,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 mlxlogscore=857 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 mlxscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040093

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

There has been 2 instances of this helper in codec drivers,
it does not make sense to keep duplicating this part of code.

Lets add a helper sdw_get_current_bank() for codec drivers to use it.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/soundwire/bus.c       | 12 ++++++++++++
 include/linux/soundwire/sdw.h |  8 ++++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 4fd5cac799c5..55c1db816534 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -1360,6 +1360,18 @@ int sdw_slave_get_scale_index(struct sdw_slave *slave, u8 *base)
 }
 EXPORT_SYMBOL(sdw_slave_get_scale_index);
 
+int sdw_slave_get_current_bank(struct sdw_slave *slave)
+{
+	int tmp;
+
+	tmp = sdw_read(slave, SDW_SCP_CTRL);
+	if (tmp < 0)
+		return tmp;
+
+	return FIELD_GET(SDW_SCP_STAT_CURR_BANK, tmp);
+}
+EXPORT_SYMBOL_GPL(sdw_slave_get_current_bank);
+
 static int sdw_slave_set_frequency(struct sdw_slave *slave)
 {
 	int scale_index;
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 096213956d31..e6a3476bcef1 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -1089,6 +1089,8 @@ int sdw_stream_remove_slave(struct sdw_slave *slave,
 
 struct device *of_sdw_find_device_by_node(struct device_node *np);
 
+int sdw_slave_get_current_bank(struct sdw_slave *sdev);
+
 int sdw_slave_get_scale_index(struct sdw_slave *slave, u8 *base);
 
 /* messaging and data APIs */
@@ -1128,6 +1130,12 @@ static inline struct device *of_sdw_find_device_by_node(struct device_node *np)
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

