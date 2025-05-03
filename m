Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4933819C558
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 05:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746250336; cv=none; b=rbrdjGVLLUZMK5yUjbp6ox6JQVnY3gMzCPHurwoo4kHaO1LNoHsIKNUg+oFP9+RIIeUS5P9HmpQPWbQYo8nZHjLmCztexU4qPdGANn90S2ax6B5Q9Zp7sG8sIqk4RTwMLe8Em8M5euqIjMVtUo6cbnOrBgjWoGFFw6oZvLDxwJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746250336; c=relaxed/simple;
	bh=hhqwCX+CfMbW8a8LTyK1HCQvR2viDSbpyfZaXTz9FJc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f7ePRTeflR//jKQqhA6uzwlkzIL0OPPqQ5oor3TDFtPcB+i0e4L/epY/0PXQJO5xxrIif+hib3FuPbmiZaNIPqPBpC897Lm52rYR3NBxCrk2pw10q+dd4w880UKTsfFPUoayJmY/tBFdf1m+5UTmI6/6sDFAV4+xKE9dwy6co2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p1vDQ/Mz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p1vDQ/Mz"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5434e2MR004536
	for <linux-kernel@vger.kernel.org>; Sat, 3 May 2025 05:32:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8rkPsKVUOAdzLtjw7eKW3hTPB+u82BaHGf8QxHqusYQ=; b=p1vDQ/MzSjshaKDu
	PAfTB4gEjG5TjZvowwkA/zBQcu0JutLeqKkyYCIakx+vrLLWTLqKw6EnPpr+Deau
	/uyrI44GoG2uhNOj9T1ov0azxfHoHx5ZVZfVz9r5kmlUKxdNlisyn0YIi/B7Y49V
	T8OkEVEAV47NqMrtWWUR5tA1DG8Fn81NK9+ZGRgh9U1z0FQEllO8IDm+0GOeK7VX
	ZiY773f4TZYwaqEddTqQN5xdN54nMNaLzpxhQVHtMmxxv62O3KsYCOqgVxZJDEPZ
	XrEPQ67i++2zyCOk8f/Gts3bU6Uj4aRVldAUqku7p1z0qyPkfM9DfzG3W6SA4Xyd
	lr+5+A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dcakg1u0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 May 2025 05:32:14 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4766e03b92bso50088721cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 22:32:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746250333; x=1746855133;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8rkPsKVUOAdzLtjw7eKW3hTPB+u82BaHGf8QxHqusYQ=;
        b=VSPfOG43vrwXBmt99WzAto24pti5sTqoUw3Fbh9Xna+LdkkBPjISXg4FnQKE7LSUtN
         DAJbDqLVGzbSea6zbh7yFViFb8UtjOiINXPAvR3AhozlZlEJfppEiNJJX4Sscrm0cLYn
         ach+e1VB+LUJmFL+iZneRaaoKmdBLeu+TtusuZuCS4INeg+i0+Gd8QRCV1i0KXpFKFbi
         tvklkwZ81oZCewkIR1jZgLLB523J9NhJdPZkOeUY7lNCmnSIUImOMPFY4jBDn7kE5cXx
         NBW6D1dOicFrwWFDnRdyHOn16D8FoYmHv1y83HUOnwrXK/GKInrvGuSfFv6m771INojg
         YLBw==
X-Forwarded-Encrypted: i=1; AJvYcCV9Y09wqEcbZwKr2io6evxZwJZNmMXr1MjopPt1PHpoXyV7PE+xqa5raZrPCu7zKvi3wIXzPmkSp0o29VY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbFJIOb1dRwY/hQeEoJ4UANHousI9BWYRfneTK8BsieeMCU4+n
	uKWgLZo2R892Jf6G1c0L6nU+uaePHyNPbnZjuvlZcsCW+uzWAmmZpyXARu6Oz3WZoNKJNSOF+EV
	1kYqh73KQRsnQ03ofDF4lve9WULyt0wXSd4eNK0m9nrjuJzzsqs5FGfAKAOP1oIc=
X-Gm-Gg: ASbGnctbhaow4k7dmFn670MIDXeWnuex4bGyfC+sgniCUGkFOzGqQGPQd3hY4xB25hg
	/oKlg7SW2auX3AQfhF3ZdEG+vZVGzFhOfM82tYpvzPEaD+YZy8mFGwh7RbW8PgAPodUa5u5vwZw
	TuBM/97AnUt34tQ1Nr9oqj7M4ggWVU2LS9wxIrM/4G0U2kc8BX6yQzzRe6IFF9WxoI5/f9lWQPo
	eUbPnhrGKRBuXbKZ2RXm1pJaxq0eCHUrGK7fI1k2wnJH5gzRb6mhUU7afbIwgT0X/3Xewt7k+zD
	+HL6gvTjO/DnXdCOuFu0cmA5rzTGBb66YzMaDJKF2V8KP316Wgr8jgi3/lUU+xjBHALP38Ke0d5
	pDWznenx9KMGeXc6AySF2oVKv
X-Received: by 2002:a05:622a:406:b0:489:6869:5e54 with SMTP id d75a77b69052e-48d5dd6a2e4mr24660611cf.44.1746250333253;
        Fri, 02 May 2025 22:32:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnyIobiBcsKCXEIsgtb9OEiGQsSvvsQAtZOu7djNaXxrToq7E3Ypb6qrxXb4kavSHUd2bxSg==
X-Received: by 2002:a05:622a:406:b0:489:6869:5e54 with SMTP id d75a77b69052e-48d5dd6a2e4mr24660391cf.44.1746250332919;
        Fri, 02 May 2025 22:32:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32029017cc0sm6165841fa.39.2025.05.02.22.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 22:32:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 May 2025 08:32:06 +0300
Subject: [PATCH 1/4] pinctrl: qcom: don't crash on enabling GPIO HOG pins
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250503-pinctrl-msm-fix-v1-1-da9b7f6408f4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3418;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=hhqwCX+CfMbW8a8LTyK1HCQvR2viDSbpyfZaXTz9FJc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoFapXsLBlrBwW87bgV39H64nz7f2YaR5Kcl/wy
 dPKRA+DYSCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBWqVwAKCRCLPIo+Aiko
 1QWTB/9HNZ8pyztcrM0SZVqWDoPJtc50Rb9jCcAKuqMXypKMYcbosAkdL5vG8FhM1nQ4ddPAnzS
 oXr7yZWkTfRNTBpSR8z5gXAbit/DlEdknLe074bwqXpTB+wl7s33YELwUYxLFNE3W/NYUOH98++
 kuzpgdtpge7xiXa6aljBmlYIa4IuAc2OpoKcVJhA9PVoc77Xm8wKiX5DYTlUDVaHhO2bhZNEWGy
 Q7BI/PIrsXAVl0MZnI44Rn503p78LM3OKPYPN5cTpV7j67KsrrvOgQXFNuPt2qxKNNv338Yx9z0
 gURIizPJEhZH0jWY3g0H9aJ2SqST92gvzb+jGFLU/sWsBTx7
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDA0NCBTYWx0ZWRfX/CiZH+VV5N33
 yXtgzKpTiTRMRTRQOprgS7r8bCjuK5KYSyidCIQx4XFgo3E+21rAO0xSGfcVDvx/cbiwWk0j5q3
 jJhzlBu+GfgdvJLmSjd5rghA6hZEOQktk5cqJ5Tyyd/5mzQVWuC+GxhChEKTf9WtfccMFhTcf2p
 r2pW+EgBVeFmDBLlR1+hUNorGz7+bF6A/Qh0XqOtABmohZ6LP1f3Rd6fzERBuvumWEj+6qPdyBH
 zT/CSSHaRUHTteJq8/annOehbR/+vTeYsNvH5O7d7YYB5FsbReEQal8tTV6W6YdAP06XCukxh+c
 pu+Xu1ZfnppHdhRpU+e+jJDfALBCz8/ZA2azGVl/bi0fonMLiWZnHhz2Yd+xt46+gLkTkK1VqpX
 eG/8fhl7cbXg9MpmTwQEDLLXGExlYZYcx1yYfSOd/I5petXc/xLvu3C+148XKlOJB+g+beqj
X-Proofpoint-ORIG-GUID: cBXHxCwwl3Is78s1NZasvzbWKx7ElImS
X-Authority-Analysis: v=2.4 cv=JtvxrN4C c=1 sm=1 tr=0 ts=6815aa5e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=cm27Pg_UAAAA:8
 a=EUspDBNiAAAA:8 a=F7q04jUIKJRoJ265B_sA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: cBXHxCwwl3Is78s1NZasvzbWKx7ElImS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015
 malwarescore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505030044

On Qualcomm platforms if the board uses GPIO hogs msm_pinmux_request()
calls gpiochip_line_is_valid(). After commit 8015443e24e7 ("gpio: Hide
valid_mask from direct assignments") gpiochip_line_is_valid() uses
gc->gpiodev, which is NULL when GPIO hog pins are being processed.
Thus after this commit using GPIO hogs causes the following crash. In
order to fix this, verify that gpiochip->gpiodev is not NULL.

Note: it is not possible to reorder calls (e.g. by calling
msm_gpio_init() before pinctrl registration or by splitting
pinctrl_register() into _and_init() and pinctrl_enable() and calling the
latter function after msm_gpio_init()) because GPIO chip registration
would fail with EPROBE_DEFER if pinctrl is not enabled at the time of
registration.

pc : gpiochip_line_is_valid+0x4/0x28
lr : msm_pinmux_request+0x24/0x40
sp : ffff8000808eb870
x29: ffff8000808eb870 x28: 0000000000000000 x27: 0000000000000000
x26: 0000000000000000 x25: ffff726240f9d040 x24: 0000000000000000
x23: ffff7262438c0510 x22: 0000000000000080 x21: ffff726243ea7000
x20: ffffab13f2c4e698 x19: 0000000000000080 x18: 00000000ffffffff
x17: ffff726242ba6000 x16: 0000000000000100 x15: 0000000000000028
x14: 0000000000000000 x13: 0000000000002948 x12: 0000000000000003
x11: 0000000000000078 x10: 0000000000002948 x9 : ffffab13f50eb5e8
x8 : 0000000003ecb21b x7 : 000000000000002d x6 : 0000000000000b68
x5 : 0000007fffffffff x4 : ffffab13f52f84a8 x3 : ffff8000808eb804
x2 : ffffab13f1de8190 x1 : 0000000000000080 x0 : 0000000000000000
Call trace:
 gpiochip_line_is_valid+0x4/0x28 (P)
 pin_request+0x208/0x2c0
 pinmux_enable_setting+0xa0/0x2e0
 pinctrl_commit_state+0x150/0x26c
 pinctrl_enable+0x6c/0x2a4
 pinctrl_register+0x3c/0xb0
 devm_pinctrl_register+0x58/0xa0
 msm_pinctrl_probe+0x2a8/0x584
 sdm845_pinctrl_probe+0x20/0x88
 platform_probe+0x68/0xc0
 really_probe+0xbc/0x298
 __driver_probe_device+0x78/0x12c
 driver_probe_device+0x3c/0x160
 __device_attach_driver+0xb8/0x138
 bus_for_each_drv+0x84/0xe0
 __device_attach+0x9c/0x188
 device_initial_probe+0x14/0x20
 bus_probe_device+0xac/0xb0
 deferred_probe_work_func+0x8c/0xc8
 process_one_work+0x208/0x5e8
 worker_thread+0x1b4/0x35c
 kthread+0x144/0x220
 ret_from_fork+0x10/0x20
Code: b5fffba0 17fffff2 9432ec27 f9400400 (f9428800)

Fixes: 8015443e24e7 ("gpio: Hide valid_mask from direct assignments")
Reported-by: Doug Anderson <dianders@chromium.org>
Closes: https://lore.kernel.org/r/CAD=FV=Vg8_ZOLgLoC4WhFPzhVsxXFC19NrF38W6cW_W_3nFjbw@mail.gmail.com
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 9ec15ae4a104cbeb9a7d819b964d341f3bba58ea..a99275f3c4a66a39f4d9318fe918101127ef4487 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -149,6 +149,13 @@ static int msm_pinmux_request(struct pinctrl_dev *pctldev, unsigned offset)
 	struct msm_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 	struct gpio_chip *chip = &pctrl->chip;
 
+	/*
+	 * hog pins are requested before registering GPIO chip, don't crash in
+	 * gpiochip_line_is_valid().
+	 */
+	if (!chip->gpiodev)
+		return 0;
+
 	return gpiochip_line_is_valid(chip, offset) ? 0 : -EINVAL;
 }
 

-- 
2.39.5

