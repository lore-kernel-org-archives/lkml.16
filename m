Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25226231CB0
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 02:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750731255; cv=none; b=B7WcGdFytlzZJ08Vvkn7dagzAvOlk/H1UmCn+mAsz/B2ATPTIur76sBzNmzA4QH9ui5jumdCIqtlyb0Oc2YF01o4OCmAhJhcRsQXF1EvdC1FACZd+rr9unuruuYAtVPRqdhkneUzrXpblTdE1z443ChBvO2fvwhvCBq1o8jGQQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750731255; c=relaxed/simple;
	bh=W0YLJNz5/2SAiapxbVHEzsfqeAiPqnoxKuIVDr0TVNM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F6Rpoz3okKBviDM6eRGImZpVWOczGzvaU5ISNQjWIP1NQtqkS37B0SvUmTBpWm5zubFtyF+mgR8u2vKNtYaRm/4fgxTMD/b+rFXpTFQqcPsvJhKs+jjtJ5FlvOKlcNHMOM6/CF7ukYVL8PkLCINUHzXxiF4teL4cCqzHsDlz3ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BrGSRHkJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BrGSRHkJ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NKlpnB022985
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 02:14:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3PYGYwAigTe4Xg8FBE8LvVKj2tXUXuFCqznUuXtFksk=; b=BrGSRHkJ+ZVhmIaU
	VvgViOfBXB/1beYYf7lneNmkHpG5f0ibRiCfjd85pqXZ0pJ/YdZ6W+4JMZ1PwHJW
	WhDCkkgWslGfbdaK1kEwOkxBXv9pkw7pFJMOtovb01PfvP1Sgl9H+cxBEvBT0mii
	b6HA6A8tj/OPe/8RtUWYJ3+pDT8wVPaOpbqP+5vAw2zaRn3EX0Ym4iyh6H4DcHlN
	kJSfT9IoGdkUyqmYXDbb0VgiNrijVqKfbV7Ec55FW+LFJg6fyEaYMr85t3rpRfzo
	+OsH7u/XvsyRbj+tHyo7t3SCgvMev6SD44czfjWYPcdwQdIx+6reLfsTCwD/kOCk
	6/0nkQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bgahdw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 02:14:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d15c975968so745147685a.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 19:14:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750731252; x=1751336052;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3PYGYwAigTe4Xg8FBE8LvVKj2tXUXuFCqznUuXtFksk=;
        b=cNXh6Vn3VdQHUKIBybd8DOErkguaK/xBnBHF38ET+F0n1nBExF9ip4aJFzUEGUOfA/
         kPcBvprvhT62Doeeloi9V6J60vlS2pWV6s2GBGQk2/7N9hBlHdXX9CPMj9GQxGULkGk3
         uNNFgJ3Q2Vpusl6P4oiZIbAp0utcb/fOumnOgGa4qLmoBoxlxjHgtbjrEwW5H7D+W9sy
         b5Z0+mUjttkTndPx+Q9Sj9szkqQUsw/wxB5tIh0UMNETrKN7YVeW3SksJBMQcLXkUzxM
         bN0uvRwpVcGGm1cHrd4u1UbWtVaDWX5viOKWdhOgtABAmECrc+Usz2I/oBerdGQ0OOgc
         yhIg==
X-Forwarded-Encrypted: i=1; AJvYcCW7TwkfjUOxH7GPXiYkxlYVV9jfmxywxXRMiuRo2nvAKYrzcyYDr38NlALtHk6FuDqQp4rbSulfqBlj6s4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yylho77iuPsLi8qLRsfk1BGgRZmcqSOcbYYfAQuijZ7MzYp+GzJ
	ZFETDs1rntiwScuEBr81eIGnV1jsLZbQMDmHuSBMSzwcmoB5h7TkIBrMOy/Bps7ePJ0Z38YgEqC
	Kit8/NZc3UfKeVPnTQw/9cTGi8Y12xYVeZPL42gCWuVm778JTF3pnVwLcCreKQZpKq7s=
X-Gm-Gg: ASbGncuvY4+3X7l+eiE/CnNe5QEe7R4pWKFw2ATrlor4FWmRnxZ1zXeAtlQ/aoV2YLP
	9Os3zllYT2R9vFXynk06rN1G+rSzGqbGXI1pSpVMwS032OV5c5dQbOcsxHGBInA/jPx3fcaF1+8
	8kwomXOy1URyG3tn0+jX4PZpncrS0U0ST6DEsjNleSch2obmshwx/4ZkKnYBv/ck9Jrts0I5KAd
	PksYJnNO0tlT+zf0KtVAPlwQ/2OGdYa9+sWhzU0k/f2wO1A6jYBFP5/c5IAvsOxZQCXQHdejH6K
	frCwSdirRMzpCLwcVe39LaKYcoImL3Qz7gQOx6Lilpji/0WJjApMoqpc/3PzJ1Ed6iFkyaFvgRs
	+wCvGCVilyhrGiqEKFUSSho5R9Ly338D+6B8=
X-Received: by 2002:a05:620a:4144:b0:7d3:b3e1:af51 with SMTP id af79cd13be357-7d3f99369e0mr1998466985a.29.1750731252354;
        Mon, 23 Jun 2025 19:14:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHT/ySO9NQqMHT/LWZy4N2MmWqYkkmw6tiI4yElX8MxWZ75E2UpHJaJIjsjDu3cbO89+VOoCg==
X-Received: by 2002:a05:620a:4144:b0:7d3:b3e1:af51 with SMTP id af79cd13be357-7d3f99369e0mr1998465885a.29.1750731251969;
        Mon, 23 Jun 2025 19:14:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41446e2sm1637764e87.32.2025.06.23.19.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 19:14:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 24 Jun 2025 05:13:56 +0300
Subject: [PATCH v3 5/8] firmware; qcom: scm: enable QSEECOM on SC8280XP CRD
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-more-qseecom-v3-5-95205cd88cc2@oss.qualcomm.com>
References: <20250624-more-qseecom-v3-0-95205cd88cc2@oss.qualcomm.com>
In-Reply-To: <20250624-more-qseecom-v3-0-95205cd88cc2@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoWgnmzxRFX3uMqrpeWnKCOEbYAqwAQm0shNR9N
 YZQHH4LNxWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaFoJ5gAKCRCLPIo+Aiko
 1fBVB/91ODQjaD57ly/5cNAYMElD9ll89OMq6NlKN0qrBbfuJ1bY2gy3jhxt9N4S5WyZRXMD/ML
 l9qXjPgucZH/DwUrA8oZeucUpf838fm3Ya5R/x0OeFLa3Tc0EGL5ApEeJmoShPuAebi9qaS+BuE
 lqxglI85n5Y3eVwKRPOkhCGNLgiSF1ZcXG9tPiW2ViY9j69ECG7Jrb/SJNOeQj54kXg4RN+XzUu
 yAUtaxRNLgETNHQS8NGTXaeBenNw91u5ZlyfemMtyHXlrgqDRB4xk4b8YkC8/+We1HguJLg0Nns
 qdNl29k53TzYzO0sHg1U1r/mxlQ5nS14SZmFXbaNSBikfI3c
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Tz2MGCmIwYMYfYuwkQ-xmpigludXmI_4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDAxNyBTYWx0ZWRfX7/M1OKiYgg8/
 46N0a3SXFTJ8JIy8wgPWL4pLjQBtE6+sWZscS9UeLZCgX1/osWcn0NYeR8ZRLz29ch6ntRc4jKJ
 J6Rq6QfxkyyeDnK7xJYfXIatyOSXmpZ7GXpZFw1WydQLDiualUHtjPr9CbW62u//g/4gI1Kj1fM
 2QQ57lW2Bg0tamprmgo5HgPE86yJJ/NKpeS2gR7a1Q02F15ODiMpojDtKlOv4T1zZPgmDGNAXr0
 p7Nj0dHAuJtcOWmxiEz2smRWfxA36dAwWtwmB+dIHoLQkXNCwQ8NFP3D7OztIvTsxQhaZvNTCJL
 4qqvMbKRwD03Egh6edyNGDJ6UNTNTazmYuByYeriBsHcFe/IxleZSLxQ5GS3RSHiBu/qqqQV1r/
 Yst4l1fgo9rJyLGrEZmVk0sBoTVnkDebBUrpns2FodbSqx3yBgCg81eXbiJFjlc7YDe1HNEe
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685a09f5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=GpPnMnrImHjYsJApwW0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: Tz2MGCmIwYMYfYuwkQ-xmpigludXmI_4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240017

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

