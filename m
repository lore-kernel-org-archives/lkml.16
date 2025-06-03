Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6336426A1AD
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 07:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748934684; cv=none; b=AsIylE1OeubRNPPPqMEfMdy3KTnTnK5LZpT5Dg36C+aMam1PgAWcz7lxTSKteA1jcV6FaJiRfP+OmQetF2g/dhIgvnSzx6WvdzTl4SWTOB0RG1Shg/N3eRpD3CVDvYqJ5sViRThUOL8V9zhIkgHXLC9uRHvcv61cmwXvRI0/pTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748934684; c=relaxed/simple;
	bh=e1upM+aOdYliO/dIh1k3i/FkzXto3qmBjVI/19UomkE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oqCBJM8PNVAWGTZvboNS5g5wlHguxRC0Lx3QyA4AKQPTIGfOXiturWZ6iQ7q5c2i215yNfnwbf+dpjylD81e/X5CIRMMSDIrR4Bz6507g/d9Nks78TsOn3GQEc0IPt5rG6Lbm807qLQHxXmCMsAQcVGxiwF/msonFInoPpN3sIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FvH5pLH1; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FvH5pLH1"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-74800b81f1bso199603b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 00:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748934682; x=1749539482; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a6pBDEEcTuBgbm817Rj3tBVeinNfrDQuQQunJdnxKqw=;
        b=FvH5pLH1b6kp9imnOPC0OrdaQiByt11G83EL/kFVHCgFv9ZuQnqIboC1ZOiQ4nT7uX
         MChcHtArqMxX4n4YKx1ko1ebkjBSiS0yVmdtf9ZcEjC+YjxobQCwMJjY9ihkSH69R6Xk
         r5+j86OiDULsjUc0uxYQC6xwHNjN+G4tOzAtf3QLZevts/xaoYBOvTBbl0623PgCw/3c
         YL+oRd8Dy9/QBrxgEZXJ9lL8ITvI+AK/W2eIBImdEZPrfEjZXkNOCyRXPe4bfVrkPZIb
         V+FO2tlBLJzTjXojQfA7JLAVhBsC+24Ac/8bGMJzN8BM6pSk466dzntlt9ZMvXQfjFmT
         Wo1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748934682; x=1749539482;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a6pBDEEcTuBgbm817Rj3tBVeinNfrDQuQQunJdnxKqw=;
        b=piDz7FMFiCd6StI5GovpxWqa5jwdVftdyyX16dGY4aNGJ2EZk7nEmhB6Y/foX+YVnI
         4eGvCDoSGOAzSJPONUFfWY0A5ce1q2zFHSJqmREg/20E+JpnY/HeHMwnGIw8rV+rcYxa
         sxe76za1o3QEaUjVXtgYhkY5YSJEc36DLgNKMwxNBFhVyXmtAAbQ0cN+KphUbyLk1yiw
         sy4L/HoiKXUkocTKLoPYCzQfUsV2wOg02y/3PIzcpQqPNfeU2h1rEDfFwv00T0sm1bmi
         LTDGv+e1l1TSiykx61zlZ1vqvle4e85sZVVEwYWHFADf5r1pAE8h8OdVmadd7mDLL+qP
         zEbg==
X-Forwarded-Encrypted: i=1; AJvYcCXruYFEsfYxmkeiEP/vglkbDGRMbQMImtqyIGwlbSVkCR/IreHUCe2Bqkrgdw5YRDD+KtkFGIVTs2VM+cs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2zli7dWxwt2Mxn3vqJE7jfhcuE6Nmf+Q63Y5qci0iF31mMn+y
	R6RYAFSgw/dD9RT+U1R+BwzNQl3unJ+ptqp1Kh8JPqRaouEUxXzPEqCpGvK1RB/OfSs=
X-Gm-Gg: ASbGncvo/06CyKsTJ+2RPcDs0BtRxiJ8FIpqNFMtAIm3/n11FCuSjdAgQLF4ewqfFfd
	nceCLKasVff2ZRHWsPwx/BHWydVH0E+ZY8qwBscQc0w42SW1eQh0HEGg/SgH473tSXnij644KLK
	WNv4DnSog9b4TxCyqRgCknJmKggrY4ZRQxEvTnloY1/ZQjWCDIvOP2dnuVjU7zB5eX6xsyiHkKd
	gjN3OYBSF8GntlS8W8hNXd16Fd0XRnh0Piuk6Rs/MGdERCGcFIRmJSuqqX+lRV5l7GnHlnH5jHU
	AUsveihqmaeq/CnucL28+tk3KIMuqU+qDkBaxHvhXww2CdQPhP9ZboAfTes4
X-Google-Smtp-Source: AGHT+IH0yPSQUYs3KibIp/x7iu1Nwa/LdAsHJOBdWwn18yMWEz2cHx1TONGezh4asP/Kv/HQW6UCEQ==
X-Received: by 2002:a05:6a00:b90:b0:72d:3b2e:fef9 with SMTP id d2e1a72fcca58-747c1c46345mr18149708b3a.20.1748934681648;
        Tue, 03 Jun 2025 00:11:21 -0700 (PDT)
Received: from [127.0.1.1] ([104.234.225.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afed360fsm8746481b3a.81.2025.06.03.00.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 00:11:21 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 03 Jun 2025 15:10:07 +0800
Subject: [PATCH v11 08/12] drm/msm/dpu: Use dedicated WB number definition
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-v6-15-quad-pipe-upstream-v11-8-c3af7190613d@linaro.org>
References: <20250603-v6-15-quad-pipe-upstream-v11-0-c3af7190613d@linaro.org>
In-Reply-To: <20250603-v6-15-quad-pipe-upstream-v11-0-c3af7190613d@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748934620; l=1716;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=e1upM+aOdYliO/dIh1k3i/FkzXto3qmBjVI/19UomkE=;
 b=CgR/9p+yyw53c62J4hPQLpiSpKACzV7q2lWs+QQNgAMiZCDbEiDbtB3b+Dw7VJHj5NfLllHTF
 +027St0KrfsDn0M/IkAQ5jiVE64mIN5CYIH8SaWl6j4l0k0+akcU2Ws
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Currently MAX_CHANNELS_PER_ENC is defined as 2, because 2 channels are
supported at most in one encoder. The case of 4 channels per encoder is
to be added. To avoid breaking current WB usage case, use dedicated WB
definition before 4 WB usage case is supported in future.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index be8102691b99d3b381476ff844ddfd28fe17dc7c..8b6fa7ef78e2c0fb38daef9090dbf747c7ba111d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -56,6 +56,7 @@
 	(MAX_H_TILES_PER_DISPLAY * NUM_PHYS_ENCODER_TYPES)
 
 #define MAX_CHANNELS_PER_ENC 2
+#define MAX_CWB_PER_ENC 2
 
 #define IDLE_SHORT_TIMEOUT	1
 
@@ -182,7 +183,7 @@ struct dpu_encoder_virt {
 	struct dpu_encoder_phys *cur_master;
 	struct dpu_encoder_phys *cur_slave;
 	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
-	struct dpu_hw_cwb *hw_cwb[MAX_CHANNELS_PER_ENC];
+	struct dpu_hw_cwb *hw_cwb[MAX_CWB_PER_ENC];
 	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
 
 	unsigned int dsc_mask;
@@ -2377,7 +2378,7 @@ void dpu_encoder_helper_phys_setup_cwb(struct dpu_encoder_phys *phys_enc,
 	 */
 	cwb_cfg.input = INPUT_MODE_LM_OUT;
 
-	for (int i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
+	for (int i = 0; i < MAX_CWB_PER_ENC; i++) {
 		hw_cwb = dpu_enc->hw_cwb[i];
 		if (!hw_cwb)
 			continue;

-- 
2.34.1

