Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE05253322
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 14:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744901951; cv=none; b=pC3BTUL4mLi8OGUeEbWvisVA8Xk2rM3L+KYueprVX3NJeDVvYvm5fRFPP4pjQDDyApE7YPdY/Yp6QqIjP8YBEW0vJ91BWK5frgUusOb+CO7iRftWButVfpE7ki5/YQ4rpwvhH4HsVmKGWjOvnthzudDav0Xwjt8fis7zflFBgl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744901951; c=relaxed/simple;
	bh=9hnSK/z/at7Q/XPaFDHxC32ZrhxYmQz5KS3r7i8xong=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L4MBwohypMe6dVCSrYvKe0YwKAtedWicrCCuPYE8jRrnvuiIysOS+sezl4k3pzuNbcp9OpDW2ROL4fJqhrudJWr4u60XgKYlPowhSNaS7A9Y8n7UHH9XqLFnUgRjPmy6P+4ky9C4CGIgPmKEepMm3lUcdd4Neluq0bH3SYOG5Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X8khOpQz; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X8khOpQz"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39ac56756f6so923884f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 07:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744901947; x=1745506747; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XUkiFVraV2V5GiQVRCmgiYRRVnT/EoG7D4jFzUZHq4g=;
        b=X8khOpQzrv3295Nz4vVyPRzzjPUHbdcq6e6FaTEVsDi2Rmk+SIKMhD/oW7gBD1Ge/8
         j/dhsDFkXCi1oveBOdMe9YXYUV/SVtZljwIcz1Bul1A2Rl+KDfZRHdNXwavtLkirNpTf
         OqAYne/Z4JZzCwb/WwVJXAVrfB8f37GmoJe770qfQHX4lLqHTAc9NhaLVWvVRTYEOScd
         l9fMoY+SpJ/Uzra2Gog9GtMmV8AVUcGo2flPkBgIZ5RVdlBEBIe/vRr+bwL9P0G+vw7s
         r3u5NjwM+SsdCRbJJ76HnoS7ahlew0MJWe4gVg9eMB/P+Rqws9nWSwGmhPpbkVwe5xSa
         QnLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744901947; x=1745506747;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XUkiFVraV2V5GiQVRCmgiYRRVnT/EoG7D4jFzUZHq4g=;
        b=DzNR4LXKfe0uEorpDZQNKM1jRd65+rdtGyn+9W8rdVnVvU3074vBLPlLAGndOEzLhp
         u+/qYfQdAu/4+iJiw2ssNyTjT3k4q3B0PcsKMbL0XajpTHVqEO254tTgcCT4VbSRUr8a
         Za9NehTlCIeb0Kce3HgZtR62DcP4jkyeeWO7kSXFM/hP1ya+qknQVj9uMGAFI53qJTL4
         vEBEBwAxbWBpwQi6aYhMYJp7YFPOiS6+f+7Hqqxbr4HDj8ereeSRncld69VoTgb8QQR7
         N8vLDJlCKjiunOTPQK0cAzG6xKmakt7vn2lJM5gaH059XcN0m5mMqtZ5a4WK7AZW3G4y
         iyQw==
X-Forwarded-Encrypted: i=1; AJvYcCWmlSixMFc5cXkOWcvAgc4pC6LNoH6Lb03oO0PEGf60uryqo88tGILoRPzVnumQmkQsSIrW1aTJKbyS8to=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc2orQaP+8NztKQ+Bep5//uvDgHd9RJKGCrVUw7+ano70l7ld2
	Xw/jO8TTHA8LKKhTC2nyohgg1V0FTkwOjkNk0hJDqd2IsKjRJ83HT0xs/LrLgeY=
X-Gm-Gg: ASbGncsdE0IKK9eaE6VZ0eiRmGqeaIinS28U70Xd3xT6TmzGQ9VNNSOqQPLGiydyxX+
	8EwdTyShrlsPwkA8OhglLLo3X8KE3UnEVRehQh+oSZnl6jhA/BhZy3DwpZU8ApuyyI3srMXwjRP
	7VVJx8ftrDIrasoX7OSxx5OdHt4YA4vMedbGA+V+PX1LE3fihQ38833PcrdaOzNXuyDCfS/hk1Q
	wgoI7OFx4GYh1jjs4/kmvV9y2/bp3CiiLt8JHwPmvRlU+3smDS4CNvaFHN2cWlX1KN3Z/lyGl1d
	1lMwgGNsjXqQuueeO8UMejA68eygyy+n4LrwOJsxxZ05qjm6FT/Am/yY4tyTBg==
X-Google-Smtp-Source: AGHT+IGBsIO5BNwu+9UnAMoM77c0aEOMg3wcx7ZZmCzYVM0/DMN9HYoE73A1T1y11eLUj43NlVFC1g==
X-Received: by 2002:a05:6000:1865:b0:39e:cbc7:ad33 with SMTP id ffacd0b85a97d-39ee5b18512mr5982219f8f.21.1744901947235;
        Thu, 17 Apr 2025 07:59:07 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf447914sm20497743f8f.97.2025.04.17.07.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 07:59:06 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 17 Apr 2025 16:59:02 +0200
Subject: [PATCH v7 2/7] media: platform: qcom/iris: add
 power_off_controller to vpu_ops
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-topic-sm8x50-iris-v10-v7-2-f020cb1d0e98@linaro.org>
References: <20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org>
In-Reply-To: <20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3981;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=9hnSK/z/at7Q/XPaFDHxC32ZrhxYmQz5KS3r7i8xong=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBoARc2sfQZMA0NrY0GUK1v2HYypfpErJtOfmf9hIsz
 2hdvmviJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaAEXNgAKCRB33NvayMhJ0d2SD/
 9d6rgS7dE2EncjSr0szpIBiWLIsOGNZV8h3mUoI+lpSwWwM0bHbR1DsLQo6M5X2zth0+d42/+EL7UR
 cpE5vBi3a4M6c1Sz6HkuQpgsjrsZv9nW8xDDkglMakpjZqMKQifSvmK+k+wLl36pdW8bJLHJ7f2Ovb
 y+QXfmClE8BUDA+tbEvFN0yuL6IzQvy1+F+1l4srTtju6H0IZsh9KPeXrSK441QKQPaoXjEzejmjwu
 S9uPPbt3WIq+sFPSszIEQxBWonf9rehtLfYyzNPD9d8j0O85TCneL+LMn4w3lHkeDOg/q1oHR8z9px
 iPobAtSmqSxMD7au9z6MIc831qx8nW/nmXgHevsKO0aTKlLD1rA4QwqXjcu9xRAcGJc9Fx9vYQFDjH
 0ZOANIq/gp4/aLx3LYNnFMj4vHoeXSFZErshEf3vithfj/evWcjDz+CGaJCMzKoC9lOMnXx/c5o2c0
 SEb2r+mMdKZap7a5ntw0MtwX1Bw1PkQai6GOZwu3l5QSIoIZAwOplNSaHgDMep7O7zUXsb8TT7O50K
 agTut6vSEWe0s3ZbkmbNiIM8KsSbfaEMKveXJiU2HAwC7tU739aOx3gCPAGDGCyBX8/ez0jz8oCDN5
 SrcGRM66GpT3LYaefiCJwT3EVhNcg5Ufdjoj7eZUxcrEorxgKt99KbsXXumA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

In order to support the SM8650 iris33 hardware, we need to provide a
specific constoller power off sequences via the vpu_ops callbacks.

Add the callback, and use the current helper for currently supported
platforms.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # x1e Dell
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/media/platform/qcom/iris/iris_vpu2.c       | 1 +
 drivers/media/platform/qcom/iris/iris_vpu3.c       | 1 +
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 4 ++--
 drivers/media/platform/qcom/iris/iris_vpu_common.h | 2 ++
 4 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/media/platform/qcom/iris/iris_vpu2.c
index 8f502aed43ce2fa6a272a2ce14ff1ca54d3e63a2..7cf1bfc352d34b897451061b5c14fbe90276433d 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu2.c
@@ -34,5 +34,6 @@ static u64 iris_vpu2_calc_freq(struct iris_inst *inst, size_t data_size)
 
 const struct vpu_ops iris_vpu2_ops = {
 	.power_off_hw = iris_vpu_power_off_hw,
+	.power_off_controller = iris_vpu_power_off_controller,
 	.calc_freq = iris_vpu2_calc_freq,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu3.c b/drivers/media/platform/qcom/iris/iris_vpu3.c
index b484638e6105a69319232f667ee7ae95e3853698..13dab61427b8bd0491b69a9bc5f5144d27d17362 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3.c
@@ -118,5 +118,6 @@ static u64 iris_vpu3_calculate_frequency(struct iris_inst *inst, size_t data_siz
 
 const struct vpu_ops iris_vpu3_ops = {
 	.power_off_hw = iris_vpu3_power_off_hardware,
+	.power_off_controller = iris_vpu_power_off_controller,
 	.calc_freq = iris_vpu3_calculate_frequency,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index fe9896d66848cdcd8c67bd45bbf3b6ce4a01ab10..268e45acaa7c0e3fe237123c62f0133d9dface14 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -211,7 +211,7 @@ int iris_vpu_prepare_pc(struct iris_core *core)
 	return -EAGAIN;
 }
 
-static int iris_vpu_power_off_controller(struct iris_core *core)
+int iris_vpu_power_off_controller(struct iris_core *core)
 {
 	u32 val = 0;
 	int ret;
@@ -264,7 +264,7 @@ void iris_vpu_power_off(struct iris_core *core)
 {
 	dev_pm_opp_set_rate(core->dev, 0);
 	core->iris_platform_data->vpu_ops->power_off_hw(core);
-	iris_vpu_power_off_controller(core);
+	core->iris_platform_data->vpu_ops->power_off_controller(core);
 	iris_unset_icc_bw(core);
 
 	if (!iris_vpu_watchdog(core, core->intr_status))
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 63fa1fa5a4989e48aebdb6c7619c140000c0b44c..f8965661c602f990d5a7057565f79df4112d097e 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -13,6 +13,7 @@ extern const struct vpu_ops iris_vpu3_ops;
 
 struct vpu_ops {
 	void (*power_off_hw)(struct iris_core *core);
+	int (*power_off_controller)(struct iris_core *core);
 	u64 (*calc_freq)(struct iris_inst *inst, size_t data_size);
 };
 
@@ -22,6 +23,7 @@ void iris_vpu_clear_interrupt(struct iris_core *core);
 int iris_vpu_watchdog(struct iris_core *core, u32 intr_status);
 int iris_vpu_prepare_pc(struct iris_core *core);
 int iris_vpu_power_on(struct iris_core *core);
+int iris_vpu_power_off_controller(struct iris_core *core);
 void iris_vpu_power_off_hw(struct iris_core *core);
 void iris_vpu_power_off(struct iris_core *core);
 

-- 
2.34.1

