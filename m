Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B21283FEE
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 15:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746546490; cv=none; b=nqyQZqAmc4nfLBwVI0oHg4FPzyAW3xg4h8hNZsGEKXinWskJo+oFqUx1RYegrlIOYigimKrBrNg8oFGiTudkpH8hbjFecLxJxdskGdVm52oGqaPYqyR322xYLtCTDg/x82jO/bXo6r55gWb0sdBOnxGqyKDllxECiKH1UkiqGms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746546490; c=relaxed/simple;
	bh=2tgdYLNBOLqvrFN89J2Z5WKCnyYFo8/7L7F+T0zCRyk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XplOFGcFW0/GlQjIlrBabnX+7yqaH8PSTeEFEj9LzlvjytU+ng1Ln9XA2//L9R5d5AN32EZDzwbnuxKnPulGa4Z5WVU6OImyNSR/rf7UOeZC5banik3XXHiKlwLssMri7TwOg64wNueyzTSCAn3XcurQpFUiQr8Gabs6qXAyMAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vL6CsaYg; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vL6CsaYg"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-ae727e87c26so3710658a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 08:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746546488; x=1747151288; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1t7c3igEg2x4olSUhClV/gNMpW/HqELZn2hx26e4MFw=;
        b=vL6CsaYgJZ0fn1zWbRt7R5KsxXIfDgQ998gp22ERWH3DYyCg20n79nLBQDPA+1+oev
         15lHvRZt6WGYTkEGbQQpJpK2N7Yp+0cAshQ2K/iHl2DuyChABYtU/vgR0nK8f02ld8ni
         nOPqJTO14q+5+RsoyqXdHliGrYBieedNPde9ir2epqdlg17lycYrDH3inxso08XGf4me
         jKtYd2VVHsM4Qr8deP1WHyiphrMPWOR1bJZt5bJ2ssj/M65E3H0bXi3CM0D7gIcqSLbB
         a25rkYWY/mT2xI9hYae2GZeULexHGAyr16Q/LydTgemF400l4j0X132jQSAigzxY5WWY
         L68A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746546488; x=1747151288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1t7c3igEg2x4olSUhClV/gNMpW/HqELZn2hx26e4MFw=;
        b=cMdfQ8yByhFZB9ABsUbcM4xJcqawYdMIVgcprh3Kr6hMmhR/yvY9mbzYAkcKoKC1ci
         404aD+jtKmYhxTrXfDRaL+SHyYdbecTpC6EpeYp+7GmBGcWxDOEDl4xamfrJS17WkUBM
         rMMBaTQe3MMTRvD4qQ1nAQeIrpnQp+snM1VGLxQukapGTbLO/P5aVgYu6iTEduTiapPh
         +BSwo4AscnzuBNGcRVJ0gDoQAf9JD9/8jL/BrTgHu07RSjjLyY7ROeOJYobUO+7KHIVH
         a3iJWvf3uuRqdrpDHF6bXc+E5tDSiOH183gvhjF0QP1PX2NvaSay0vOlC7XACw+Y+YQ4
         vrGA==
X-Forwarded-Encrypted: i=1; AJvYcCXpUf5kb7kRf61olYiTZKLYGw3MvDKUER9E8e4ekUd/HPX9dVoKwLzKes9oH9KVzcOzgr3mb+h1uk5JTkQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YycNKDxdmfATB913bZ4N1qZrKrddmEDRIhwz8LXAHEPNxDYm5V0
	4mnuNUK2RIUQy1RmTDJu9urfM65p3uTAOTgmkX3Ekpvukk991rlCe9Qs3HCwnmk=
X-Gm-Gg: ASbGncsHRZANZLRaOKpLinXfSYY7a0nj/F4P1JWthhROkDG7ZNcUJzoNr2ciXe217fK
	3QYxkPIs4XBLGBSdd7F5hOrSxT5Cdqsh9EGAmLTasofJwSP9WnVv5oTygd3Ip6jznXclQeaQH76
	5MkrIIOca3siMbg2FHMvbquaQlJ8fMxVWbid0Lxs6m6e3mQbTIFMGLs6VLD1AdGkHcIAToLrH1Z
	xIVaEY1QMahq2kIY7/AdfehjnoqtYb8MUrmX3yXcSQ20FNt6VFW/tnKhvbBDMv/EVqN5zqVhUwE
	E5/4cisWyWLvUi+bPxLsox7h8K6O9Wnzm1Ni+jxIR2be/A1F
X-Google-Smtp-Source: AGHT+IHFnX+o2nRs6PiAJQ+M/4Myfc9A4VCD1dMDlWNAgzLHxrW1ODuhrQWlbAIrmPukBYmSBfVpTQ==
X-Received: by 2002:a17:90b:3c43:b0:2ff:5e4e:861 with SMTP id 98e67ed59e1d1-30a4e622775mr26468833a91.24.1746546487995;
        Tue, 06 May 2025 08:48:07 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.170])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a4748e83bsm11495999a91.22.2025.05.06.08.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 08:48:07 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 06 May 2025 23:47:33 +0800
Subject: [PATCH v9 03/14] drm/msm/dpu: polish log for resource allocation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-quad-pipe-upstream-v9-3-f7b273a8cc80@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746546456; l=2319;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=2tgdYLNBOLqvrFN89J2Z5WKCnyYFo8/7L7F+T0zCRyk=;
 b=JtV2qtTQ1bo0l3o+ig+MQ18Sv4GmdmhOn3SvnpALB6vADW+/Z8VvzKg777kclcOGctKDVG9jD
 SS0llAeD0JGAph4iYlLEke77vbl4IF6X4/C1VYk1Gnpo9PPhUdWm7MA
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

It is more likely that resource allocation may fail in complex usage
case, such as quad-pipe case, than existing usage cases.
A resource type ID is printed on failure in the current implementation,
but the raw ID number is not explicit enough to help easily understand
which resource caused the failure, so add a table to match the type ID
to an human readable resource name and use it in the error print.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 2e296f79cba1437470eeb30900a650f6f4e334b6..2d8ff4b524715c658188fe56bc337e3ffa831c0a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -865,6 +865,21 @@ void dpu_rm_release_all_sspp(struct dpu_global_state *global_state,
 		ARRAY_SIZE(global_state->sspp_to_crtc_id), crtc_id);
 }
 
+static char *dpu_hw_blk_type_name[] = {
+	[DPU_HW_BLK_TOP] = "TOP",
+	[DPU_HW_BLK_SSPP] = "SSPP",
+	[DPU_HW_BLK_LM] = "LM",
+	[DPU_HW_BLK_CTL] = "CTL",
+	[DPU_HW_BLK_PINGPONG] = "pingpong",
+	[DPU_HW_BLK_INTF] = "INTF",
+	[DPU_HW_BLK_WB] = "WB",
+	[DPU_HW_BLK_DSPP] = "DSPP",
+	[DPU_HW_BLK_MERGE_3D] = "merge_3d",
+	[DPU_HW_BLK_DSC] = "DSC",
+	[DPU_HW_BLK_CDM] = "CDM",
+	[DPU_HW_BLK_MAX] = "unknown",
+};
+
 /**
  * dpu_rm_get_assigned_resources - Get hw resources of the given type that are
  *     assigned to this encoder
@@ -946,13 +961,13 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 		}
 
 		if (num_blks == blks_size) {
-			DPU_ERROR("More than %d resources assigned to crtc %d\n",
-				  blks_size, crtc_id);
+			DPU_ERROR("More than %d %s assigned to crtc %d\n",
+				  blks_size, dpu_hw_blk_type_name[type], crtc_id);
 			break;
 		}
 		if (!hw_blks[i]) {
-			DPU_ERROR("Allocated resource %d unavailable to assign to crtc %d\n",
-				  type, crtc_id);
+			DPU_ERROR("%s unavailable to assign to crtc %d\n",
+				  dpu_hw_blk_type_name[type], crtc_id);
 			break;
 		}
 		blks[num_blks++] = hw_blks[i];

-- 
2.34.1

