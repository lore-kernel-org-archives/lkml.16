Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66B5230BF3
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 10:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744021032; cv=none; b=JuTEQd5zi2g+15UvyTJqJXc5e+cJ2JWUTg3ySFo/fnkD8+a33b2u/+JkuhTvYcGPDg8PQRwLw4D2JTC4yxy7tbrHkAkDECozQY8O3NKQ+rZ4aBgL7Yi9kFus6ypIeX1dhW4+yx3g7BNJ0RuStY7TwJb/p3gpMHhV4XRHj0JqFhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744021032; c=relaxed/simple;
	bh=YWJ34j7xCQDhTiMNfYYLeseOAG7KJPfmn+Y8UFFCVW0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rrVBGDpCsf0rjSWvrFSV6cgzDNj5RCGGei8WvKphsUdzPhKTXn8R8LfenxyhOV/vwpzkXpQFkCQIG3N6AHGSi8SpHKztgUo+eaZGkyaHUnw3+X1EjhTboHHVlfrBuEeUvsdGfBohbPpfk56WwS6pZfAFiE5r6A3K/HygRILK/5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dUKgnJ0c; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dUKgnJ0c"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43ede096d73so14071865e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 03:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744021028; x=1744625828; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pDP1Z0ZMTTNt0kswy5xA7deGiP0r00iI32AWjJvJBV4=;
        b=dUKgnJ0cIkp2+BoEB/wTT46zAeqPwb4IP5UwqyAyGqGOPKMrhIqc84QcvxvszhGUQs
         2BL89JrWxnWA26GjVD4B9EDafN3EpLWzrdmudB6E6FCG0mQRJjRJpGu0EAeeo3Pq8c7G
         WV9erYw90pBvQJ34MshemUwwevJJuhTQBJLhDv7UErR8BSJLsSXjTaJ4N+0BWIZUfzV3
         vSnBLxlFg8abrbR1wfpz9MhACD1Lmgm9GXekjISnFBJ0libzQ7SI5bkLVbp4h5vq3VjD
         p5EWe0CD8Y4zUlcX/TWZP1Edw0EXkDJI7MEzt7lhJjZa5h5qNPAs4z3+Ze1D3l5AUE5r
         /wKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744021028; x=1744625828;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pDP1Z0ZMTTNt0kswy5xA7deGiP0r00iI32AWjJvJBV4=;
        b=nMpz2Vdpc9be4NoPOsCaNmmEu/REKJTlIhsHlS0WSMgIBPYh0CXd2i96AiUfsHD2Mi
         hRk1QVntonNnq66eUyKs8bKosggEqXt7CF5YFxWrI2Ig0TnUl1ZhObN+Ya/6eF/G/bqz
         tl5qSXl50DGpeNo7bt0d3b5KCs9gEEJwATGvybB93vcXjWgOlE9JhjQCJN1yh9AviqPS
         5Z31aVamIXxUwy/J7bmpy5dhzRiuVoR+rGlwMyRiY/7QK4ozWtmJ8dukYVVSidsPpmNh
         hSyLfN0xjXbKCRRlmRkz5o0bUwlgWOn28bky/XRlx+Dq4ONhylYuJVRJ+lBfOTfZ6ox6
         61gw==
X-Forwarded-Encrypted: i=1; AJvYcCXY0x5v9Rrn9EIln67OGd+XzcOuuF9u+xCcFEBhduf7g1t+HzU2eloj36d4fyP4nt5zzfAFqw4ZR6bb2fo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7U+C6S1gOXUO7isxstV/RCLf5VMw5UOw6K8UPYb82DUn6QWLm
	734r974dgJD7OfM+k9lTXcO2bysMlXvfXvrXrDn221VVlJam6pl5aRuk2EvWXvQ=
X-Gm-Gg: ASbGncsLWQsqh7IFxYYzAhFei4JiQRdXxpI+6qdjDj3XjiCEV3zjyg+aRtKVd+n0NAf
	obYA9K4lyK7rGlT8nyJQHYqJM/GSP8mvWucGot0ZuGaRsV5y+69tvrV1QHQKu4lkUHIOQrHzvoN
	aiMDoDuYmaqqXJ9RjpLc61m8qKMteMD7K9Eme182XXm77u0TlaqHx1XazPqadUAgVQgxtKdV6zF
	6kyJ+3Erc9Hj3TM4lh2+f5WLIx4DzMIiUbCOpjzdJxsLgiUpvxyGIdZTXR93JBEPUAE2VsjAckr
	T3p5nwelayzH2SYF01ul27U0BK/MzMKdCx2n9AKsbRF5PbGY1J/pjuYWRb2CNM115Q==
X-Google-Smtp-Source: AGHT+IH1bA7eG2g6ZFY5ccY48q/cn1qwbgDKTUQtjdE6PNCKBBqrdLrjGJIHYoe4Np4eEJQF1+LN9g==
X-Received: by 2002:a05:6000:4304:b0:39c:12ce:1052 with SMTP id ffacd0b85a97d-39d07bcd00dmr9383723f8f.7.1744021027786;
        Mon, 07 Apr 2025 03:17:07 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a67a1sm11476831f8f.24.2025.04.07.03.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 03:17:07 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 07 Apr 2025 12:17:04 +0200
Subject: [PATCH RFT v3 2/3] ufs: core: track when MCQ ESI is enabled
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-topic-ufs-use-threaded-irq-v3-2-08bee980f71e@linaro.org>
References: <20250407-topic-ufs-use-threaded-irq-v3-0-08bee980f71e@linaro.org>
In-Reply-To: <20250407-topic-ufs-use-threaded-irq-v3-0-08bee980f71e@linaro.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1722;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=YWJ34j7xCQDhTiMNfYYLeseOAG7KJPfmn+Y8UFFCVW0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBn86YhSTaWBCZtRUbhDHyJiFKzongiGQ0xTg4YuL1O
 an7H57uJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ/OmIQAKCRB33NvayMhJ0YvJD/
 wJohh7fChJ0XzWfnyC+njGmkEzzkUh0SDs+P4U82VzN/EQxwt6KlVpAlMPKqbsSkHnrOTLKFarmnMF
 q1mhKXpRXRqH2Kt4WK6O502B+vzqEE29+pwbBh4fbS8scAzE3GJnb5S6cCzYa0NHW7ugOFjDCV7Z2L
 mIH7AIRa+NmxQJcCD1ZxKAPgRYTSvh8Bm2qm1MEn8gpwd6ynB4iNcqJpzHAA3p/okBRD9cFevyp0Xp
 4mWQxyeqV2WyVCKfES+rGrnf301W56PGoclpr9QPppDJ9aDW6TgRnWHTfFF0//GFihEm+Oypp21Ysm
 X5VYQ2KLuG3UxIbTAykngEnx+Mgr2N/qX47KU1IVJRkEX/Y+OIxY6hSRZ6NrcmzDwJC5i+QLiO/eWE
 XQF1vISdKXPm8PkOUolcu0+srQq1O7b+Mx/FV8gSMS2vuiTHDCPLMixY+vZsE6E4UlM3s7gr4ewIAF
 TLRUjmuXT+c5ZOP1sYeazBzUfCvIN2tWM11gyAzZJEVpdqCuFiaXjJoKABUcnoTfHt3I4e9Mfnlrnp
 M+1aOjedD7B+MynnyCLOvY6aq0Q1Gc1pxRsj3Ygfk9MPlk/AAEXb6uZwSJfVEPez82HV2MTFuzMSsZ
 YQOlz9HWKgasKsVvf3xYWr8FDjfg+H61eZg4NHMza7UdF3E6OsGdpZPUxFJA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

In preparation of adding a threaded interrupt handler, track when
the MCQ ESI interrupt handlers were installed so we can optimize the
MCQ interrupt handling to avoid walking the threaded handler in the case
ESI handlers are enabled.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/ufs/core/ufshcd.c | 1 +
 include/ufs/ufshcd.h      | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 5e73ac1e00788f3d599f0b3eb6e2806df9b6f6c3..7f256f77b8ba9853569157db7785d177b6cd6dee 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -8717,6 +8717,7 @@ static void ufshcd_config_mcq(struct ufs_hba *hba)
 	u32 intrs;
 
 	ret = ufshcd_mcq_vops_config_esi(hba);
+	hba->mcq_esi_enabled = !ret;
 	dev_info(hba->dev, "ESI %sconfigured\n", ret ? "is not " : "");
 
 	intrs = UFSHCD_ENABLE_MCQ_INTRS;
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index fffa9cc465433604570f91b8e882b58cd985f35b..ec999fa671240cb87bf540d339aa830b6847eb71 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -954,6 +954,7 @@ enum ufshcd_mcq_opr {
  *	ufshcd_resume_complete()
  * @mcq_sup: is mcq supported by UFSHC
  * @mcq_enabled: is mcq ready to accept requests
+ * @mcq_esi_enabled: is mcq ESI configured
  * @res: array of resource info of MCQ registers
  * @mcq_base: Multi circular queue registers base address
  * @uhq: array of supported hardware queues
@@ -1122,6 +1123,7 @@ struct ufs_hba {
 	bool mcq_sup;
 	bool lsdb_sup;
 	bool mcq_enabled;
+	bool mcq_esi_enabled;
 	struct ufshcd_res_info res[RES_MAX];
 	void __iomem *mcq_base;
 	struct ufs_hw_queue *uhq;

-- 
2.34.1

