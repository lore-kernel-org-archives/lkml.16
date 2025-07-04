Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4992E5B07
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 16:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751646929; cv=none; b=tstmJcVxTE5MBKmSxeYCzMdemsNSPgaKMvwhxzL/MsV4AVRBtSmkW23vEq4MhfWbFCnkEDm8oqptwz+DbG0xZhbJifeoYYTsq+/QmNAnebKJr91C6zQ2R8CMn0E/JzuqXwwQ0GTs2gKTBgK/VpDXaC/314eZmm2nTtrCwu8R7io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751646929; c=relaxed/simple;
	bh=gfgsNf97a4gh+Kj/WAFR7Au3voGVBKemXRNGvFV/pQo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I3vV6QT5hJ9Magl0RFhqcbb9qnERMSNpjlqIKcOlIAnJaIibfPNuFoRJNvXvXAfPtvBQxnM9KrtJgoQiBSwvmMcMgSgjfBzpWh3c74PTPE7dPxBDSjaamrRyGXiB67oAHf1Io7Gu3KX/AbyejWTU8bYnr8vZ5ZHWIDocAM2tN7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O9Pjmo1M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O9Pjmo1M"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564B6Hh6020132
	for <linux-kernel@vger.kernel.org>; Fri, 4 Jul 2025 16:35:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FfzLENn8AreWFlLbfZZwByLrmHBduXBntme3gzzOYSg=; b=O9Pjmo1MDjryCOMZ
	QWV+ISc4yHeTnhBN6wCYr+Mryws5Gya7KyT62gT869o1Zq035KV/9fBs0buRW4iv
	eMP7+YCgnPZZ7v0Oi2RAc7f+KKrK/r1KmQjNHyeu2F1BcD65hmnKmqgl7s+E5z/I
	XW7OKxInpCkAvhjXD9qIO4dtba7sEwQq+eE4apwTM9wIMbHMeJa/9lxM9z5aQ6kb
	Mn0akcBYiYyuRDdKYXH0tJuBVJhh73o77ZXifket71vSgyk7DKuSb+DUywmTzh9J
	R+CUZa7xN733kATqiOMJqnuaZ+3H4Znps/E6+9Duu3tMMkwBTJtimqhf3Qfpq1pv
	9SwwYA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pdsh8sy1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 16:35:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c7c30d8986so300619885a.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 09:35:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751646926; x=1752251726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FfzLENn8AreWFlLbfZZwByLrmHBduXBntme3gzzOYSg=;
        b=mVXH0JO+advVKVQ0GrT+E7zDcoPPjyp2U8iIvBs8N8FNDocW5B/mt/BJywkxItcYXG
         a5D1yJCpSzrUNpY33uADUJHVx+H1hY7V6iwklkdmyEGVBVtYjh43q2D4XUwprRt3rk+V
         3yDmh4wmcI/hCNaaWnB7GcC6gdQKgsaK0Jqaa5OHgUXEG6GbCn3UL0rgmTowJXp1Mz9S
         hKsKTSwvnNPUiJgbXoO4R0L+bgP63KpWKNK/dZ+vro2olU4DOPYMkZrW6iFFsRA0mxzR
         6hMOBChV1umD5uuC+XI72sgsRKURwDrcQ7757JuzNpWo3V03qOb4VmKNxpLFZ8YMZl7N
         qRjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUI3v/5sERgr4IPyCn96Wga524mG+TAjBXh6JNw4gx+q8zMOGwlE9EIaKUkamvJDTmEjIO0gIAOQ/pT5w=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt2pgynqLHyNqsIFD/ls2TteN0eYDtXt1pzmASEWWoY0567npo
	qNLFQsuwm9G/3iXCbe05pB8120EWUeDEWvGym8MGRurrzo4/WuLEMVHHB7+i9OC6jhPh27N0Z3q
	fwd9EdltufZz3I95q0AZ4bp35p5tIXV0T4LoAgF1hX3qlDQwa4EAvnPqxWwuTXyAIub0=
X-Gm-Gg: ASbGncv7zLViX9XzVjjPdANlrP/5iiJ6Um461G7U8nZm97VOVModoAao2bcc3DJqGyt
	FrNfIT/Xgi/T4mHB38ZlG669hfeWcmtWxV8bm8qWbmpY51bD4djlTUSRO0dYGduvYTSvxgHtvyI
	r1UaM69tPTV0uEmPUpCtn2nWiquBCIw/J6GPl6E/itZMWn7HRGVtHI09+8c8e5wIN1v+K+6k6qE
	hRIQiwJzvSp9xCojYV66drhmFOOEyKS9t4qF22oew7g/bfjQT/nGbZgu5zzcjY4jWMLmMgMMnGr
	iYb++GsuB18U4NyyIbzX8t4pfbqQdrWk45o/oFZhLz2LMMRWwdiuxZisbuiVfRs9WZnu//eZmHz
	nuV9S2OlUHxOS0j4WUwZ0V0vG18JvegdAxdY=
X-Received: by 2002:a05:620a:2487:b0:7d4:5361:bb7e with SMTP id af79cd13be357-7d5ddaa7e54mr403616885a.8.1751646925608;
        Fri, 04 Jul 2025 09:35:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSiIrbj5T8wan4VzNj4OM6LypfF2CYwdOWFucarddTghF4qTmlqyWy4L3a86W6cPqRfAe6hw==
X-Received: by 2002:a05:620a:2487:b0:7d4:5361:bb7e with SMTP id af79cd13be357-7d5ddaa7e54mr403613185a.8.1751646925135;
        Fri, 04 Jul 2025 09:35:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383d33f3sm298321e87.68.2025.07.04.09.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 09:35:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 04 Jul 2025 19:35:14 +0300
Subject: [PATCH v2 02/28] interconnect: qcom: sc8180x: specify num_nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-rework-icc-v2-2-875fac996ef5@oss.qualcomm.com>
References: <20250704-rework-icc-v2-0-875fac996ef5@oss.qualcomm.com>
In-Reply-To: <20250704-rework-icc-v2-0-875fac996ef5@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1448;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=gfgsNf97a4gh+Kj/WAFR7Au3voGVBKemXRNGvFV/pQo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaALE8wL7DGkOZpUsG21ISBXejjozAU1TYZo0u
 gCLksE44X+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGgCxAAKCRCLPIo+Aiko
 1UIsB/95IXcFcAp3rJaW5SDpehXV0cFUM15twIA1QVGZv5Fl7nmafvVlVszgSMExLecPYn3itU9
 zbUe8MawNQdHFGmcUliKp9po/zHYAPA4WMopMGcBE8vC+85ngz+PgP596VO2JNJmZs4v9EwHN0A
 cC4lgR0EjRnpmyu8BcVw4+w9Kq35deM2bPFVh7y3vhOp9PrbMEyS1EE1btjvli3VooETB+UcJE2
 rCB8iS90r872pMwSfKqfVXzTgFO5Lkb46kbgkO+rpUHmFcJ2+7/WC5oPsvDiLJoystwam2UZBLl
 RMZGN/cRomBLO+lEYcMDA1eYgCEiVa0Z+FUW6EDSARXNH5R/
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDEyNiBTYWx0ZWRfX3p+xBUWFCnkK
 7RQ649MCB+QHKFJHuVZcnvtXKduQF7t1Ss5I7uGf+vNWVgHPIUQNYNMwfqKQZilmIQWEFPr4ROL
 tXMxQKp4fpicOkE3sJ0geZ46IBBxIZGLcPMZ26FtEXkJKLhsirWuEJNQaodhV151330na4hccA5
 L/InyHH7udTizU9HrwqlmxGmJiKlTPc7KeiEuSUqJYDNzBZK+8urDvHdQwXCQ5pM5lFG2d+7C4d
 pxJgAdrl5/4xiQmDSp7OG7vpsH8+mT8fBpcrUirB0re/bDzcjXHxKfgT5duqTwLtjZw7ZyzMzkN
 vgY7YdWgxKNhFm1zZiRyjymZ0fWdf7l1BHXEhADmVq4FnaRQttWNBIcJhVaR9nPZ3ofIFXapfCe
 9Tdh4ZiQJm9ypw+V9O/bgbN4wgsPvV6SNWad+Qcwb0w+O/dc34/RJVjeH3kHEXsnSRtTVDnX
X-Authority-Analysis: v=2.4 cv=RJKzH5i+ c=1 sm=1 tr=0 ts=686802ce cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=vjf1cmd32cIfnlU9i4cA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: -x07k71mRBeLXKaSkRrKrzaFfLFtF1dh
X-Proofpoint-GUID: -x07k71mRBeLXKaSkRrKrzaFfLFtF1dh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_06,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 mlxlogscore=848 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 mlxscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040126

Specify .num_nodes for several BCMs which missed this declaration.

Fixes: 04548d4e2798 ("interconnect: qcom: sc8180x: Reformat node and bcm definitions")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/interconnect/qcom/sc8180x.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/interconnect/qcom/sc8180x.c b/drivers/interconnect/qcom/sc8180x.c
index a741badaa966e0b1d0e0117f73f5d37c6ef9f19d..4dd1d2f2e8216271c15b91b726d4f0c46994ae78 100644
--- a/drivers/interconnect/qcom/sc8180x.c
+++ b/drivers/interconnect/qcom/sc8180x.c
@@ -1492,34 +1492,40 @@ static struct qcom_icc_bcm bcm_sh3 = {
 
 static struct qcom_icc_bcm bcm_sn0 = {
 	.name = "SN0",
+	.num_nodes = 1,
 	.nodes = { &slv_qns_gemnoc_sf }
 };
 
 static struct qcom_icc_bcm bcm_sn1 = {
 	.name = "SN1",
+	.num_nodes = 1,
 	.nodes = { &slv_qxs_imem }
 };
 
 static struct qcom_icc_bcm bcm_sn2 = {
 	.name = "SN2",
 	.keepalive = true,
+	.num_nodes = 1,
 	.nodes = { &slv_qns_gemnoc_gc }
 };
 
 static struct qcom_icc_bcm bcm_co2 = {
 	.name = "CO2",
+	.num_nodes = 1,
 	.nodes = { &mas_qnm_npu }
 };
 
 static struct qcom_icc_bcm bcm_sn3 = {
 	.name = "SN3",
 	.keepalive = true,
+	.num_nodes = 2,
 	.nodes = { &slv_srvc_aggre1_noc,
 		  &slv_qns_cnoc }
 };
 
 static struct qcom_icc_bcm bcm_sn4 = {
 	.name = "SN4",
+	.num_nodes = 1,
 	.nodes = { &slv_qxs_pimem }
 };
 

-- 
2.39.5

