Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D9F27A12C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 06:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751869109; cv=none; b=vFxlK5PARkoHRbbRONYi6PMvs+tkQ3dtLzLM78IT/s8Ppt4FesHRxI+6hBKrQ25iJdOIi0gfgUVjw21a7znIO3a3QyDRaPa8bvBEne1g7BE0+FcRvCcVpJT+KbQznRTJ0/S8sybRjThAzUoMi4k1QjtdANQEkWPMAR+3StH3io0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751869109; c=relaxed/simple;
	bh=OO2Z7mIWJju/0AAWi0QFQrEeFkD+xuMhO5TmIsG9bFo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f/rI72UbAb19GiCFf1i0jAa9yrzN0/VBo7lllGO3aLn+hCy5aogrVmCSnOJ8bbXkz7EB7voUdjbyTRZsCPJTi2R0cro87jcYor/QmD2FZS8vC0n+/ltw+Ut6EVZesC95OvHE5eoj5Yro+9iFSjTauC3HDiZiR4xWOjjUQ9brt9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ux+i3rMh; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ux+i3rMh"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-73c17c770a7so3409383b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 23:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751869106; x=1752473906; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XDSLLULuQro4tZ+C6kFbdQGbu24iHgqnLikNbErS/QE=;
        b=Ux+i3rMhjthLuR9oC86YzGcBsOtyV/uIoMhQLW6A0Yg8Vsa+6R8HN54kTeqiOerjEp
         v2UIw4JwSseStOY/l3cyf16IRszKM7v4hNi8u7A92keHNoraBWvyJckrBPeDuf7AO75L
         bnA+OgNfq4ZojhKASgh5qJaZNEUqfbc0w78p8cDqPyAeo6arAPSDEkuGovB0GF+X1Bfo
         3vCGgZENVtTMxnaMYHE7Av+XB91LzLRZd3QCyB9/pUWgQl05iC7gJh7L5eZL9nnB5vSH
         rO3zKrR4RLOUADq80/HzUMm3rj6eElmUvuCvxTt1h9uqTB1HS+lS/QSbl4Al4NvWiNMG
         K/eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751869106; x=1752473906;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XDSLLULuQro4tZ+C6kFbdQGbu24iHgqnLikNbErS/QE=;
        b=vbN5sKUAICAkOMa8zW+Kd4ynNwXUkkoFyDvBnVIC6wRHLA1jrTOmQA2U3QzQYQOKgX
         13IkKJe7Lla7gRssncbR4Di422Tpf3f9J73yLlnqhPungD1Ca3Mx4zlpW2MzAqpMvDvH
         AY0Gq7QROg9s6/KiQD91J+PxtENLo0uwCc9Jdzoy57sakzIKiDvuwcHF7KoK8QUlJAUj
         5KoLw3IPm2l2Zn6Gz+sQStYG6sofrgEkf4xzkAwqdSn/JXF0J6SyGA3IvrqxwE+jhSIi
         J8A5sud8ZkSt1IXv4I/BS+plbVolmDCKj7A25Rt1PTD/xasD9T/vOQFzafgeP9BdQpf4
         4N8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVqkdraI06ZvhZM7TEowrWbUutKOjLPID2XuOKBVzPUw1WSRWgz6s9bcFoPa62NkwwmWN6Mz29TbiCzzd4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5XRZ46HHDsFm4MZv92D3b814eSzNm+tiQ9oVKrFoLxyaWDbKM
	g2cqflZMVYhUtAqFoVT+MDeg1Ol1pOcwSKwV1oJ+LkKwEOB9vdOpFHzb5EufrVGHW8I=
X-Gm-Gg: ASbGnctHqP2JNFtmBJKDhKa/T+CdyPDHWE1S1Wtmvvz59iYaICXvLn0FmUSArIMR3rN
	9chFbSlEX/0xtmt/ul/TxkOvXc99eq60wPc6o1w+7+CssaB5/2iDK9+4VTwXM4MCvFj4BiQOj5P
	+OnNceuTPK2sidUJ8rHDW3k5TSjCMoNKIvz+6fJQs+4/uFeV7j+9g7z5mru4AWWc/LNi9eFFzFz
	DtqQquDH9vFG4irtNcOCZKweqUCPE40IsCejBDvHNMy5GUqFlkCagg/xQqMpmRt8dIJtQcfkvq2
	f5cDCesug7wWf4Y5QKXYwiQPlwLHj3UO3/z66riZvYavkYWM+ZsH2+RE7Us=
X-Google-Smtp-Source: AGHT+IEmnc9Nl7lcGHKBCmQmCi/m7XOmXpKt5Cnl8qyjZqXrrplvrrS72dHqfjoA89VugwwUs5rqDw==
X-Received: by 2002:a05:6a20:3ca6:b0:225:c286:5907 with SMTP id adf61e73a8af0-2260a0a362bmr17640836637.3.1751869106645;
        Sun, 06 Jul 2025 23:18:26 -0700 (PDT)
Received: from [127.0.1.1] ([103.163.156.9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee450ccbsm8037327a12.3.2025.07.06.23.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 23:18:26 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 07 Jul 2025 14:17:58 +0800
Subject: [PATCH v12 03/12] drm/msm/dpu: fix mixer number counter on
 allocation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-v6-16-rc2-quad-pipe-upstream-v12-3-67e3721e7d83@linaro.org>
References: <20250707-v6-16-rc2-quad-pipe-upstream-v12-0-67e3721e7d83@linaro.org>
In-Reply-To: <20250707-v6-16-rc2-quad-pipe-upstream-v12-0-67e3721e7d83@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751869084; l=1366;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=OO2Z7mIWJju/0AAWi0QFQrEeFkD+xuMhO5TmIsG9bFo=;
 b=HIyipBAXPGv4iNFX/AHEf7r3WMbFa9ZI0N5soHzc2+H6HD25aR3ZFY5RtKQV9yhsI3bp4xQZp
 NKWA9XKuuigCEPtJpJX+IkEjE/6yf+9/eIdQRwzGkisQtZC9ZCsrtJ7
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
index 2c77c74fac0fda649da8ce19b7b3c6cb32b9535c..3f344322b7f214d0050986e675b32522f8eb0ba7 100644
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

