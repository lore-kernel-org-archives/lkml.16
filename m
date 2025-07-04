Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DF52D5C9A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 12:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751631163; cv=none; b=mcnLXsVbt8fTj/HUwBtucQI/D8Tzj7dGTGPLEdevYsTAalaf1SgryK5wpHT6OywZMPxQ/NadH1tjP3SH55BeF8Ehrrk3uILd2DyT1Skc5WdpfPC2eIjKDVSarsE5ksr/KzFP1mAnWFXNjFi0zUcFG/8v8uYmLfr7DBxq4JvdJnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751631163; c=relaxed/simple;
	bh=igUBUA3n5sE+ryV+TCZZwRELbUlpziFktMSLAQRL8mk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rST72SvFajMeqzoEGf4gsqk0tkEyjhPUotXqzJRAyCJqAodbOcxjtDVVbERb+4lLr9yjcwaD5hciUcBhWybhRIuiMO3aSjPyb0JgRSlEqMHNdvyOHkpXxi8E14go/0MNOS16gvt3J+8PyqcRD+KoBDNbEVMyjVKX0xvn37AU4bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IiUjkkFQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IiUjkkFQ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5645Xbs7008178
	for <linux-kernel@vger.kernel.org>; Fri, 4 Jul 2025 12:12:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0K4IH8rL5ak
	/hBH86TtBACFo7QeNlxuqdpxZlK2scYg=; b=IiUjkkFQgodIVtw/lCHAUsfEELB
	XtpPnMImlbQrzO6wMIRpNy2bWOJDWzM+F3rjZvnKu2BrvI2BxVnKS3kA5Z7lyzj0
	m9+NguEBNyccQXOS+fATth19b36OmCDsHTniQ1QSl4KAJ/SxXbp8Z17u+vELxXxL
	/Y6f2lr2DVPo5X34r/ua9VAPk3e1eyx+zOo3CaoNtg4VnMb77vudCaByUMJO7ryr
	wMTJax5apUhXVmIbBmmUgQkW3GGN79Th4R8uZkRZZN8jA5bHUW7O5doimLKkTS5V
	rAFL8vHyQ+dC6QKxi9KhG143Sa3HGnMLGxGByAumEjZQltwJQjmydbb4yqA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxuyfe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 12:12:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d3d3f64739so209069585a.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 05:12:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751631158; x=1752235958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0K4IH8rL5ak/hBH86TtBACFo7QeNlxuqdpxZlK2scYg=;
        b=H7TOONUoDKiFksL4Dz0twzY2odQ08mGctNCDIZkDwrGWuyoTrayeZrqwS8HDWsFL6Y
         btn/UPEctm3+kUwy7LctHy/BDmeE/dZjoV6ErdBB1ihDDdiFh7HngPVPQLGod6JondV8
         M3NXTumkDAqEKBGeDV7W2/gahUkfLqRZcIci3eQapQodbJIT4llz2wAJ6t4cJ5zq5zD7
         ofstXhMHj0Zj6AY2QRUohqLloT5PNiZ3Qz7f3x6uE+coDRHWIdAKV5N1f+dz1uNM6PBc
         eaAEXesJ/UAf8wMRS+sfqF0Rs+kP+r1jfDgwVX7kNsdnuAAz3mEDOHWQ1tiTVtNy8WDN
         UeTw==
X-Forwarded-Encrypted: i=1; AJvYcCV1pFHN5rPJWnMUz933pJFdSa1pIBsHBjajzwlIQWOXahcH/Zkg80Biz0laXA8CL8QBX3tRdz+VBpUElgE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxQ4OzyhJIuICMYiBzZkdaq4WwVm/OfOC3ZqsVKonK+TzzKPzi
	dpU5LyqdXdSqacQXhr2D8XKC0ucRQfDXUrMV8VRbEuEsEK5YsKDRhjnDOk9AeHduV2ITXup2MKC
	7K0uRb2l1XTZbvfvUSqZ2VYaet/rN/HnIgivILKD0SVT3m+ndxIh3jPdhhgn9ptzhkws=
X-Gm-Gg: ASbGnctNdhorluF5sjRCYP82ln7Q9dmf2GwFypauals2pSJOVaBr6kguuwRXtQlnGVz
	01VVaWiw0T+X96kySrAH6AFb2iiODVbMUA7kmIomFQ6mUy09evJ6XRYG9CYgm2yhdlqm6UOyRid
	hp1aR/CjAzQW3d8oMTXrsnQOlmSetG7uUSPP0WI2onoFZIBkT/YYqtEmOYY2rspXQkOSK3omuas
	HfFWq0E/iHGrKDAvT3BZF8/dIGo9ZiUAmNZfrxzamzkTt0ecpv8PaMWvi9DpwEcYxnBkIMEWPgA
	KwjhrsyEihgb5ChIM2mzlA1KS0RWrl8B3tySwzApcyagiFCAudSOMRs=
X-Received: by 2002:a05:620a:4044:b0:7cd:5ac0:4f19 with SMTP id af79cd13be357-7d5dcc7292cmr417935485a.13.1751631158441;
        Fri, 04 Jul 2025 05:12:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzCVWXAr6d378Rr/J/MsgHEPTEJ5PePBTQUBZb3QybPZwAeJx5Z9ygLeYof7Xrb9p9N0p3hA==
X-Received: by 2002:a05:620a:4044:b0:7cd:5ac0:4f19 with SMTP id af79cd13be357-7d5dcc7292cmr417931485a.13.1751631157858;
        Fri, 04 Jul 2025 05:12:37 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a997de2asm53656745e9.12.2025.07.04.05.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 05:12:37 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: vkoul@kernel.org, broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        krzysztof.kozlowski@linaro.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 1/4] soundwire: bus: add of_sdw_find_device_by_node helper
Date: Fri,  4 Jul 2025 13:12:15 +0100
Message-ID: <20250704121218.1225806-2-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA5MyBTYWx0ZWRfX6hEy53GY+EeB
 DuSJShXMLlA3z0AT/ZtUtU0KjAum1bL0H8hETEFGeig7CZuFiRvvKu245RloImN5MM5/wKP+T3f
 eABLh9bzobBR6n+fwHn4otszCoug06xu8e7fgcVXxyM6IC5FR67jx+509k/uqMe9MyOU2Bl8Tpa
 ig4B5loLR/i7Ma/YldSnnhBgjqr/D0eydqbrbNRHQ4vSt0buz2eGOfBR7FUFi0dL/+ppo9S0SU7
 Aj6hHOzdRrrrcV/UJk/I6eKgGvMZHUKmjTtCOmwuOYy0kPdWIaQNEyyEmQMPAdPNi2Ux7QLxvIL
 nROSD1HDJpTGZYS/cM0BT0Mc9RMFMiMqBPoIxapAu7qFIEPO60WDyl2hyQnAHcAScep61NwVD3W
 AImIGxHQPp0ms8qJhZR4BydetdBat8uMW8JMzh5AQsNovtCLZzf6xREJc0fikIIaRvDpQ+Kv
X-Proofpoint-GUID: 7g6mYhD9WAxinLFuTDUZbKjPhoVTjE6R
X-Proofpoint-ORIG-GUID: 7g6mYhD9WAxinLFuTDUZbKjPhoVTjE6R
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=6867c537 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Ogeiovxhkh_6Bnox_XcA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_04,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=923 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040093

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

There has been more than 3 instances of this helper in multiple codec
drivers, it does not make sense to keep duplicating this part of code.

Lets add a helper of_sdw_find_device_by_node for codec drivers to use it.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
index 0832776262ac..096213956d31 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -19,6 +19,7 @@
 
 struct dentry;
 struct fwnode_handle;
+struct device_node;
 
 struct sdw_bus;
 struct sdw_slave;
@@ -1086,6 +1087,8 @@ int sdw_stream_add_slave(struct sdw_slave *slave,
 int sdw_stream_remove_slave(struct sdw_slave *slave,
 			    struct sdw_stream_runtime *stream);
 
+struct device *of_sdw_find_device_by_node(struct device_node *np);
+
 int sdw_slave_get_scale_index(struct sdw_slave *slave, u8 *base);
 
 /* messaging and data APIs */
@@ -1119,6 +1122,12 @@ static inline int sdw_stream_remove_slave(struct sdw_slave *slave,
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

