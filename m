Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CCB25F7AB
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 08:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745915660; cv=none; b=RA4S4Clz52ilKOnCl+igN0bBsv2hDgJSu4ggSdBMRigNvuCGJ1QGa1sCG3VBGjuZtCfpS7RxcjBHYZ8fQGPRGcp+nlnAo50XqWhxLSLgzbHhM/985Hs74RKUvQTGRNf1GssPDwkNM521UYiIZzOHngOYAMga+XiOp5LAn8zO2BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745915660; c=relaxed/simple;
	bh=tpUZldhhx68mPtneCbwiKIZGOi+g9xKmfcLubVxZP5U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=sI8qJ1J/SlBfmJZytLE4p12hsbX+SSzn0+FKWz2k69cL7A3zec/c+/a977daPiCTnx5hwaoZzK5mQjPm/1ATbBRTOp/BgcyDrG0nNziGizNVX5nDkR/iU3cJ4iAbtlFPWNtxBJYMgCqrwBdXELSgk0VjZfnWNjoerAjRBWMwLBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ni/wmpFK; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ni/wmpFK"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39bf44be22fso3851020f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 01:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745915657; x=1746520457; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iNXiDOKt5wVqJ89pAp1nvo84uzdzWuqVd3C2tenlIjY=;
        b=Ni/wmpFKOcpF38hECi/cGGUnE70GBM6Rjje7Y3q2xcJ3NPPO6l5WUjhFJRTyvSQIES
         WQinKAE+QmFEo39EBhcxoPtpbJf9FQ+2OO2a49SqjCG9tM0MRftuZoA/1fHBik7Bc27l
         58x/ckqLUJgiZXNbNU28VM1PwjRjc6q7pMFQ0zoKtVLsn8ZeCnHMNxAnBwrkoWGmIgOa
         NlKaA2BzW6HD3wYgM1TGMfpjDtwgbHk4rzakvyaI9r35RVYfIAPUegMpqvYYJtrr2DVa
         WEb1VG23VOkFotoGJKw0DnQT5hWnmvddRkS621CvNqSNDVTptna6C3GfTu5pm80qkfBx
         hEOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745915657; x=1746520457;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iNXiDOKt5wVqJ89pAp1nvo84uzdzWuqVd3C2tenlIjY=;
        b=cwJHNzgUH8pDIpt12t/UAnOcKZqUGJztnUV7/Xcu0HgyhkQntSf5MPiSW+WmR7ZaLd
         3AhSv2EJqn257g2Ih2nAgxxY25iqVh1qpN149hDpfs7tIkFfXOEDRd8sRbgF/xlJV+oW
         gMIW99TFk4AbKb9BZih82uWGWtyxmmSq6uYN6NM2/tVSFLofu3HWtD4OCFXnUs1Nj8qt
         mefor5RZlVSVRNprMrD7RGWq4ggvBZX/HxHMUWn3FzNJqWqQVv0/rQ/fdpa3NndSkh0i
         3kIstGMffJAjtwhjoYp4epG3YKzVA4J050xT/wDzQgUTYcuYQbxolfEfvYl/6ZI8jXE1
         EEIw==
X-Forwarded-Encrypted: i=1; AJvYcCX8mwNu0vMHq3fIpgyuz89H8g/wkMzNX52dzwI7ylOJje8bh1JMyDucdsnI9g5lC/FchXDZQrUN+9dWM5A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2+8AvtrBDSCxZhKboaJeZ46iig3UuR5AsjvORODYXnAV48kx9
	1v+VPqswzL7Y5jOVqMMtwj6d83tU9IMkqNGDXo59IsO0MDIqs9pKek65sOChk+8=
X-Gm-Gg: ASbGncuBmcU8nkchJijksYhxPaB6hOCv/QYVkrESuIIxxoI0/k1MhXEGs+pLIoMWEvN
	6aS0WgjRbs02zkrES63oxqboofjo1zc/E1Ix34PrNQKVDjydSYI4DpoFm43JGz1UXZAmHnmthNy
	yCNHfF2m9FZiKGJSdTWnohwFIIW3rGoh4OgvYWNgufdQWzazAeAuY+ycSmKLiqeKho9+uFvSQaq
	2fjlb/xoF5bqBDY0YAuH3Pdy5NKcRllPH1Dl1PkIAMlrK0iK8oYGR8HOTyxyzYjKWKvbKEOtJlN
	iDW+ZfTn6JiqPp17VzR+Se0vlV0IqPNYUTx3XJ2WI9C1hPW0021JCf+nRzMJi4h8
X-Google-Smtp-Source: AGHT+IGm++8YhzXKzd/TlXniHWTMKoC7/6DztZvja5ARxvPDFybJgSY++E3QiFogsvSRHpnptLZgXQ==
X-Received: by 2002:a5d:5f4a:0:b0:3a0:7139:d176 with SMTP id ffacd0b85a97d-3a08ad33226mr1224276f8f.19.1745915656791;
        Tue, 29 Apr 2025 01:34:16 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:3891:fa3e:aac:d0b8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46517sm13315292f8f.71.2025.04.29.01.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 01:34:16 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 29 Apr 2025 10:33:56 +0200
Subject: [PATCH] drm/msm/gpu: Fix crash when throttling GPU immediately
 during boot
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-drm-msm-gpu-hot-devfreq-boot-v1-1-8aa9c5f266b4@linaro.org>
X-B4-Tracking: v=1; b=H4sIAPOOEGgC/x3MSw5AMBAA0KvIrE1S9Y2riAU6mEWVKY1E3F1j+
 TbvAU/C5KFNHhAK7NltEVmawLQO20LIJhq00qUqdINGLFpvcdkvXN2JhsIsdODoIvIqawozTrW
 qS4jFLjTz/fdd/74fHWB/G24AAAA=
X-Change-ID: 20250428-drm-msm-gpu-hot-devfreq-boot-36184dbc7075
To: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Douglas Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
X-Mailer: b4 0.14.2

There is a small chance that the GPU is already hot during boot. In that
case, the call to of_devfreq_cooling_register() will immediately try to
apply devfreq cooling, as seen in the following crash:

  Unable to handle kernel paging request at virtual address 0000000000014110
  pc : a6xx_gpu_busy+0x1c/0x58 [msm]
  lr : msm_devfreq_get_dev_status+0xbc/0x140 [msm]
  Call trace:
   a6xx_gpu_busy+0x1c/0x58 [msm] (P)
   devfreq_simple_ondemand_func+0x3c/0x150
   devfreq_update_target+0x44/0xd8
   qos_max_notifier_call+0x30/0x84
   blocking_notifier_call_chain+0x6c/0xa0
   pm_qos_update_target+0xd0/0x110
   freq_qos_apply+0x3c/0x74
   apply_constraint+0x88/0x148
   __dev_pm_qos_update_request+0x7c/0xcc
   dev_pm_qos_update_request+0x38/0x5c
   devfreq_cooling_set_cur_state+0x98/0xf0
   __thermal_cdev_update+0x64/0xb4
   thermal_cdev_update+0x4c/0x58
   step_wise_manage+0x1f0/0x318
   __thermal_zone_device_update+0x278/0x424
   __thermal_cooling_device_register+0x2bc/0x308
   thermal_of_cooling_device_register+0x10/0x1c
   of_devfreq_cooling_register_power+0x240/0x2bc
   of_devfreq_cooling_register+0x14/0x20
   msm_devfreq_init+0xc4/0x1a0 [msm]
   msm_gpu_init+0x304/0x574 [msm]
   adreno_gpu_init+0x1c4/0x2e0 [msm]
   a6xx_gpu_init+0x5c8/0x9c8 [msm]
   adreno_bind+0x2a8/0x33c [msm]
   ...

At this point we haven't initialized the GMU at all yet, so we cannot read
the GMU registers inside a6xx_gpu_busy(). A similar issue was fixed before
in commit 6694482a70e9 ("drm/msm: Avoid unclocked GMU register access in
6xx gpu_busy"): msm_devfreq_init() does call devfreq_suspend_device(), but
unlike msm_devfreq_suspend(), it doesn't set the df->suspended flag
accordingly. This means the df->suspended flag does not match the actual
devfreq state after initialization and msm_devfreq_get_dev_status() will
end up accessing GMU registers, causing the crash.

Fix this by setting df->suspended correctly during initialization.

Cc: stable@vger.kernel.org
Fixes: 6694482a70e9 ("drm/msm: Avoid unclocked GMU register access in 6xx gpu_busy")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
index 6970b0f7f457c8535ecfeaa705db871594ae5fc4..2e1d5c3432728cde15d91f69da22bb915588fe86 100644
--- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
+++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
@@ -156,6 +156,7 @@ void msm_devfreq_init(struct msm_gpu *gpu)
 	priv->gpu_devfreq_config.downdifferential = 10;
 
 	mutex_init(&df->lock);
+	df->suspended = true;
 
 	ret = dev_pm_qos_add_request(&gpu->pdev->dev, &df->boost_freq,
 				     DEV_PM_QOS_MIN_FREQUENCY, 0);

---
base-commit: 33035b665157558254b3c21c3f049fd728e72368
change-id: 20250428-drm-msm-gpu-hot-devfreq-boot-36184dbc7075

Best regards,
-- 
Stephan Gerhold <stephan.gerhold@linaro.org>

