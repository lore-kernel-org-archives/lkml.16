Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97416220F5C;
	Mon,  9 Jun 2025 15:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749481210; cv=none; b=bAe7wkgUIwWPk3nB28Y12dUdE46ho4+m2vtWCGeON5shoST8zavnVLYfkOxlNXUAw551wy+S3thqCsk4ZsM+Z5RDtmWiEoMLquQM2Gyt4WIJvSyebaB9/ljP/jsz0YmHVZCP596Z0T8WWmjxQ/RbA74JVRN+44wMY+OyME9hc5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749481210; c=relaxed/simple;
	bh=8Kq9YB0zmyNVXKjcaI8KvRlzGiBun9FEnKT9ppjA9V4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jZjS1ozWyfOQ53+G+M6w6r2bxPe5cvXWRCY0ec+YxjK/Mq6FZCePC8wmYVVenqWI3avGvfLflotRKJBMl7fqzTpau3ctxdx9QmfFQQfa0LuoIZnEmH4oXxgZOJiiL8sNpHH/bSQHnUGyca5Nx9/pG0X7y5yeNaRSInLzY0p7cGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UUDdh8ig; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UUDdh8ig"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-742c7a52e97so3655787b3a.3;
        Mon, 09 Jun 2025 08:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749481208; x=1750086008; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ogtXiXkx4WZqH8G79S1Yssb18krXPU183LuPTKY7I4U=;
        b=UUDdh8igD9yNJoO+3I2n80fQ3RAHTbOsX+QeVAzuAa1S/5K3qzVt0c/4G5sJTLcjkN
         5rOZ0Trc0aqQ+q8a8H+0FJ6N2hNnsgGvF1X8InhXrdVqNwqtLPXF/LiW9aHX/CP+rZLF
         HSPIg139HLR+NQKATRk6GkNU77iTL2qfD/5oO7XPpquLv0A69tNhDsENX89qC+CToeH7
         Y2HEDMfuzOWrRi5LOEOJlB8N9PQnwHVyF2/Ce+jVaF7yE3B6UZcf75KCj3eKA5UbTIRP
         2QPhpyWI4xZhoMYUvRWeV0RNEIsG4RJ2D0IG6MRl894FgIglMBVAFQVpdCQ3RkxwfDlo
         ls+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749481208; x=1750086008;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ogtXiXkx4WZqH8G79S1Yssb18krXPU183LuPTKY7I4U=;
        b=fxl7MCKtP8bs8N/xJtt7x41Ak+5RpwQUh0tGI3A9I5X6Wp3J3SrZfzAMu8/Q/asOyv
         fkdrKL6OoTZpm76ux/RRl74KyHSU/GiyoKVDSfVmq4gEBfToKi3GOM+9g0ee8Wpa+AUc
         q1i9dKQlFbnxrD5NOPmmREcdrOOtOlbytIOIYDzM2/H+MHUfjpf1/mP/aDQWH5G7qzOc
         UIBJA5Z90THS93t3rra3+7BWs2KMqebJ6Cdb+lA8KLeHRthprc3Dbjz6viNTWNgLRwov
         qIpfviph/VNNWOy/pvj9/hlVaM0aj6XZTI3stwVVEqSxOxisejm77tFICCdruu9JDq8p
         YKoA==
X-Forwarded-Encrypted: i=1; AJvYcCU/pRth14e9IW7FaEjSjr48qUjlnti5tXzZShJBePUzwvB83tSoOLatWGemAmrN576CleJUIVUcGauU1JzN@vger.kernel.org, AJvYcCUTqrg1EgSshIFudrdtjOCuyeMMOKGBeHcVlgQ5rRsFt7irUBjWVxNYMmf3b35FRW2532pj0XYpa0mQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxKuJX4MKtUNR6qfmhWfWHLGkJb6sGlOBrhmxPMwceVoVLrC7Ge
	xqzVI/eAqTvcKDyBuP2PGdcFdm5K1ZUoZNoZJuwMdttU1azteJEFTUrq
X-Gm-Gg: ASbGncuTftQ95XJmG0FS1wH5nxmU1Cmh3heBcYXBg2mrQiKybHlTDLNSKAHvucbRSTO
	30aMAU7EncGdaJh+Y+W5bY/QtMgTr0a6gABhqMfU60GmbIIMR8dfse5in1UpqoS/3jr54I5pxBx
	eAB/S0DZFgFEa37cjwWFbUKgmPkkwBr1omUX6SzcztszLVJpQweb3BvBiLe+Cs3+xtUzRY14nXt
	Emh4UqqvyfDCmZYsyP7/y7SaX50Rbo6uC4e9hLXDc6QXs8zvPUzh+pCJf/uTiX9OkYNfXB0wmCx
	DXn2yXSYiGI5kYKDiwAEuBPZtentVzzr7GwZ0VADJE0Y0kg/FL3mqguqPoyC5yDq
X-Google-Smtp-Source: AGHT+IEhXOXewiBTFc1amD6QITaRhM/nY252rISVeVNy52heMhbRNrbj/wYyN5a43z3WhemAZTQl1w==
X-Received: by 2002:a05:6a00:3cc8:b0:740:3830:4119 with SMTP id d2e1a72fcca58-74827f1284amr18716284b3a.18.1749481207756;
        Mon, 09 Jun 2025 08:00:07 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7482b0ec4aasm5988402b3a.171.2025.06.09.08.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 08:00:07 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 09 Jun 2025 22:59:42 +0800
Subject: [PATCH 3/3] arm64: dts: apple: t8015: Add SPMI node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-t8015-spmi-v1-3-b3c55ad01491@gmail.com>
References: <20250609-t8015-spmi-v1-0-b3c55ad01491@gmail.com>
In-Reply-To: <20250609-t8015-spmi-v1-0-b3c55ad01491@gmail.com>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1147; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=8Kq9YB0zmyNVXKjcaI8KvRlzGiBun9FEnKT9ppjA9V4=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoRvbsVEm9DwSwD7k+OQ2G5s5bkIeio917XiMie
 sYqiyO012eJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEb27AAKCRABygi3psUI
 JLmuD/0Q0Lc9FnDAJK7JKlsO1+iodTtVg7weyNeZx56ktb1/6T85I0X8E7qq2ppwrPjrVEcyZK+
 4uzg2VY80xo/TGM5w0lSo+r/9IIAB/9szxZ32RA4LjEOzF+VeiwB9csxdUt/ggkeRuYRbsvgG58
 DFfuTkol7cT9uKpSmGhnoo8zANLRCmGJ4aunZ9R/nfwVOMO7tr0FH/bWiOy8iPhYIMUkp3FQVy8
 4gOZzkSB1YU6uhjbWITrK/JBrMAKjGZqZOtAkwfLYCHJs4YDLosuuN//QbAzVNAoSenzd+bGhoT
 zhK/rITZAJ5N/PYDGY50/sUfvYCfCQSEEtiifDP+R4FcXkbhCXwwKoP1HWYrky8Qf0Mxxky7Sa1
 CbAJyTrTvKr+328UjWni4h3vOPclPFYFEusodryMAqbVShdGHcSYg+51tIQXi1V9tJE9rR8z+Te
 7+RFEBup3ml3cl4ikvzY5jf7RmZGZi2ZM/H8koTwGVG7mvd89ZZaq3UvFduN/z7bE9aPdKKDFhp
 MBdK3ksGQF2eGo4GU/u+EXipTUi0ksqmQeZz5hHNQeRUlRMu+S5mb28YqjFSWmmCaEOhsXkygPj
 /Rshm9rrXQULT7Sud8d5hXdgmmIhOXrjHQejzsOD2mjgXvkSKdAkw/0dKOJW7KcuVZOPVGfSFOG
 R9UmA5+bPKkO56g==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add SPMI node for Apple A11 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8015.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8015.dtsi b/arch/arm64/boot/dts/apple/t8015.dtsi
index 12acf8fc8bc6bcde6b11773cadd97e9ee115f510..2eb0d9092da3218f75e731e49132a9f8ae4d0c9f 100644
--- a/arch/arm64/boot/dts/apple/t8015.dtsi
+++ b/arch/arm64/boot/dts/apple/t8015.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/apple-aic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
 #include <dt-bindings/pinctrl/apple.h>
 
 / {
@@ -344,6 +345,13 @@ pinctrl_aop: pinctrl@2340f0000 {
 				     <AIC_IRQ 141 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		spmi: spmi@235180700 {
+			compatible = "apple,t8015-spmi", "apple,spmi";
+			reg = <0x2 0x35180700 0x0 0x100>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+		};
+
 		pinctrl_nub: pinctrl@2351f0000 {
 			compatible = "apple,t8015-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x351f0000 0x0 0x4000>;

-- 
2.49.0

