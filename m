Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F8C1A01CC
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 05:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746250339; cv=none; b=PPo1C7QtWuS6ED4493udVFuSlzDfHzHwCJK9x3bspN8D3dWzSuincUSRtpUYUsWddcLP7zLuMBW0n0HM9ERhacycMo4hAYS2cd8GvrirAmcxt6AlaxBQAYuW3q74QC6R4nAAUfc0C0zPgA19/z6EiA9nHvIPY/vRbTbSZHghhr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746250339; c=relaxed/simple;
	bh=8sMD+0BVdsqhR32JkSGai+DhVKURkFAaa3llxtrnZ+o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XFUCfDw21hlJlHtd7TZLK+MYhlc/9h+oLAC90OwYzUvqHe9dipoEjaAlIRyLOPvKVJRGR4m9GePo2xEJfJqQx+49nugKDcvZ5AauX3AJ54UMxGAv1hn8qhaUulJCOyI3boE/ZEYH3IojB44rkMdkikAhwxeRufv3CEnxpYlDOiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LRtarRr9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LRtarRr9"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5434vpBO023576
	for <linux-kernel@vger.kernel.org>; Sat, 3 May 2025 05:32:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d+g1lzezxgX4iuf48n6TvpSmGyCyTlu+pITz96aE0xc=; b=LRtarRr9v6i+ZL8+
	Ee4SkRqeW02oikeWCbS8l5ixzjAnQ9CA04baaKqRNOs6M+Ovc6TOoT1qfdXzfZYA
	eXeGAgXuvjb0Iv45hg/001BaRArZm5ImwbYGgZ1PzfrVZlr62mnXhON4I9illlrF
	D+q8BQqJn/1a3IuCtN/Ts9HUsubF4ie4fTU/KPl9QlNEvlNeNSUKLt+DQIYsheM5
	mepCKYJYc8JK85CXBVwQNzZTGO3fVxmxmqf9Z4M3bhjx5dtwTg+BB+m4GGQLaxKV
	ZX0LK7Q+sg9xEuAEty0xNZoq/LMveVPp8jgeH88KcIzlxpXzdmHTsnVyNl0Vrw7/
	s7xY1w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46da3rr72s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 May 2025 05:32:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-47ae8b206a4so50112041cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 22:32:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746250335; x=1746855135;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d+g1lzezxgX4iuf48n6TvpSmGyCyTlu+pITz96aE0xc=;
        b=ZL3FPlqwdHasOJP/WrdiqtDdjmPktH1nVvvej+78FIWEsEByX78qGpOn32qtkKH0fP
         9tr1nyFCsa5CZK7iuE8mJLLtxJ11W3GrWQ7hKIHHEK0C0sE69RyTvZ1BHvmG/Dxys3xv
         HZf7B9xy5wdhumCDNZQeQCwiXwc5dAUzLS2rcChD/dURu5se+6xOa2MnYquYUxJeO1zf
         8z3aNX3fVG2/EmMS4MK8UXzC8aqfVpqmzde5fvego7pbdWy0N9zRUGEbyQ9n9h4GndUh
         iGPnkMH0X3HPK4YR1hckDSAag4PfsFEwHs+eBe4fMwZapTImBKjW9prUglIldvwazNwJ
         wWRg==
X-Forwarded-Encrypted: i=1; AJvYcCVzjFKe5ANaicwbDGKCG3pAzqh9SZf1ePDJ3vd+fllloLtaqG1LhRD9UYG7aHxk65s/C0ZOENDFwc/VLM8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZADhqIt1rV3JfvhN2bddh7VeWxwAzzJCU1k8DQpfgfZ580hvr
	AEE/9cZeuMlL0kq80uEy3e/wAjj6uDdnhiqLgy1a6FziLm7ICTRUv27CZnYyhFns9XfeDTX39lH
	/HOgqSsX4eQnEUKh4aFpxQaV+M752Zq8HPCbB/TzDUzrcttb/Mg1/uGEGaz596ik=
X-Gm-Gg: ASbGncuPKlUmyYYOHjiTkk3GW6KcOgQlMjbyDF8KlHy3ka+LG6LFGRk/CMdl2es27Lm
	d9VuK+P+9qrldNGtTVTCsKMcpNV4yYLGXcRJmESrO2L/6fHn7YHnBCiUQuiNh0B91dkIIjHI6Hn
	NWWPGM96rr4+vWlzh8skOlYX1pki0EFOUSxXDYr32mGZeVH02BupxqhBaj0DH0wFBQXgS0WKHVm
	6wVkpGBEgXFX1163M1WAwy49cUxoRR/iTnTkg68paYVmt2fh9Fr40TNjxmpdkEymhlWKTglABi9
	3xROmWMeXDhAh2I43lBzRO5c4wM4u8Gz6eh3nBUL6kwvY6K70b9djR2eDxR0/RbQXFfgkmyqeOR
	riQJkpI31xDqySoVKBCUyckAH
X-Received: by 2002:ac8:690f:0:b0:476:95dd:520e with SMTP id d75a77b69052e-48c31354610mr87128481cf.16.1746250335048;
        Fri, 02 May 2025 22:32:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcU2f7JBnJ76SoDjfiVAvyoGalGlzmKSZO2Wv94frd/Ay5rnbqepQqBsqyL9pDoI0HlTxCWw==
X-Received: by 2002:ac8:690f:0:b0:476:95dd:520e with SMTP id d75a77b69052e-48c31354610mr87128281cf.16.1746250334641;
        Fri, 02 May 2025 22:32:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32029017cc0sm6165841fa.39.2025.05.02.22.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 22:32:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 May 2025 08:32:07 +0300
Subject: [PATCH 2/4] pinctrl: qcom: switch to
 devm_register_sys_off_handler()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250503-pinctrl-msm-fix-v1-2-da9b7f6408f4@oss.qualcomm.com>
References: <20250503-pinctrl-msm-fix-v1-0-da9b7f6408f4@oss.qualcomm.com>
In-Reply-To: <20250503-pinctrl-msm-fix-v1-0-da9b7f6408f4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Josh Cartwright <joshc@codeaurora.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Doug Anderson <dianders@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3068;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=8sMD+0BVdsqhR32JkSGai+DhVKURkFAaa3llxtrnZ+o=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoFapXfvCnOffRs0fkj4X03+IWWD0MsP3qve7Kw
 pBDkgq5RZqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBWqVwAKCRCLPIo+Aiko
 1cmkB/wJDYZIgtJ8LSNVqmYkO3j5uVA6JDmzP3kf6UDwNTbAetQqjNhmN1YQDP0VLa6aVGY275R
 NRlTUoXo59z3b+onaCFVPt49d6D4jeADyF297xPheS+pzobyELSmBRsX9QDoWwjLg/XT7nTQsjB
 fG+/Wq+aq95Uvi/XMPDkuHTmNeIFuyC/nk5XvltGzwb7xUTiY9aatQuQPNn+n0T5QrBwP25AEOA
 539/qeT6zDh41xUKFrA7ZzHB1i0lWecY7nptLPBdjboAm7MQBe1NFpjphP+N3iCzQWN/puHZsol
 9ArXkrU6jEXR3SuNXElo8/GJSKYrpTuJBrLh17yJkzu20V+t
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: bc95rVO8Yg4Qqr8OLmS6wnxN7T1H9_A0
X-Authority-Analysis: v=2.4 cv=cpWbk04i c=1 sm=1 tr=0 ts=6815aa60 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=AQMnIOBPTmT00GrUaA0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: bc95rVO8Yg4Qqr8OLmS6wnxN7T1H9_A0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDA0NCBTYWx0ZWRfX/Uu9rFUxroIh
 6tjx5F3K2hC2Jgp2xeNj0AWp041zfz55Uc23T5I5QklnGbe9qTbaCHBdyicG4v4tdCvn84l7wVo
 jSUgDyzOAxEPifJzf/+8zf2vafje2GvBfQVLHu6lXosOdJIxqPWWK96ANvn8KtLAe8ssIs8p8+D
 +VCP03qdfRrM6RqCi22bObOm1fd/B6fDvHsa95cSM9Qn4vA66SP3UNbwRjHQYMldTlEr4PdmlJW
 KlPa/ycRQhH+lNIfMHR3saOcJgy+LOuxgPXRde3HYDG1RdMLQ3atV7Auc8pAl8EoQ/TOnV9N5Sn
 8c3zsE1YBnRqbYv44MS/j4vwj9v8HYdOj7+8+6+SNxGuF3yn8TsS4seG9aY1TfXVzxTYu2B9YJm
 rwTQpGeFyKPaxNVJ5Z6cAvfwpyqvNkyQBkfP7oxkxbHYH3559wdK146RvXrB5LV0OvyeRqBo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505030044

Error-handling paths in msm_pinctrl_probe() don't call
a function required to unroll restart handler registration,
unregister_restart_handler(). Instead of adding calls to this function,
switch the msm pinctrl code into using devm_register_sys_off_handler().

Fixes: cf1fc1876289 ("pinctrl: qcom: use restart_notifier mechanism for ps_hold")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index a99275f3c4a66a39f4d9318fe918101127ef4487..88dd462516c76d58b43d49accbddeea38af8f1ec 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -44,7 +44,6 @@
  * @pctrl:          pinctrl handle.
  * @chip:           gpiochip handle.
  * @desc:           pin controller descriptor
- * @restart_nb:     restart notifier block.
  * @irq:            parent irq for the TLMM irq_chip.
  * @intr_target_use_scm: route irq to application cpu using scm calls
  * @lock:           Spinlock to protect register resources as well
@@ -64,7 +63,6 @@ struct msm_pinctrl {
 	struct pinctrl_dev *pctrl;
 	struct gpio_chip chip;
 	struct pinctrl_desc desc;
-	struct notifier_block restart_nb;
 
 	int irq;
 
@@ -1480,10 +1478,9 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
 	return 0;
 }
 
-static int msm_ps_hold_restart(struct notifier_block *nb, unsigned long action,
-			       void *data)
+static int msm_ps_hold_restart(struct sys_off_data *data)
 {
-	struct msm_pinctrl *pctrl = container_of(nb, struct msm_pinctrl, restart_nb);
+	struct msm_pinctrl *pctrl = data->cb_data;
 
 	writel(0, pctrl->regs[0] + PS_HOLD_OFFSET);
 	mdelay(1000);
@@ -1494,7 +1491,11 @@ static struct msm_pinctrl *poweroff_pctrl;
 
 static void msm_ps_hold_poweroff(void)
 {
-	msm_ps_hold_restart(&poweroff_pctrl->restart_nb, 0, NULL);
+	struct sys_off_data data = {
+		.cb_data = poweroff_pctrl,
+	};
+
+	msm_ps_hold_restart(&data);
 }
 
 static void msm_pinctrl_setup_pm_reset(struct msm_pinctrl *pctrl)
@@ -1504,9 +1505,11 @@ static void msm_pinctrl_setup_pm_reset(struct msm_pinctrl *pctrl)
 
 	for (i = 0; i < pctrl->soc->nfunctions; i++)
 		if (!strcmp(func[i].name, "ps_hold")) {
-			pctrl->restart_nb.notifier_call = msm_ps_hold_restart;
-			pctrl->restart_nb.priority = 128;
-			if (register_restart_handler(&pctrl->restart_nb))
+			if (devm_register_sys_off_handler(pctrl->dev,
+							  SYS_OFF_MODE_RESTART,
+							  128,
+							  msm_ps_hold_restart,
+							  pctrl))
 				dev_err(pctrl->dev,
 					"failed to setup restart handler.\n");
 			poweroff_pctrl = pctrl;
@@ -1608,8 +1611,6 @@ void msm_pinctrl_remove(struct platform_device *pdev)
 	struct msm_pinctrl *pctrl = platform_get_drvdata(pdev);
 
 	gpiochip_remove(&pctrl->chip);
-
-	unregister_restart_handler(&pctrl->restart_nb);
 }
 EXPORT_SYMBOL(msm_pinctrl_remove);
 

-- 
2.39.5

