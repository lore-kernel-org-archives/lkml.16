Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0025321FF5E
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 10:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745404673; cv=none; b=nRmiPIVeCMKTRcnL4P5UNF07oms9UUAzEVNZD5263ft456WYQ9p5eqgrNAUgJPDawKWKh+PUOJ0jzMF8YD7sheTRyk6Heo6cGjkZtp7R6fHA0U7tRdy2KuxwzRTM4AMX2vKP8AZ4+3HbNnM/OEXr3kHtHAHBScy9i0ogbJIkgp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745404673; c=relaxed/simple;
	bh=PFbMd7N+mUz97HkKIHV8eWiCX0S3NZOGV4ovk8dMMBU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GBiJiYJo9vYbr7t5v/+AFAQKukyN3wDgfzLaFIK/z/bwNV1WHfwq9OsYM4X2V5ntKLVm4AhMH2ZKClFA77+CQGeCZTy9yap0G3lEfA+6px2s6Xyt0PZh/wn6Dqy3N4tGjo67qIdwW3heMUFK7/RfbGku2HxLDeeEK5zOnm7chdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WQ0UvvRK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WQ0UvvRK"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0i9s7022454
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 10:37:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=T+V97obDzLk5rmrB6ECsIKW4/Kobtop+u5V
	Lb/vFfd8=; b=WQ0UvvRKkvZ+rSC9FtufDviRgnIFXldkFqttyfIKVg+MI3jkab6
	N/MpU1m/Ey0dHx8UsNifTCkdVqg9bjp8mjZTBWMwvKsmc384VX1zG4DHyYMFZ+M/
	zXpougMZpctqSSg1aNk9qNfy1oBCQpPSKRPQpbmXpNVXuX9FWWw31YDgTlrvrKLS
	skYn9JpMuFjQPXxt2iGlfMI4GHMhlHXU7dgf7W1lZzxExX0ieuKmvbjNpA0AIXly
	BP++hDfxlsSOXKhtfxElfMmHciTOC/rJHtO3eNkrV1HdhlcPyDVuuHq7BRMd0exC
	ADhAJwbMZh/CyP6aVpWc6aNoxKDsMSQ3FTA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh29tbw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 10:37:50 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-af972dd0cd6so3686802a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 03:37:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745404670; x=1746009470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T+V97obDzLk5rmrB6ECsIKW4/Kobtop+u5VLb/vFfd8=;
        b=UorAOO9g0bk10mKEtw2Fhlr6TWZzLacl4jJ74G5EWwbFw1gsnLBsM+1I29rniQX3z1
         3txxL0ySZy8EdQCYebE8GWCqnVIHzlU3SJmZfQFYOFgrqUUPVy5luLKu7UNmGhkSEeku
         j5zj0bV0zR3kuuKkg4yK3eOI03AK6vDpEhGGn6Ot2QbPbdqB64JWvu784wRvk7UPHzWp
         DGqLYu7ycPT7Q3MTFsVIjmvhRAPj7giQgmpQnf1zoJZDjwaqfEExVqtdzrftb0+IGWop
         1MxgpNXIymjjIaMoFVL0CMxOsqY693leDonFO2fLbYBNQg++fjyydppR6OkK8ppnJSVE
         CULw==
X-Forwarded-Encrypted: i=1; AJvYcCXnuJxTHdleWoCYOQ50/ojj/wgsyZ97tW/H+4DK2m8HadqHPuXgZRvx1lZDZIudk9GsoZFl0g6dxHqytig=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvgQRg5ijQpJ06F2OhXykk39QN41Csj/0xswFdZeZjOib/Rm9N
	hBnNlRS9M7BMrenkhp4KZzlolXclkDe8c64EKqfk0noj7NKVwSXPnOPekZsvQ3Xax/HYiXQfWoR
	9JjRHhofTr5pK5dGpJ67w082UdoD0yawKIxm3KoXlrqbxYx+JVLvyrydNDjPxIpM=
X-Gm-Gg: ASbGncvn+o7Gg+t0+W13JSsfDGHgt5Fl7fzQw5jFD4K4swGCRQK+vybWUZSxzXo7uXp
	UQCgsaEOairjBsTVb63bTOmAY4f08mmIMgvKfoQ3HP+REXV7XUx23pZYrNkW+PHVNaxG7E4Qt7b
	E1IaVipw4RoQ25DbB8pRePcweCnXZd3pQhoT+ZA4k05PE4yOhStpZUiMQUmZa0d6la0VPXJpygy
	Fu6iOC5iG+RCImq9HmUJjpu6J7qYDbiQmk++J0Q/x3o5lNxs1nD28wP+S3rZmgJ1DAmtpkXX2D3
	w9JpKMQiDtmJ8eO+uXAOpvTPtWrfw+1+PPemsMNzaLAH/gly4Rl4U8jhHf4hGwPlrNY=
X-Received: by 2002:a17:903:fad:b0:211:e812:3948 with SMTP id d9443c01a7336-22c530b58acmr285107805ad.0.1745404669978;
        Wed, 23 Apr 2025 03:37:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWEGkGqqQxiqBDc642jLnAvl/Kfh5eMLvvocivyBH/SIGLIeIYmnBvd/W4FMF0zn3I3okHCA==
X-Received: by 2002:a17:903:fad:b0:211:e812:3948 with SMTP id d9443c01a7336-22c530b58acmr285107455ad.0.1745404669586;
        Wed, 23 Apr 2025 03:37:49 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50fda402sm100452395ad.232.2025.04.23.03.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 03:37:48 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Yabin Cui <yabinc@google.com>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>
Subject: [PATCH] coresight: tmc: fix failure to disable/enable ETF after reading
Date: Wed, 23 Apr 2025 18:37:44 +0800
Message-Id: <20250423103744.475-1-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: IoMulNhMTGO9jiKGxhU6Y7eUKx3BMd2W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA3MyBTYWx0ZWRfX2A/W/8QU4lZ0 3L43k1XEzq8En+PjQScusU8RaPql0vl69JLr6MjtMH3QoPYYNDjoZv/j8YZ3b4t5DxpNL/rkyzf VKRbuWZn67iRrhMzUpJausF/e8hif5rVDXwZmJ5GBTp8tQ4KVC7ZglImR+4Y2tr7FQoXsdb49X1
 Ie4wB4Aci9pRbRlzdSXlbXdilGCEJNOfcjX39GkJjpg2pFmGPFkKFhYUAomJoGYbychK3d8NlZ4 ajwwgMFQ/zOg771WI/a+kQ6Sd9vhBwXdu8wbbMVWlUlE2Vzsv7JMXltShtFicbvLLGyqeOxqft+ S8DM2PuQwW/8Srps+Hp1dg9XhvBAn9xIO362rhA4ByJhMhyOkszuwgj6qqRX9V/9UeBzepQ8LpX
 p++SBehX2LQOuOGVHDqkOFpmg7dtjeWrxTRzmprqcpSwxVYJnvW8C7uf5T26bhDEFmAaJXde
X-Authority-Analysis: v=2.4 cv=Tu/mhCXh c=1 sm=1 tr=0 ts=6808c2fe cx=c_pps a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=RFblPUowwLJ5Nc-cMjAA:9 a=bFCP_H2QrGi7Okbo017w:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: IoMulNhMTGO9jiKGxhU6Y7eUKx3BMd2W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_07,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=659 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230073

From: Mao Jinlong <quic_jinlmao@quicinc.com>

From: Mao Jinlong <quic_jinlmao@quicinc.com>

ETF may fail to re-enable after reading, and driver->reading will
not be set to false, this will cause failure to enable/disable to ETF.
This change set driver->reading to false even if re-enabling fail.

Fixes: 669c4614236a7 ("coresight: tmc: Don't enable TMC when it's not ready.")
Co-developed-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-etf.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c b/drivers/hwtracing/coresight/coresight-tmc-etf.c
index d858740001c2..8c9f14e36bc2 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
@@ -87,6 +87,12 @@ static void __tmc_etb_disable_hw(struct tmc_drvdata *drvdata)
 {
 	CS_UNLOCK(drvdata->base);
 
+	/* Check if the etf already disabled*/
+	if (!(readl_relaxed(drvdata->base + TMC_CTL) & TMC_CTL_CAPT_EN)) {
+		CS_LOCK(drvdata->base);
+		return;
+	}
+
 	tmc_flush_and_stop(drvdata);
 	/*
 	 * When operating in sysFS mode the content of the buffer needs to be
@@ -747,7 +753,6 @@ int tmc_read_unprepare_etb(struct tmc_drvdata *drvdata)
 	char *buf = NULL;
 	enum tmc_mode mode;
 	unsigned long flags;
-	int rc = 0;
 
 	/* config types are set a boot time and never change */
 	if (WARN_ON_ONCE(drvdata->config_type != TMC_CONFIG_TYPE_ETB &&
@@ -773,11 +778,7 @@ int tmc_read_unprepare_etb(struct tmc_drvdata *drvdata)
 		 * can't be NULL.
 		 */
 		memset(drvdata->buf, 0, drvdata->size);
-		rc = __tmc_etb_enable_hw(drvdata);
-		if (rc) {
-			raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
-			return rc;
-		}
+		__tmc_etb_enable_hw(drvdata);
 	} else {
 		/*
 		 * The ETB/ETF is not tracing and the buffer was just read.
-- 
2.34.1

