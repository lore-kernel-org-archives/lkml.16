Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616B122D4C5
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 08:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751011323; cv=none; b=ICUNsWBpVia02FL6YcWWhoozBXvt9qJ5vbtknmsaoWWd9z0tLtrsSKoDPf0VDRYtCqshM1ZYf5iJe9+YUVFZTZBtFsMbsJe2HYGZJMSxL5BbhI2Z23h4+jUDWPS9l/iQPCWixaxcLlZTwIKgkHnhe2bWjsdSM/TTcF+004XymCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751011323; c=relaxed/simple;
	bh=Iy4rMuXXapFTx2kjSKugMlp9I0/iVWn0dY70WllqPHU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eCw2s8AzS3kNKJ0KBaGX4ve7sTxpHRmdITollKVkYm3umP6qtpnRCpvymwf5xg+HiSfBKBnmOFoA8U6i0Zrnf8d9BYsSsA4NZP6VKZsQAbtapbswA8aSIvDuG/f8vItDiASt7KioYo/okoptqeNTNTKLKyi0vReDDloma5tDrT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vjDK3oic; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vjDK3oic"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45362642f3bso2664635e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 01:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751011319; x=1751616119; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Unci+r7LHL+lqoLwxDlrvWa0BMlTjBqi0rK62HQ+/+s=;
        b=vjDK3oicVRxMSSm/0nkh2KE5W+QTSiZNBCDDCbPIxhdbWKH/sBnCb0gWFB0qXWmIPG
         YF9ACXlb0bjUw18Zh1PEn9zPWkdeLFKyVxQ3FkBVyj+5eb/JGm/uyxVoXfA/NgtIRaH8
         MAYayGv6FLq1Ei7PK+N8GV20JtSBMwH21g/j2nLWodrxV5Zs8UwKIq4UeLjdZxqi7yRm
         URXMBuqiBwnUA7A7+BOlbxyGeLg5fSURYZXriuBL5ajsBsiDr9vHdOt20h01pw7ozwwg
         pW6k4+l3iD5gLij5ffmh255r9v5ExcBLhEn+SQD6PbGkEISbh+/bRAW6iFTa37jcAZN9
         SNaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751011319; x=1751616119;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Unci+r7LHL+lqoLwxDlrvWa0BMlTjBqi0rK62HQ+/+s=;
        b=hOAtp700VHRpuA3+pTtH0UOZUsHsaryGKKBg6hoF/zqNmDJADJhyYg0DQYL5T6mgvc
         tjjnXMjMlSgMxksu12KMDkskLucjzjjc5NX7odvHmoOhQmkb3CpjnuHky2k8AznGDG1d
         7Ewt06Dnh1m0FN/DgQWr36NrgEoCFlNneSw//V9KnQSgdQhCbryr9w+nO86rwArAQ/HF
         FkCH9jIK7Q9isbt13DeIyEYxDwkmd/+sDXtAAcdHD/tDAW1DocwB9qzj8Ra6dP3O3eVC
         NImaDKX0dmJAm2Du+IA16m6MVEpMBZqC9GN0X1IVlK9YCN0DFhxt9mwzJOx9PU4/Yzj3
         H9Zw==
X-Forwarded-Encrypted: i=1; AJvYcCWcjculJuNjMONNhY47selWUJbJoJiK5MoZJJ6MH21kplq5LXME8xYYRmm63n/enqzfbjhqDwREkxt71p0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSpIZQ0aXw0N3vMBMmw7OArSFmGCTMREBHxIh7GXFxhHMYqi0E
	jSG2RlCM89FRdwWJDCEc1XwjoIuLPB8KF48FqAvttOD+HRJrAQk4xTASIKkAjgd/w9Z1I+bEw25
	MKKt2
X-Gm-Gg: ASbGncvtyEFwwYyazxPHi76PBO20YDR8c7J3n3HMBKoadDsOHwatJu6OFbaxNtgXebK
	EevpGk+6jsQbyXc5TLyikFaAB9b+/tFI5AWvDNuC+ofWzmJvsQFDT6ESxtbZHMuRkqU85STv5gL
	81SrnB/Ue3ZPzXrRJadzg37NlblsxHgMtnRsyKKJ+AemQPvKN/4AEjXv7BnkCPXUV0C20EXO3XV
	ZdLP0Fkc6Yj17yCEcqgGEypRN9JHuF4erTnIZP0PxvM4KFrChu7QQLW5vvdKP355tN1KFPDNWCg
	gL1mtQk6s6SNkEW7sp0wCYTPHh+fuCJxANwr/cEQ5gEjtYQugf6kvhazL0hpw+CC37+guB+xXLB
	v
X-Google-Smtp-Source: AGHT+IHcfWFGNWC16F+T/5JDKvwd7eGwjNT+A6IGrz+imkl5/bKkRK92RXClDJ3nlxfVmYvbeGIitg==
X-Received: by 2002:a05:600c:a08b:b0:450:d5ed:3c20 with SMTP id 5b1f17b1804b1-4538ee7446fmr8751165e9.6.1751011319205;
        Fri, 27 Jun 2025 01:01:59 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a423abbsm43490295e9.39.2025.06.27.01.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 01:01:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/2] dt-bindings: Drop 'db' suffix duplicating dtschema
Date: Fri, 27 Jun 2025 10:01:50 +0200
Message-Id: <20250627-dt-bindings-db-v1-0-d5c7072acbee@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO5PXmgC/x3MPQqAMAxA4atIZgOx4g9eRRzaJmqWKq2IIL27x
 fEb3nshSVRJMFUvRLk16REKmroCv9uwCSoXgyHTUW8G5AudBtawJWSH7SjWEnXeM0GJziirPv9
 wXnL+ABL1hPNgAAAA
X-Change-ID: 20250627-dt-bindings-db-38eaa005ccd0
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Vincent Knecht <vincent.knecht@mailoo.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Li Jun <jun.li@nxp.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=755;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Iy4rMuXXapFTx2kjSKugMlp9I0/iVWn0dY70WllqPHU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoXk/wcCM14kQDF1d79XXpGo8n5HZzTk1uWzDKp
 WTG1g2l4lSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaF5P8AAKCRDBN2bmhouD
 1ygSD/9zKEcjWzeAnre3VyS4sy8f/zuzk+6aiVwKfnQZNwMLddjHQaA4tfav4oTxeiUDcSNL+Wn
 OMw5i3B3nkWhbJbCvXb1c9IIs4qgDoSs4y/ZINqcWYZi7JuadQq3iAmvUQIDpctu9n4oDo2fPb1
 QldagXo4+4ICRKcYtBlC27JKFS5/Nyjk3RFHS0wii8DA+I6f3rN5Cia7d4KGVjP8sfI+lGSdpD6
 d2P/A+kT4bQA6Py7S8kPKt7QgqQbpRb8wi0+PE/J1TRQwyyfepG7WAZ3nxOzKvwcpRMnazhaCKz
 H5ADmhne9Co11Z0QG1QDO/GE5zh6jm0EmHfAOCBFNb8jEJWvsm8/eQkWq12GVPBeqitfEvycGBV
 0PVlCuEeM04wH5rKeXKYYILSX/G3EtUFBmg5cK5HRgvYb/O+H0o9PBz9UBf30NeqT96QQFl4PNQ
 lXTA2aPpeneel0hmnCgE/y2BRa2WQyIuz2VRRJQnPd0llunwXN+DfXjYoPs0nhIGTDX8so3mII1
 QAMHU+cu9+B05r4P9F06eEAGIqitbczfPPpIZ0ZL2F5PeLCAX/U4Qw+nnRfdMxbFX1oB1/xG4wm
 igtpvpkYIau9eiYialHk0wxplMxEBmIMR8/2wEhyEOmomVGoEaWwZLJixnDMgYzXoLLVSsGCSYv
 MF+OFeWgcqtydng==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

RFC because this depends on dtschema changes and should be accepted
after new dtschema is released with this merged:
https://github.com/devicetree-org/dt-schema/pull/166

Best regards,
Krzysztof

---
Krzysztof Kozlowski (2):
      dt-bindings: leds: issi,is31fl319x: Drop 'db' suffix duplicating dtschema
      dt-bindings: phy: fsl,imx8mq-usb: Drop 'db' suffix duplicating dtschema

 Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml   | 1 -
 Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml | 1 -
 2 files changed, 2 deletions(-)
---
base-commit: ecb259c4f70dd5c83907809f45bf4dc6869961d7
change-id: 20250627-dt-bindings-db-38eaa005ccd0

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

