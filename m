Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395AE252904
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 14:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744901949; cv=none; b=UEf7ZGLknlIOcfXrwq+aN6Nedpi1YmNhhXgO1sx1MLfvd1/Tnl7aKySy+oNQvZJxp6k9sDeay4eaENyJKuZvEa9w96sipsiXJs6+VsJfkNgdzXw9BXkOVNA958KDyp9dSqrrCfuYmYjszx3FE4p2GERtf59Xk+JRjHKjrLP26mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744901949; c=relaxed/simple;
	bh=30atmlfDlcoJWCIxeCb6bXPhahGm7ms9f75U91mKmqA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PdIyRjpiXn4/6XAeWI7eY+1lVC61FieZXvSgF0mXVeWFZtErHHx7vuVR/hcEQwuJ2y9p3uJe7X/U8fVqoXFayoWJliSAK1L/N11dQ/kwXIJfFPBZOWqM5L0mj4FFzkkhybe1PQuGOPBGvQxMN4iTuvK/g+EEG2+8p8o9ILGSVkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hBLR7qAd; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hBLR7qAd"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3912d2c89ecso875735f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 07:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744901945; x=1745506745; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UlbkSTKT+E1gVO1ZzstqaxLwM27OxWnBw3d1X2SDnFw=;
        b=hBLR7qAdCT9CoNcoMoAWYzF0iB4hBBm3Z4rIGJzfbmN55SeOsykrh4rWXpbDFTj2UU
         tU33kNdyy0UVPrKmJ7FED4a42AXWD7P6x/BU995Yu5u2ff+oEY2KjhgySLH1e/o3FtJo
         OTXrISt8s+AjPa3ibP2oqfeC6uwpA69rTCx2ImT2zhYL9ZpEzCYlGeVbNcsrcutIxANW
         H056EhlcJ4i17MFi2AZw1xp20QOvH+jLbHf9eqVqjZ7Svb8GjIHlEF5n6womGZexFrWg
         0I1+BrcVggkjYfvV6ve64de4zUps/lPuytCWrdeZnoEuS776DSiAEM+ztpPRBxkMhuIK
         53Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744901945; x=1745506745;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UlbkSTKT+E1gVO1ZzstqaxLwM27OxWnBw3d1X2SDnFw=;
        b=UeyhnsvA52aHrwQtN6T6Epcn2gmq4ZEuIx4dUPhv5XtAmG7pYKaJhYwkVPwCyL15bN
         vXYoJIPXOkTJ+j74ZelTvK2OPnyaKul8gFQyyRF19iPhOkBPW0k71V5bM4h14K6DnEgF
         vmc2IzaxMPBnbdX/GkEhHpfiXKAU6ykGLGCKiz1rHBwWMn3/BiLE4gWhKI2eUiF9lWuQ
         gzRbstVFrnxiw2XwHh7e3xMTVlMCi8+D7hfKCAL3/6TjDXv30y0jzar2J4kAQh09TNto
         hrD/KzzBdNjdVyFlY8fmKUcqK+f7plKKeHP41+IAz/uprC6ykzRj1Pwt8DJEADI5m7Cw
         wDOw==
X-Forwarded-Encrypted: i=1; AJvYcCWysCsWf9jhHKB4i0VZq1nktFmD8Rt2bgslEYWawQO0vVZB3FMrW2P0Joem3rGxnvZYLq1mVWE7pif3AW4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDeN2V1YQyG5wK1vB4cAPcovg8/xAt//6THQtmPyn/Fm2HpfcD
	iPJcyHgdeJFXy57C9SHoOUWfsm/sh4pjJ7AQZYekdxYMZtcvbfUSp/yzMPw5W+E=
X-Gm-Gg: ASbGncvERgD2AYYfTJXYlJh3v/b7fmbf8e1sJZIQ4UgLDF8JcwRcdR5vumc6U7RxVGf
	OnPMfjx+EngsZ9DzcTtaE/cAXOONhvvaYz/JI8dtWfOdWZSITQaqbdPF4WPuwuSFw/eatODPo4Q
	+Dxflpc5UI20gkij4Ad3p6zscbOUMrR3qf8LWVJyhG71E+ts58jjL1f7KHSVpifX29M/ElyHW12
	5HXuK86w3fQU7J68xltnX1MDpBMAtOWe1rHKID8ZOS6xorlI5icoU9mt5338j6KKappe/NNJC2b
	Xmq6nyeJGEfuPiS3MwAVOsFb2q+TLONKelWQqWf7Bihy/rOC2JCszJMzrURopQ==
X-Google-Smtp-Source: AGHT+IFdyZV65JFyDvZKwMf2d1zwYL2rgFsNLxJCHdyyJgGb3WlpTrseDJbN2JL7fp5TeXBugwcG5Q==
X-Received: by 2002:a5d:584d:0:b0:391:41c9:7a87 with SMTP id ffacd0b85a97d-39ee5baf64bmr5566325f8f.51.1744901945499;
        Thu, 17 Apr 2025 07:59:05 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf447914sm20497743f8f.97.2025.04.17.07.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 07:59:05 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v7 0/7] media: qcom: iris: add support for SM8650
Date: Thu, 17 Apr 2025 16:59:00 +0200
Message-Id: <20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADQXAWgC/4XPTYoCMRAF4KtI1mao/HbKlfcYXKQ7aS0YO5JIc
 JC+u9GNDk0zy1dQ3+PdWYmZYmG7zZ3lWKlQmlroths2nPx0jJxCy0yCNCCl4dd0oYGXs7sZ4JS
 p8CqAeymwd971uutY+73kONLt5X4fWj5Ruab8+6qp4nn9T6yCAxfSxRFMQGvN/ocmn9NXykf2J
 Kt8MwpWGdmYPljj1TgAYlww6s1o6NYY1RirjMXRBtDeLxj9yeAaoxujIWohDGrplqPsByNWR9n
 GOB+UQEAN5i8zz/MDu8jjJ9cBAAA=
X-Change-ID: 20250225-topic-sm8x50-iris-v10-a219b8a8b477
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3713;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=30atmlfDlcoJWCIxeCb6bXPhahGm7ms9f75U91mKmqA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBoARc1NrcLmrtPphdtHQU7nvyXMZKe2O0AGIFinTd4
 /RKgzGaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaAEXNQAKCRB33NvayMhJ0ZiiD/
 47cVN2xi2s1GZa5pvsOTOFUssRZ2qHHgRHuiZFpmgFY8ywLim7ZvUac5+8Xk8ALjZCt4dUZOQzQn4D
 QxdMYDmvGecrplM7i49pg75sGKVVYkvJTdZMlvrG5HoeylIBbfyHiSTpeNkWzBrxuleHW8F5w4/E61
 f1+wQECt68bk2sgu1e+p6jQ199x0SBS2jkMIihAtcRTj1/mAFBP8poAWo4ASQX/wABLvQFfZi9rB5h
 hoHqH9RtkPWeGSlnlFe+/0SDXU8Vbih14dYYazCZu9G9v5N8/+apbC7gyKVt8l9qXRbeX4sOcUP7Wu
 E7jlpqfP1YbZLLZFNXjv8aHdvXnjI2D7znb+83i8N1gSTu4XRwG4G3S95H/P8QK13VEUorhaxdB0eE
 t6aG7rA1LbhbY4mqJdJbuU9Ieznsinown8SSvmcI0izMzPADI9q5G4Wh0IOPCp3OW1TpbmBr/SFFA4
 asnhk5RbgGwT380By5pLWMWFtSKh/h8Y9s2CYH0PlQ72C82IQghjmGLTj8hXTMMB5EcStNBvHObIpJ
 M2v5Tc9kmheDtARAZYN6T4acD2PVod1MmczeKt+BG6l3NES6m0QKLQVrTL0JCsUZIgnIQKcKRz4Bc1
 BsnN5Tvt8U0EJckejVyklOSGtdz95t6tX5OnzBiDHKYDaORzFJvlBBSTscZw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add support for the IRIS accelerator for the SM8650
platform, which uses the iris33 hardware.

Sm sm8650 SoC support also reorganizes slighly by renaming
the sm8550 plaform file to gen2, and move soc specific data
into headers.

The vpu33 requires a different reset & poweroff sequence
in order to properly get out of runtime suspend.

Based on the downstream implementation at:
- https://git.codelinaro.org/clo/la/platform/vendor/opensource/video-driver/
  branch video-kernel.lnx.4.0.r4-rel

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v7:
- remove sm8550 platform header
- collect review tags
- Link to v6: https://lore.kernel.org/r/20250415-topic-sm8x50-iris-v10-v6-0-8ad319094055@linaro.org

Changes in v6:
- Removed catalog files, renamed sm8550 soc file to gen2 platform file
- Moved SoC specific into soc specific headers when adding sm8650
- Rebased on next, fixed bindings
- Fixed errors reported by CI
- Link to v5: https://lore.kernel.org/all/20250410-topic-sm8x50-upstream-iris-catalog-v5-0-44a431574c25@linaro.org

Changes in v5:
- Reorganized into catalog, rebased sm8650 support on top
- Link to v4: https://lore.kernel.org/r/20250409-topic-sm8x50-iris-v10-v4-0-40e411594285@linaro.org

Changes in v4:
- collected tags
- un-split power_off in vpu3x
- removed useless function defines
- added back vpu3x disappeared rename commit
- Link to v3: https://lore.kernel.org/r/20250407-topic-sm8x50-iris-v10-v3-0-63569f6d04aa@linaro.org

Changes in v3:
- Collected review tags
- Removed bulky reset_controller ops
- Removed iris_vpu_power_off_controller split
- Link to v2: https://lore.kernel.org/r/20250305-topic-sm8x50-iris-v10-v2-0-bd65a3fc099e@linaro.org

Changes in v2:
- Collected bindings review
- Reworked rest handling by adding a secondary optional table to be used by controller poweroff
- Reworked power_off_controller to be reused and extended by vpu33 support
- Removed useless and unneeded vpu33 init
- Moved vpu33 into vpu3x files to reuse code from vpu3
- Moved sm8650 data table into sm8550
- Link to v1: https://lore.kernel.org/r/20250225-topic-sm8x50-iris-v10-v1-0-128ef05d9665@linaro.org

---
Neil Armstrong (7):
      dt-bindings: media: qcom,sm8550-iris: document SM8650 IRIS accelerator
      media: platform: qcom/iris: add power_off_controller to vpu_ops
      media: platform: qcom/iris: introduce optional controller_rst_tbl
      media: platform: qcom/iris: rename iris_vpu3 to iris_vpu3x
      media: platform: qcom/iris: add support for vpu33
      media: platform: qcom/iris: rename platform_sm8550 to platform_gen2
      media: platform: qcom/iris: add sm8650 support

 .../bindings/media/qcom,sm8550-iris.yaml           |  33 ++-
 drivers/media/platform/qcom/iris/Makefile          |   4 +-
 drivers/media/platform/qcom/iris/iris_core.h       |   2 +
 .../platform/qcom/iris/iris_platform_common.h      |   3 +
 ...iris_platform_sm8550.c => iris_platform_gen2.c} |  62 +++++
 .../platform/qcom/iris/iris_platform_sm8650.h      |  13 +
 drivers/media/platform/qcom/iris/iris_probe.c      |  43 +++-
 drivers/media/platform/qcom/iris/iris_vpu2.c       |   1 +
 drivers/media/platform/qcom/iris/iris_vpu3.c       | 122 ---------
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 275 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.c |   4 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   3 +
 12 files changed, 422 insertions(+), 143 deletions(-)
---
base-commit: 84e171e5991bc3cb4a71a7755ba93391da22e838
change-id: 20250225-topic-sm8x50-iris-v10-a219b8a8b477

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

