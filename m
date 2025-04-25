Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72D1267F75
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 23:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745624893; cv=none; b=VNpFZa0BJxggqPmSWJN/9Ou9cFSqduUJPCiQHom6a4yK9Nksv0YVHqUC8c0VtXpSt81rtlHDaRQxneXZiYkGV33lkduT0cfr66xpH6ji7Rv36yMGImblu3DCIrm7pNVkkshtx2P6/hT8TMUCSpHuOHUJjK4bWfd0smMeJrC6SwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745624893; c=relaxed/simple;
	bh=CxAQMDuh9krf1N30Zll9vwqxkcHp/5I1Da/5rxIOxLU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GE/IGwYlYhRllizTPYmb4lmDg3xjlbNNIN4tRSC6LH1VRjz48oux2fzAbNFehyxtMeE2WhVzx95AADRkrFtuQcAgUnrArMeoq/wNGQXOeqRQQN/m1a7DLgsoTCOCkjE9iXlCeOy1yvd2bpUhJOmHpsffG5NBlWfFbZi0kM/3dWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cNYu5m4B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cNYu5m4B"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJtPq001322
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 23:48:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/cM78RDPLdFeQcNGGFl0xqNHvrHRmJYbSLftRUJXI/Q=; b=cNYu5m4BiRtqvetd
	/LHKYtfMQ1NyWTc3OXwmptl5gEzAL2pSabcYTqfmvUEJo138DVG/Bz87AwswfMdM
	8bQJj/mcr0Pq9vJk55bqcBBadREspaLSJm69Ta5xNqwzjupG+1uDkECo4SKZwXls
	WCEUv/7YIwvn5Mbc99PWd161uYDqB5VGNrUXJ7//QyGIP3Mhi1ViZiXI4Db7vofC
	vYxqwMJb/aQId5flgoEovFRjKIi6f8JkKl4dfeZGoudsOSNJDe3q8D0+fVzwqrcN
	Xq8ykvzjsnLX4t7d5KaaNaaPyiB6CWyMIYKjEC5V+X85DK5bx/MllW3sUnmoWKV/
	q5n3Bg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3jj18-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 23:48:10 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-736d64c5e16so2299140b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 16:48:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745624890; x=1746229690;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/cM78RDPLdFeQcNGGFl0xqNHvrHRmJYbSLftRUJXI/Q=;
        b=seXjMkrcg0ia6WvIOiKzvCV8AshGCkin/siEztUOtMAX3YRbaH/Z9Ryi7aqG7PeB57
         cVOxWYlKeWPw7NY+2OKb17oi4lu+jvuMIkivjzQ+OW9+JmnZlBkUMw3I8UuL674o40PB
         YKsLxjC8aRxzmhOlblDQ5wxwBD8rYokWL3EF5Ds4NG7BzdlBVGMfy40C1GSc/NSay6oo
         hQuwWR57uFuiZE7XRd9EyTfRizWB9z268EqW+Mjr3/xzxg4jdS4NNxPyaRQQODa52nCg
         cuUkQP0GQQTUKXbPSz06ou0YNNYxba+KiZ3+vi/fJE2jjnzVHFmM24ncdTniBMi12sfA
         gZvA==
X-Forwarded-Encrypted: i=1; AJvYcCVXwSjWy2FYo2TaJ7+T5jm0ybk1rtTMfyNdFp3E364G9Bl3uqHNtX14AAlb4stNemk9IfxKGyTR4k4PbAE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHe0haQy3tTZW2DpsgOi5Evqdu3zD0GoN9JkZEIkTjT7/311z9
	VnyKEG73dOeW2ghClOQCrEU6WRV6eDXMFc+HDPQZdGwBdmVH/O954MPLnIoHN0FF/k+95LV4wEW
	QEJbA/k239AJQ+wMr1MhqdXGf2CbEIpJZZcIbjhgzTJQbhBjh5mYNjp+rFkYLho+PJQDu9yM=
X-Gm-Gg: ASbGnctwY/ZLX+KkrvM32YphcsnDijI05khU5neNz7kbLWPZL3ZRkXvPNSvE1mQMUaZ
	66gWXPt3lWYaXC9i1Z4kCQzo3gVv58tjT9IWu8r3UglowUd9le0CkWlmLZE5pYR6+x0yQEquxfk
	NQzqqICYnJwWzov70+PJmNRW46o6m6E6xR3zBfeKyybsZJiVE/cE1KW43dIGNecSKKPbVLnR3nY
	kx6LxOci4MRFvyMbltpDk4uxROv2Slm2T0a/aWwOsGReegZj+PpChebePX9SNFSAoZ4I2lZrpYU
	E3Pg/kz75Vo2FVlWvd/CnSoWlYIxetdV4JMht33DEZxP0MZHyNsCf126fFOZ/0RK7bY0OCDitZB
	Hq6A=
X-Received: by 2002:a05:6a00:3a12:b0:73e:2dc8:94f3 with SMTP id d2e1a72fcca58-73ff725247amr1612737b3a.1.1745624889725;
        Fri, 25 Apr 2025 16:48:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+S26bInhZBenA2dmE7t07ZXFkmKEWQS4evqWc88J7A2otJ6UPmPtEA9c7IzbqwWzy2fhtog==
X-Received: by 2002:a05:6a00:3a12:b0:73e:2dc8:94f3 with SMTP id d2e1a72fcca58-73ff725247amr1612710b3a.1.1745624889365;
        Fri, 25 Apr 2025 16:48:09 -0700 (PDT)
Received: from hu-uchalich-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a9a308sm3868948b3a.136.2025.04.25.16.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 16:48:08 -0700 (PDT)
From: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 16:48:02 -0700
Subject: [PATCH v6 2/3] firmware: qcom_scm: Support multiple waitq contexts
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-multi_waitq_scm-v6-2-cba8ca5a6d03@oss.qualcomm.com>
References: <20250425-multi_waitq_scm-v6-0-cba8ca5a6d03@oss.qualcomm.com>
In-Reply-To: <20250425-multi_waitq_scm-v6-0-cba8ca5a6d03@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com,
        Prasad Sodagudi <prasad.sodagudi@oss.qualcomm.com>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745624885; l=4913;
 i=unnathi.chalicheemala@oss.qualcomm.com; s=20240514;
 h=from:subject:message-id; bh=CxAQMDuh9krf1N30Zll9vwqxkcHp/5I1Da/5rxIOxLU=;
 b=dz2NiBZ9DGZH4/87bJKCw9aH1uTMzvimIZ3Ing3QOSgd092wkyhzGNap/LUVA9DhgcYTM0wfa
 Ix6f0hXcRETAzOHs8oABuucTO4yO1ccZvK3wnsnn/S0rSL7roKBMA48
X-Developer-Key: i=unnathi.chalicheemala@oss.qualcomm.com; a=ed25519;
 pk=o+hVng49r5k2Gc/f9xiwzvR3y1q4kwLOASwo+cFowXI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE3MiBTYWx0ZWRfX0+LW58598I81 51SrhodxWBaxSxrWtvBbsqrIHws7hhWne6CRXckCyqVStyQL5uijEjUgbrvrkyuSSeASJINJSxo AsvfigrfXozxgrWjAE0nHaRLA3Gmnj1cNAzi6rvGXFJfCqeGThmWIeTT66EQgkI7wU+7cgB8OJ7
 POb+qckX+hUNAEzNDQMypHGwKR8QNtLsnCa/osgHTEOrgN4f/yJYt9WET9koJGaNsa7BvuM8uLD 42U+ebWujxBvxdKaBEhxHV+Wa3+1kz+/nYSphB1r77GIL+k9wcAO9lTz7XGwPrvFpZ4Fgwl87GH TAC3E04TgPsudCKzt8o4ob09i30XafUGXr4rLGtIOg/f1Ix2Uvr4Y+cNH3paCV7Uk/sgIU8Yis1
 W8h3w5XxTJZZf1cYeKhco4YX89MTUDWqesASIOJNFTuB3zClpKVqBdpkhkWfw7KNG7JmX3sE
X-Authority-Analysis: v=2.4 cv=bs1MBFai c=1 sm=1 tr=0 ts=680c1f3a cx=c_pps a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=IoDWPEjDBkkTTY39AZoA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: IRN2rtQhYUUJXsDWZPfOpxr0j3iqdAJc
X-Proofpoint-GUID: IRN2rtQhYUUJXsDWZPfOpxr0j3iqdAJc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_07,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250172

Currently, only a single waitqueue context exists, with waitqueue id zero.
Multi-waitqueue mechanism is added in firmware to support the case when
multiple VMs make SMC calls or single VM making multiple calls on same CPU.

When VMs make SMC call, firmware will allocate waitqueue context assuming
the SMC call to be a blocking call. SMC calls that cannot acquire resources
are returned to sleep in the calling VM. When resource is available, VM
will be notified to wake sleeping thread and resume SMC call.
SM8650 firmware can allocate two such waitq contexts so create these two
waitqueue contexts.

Unique waitqueue contexts are supported by a dynamically sized array where
each unique wq_ctx is associated with a struct completion variable for easy
lookup. To get the number of waitqueue contexts directly from firmware,
qcom_scm_query_waitq_count() is introduced. On older targets which support
only a single waitqueue, wq_cnt is set to 1 as SCM call for
query_waitq_count() is not implemented for single waitqueue case.

Signed-off-by: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 78 ++++++++++++++++++++++++++++------------
 1 file changed, 56 insertions(+), 22 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 529e1d067b1901c4417a1f1fd9c3255ee31de532..9f8db13ef1ce14cc324fa9f0abf5c6a97ceb7b8b 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -47,7 +47,7 @@ struct qcom_scm {
 	struct clk *iface_clk;
 	struct clk *bus_clk;
 	struct icc_path *path;
-	struct completion waitq_comp;
+	struct completion *waitq;
 	struct reset_controller_dev reset;
 
 	/* control access to the interconnect path */
@@ -57,6 +57,7 @@ struct qcom_scm {
 	u64 dload_mode_addr;
 
 	struct qcom_tzmem_pool *mempool;
+	unsigned int wq_cnt;
 };
 
 struct qcom_scm_current_perm_info {
@@ -2118,6 +2119,28 @@ static int qcom_scm_fill_irq_fwspec_params(struct irq_fwspec *fwspec, u32 virq)
 	return 0;
 }
 
+static int qcom_scm_query_waitq_count(struct qcom_scm *scm)
+{
+	int ret;
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_WAITQ,
+		.cmd = QCOM_SCM_WAITQ_GET_INFO,
+		.owner = ARM_SMCCC_OWNER_SIP
+	};
+	struct qcom_scm_res res;
+
+	if (!__qcom_scm_is_call_available(scm->dev, QCOM_SCM_SVC_WAITQ, QCOM_SCM_WAITQ_GET_INFO)) {
+		dev_info(scm->dev, "Multi-waitqueue support unavailable\n");
+		return 1;
+	}
+
+	ret = qcom_scm_call_atomic(scm->dev, &desc, &res);
+	if (ret)
+		return ret;
+
+	return res.result[0] & GENMASK(7, 0);
+}
+
 static int qcom_scm_get_waitq_irq(void)
 {
 	int ret;
@@ -2149,42 +2172,40 @@ static int qcom_scm_get_waitq_irq(void)
 	return ret;
 }
 
-static int qcom_scm_assert_valid_wq_ctx(u32 wq_ctx)
+static struct completion *qcom_scm_get_completion(u32 wq_ctx)
 {
-	/* FW currently only supports a single wq_ctx (zero).
-	 * TODO: Update this logic to include dynamic allocation and lookup of
-	 * completion structs when FW supports more wq_ctx values.
-	 */
-	if (wq_ctx != 0) {
-		dev_err(__scm->dev, "Firmware unexpectedly passed non-zero wq_ctx\n");
-		return -EINVAL;
-	}
+	struct completion *wq;
 
-	return 0;
+	if (WARN_ON_ONCE(wq_ctx >= __scm->wq_cnt))
+		return ERR_PTR(-EINVAL);
+
+	wq = &__scm->waitq[wq_ctx];
+
+	return wq;
 }
 
 int qcom_scm_wait_for_wq_completion(u32 wq_ctx)
 {
-	int ret;
+	struct completion *wq;
 
-	ret = qcom_scm_assert_valid_wq_ctx(wq_ctx);
-	if (ret)
-		return ret;
+	wq = qcom_scm_get_completion(wq_ctx);
+	if (IS_ERR(wq))
+		return PTR_ERR(wq);
 
-	wait_for_completion(&__scm->waitq_comp);
+	wait_for_completion(wq);
 
 	return 0;
 }
 
 static int qcom_scm_waitq_wakeup(unsigned int wq_ctx)
 {
-	int ret;
+	struct completion *wq;
 
-	ret = qcom_scm_assert_valid_wq_ctx(wq_ctx);
-	if (ret)
-		return ret;
+	wq = qcom_scm_get_completion(wq_ctx);
+	if (IS_ERR(wq))
+		return PTR_ERR(wq);
 
-	complete(&__scm->waitq_comp);
+	complete(wq);
 
 	return 0;
 }
@@ -2260,6 +2281,7 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	struct qcom_tzmem_pool_config pool_config;
 	struct qcom_scm *scm;
 	int irq, ret;
+	int i;
 
 	scm = devm_kzalloc(&pdev->dev, sizeof(*scm), GFP_KERNEL);
 	if (!scm)
@@ -2270,7 +2292,19 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	init_completion(&scm->waitq_comp);
+	ret = qcom_scm_query_waitq_count(scm);
+	if (ret < 0)
+		return ret;
+
+	scm->wq_cnt = ret;
+
+	scm->waitq = devm_kcalloc(&pdev->dev, scm->wq_cnt, sizeof(*scm->waitq), GFP_KERNEL);
+	if (!scm->waitq)
+		return -ENOMEM;
+
+	for (i = 0; i < scm->wq_cnt; i++)
+		init_completion(&scm->waitq[i]);
+
 	mutex_init(&scm->scm_bw_lock);
 
 	scm->path = devm_of_icc_get(&pdev->dev, NULL);

-- 
2.34.1

