Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C292F2E11A4
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842912; cv=none; b=L4RuUuO81uy4f2apKvktV4lQIlmd5RvgiR4ihdFIGVKrN1kwMXK5KOpERnzSyNXHWAezqOE4ngvk0icg1FgDkXQyyKapxryZyPg2AhVo8e0WQzfP6OZma/pHEFTwVLTh88HFKjU6HvcCJYQCGNdN8frYj/KRwfdgT8sFx2qUu3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842912; c=relaxed/simple;
	bh=aHm0Jgy1AJtO2/QKW2dbDq0Za7rk572Z5sUBzOZUKws=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FzfJJ2WK89LOrTolJ6NuRxt9XH5FeaBCChVs3E6TNSFBHXDMkDiIWB3yUcOwPmfnZeP4xGLDxgEYWM7I6CiR9sP0zzSUkQWbNesSdaIgKM2jW/Xvgx5bzI1ftfKs08LYZnR7rnl1+CDqpDHtbrjmYzqqmgra4V7dq7c1Ik3XI4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=y/cSamu/; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="y/cSamu/"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-60702d77c60so2667209a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 02:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842908; x=1751447708; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BNbmjsRfs+5MKtBz+Hc1str0LQgPAk3FDVI40gqDF30=;
        b=y/cSamu/KYUC/mwBldPIZMs/t7e/8VV7CjxIT56XLZCPuLx4l7ZAR8dPazZU4xKJF+
         85IhiRlT/K35/RPILhkdJw24hOt647U4fHLQz7dIVOGpo8NIHzIOnboyQFhBTANZ2smP
         MwaPb6beqCWKh2ws5S2OtUYOEIBOmzh03q/pZ0XqRhVrbdPdc41DeUzJ4QFbyMQCvlrS
         knxutuKPrGB9ZL61hWRxRuk/Ih6c1nhjvYVuJWIHL8fUsKU/4OZM9E0tVxFLC9QeHY8q
         ra2XiU6n6WXReyxZdK8FUT1fSkr+ZV5V4yEAUDllDjyuq9XJAyUpyBGxkqzW9OLyjzco
         5zWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842908; x=1751447708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BNbmjsRfs+5MKtBz+Hc1str0LQgPAk3FDVI40gqDF30=;
        b=ht4QfVxYDgBPy0dK7bB3bmoEuHVu8MzQ7QTke+jg7Dfs0cugysFG1ydtmIVD7iJQfW
         jcj6ppRmIxXy2q9QGAgvY1jIigyaVstI5cY/15YzuoPBg8jMtSIZeDAnGEo5DHqaCHrm
         nwNmAhl6f7f3CXFVAfn0pfTwdeAHrBdAIZ4G4dI1upkKP+oizrVEEcyxXzZ3m+xPYND0
         Z1rnsIvKa0vZfIdn46Dp8v/Ttvf6L7zYvkMVl/ZhujJv+thSW17fYIsHOhVFZwC6ldH1
         ZQSe5BUPwQojp4+p5Ft+n7CnZ3RGsthwWXySybE6a/flJGv/hWQJGBaitHgXXXN1Qwzb
         SlDg==
X-Forwarded-Encrypted: i=1; AJvYcCUkzmZm6KIEwcaBtHqodr8cj8l/9/Sv+0Dc5CmPBcavr1aGxckOjy/tNCi54fhmcE59jDP4Cfkn2y7Vtyk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6tH05MtAwWAhe7jDwwXyS0vd72myXUVnYt0QkRPWnU8Q/klPs
	lmKgMcn/C0l9+KAH1hQm8jNLt+7Z7m6XrX4gQPRjJyZB6nBtzsw/RZR/+9dLLZb6tI0=
X-Gm-Gg: ASbGncuTPag8EKrkR25jx8blBUD0LZbe2VY54x6ypKv0c272ygK+sb+n/nAbNH8VvPb
	69etPJ/5LvB79xgt6i0W45r9yFwjnl+eZLvkppwsIRZNmRoMyG5LB3ZqQpcy/jUAwd6FIkgGvtE
	d1isfTwveq4qWOzPHLGBdgLG6v0Ley1Agb47gX6SQdxOXN8Aq1OyxQWTbAsoobFK4VulQMszgbs
	+0UeMWOsG2/xaIOCVnLtF5ORlhoD7p51nuJAVDB18cHF38cLubkOKt1NughZ1P86PLrdmu5K2jE
	DjvvFy5uzwZf947V2GNHYAyfbnIxJ8viF3Rdb+vQvJrku+ItLffBrviZDurdYnrzhNZKF8iBzRa
	SBft12GpdWL3NZLsqYotnR5649hS5FWGD
X-Google-Smtp-Source: AGHT+IG57CJz1isUSxtWVBBEYQRRLDGKKU4vhjDr8x5m4ljvRrFsAIMJQ9U4pd0h5IliaKEAweVcYw==
X-Received: by 2002:a17:907:9085:b0:adb:41e4:8c73 with SMTP id a640c23a62f3a-ae0bf216613mr160528566b.55.1750842908235;
        Wed, 25 Jun 2025 02:15:08 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053ee4c2bsm1008972266b.71.2025.06.25.02.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:15:07 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:14:58 +0200
Subject: [PATCH 3/4] dt-bindings: phy: qcom,snps-eusb2-repeater: Add
 compatible for PMIV0104
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-eusb-repeater-v1-3-19d85541eb4c@fairphone.com>
References: <20250625-sm7635-eusb-repeater-v1-0-19d85541eb4c@fairphone.com>
In-Reply-To: <20250625-sm7635-eusb-repeater-v1-0-19d85541eb4c@fairphone.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842904; l=892;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=aHm0Jgy1AJtO2/QKW2dbDq0Za7rk572Z5sUBzOZUKws=;
 b=VoHPW5DMLvNPMM6DDkiYwX+LlqHDBFUGbIVQ1Nh8rd4tWymfU9M9U6C73Yan+YQLqkLap3kKf
 I7X99swY3UvB8Zq+wjtFZbCPYxBkueCtQoSzMtpo3vM+aIUkFEJTORx
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a dt-bindings compatible string for the Qualcomm's PMIV0104 PMIC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
index 6bfd11657e2992735998063b3ca390e04a03930d..5bf0d6c9c0256300d00f84307b7f6ccf669f17c4 100644
--- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
@@ -22,6 +22,7 @@ properties:
           - const: qcom,pm8550b-eusb2-repeater
       - enum:
           - qcom,pm8550b-eusb2-repeater
+          - qcom,pmiv0104-eusb2-repeater
           - qcom,smb2360-eusb2-repeater
 
   reg:

-- 
2.50.0

