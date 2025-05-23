Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE2A29B76E
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 19:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748027279; cv=none; b=hUUQ8zeVSU9vEHRelxE94O6KbLsSc1zzm7fABuMYvLRmTto5Bp+5suFIaQ6cPRML0rt3KQiJWxcwdslMMYSrmalHKYsdEMKPFJd7+5VowuU8oaQLbDr6oF1RSp6y/SvoK9Jm0alYGReMC7yLaVnrmtKSsvX4II6jLKL3Q1bHq7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748027279; c=relaxed/simple;
	bh=ZykR5KDDu2LYLt2a2csTXDEitMti0SIv3lJ2U21A6qQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SHGM7Hxg6t53W7BaYM6BUvxURxm3WPIIQIK8PKNFnR3Aih6LHBCeIYWMc+yzUkPUSREnzJqhIVoqn3qEZrMUahTHUIRRRyHUymcV6JE2hZe64D0jpQAuHbI5XNc801ZKjL5LHIsG2n7kppXedk2ZlRK9wvStNRESMkcyhduw1ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UgWSsk8W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UgWSsk8W"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NCaAtJ000873
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 19:07:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ht1fhZBu/Xdj2ZKeShX9LxbiXvV15fZoJixwsDaW+Gk=; b=UgWSsk8W5NkRKuoR
	5iKBwOTu0NxEEq3uNESu/GE0CazfoEkOq7g331qgMZutiBgr2Epcd42JbBAdchMJ
	/bXvSDmkLMhcmcnKsmY4hnl/tDWN+/MoQItCg8if2DCcXGALi0HGrmc6FBf6FiWC
	VYRX1QuBzy7tYN5oPm7auiM7n8D6j8nh21fRuqGRhhjMNduef8eQ5+G+K3JumoCD
	NOiCbThkCLz9fo3EjmjCQT70iaxAAWVyBdqhK7gWnvhzkYDouqgCzishc0MHz7TV
	FT/ZEtYZpGOg+7sW4WPVEBwdKy60A54q7i+N5UNu2x+vBcVDONe8fUooaFVwq04K
	cKBjcQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf72tk9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 19:07:56 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-23206c06d29so1736385ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 12:07:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748027275; x=1748632075;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ht1fhZBu/Xdj2ZKeShX9LxbiXvV15fZoJixwsDaW+Gk=;
        b=n4Lj8x4ernO4MF2uWlO5lep6lOhOBSWRiePvVChxtg4SPMahVDJYftjUz6gX/arzxl
         F1w3IpEGQq0RswQVxsrdIMsQ5QZVfcQaM95L9IOneSjsRb/3/+L6lNDn54ucGU3V0gjz
         LJS539WHSgYXfGTxtLhgYvnLxT1Nu2XNA4Y2FRracdv7PcB6hcEhDohMAF04qVxtjYNL
         1weX73kKhPA0vh9NX6loA4Fhb4hPxIABm3pnFhZlx4lU+tltYw0l2CCcESDtzL1E7Kd/
         ja84EZxbKCBM1Eqhnx+KB4J+pK1fj8dmbl3lvkdXMxgde2EBPdpWablJL/QT39Nt93jn
         FaxA==
X-Forwarded-Encrypted: i=1; AJvYcCWQx36/mMWvqfdfJvVa2bQUdGrsrwq81ClKfiKs1GQFJ3xLCbWH5JY52HqxpiRbTpynCq0yGwvEe0cLEBE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmnbZZRPVdzM+CZeIHAFRTzH8m1WfZI1Ji0PQ88698RXymd2CU
	xat2aJnTbroDybfbdD/KkvA1RlMvvoUEFBvRB9+ZnfOb9324hMN5fkpmuiN1QYEbPUT4TmzC/NV
	0HqF0QqwRnUuHsPV7FzoMaKvKeAp/+WjBSPuqAtxjiPGivqzvPqkDzOZJ+n+Oh7DR+U8=
X-Gm-Gg: ASbGncsHcodZbXowUtCmuIifc9f+F7ZASlHBnhsK/k/V1IMC3F0pYtZP8zsRYvPrBXe
	KIJ3dPjNAGTmpFXmpccnIbiN3CCu6JY9oR5HRvvLhPHpe0rMty5Gcco5vO2KYG5jXK8QhuU+Weh
	IkhfQPbgX5drFr/EVbbQOTjAkGkZs0i4DiUOXl4Cet/8k9Wch3DIN5yqELtmuVnLl8zA/B6si1Y
	qJuqPSYIT1oiKQpDHarJNmP4kDN5FeMf00UadPuhpZ4Npid745zk/72pZGF1H85PLlv4pM00ray
	uaRGnDCIU2z4ptajpQAvqNw4o1PjbtTpwO88NpNw5Bci5erLdvWgph91NXJSn1dIIcxtTkzneeH
	hEDM=
X-Received: by 2002:a17:902:ccc1:b0:234:1163:ffa9 with SMTP id d9443c01a7336-23414fd6533mr6910665ad.46.1748027275067;
        Fri, 23 May 2025 12:07:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmgAQ7M1bFuuVb8sasOix686shaxTeQEHPiOneDRjyh1bgrCHrNr+RVzUI1LEXhu2YMi2Q2A==
X-Received: by 2002:a17:902:ccc1:b0:234:1163:ffa9 with SMTP id d9443c01a7336-23414fd6533mr6910235ad.46.1748027274642;
        Fri, 23 May 2025 12:07:54 -0700 (PDT)
Received: from hu-uchalich-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e97886sm126652165ad.146.2025.05.23.12.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 12:07:53 -0700 (PDT)
From: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Date: Fri, 23 May 2025 12:07:41 -0700
Subject: [PATCH v7 2/3] firmware: qcom_scm: Support multiple waitq contexts
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250523-multi_waitq_scm-v7-2-5b51b60ed396@oss.qualcomm.com>
References: <20250523-multi_waitq_scm-v7-0-5b51b60ed396@oss.qualcomm.com>
In-Reply-To: <20250523-multi_waitq_scm-v7-0-5b51b60ed396@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com,
        Prasad Sodagudi <prasad.sodagudi@oss.qualcomm.com>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748027270; l=4803;
 i=unnathi.chalicheemala@oss.qualcomm.com; s=20240514;
 h=from:subject:message-id; bh=ZykR5KDDu2LYLt2a2csTXDEitMti0SIv3lJ2U21A6qQ=;
 b=P46Xv/T44A/cvwXNPWe6Ei1xWLGgSpJCwLgOv5ujhXiP6o0nnF892rV25PyXeEVKJkfRLVyTr
 re1N6DwYdG7DFBCVDfFMUKXG8JyKL88q6c5BFHScH4lliEAx8754zdC
X-Developer-Key: i=unnathi.chalicheemala@oss.qualcomm.com; a=ed25519;
 pk=o+hVng49r5k2Gc/f9xiwzvR3y1q4kwLOASwo+cFowXI=
X-Proofpoint-GUID: 0jXkqN4whniX6emSo56wOsgf8nOjq7bl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE3NCBTYWx0ZWRfX4Jrrdvej4Px7
 Z4ldE+8JZBxzmIEuQNJGpEhRLyqfpaRkviYDKeP8P+PHzLgIBgqUC7sK9cT1t4pZwX7IPrhmcnn
 AwzV0gpOG2/BAvdt8Zv0TWXvGo1ns52mx3dV7Sph4EHKqgT9F7JAx1woTihN5pfUKwJaabXfYJr
 tgglH46w3sgs8XUNptcuKZlPsPFCySSgwLDrOoy2XFZ+IrOKT5obSm132J6VVIyMlikRJzmqXlf
 nkKArbb3PCW/jDtlNEw6RpxoQc91Eu0Bz7Z5+K9kOZdQi1DYrAYVd37UwULcyxaJqSXVMPxsBX+
 dIrB+vHtoqV+3oImGXP2T5fAm2J0CrPXp+cl2KLasg6GiPhR6ZEfD+Qe4oYfu+270g9TxAzv210
 6YQEqzt+xTa8jPfosvvPejemOqdJm60g2D/t9mnwD2d6P/dcDsOnkGC83O0/zOOR1auHUynC
X-Authority-Analysis: v=2.4 cv=fZOty1QF c=1 sm=1 tr=0 ts=6830c78c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=IoDWPEjDBkkTTY39AZoA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 0jXkqN4whniX6emSo56wOsgf8nOjq7bl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230174

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
 drivers/firmware/qcom/qcom_scm.c | 75 ++++++++++++++++++++++++++++------------
 1 file changed, 53 insertions(+), 22 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 529e1d067b1901c4417a1f1fd9c3255ee31de532..c2682e9bde58b6f132af0c1bc2e194db0e401e3b 100644
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
@@ -2118,6 +2119,25 @@ static int qcom_scm_fill_irq_fwspec_params(struct irq_fwspec *fwspec, u32 virq)
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
+	ret = qcom_scm_call_atomic(scm->dev, &desc, &res);
+	if (ret) {
+		dev_info(scm->dev, "Multi-waitqueue support unavailable\n");
+		return ret;
+	}
+
+	return res.result[0] & GENMASK(7, 0);
+}
+
 static int qcom_scm_get_waitq_irq(void)
 {
 	int ret;
@@ -2149,42 +2169,40 @@ static int qcom_scm_get_waitq_irq(void)
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
@@ -2260,6 +2278,7 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	struct qcom_tzmem_pool_config pool_config;
 	struct qcom_scm *scm;
 	int irq, ret;
+	int i;
 
 	scm = devm_kzalloc(&pdev->dev, sizeof(*scm), GFP_KERNEL);
 	if (!scm)
@@ -2270,7 +2289,19 @@ static int qcom_scm_probe(struct platform_device *pdev)
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

