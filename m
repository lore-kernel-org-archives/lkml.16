Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E427925D1E4
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 22:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750805617; cv=none; b=deZwQtZAvN5795htaoxRAXe17j1H9IZNJJRt1Uxq7Y6Hp42FCcCD8AV0R7wvXWR5GQZmAT29ssCDcqoVAV8Ex2gIlragNcCxdf8ZY6MHLYhkKD8poshL+PkFdYSGIlLbOOOLO2kukfNmKd4xQ1OyLzoWsjrME0/5IZ0B/CMRRow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750805617; c=relaxed/simple;
	bh=v3Son85QFIExU23XS9BqES7WnyoRqHF3ETTCsPhCxq4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eNq72LLuFOIdkGwHOwP7Rtq3z5djAGDlZKC8kuYXJa/QMH02Umby65sYaDdJJroSYVORVrnPIhzMFhj/OkhRkayn9C2x1OZBd/mgIAxQUxZ0YOZpyQ+DsnHGpGN+qhjh2ESU8kMBIeKxkHeTL65BqV0vmVOr77vOjgTS5oivzME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=heQ7cSu0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="heQ7cSu0"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OG4mQo013198
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 22:53:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i5QrZxszEjgpMGIfh5fARAtG0+hpGYQPrZxwwktP520=; b=heQ7cSu0oLs/xQYc
	+cquGbEhuUdGrXFPF+szDj46zHZlQgDcuGBQ2qWmJiwglalNK6jLjmJdm8t7R5On
	UGU3dOG0x39by6qlsydQR1SYc79anY81Kw/6TkFdJuxMqU5RD7oCtcMB44DM0Df8
	MA8Nqm4cs5KGSKeBdE6OU3ly0Ioy24OR5tL3G0ceAPaKjj+HZkzkMTUKWwCKLYSi
	RR7W7HaZWN5DE9qtqNqrs+6OPyCdEuB/nfquGeqA+O+/AKSC2zCR4IPmDl5+YZsR
	UtpTi1jZIH8Mi3LA8QK+VfPAl6orMc4tVxawF9a8DEcI5V6LGvWx3f2LcsK64vL+
	kuUs8Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm1vcrs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 22:53:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7ceb5b5140eso147095385a.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 15:53:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750805614; x=1751410414;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i5QrZxszEjgpMGIfh5fARAtG0+hpGYQPrZxwwktP520=;
        b=acH+5TgKuAYY9209M5xkrbnY5kMn5OOMECBmqn3Jo+XWMufhG8DKNHvpfJoKqWcfJk
         8l2WYeaj5KauPwXV7Q9pVW2maOVfVVASJBAZQzRxdfdh1ziNq3z1mNwMWI/EBaA9A44A
         UipiHF9QZAaIG0mgj1E8bqX6gcw1AAWu0pYALfSHfFg/yH4/yaGsMiaiXLWp1L1Rjv/N
         RhVbmMDEZ6MAJlYCb69Qdd4vNWOn7caLwCuh+p9Yv/NwqIwkXAdejLuysX8mLni6ezXv
         8ofwrZbEoWUSB9S/xhK1g9rHyOxLHa7fT9xOj1LBfJcF6fjHZaKWbJzGujcO/lcWvb5B
         4kWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKvZKqeB6tBtqqHxn67ZwxEn6/hh79tlzCWAy4B6ULFRYV4Q3fuzs1JZ3BME0BmXJJnZ7QphHaPAFZKwU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyU7NWxWTTIYV9I51+Yv5wjMQDQ8RteDViMKOZXO04KitqKtAcf
	To6RLquCI+RbNTdxXYIznc/58HN/S3pSXCFaR6X5TDmSmwHK1VythIflT1gfDsbOky8l0kCrFnv
	wp4UBdtM97aair1Nf5NTb50qOx0p2nqNzArdtgd2kgALRCwpr6hO48CO8daafwh7LZzs=
X-Gm-Gg: ASbGncvigTcmW9ByNXoxD+/LuV50GmpGBoewkXqGncPOembAUjNO7w44Kh46ByJS1XI
	LTvmjAvWqccmnkLP0oLl075v7dfuTVCK41VVq05Isr8c+4T1lQxjxPEA9m8efDdJEp/hKxyEcA8
	6HkZyFBT0RrHN1gBgou9yKqyl/L4d53I5XlbgpiMvzxdMaKsx3GrRpT/fAwCMLyjYn+FFAoHwuE
	BPQZjYw9sRHKkttY37UV0nMDC8Yms4rLhEES+sYZFBPT3IhuXkH8eJSrClBCVtbGJxJa0oKA/MZ
	245GNiySu4F94cRK2jwIv3xpOAxi1dVCLwMnKl/HnWjSSrV4JbucspXTaY/GsRfvScMWH2l1G4H
	GvXPRvn+YjurBlmKKrD+VbZUc2jnPqWY2rS4=
X-Received: by 2002:a05:620a:199b:b0:7d3:9025:5db7 with SMTP id af79cd13be357-7d4296d4ca0mr130763785a.20.1750805613986;
        Tue, 24 Jun 2025 15:53:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5EFwVBWDWSw9S4MgYn2dQZK8Uz4Z0djvYMBXDETMw9mP0euPEYPNpMg3/H64UETYAZ3h5cQ==
X-Received: by 2002:a05:620a:199b:b0:7d3:9025:5db7 with SMTP id af79cd13be357-7d4296d4ca0mr130760585a.20.1750805613598;
        Tue, 24 Jun 2025 15:53:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b97f5980bsm17843851fa.7.2025.06.24.15.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 15:53:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 01:53:23 +0300
Subject: [PATCH v4 4/8] firmware: qcom: enable QSEECOM on Lenovo Yoga C630
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-more-qseecom-v4-4-aacca9306cee@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1983;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=v3Son85QFIExU23XS9BqES7WnyoRqHF3ETTCsPhCxq4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoWyxjXBPS2NQyy/aPYTJBbpm7VMncF0PvFE9DS
 A+loe3omLCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaFssYwAKCRCLPIo+Aiko
 1Q4CCACdhWwyMQh739/HEVce9ToBUSrcJ//fz+OcGTxMRYVSWTm6naDduwMxd/VQsacY2TrJQsC
 95EWAB/b9rF4WjoWka9Sj7f5NEuxSWXpnSrjZfDa/JDt2OUqqdMF2erQv85jb7o3R7vaKY3FvCM
 IPeo+14nP0vC5Y+GbojPeau4kwzKtOvKm8uekRrh5n+MwJ+pvVKtcmEL6T72JGx8YOeeHZ140E9
 0vehQvCBG1AxM+EFrYH/SvozwuPR7uMhfJjC93NnNmYYQ8IbwARe8yMVTRvCSek/dfbZXj/rW8F
 AlnLiMxWCq5ptbdPofUcm2M5D05Mr2YBULg2pn/+th//21s0
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685b2c6e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=WOWBbpsv7UBti09GJWYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 8kjgVBajXQlvDBD2oFKfqgBqvTsUAuu-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDE4MiBTYWx0ZWRfX9ucptfgV04u6
 s+gFN8I9Ek4I1aPS5rnoRI26zKqu34082TIwqeXf+83r+rjlfwicXPxwCFrLp4jpAnDjercBoJt
 TanrBwmTxdjoppmWlSk0sy7NbBGStBFmuHaDKA9zDowNvsNuYUXJFJnKtPIFt1vS5aBhS6/WaQP
 z5sa8ZbCJVKi9zJrZnA5VPGJ7HmZtrwws//n2YAzuDe5LUtCplsIVoVSaDwDMYUETLXG+xku1GE
 SSZgi8CFWDgeWpSEjqoOCjfHrAibYj2tQ/imxfd2D7FWJ54uMqO9r62ziBmSdsV2ILOI/o9ZlCu
 kRQUIhHOND20y8aGlUtKVuBfxk1IdDN4M+7doIMKd+XhONO1fHotKKxkcyF1Ox3+meVTCbht8qy
 4KIfSt4VcDTW5W++tlM3G+los3aD68Hw8dgvgcXt1VTNfUQ/YwuFoIkTmxu/xw7J7sF1JcBc
X-Proofpoint-ORIG-GUID: 8kjgVBajXQlvDBD2oFKfqgBqvTsUAuu-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240182

QSEECOM driver end UEFI vars access works on the Lenovo Yoga C630. This
platform has only one storage (UFS) shared between Linux and SecureOS
world, uefisecapp can not update variables directly. It requires some
additional steps in order to update variables, which are not yet reverse
engineered.

Enable the QSEECOM device on that laptop and set up a quirk, making UEFI
vars read-only.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index fc2ed02dbd30b389b5058f5cac70c184df7ca873..dbb77c3f69ddaa931e7faa73911207a83634bda1 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -13,6 +13,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
 #include <linux/export.h>
+#include <linux/firmware/qcom/qcom_qseecom.h>
 #include <linux/firmware/qcom/qcom_scm.h>
 #include <linux/firmware/qcom/qcom_tzmem.h>
 #include <linux/init.h>
@@ -1980,6 +1981,8 @@ int qcom_scm_qseecom_app_send(u32 app_id, void *req, size_t req_size,
 }
 EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_send);
 
+static unsigned long qcom_qseecom_ro_uefi = QCOM_QSEECOM_QUIRK_RO_UEFIVARS;
+
 /*
  * We do not yet support re-entrant calls via the qseecom interface. To prevent
  + any potential issues with this, only allow validated machines for now.
@@ -1995,6 +1998,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "lenovo,flex-5g" },
 	{ .compatible = "lenovo,thinkpad-t14s" },
 	{ .compatible = "lenovo,thinkpad-x13s", },
+	{ .compatible = "lenovo,yoga-c630", .data = &qcom_qseecom_ro_uefi, },
 	{ .compatible = "lenovo,yoga-slim7x" },
 	{ .compatible = "microsoft,arcata", },
 	{ .compatible = "microsoft,blackrock" },

-- 
2.39.5

