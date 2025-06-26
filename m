Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE502E9EBA;
	Thu, 26 Jun 2025 14:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750946708; cv=none; b=mFPT/yy88zOD+13Bl/ONqtWrF0oP0PNbtgoillF+jtuKu2uc7/z4mVkXYTnSBE/ikI3KuqHFzP20jj18ncAEpU8OAt1IeSpx4rgMFo7xOMqNC7yn/wYb6hma6sDKguwHos1C0H1WMkuaK7X33mlF65AOSnqSNie1vwCMeBEaWEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750946708; c=relaxed/simple;
	bh=5glfHsLODiLO/3oY+r7Ho/WvBwzsT7tvBipgzjRr/7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KzfSlqlxn58vYcunxK2k1qbLEBcwWL336rHOW/p7oZIg5hQQASIS+eY2sCt4C+a2wmk+ErQXXR5BmXHyNpTpn0pXk40kD6HNV7z2LpsUNkYWly2geCiMZXRPurQfGbtCl+Kv7+C5rCSYgEUOzL+X5Zgx4qbR86QGxNRGKSiwNDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wsa2U+pd; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wsa2U+pd"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ade5a0442dfso196751466b.1;
        Thu, 26 Jun 2025 07:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750946706; x=1751551506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gBJ7OED84IgzfwVu3bE+rwCJsn8ySsLoxBG0PUK666c=;
        b=Wsa2U+pdSWqlJfkQgDNV7dp72nGddnariP8IIb1LWMPkYn5tB3KCOZw0lX8ZIFFv6+
         LEVNfrFTRQ5/V5N/WE4ssKTPG99UlulHtjczxbjGaWzPxgfRE7OEPn81g0fIx5NTLaOy
         Ox+Z/Q18nPi7jJBJaSkXixAnu81gZpR2av1Oiz20QkMnAC5myafvbhA6/Vv9s+5w7Fr1
         4vTFy58MmGR/PWaT6STMGHgKBePNQa0OMJ5RH0+DLpm+Ro4/oCqb6JdVNmaLKPmeAei5
         SqEBk/GyudPLVit25DsosKo6VEvzHyqWB2cLF6EescBvjyh28UvVIQb1qFLFcKm+o2nb
         nbHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750946706; x=1751551506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gBJ7OED84IgzfwVu3bE+rwCJsn8ySsLoxBG0PUK666c=;
        b=w+xdLd09hvRjLBig8VTa1BDhif/ND5LzLncJHXkdfi6pxbl3Au19+dbadeCauvLXSD
         W607rueT0HzEGPBMB7jGZ3ZHE+t+WqQYy9NCiwKaBgcSZIRa9z7wTl/rRrKK2t6JNRlV
         skrDMGxCZ83ZGKW42X8rP+DSRV5s1mrP+vO6VkdTB+KnS6THTAn/c8ulzvTpG9wmL0F2
         8zhuQkg9I7ac9Dj6AZFjdyNAGSUgxbN8tdiaXnoSJt+EgCEn8d9UOwsRqndslgtmkt00
         0KV7kVPnJvydm8CFjNtiT45q7+a7pRfs/0673z1PY0EdJqia32GPWYiQ4foEs+puDVcO
         dSeg==
X-Forwarded-Encrypted: i=1; AJvYcCXWUPf/kmZaJS7R8VA2zy/Bf6AoOHFF9atpSyqPYZaNS9Qr3wJCiVeqWVX2VyCAz4FrUf8dWdr5gbndjaU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDpaUjIc/ecVIlTzOfzPC6ovouM51vV2i6cZZNMzECs7Zs0J6B
	1hIGEhNOY0RvHPYtxuw5EWjh6/YJf/rHDVrTJM17/bLV1x/1GqcM7Tsx8PXOnYmymN3baQ==
X-Gm-Gg: ASbGncukF8sGq4QkZ/PxInCwduV1DEKPi1/7OzQwwKZ1eWps35UJi7Gw+vA+YamSsUg
	7KgvncUooKG/3s7185DvN96TwaOk0O75JmkC8hllhaWX05xMZmPrAIs2LePhFMM6YEdP0GAumJC
	HuMF5xkIKCLk5BK7pCgREzCvihG0SDWWjutZ/tJOGdNz19QgGQFUicIeMXcyKjvHluqNsEsJxEM
	SP/1lSOFtLvfAeM3T2NntxR5T8mQW87KTxp933eoMkkbvhYdvUj0RB8I3Pd8GiGVr6z1KWafmiK
	+2IwXFYH1TmdXZOHN+og+XKHhZMyovlpAcKz8AU16ykQJgl53w1qKd2/525ewSi/PgxL7QxotfD
	0A86o6cL4HDffvXcd4D5hVA==
X-Google-Smtp-Source: AGHT+IFd80UBJ9vtN/l6OUaJDHUD3BJNY6g8XS2+oodfwuAVCEg0kkWD1KQ9A4HIdysep3bsRoIuoA==
X-Received: by 2002:a17:907:724f:b0:ae0:b7c8:d735 with SMTP id a640c23a62f3a-ae0d0d15a2dmr422647466b.42.1750946703732;
        Thu, 26 Jun 2025 07:05:03 -0700 (PDT)
Received: from localhost.localdomain ([176.227.88.86])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae2143d928dsm3958266b.107.2025.06.26.07.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 07:05:03 -0700 (PDT)
From: muhammed.efecetin.67@gmail.com
X-Google-Original-From: muhammed.efecetin67@gmail.com
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	heiko@sntech.de,
	neil.armstrong@linaro.org,
	lee@kernel.org,
	rafael@kernel.org,
	efectn@protonmail.com,
	daniel.lezcano@linaro.org
Subject: [PATCH 5/5] arm64: dts: rockchip: add Khadas MCU and fan control nodes
Date: Thu, 26 Jun 2025 17:04:32 +0300
Message-ID: <27d9dccb3eb8723a524950f9dc6e78b7f99d46c5.1746518265.git.efectn@protonmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1746518265.git.efectn@protonmail.com>
References: <cover.1746518265.git.efectn@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Muhammed Efe Cetin <efectn@protonmail.com>

Add Khadas MCU fan control to Khadas Edge 2 with 4 fan control levels.

Signed-off-by: Muhammed Efe Cetin <efectn@protonmail.com>
---
 .../dts/rockchip/rk3588s-khadas-edge2.dts     | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts b/arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts
index 2c22abaf4..60766c896 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts
@@ -271,12 +271,71 @@ hym8563: rtc@51 {
 		clock-output-names = "hym8563";
 		wakeup-source;
 	};
+
+	khadas_mcu: system-controller@18 {
+		compatible = "khadas,mcu";
+		reg = <0x18>;
+		cooling-levels = <0 50 72 100>;
+		#cooling-cells = <2>;
+	};
 };
 
 &i2s5_8ch {
 	status = "okay";
 };
 
+&package_thermal {
+	polling-delay = <2000>;
+
+	trips {
+		package_fan0: package-fan0 {
+			temperature = <50000>;
+			hysteresis = <5000>;
+			type = "active";
+		};
+
+		package_fan1: package-fan1 {
+			temperature = <60000>;
+			hysteresis = <5000>;
+			type = "active";
+		};
+
+		package_fan2: package-fan2 {
+			temperature = <65000>;
+			hysteresis = <5000>;
+			type = "active";
+		};
+
+		package_fan3: package-fan3 {
+			temperature = <75000>;
+			hysteresis = <5000>;
+			type = "active";
+		};
+	};
+
+	cooling-maps {
+		map0 {
+			trip = <&package_fan0>;
+			cooling-device = <&khadas_mcu THERMAL_NO_LIMIT 1>;
+		};
+
+		map1 {
+			trip = <&package_fan1>;
+			cooling-device = <&khadas_mcu 1 2>;
+		};
+
+		map2 {
+			trip = <&package_fan2>;
+			cooling-device = <&khadas_mcu 2 3>;
+		};
+
+		map3 {
+			trip = <&package_fan3>;
+			cooling-device = <&khadas_mcu 3 THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
 &pd_gpu {
 	domain-supply = <&vdd_gpu_s0>;
 };
-- 
2.49.0

