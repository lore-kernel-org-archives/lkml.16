Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3F8126C02
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 09:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738401505; cv=none; b=cX1ylLP4+HU3SyPu8mFZuwxdSs5y8wVzS+l0QkQPEdc2dWTVQbv6Pksz1BoxvxxsGxUXofd5k4CqzHeiloBaIjPCs1T1eAuccBWVpq6pmK+nuJeRALm5ppi4ti0ie0WFWwzcJvt+lfO/t9gEqFhgH438ori1ZoLI6Vr1POpknKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738401505; c=relaxed/simple;
	bh=4qP1R4QL7a2XCzsO9D2B+ppmsFIePsnOmtMp2m3zHrg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AGw8k8iaesL2eOFArQe394eaiMas542kmobnG27ySVB332sjxX5QrmFJ1GCIUsxvzYtOmd6FR0y0BptjeFbUJgOgm10RIno30q6LQM3oSE93lm7jfbrC73RY3PdS5fMv8+aRKe51s/P0aJ+xQXsDpujQhbx/i+Z3taU71sEGIqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dxs6qfoK; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dxs6qfoK"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53f22fd6832so3022770e87.1
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 01:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738401502; x=1739006302; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dzmrjdR0yHCLpHq8/GHmK7t2cRCAh1HvefbrwzlazCI=;
        b=Dxs6qfoKd4IaVC7JQ/y49jS9UraL0NV/paZo3N0ZKmFHbJYOhjy9Zxr5CuJa/nZrJt
         YcxHUOM+3+a+DPnD2/cMVF1vf7yTf426L86aQdumNpCiPHYQAaW6yaEOLe70D8qB0qs5
         8QKV2b6zagea3Z2oqzVyZsNo4Gj37FQYiT+zjUQKf51fXgpykr7ncmMoxEn7yBhH6HbO
         Q23HCk28ICfyE8SXVr4/vDZYPkbO/dmzBjGU9K0YqB5Y5G+wbYJN/C7wIUGmg9xZLXrr
         FSpZA26O+jgyqwv5IKcbpn0v+YiV0k4rKHF1DTvn0xOJjTXcNYTdgVDHy6odkBScMUAu
         YXog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738401502; x=1739006302;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dzmrjdR0yHCLpHq8/GHmK7t2cRCAh1HvefbrwzlazCI=;
        b=QL+mRhstbWaNcIYASxvtvyBdChkgdsJCX1xdWmW5NjcJh4aVPFHDSpRi5N5kMNNsQK
         eYmBl4IcGjja+vcfx0YLKVH4in2mXpqe9YyQsWYCurW5hFinIU0n9Okn9oqYOWq5tCma
         Cqdl88PWXhDZe+11YpXzEpoUAxDDwXfBZBB/MJIADss6itflaaqgyJg7Pa3kt4RaqEVi
         +x4tAtB+JUT58H6A7rmUOuLzaGhEJ5Oct3BDWWrVCMvAccLmWsuHcN5R4Od28B0tuQYP
         7813FmwX61ED0/s+XFGXABekHZ+ypx71j3qNTL8J0JirzisxghqtRWbuwxgcRbEeep1p
         IbOg==
X-Forwarded-Encrypted: i=1; AJvYcCV59hGFRD0wN6iFdf06KiVnVX36OekXQnyXoq9QmzMhupMUptsiLKma5cwwWtCpT6OOtyC1CzgLDiCV4t4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxC7MMx9WjwZH+x425mOoJ7148cBNl7b3p1cEQdW4F1AEWYNGPY
	/lzLkPM3M7ttq3IVBYCg2+vlXjFX+pH5iu8ndSJb2S9xFi2bjtGlwd7mWD7Ol/6VzDZxGDag+va
	19tYmfzwA
X-Gm-Gg: ASbGnct+F0wPobk51cOwzImMIjnS/vP7O0D44O7R3YkS5o/lQ2dO0YX1vOMHrGBcgpW
	hsdFOMbbehuRiLDB3fHAKbFxipYg9sXjILuXVpQUczs9uoaDoMPkfvs2U6LAfyceVVaq6lCVWbn
	USi8U9UYpPKCBkUAMV41jLALDWWCKtX3HjI4tor6AJJekFyNgIWNGFOez72RVp8UsWLXn0r5e/E
	dn/+VcOewe898U76hTPVGRSOeP4BpCNGPzF3/VTVKLxDe0/LOsixQiitsviZt3vlNym09/eNxDe
	ohFFQha+XlrV9k5AgcHkWxg=
X-Google-Smtp-Source: AGHT+IGVbi1/vJeJZWONWsavIaow1nP64zjVv/L4qoDCyPBTEHnkS/T9hx2T8QVksVHMBre6z5V30g==
X-Received: by 2002:a05:6512:3b26:b0:540:1c6e:f040 with SMTP id 2adb3069b0e04-543e4c3c355mr4857407e87.45.1738401501922;
        Sat, 01 Feb 2025 01:18:21 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebe0ff47sm711234e87.93.2025.02.01.01.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 01:18:20 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/4] Bluetooth: qca: add Qualcomm WCN3950 BT/WiFi chip
 support
Date: Sat, 01 Feb 2025 11:18:11 +0200
Message-Id: <20250201-rb1-bt-v1-0-ae896c4923d8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANPmnWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIwND3aIkQ92kEt3k1GTzRGNDE0tLwxQloOKCotS0zAqwQdGxtbUAUgv
 G81gAAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1089;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=4qP1R4QL7a2XCzsO9D2B+ppmsFIePsnOmtMp2m3zHrg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnnebbtNjOJgirn/5PLm6n0j45AEUUDo2C+tic5
 6NH8XK5JgiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ53m2wAKCRCLPIo+Aiko
 1ayfB/0QH2dT03oTJ6DN4/zrzi+DPNgB3ZgIfqZ5dB8phqZQPBtPlaaE2H06julMFthnRdGyDED
 5HJleC2c7WhaW5CsgUikyj00hB0fHbSKZsObxKcdi2epEIWaWW6lxb1yv4zfP5SCOkhkjBHEcW/
 D1Mxu8Zq3ixhVg0H89H7DRD3J0S0L4O0X1/ZnVYehCixInevwXk3qsBFWAJh2Ryw1whxofZM/Vl
 iw1Xnqnib4v+bKGOIFDAelHkUXNzFrnzPtJjAupV6vg04OnAgFYJKryOqqbWod5wjy89GUiaUBK
 kyDaKQXag0RkZrjgobJ13pIqMGycu5/VmtP8eSyl1Z0aYoVa
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Qualcomm Robotics RB1 platform uses a new member of the WCN39xx family
of BT/WiFi chips. Add support for this member of the family and enable
it to be used on the RB1 board.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (4):
      dt-bindings: net: bluetooth: qualcomm: document WCN3950
      Bluetooth: qca: add WCN3950 support
      arm64: dts: qcom: qcm2290: add UART3 device
      arm64: dts: qcom: qrb2210-rb1: add Bluetooth support

 .../bindings/net/bluetooth/qualcomm-bluetooth.yaml |  2 +
 arch/arm64/boot/dts/qcom/qcm2290.dtsi              | 15 ++++
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           | 81 ++++++++++++++++++++++
 drivers/bluetooth/btqca.c                          |  9 +++
 drivers/bluetooth/btqca.h                          |  1 +
 drivers/bluetooth/hci_qca.c                        | 25 +++++++
 6 files changed, 133 insertions(+)
---
base-commit: 88b6bfc04cc5f60ce79c25cd27fe83f7fb4468bf
change-id: 20250201-rb1-bt-cec7a314991d

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

