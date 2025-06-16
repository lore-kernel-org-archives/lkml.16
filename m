Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1D1258CFA
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 15:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750087766; cv=none; b=czmTrWH0y4VGK26563IXJ6uXuIlI80W5nasuwlge3idiWbsgQhPyhfQBp2mmN11hHxEEbGPv0oHNGizR9tgpsA77awxUy8TmngT/BZ5+NrfzgMed3PGkqF1BhOQsmApTd2BMZzFe3G/BzZiWbX7Pis5czts6oVvKe70tHg8APoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750087766; c=relaxed/simple;
	bh=nJe/rCU0mM1LK6ZhEfAvqmM6ue4Q9Vd6jDTW9fx9UlI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AwNOu+WaDpAv8UxW9tUsqoD4fqRu7N5BsfSn1ZX2DC1UnjTE54vyW+KDJlKTlZJarnLaZLFCifaiv7JYmU0eKC4yGddgeupZ2YQAtF+JsrwpbjKyTyaj9QYtwBQ5ub1oaLUwf25SQgbohmPPhX/xEd5MtnFeYJvsENSpVbhxFfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Fntgc+a8; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Fntgc+a8"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5534edc6493so5041840e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 08:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750087760; x=1750692560; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tU/MOIKq84YnAfhWoL4YWtwA5Rdh3uTG/Wp8rz5grc0=;
        b=Fntgc+a8z5geufgs8sQoEQbGb/K+59HnfptcsL0592AYayiLkVrWQw75I19JSwYuN5
         kY3NRTR5wCMKwcXdDiQPmUp/Q8uDOsc+kp63l8Axa6LLPTR/eItMX3RHFcN9PkaiEDJ1
         erZdXwV8uzT0z+h8MZ1otW4QkQnIb3UvjI/2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750087760; x=1750692560;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tU/MOIKq84YnAfhWoL4YWtwA5Rdh3uTG/Wp8rz5grc0=;
        b=PIMlgG2PwjAEnQkB5/02IiloQIU0oUiy5wp/XKY/fgbOXiHto9I6JWhhGX/IDqTitP
         MtWNXd6FxE28GpVmSXngSSDjYkTGXncRQWTU+sxhyC3KsFZK0OJTZAbQ09ZS4xZtAcSb
         zDoJtrzKjSzcS+SJidH+TATRWZbzwPrgX1jQcmN9DCq8Ns80Ru8hgAaSbzfG8o1M8GIF
         bmxuCD5Mg/v4ridr20QCWw03V3kfwKKdGvVrTGbxnOoZBmXCOtjefZFhGstff5Sj/HTn
         7BU1Ry9Su9pAT2EMG0f+hDSekpPLiGv+u1JZwm3YDkG8EZBEBN0b6D/kMpxyxbhoGd0j
         jUwg==
X-Forwarded-Encrypted: i=1; AJvYcCVM0JvfZL+DPNpPJMif+QF07Y07qRC5d2b9yQgZdCCHe9tMiYJLGW7v32nblUGLu4GmFbPvdRKW11zTKK8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYR+gdfXLIgLIBYU2jIhFrOvQh1V/PWHF4+mHAKu4o3+do1FYk
	V6zSmf8+vn5ujWPvKSL8YTDyed1pGAJ9uwpPAzwRAodb5leEi33lwHw0VxKvdEZVpQ==
X-Gm-Gg: ASbGncufkPsKn1gzMT9pbu+vRFkDWLPBwEB4qjb1MuC3/RRX8AR3StFVpY3W3wxUcg8
	ViDxPz4evuDwAxwZtKhP9OZhIayzHWjW41Zo6PY/SIaJMQVN20du83A1aNJ9ful1UwvDIXWquTi
	Flno0ODnJjj9NzHrRqwTD8kuOAh9q9+tXLbSfQFXF1nh8uinMs6T5Imh9vsAgtlm9lw1Zn+z9BJ
	US8JG1936N1Dv7ftg9M7z/hbPHPMGByJKCXIzrs0232Xfes/TIb/tjvTClq7gxc4hIEZ2X2FQou
	MrtUrS/VPQxSjiMMPJkG2M+Ex22pOKUVLtK7LVmVX/kVPWK+plfLzGtBqcfXZZhBLD2mxt02j/P
	LwO2fBwdPFUWdKKjJK5xzepMV48l7Dxjie8SLzZmGHRxNIm28PYbE
X-Google-Smtp-Source: AGHT+IF9Hd3Wtj66G1qTf/FKk0SD1/kjIqCqNtZy8C7aM1FLVNBfFTvcQ0578pGYNs8i7deIw2reqQ==
X-Received: by 2002:a05:6512:b0a:b0:54f:bce6:63bd with SMTP id 2adb3069b0e04-553b6f62293mr2330891e87.54.1750087760319;
        Mon, 16 Jun 2025 08:29:20 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac11ff5dsm1568020e87.31.2025.06.16.08.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 08:29:20 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Jun 2025 15:29:17 +0000
Subject: [PATCH v7 4/5] media: venus: venc: Make the range of us_per_frame
 explicit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-test-v7-4-b8c0f98494fa@chromium.org>
References: <20250616-test-v7-0-b8c0f98494fa@chromium.org>
In-Reply-To: <20250616-test-v7-0-b8c0f98494fa@chromium.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
 Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Fps bigger than 0.000232829 fps, this fits in a 32 bit us_per_frame.
There is no need to do a 64 bit division here.

Also, the driver only works with whole fps.

Found with cocci:
drivers/media/platform/qcom/venus/venc.c:418:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.

Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/venc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 4979392aa20b6dc94895c7089878531b92b57754..13395aaf06bbb1f381d809c18be61c5d6da85723 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -412,8 +412,7 @@ static int venc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 	do_div(us_per_frame, timeperframe->denominator);
 
 	us_per_frame = clamp(us_per_frame, 1, USEC_PER_SEC);
-	fps = (u64)USEC_PER_SEC;
-	do_div(fps, us_per_frame);
+	fps = USEC_PER_SEC / (u32)us_per_frame;
 	fps = min(VENUS_MAX_FPS, fps);
 
 	inst->fps = fps;

-- 
2.50.0.rc1.591.g9c95f17f64-goog

