Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7AF62777E5
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 11:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745321141; cv=none; b=kG2wviDmixPk6xzWpt6OFZ82d3/DdZPWmR+RcdMNLemg4iJJ99je1w7m7eyosVznDH+ZJRmb1xp4yGJ/1mDiGcWwbMmiComxA4/ZZ+fKyXWmvTCURLY+zWrBMNvesw0Y3nZorAWq8lHXHT7HS5H31SmS+uzDfxwVlFmAx83QobI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745321141; c=relaxed/simple;
	bh=mjcZIS1sSTOV3vBIaA/aDPuvoJjWXpCDTghUnSk+/1I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DIjOzuflfYIO4H2C4H4SW3E5bjpeQk0RPYswhfAFe4wRFJ5PwOq5KVablV/LBUwIsmOVke7kTgEKTImut0R/NSVe2n3A7cJ381yWHCAa6uAxETNr/0VlJOXn7zODYjI2JuOqtQEvgdhwMqKLuJvJNvG2hRrstae1L0a6JpVim2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MvWbxX9q; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MvWbxX9q"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac2dfdf3c38so833161966b.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 04:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745321138; x=1745925938; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fe3P15Atc+bTSOXM06LPyzPgb3J7Ws1BpA/wm5ZQuHM=;
        b=MvWbxX9qflME7sftJS3+y51EYd5eCZdc0y9WEftxss4uZaMaUAhkLN8pVUf0EVQDVp
         boVQ/orjldID9vfm1trdNxeNO54rL53BSysH3Tpv0MBdVLxqIHPFgVaimcIhfNfZW7wT
         qyLuwPn99T3wdoy0GleOvgJrXmwvbb1hXBPKKb5UN6udMgAntJ/LzxzAia/vIzdoLGDh
         H0ruj1ePjlttQKHvC/kby8ggC/VGNyeKczWHzGTF8SBC75R34IjxxgIZFC1alMn7Zmyw
         WzWJCRov/PHmjkuwM8/66HLZXSd4vdVQGB0fSPL9PqW885ENVbGgAQQBI6cv7lZlaEEk
         P+gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745321138; x=1745925938;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fe3P15Atc+bTSOXM06LPyzPgb3J7Ws1BpA/wm5ZQuHM=;
        b=dX8IMph7frngD5x5cOfp/KymjFDraerIe39MoDsTCikaduGUecVY/3vjUlr/0Sig66
         UB/q/LyakA73NSGsa4sfHK7pHPIDnixKv90pdPYvB8p0tTAqx1wlO7uCtnOhPd+e5GDZ
         34ss2cOl+id+SHlYo5+3L1QEpHxsIIKXIJlXsU4sh3ImiryTCtOEmXHFUNaNrXhgjJyg
         PSce62aoxU4WCCEon5AP/JdHtroxKiDISfdX3qe5Y8yVSl0dYHuh4GIaYMmA3Hj8aha/
         xTAAy2WWDTXQI1kywlbLY36AcRk7dbMVnBFWFFLDsMuXaZVNw2l2RvCILpWKNb1cQipu
         CxRg==
X-Forwarded-Encrypted: i=1; AJvYcCX344cpGJ0jUuFuu9ENbDxPZvHChGSX7B7d2shw5VN+2cwvdzRjY3GbhS4TJxxw5RFr6aY7uacZAKmxVw8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfoEWZnCiCADCvwzcvq96s/XcNk+NR/w7zYfEX5GD1KDlQ6lT5
	XcxPrDm6PG8CVFGZ+eEnnlw9N2LJUw9XZUtR78k6CpZaHjFr/q0F8ZX5mSL70gg=
X-Gm-Gg: ASbGncsFics4ra/gRt+IFmfkO5PBQNnsF1ALZq+khWD6KmXf3WZz5iZF8q2Ousnhw2X
	WTWk1u/+/+DCLAnFEAgNQyEZMTvqJPXKolTAcm3Jl+a85itMcqtOkTaeSgVOykAlHqHGFrtVAXZ
	p0mIScvlCwKcVdoUmf4SUwIvn0eK1kwdkRQdsjXLboI3GZbi9ggPU8FH2q8rOKml7zRfweWkf7Q
	6UA/XnXsj55n88LLQZf/Mnf8DE0sHN7B1fqM6q6qRVNXho39lHMLnFQQUPem3bfarn83cHYBdAJ
	EYMCD5oWSWy+x3eKArw7giXxHg7uuCdPv3plHLE=
X-Google-Smtp-Source: AGHT+IE9lW5g0YYInkFbQ5pngf6VKtN0ACE4saTnFH+bjEE/AkZ3cK9UlUfQkhNYOk92oXCpU/M3gg==
X-Received: by 2002:a17:907:3e9f:b0:ac7:ed72:3426 with SMTP id a640c23a62f3a-acb74d65adfmr1090219466b.40.1745321138071;
        Tue, 22 Apr 2025 04:25:38 -0700 (PDT)
Received: from [127.0.1.1] ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef45784sm630692366b.129.2025.04.22.04.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 04:25:37 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH v2 0/2] arm64: dts: x1e001de-devkit: USB retimers related
 fixes
Date: Tue, 22 Apr 2025 14:25:21 +0300
Message-Id: <20250422-x1e001de-devkit-dts-fix-retimer-gpios-v2-0-0129c4f2b6d7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKF8B2gC/5WNQQ6CMBBFr0K6dsxMUQKuvIdhAe0AE5WStmkwh
 LtbuYHL9/Pz3qYCe+GgbsWmPCcJ4uYM+lQoM3XzyCA2s9Kor1hSDSsxIlkGy+kpEWwMMMgKnqO
 82cO4iAvQs61LqpoLklHZtXjOp6PzaDNPEqLznyOb6Lf+W0gECGSw0UNVYo/m/pK58+7s/Kjaf
 d+/t/zWwdsAAAA=
X-Change-ID: 20250318-x1e001de-devkit-dts-fix-retimer-gpios-bed83169401c
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>
Cc: Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1005; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=mjcZIS1sSTOV3vBIaA/aDPuvoJjWXpCDTghUnSk+/1I=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBoB3ypv5idLYFVDXUdPZ4YXrQTcWQbWsK+ZLCDM
 qmMFAuyb6KJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaAd8qQAKCRAbX0TJAJUV
 Vl0FD/9VwX0a0oaNmU3G2ewc/ieUXpKxf7dDVZUcVQxk8CTrClGkuHVFYYpbvHCOSdxGzlERTFt
 jmsj/jaOYZETTblFbbbKdtpQ400kL6FmQLecF1ODm5p3OSyMnUDdKDka4mhXzIaUNlXSIwGpLhY
 Iq/A5uNU23ygfwBewPXfmCvJN3jywDgVWFg6jtPNdmeJXyXckJVnpJxJKJSy2taURVrFwgrU7X2
 ai0i+U5Yo2Shj0goQgEvqkj3clh3jAvS/3Qifncpzr/p2bSHBySM0o61ibDEmsyvYPXjmcJ/J30
 4ZC7euxnnKsivwjljHAx4kvkQL5y/XG7/0J6sXem563VPjjdskgYolX0NseL3+xZqZeyWdBX1pn
 CnyZzsq+lkosE12EYIeiAWXDnvDqojCpZ9Q3zZtm5XDCHKDJq6r+AH5eW/Q4tk/L3l1dj32YVzu
 kkmPR1uXMkrFrN1D/M4PjPDPV6M4NjH/99eYmts0VIj5lGFupv9WawqThl/RyswNvKfmP+SXFmI
 pBENx9mBUBSxgelpK6NuXqfJM4NNj+3KAQ0yPK74QKFIk5fmbKliZ7NLq6Wb+SgBYFl9RT8J+uD
 OTwqA78c+nLkuRyopgfOBKlH7O9cVX7cXPBXYyiUiG9nJPXeRNRCMnM3uGH8MjN/2joDvBJKpZg
 SmTV2EAplmihTgQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

These fixes align all the USB retimer related nodes on the Devkit with the
CRD and T14s.

This patchset is based on Johan's:
https://lore.kernel.org/all/20250318074907.13903-1-johan+linaro@kernel.org/

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v2:
- Added space between voltage value and SI unit in comments, like Johan
  suggested.
- Picked up Konrad's R-b tags
- Link to v1: https://lore.kernel.org/r/20250318-x1e001de-devkit-dts-fix-retimer-gpios-v1-0-1c092f630b0c@linaro.org

---
Abel Vesa (2):
      arm64: dts: qcom: x1e001de-devkit: Describe USB retimers resets pin configs
      arm64: dts: qcom: x1e001de-devkit: Fix pin config for USB0 retimer vregs

 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts | 44 ++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)
---
base-commit: bc8aa6cdadcc00862f2b5720e5de2e17f696a081
change-id: 20250318-x1e001de-devkit-dts-fix-retimer-gpios-bed83169401c

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

