Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA381C861D
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 13:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744724887; cv=none; b=s2t3glisANp96wPLJ2zrhFbxCH/DyN9y+PQWhy48uVSBrJuJpQZJyGbSvgYZMZIuNiVzdzXQzObhH5J6vmltHNuZG7LQkwbPQektF2lhWguW4Pj1YjgNtch4q1131pUgU41AuVmY3j1CcaBl5bwXaJsHL1zsFT3tiLqYjFPYaz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744724887; c=relaxed/simple;
	bh=TF5iaiyVF7pffStsTB0GQItBgvhj+hCdhoNBSo25fFM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h6y1LwZ72Xf3XCw6EXN1CW53XFUgbR3zOvYyyRXcHf8jM6GHs3vNxurNko82/macubu3rYm8Pu//v22fmKdG3ti8O4vhbSwpCxnx+Sel7UBIh5x8UK5FMyGOMzHHq+iaXuIseAmb4BLi30EOPJowiIN8Yv72lmcqEHaAchPqNLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uX7ePMb5; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uX7ePMb5"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso61120935e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 06:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744724884; x=1745329684; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mLxtG9RCmepkYDqnM9TbB2c+xw9+ALwx6QUQs/1V+xA=;
        b=uX7ePMb5Uk8f/4Nbg1fyOupeVHlvF37RkslCB4lmE9VZQ1lbw68mrjGhiKIWhaKVJq
         F17xrkKCZvt3KGCj9VBT8risEIpqooqaOPO50nvZ8Fzm4c0FcG+rYO+GAJeAAoa2I4z7
         3YHg1Ibg5p3hztjbNAgCgdxSyABz07rz0VU/ncsz7+hJI9UvyFECnLDYbZXtm8AbHR15
         u7IBGNbw39sK9ODk5043SvOHzlqUkSjapOE0MdHRuUj2lAagSSbE8u1seU9Pjnjiw+6/
         hjdUZp7qYP/iws/pN67aKM399nePmJ1V5+L0vy3y5ZHtXYu+vn5GkYLm/bPEBXLPSdhr
         5GGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744724884; x=1745329684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mLxtG9RCmepkYDqnM9TbB2c+xw9+ALwx6QUQs/1V+xA=;
        b=ds8LrTJASjui4uJWSQ68DgMLbzLfLe2HZnNrCJLcmIb6qyTeRc0AcTgMqdXhdqOfZW
         76657VUjrU2R6EG4Z8iCtCZK4EdZUmzw/qglXlc4eEcJf2hJ4bES7y05lUO7C0nfyu8/
         tTq4vife6IoMGlIhk82zgahip0xlpNJv066y0KhDxJKQtLvqRBrBgMVjN7nyanVlcp1z
         GCAoCz0JyDmLfrPyMMR4NgqXSzj31MKQUzKkjcsJJpZrM04cfiAnOU2mbFjkqWfgpekH
         zzPrTengsj1qKWjDaq6xcuucsS982r5HmFAPugWmtEUoSx4XwUYTOAHd1tz1eZXze0P+
         KhKw==
X-Forwarded-Encrypted: i=1; AJvYcCUEC2HUu5LipG1pkXuFeR9bY+Te/8FpA7z+v3U1r7TQsdEb6uErt2SspkXMPGMRvWvijYtTR+DejeUWXnY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7DA0PzSeazgJ9jlG0fBQwm7rwkPrH1cscyQUIM9aPUZO8fFhI
	GxdwWCp4u2/6x3dUFniDeFZTU/EZ3fGurPVG/jmQZblSOilc9+aaKcax7AVdm0Q=
X-Gm-Gg: ASbGnct0H1j4376+pD8kchiYa5QtkfISVbYc5ylYPx2bXWt7MurGbfSxtTsB+eX0Ht/
	awlEcVPkQZsV+lc97U5kEweN7LR3gIlXknOEED7fZgGNT+PhH1ZIHG4m5iwJoBPW/5dEaHUrIum
	YbnZQzN9tfx5vDnWJX3cdmFnF4UFguVOE8mqrArOgWuvs2K29yUbPQ5h4OgZwOi7RhyU0Xyweq1
	qNwKpNL3cNWIfitQJeysP/JJ+jZiuVNzIMjDTw5a1H7aLwC7SNnC7iO6hUVZ9JNb4koDSdZs03r
	K+5HTbpQYVrdGUiNZPA48t6qQcGNKS4XyjN5PiaphCl+ixoQZeuS9Rzgu0GCDg==
X-Google-Smtp-Source: AGHT+IHX8LyCdt3HsfySnPiUJg+yyAZ+504sur7Q5LuGp99/7EULmDAuVPHP2u2hRNONJRiXw3yvqg==
X-Received: by 2002:a05:600c:1e28:b0:43d:7a:471f with SMTP id 5b1f17b1804b1-43f3a959967mr150937515e9.18.1744724883552;
        Tue, 15 Apr 2025 06:48:03 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2066d0fcsm210434195e9.19.2025.04.15.06.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 06:48:03 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 15 Apr 2025 15:47:58 +0200
Subject: [PATCH v6 6/7] media: platform: qcom/iris: rename platform_sm8550
 to platform_gen2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-topic-sm8x50-iris-v10-v6-6-8ad319094055@linaro.org>
References: <20250415-topic-sm8x50-iris-v10-v6-0-8ad319094055@linaro.org>
In-Reply-To: <20250415-topic-sm8x50-iris-v10-v6-0-8ad319094055@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1368;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=TF5iaiyVF7pffStsTB0GQItBgvhj+hCdhoNBSo25fFM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBn/mONdlcCMlu6uM2Mkezm5KHDQQEBq87XseQjCD4m
 ebhAdSeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ/5jjQAKCRB33NvayMhJ0XbSEA
 CWeDCdZKIYhCBBipC+hUx4GM80SEgfREUg6dogk1aic91bynv0R0TSVT4C2Q18k51z90+2WvBzzd82
 PIcmdyvTaWnyw2uPGd660DAYUOgQpmTLZp7rigQDE/3nAhIjVhjaCicGlkjL8nxaOtRffwswMfwGFM
 vgKDIXlzMV+2LmTXHnlSpRHXLbuakrhthKA0Jnr1jDh3+SxjJgBG+zcADVngUMio5xS0xBiPPxaxAr
 cSWKCFO4sTXHZ/sB3bK9nrSBYuSlRy0Luh1vj9zkcikuai4aSl5M10TGiOYlwLZ244sd8IXO/Alq1q
 sc0sBtlyZxdPLPJYLR+4zpZFWNFgrUYRa/hzjsYAp4/gmY4C3Qk2uXm3hwYQX2NRThDigvAWAt9Jmm
 ZiQG4U4KpCvRizroJwPDqWH9ru+tof8Qk6bfaFOf5GY2BhL8MEdBsMLbVMU7pixKCk8PrbgJ4qtGAv
 YEkdueYbhOOENyFATZxQuWiJDKp0zOlMWAsi+K+jw71UzeBTXIqVFInX4pB06Cm+t87+hv++YdooZH
 ttKhBnIhDWZ5QNRfM87omdRVTzs4owVxKx6b+55pJCh5YsOk7NiKFho+MXt3J2Fvm7h5WagcbSm1ox
 nkE5sO9qyHp6uq/GY4HP55pYlXbj4do5XfAdJW+sT0wCNOtHzkuit4KijXaQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

In order to prepare for supporting the SM8650 SoC, move the
iris_platform_sm8550.c file into iris_platform_gen2.c that will
contain all the common HFI GEN2x structures.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/media/platform/qcom/iris/Makefile                               | 2 +-
 .../platform/qcom/iris/{iris_platform_sm8550.c => iris_platform_gen2.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 473aaf655448180ade917e642289677fc1277f99..e86d00ee6f15dda8bae2f25f726feb0d427b7684 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -10,7 +10,7 @@ qcom-iris-objs += \
              iris_hfi_gen2_packet.o \
              iris_hfi_gen2_response.o \
              iris_hfi_queue.o \
-             iris_platform_sm8550.o \
+             iris_platform_gen2.o \
              iris_power.o \
              iris_probe.o \
              iris_resources.o \
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
similarity index 100%
rename from drivers/media/platform/qcom/iris/iris_platform_sm8550.c
rename to drivers/media/platform/qcom/iris/iris_platform_gen2.c

-- 
2.34.1

