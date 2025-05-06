Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A5C253F26
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 15:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746546474; cv=none; b=ZEgkMk86t+UFFGPtDDrL6xx638/uN8K15Kbmr/pfw+91nDtI8ypyNury2/kYZV7ftJStnt/EL5+wWvvuOo+VHMvjt8wuhtFeCsK8MpKDOkBehhVC/qFW6hxInSmjWa8E47HxRHMcqr74ZKagsqbhtXYCEUtUhvhN4yS9nIu/Xbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746546474; c=relaxed/simple;
	bh=e+MxQIILmTfaUEYG8mRcW6giFJAkMzchKGmqQw3Zq2A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R6PjHLnI0OWi8oMzWF7kRANYASjEduMnqDSoS1RM/CcROU9wefIFcSCzFH0w7yguZlquPx7HgQvWUPe1n4hagsCYKMjhH/PDa2wKvUT85u05TAddf01tVMNV8i8rGmpQQsemlFr0AXbbfEaQ/8mriDLgSde/naxI93Im/t7pNZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ALHlZBG3; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ALHlZBG3"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-301e05b90caso6186500a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 08:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746546472; x=1747151272; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EAZqwoIR5WgNwGU/xBD+IG2xOYwT2VXmbD6p9oxdt2c=;
        b=ALHlZBG3ykLmBfuUSMScOFcItN4DJ+4RdbNdad2wSchL+9g6gVDGST0Ad8nlREnhHs
         mFPsVaqLzYMq1qROyBsGfxh0LyrYH0BlEWHqMq+Nn+M9miey5zbzKGf07k/CYaks2p1J
         a42cyWePtejaTKPIv2rcRCzPLN8HDvnxHN15umWgpYdIeJyQn1ueNIThA6R9Mnfhmctm
         FP4fcT1cUEWoH+60BzU1YaBJtXNFNBXwrIveubrGaQ7ZHuAZofVcxessxQI0i16ii/Yq
         D1Qiax2rJBafNuxhRqLlJ4wdChUip8ZyTlS1Cs2nKReb3/sRb87V7dEdb3Trwmbdi/BC
         LDvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746546472; x=1747151272;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EAZqwoIR5WgNwGU/xBD+IG2xOYwT2VXmbD6p9oxdt2c=;
        b=Jcb4L521rYzP9KrxAMj1xF6N1EGIzNnXMIEhXA68YPCr2kd7hYfd9Plj1cxQtH4E94
         t+Kl9Cb2WbMAbl8b4X5JW/9JDayRhxxEUjwsKLtb2gCDkxXj4PmnXuofOvQmHObuRasH
         uLM4AJPtRe7Fk5br/ocoZZDjigNpN6LQdSH53O+HeQHZW/GYC6GFCnOvOssUzbtG2xKl
         yG5yLslmxFC4WptrERAqpfFCknKqxYMf3Q1+F5GzA+qJ44Oq0YWTfN0fCtqABloOBwuY
         gdj9hbGjm18nkIK82WeU9KIWLrxYUlzkrF7vbP2rMzNKQwJkizOIg/sxPPr0NL9Tq1ps
         HdBg==
X-Forwarded-Encrypted: i=1; AJvYcCU0+i7kTfyLhzhehpvcHR8LqCMEDoKCNdHxRcXB124KK71HC6z8DuBcA/XsJTPW1ACrnbTq0ohkV3TYr8E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQSzPNsrMTFRKUsfPjAu63VgBQJgnnpg/kcol15dOWxu7Rr92v
	pq7Lx7mW97r/ZLdxYoLC7SRcDf7UuE6BnbaLVgftVjrUc0vj2NsjVdLYrb3vv7g=
X-Gm-Gg: ASbGncsTSwjKFOw2Y96P01jd8hBiu7D72vH8O6yaVoAWEw82mh+3RL3H2m3P8d4PZ7f
	YPRSpBK6lFBU3Ltp5YUqMwjzd1wYNwQebaCV/cxwxGKuAevssvyFfb1RUHbi6XT51OdYqbNhnqn
	gvIdB2kjNSjx9IwWSePWzIx0+LiRNNWG2qlbHjrlYejvsKQLIAOgWfo+tiiCsMU7Gm3u6BtDP3J
	Vt9bZY4oCB2+alHv4iVzCIzxgy6WwECQ4tcCw/M++wlA9fjdk4ZuZchhIVnmVLg36uPJUEKQoIP
	QaW55sXuy08uQeeAA25sTy1TC9zxu9tWLzpjuQ==
X-Google-Smtp-Source: AGHT+IFnRgAer2YqJDKDG8WSftGtJ1rR+zxfOuhlRqYyJ424rX57bTivAhXqIy4syKRnXc5Ylo86Kw==
X-Received: by 2002:a17:90b:2e0b:b0:309:f53c:b0a0 with SMTP id 98e67ed59e1d1-30a7c0c8b02mr5742205a91.24.1746546472392;
        Tue, 06 May 2025 08:47:52 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.170])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a4748e83bsm11495999a91.22.2025.05.06.08.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 08:47:51 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 06 May 2025 23:47:31 +0800
Subject: [PATCH v9 01/14] drm/atomic-helper: Add crtc check before checking
 plane
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-quad-pipe-upstream-v9-1-f7b273a8cc80@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746546456; l=1629;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=e+MxQIILmTfaUEYG8mRcW6giFJAkMzchKGmqQw3Zq2A=;
 b=zpOMrRtqL6iX2AnAGqg8NxcePk05uQNGAMoOqxpNJZAmmvq/T93PJYpj5MEkzyl0Fs18ufdNZ
 mXIzLx/KpGwAtrE8yNGE6pJr71Tx85cXy5Pz8Ck0WGp71qZ5JT8CS0t
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Some display controller support flexible CRTC and DMA, such as the display
controllers in snapdragon SoCs. CRTC can be implemented with several mixers
in parallel, and plane fetching can be implemented with several DMA under
umberala of a virtual drm plane.

The mixer number is decided per panel resolution and clock rate constrain
first, which happens in CRTC side. Then plane is split per mixer number
and configure DMA accordingly.

To support such forthcoming usage case, CRTC checking shall happen before
checking plane. Add the checking in the drm_atomic_helper_check_modeset().

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 5302ab3248985d3e0a47e40fd3deb7ad0d9f775b..5bca4c9683838c38574c8cb7c0bc9d57960314fe 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -816,6 +816,25 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
 			return ret;
 	}
 
+	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
+		const struct drm_crtc_helper_funcs *funcs;
+
+		funcs = crtc->helper_private;
+
+		if (!funcs || !funcs->atomic_check)
+			continue;
+
+		ret = funcs->atomic_check(crtc, state);
+		if (ret) {
+			drm_dbg_atomic(crtc->dev,
+				       "[CRTC:%d:%s] atomic driver check failed\n",
+				       crtc->base.id, crtc->name);
+			return ret;
+		}
+	}
+
+
+
 	ret = mode_valid(state);
 	if (ret)
 		return ret;

-- 
2.34.1

