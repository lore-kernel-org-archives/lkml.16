Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21F52798EA
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 06:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751869097; cv=none; b=hszrRRBRwa+SaU02pOr+VaPTLdNspMKFm2MPRsHtmsho3FTEliMfx5PpGT03XaXE5ansPCVwTY/EPOxgeIjOyF3Uny2MsRcOgqpgHHv9HvjnaRYQysNXAtCY+UiYlZiUevNqHc0mZdh80/dEdTT1W1uizDVwJVRrdN6kSnlR2Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751869097; c=relaxed/simple;
	bh=xSbmnUPPIXthlmIB0KVW45Mr6GQu0WXNqCZGA6y0yZ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lxytUyrOqyoiIOvE55YJpBSRsBl2rID6vv0H54rsbv+HZjgRU47707OskWeW5cXSA5Gp2rdFYR1GqI+DrxgiS1EGDGed89P2NHsKulLDuDMlLGTH8x0bQliOuAO0Sp291sY7ev54ThY3GCuii0k0How58mew4TKcm6D6QpNGFCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r1k+B2R4; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r1k+B2R4"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b34a78bb6e7so1846460a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 23:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751869095; x=1752473895; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M7fMxwobhtU9Fs42SW34CXR4Ei37EeIi3/yq4e+ZyyI=;
        b=r1k+B2R4/sjBF+IWJ6NnY5FKNvr686WRa/WGaV/MlnBWW68Am3YTpxWbS5J1+28fPd
         A74RXwatGAJMkeRu4u9e39oCotmJliyN0lIoOHCLfmCci65UTLKbwZX0AOtQDWfqRfJF
         xwmzgl/MEip6FLmWtG5LmuJJ/kGQGGFnIyRRPsF+jrHSlrax4ft9xN/t/RX4AQEQzCqi
         ZdZsn+oJ3prem0+DTMrkQsz+cgShPbRBTrDHguIlFapk+wEa/8p0CBSoZ8kvrDyOlAOL
         HObxxcxC+NIy6kzfLxOW56K5gCKL0lfXXL1XhBnV/8sRo85yOW+LbBzy5hfhWcjWwCIW
         rrTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751869095; x=1752473895;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M7fMxwobhtU9Fs42SW34CXR4Ei37EeIi3/yq4e+ZyyI=;
        b=Y7K9jzF7605TKk3BKVq0Rj4wpw2hmSYiX9GpI8YvYINB5Mb5Hbo8Yife8SwVhtAoJY
         gUEmmlvikdqQ2jeYkTDkqGGrwucKa9oFw85fO88XDLh7taeo482+jaHJ+QYTPbmM3xKb
         Amf8QGz3+Y1gjJC0M6ohfF9B3DDCAKWk/WAGO1WY++1WbzFHBQfedEg0jxMkKYlKrspV
         Ybx2OD6OrU4rb55+rrmw7VWo9WaA0szbF3hejPM19KXRbJEpYpuzrabD5uqtUFIqAtq+
         r3YTwy5XLsawIpj228yRULzUULquZZY6q469JjoqRogRF28pw4RMk3jsBaXBtBawYJ9H
         Qgsw==
X-Forwarded-Encrypted: i=1; AJvYcCWULWNxGyovKHW6iCY91SHznqdLQsCRwdEnoWEpTLumWl1ZkM46XaMLav6na66uaMjhShpccvwP1ZmVC6o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMCFHzOfMbRu+i1bzJkj0ygXhNVReF0j9HIO8z2K3LEJ/Poe8Z
	qEQhtQPUCRK/BAlndoFnnev46ZbnS7d0OG/w3wBHJvJdUCvtuu35vppp+TKu5KiZ6QM=
X-Gm-Gg: ASbGnctL6zTh53aIPtnIafCX7mw6nXEXSByeMNECGf33ALLRLjUap1ROHi7riD6ec8o
	ydpzjoXVCx6GcYUI4DGfoNr8ozXJ4Bi7hWolF2c/lwOsQJc2inlqQKeoNo8ScB5oEmD9IfnEQKW
	I6FPI2VOFYmeij5nZkd13KYJ3mU+MpohQSvfGgNVoabjm3vRf7LUv6ESGvPP2BHoDoM6GCvBKia
	t2wYd01lsxYy43p0ZnqIZs7vF78c6j+QqtmLDExmuMq35S3OCpZmtc/OIJZjtU6QIdsPF7Iq3ha
	zegb4zcOCyq9odJnIMPlZQm0mx9xeVdragbue2LZMjCzO2xd5gnt6LhDn8g=
X-Google-Smtp-Source: AGHT+IGlrhk9fPjEdOM1WLAnuyBtakJRbk69O5GldcFs1bDWoB3+lapHMv4SrrPDfzhU9/69EC3zWQ==
X-Received: by 2002:a05:6a20:6a0e:b0:21a:bfb6:1c74 with SMTP id adf61e73a8af0-225b9b7a787mr21297712637.34.1751869095124;
        Sun, 06 Jul 2025 23:18:15 -0700 (PDT)
Received: from [127.0.1.1] ([103.163.156.9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee450ccbsm8037327a12.3.2025.07.06.23.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 23:18:14 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 07 Jul 2025 14:17:56 +0800
Subject: [PATCH v12 01/12] drm/msm/dpu: polish log for resource allocation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-v6-16-rc2-quad-pipe-upstream-v12-1-67e3721e7d83@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751869084; l=2319;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=xSbmnUPPIXthlmIB0KVW45Mr6GQu0WXNqCZGA6y0yZ0=;
 b=5cz8/WtA4/jf2GK9NtibfYXdUpTtxBzCsxYxrYNwcSmqiOcZMWA9BuwuaemTojkEvgev9IPh5
 BBn+/NHCX2QC4+i7SQWW9oaMKioD254NH2W2pyVo/puVHtNGz324ncE
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
index 25382120cb1a4f2b68b0c6573371f75fb8d489ea..2c77c74fac0fda649da8ce19b7b3c6cb32b9535c 100644
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

