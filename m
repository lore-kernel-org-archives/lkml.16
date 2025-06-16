Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6480C238C25
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 15:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750087763; cv=none; b=TN0hJEa/repvgXQClH36Y1Q1FRW+0YGklxesv5f+nF7CBSxYwpXbw/dPXA+HipAu53PXUPaoVFKVk2S1Uc1haOoBR5MTVBDSubx+CVsioumPE1CGd5svyKXZd3CM0hq/4Co6SkvDaU4tjQv6f1ChCraGWkaodoPIirHdTnnh0Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750087763; c=relaxed/simple;
	bh=XsDzSp/r0I19SrtO3s96jhGZF1Jyp04nnayeAGVsMbY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cosmd1wXw15xu6ksEN6XEUJisckan9KdmYub5ThtXjGogrsDLTnoT3krm6I9/wuPlopaGRKwRH6UcCQZ2crQdvT//Roi2oExodGQ7lEPwQjRF27Eh/EhMzykmY8LYb5gYbgbrb8ZO81K6O0XUAyqMeXGX4mBJvOcj/7Sl9dqEc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mEyXLJXk; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mEyXLJXk"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-551ed563740so5040691e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 08:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750087759; x=1750692559; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b4qCfe95ovipLi+Q1lPUaWCyEx536UAo0JNdtcLhiHA=;
        b=mEyXLJXkxJZ1zZ9x6jQ0l15CnTWviA/SgpJuxhJzIMQLEKJ+NwRRwfDeUgVv8GG61T
         QfLJDU9XCh7qQctHlMaek/Nwf6L8Qn1RSSgtLqk34weL5FdtP1BYYWo5H0OgbhM37kbz
         n1+nqFWkI4NhZeHY9x1PbhMQAs23vMbIexZsw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750087759; x=1750692559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b4qCfe95ovipLi+Q1lPUaWCyEx536UAo0JNdtcLhiHA=;
        b=At0O4Mr/FcYwDiLCDmK+1TWmVkcVW1s0f25DY8ij6IHVuE92N08XR21gJ55Yyst0Jp
         jDEmViisrBPY5Zmj7D8YtfQjeC7uACvlL6XjuzpKn3jJKr8eqnvr4j4GLYzN4EOMRYuB
         iRhtCEDz3lUUvNQhuaYBYuoLxEgT13zLsAhfsehBZiVrS10N//j7phuQSNGwlAqTaWps
         HFvHeM7GHxQSU24xhA8tv7OMQ+wVloSiP7YpUdOQ6vommXPQGcXfkJPsP7skOAmpHNMz
         DEmhhGkq4NvsWjyl/xFv9cLhGwY8iW0r5lY3MUSfFA/GX5QT7uTr6XXK0K5WKvwhmlnX
         OrWA==
X-Forwarded-Encrypted: i=1; AJvYcCV4d3ZU0CjVaeQgKbLm9Ai8qzLKMh2q6HkSHJDiO5Mq9IDGAhqlBS0YRQtR60ucRi31CVqIkPBuC9oM8gQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIyO7fKQ7EfHhIjAPE8LavNKs1+zd+HJxxyeNuvjDWKYCMuywH
	ZpmpLSO3C3OuRCM+FexySMTQvrlI4liGogdVp9lUU0zMzhF5PnKEXPc4R5aTxHSpSA==
X-Gm-Gg: ASbGnct+cAIwchmFpSctwvzVSsDzGydS1Ur3xlP0CHuHR5KUg9SZliEz3IsRYtX6p/Q
	nhmK5B1FBM3o8695gjkqtqlDum5TgZndmSC7d3umXV1qK9ck1n2fIvjJpeDkkpjzuSOqDoNROh9
	siuw+boaGO4THkeV5oViSjgMjqSmrNed1PnJhlQPfXCUnMBVIZ4OmU79y2paa3+qi/zlp1GCOQK
	4ETY51eZocc8DJQyXPhMAPAefjFYQfuN3yaKaIo6RdcXJ9XuhgM78m8WFVKWTNm2nZnAyiacI4G
	stPHzT+pyOuy0EkS0UwTTuEuCH1OzM/GLc56UbT4b1IT8Ouedi9do3p/T7gOTdaRY6heo8PQqdv
	/GFDeXY0em1EbW4Z6VFhCIHIgs13oaMr5KnmwbAswcw==
X-Google-Smtp-Source: AGHT+IF+CjAPPii3DRazMfwspaw/MOGh8nWAr7ANWhS1wRIoncHx/IZg8+IM5oaqRFqxKmrYKpfodQ==
X-Received: by 2002:a05:6512:31c5:b0:54f:bdfe:ece5 with SMTP id 2adb3069b0e04-553b6e8b382mr2595070e87.14.1750087759554;
        Mon, 16 Jun 2025 08:29:19 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac11ff5dsm1568020e87.31.2025.06.16.08.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 08:29:18 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Jun 2025 15:29:15 +0000
Subject: [PATCH v7 2/5] media: venus: venc: Clamp parm smaller than 1fps
 and bigger than 240
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-test-v7-2-b8c0f98494fa@chromium.org>
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

Clamp the parm if the user provides a value that will result in an invalid
fps.

Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
Closes: https://lore.kernel.org/linux-media/f11653a7-bc49-48cd-9cdb-1659147453e4@xs4all.nl/T/#m91cd962ac942834654f94c92206e2f85ff7d97f0
Fixes: aaaa93eda64b ("[media] media: venus: venc: add video encoder files")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/venc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index c7f8e37dba9b2218c0988dbfad1f7c04e055bbb0..b9ccee870c3d1238e04cef5e9344bd992d86d737 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -411,11 +411,10 @@ static int venc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 	us_per_frame = timeperframe->numerator * (u64)USEC_PER_SEC;
 	do_div(us_per_frame, timeperframe->denominator);
 
-	if (!us_per_frame)
-		return -EINVAL;
-
+	us_per_frame = clamp(us_per_frame, 1, USEC_PER_SEC);
 	fps = (u64)USEC_PER_SEC;
 	do_div(fps, us_per_frame);
+	fps = min(VENUS_MAX_FPS, fps);
 
 	inst->timeperframe = *timeperframe;
 	inst->fps = fps;

-- 
2.50.0.rc1.591.g9c95f17f64-goog

