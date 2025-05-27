Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776FA1FDE3D
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 06:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748329046; cv=none; b=AY2gDpWqTA0+ict7Y8N87Rm5vZ79WeUH0wdYo50uLwNYvK7V4M5oRtnr5mlcXd+bMhVv8W/BBQ7ndSV7/gj93z52rOQpKQH4hFvKS17Xu3kGq0oiMNWwwBOeP+PnWdkWrwo9l+siWl0ZOjD89QuVqGSe00RKXUnihRy549j2nc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748329046; c=relaxed/simple;
	bh=6ti6WK3uD8rSgx1+MJL0OTBiXFAh+a7/YuzQpoRdCak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QvVo0nwbW5+IsvXZOvujdWk+Dxu+7Q8xdblvkzNPNLFfZAX9ksWz9u5DzABnlj/sPyQBKl/rd625ALJ+tnJOJoCbxN/baR/jc7OlNIgc4DZDjirwHdt1dy1i/3kIuwY0i+V700NZobcheh/deos9ME87q2aCIBtNmd51BVcFerw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XffPuxZX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XffPuxZX"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54QMjvLc011088
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 06:57:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jRajMmtFgaOC/UV0OjMPo2r2V0kfVealm1KPcyRc9Q0=; b=XffPuxZXV5ikZ74Y
	FE0lmCxHjo5s/ON9M906LHyjYA91qSos6chagS5LD9bgRB62zl3yWYtEcImewnz/
	S4wlFc/vLAnvfOVapph/himlXO/RPYFV4xg00rsR8xX9nFAK0yA6u6jCNKdwkYbX
	Yhp7AR3r/ijo4s7UNRRWSiCTi92E1iNwcAVtTgC9k6o4fseGGBVXhggt43xCn2or
	xrg2hSAQBwBmWXkJ4SwxkLqUF51hEJ4m9k7nQ4EnhpP9vQrrKYJGaGmCASfVmume
	QaHERKsVyXxFNQVJW49QLABQFu4wlSb2Z2w4MjHj4SyBZO5RV2JVtudl5MY1K5Le
	UqcMog==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6b5p0q6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 06:57:17 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-742951722b3so2469675b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 23:57:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748329037; x=1748933837;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jRajMmtFgaOC/UV0OjMPo2r2V0kfVealm1KPcyRc9Q0=;
        b=W3TKgwvYEzTGnJ228v70CbYeVmy1lTJyoZ8jP2nxEn/JtQcHLjUi1mAkaSxmrxpTES
         nt96A5X8j5K+Q2LZAC57QpX5gkGvx7o7tWABMRWBZf39Jio0/t5TRx161Duw5tGRtkah
         UAITvz3FduXDLdQgYUkHB2dM6VT59lM0W9Ah8XjKhXbwjHO3hy4R1Fd5yaNW7x8nQm2Z
         5dWWhf5imL0JCG2/98Z3A/fqUAIa7GalYjohJnidcvXYdhkOv0mFtw92uhVStFmmc1DF
         4wd5FVsHeZnVXnneNHaCNiFfw3fPZjCnIG83+ccpT0eAu1Q5Go++8PdaEfsz8IsfrwN9
         uqhw==
X-Forwarded-Encrypted: i=1; AJvYcCUUxJhYokwK4WBuml295gJG2TYEurCfbhdWfrU/gss+WkdoqguYUebFEu84zBsRBSBKJGipPnQ+Y+Nqz0U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTuzI8sfPcwkzuzjSohHlDAph5QW8/WjV2AjkDgVMjZi6sHg5z
	5KY61XHNa1rffQZcFPapr78LmXRbQlU5yAjf/sGRknJsACYIOAUfoveUB1a9G51a41IIg0++kzJ
	hAIOltQrpGp8lnLAd4m7qCcBhJ0dKAjZ/p5FPIz7+MitMPh7T3w/JENnNretgQSIB7g==
X-Gm-Gg: ASbGncso1epFqMD7DAcipLSPRXjkKTUKU2fjtbOdA10E1N3PwVzpRECodVCHqJ8+rqi
	1KVYX/wF+ua5A5jIkqxBw7VtqT8TvE/P+jQKXWrXGUQ8i24rYVTbhrcbTHOldLuaR1qjxzht8yT
	mZ4Pj3m2ePoUfvYmdJxGQ5lLFFz80JPO7GAqA2O9U2VzIVELEXWycmehtGWm6cZnOEQvJpvhiqp
	rLviTebfbB9RcN6+gXIvsJInKPr9F9y5sHGpg1bD+7oD7G8o9yrVG4ywmO0m6JbxuJhoIpZZjpf
	5rHhVyM/wcrM9jdSfAukCQFg7lCBbPnAu4VlXGWiFparukYQjOj9LrS0bSaabVCDDAUUfr4=
X-Received: by 2002:a05:6a00:a94:b0:736:5f75:4a44 with SMTP id d2e1a72fcca58-745fe0589e6mr14944423b3a.22.1748329036980;
        Mon, 26 May 2025 23:57:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuN5nvo50ha0rqfJNyLS1nF/5MRTlYqa+OqS281BYZkxySrFxKujXSx05vTLcA79D9Jnj30g==
X-Received: by 2002:a05:6a00:a94:b0:736:5f75:4a44 with SMTP id d2e1a72fcca58-745fe0589e6mr14944391b3a.22.1748329036568;
        Mon, 26 May 2025 23:57:16 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970954asm18037286b3a.46.2025.05.26.23.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 23:57:15 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 26 May 2025 23:56:46 -0700
Subject: [PATCH v5 01/12] tee: allow a driver to allocate a tee_device
 without a pool
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-1-024e3221b0b9@oss.qualcomm.com>
References: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-0-024e3221b0b9@oss.qualcomm.com>
In-Reply-To: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-0-024e3221b0b9@oss.qualcomm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Apurupa Pattapu <quic_apurupa@quicinc.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Authority-Analysis: v=2.4 cv=ZcodNtVA c=1 sm=1 tr=0 ts=6835624d cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=1atmPuGhRQHGwWkYLZIA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA1NCBTYWx0ZWRfX8qOcpADnb1rA
 oLtQXzqdnXJZ9+HERfUooWsy020jyLPKqUjrHPvgVyweiALDf2JwzNb8swvIJnnWG9A6SmVomRd
 KZSFU/cQGq3k7UEFLUSaA9Agjh3ftduaDm35/8hInYpuogoDihgfYy3r0vdLUFW/m8TZBQHgnhO
 GLpVk8O+4gYhaq/Ff5LYrteirsWgNK4lHp4CHSRfhtMuqEx5kCv9cpVZIHuTKeBO9e5gyKyHUzl
 S520+K+ZyeT3M4DtBsR+gicDq08hFss/vhGUsruMKQuE3Hf2fCIJ9s+TdBsKWhan8KQW4yVN0bb
 iDNYLQ8oR3IHt2utmY9iYpCjk8hfiALxgatgkmBnyyI6qGh+diMs4EdrfldTd42/DzOHnPbV4dK
 Oa7HdsbtP9NqaWzRAig5xmEsLEnUQ0TxcNVlF+PEh8vqSV1T5QLzewAki46b+ToPTa6Mc8Rk
X-Proofpoint-GUID: YZRUb0Gd4yyVzMnV__kzW1oznl-HdAj9
X-Proofpoint-ORIG-GUID: YZRUb0Gd4yyVzMnV__kzW1oznl-HdAj9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_03,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270054

A TEE driver doesn't always need to provide a pool if it doesn't
support memory sharing ioctls and can allocate memory for TEE
messages in another way. Although this is mentioned in the
documentation for tee_device_alloc(), it is not handled correctly.

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/tee_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index acc7998758ad..133447f25065 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -889,7 +889,7 @@ struct tee_device *tee_device_alloc(const struct tee_desc *teedesc,
 
 	if (!teedesc || !teedesc->name || !teedesc->ops ||
 	    !teedesc->ops->get_version || !teedesc->ops->open ||
-	    !teedesc->ops->release || !pool)
+	    !teedesc->ops->release)
 		return ERR_PTR(-EINVAL);
 
 	teedev = kzalloc(sizeof(*teedev), GFP_KERNEL);

-- 
2.34.1

