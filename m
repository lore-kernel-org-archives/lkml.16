Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0329E204C04
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 17:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738603777; cv=none; b=CJ0nTLGfJAb8cWSctPFzJUkuPEMrempygOpaSSul7/0w9oFTpMkiMz3Jnn/80Fg7TGiY8pFnWOwlwwhqXRAeMMEugPIoEJETxxTp73qxCywiI0srMUefcwTlWhjtuMksTLE1NlBYL9Ft1/f0VF3JgNP7qEUHfwhq4c0sBk1n+iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738603777; c=relaxed/simple;
	bh=xQlurBY3u5RMDcS/VvVMofyyxRzpGwGZd0Miww3VF4E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ePK78otfCr9VNlk+T4ETvQpPcAlpJ4Os6qR4IblUPTKK+d+iYXfJxQi+cHmE+nqPcWWGkkPaP1C8g/GS/Ghs2ijmNdUiQIyMSeYFIe+16GUbByEOknf7s/ZK2H7Z/IwlB85nXpPk2hugw3Rux6guCeglRPKarmjI9vjZIDb+YTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=urN+6k0B; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="urN+6k0B"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4361e82e3c3so7162035e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 09:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738603774; x=1739208574; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ac3ZGWXz9aMploZ1G1mRKC1Oavzr9ThgkWG1OTuVbdI=;
        b=urN+6k0B7T4zYV309JNuiHz6rMalhJN78SgOo/6k1mt60KhzkAv472CfHguegTiGUk
         kwK+ntZyNhq/9afDkHG6J2RH0hIYJX97/Eu55s7Ow0AB9LfRDgOiRIR04f722PxlLejK
         zyYFu7s+00e/p3l+hHH2odpBlfRAHtKe2Byk8+W/Vk13kpw0JYRhc/kzSK47BCM5Tz8O
         hAbPM5AXeghKzwA+195H5FnKen93tjrBkFdWoGvveEmLU21UeiTgLclzSwlm6pGej+Xb
         hwUoIyYebe1UxTX/j1rHDb1q2LIc9oSGjdv5Jo2BVrtMPvzHiQzMD+a5eB8dv0AygjAH
         X7kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738603774; x=1739208574;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ac3ZGWXz9aMploZ1G1mRKC1Oavzr9ThgkWG1OTuVbdI=;
        b=pbonbS4OH5ejQMHD7G0wyDjlY8zBj6XzyfNlEApdMtrJcLtS35u10m7+SdzYIftzyo
         rq4K4W7uyeEsDAdCdg1oS/xN8+tVWxSSUpZ/FpPBS843uUDD7OKkgrankk+zdt/d9pCU
         VyITnX63gMun4iAGwHOGaTml2kLmH0OgMMkL9ooLiYy0GM/d8jhRgX+HfmsLVDy057wY
         naWWir7JnHVVq6KVhuVJ+hvCivP3q4XUGkAXgpXUeoBiLJOrmQVLK60Z7CIF+FUiNtpa
         cgjy25AihcgJpZFeZrDGtzVT+6UefTsvLIH/G+MLa15Z2LFq3Bn95cQZIb1kxj7/c3NC
         gNAw==
X-Forwarded-Encrypted: i=1; AJvYcCUtnSDcVKyX+ZQnEw2hTwQWRw6D7IQTTJgUmDXWuJIQg0Px1iYgMytiUL8psOyCumnniuREU4ARqyOTBvw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUqIanEUzlTUVo/nanG7HIqqsX5VySJCwbOqKn77GwoevWOClD
	9fpBNzb+2QvcT8+5+GFZOarMadQM9lkor4WG1P1fRSCCnaixlQ+yukojlzAerz0=
X-Gm-Gg: ASbGncs6XVo/3iWlRUFTV1bBoG4e6zWCK0fWBEfCGUF7wCmXm3hmCpjrsoljNDKeJgS
	zr3SlkQbUJ2BKouoB66W4bpkydNErkLldIabbU3LSCbEj45e1/8s7wacdiZh/KazzroDaHbAo2G
	xj2vwlHi6xefzBA2r7MxYjwzJdlKKZeI/3Ttbtis2vpyj4cLtr3lIyOp/IzJlGLj9dK22lj2L/g
	LI8ojxt7hfXC8BDynnVrLMd2Y868BkvSRBdG7IsBFQOUyNet7INgFZCk0ZvGwOEdZXr/xtPg4ys
	ewIuNJfwfVS95zBmJ3EBvFY2XRzkqxw=
X-Google-Smtp-Source: AGHT+IGhFOaPD9fivuzNwrn6DbS1oY42IZc5g4YMWW4YJcP2EujI+TZGHiQLa1LvRIr4LmUuX30ymw==
X-Received: by 2002:a05:6000:1846:b0:385:fd31:ca24 with SMTP id ffacd0b85a97d-38da4e6d513mr127982f8f.12.1738603774242;
        Mon, 03 Feb 2025 09:29:34 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c122e59sm13528122f8f.55.2025.02.03.09.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 09:29:33 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 0/4] drm/msm/dsi/phy: Improvements around concurrent
 PHY_CMN_CLK_CFG[01]
Date: Mon, 03 Feb 2025 18:29:17 +0100
Message-Id: <20250203-drm-msm-phy-pll-cfg-reg-v2-0-862b136c5d22@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO38oGcC/4WNQQqDMBBFryKz7hQTsa1deY/iIppJHFATJkUq4
 t2beoEu34P//g6JhCnBs9hBaOXEYcmgLwUMo1k8IdvMoEtdl6pSaGXGOc0Yxw3jNOHgPAp5vFP
 du9qYxrob5HUUcvw5y68u88jpHWQ7j1b1s/+bq8ISq75pyFGv6WHbiRcj4RrEQ3ccxxcfDAUyv
 wAAAA==
X-Change-ID: 20250131-drm-msm-phy-pll-cfg-reg-7e5bf5aa9df6
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1102;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=xQlurBY3u5RMDcS/VvVMofyyxRzpGwGZd0Miww3VF4E=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnoPz2NHzN+CYGJtw78qYAAuNDg/s27In4dTA0U
 BeJ9Fcjj0KJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ6D89gAKCRDBN2bmhouD
 11oiEACIsS+R4Iaiy1r8xY8+KgniLX5HGt1Q7AxG8GGu+xivL5XvJ+E+v/Y0QDR1rqCXHKFg5lC
 qXRmr5H3oI+K+0P5U2V5+/VArm34IYBlq+U6m7U6nW9na4063mVZM6Jrpb/R33MPBbca0K2Krwq
 8g0KsV+KLSpAqoeHUHvwCgA74VOSGQOMFwNF481pmCfDjpUgjLLNjQgymPhqtjkOGS0E88zLfyx
 ZBFbPzH2eGvzfvUaxzoQ6I34dGaYh5l1l4U4qDZEWmEMxfRE9OuIZqKOHAYbayCDEZlJnesoqmw
 5n8vQS3tbtSvycOIJvKXv9x0AygwMaANZPNnwidfOBLXYv3BG/H8SswC4BhXMGMVr9s8scVeU+L
 AfJkIvX2my+lsXp6eCgZnunR/DzmgXlUz2Iv6BxV4L8B5qkGyB5xr1BzJi7lQZpL9wO8mIY3hdm
 uTClZC+t1GBWv6h/F0wNiijzn7xM2RAd6a/7fSs4v53wgH9la5s7z+EpRwSraRD6/Dm2B6n5/Uk
 LEydvTFXBQJ8yhTHlI0BB/FW+QC2yFT6n3LhrhD1lXf+Hb4b19kIUGHfl8DMpR9QbZmlmFOoz42
 CCCcSrDa1qnaceJQakW1PflS0FQfeijiGuLN0Uj3+JunMFAihmORTDToxEk5dAFoWxAYPJPAsm7
 qd+wyiV0WoYdlbA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Changes in v2:
- Add Fixes tag
- New patch #4
- Link to v1: https://lore.kernel.org/r/20250131-drm-msm-phy-pll-cfg-reg-v1-0-3b99efeb2e8d@linaro.org

Calling these improvements, not fixes, because I don't think we ever hit
actual concurrency issue.  Although if we ever hit it, it would be very
tricky to debug and find the cause.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG0 updated from driver side
      drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG1 against clock driver
      drm/msm/dsi/phy: Do not overwite PHY_CMN_CLK_CFG1 when choosing bitclk source
      drm/msm/dsi/phy: Define PHY_CMN_CLK_CFG[01] bitfields and simplify saving

 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          | 70 ++++++++++++++--------
 .../gpu/drm/msm/registers/display/dsi_phy_7nm.xml  | 12 +++-
 2 files changed, 55 insertions(+), 27 deletions(-)
---
base-commit: 3270483b5a99a2ada44c72d6c2ae20d77c6e5c28
change-id: 20250131-drm-msm-phy-pll-cfg-reg-7e5bf5aa9df6

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

