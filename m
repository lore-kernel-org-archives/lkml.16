Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A8A1C54A2
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 17:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738430955; cv=none; b=PbkNC7sEiZBfkcRTMgyQc5Mg6jidVio1l6zazFoC0pt51J3rifX+NkVb7gHjMnGXS4Mi4GTSmVX8bTqW7ojyOyOgH7fjLL1TpGHcN5fFOhq43NF8F10Pv3no+IUiePWmBZ5pkD92iW8wvzXqXKXW5weWny+FMxGdbQPUBFCq1pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738430955; c=relaxed/simple;
	bh=bZIfvsXbEXYqzmKSTUZGNOhLXdwKlob2BoVHyug/+5E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NlnIJH8gwIkwcOueSvOPLN4qNv8C6Do51GrAyK23MkYBuGDCVriLN0kfuyw51saZyOixlRrsNHwcUkxeyGHSQuO6pgMbbm7cVNGliZF61BJElEs/B5c1qLOWLY7DpKL3jO3cxB4SH8g5ea1h5K4QuraiEk3WmKl0QxDfDCh1SWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LFVRABjJ; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LFVRABjJ"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30738a717ffso25116171fa.0
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 09:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738430952; x=1739035752; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yiAMibmCHf3AP+cOZ4VRKVm1kSHRKQ96VjG5gP5/ww0=;
        b=LFVRABjJj9Hz+dCeedJWuS88IV8WXa7fiz7zqzxRik0JItEehQajg0FcxvkJIwMW4v
         1QCXOxa0Ctaec+T65RVJjcaBmtbmbnXy620v6o1FWbvfr6PNHmgTkltnQ4gttWwUI9Zb
         5a6RFrpo0O8U6VDVQihIB2ryZn2W7TkwcfrZA17NwbxOW2dqsNFya3IxLlquKVdy4n23
         ZaZS82z+15vq0fb3FZkqBfajyYHZTTqhE/+UHnQvZKKLGl9OF1ig4WriEu1bP4Cgwbqn
         tTwIBeGSOmAkoWkdUgOB3JTmuak6I+h4eDDY6blnHTqfjkluIV9OazaMs7Uf3dzWMtI+
         6m7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738430952; x=1739035752;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yiAMibmCHf3AP+cOZ4VRKVm1kSHRKQ96VjG5gP5/ww0=;
        b=KntFmODUN07LC4rRtFZ7oRmyWXhJF1MbA6xizbRHo7YBHahPHkez/ahcFhCjFIHgWz
         lH48zrsKhnr+0Aywz/UwwoXwSDLYpxKE15xLX+UX0J31febRucZVIlLGTdpla+6NkVOf
         F3Wzb+q/yuuEbD1HBXEYAyyyG2dY1qzehItCUcwKvyY2jGQQ5RBC3WBjT/srndIQyOs9
         m0Va6I4iyk/HQ6m/Lnywdi7Nyuw951T++7R+iqpykUqfuLqfyXPRU9Z4B93QwReSDFjX
         3VA3tTOS9vSUvX9iu7X90fXn44gA43DLsTNGs/HogHp37KHTJqL7wh/d3Npjzv3wj3bZ
         qg/Q==
X-Forwarded-Encrypted: i=1; AJvYcCV6QNHZFP0gwlWCXjAEnh5U42Z8wvQw0ztMzxmTyfEyyGLpnfYT8KkIf4yJAhP5QH/HyRwHy7Ql0s9PFpI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/hOVVTT77xiH8kLwp6dOgQp3XS5Mi/b7h0z4VTtYTKrVXt8Rw
	uhpkcRxus0nZB7677cdEnNP0KnEZHM3aEwtC6c+7I4w2CQZWiyTxhCLqCe9a5xXnn2k8riNnY0L
	XmIVNVQ==
X-Gm-Gg: ASbGncubpF0lmsNjOG4vnH3sSY85QVslRPHKiHWab8wCsI94ta89UYQFDl7URSMhTv0
	LxSvkUGva/7Rv34bg36BHwwje9FI/fT9ev69BdmyB7tT9EW6C1DO8lMfSibJonHSUpXguQUQphe
	9/uUtq9fJgiCDL27QVUscPoxYHEnZZHjsATTnt9JH3On9Jz1iVB2WtXotnli0Zhq+ojnmaO9QpW
	KdZFg+rVQBs1/Z+o6nimFp6z+tu16NKdue13vATUkh97Re//Dhc5E+uILS7e2rAe/TtE+91ZbsI
	DUAr4N8UaGPDPy5cwbGnrMo=
X-Google-Smtp-Source: AGHT+IHRHYSwVZnX9QQjEgdiq1EsFJNiZyKN0lsG/LCyM7xf+RanpO6j8YDb7KQGBcnEcXBWmWC0MA==
X-Received: by 2002:a2e:a54a:0:b0:302:3c78:4e17 with SMTP id 38308e7fff4ca-3079694b76bmr44979531fa.29.1738430951586;
        Sat, 01 Feb 2025 09:29:11 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307a3099ec4sm8852161fa.48.2025.02.01.09.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 09:29:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/6] Bluetooth: qca: add Qualcomm WCN3950 BT/WiFi chip
 support
Date: Sat, 01 Feb 2025 19:29:06 +0200
Message-Id: <20250201-rb1-bt-v2-0-fd44011749bb@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAONZnmcC/2XMQQrCMBCF4auUWTuSpFUbV95DukiTsR2QRiYlK
 CV3N3br8n88vg0SCVOCa7OBUObEcalhDg342S0TIYfaYJQ5KaM0yqhxXNGTv7hWd9bqAPX8Enr
 we4fuQ+2Z0xrls7tZ/9Y/ImtU6Ki3Z99Z04b+9uTFSTxGmWAopXwBZSXt5p0AAAA=
X-Change-ID: 20250201-rb1-bt-cec7a314991d
To: Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1539;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=bZIfvsXbEXYqzmKSTUZGNOhLXdwKlob2BoVHyug/+5E=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnnlnkrtNc3K2dMel8dFcEtGQARsWe03fuuJFDI
 LZO0JMC2kyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ55Z5AAKCRCLPIo+Aiko
 1bF5CACtNlWRDxOavbwPfvhT5xdLXGi0R1bx6mJShDUAIa+47UlS9kUdRSrkO+7KTG1lbj3jnbc
 ztizE9tzen0br4qzGorx1b2mZPH2wJpqyxI4VV/1Vj+McT7kX1kMBnh3TCqZoJMEiY9qe9iLCfX
 VadINvjcXk53cI1W4WNVRozzt72N1SLyvg3ZqGh4MGG1qdLPrXVtC+f3mrdFwWYZEZTH86mY4pS
 /8800AyStr+se9HA9pAwO77RKrTWx2rHYo07NbQqb+WvZ0hOVCAcXcT0eg5BDuZO9/T0QNV0q+W
 ZEhWL+NMIrGc5ok+a/7xdEWjLKGLdRX88JQAa5Asx+FB97P9
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Qualcomm Robotics RB1 platform uses a new member of the WCN39xx family
of BT/WiFi chips. Add support for this member of the family and enable
it to be used on the RB1 board.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Corrected QUP interconnects (Konrad)
- Added /delete-property/ interrupts and an empty line before status
  (Konrad)
- Enabled downloading of different NVMs as required for v1.3 of the chip.
- Link to v1: https://lore.kernel.org/r/20250201-rb1-bt-v1-0-ae896c4923d8@linaro.org

---
Dmitry Baryshkov (6):
      dt-bindings: net: bluetooth: qualcomm: document WCN3950
      Bluetooth: qca: simplify WCN399x NVM loading
      Bluetooth: qca: add WCN3950 support
      arm64: dts: qcom: qcm2290: fix (some) of QUP interconnects
      arm64: dts: qcom: qcm2290: add UART3 device
      arm64: dts: qcom: qrb2210-rb1: add Bluetooth support

 .../bindings/net/bluetooth/qualcomm-bluetooth.yaml |  2 +
 arch/arm64/boot/dts/qcom/qcm2290.dtsi              | 31 +++++---
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           | 82 ++++++++++++++++++++++
 drivers/bluetooth/btqca.c                          | 27 +++++--
 drivers/bluetooth/btqca.h                          |  4 ++
 drivers/bluetooth/hci_qca.c                        | 25 +++++++
 6 files changed, 156 insertions(+), 15 deletions(-)
---
base-commit: a1d1e1f2fae5fcb5f2e43b81afa9596c606e683d
change-id: 20250201-rb1-bt-cec7a314991d

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

