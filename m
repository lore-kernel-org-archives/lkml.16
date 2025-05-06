Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EE5283FF3
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 15:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746546505; cv=none; b=b/CkLtAQacJMtdDs5NrLkuZRlyn5Qp4lqOcaqaehlTGe3eXMYZO3bxA1tE/yILONxLz74lcPWpSaEo5u9xSQCJchAwP9mQgebpXoE69SWvne3evJJjKAT/0JAiWzk7e3T88ZooUvr1k57R+N2626oAkzm4k7Vfnh1zP2D30w7t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746546505; c=relaxed/simple;
	bh=2zVon4JQp3GbP7LIHy+YThFAabtOIovGb5UEovt+mkU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e2CvXHSmxK+AKQIUsfvAVgP5iPJ4eFw8C/ZGNmTlRzCCU2b0TfOWMcchgyQJ0nFgUNyh59DAk3L/bxKcMLOyUm/swZFPVO2zGxdh9Vn/GSb6Oyyy0clLguq+rZ9kMvSSAU70jTxuIf7k8p3qF1GlQvr/9YfRWTADnApIILWJA+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QY3eqo0R; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QY3eqo0R"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2ff6cf448b8so7555651a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 08:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746546503; x=1747151303; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rt8YnN9QqmYqFYc3WnGD82J6Gb61BHncikNZ5zZQ3CM=;
        b=QY3eqo0RukLSVHOUiZf7N6hSvAhGaPagpW5A81ZPVQbnziNFIUVAfIqO9h1r0xIJk3
         gBeOzVVaSqcLTOTIUR4aptgbWRgzfaloztsgwqzhDMKKpi33rHlCqjHj+/RRAA3xR2aG
         9GDi03l7G9Ctqh7l5UzskYdAmjcpkNF2cASk79aq280zy6dK7JRBNrLmXalh4Mm8GpRu
         3Px7NsCHZRfoWS5gtd68J8rRQDJKTSSQNTnG1+JLnei1G3lwr1Cs42HXE5f5XI9xLyEj
         RdvkVFs2/jnTwIq9UYNtqoSInYmGqgpZylE5rTfE5vq+ru8Sk0vrxhDnNkGDj9LYd9Ch
         sIrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746546503; x=1747151303;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rt8YnN9QqmYqFYc3WnGD82J6Gb61BHncikNZ5zZQ3CM=;
        b=NchwjT9YYQ8mHIILSBC6Upof/lx9QLydqi5mkDe/zUnhiav1+pJ6m2zuydHUwAIbrv
         H+h4zCXHFHqf+RdHbMcRDqIT/j4XhyxZrEdiol/IQSHRmwpj+FvkPvULXvvkffN0qUsq
         KDfxuzUpUyjhgMSIeqy4pyPVRyZrdF5kOVfW5RnHsztAwQHtfgtgeeMgSqT21eJb3SyO
         OGDC42TYWTg0vd6LcwIrHE+a3PJhc98wajzRClIbGuziYUYmXCYXnwynDIDSOQEes165
         TWBl1m6ZwAspdC6U4dtk08VKy/yRa/oyBJjHnc3QZCIGYtWOSODbVz+JHVLtnjqvrnIu
         M2Qg==
X-Forwarded-Encrypted: i=1; AJvYcCU/soyr8hRu/RvYoRCRiFmK9bXvsQ/RZppc2vObgBT5FQtCvDDzIcF8NIfyaXf+00vLh3k3qb3bRO/w1Ag=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOltG3hXXBZEaICZC0GvRHdjBbtKSXyJqVEO0DASZ3lqQssGFR
	qpHaYYam/5SdjNv2DUoWgdcHulMoBBRftHGxyebwe+wPpSXjBD3wnJiO20/qelA=
X-Gm-Gg: ASbGncs8WMUsybdoeuu3IdMw25LQZrW6TqIPMs6zovHQiqsHuZoqtam+JaDpVa443ba
	MFhi0Qiu4GRZwIeVUMafuBePrKYp7NIZZ72rgkq0Q+xf9YAqhMNF5dEz2eAWQ0yIpoiOiaK7sYt
	cXNstmHDlAspP1Pahx66k4rOywmA4qee0pQq6Hz0L0Vo/J6zMbmIxYA40+6qVls/DsP7pnV5g2X
	ruLNa81QqYcdSAu3zSI9SvQ3sbZQ4TVHkgy6gT3YcqbZaATLn3Qk5iMn2JjQftrFfmMar1fzb/2
	mH635VKumT1/kLssWaN8wIVNE0T19NzWDmYm6g==
X-Google-Smtp-Source: AGHT+IFq3IHy8I9tBXRjsLakmdCQshZzPku4/NS3tQZMk4s/Veh6/YDLmRsPoGsFRWV8UFwvJW2chw==
X-Received: by 2002:a17:90b:1e4b:b0:2fe:a614:5cf7 with SMTP id 98e67ed59e1d1-30a7dac8819mr4272376a91.3.1746546502959;
        Tue, 06 May 2025 08:48:22 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.170])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a4748e83bsm11495999a91.22.2025.05.06.08.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 08:48:22 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 06 May 2025 23:47:35 +0800
Subject: [PATCH v9 05/14] drm/msm/dpu: fix mixer number counter on
 allocation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-quad-pipe-upstream-v9-5-f7b273a8cc80@linaro.org>
References: <20250506-quad-pipe-upstream-v9-0-f7b273a8cc80@linaro.org>
In-Reply-To: <20250506-quad-pipe-upstream-v9-0-f7b273a8cc80@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <lumag@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746546456; l=1366;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=2zVon4JQp3GbP7LIHy+YThFAabtOIovGb5UEovt+mkU=;
 b=lAl0mGwOz6tvf85lHQs6kYyEJo9BJPPpOgpe5c6z9L3qc10QWWgeFhpzlUK4dFgPK1N/asGtV
 c9hCSlXhwbbCdvoi+ct/btEMdvVH+5MJ9KdWA5BEP12t4l+O/9eNnJJ
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

