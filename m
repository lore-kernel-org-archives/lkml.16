Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF652BF3EA
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 18:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747161545; cv=none; b=ngVJZnrD8By7MBa8LM1xT1lTwu4o070pZMBUwY0XB61pN2evAGpA7o0wAKI7NXws0ou/4MMHu+WDZtBt1WkmHMaih0pZdvBW0bGwebg5B/jV+W1rOf8a9Q5g8a+PsC6RWk6ZgNWkrohjCb/rTTALrGe18oKJ4QPIJaVkWWZZgOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747161545; c=relaxed/simple;
	bh=T2RIv4LadExb2Reg9DuIE9o1rh9NeDHCv+KFAtqIUWE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O/Y9np21XG1/J7z0t4QTi/X/PSYpzT/kJW7dnr7CoHcOWIPZzv1Ww2bu7PFWaeodvoQVqSeP7s0LOx5667ZFQL5+smRk9S0hMn5ehpKQDWfgckvKj0bEjK2nrcymzEGlQVIkfY4b8SPge+CdLYA3/IAd5JKtB4dQaAcseYVn9wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E8Y5tElc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E8Y5tElc"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DISNt7003250
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 18:39:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nTC2gb9r2yWGJZtRgDhjlFghIYXR6WJTyRfEKQtEklI=; b=E8Y5tElc56TLjOKu
	qTtWweQtCiJzstYdDUp5cmFDq/4Ti/8W0ae5bGitkSpx2t2TTCQDPYjIX5tdFRiS
	0i5VI8b+bikU9EQ0Bq5wcVBJ3FxhxNz80aRK67mZG8xeaEjcBypkOBAZrnajypVa
	YEis14G5RAZQiW5wO2fxroVFiIQhhoLoS/LGmPs4qWJnUtYHW69Dlo5WQqM1I2Wx
	qph+G7uCiJkI5QjJfqYSRZ3loJZcuGavI7xaUGFqGC1tjKq8cH4BN/yX8pfZyoyf
	LOMlrRV23ma72G5qOU8jFJHuDR22qCEhE/sWQ8GgDor4fIgo1nHgChdiP22GpEf3
	onFIFg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcyg16h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 18:39:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7cd06c31ad6so34146685a.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 11:39:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747161542; x=1747766342;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nTC2gb9r2yWGJZtRgDhjlFghIYXR6WJTyRfEKQtEklI=;
        b=thKUDnGm8vxb21g0M9TtLlUqVZd8TK8QBGiovzV9fEehH1HbHw8SgLkzM4jL13Pawi
         zguF4nQTDIvuKUsVTHVTUvPck73Sm+5iIJrNYiT8sYRmZTXVI1Pjekrm+45/5+lQuygt
         I72/DNLHuQ62IxPqpOygjRFG7IIEus5KWr7fw31sHPNdJEGQbOpiXLHP+lcdjIHccE8b
         p0P0d02pQ1100f8p6tgNwwPaVvExDl2TmaU8dWXJj+OHPR9/Bip/F4aLdoyJjwJJn/A/
         s1HlRt1zlgOLHM5mA5V0IHsfiB+kuryNl50tDAoxUIKP/mYouoW0SVwQ8Lucp4djD0up
         Nc6w==
X-Forwarded-Encrypted: i=1; AJvYcCVS10upBeG5bX2b90z+K0TlwIEkg0viH5wWHw0GOjt5oFLKWSfx4NLrGgLR0SEZB+Cx6PGbvUCYlJJj/5I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yywu4j2otgpq8AaFlgbbJfVYv736SAmxbahmdROmxxiymMhkWw/
	0OEU50xROMcHLCzeZPWava5LCWrjfJK6kHDkajioUQVErktoSIEMCKzZ9Ax/09F/OO2iJFVH0FU
	S3wxq+A1VT3A4qQ5keSpueHEbrW2r14pRJ1ER8SFP3oYPQ9KX5B5fHdh6niFFLBc=
X-Gm-Gg: ASbGnctvkNuGQ2nH7DGE2bt5WGle/wyQgdOYqyS0H2IZSZBChPyb/wHQvdAoaGsN2Cp
	U7s8qzs8ekz1NURdjy6J8AlaIg9loutwU6yM0tetkKaKbnU2+izXbqjY4en3yRiNwt01YpMb+L3
	4AV8dvytjFIKD50fuNAGD8qbcmfFbKEmEYVxm2AICgNbFtOIJ6+5DVROb+Grp1yq3ZgnIFLGscV
	x/7dtQRepm8G5/OgWMynZ8ft9PZ+RLvB+xDV8Z0hG5stO4O/9iam1rweWT93i5Pm1PlY6BmjV1o
	mwHaTtxDrK5PB9bP+tti55bfv9GShDnFmJAeZfEm6SQM6JwGgf1a6vshAdIO6LQXeR8UHYs4qgE
	YJkEP1J5pGZu/BvUgTSg73f5g
X-Received: by 2002:a05:620a:6015:b0:7c9:5ee5:719 with SMTP id af79cd13be357-7cd1de91286mr794025685a.15.1747161541826;
        Tue, 13 May 2025 11:39:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmCoDhYSwUsS+pdhyEeiatm58QEOYzVcT7tHbJZhLrZOzYGJFpqAXBxnTxOmdX4dgGgNMDyQ==
X-Received: by 2002:a05:620a:6015:b0:7c9:5ee5:719 with SMTP id af79cd13be357-7cd1de91286mr794020685a.15.1747161541302;
        Tue, 13 May 2025 11:39:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-326c33c12b7sm17383921fa.50.2025.05.13.11.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 11:39:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 13 May 2025 21:38:57 +0300
Subject: [PATCH v2 1/3] gpiolib: don't crash on enabling GPIO HOG pins
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250513-pinctrl-msm-fix-v2-1-249999af0fc1@oss.qualcomm.com>
References: <20250513-pinctrl-msm-fix-v2-0-249999af0fc1@oss.qualcomm.com>
In-Reply-To: <20250513-pinctrl-msm-fix-v2-0-249999af0fc1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Josh Cartwright <joshc@codeaurora.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Doug Anderson <dianders@chromium.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3328;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=T2RIv4LadExb2Reg9DuIE9o1rh9NeDHCv+KFAtqIUWE=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ4byxEMCX9x27VXk8j7ou321yPvSx7vfF0/7+D54ogZLT
 /RyzYc9nYzGLAyMXAyyYoosPgUtU2M2JYd92DG1HmYQKxPIFAYuTgGYyMFXHAxtq4u4lbjfzXMN
 z9nIuaK286j9x89bj25ie2kx//OBlC3s0WnflBtS2qfyO7S6HdvjUGNXXdHeILWho62rPWhvT+i
 pc6v8J5wzW2M8l92we/6lxuwW5+ynp/+brz/JsqQkcmPYmsSkDeIXi6Tms1n0z1Y7db/o2l+v1y
 pnKx4KbFx+SHsX/9QNZ6q1XFaf69Hf6tXYq+vg9iXueXV9gEPQ7Ql67fWmk81zH2fyq1V9lDCZs
 3yObafKHZua62brjX9cEfXZ4qZck+f3zyfGN/X0qrBfvH710vPTZM5VMHRkqSasvDxRxLDhaIKg
 J7/29Wk8dztN/Z2cF12KbjT8KpPmJOdzNm9jd01vxpxpAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: NLjDzZYxoGJO0YKo_6Vdh-FP7HhSUAgh
X-Proofpoint-ORIG-GUID: NLjDzZYxoGJO0YKo_6Vdh-FP7HhSUAgh
X-Authority-Analysis: v=2.4 cv=JszxrN4C c=1 sm=1 tr=0 ts=682391c7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=cm27Pg_UAAAA:8
 a=EUspDBNiAAAA:8 a=F7q04jUIKJRoJ265B_sA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDE3NyBTYWx0ZWRfXwrnPTeoqXeqN
 ROoG8SvQZsiznRtoSpEONBbNpdoUXsbk/+vMasQ6KPbunaEI0/FkbG5ZJohBX0uMDka/VNfm+KF
 xBXaPrRqkg7miMOh/DnmcLCJyuwmDZi2ufDyNC5OoJbWE6nSjsQFSAkeWs80jWafOngRfwUOHoe
 5SflJRjWgkxsd0WrrGqE6+uiaC7nHSjMsyZNl95WAKKLlBCfnFvEA34iBBs1ckmUdcAOItDSSwj
 +JFC4R9ZbkkJVEH36lC7t9YZmV2wtgJ8pSDdZHGc03P2ppyVTGpqFOpUWIkS7YQjMOrVcP/FZ8d
 9qeeBqHXyECdMzNYGAHrPIjesS+DBvS2AUqNOxK5FzlrpHo6YmiB6b4ZBHGhtAF9m4eG+qAHZrv
 fgS/T/oPfI9SQ27R/7ogHMKrouwaOhuZkoENnwlpJCsBZfnJi95pwOaAfhS37UjyZq8oGgHS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-13_03,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505130177

On Qualcomm platforms if the board uses GPIO hogs msm_pinmux_request()
calls gpiochip_line_is_valid(). After commit 8015443e24e7 ("gpio: Hide
valid_mask from direct assignments") gpiochip_line_is_valid() uses
gc->gpiodev, which is NULL when GPIO hog pins are being processed.
Thus after this commit using GPIO hogs causes the following crash. In
order to fix this, verify that gc->gpiodev is not NULL.

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
Tested-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpio/gpiolib.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index c787c9310e85af4c22ffc9bb8e791931fd056c89..250d47f77e2bc678b83f51958ca1bcc4db42928f 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -784,6 +784,12 @@ EXPORT_SYMBOL_GPL(gpiochip_query_valid_mask);
 bool gpiochip_line_is_valid(const struct gpio_chip *gc,
 				unsigned int offset)
 {
+	/*
+	 * hog pins are requested before registering GPIO chip
+	 */
+	if (!gc->gpiodev)
+		return true;
+
 	/* No mask means all valid */
 	if (likely(!gc->gpiodev->valid_mask))
 		return true;

-- 
2.39.5

