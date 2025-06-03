Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4A7268FF4
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 07:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748934649; cv=none; b=o3A4gt0iemW0WFnGuJlH3t7KzDbdcDZ2RibirVz4rBE+ajMY25LCgeD18THbhT3EyNnK0WempJt3mRNidVVZ39cN9XR7gQvG66buNMDbL3n7KA/MH3jDQOVCCsoQIB8/nqbdxcpIHm0Bn66vOIs7Z7ZC7/qpEfBI121uiEfi6rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748934649; c=relaxed/simple;
	bh=2zVon4JQp3GbP7LIHy+YThFAabtOIovGb5UEovt+mkU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TxSiuIp95Dnjsy/dVJ6lEI/Lu6I1QlTwjYHWPzdqfCbd2lGjosPhhgqmtWbtxvoqiQfp/0cpUUanNk99xT9kTB4omR4FUGF2tLZHEDUNMYZAW2WChzIX7WutQocZl+XIxkQivgIaMjb4j7j+4krSCYSCqfmIXI7YXig7yxUTF2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lbl2n2EI; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lbl2n2EI"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-742c035f2afso3416766b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 00:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748934647; x=1749539447; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rt8YnN9QqmYqFYc3WnGD82J6Gb61BHncikNZ5zZQ3CM=;
        b=lbl2n2EIgNLgfUsZjKSukhP5IgdcG+rpdfJ1BGFVYFCX1dn5Rjl9zUJRJJcD8umaVa
         4+bT3uCTVCNOrad45NO/c0PzHXNLQeCwGqHP5DeJNCcqJn58aMqqoHPc93ihiHoFr4YI
         SKpXJBcUrZSd/bfYkwLm+gDPs7wnPFz7nd7/2+GV5OIzrSg2WfCekoorylUvMooJ82YE
         PDpzlI1A2EHjljHZGioFjabNWgPk/UZuppp6RfoY1J3xUlzuKYFQC9+Vg60B8LWINGV/
         kwbckIrOLk7mjikgiIQQNgqyfUdNBrPt7YEpEoYwGPOWjLq2CQ8WRsKFp8o+vUScbK14
         BY0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748934647; x=1749539447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rt8YnN9QqmYqFYc3WnGD82J6Gb61BHncikNZ5zZQ3CM=;
        b=arewLAR5TVe8taXibWuH74Ts3RQjwFyAHedpVuKQQ8Mke5Ud9OPLmQfuvo3LTRiuUN
         QA9rA1ybDlrjfOPf9Q/3t40QAySunlfW92XA96x+GaldeL8tUK7cUGA4gvvrY36Skj/W
         zwCMAcj1P7JYf6RiYrpH6Bq/owdqEcHn9ZP+Af43LgbLrRXahU/kTnlhavlQyoQV5m5d
         D9GwKsJ2aeox+UfoPv+wWCIoGPOoCXCsj2cEUDXMCO05OIUpW596xfkLL06vmC26iEvA
         1CATF3LRe1CzlpxmP33/xCrN9bXNgs+GdjZRJu7Umayi0tMA6zxZLJBk9/xKq8USNRc0
         0mYw==
X-Forwarded-Encrypted: i=1; AJvYcCVMPIAwZxf3zE0L5Hd/yxsfZ9LOJOOH1Fn8/+ew8qMrgAfOSODCMioEuQVn6rvM/bCMgMtfTs/okNBFFzk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVF5XH47Zr9q4jTnXq0dWJQs7oN+PkUMCTRbXU4F9GkMEmz6MK
	HUa7RbIvjYE22sosFgKSGIvegikyZlKGObIObYwL/0d6UbJX8P4U992EBxzQoAPcdC0=
X-Gm-Gg: ASbGncs9H1b/Qfy4LKKqPAit/W11azTsJK2Cyng8TruIGq93fnpe5vArubxwWZZxqVu
	8WcxLxqRnUN9e40ii03aB2GHvJqaCjOIcNWwI1LolglO031kMnvMTdN9z6nNo1uNJI+imEdhp95
	BLquBTtkuF1gCrXua1NG1Mgkc5up3xLh156GfIvzQl+d0y7My8s4T4wwonaKKc51sz7LT4NqLES
	aFcIJKgXNhckO9eeN/ijH9RQzX6O9XBwUH9gbWA7hkVrV4BrqcBFm1vhLg5FUKXi5HB/l8w06a3
	TA6TtC9cwqZQbkJL9PF9twcY+boOMXyjXDAxRCc9CQawpAp3qxo913Ca9q76
X-Google-Smtp-Source: AGHT+IECU07ZJTnHbY+6PX1HVqrdVBJvjDjVo6qU85+DIIL39w20q2KY+lm0QftMCabBa3zRnow5tg==
X-Received: by 2002:a05:6a00:4b04:b0:746:cc71:cc0d with SMTP id d2e1a72fcca58-747bd9873e8mr22641065b3a.12.1748934646820;
        Tue, 03 Jun 2025 00:10:46 -0700 (PDT)
Received: from [127.0.1.1] ([104.234.225.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afed360fsm8746481b3a.81.2025.06.03.00.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 00:10:46 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 03 Jun 2025 15:10:02 +0800
Subject: [PATCH v11 03/12] drm/msm/dpu: fix mixer number counter on
 allocation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-v6-15-quad-pipe-upstream-v11-3-c3af7190613d@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748934620; l=1366;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=2zVon4JQp3GbP7LIHy+YThFAabtOIovGb5UEovt+mkU=;
 b=M6kGX+zoyyifKCoa3Ihq4iUR6UyyVoU6M2k4GhholpJmyeFukaEvdo5CO2SVv0U+uk2QpqrGK
 /5yKxv751IWBn5orwmm1L8XYtOVu7zCAqFdb9V8AdseZitDIGHNmAYw
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Current code only supports usage cases with one pair of mixers at
most. To support quad-pipe usage case, two pairs of mixers need to
be reserved. The lm_count for all pairs is cleared if a peer
allocation fails in current implementation. Reset the current lm_count
to an even number instead of completely clearing it. This prevents all
pairs from being cleared in cases where multiple LM pairs are needed.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 2d8ff4b524715c658188fe56bc337e3ffa831c0a..bc7639a46386c6b9457edf3afdf6f747a632651f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -374,7 +374,11 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 		if (!rm->mixer_blks[i])
 			continue;
 
-		lm_count = 0;
+		/*
+		 * Reset lm_count to an even index. This will drop the previous
+		 * primary mixer if failed to find its peer.
+		 */
+		lm_count &= ~1;
 		lm_idx[lm_count] = i;
 
 		if (!_dpu_rm_check_lm_and_get_connected_blks(rm, global_state,

-- 
2.34.1

