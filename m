Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686B925BF0B
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 22:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750805613; cv=none; b=AzGLc6KK/UGUmV6LGwzkcTqXmtJRTQtdBD9Ko8O0aXbD8hnzvSgs7gYtGyJu5yb6GVVli+G0IPZ9NowtF+ArLnKshnkX/YWm58ynXkhPtn3aUOf+Esn5fJ4CVsXU7wUYpA8Ap+5vk+aP6XCEENnngGmGp7t0orhXIQP2ldU0e2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750805613; c=relaxed/simple;
	bh=qI30ERfmlxxdaltBkI9sJ1E1tFwxvXR+BM1DU9oH6SU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k93twEFR/IsVzfc04gTUB7oPpxW+OqIkBd2Q3Hv/q6wQAkBOQvq7ylfEIVG8hMEo3kw+QuF7YUwDaFHkCaUKCPrLPVr/G/0xgmbPuBcUt3Gw4HAqTh4tBZGXfwhsyc5JiB2qg5TgSjS+0/nxo2cSfcslPo6ZYcfOmZJqEFktB7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LdqpCm7F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LdqpCm7F"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OGOkOp017607
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 22:53:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gg+QL+5cDfJ0dWjuRdv78pSkTPbAQTwDQrcNodnZrsQ=; b=LdqpCm7FHOZVC7gG
	3UwWeqOTefqs1AHXjhIAX2tYSF90zVudzPb5xMB05yfBb0+bMoKyWGw2OaPhP6dh
	KE+ZrZ0QG3YCBUOyuVeGWkTfBEvyg8WeMGwdT3LH5kTKSGiZkXmHCDQnpTr0K6d1
	6ksf1xQ7JSp2uUxTiftPO8s+dIP8F+5Hh49NHt3AOEGoEJ0vPARLbujjHMRwcQWV
	OKw3pK4Dniq8tytx94FzQlVKg3NKnp1r3LGghyaQdKzWL4Y2V0EBdzcSwQb5c5E9
	vmFTb9bOVUf79A1jI6hrBXjB36nBnIEIJjXdXF2F2auJnulY+L6T5lPGaaw9QtFV
	9d5Mdg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc5pww5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 22:53:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c760637fe5so153385985a.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 15:53:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750805609; x=1751410409;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gg+QL+5cDfJ0dWjuRdv78pSkTPbAQTwDQrcNodnZrsQ=;
        b=lG56R0F5zuf9uKwTs7DVPzjUDNz2cG88rRa3S1hRA9iXQXrxbcG76cAXmzg7W+EEJR
         sUsTHrFfcWQql0vuRhjgaIyOz5HTai/TR0JUMJ2JQMOoZXwqQ1cdwkWcVQ2MRu6YMvbA
         o8BK1/SMyCmcyNyij3g+17SF6+sCc22TSj3oTUr+OlRgcm8APc7u2FyJpi+70/uDs88x
         ac4UGUW7wbSr/ySL7Cd9hLhxMuXsJrjOabD952bOuVTcI4gCgf/V/SYhvmIDgeTO0ewd
         U4ynJ10ifjQ/MAXZwPyQuOjjLo8wKrMFh530W7QT9SMxCZouCh1iFZy+nwZhpmkvQJKs
         oXLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEQsMfg0bgsmAblU7hqXxLc4asA+qUlZM87UwOmllGI/HrtOXUiiQmkjavMUQjCwrFXjl+3lJamBle0I0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBYa+71b+Lf51s7u5gOewfLX3ChQvM3N0nJT4RqJp000pRhrge
	8IMgR7VrpzZMTwn9ZU/+Ns2K3mvUTOyaTGF4DKlHdOXwLwRIB1xxW6mVZPLvmUls5rJQeiwNuPF
	7PH3a8wVB4cnFbPtLS0IDwZ3rTddV20S+iVpVhCl8RDJ6bcNnFdxthsx1ZVOPRm8VGKY=
X-Gm-Gg: ASbGnctVlG/zyYxZk8rXUJ09WKyp3VlxKI7iapUVLAKW6FrtL5nWNPlcP8UjmA6YtWC
	6KfKf94IOkaXZk2OJZKBIoKZun1qJsn/yabtEgQvSi4qoXaGWPQLiFSW68W9nN+Z3RHT8ISvyu5
	VbiwrperlL2SvBGxbbSsRcnrH3y2q3kDv6gp437tcxpbOgEo6Ov9x+VXjuU0xnxREbudQQc1LPJ
	IR+xw2Oxbn6LNc1MD5bIfEDHgnHEFllvS6ixo9vD2pvGv8iSMrY0OHsy9Y8q7cE9wZdHDBEXWFZ
	VNqmDFxEs3Yr6pZa6MevTuHZwNSTgNax6F4gzBBodQgq+KxJwKkA36eeeOZ8T9S3tN1q8ceCt8J
	U+0UF/GOr9ut8t8dO3Hngjqf+3er/Kun+ja0=
X-Received: by 2002:a05:620a:1790:b0:7d3:f3e1:b8d6 with SMTP id af79cd13be357-7d4296d4c12mr164501085a.21.1750805609130;
        Tue, 24 Jun 2025 15:53:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEe3S5rzUbL7rZSSoe52k49A9nYQyjY7KkMpOvTFxCeYYeWZ8qpJarI5/v5VOrfFqkRC8V6g==
X-Received: by 2002:a05:620a:1790:b0:7d3:f3e1:b8d6 with SMTP id af79cd13be357-7d4296d4c12mr164497885a.21.1750805608721;
        Tue, 24 Jun 2025 15:53:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b97f5980bsm17843851fa.7.2025.06.24.15.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 15:53:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 01:53:21 +0300
Subject: [PATCH v4 2/8] firmware: qcom: scm: allow specifying quirks for
 QSEECOM implementations
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-more-qseecom-v4-2-aacca9306cee@oss.qualcomm.com>
References: <20250625-more-qseecom-v4-0-aacca9306cee@oss.qualcomm.com>
In-Reply-To: <20250625-more-qseecom-v4-0-aacca9306cee@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, Steev Klimaszewski <steev@kali.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-efi@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4209;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=qI30ERfmlxxdaltBkI9sJ1E1tFwxvXR+BM1DU9oH6SU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoWyxi+Rd/6xV64rmwuWSJM4867AmzJoTGctKBJ
 Pnn7iTMPyOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaFssYgAKCRCLPIo+Aiko
 1eeqB/9bB8w/3g13sbXEVmXUl7dFo5AXqVuYmJed/WIuvkZRaTZWUAex7q6ORLxe31u5eySXXHM
 tcYfoYKew8te/krMe2LbysX0BMrMwH4NFB8QD2EN90S+Q/OoCW4ivcsImd41iz56IumY3zE+Eit
 gKIBQtn9DwoeKDZ6ALoeZjsPrJCL7AGBiMCSHFtjyQWxIeg5c7OQa66ejecWf6H1wnFiPC+yM5R
 CnKQMQqAx+aCa+kRuJyMTIbpvM8rvTYI1rrRvt7fOaA8VwRuW2xxocW14E5dw6ajNqyFWU4xxhp
 gBOQ/2kkG6aDRXkW5M2wuAn8tVrQRLydx1eU8rjx8ie9vOZq
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 1kiSmxdvnVC4ibFtrRpl4b7MoQKzohnZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDE4MiBTYWx0ZWRfX8wNLuKppzN5l
 EuP7ICEP1bQeiQJGR6lbF0xvqjAhL8TU8SJ0HYBc8reez0BMnQlzR6eE8F1SjIEK3wAIJ6Q00te
 pGUPkR9kzo6BhsARkGHJKOw9o6PV/LWwnk+7lv8tz0CdGZDQOwThh1Pm7ABvuz1qOv0UC6Sjvpx
 ENHR6dyDS5JQblagv8DjBYlN9leeMB4xIpSgYeab8vbuWqHeb4sApfamQ8nMsTkLdicnkXp+R2Z
 P0S5wEvUXC6R/8lmmfEAyitKflPQb6dS5MPkZ5nWqx0C75Se3sbFsbZ4KSjuxvWeM3ivDo7KymI
 HCmRwy1sSb6X4Dkdg7ZJwsaZPvSY0L4mxzSY6sTDqwR3E7lHpXMhFYTwhiMQziD6ybcq6xl0aEo
 h0+uJLG/NDk858WMIm8Znt6izNxFM9LUDhZgs+OXczL5y3yGYG4bwk+3pRq5IcvmUjefAX6p
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=685b2c6a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=wTlJEWXFZO-q-0qxHBMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 1kiSmxdvnVC4ibFtrRpl4b7MoQKzohnZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240182

Some of QSEECOM implementations might need additional quirks (e.g. some
of the platforms don't (yet) support read-write UEFI variables access).
Pass the quirks to the QSEECOM driver and down to individual app
drivers.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_qseecom.c |  6 +++++-
 drivers/firmware/qcom/qcom_scm.c     | 28 ++++++++++++++--------------
 2 files changed, 19 insertions(+), 15 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_qseecom.c b/drivers/firmware/qcom/qcom_qseecom.c
index 731e6d5719f9e3e9e698f5de0117540f51ebab63..aab0d61f0420c4f3d6c1a73e384195b9513f3ef9 100644
--- a/drivers/firmware/qcom/qcom_qseecom.c
+++ b/drivers/firmware/qcom/qcom_qseecom.c
@@ -36,6 +36,7 @@ static void qseecom_client_remove(void *data)
 }
 
 static int qseecom_client_register(struct platform_device *qseecom_dev,
+				   void *data,
 				   const struct qseecom_app_desc *desc)
 {
 	struct qseecom_client *client;
@@ -56,6 +57,7 @@ static int qseecom_client_register(struct platform_device *qseecom_dev,
 
 	client->aux_dev.name = desc->dev_name;
 	client->aux_dev.dev.parent = &qseecom_dev->dev;
+	client->aux_dev.dev.platform_data = data;
 	client->aux_dev.dev.release = qseecom_client_release;
 	client->app_id = app_id;
 
@@ -89,12 +91,14 @@ static const struct qseecom_app_desc qcom_qseecom_apps[] = {
 
 static int qcom_qseecom_probe(struct platform_device *qseecom_dev)
 {
+	void *data = dev_get_platdata(&qseecom_dev->dev);
 	int ret;
 	int i;
 
 	/* Set up client devices for each base application */
 	for (i = 0; i < ARRAY_SIZE(qcom_qseecom_apps); i++) {
-		ret = qseecom_client_register(qseecom_dev, &qcom_qseecom_apps[i]);
+		ret = qseecom_client_register(qseecom_dev, data,
+					      &qcom_qseecom_apps[i]);
 		if (ret)
 			return ret;
 	}
diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index f63b716be5b027550ae3a987e784f0814ea6d678..fc2ed02dbd30b389b5058f5cac70c184df7ca873 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2008,10 +2008,10 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ }
 };
 
-static bool qcom_scm_qseecom_machine_is_allowed(void)
+static bool qcom_scm_qseecom_machine_is_allowed(unsigned long *quirks)
 {
+	const struct of_device_id *match;
 	struct device_node *np;
-	bool match;
 
 	np = of_find_node_by_path("/");
 	if (!np)
@@ -2020,6 +2020,11 @@ static bool qcom_scm_qseecom_machine_is_allowed(void)
 	match = of_match_node(qcom_scm_qseecom_allowlist, np);
 	of_node_put(np);
 
+	if (match && match->data)
+		*quirks = *(unsigned long *)(match->data);
+	else
+		*quirks = 0;
+
 	return match;
 }
 
@@ -2034,6 +2039,7 @@ static void qcom_scm_qseecom_free(void *data)
 static int qcom_scm_qseecom_init(struct qcom_scm *scm)
 {
 	struct platform_device *qseecom_dev;
+	unsigned long quirks;
 	u32 version;
 	int ret;
 
@@ -2054,7 +2060,7 @@ static int qcom_scm_qseecom_init(struct qcom_scm *scm)
 
 	dev_info(scm->dev, "qseecom: found qseecom with version 0x%x\n", version);
 
-	if (!qcom_scm_qseecom_machine_is_allowed()) {
+	if (!qcom_scm_qseecom_machine_is_allowed(&quirks)) {
 		dev_info(scm->dev, "qseecom: untested machine, skipping\n");
 		return 0;
 	}
@@ -2063,17 +2069,11 @@ static int qcom_scm_qseecom_init(struct qcom_scm *scm)
 	 * Set up QSEECOM interface device. All application clients will be
 	 * set up and managed by the corresponding driver for it.
 	 */
-	qseecom_dev = platform_device_alloc("qcom_qseecom", -1);
-	if (!qseecom_dev)
-		return -ENOMEM;
-
-	qseecom_dev->dev.parent = scm->dev;
-
-	ret = platform_device_add(qseecom_dev);
-	if (ret) {
-		platform_device_put(qseecom_dev);
-		return ret;
-	}
+	qseecom_dev = platform_device_register_data(scm->dev,
+						    "qcom_qseecom", -1,
+						    &quirks, sizeof(quirks));
+	if (IS_ERR(qseecom_dev))
+		return PTR_ERR(qseecom_dev);
 
 	return devm_add_action_or_reset(scm->dev, qcom_scm_qseecom_free, qseecom_dev);
 }

-- 
2.39.5

