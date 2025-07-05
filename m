Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB61F1DE8BB
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 16:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751731722; cv=none; b=MAkRw3ly3KRievSYBBWneNnGB2fZkxeL3Ebfan/twlGJpMm0h2LFkBUaDJ7yA7vBS2cb1MtDupL1HXS+JHbWOkDSM32J7myJqdEbnlPAwr/CDWOHz5oSeMen2n4tysBxI1TIEtMIefGdzhSfJChDjyhq8pwW5FYxIb40EeTtVvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751731722; c=relaxed/simple;
	bh=1nHVCwgtw92YQiqaocxAdN057/gIPobtpT6EJm/ltEE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=e9Y9S+3IZF8cwVbdkIhitm/LVvP5r0LgB/Mk+QH93qWjt0+9IsZnqMdO51nXbsVxO4lJj514uoJUUESTNZJcfX/wiTSDxVvmGk06A/TlgM4OIs2EZavQ6FcJIYj5kJWNEXLuDHKri3ybNOHxtTSM8b4QuHBIQdTwUudH1jC6XFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qti5XGev; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qti5XGev"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 565FqadA007146
	for <linux-kernel@vger.kernel.org>; Sat, 5 Jul 2025 16:08:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VQQYkVndGStCPetb0u9KBp
	kX6kw9yPI24YEYcxWZEdI=; b=Qti5XGev3wB1tQ9SAzU+dV5xT98VKholViCmqq
	yIB2Tu+/ihCmC9cabslWbqFrQPI6J9bR28P4m9n0nrfvBkbkuVEt0CpHrK3ouUgV
	dBIz1M22Y3DrsA3m7fTCd+jkHxlrbjgzswnb7kCu9rraGE+1xUW+g7LfffMTeQAZ
	bjl5N2zlYCQ6GL4NTtf4cjjOWtSSrfUaS7PmVZDBTkdrUIXNLFDPwwP2N7juCpxz
	ctDHXqIHXJsgQz1D80O7js6ddYQ6j0GMwhmGcbAUD9FcGYfqQnnP0qHx5WFa1BuB
	DLKYJ4HhKebjwPjnK/Ab9Vw2SpPHk1n38t6Jnq5TZb5De2Yw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pvtk1akg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 16:08:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7caee990721so368456885a.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 09:08:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751731718; x=1752336518;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VQQYkVndGStCPetb0u9KBpkX6kw9yPI24YEYcxWZEdI=;
        b=hrn8NrJNlVdt5fD5YnkIU9xIfH/IoTO3OQ8jY/Aw1RV6C89LK44oWZeg3hEyMroSRl
         U+Pjd9seq5TwJIcnRAnWUCxv7ybIwnDUp141K1/voMNNBU0LIJQbKOpSYQa6sCX59pjC
         8docVe6Im45CTozTBBNJvoL5Xz95egZEUUqh715qo9R1gcwNhkVz1LsJztIB9Z4byrak
         +hm3iLJP7MHt7yZiZIuHNjyoXDYpr/3fIeTXYQhAMW7LCTP/xFq9zQGlG+dIP+IEfXMg
         P8bSklpIAQKQh7EpC5JTf2OKk1jrM1zZEw7ByRA1C8QiVGiliJEf+X/ztUw6mc9lxRI0
         7Zxg==
X-Forwarded-Encrypted: i=1; AJvYcCVelZpO9/2FnseIOpQw1NMLAe+8ecyQQONADEroi3rXNMtNF4El0iUJvkJTtK/ovusa67FL4vIoX8DmH8Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwphC/Z2wYFmzq/gSUDoMGMCXrrWspMCYOG+EBPqr/fLwYLa6xc
	3R6P//Zah5L0vCwvsTarbure8d5PHwc6TkufBD+CG8B4YWQU5U3peRaxcOFgs/0PbePOqgjEUKb
	6PobRqQQmw3cvrNw7DlQluLJixqeyXbjbC+I8+DYsJ1azkByYXV5h3zKyTM1bf8FiV24=
X-Gm-Gg: ASbGnctTLm6vaMPWGsGyuotn8jLjNupwP8gU4V5Vfpgzycmc+EJfhJM3YukMSQPuEqE
	uPi75z0kWoZeFX8uy5U9KTt47YLw8nVqUoJFWjlvVFYkJhIDVRXzM5s3lXuBitde9LOlwVckjXO
	0CqkeQmxuioX5kf/EWKAe7cfYKtB4VU+jQ4bfdYvxC64kR/ln2eP8cFjGGDd6gwQkoCZ3Z40sCI
	LEHux5bhHQ9mVr+sfrXUiFvF78e+CtK/CrP8QWIAcw7mggG0I6Z+/LVPJqrqKrydDYSy4Oprpem
	hlU3yYTYsGQI96Dt1SanMy0huSCrcY/PPySuv+FD8ZNsYoFJo6tHxjL3RA2sW6rPHr9l/nifNuu
	Lcqd5/3noxVa3pQzZYi47mrDzmLq98jDzuGg=
X-Received: by 2002:a05:620a:2b89:b0:7d4:4b92:85e4 with SMTP id af79cd13be357-7d5dcc5e457mr896830085a.14.1751731718477;
        Sat, 05 Jul 2025 09:08:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4B2sgfTjCGK/I65unoqaLkmK0M7K7ayKlHuPECNRLfJUUTIjG5F1QyzFuSBOHTi3v6JDljA==
X-Received: by 2002:a05:620a:2b89:b0:7d4:4b92:85e4 with SMTP id af79cd13be357-7d5dcc5e457mr896825685a.14.1751731717791;
        Sat, 05 Jul 2025 09:08:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55638494f6dsm622779e87.123.2025.07.05.09.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 09:08:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 05 Jul 2025 19:08:33 +0300
Subject: [PATCH v2] iommu/arm-smmu: disable PRR on SM8250
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-iommu-fix-prr-v2-1-406fecc37cf8@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAABOaWgC/3WMyw6CQAxFf4V0bck8GEhc+R+GBQ6DNBEGO0I0Z
 P7dyt5Nk9N779khBaaQ4FzswGGjRHEWMKcC/NjN94DUC4NRxqlGOaQ4TSsO9MaFGWulKqdvure
 qAtksHCQ6fNdWeKT0ivw59Jv+ff+ZNo0aw9BIaG3ttL/ElMrn2j289Eo50OacvyaKeWCxAAAA
X-Change-ID: 20250705-iommu-fix-prr-600451b1d304
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1682;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=1nHVCwgtw92YQiqaocxAdN057/gIPobtpT6EJm/ltEE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaU4EPzKa9ZLkC7fTqOEgSArVBZofNCTdp/Sb5
 6FwPKWtOt+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGlOBAAKCRCLPIo+Aiko
 1V4XB/9PrB6vncaBwBi4dhAA54NytUNQgDHc1uBL88Sca8J1uPGNjP3dU83pKyS3dPTzWNbWHJi
 P3qCHpO7IpOhZcTOxn6JKQbKHGPbS72HwPfbRcvMyQxau8bTHH56A7zy4XMfbStA460Rv9yXwa3
 q2xwWoZmQwz2UDBAa5VcAHulN4szj+eIHAgAqZRxiD5E9qc519YrQ2WtRGuDtv0Kq9mmVL6Q5wg
 I0OpVpxZsTTEsN6KLKTdEwYISyDMKfyrp0WZrSNmBGxmabvnTGaal/jJ4wZlWFDvxJC4LHBmhn+
 XUC1KVZ6mIhKg1QxzophRU7GtdVBmUqpFs3d9UZlhP9w97dj
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDEwNiBTYWx0ZWRfX95VffIp+/807
 JLppuKRo8O/qhhmnwksoDQw1VYrc8nWLyJQogCSW7VQI0cCwbw+D+IB/Efyb1dnwvJfROyEqUFl
 mrIbAIcgXTMKFsEuQZtekCSfWIzhVRnlIJrfwiY0eOEzce0lXiUxnxozMTnT4PsrVSv4fOOLV6Z
 h1/UXSpTvqeAh+6RhR1MYDOqQl8QNmhNqUsJ0RsZC4LyxsNsMfajCkw5IogB1YAyl90pvq4+kcW
 aXBNXd1sHkgOhjJ+tWt4EbpNoIfKdBbX5GCaRQxLxZN1pjnpDRNF0Aa9Zvo5wGTI1KzvZ/hh8Ye
 oF7rGY6b8cfa0p583I1nWNHxxypXreKTcr8O11uxoFW5xMwqrpU4cZQswVL/FfAQoiQ353p9Uvf
 +oyCXrbXOemAy5Qu72XExask+ddDhus3b7sNYtaV3zokq3stCr1578S4mG1PstzXWuFGBAlm
X-Authority-Analysis: v=2.4 cv=Vq0jA/2n c=1 sm=1 tr=0 ts=68694e07 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=RJW-fAkOStluX_mlE74A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: EaJv_-w_AfiU9wmjFb0O4yWH5FypPMx_
X-Proofpoint-GUID: EaJv_-w_AfiU9wmjFb0O4yWH5FypPMx_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0
 suspectscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507050106

On SM8250 / QRB5165-RB5 using PRR bits resets the device, most likely
because of the hyp limitations. Disable PRR support on that platform.

Fixes: 7f2ef1bfc758 ("iommu/arm-smmu: Add support for PRR bit setup")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
I currently don't have access to other devices from these generations.
It might be necessary to apply the same workaround to other platforms.
---
Changes in v2:
- Simplify the workaround as the issue seems to be limited to SM8250
  only (Rob)
- Link to v1: https://lore.kernel.org/r/20250705-iommu-fix-prr-v1-1-ef725033651c@oss.qualcomm.com
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 62874b18f6459ad9a8b0542ab81c24e3e745c53d..53d88646476e9f193a6275d9c3ee3d084c215362 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -355,7 +355,8 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 	priv->set_prr_addr = NULL;
 
 	if (of_device_is_compatible(np, "qcom,smmu-500") &&
-			of_device_is_compatible(np, "qcom,adreno-smmu")) {
+	    !of_device_is_compatible(np, "qcom,sm8250-smmu-500") &&
+	    of_device_is_compatible(np, "qcom,adreno-smmu")) {
 		priv->set_prr_bit = qcom_adreno_smmu_set_prr_bit;
 		priv->set_prr_addr = qcom_adreno_smmu_set_prr_addr;
 	}

---
base-commit: 7244e36657076b597ac21d118be9c0b0f15fc622
change-id: 20250705-iommu-fix-prr-600451b1d304

Best regards,
-- 
With best wishes
Dmitry

