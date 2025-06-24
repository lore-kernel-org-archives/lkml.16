Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E799825D1ED
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 22:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750805619; cv=none; b=i6+na3MOx8H59goWwO7vQSo+vtiz+V5hR7WEAXm0SCckN19yMLpegH5X5MaI3RUCyjRcH6GmkbRElie2ol9zSBRTnDxZLLz7NznZl25nCqJn+kjmuAmZKhiwjGTjGIA/YMCtkKfUvFo3tvinvO8aSTQMSU1dGF+HMALHUu12jWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750805619; c=relaxed/simple;
	bh=W0YLJNz5/2SAiapxbVHEzsfqeAiPqnoxKuIVDr0TVNM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SEuSKR4G554jHK2LD983JcaRNXwJQ8SkLn9muDzZX0d4Hcs2UvJU28LRmOJEISyTrQIDbdmUzU4chhTwIiebBqeOucUFJOYBQEyMNsBxRLr4KO91B3mp13upjiaVUqOgjVZLETzmAqLqf6UIPwCyStcZ0C62n89LVlwSeIILmFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jgTEzcUQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jgTEzcUQ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OFAgms008761
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 22:53:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3PYGYwAigTe4Xg8FBE8LvVKj2tXUXuFCqznUuXtFksk=; b=jgTEzcUQJEULxLqC
	XiSOzdXI0rEcSbcfgr0UxPef2I6p2NEV0dA49pvPKa+GHnfoKPiO20rjwmGGx+0B
	EIcAzPOFOwhqWG7OQSpig5Fg3NP5wzHIIVL8m9tHge2IBm2O35XN+q6N7eo0WB30
	gwtZPyEIJNX4PUpcuVdslWnYQ17WjP+Y2AgMpsYNhpSCZlom1s7rYeDTIptBEGWC
	Y8I5MGHFGfA6xtLwTZn6xjwErx0a6oL1uIDQSkS7x/MsW6jC04r9XlB5GScX+mcY
	rNB6T/h40ya7HpKijr70bxU/6ucoOLL4DTVPsnB154xLKnybLFZUQnas+Zfp3NdV
	PyiV7g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcmqfhe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 22:53:36 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fabd295d12so16341356d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 15:53:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750805615; x=1751410415;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3PYGYwAigTe4Xg8FBE8LvVKj2tXUXuFCqznUuXtFksk=;
        b=kyJRtnIuCeCRRfvQ+rUOWpaOTIFq9jyqD88PPGcsqWKS+5JpOPwsuXTiw1oHkKD6+b
         g7krekjWQxQYJp+k068E++9r/dYl2N0dGZYK+0OpY+LGKMBN23V/uRf1H0MPptc5ofE5
         Da8wDINVOEjb5HHjzep+C4AaK7LJH2eGkicP+JaUrn+LiwMfOenEisKLOFYItFOxIRC3
         22pMBsEreeFu/DnILlPFIuDGfpKmA+iGMkHba4mu8Vzk6FfxPts3Ymyi7X7a55cEgbK/
         ZhUTCTrA74WgD0TlsxZtlA0Dx94kd6pWwlTDu66CZQYHfg8wnNZi076dnVrpgOcKS6+C
         2eEA==
X-Forwarded-Encrypted: i=1; AJvYcCX/cgIzWjaKQ3sosXfzFPOOvoFuNMivbYnffugHeuZcBK9hCggzblPTJISfFnkKw3y7MoSiHJK8pt6bAfE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvDIK98yQjwo4py5wqDqNwe/f/b1Xw6jYEi6trWsDFrgJb0k2o
	3BYJkdCBlX+59M1fofBjPdketq1l2174JGo9683mnQ6Ns91YfbJgPYrcEh97OiPVQFlETbDTjFv
	GxE6Hqu/8GfLsrI9D1B7Sv8x0k6FDxzMHI4+vAtt5NWWqzjsFsVkzrb9nbXUqMRgd1Z6hTUNvE/
	zm0A==
X-Gm-Gg: ASbGncteVt3RKURm/xGXtXR0VcKvMBjpbwnqAgEB1lnCFK85LDznlNnNpg5cnepFCmX
	AMxSYT0UhXs00SZDC7Cv8McPSpXe5hfBewgvEpSyDXiQjp6VNPXpptlB+H0BUQJVbbh4v8ntX4A
	CddV62uRJ3GCRqOnxAZHdctZxtN81KcWA5RpoCVTSbnLX+FwILTFKo2jsikl2isPugPVakEAOPO
	Cmd+yn0y/FxaxrvMOYrRUwwvU9zRLRmAkc8qApRJSVHykrThsgNKIDItlO2mHmHt+M6sefw8UNH
	skfM82NMHI3kSh3jI+iMzttNQ41Vb+nBRh1gZ1qvBqc7S2jfwFVaeeBtJ30M6wB90KljXh0upSy
	zE6pobkXuWR40jqnIGtMIOYPY6m7+ZeDiYNI=
X-Received: by 2002:a05:620a:4050:b0:7c7:b4aa:85bc with SMTP id af79cd13be357-7d429660e04mr113561585a.17.1750805615314;
        Tue, 24 Jun 2025 15:53:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG41nDKvy8NSvFSuE+GkqRN5rEbL009m+aNzEf5Aeh6gwiaJ1JjFjqhlwEUZpFQ41nVpXLjzw==
X-Received: by 2002:a05:620a:4050:b0:7c7:b4aa:85bc with SMTP id af79cd13be357-7d429660e04mr113559785a.17.1750805614907;
        Tue, 24 Jun 2025 15:53:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b97f5980bsm17843851fa.7.2025.06.24.15.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 15:53:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 01:53:24 +0300
Subject: [PATCH v4 5/8] firmware; qcom: scm: enable QSEECOM on SC8280XP CRD
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-more-qseecom-v4-5-aacca9306cee@oss.qualcomm.com>
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
        devicetree@vger.kernel.org, linux-efi@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1087;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=W0YLJNz5/2SAiapxbVHEzsfqeAiPqnoxKuIVDr0TVNM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoWyxj0Fb4cA5VMjgnwN72vznUyGiXQ/4qhUCvh
 dIttwizDleJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaFssYwAKCRCLPIo+Aiko
 1Rm9B/9T0FUesziKizU38v76pcYTiA6w4sBqSbxkzsktq0nA2q0sSBVPUtwLWt/yJTIVokgN04M
 MFcYDkc/AS1ImaYPtlBWux5XC4SJCh5Nvbclq5BxJDQ22fkijV0vrgTxkfYyn4V1FuzupIeWoQw
 Bx2Bzktqtj5ShsO6vI99DSh0LYEp9cDpfWoQoNbfVvQnwKvRKKaoSzqe5u5sJ3O47RY2qiOQOlj
 cRIPTCdVRn/bREB+itNQJVAkcUc7TqVPcxixkQYqtMS7Th7Bdk0bxLnR8ru6bEsFnVz5bXKEmaI
 ynV0525X9ouUotWTbiY7J8Vn41M2wQYrYfMAUj6zMaXXHDub
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: a-0U3ZO5EWP1rJWFlBzOhT_FHANw50SB
X-Proofpoint-ORIG-GUID: a-0U3ZO5EWP1rJWFlBzOhT_FHANw50SB
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=685b2c71 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=GpPnMnrImHjYsJApwW0A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDE4MiBTYWx0ZWRfX2uuzWvUTlt1N
 DmKFaWi/TNjitHlfMcPW5pqXOfJFDcWtotBtScopoNnAyySe5NGwiSxffWUcTti+seGGdkGgdV+
 qze92iP4VgFAdbXXo4NWJpcZB2ouX+Ib0pFSKJLk6jfBF609HK9v5XImd2pjv3eESfpzhVMdBjS
 5CaIZ03m20l1cy2rEXglSy1BD9KBl2IxVEWgyS+cGDzgw/lChmOQdNb7wmzBqemYdLA/7IPDpr3
 uL6sU2ue2/FbvbZ29eil8aqwajo+wXOFEOZ9nwP3KwQXLp2HoLyLCoPqmMfQC2G2GJVTlhG7v6w
 GIIt2R84KfRI2WVNyEDtdZgrdKc8BvmwhTuhom0n1geQisdZThEJX5bY4LM/TCOViGwRucYZElh
 +WsPRTvq3LvLdKmsXeqj5pCVm3urPoKIz+cAcWPRKlTPW4BmPYnmL9vAIoHJ0AErvVcMcjaq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506240182

As reported by Johan, this platform also doesn't currently support
updating of the UEFI variables. In preparation to reworking match list
for QSEECOM mark this platform as supporting QSEECOM with R/O UEFI
variables.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index dbb77c3f69ddaa931e7faa73911207a83634bda1..27ef2497089e11b5a902d949de2e16b7443a2ca4 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2005,6 +2005,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "microsoft,romulus13", },
 	{ .compatible = "microsoft,romulus15", },
 	{ .compatible = "qcom,sc8180x-primus" },
+	{ .compatible = "qcom,sc8280xp-crd", .data = &qcom_qseecom_ro_uefi, },
 	{ .compatible = "qcom,x1e001de-devkit" },
 	{ .compatible = "qcom,x1e80100-crd" },
 	{ .compatible = "qcom,x1e80100-qcp" },

-- 
2.39.5

