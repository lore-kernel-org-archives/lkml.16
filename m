Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09C5221F03
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 15:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750087763; cv=none; b=tpUaEUDs9QH2yvWPBLQPJEXsP2x7B/KfTF25aHMz0Qul9eK4tCclFw8YBVj6xPnsbMazBgOU25uAqeVyxkxUjuJ5NNiEBgoH9hVhBuVv8bG2+pDeXphd2rUgtTmFjN6M0RT214vK8AfGbmRZdRoEwPNkNM7/mIB6SLqCODjsVQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750087763; c=relaxed/simple;
	bh=pnwKaxykfNl41aVSJ0fgQXHFHUyk5NTEvR8PclHUs2U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qanDoqUqr3uyJnThzzYm3t2P9m4vZCJ7m5Re0LQIL6piJlN3Cj2bIgegbpSR0GhzQZFabAXifYQot2qVnKACJSL4dyeNk71z9pIxQrlYl4wSQsbdVNb69j9TnqI9J82ojtTKgScySpJ3YyXwIRA/Y1LmlzAvfLIqVAVLU2UKZC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZTNid2kG; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZTNid2kG"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-32ac42bb4e4so41908451fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 08:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750087759; x=1750692559; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kMUfpPv+dKOq5nGqXppL/8SlSmSo+MNRFt4xE51N1U0=;
        b=ZTNid2kG4zqcEvyUL/hWbtfy9fOiKHVrhvXPfsU//3Psk9cQ2Ktu+E82jwPaR9dk1k
         BIJxf+DQZlQfZp1hZA4XYE8iGMDHDsRhWMDXtO9d5faEPifYT70gP8b5yLyCtHZt3AfI
         pm/iMMu6/rimtmbd1oJ+D/brBEXyJlue94G1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750087759; x=1750692559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kMUfpPv+dKOq5nGqXppL/8SlSmSo+MNRFt4xE51N1U0=;
        b=APAMOATiWnlouRpMSfQKEL5LMcbH9PXguEawqi/t7c/nxNx0NRm0GYpYPYHpDsQlOu
         h3/AP/LNIyi2HvxCOk2oK8QClP2OLLvXO13jMCaqCPpSUM6tc5FFu/YW42dkBzeOCzKn
         VJrdc4yvFV+PIzW/VfwmjAbepJ9+9/qJ/vqfS/a+PVxSxAqKucZuhAYm5g8erEkRksy2
         R6eYUUHxV2tyiTR3wfglsE7yZF+k/ejphwlHDXxwUhOWC37HjXTklRcYclmM27wRXu9l
         XUknOS5YqOu9rQfngQgw1qHbcWTh1CGs7TpP6ankgLkjDsUIY7RzIP7tlXP1r93fWyBh
         jwsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXUvWHepb/7UU6BR7oWvsas6T9xeg10joC8rwSQEYpABhm6WgzMa/imXXpROOtGgTYKJqTp3pmpmpqap0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgAtqiNEDL9Pvw7mwW0y9HO6EIxYkKiGM9UFfwjk3z8O6TuKXM
	I43uI02B83P2BIp0G+2+fSwtzCr5vV+FREM67GrirnkMW/SObvFbazRascZ7av3kMA==
X-Gm-Gg: ASbGncvB/toXdS3UOiNb/TBfHjurY2hX7T6D7/FK7CrJ45GpGVSd1QULcyulI6156+O
	8FuHsRtVAH6m7JMFqoYIBZIZ3D68impXY3FxcKqGJDPgv8NtvPlFsSjJ8B72aVJVRB1UrjWKRcO
	3JxXgWcucCRRH9KcrVLtPa0nBq/MmyER/9fDUHyc9GxZhHi/TJl5j0S+8qIfGKGIVJEQPNUJs6q
	hF5ZYLZc/Wjz7lVOJ6WQK6wZhFcPWmkqvCkh4l3Vxmp7QOkWh87ozYxRpNrYZAD0vtxcKJnE1Co
	JgezHNP9gqbbu6OinNy5W6kIbwcfkUDtxsNY4W+veIYO0fTXLzj1h7/eR+CXqRiLs9xk3e25JbU
	hjXjstq7cgPDCS1cecy8ze3umcfn+8LUNeNvBHcvYog==
X-Google-Smtp-Source: AGHT+IFD7e6mqRIDzO29wojSrb1K2/2adoVUhXjbM4ngtgXAPyANGqcX+Ed9wMyzJi7Yviy9nzQ6+Q==
X-Received: by 2002:a05:6512:3b11:b0:553:2f33:ac0e with SMTP id 2adb3069b0e04-553b6f25d94mr2553688e87.41.1750087758806;
        Mon, 16 Jun 2025 08:29:18 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac11ff5dsm1568020e87.31.2025.06.16.08.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 08:29:18 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Jun 2025 15:29:14 +0000
Subject: [PATCH v7 1/5] media: venus: vdec: Clamp parm smaller than 1fps
 and bigger than 240.
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-test-v7-1-b8c0f98494fa@chromium.org>
References: <20250616-test-v7-0-b8c0f98494fa@chromium.org>
In-Reply-To: <20250616-test-v7-0-b8c0f98494fa@chromium.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
 Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
X-Mailer: b4 0.14.2

The driver uses "whole" fps in all its calculations (e.g. in
load_per_instance()). Those calculation expect an fps bigger than 1, and
not big enough to overflow.

Clamp the value if the user provides a parm that will result in an invalid
fps.

Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
Closes: https://lore.kernel.org/linux-media/f11653a7-bc49-48cd-9cdb-1659147453e4@xs4all.nl/T/#m91cd962ac942834654f94c92206e2f85ff7d97f0
Fixes: 7472c1c69138 ("[media] media: venus: vdec: add video decoder files")
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # qrb5615-rb5
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/core.h | 2 ++
 drivers/media/platform/qcom/venus/vdec.c | 5 ++---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index b412e0c5515a0916f6a8969ad3be01841e09edca..5b1ba1c69adba14c3560a4bc6d09435529f295a6 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -28,6 +28,8 @@
 #define VIDC_RESETS_NUM_MAX		2
 #define VIDC_MAX_HIER_CODING_LAYER 6
 
+#define VENUS_MAX_FPS			240
+
 extern int venus_fw_debug;
 
 struct freq_tbl {
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 99ce5fd41577284098dca54c7772da0691cf29a5..fca27be61f4b869840904cc0577949635bc63cab 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -481,11 +481,10 @@ static int vdec_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 	us_per_frame = timeperframe->numerator * (u64)USEC_PER_SEC;
 	do_div(us_per_frame, timeperframe->denominator);
 
-	if (!us_per_frame)
-		return -EINVAL;
-
+	us_per_frame = clamp(us_per_frame, 1, USEC_PER_SEC);
 	fps = (u64)USEC_PER_SEC;
 	do_div(fps, us_per_frame);
+	fps = min(VENUS_MAX_FPS, fps);
 
 	inst->fps = fps;
 	inst->timeperframe = *timeperframe;

-- 
2.50.0.rc1.591.g9c95f17f64-goog

