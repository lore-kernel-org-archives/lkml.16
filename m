Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5093291C15;
	Tue, 17 Jun 2025 22:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750198352; cv=none; b=NF1u8Ki5IkLJJ472Hx7XTeJJRGtSZOgJDICLFrfXdTv/lKD5aIdqZR1vN2TB2UFlCm2GO+1Vf5ArVjovUB/czy0I6MblJwxENY9qeLrlMFaGXah2nEwpzYio5Ett7y67k3R9jKAqOTdIkLU61/W5S9ire2tx6U9YjDd/yyOeJOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750198352; c=relaxed/simple;
	bh=iBFPnIJ1XWdp95oH5d/8rmzNu8q1Sunrqh13k34sRp0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DlLy9hQkk49xSEes2x5kWXGbugiXJ4lrPUiMSQYb1V0Wk2gZATcxV9AQ+eYojxvvHbokN1/C+diV6Ho1tdW8KPaVDC7O1nJFrpO6ibrUYxnJcdDfGhyjIEYLtoR2c1ehriBDjpM5KFtHI8fLf9iWR2MHT4ds07R2iG1bY4XQ0yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a+XyKnTP; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a+XyKnTP"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-235d6de331fso77432315ad.3;
        Tue, 17 Jun 2025 15:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750198350; x=1750803150; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BGDiShgPaJ/KizI/MxA6K0aCKSZpsX1RUOoVfwBsQgM=;
        b=a+XyKnTPrl0nfXnexq9u8Z2nyL00v6wzJFcNtJSbXL3JsDTQRi6qayUxYht98W5g6g
         BP/6XzgFEGm4WbHFSlJmGocfhKjicNF+KAqtsVtNxqs26PTXK/HLl0LnJoPHLP32Gqw8
         OAYlnNAyhTlvmbalM3o6Mjb45NqynjLnT+MhleSdogyZY4WJCKY4PL+Lsx4Id7/JxTcg
         6IHGAlPXF4ofWmR+RXBBv99tVpDnR57RRkm8oettloMjKXyiLl6scjtbZsW3NjoNFufW
         SYtq8WfLy1SssW727M0+0TDDg6GNKD2FMVc6a0W5hPUoDcRFlgDSRtRgpAm5ht1NGzJy
         SGhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750198350; x=1750803150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BGDiShgPaJ/KizI/MxA6K0aCKSZpsX1RUOoVfwBsQgM=;
        b=dBY91WsZsB32yirBiw6HQ2r+D+fv6gOzED8H/ftDzoJ24ZzhXf1WIOiJOoIMfG9dhd
         569uYC/ynIq7D1CmsvsOfj6yVPRku+kc9aVc9Ok6gyhkNUqqoSKw54eua1QjlEf+aQbR
         /dFM//ZwLUCWmJEnvttawF9KPUWa5GpIZmbSOFO6w9IxWcdUebdjce13RsEESg+CSNmO
         vvkLxiAzhxpCTkW3yTeLYQ8zBHpbXhEApt/9JL1j1uFvp3gEcfWFekaVRURfNK5CzkSC
         Oc73eRRgWBNmFLZmcqirChJbrIhFvjNU79fCJ3yLoSubLDIrzlBhkJPd2CGxcSNoCxkg
         MjcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvFrQlfuAyjNcVl9/EqsQbVnSNUMUWmjVoS5uRnb/L7UM8h4J/AIPbmUHXO5Vj6YPUlu6DyvWhcwt7xrvQ@vger.kernel.org, AJvYcCWwOsayfBfZqHC84TZVLZnAnzCOmEVlF1HScxYVcATPQ0MohJ78RGSrtFlMj6UT3T6rWaPVbwAbxWsz@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2yddeFVUYkQ5rfk0ojRMTGbvWtaCfC9Zply3OPOIXWEK8+65T
	SEqUDdCNpUEQZq3EVsgtjBArbXOxauFNmHeWYZbgB5O7Ra0L7Q68zuMVWMNmH90V
X-Gm-Gg: ASbGncvhwO6U5HmMG+jBhgizpl56cjfYceNstq/I4xLvrR5luyQxfn3KOVMOO8kc6mm
	HOhQWag2hpXQevE/d/a/XvqPN7r9wCAhWvlAS/a3MgAsvHNBtrhOmZ4kI5l+y+MXEAJCRSNHnKz
	Dm1lQob8rPZH9Q9uhiBs7CxN3aYN/KIke2HEHCIQ2IT4zd5dJm+O365E+xsT2wPnxjW+WTF/5Cw
	s3R+AVDpbyAzbxPTCJXYTTwjsDLYI1BnonIPXUMquBwFNXl1oqxhCeotmT4cL8SG6/8mypnsq1F
	h+7Qq36xPBoEF3AHwh8/9Lfu3gIu1DWgmCruojjAI+tRG/UwBq4Bk1G+remczg==
X-Google-Smtp-Source: AGHT+IF5l521joGviQ6qJ7mk1oRWLvrbnwKw8YQGDh+zR8SMoGmwQjIFoKO4osgO38XwuebWSt3R4A==
X-Received: by 2002:a17:902:ce89:b0:234:b743:c7a4 with SMTP id d9443c01a7336-2366b149510mr254790825ad.38.1750198349879;
        Tue, 17 Jun 2025 15:12:29 -0700 (PDT)
Received: from wash.local ([50.46.184.91])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de781c7sm85862635ad.128.2025.06.17.15.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 15:12:29 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Tue, 17 Jun 2025 15:11:59 -0700
Subject: [PATCH v5 1/3] dt-bindings: arm: rockchip: Add Radxa CM5 IO board
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-rk3588s-cm5-io-dts-upstream-v5-1-8d96854a5bbd@gmail.com>
References: <20250617-rk3588s-cm5-io-dts-upstream-v5-0-8d96854a5bbd@gmail.com>
In-Reply-To: <20250617-rk3588s-cm5-io-dts-upstream-v5-0-8d96854a5bbd@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Jimmy Hon <honyuenkwun@gmail.com>
Cc: Steve deRosier <derosier@cal-sierra.com>, devicetree@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Joseph Kogut <joseph.kogut@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

Add device tree binding for the Radxa CM5 IO board.

This board is based on the rk3588s.

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 650fb833d96ef67ea1bba33c0767777378a38fa7..64b0a0dfcf12a75af908ab723d5a4dd9bfba8167 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -840,6 +840,13 @@ properties:
           - const: radxa,cm3
           - const: rockchip,rk3566
 
+      - description: Radxa Compute Module 5 (CM5)
+        items:
+          - enum:
+              - radxa,cm5-io
+          - const: radxa,cm5
+          - const: rockchip,rk3588s
+
       - description: Radxa CM3 Industrial
         items:
           - enum:

-- 
2.50.0

