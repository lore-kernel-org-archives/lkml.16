Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201F52D05E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 01:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743471743; cv=none; b=GGI4VhkreT/r5y6UP/xl3uC9fRsqEgBl8xImzWm0VdUqX3GC5hzmO2ablEZibSxXw1dm0LjIZLOo7DY34wAESNSavMJ15br6SN3rPNQhmmBYtcmLqrgHU8/rHTKD8jJcO75PBteQZ8+KpDK1fQ+wYPFykgMOPm6R8i1nfpHJeYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743471743; c=relaxed/simple;
	bh=LgAgkR9JX+LzMJK56/SfcYwiPWFfGWJah1IzcNJ7x4c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cbF8QaSxS7JxpQwTbNunWg+uhIdJwafSyB2SS8sWkBnY54cAESMokuFSlcA8PhW0Le6Co5ui7+gAS1bXBjYnx3uGgySHpDePh+G9VWbC6b90ETiuYiY5Omk2NQojBsQTxMpubm1E7i6keDD2z+kvGrJzMtbU8T5nqw9eAIOT9oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YX4Cet3J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YX4Cet3J"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52VG8Fsn031690
	for <linux-kernel@vger.kernel.org>; Tue, 1 Apr 2025 01:42:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=tQNRCYHU/5P2PfWYw9DTAN2O1KOVrz4anhz
	8ncma5w0=; b=YX4Cet3JYUf2Ih40V3PneXIZvWvQlf6S7Bc7u2hJHvH0GWzp7xV
	u+qwDYCphHhDa++A+YDuzntCM8hIVncD0Lq9At3XrYcaKVKgiq1T0CuT8pmy8SES
	e/54+r8KQiXqLH+itC44KnS/kCtUwrh/ZKOwrx4dVtb3AZJVYu6XAANvfmXiDklU
	nnwuVRUlj04LgX1cV6Soa6IrJByJ//atKvpTdxouUe3nQd7HuYiaiBYiYSeU/9IO
	S1xZoKFoeYPpW2+GKrCq86e2E0+02fPHHDbbb5cvHqYOiLJk3svdBBwZr1JHp6D0
	1ZoyprqR1omSE0TdK8lVtvnezVb6vo1TZTA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45qxa7s46c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 01:42:19 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-224191d9228so115266365ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 18:42:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743471738; x=1744076538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tQNRCYHU/5P2PfWYw9DTAN2O1KOVrz4anhz8ncma5w0=;
        b=A/doKHgGwxT/JtGxKsZPzGpFBmcz5JgmyXoKbdoRCrI68rYad+YRDL/cPhHzkBO+Ig
         Zhi32xv0JVrC/V43vPknbGiyPkWg04vCzebDpOZ0kHUTyAXyY1ZMg8zPPySqPo4Us8Pf
         6JEz/Zi8XQjN6+dSQ4BzxtylKRcVlmddUyngTlMhHvdNQlV+pYk98q2SnGaj6N7prOEU
         gEP7k4eLHDYzrAtpE+w4s2lwHsC73MlqpGqJ1gEe60qD5Fv8S5lg8nO3h0Gam9o0NTkk
         DkDyTNFDBkX6wzgds5rHZmMDXUCtwR5yGHkd++eg7Zoaw4Evr8fgpfKVfEF6EYTqRCl0
         2ILg==
X-Forwarded-Encrypted: i=1; AJvYcCUHsVs4fLB6KqoD2jxG21Fn2r4sH9YhVFeMnlM9+GiZbnR0JOU6dMpuQJqRTpAZmwwv+gOPK0ALq2A+uUY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyahuQmIdSNKEXCc0wZEnyibNIGXHW1mcAOh3YZdi6yp4c0odnn
	XBcYq9GEm+jqudKWMro5JRY5gThAEpd9ui4p9loY3HjxBoP93K8ALwdNYhDbhzEw9ihdm6pxkcl
	sZh2OTpaYFYR/0gwf/evUAoY7agIHrHB+TPigxhxnaQE6CLQeKty0PDfQHSm9X/w4ugzBAjo=
X-Gm-Gg: ASbGncvO5jzAsvWjoXlEFBeZBczrHcnljya/ZEUjAdUfcz5fRgyD6KNYB5gW4IZ5ehI
	svuwM9xo7q8e2+uZqCPfIo6H56Hj0SyaPAWoz6zBzG5LJ1qIKKHBI5zJEqrOotbC9CVmi4afctJ
	FzHMhb2/jdhAFFqZ85NOdoVWbO9YXUCi1Lr1vmiaon2ZpKY5+gT1X9Z9l7lit5A/ELmyi3FWx/J
	vskKa6skTsaCKUGBrKOTfAEWmeJtnRnBg6AFfvIKDXG40V8kMiytA/X1KZKa0wTQub/cFyI+8r8
	VyOhOoUGIu7HEj/6Wqn5d0v7Y6cgR1kh3kIEoM7zzD1G3adBmCrPGzmq+27V8C4WonJrhQnDONI
	=
X-Received: by 2002:a17:902:e74e:b0:224:376:7a21 with SMTP id d9443c01a7336-2292f9fa2d8mr186446255ad.42.1743471738158;
        Mon, 31 Mar 2025 18:42:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdZ08l4j9k8M+jkJjNmYyxstuXHNySWWgvJXMz8WalhCiWroBe3xTuvINkOu/d9tKSD1zceg==
X-Received: by 2002:a17:902:e74e:b0:224:376:7a21 with SMTP id d9443c01a7336-2292f9fa2d8mr186446005ad.42.1743471737836;
        Mon, 31 Mar 2025 18:42:17 -0700 (PDT)
Received: from jiegan-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eee03f5sm76911435ad.99.2025.03.31.18.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 18:42:17 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Jie Gan <quic_jiegan@quicinc.com>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH] coresight: fix the wrong type of the trace_id in coresight_path
Date: Tue,  1 Apr 2025 09:42:10 +0800
Message-Id: <20250401014210.2576993-1-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: hW49yaAZ8gsIibSXtcTMXwhAQ9th8Bkc
X-Proofpoint-GUID: hW49yaAZ8gsIibSXtcTMXwhAQ9th8Bkc
X-Authority-Analysis: v=2.4 cv=J9Oq7BnS c=1 sm=1 tr=0 ts=67eb447b cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=h-QhH5eI3XViKx3wfOsA:9 a=1OuFwYUASf3TG4hYMiVC:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_01,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 adultscore=0 spamscore=0
 suspectscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504010009

The trace_id in coresight_path may contain an error number which means a
negative integer, but the current type of the trace_id is u8. Change the
type to int to fix it.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Fixes: 3c03c49b2fa5 ("Coresight: Introduce a new struct coresight_path")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 include/linux/coresight.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index d79a242b271d..c2bf10c43e7c 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -337,7 +337,7 @@ static struct coresight_dev_list (var) = {				\
  */
 struct coresight_path {
 	struct list_head	path_list;
-	u8			trace_id;
+	int			trace_id;
 };
 
 enum cs_mode {
-- 
2.34.1

