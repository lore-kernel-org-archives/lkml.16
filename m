Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B401F4295;
	Wed,  2 Jul 2025 05:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751432672; cv=none; b=VJeu0LJU5OITEwtkr6oTjeVfpUyrvJuwyOB5yO7DIsxrAZLtmIsiifwPjVhxL8jHKZHmMf9tj3b92nWiTHFfjhQ5/zJCNEXKM9FGhx3npL9QxYMfFlQoEPy3EyZx/yc8q3h/xjpPeqFxCMPe/3bIr8AJdD5lqcU4aHFDOfZfYx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751432672; c=relaxed/simple;
	bh=tYDGH+tKQbiuHyQ9E2lc4ed0L20yYIFPhEfISMxXCQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IsYrpiz0KKovPET6mckFoYt8Z8qKj7C3T7F6fFBma9NsITl2U2WHlifiydHmUGC+eH7R3uqKxZBTvbKFtakPGfiFMHt+0wdlAtD4al487iXaVQ+DhoskBXhP5In2WMlVSr5m9zZhrtkSJdZDMa93Y7y/G86XksJx1nW7HIlYyTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M3akCcCd; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M3akCcCd"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b34a71d9208so3075060a12.3;
        Tue, 01 Jul 2025 22:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751432670; x=1752037470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zQrj9G+pYLe79Y4PNdw8/vBJhfuXZd5KMGob89u/rGQ=;
        b=M3akCcCdLh5gh5IxEnTJ/WKvylAIVnRzgABwFEOay9kur336ztrVzdwFTd0b6npVji
         dagRXdYAU+MG1CLVXn0ezGwLZeXGnGrdpgYGShTBJOiuiOq1ORrBlH7K/qDFTgKmCcE+
         feAlzAe3OtCUDsWPdSKi4WyUuIvrU6q4tV43EbXV6c5Hskv2VmUv9/24gIsoUqrdZ0vs
         uOpF6FUdiwoj1uNiOxre26mBszEUIw+eHCPCTw220Su08MIiUL4gqruH3WE5bEk9Ry6y
         PACL5j0FivZw4Hdbf12aLmEiZlxQb1G/P4jOKzBt8Y4z2zRHA8tusG3vsFcrfI2r5SIl
         Nepg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751432670; x=1752037470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zQrj9G+pYLe79Y4PNdw8/vBJhfuXZd5KMGob89u/rGQ=;
        b=d3pNWcJ9j/PV9E1Q36eyU9bL4gAOsf1drkZBKKHXqS82VkaBu+4u7HqkQFNgBsA/fU
         x9pQq6J0d6inF9Pse8MGj5LD73jfq2CM6L5lrgMXo8bzbkm8Eqo2BpzCp818YuLO8qkw
         WSG+m68bhTrs3u6/nWayzBRrZO9YTuC7ZfZX7YMrgxLLessIzGhXxsvr1nj2dRY6VzQT
         lKwL7R8h7tEj6qo1TDOakJkAf2VuO8pX6+VrT7Lwx43VOUjwwBkZ+8VQKzW2HDh8LbIC
         z0BbVzhkUlBOvNqae5901a4BMSQ85eHZ+ZgeNO9li9q3cAG/I2RWZg0XnALcu8RTQbpT
         ZfKA==
X-Forwarded-Encrypted: i=1; AJvYcCUZGRSrJ3BdJvJDf5J17tKtcW67cbcmZ+Pz8ihd6OyO9a+9WL6apsiq/N6KZXAheWOe8BJsCsYZdTAD@vger.kernel.org, AJvYcCWDHjNPOE4UxJTNgD8j4Zswdyu13Luex18BXNanaJ/HmRwoO3m3hzU8wyOjWD11hqucDVVcqUzdba8EqQE3@vger.kernel.org
X-Gm-Message-State: AOJu0Yypn82DxMmvtu91M9lIO5qmqDh8t8HB/tiYGDzA3V0KIFcUiBnF
	0bOwH9Y2IH3x26gVBvQch6v2mRkp6gxRg/bl7f81F1cHIplOd/He5D/0
X-Gm-Gg: ASbGnctvpF5QqnHvvTcegeu8pSynFaFiDi9Ce9IQUftKopGIfzC8M1Rj5Xb6jaZELpR
	nf0icRQF3titkOcFcQP+4nHIMec4giuhN1tTYeYqlHtC8B3xkqpPx5tvAvFjqpkU4gbo6Y9VYng
	aIw7gfjVJJO5O9dhJGvRJVuz15/hDOoEK9yYbgvdVSP71GGPypNrieM4+SDqrukgAEMXW+DmkLs
	cIMkjgpadRJpp5jQ+e4hXdA3z4opOzxvpW31WHkIbHC0Ec4Htljzqu/WVFFRgiIeCeRG4pXS00H
	fZU3HTKvHFJiWQ98ugHaDAgdKUSidx48DqC1SbpYajuHAYk6dtf/KRejl9xCPUXWydUnRA80yCq
	9weiySuJ6efQ2zama7hS1URJPO2cDDi13ODoQoo8CQ3x8xvOeuA==
X-Google-Smtp-Source: AGHT+IG/tQYmoUziIZcUILlZBz8yZIswDYIZla/dao7Lol524L9vULDjUhgzMHUYch+zfG8/Vy8Ryw==
X-Received: by 2002:a17:90a:d64e:b0:312:18e:d930 with SMTP id 98e67ed59e1d1-31a90bd4c31mr2059561a91.19.1751432670269;
        Tue, 01 Jul 2025 22:04:30 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f54270a5sm18168323a91.25.2025.07.01.22.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 22:04:29 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Tao Ren <taoren@meta.com>
Cc: Tao Ren <rentao.bupt@gmail.com>
Subject: [PATCH 3/5] ARM: dts: aspeed: elbert: Enable eMMC device
Date: Tue,  1 Jul 2025 22:04:14 -0700
Message-ID: <20250702050421.13729-4-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250702050421.13729-1-rentao.bupt@gmail.com>
References: <20250702050421.13729-1-rentao.bupt@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tao Ren <rentao.bupt@gmail.com>

Enable eMMC device in Elbert dts because the eMMC entries were removed
from ast2600-facebook-netbmc-common.dtsi.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 .../boot/dts/aspeed/aspeed-bmc-facebook-elbert.dts   | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dts
index 74f3c67e0eff..ff1009ea1c49 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dts
@@ -201,3 +201,15 @@ fixed-link {
 		full-duplex;
 	};
 };
+
+&emmc_controller {
+	status = "okay";
+};
+
+&emmc {
+	status = "okay";
+
+	non-removable;
+	max-frequency = <25000000>;
+	bus-width = <4>;
+};
-- 
2.47.1

