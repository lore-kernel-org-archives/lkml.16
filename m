Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6942638A1
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 15:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750087765; cv=none; b=g4iv7EtqewYXjim0nMDeNgFuiNqV3vEeCbhftMOC+2mFJAMikI3yK/K+ISNY6tsr+WrezYfGmZaDQ8HfKwej0MhtpaMrl101zqcdItfzkKaI8U0PcK2vfRDHRBhU1S/+FPmHldKUciEniNp6OUWnNQPz+1nJRARzeXLEtQWhhKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750087765; c=relaxed/simple;
	bh=6eIWkWuKOIsBSFSU81VrPxHUw8nDWPxgWAtBDL7zshI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qBzaZBfm3hRdjAIrJ7fRXoieWyhon/OV4KdBIVwzt/CLB7DOxCzqAtGJ7ExLFodOTanNBglkFLJNnF9sp5v8qBBvmke/KI4qnilXJuci/c2sDJ7mPjrqZHfCgciOwZ6IzBs4l4zfWftx/2jU4Ge237+1YXXO8KNlz2zgGGO/cOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lo8vdmQm; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lo8vdmQm"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-553b544e7b4so3224142e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 08:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750087761; x=1750692561; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CXcagyWgdxPaOdyolF8VUudFwWviLYrCDNyLuJgMIK8=;
        b=lo8vdmQmQIuBU+rG6oVMZ3Paswhb7vfDWvcnzuQ9VQgwSm73+wZs6xsP9lUDT8jxCS
         0bfa0mtN3r+4xz60vJS+YuAUcEU+EiAboktTxBD/urpXRUp/uuplWUYa3h4cZa1h31W+
         QyjUb/VOSXjBPjtKF+P6xvxtHE/o7ZW0TLuxw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750087761; x=1750692561;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CXcagyWgdxPaOdyolF8VUudFwWviLYrCDNyLuJgMIK8=;
        b=ZHanJG17uTgNfR7csIreSJ1lH+zvOpRTwlefHucv/lFfNNM/KcUZy/ryMsD3SZptdu
         6RqE+zUiSN2pGqrtAyZlZqhxzjGtb3Ak2GECiOpsfEheEpM3xqfQdJI0GW85N4q96rIY
         l5x59yqNpZ6JchZUQUMxx97a+NFUNOF4SKchEGJ3HbaSOmtdBnUlmdbrlJCLOlUwlJUZ
         EFwmadQXMo3hwcG4xqS+PabKVqtqRQyfCI9CmWgQf+Sbyxhg+Dh2uEZoloqz9oFIVmCV
         r1UMeaK2wXH+243qWKtpfPji8ugyYro63mGyGEx/xNAaPKUgwv5p1rROKtcf+ehFDp6i
         xNGA==
X-Forwarded-Encrypted: i=1; AJvYcCUG2HKqaTTNYIJWjX1CaSuSY5AF/RU0eVgKviEwg8tNbcYlEBE/PQEY8ukKr5+AkqB+6M/buxmO3wROMhs=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywke1pDxDt/nmkxpC6Dcn106ISZ8xeeseB70/uaOFptWL8wt/AJ
	jemMA9HT57SjVpExk4RU1Hv5/F3NmYTqL3X22bcAWtOffaEMWIumvBXilKWoNZBBu4yPV7nuhsu
	slykFJw==
X-Gm-Gg: ASbGnct6bYGn9o5xkXxng8AYjtVmDl1fibUB8LEl+RpF7313bXfYiBK343X8hU5cEiU
	UnR/yodNspTYRKD02YjgtkhdONzKT+tjFR2zXTWzfMFhsz1Yw5CpyVIVPJ2Jz5M8qJTG6OO5m/K
	KeTxlGEkZmMRVHpggisZ804tUvovsvDhO4MtBybDjhqGku4hZTxcKbNnlSaXF4+Inbh5/k45G1j
	7QRF+Hlc6nU9tUu5A/LVZw7JcSPRpLKzC97Ie+oSrpiI218/jGYSdb+0Ggw51qV4xOBzZOok1L3
	daWj1XNJWni6tIbrYzNTabc3PpbeE5gQlvu2dBb0k9Pnp7MEhsgmRkNCp3bxxJRqHjCv0CgJRKj
	TOHhsk1JLDcBwKYFKLwL44zg2ts2hjTz8cmKUCCkq0A==
X-Google-Smtp-Source: AGHT+IH1S4ALM2gMeb/svq1KORr41xuNr85Hs8gIC4o8fbK5Xpu5PFMKGkdjJyiQOAmowu8Unfeo7w==
X-Received: by 2002:a05:6512:1114:b0:553:510d:f46b with SMTP id 2adb3069b0e04-553b6f0f99bmr2569990e87.32.1750087760767;
        Mon, 16 Jun 2025 08:29:20 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac11ff5dsm1568020e87.31.2025.06.16.08.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 08:29:20 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Jun 2025 15:29:18 +0000
Subject: [PATCH v7 5/5] media: venus: vdec: Make the range of us_per_frame
 explicit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-test-v7-5-b8c0f98494fa@chromium.org>
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

Found by cocci:
drivers/media/platform/qcom/venus/vdec.c:488:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.

Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # qrb5615-rb5
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/vdec.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 7d6612234d18a49573dc502d48ee61a900b63194..6042eb1e8705196b754dffc16bdb714378bb4cd4 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -484,8 +484,7 @@ static int vdec_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 	do_div(us_per_frame, timeperframe->denominator);
 
 	us_per_frame = clamp(us_per_frame, 1, USEC_PER_SEC);
-	fps = (u64)USEC_PER_SEC;
-	do_div(fps, us_per_frame);
+	fps = USEC_PER_SEC / (u32)us_per_frame;
 	fps = min(VENUS_MAX_FPS, fps);
 
 	inst->fps = fps;

-- 
2.50.0.rc1.591.g9c95f17f64-goog

