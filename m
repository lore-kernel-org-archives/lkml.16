Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A85136351;
	Tue, 20 May 2025 09:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747732740; cv=none; b=joxB//J4sFETeFMO4O3afFJY0/kHMsq7TQHqzsOlMR7AmyBUMuchCn3zEgb/jmm5NeSDI9m0II+NcU4n34uuYqTgtGwgC5BlrLhXGmC8m8omZu3Jpf1kYK8N9/C0/SFo1h1c+ismJLc0rDX6/JQRTDSbIww09qhuZRTxxiAq0rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747732740; c=relaxed/simple;
	bh=mRvKmXH8hMLTtfWxTZLtiRtMoIE1qOK9pPxK63tvIy4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gWLVzotdKnCW0amyozGBFRc14Z1OOV69ao8pqXc2EgyLKnG9GD1HknlX1wEX3KXz/AOo+S7z7yVDtiiS/bpvigsMgkP4ukUrtZS3F+PR+NnqytASEsn3Tjcjo6CfnFP+y3s9OjaXa+SuMjfncRCjC1w4Wfla3gQk1ORyz+SKoyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C0LjlmT5; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C0LjlmT5"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-30e57a373c9so5328962a91.2;
        Tue, 20 May 2025 02:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747732738; x=1748337538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TmB3VwzqmYYYrbvoIpxGgYUP5XtGUkR2yStXvoSAy5k=;
        b=C0LjlmT5+Yh8zlA2nGNJ+TRKkKNcf6bVk18cNhTIbznFjawz3SJ6litWrHLUpJgEvV
         ohLk8ELshad57Mudgcl4splrG2kfZYywEA56kkxf736BH9k8B53GcM87Wat/a/U4cwxH
         TpsVW726d5R+ltqGMCadiuDQos2UJP+d4ODAeVNxRRqZvM+KeGa5SmSyh2W+5ubSNe3D
         H79VYpJlgBRk421t3iDEa5srRPvT9nrm3kROm2DTJLTowTSBb3K6WJACYqKzUpUExamh
         qMzvoseyZcAUrYcxPN65qOMZdSMM16CII5bbu/emHTtZbLtzY147jXjHCT0+bK8xXgSN
         5plA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747732738; x=1748337538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TmB3VwzqmYYYrbvoIpxGgYUP5XtGUkR2yStXvoSAy5k=;
        b=G+lcdX85k++PkyakRlAOk8oREq6aV3qZRzpA5quCFF3PRNXfXCzMpmBM/IooywGas/
         tLWHKDJV8OtEMo9ODcc92B6DMOWXaaKVYDKlRDlDxLt1vEMGvvrFER9gVkKvhNGXUKOu
         0wHMT3g7LUfzrZV3ROOIfXuPFzIbgyE78mnGvqgb9/kzaPOKvdkMIrckkWseSlpEBQ1J
         g52yH9gW+WXF7bd7KHvHq/uYd8s0/8vG+kp+E/eDk3lChyw6aBNbuvQKA89y1edLYwnx
         PAP/ORPdQ76mRIdf2T6hA4GX9/qUa5+twoXx2pnrS6o+GHuNbqN9xWEizcFOa5kwNeA0
         qbZA==
X-Forwarded-Encrypted: i=1; AJvYcCUju5itA1gVovoH+Rsn/AIL/VmxZ3kS0WXWuA4qhQ5wUAnesp8FAxjBE2NjvTGzyoXe+tA4bUFBTPuw@vger.kernel.org, AJvYcCXz1pP+7bpCZSlydlU3BtWNEi0dDmsCD7xv1LJbowWzMpDt3ahUjmknYm3xRd72tmY28oCQr9Yc6kr4scyQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyXf5icE6x1NtZyAIaS+h40XDd2oZdSQ+vO46JqO8ZCHlp3cMLP
	B/YZhbKzmTCYjw41IueLdkbQ9g8K9raS2O5McdHdYPQsDBej9/Fe4fuW
X-Gm-Gg: ASbGnctEEXSFZlD+9TH5wA9SCpwtn4nFi4vVM8fQLcPdMwnLEl8Ksk8aUKnO9dZuYtt
	ykXNQY0pJOpk1uhdx0Yy834VCPAyOSPJ+3/R+lx//q/mfDTcue5PhqPRjVaPGshuZb+N5UV8vak
	DvK49f+/TMpjMRATQWsIIaQdpZawx5FddN2H0sCTZfAyvsJ0kiK3T48DF/O/+Kp7mmyD1+FpssC
	Bq9NJpR+uYgiu17QElFuAKWE6dqRM7l98RBEHyrL0y6q5Y7g26oCkC+rQ1ZyJV0wa12suKegHA0
	RwKsCNAFH8PWsqbZGugiVhYkSFGa1PpQSa29RhGrBj2J16kRYkqqfYeBy2hDms8M
X-Google-Smtp-Source: AGHT+IE28a6scW2QVGOA23Pwnnww73CjLpUNOlALdPW4xW8rkWwlD+bLi3eSQOuZ/ve+uP2ennOZNQ==
X-Received: by 2002:a17:90b:5603:b0:2fa:228d:5af2 with SMTP id 98e67ed59e1d1-30e7d53fa9cmr24165884a91.15.1747732738078;
        Tue, 20 May 2025 02:18:58 -0700 (PDT)
Received: from localhost.localdomain ([45.112.0.206])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f36368ecbsm1216868a91.8.2025.05.20.02.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 02:18:57 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-amlogic@lists.infradead.org (open list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Wayne Schroeder <raz@chewies.net>
Subject: [PATCH v1] arm64: dts: amlogic: Update USB hub power and reset properties
Date: Tue, 20 May 2025 14:48:40 +0530
Message-ID: <20250520091842.7504-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing reset-gpios property to the USB 2.0 hub node to
ensure proper reset handling. Also update the vdd-supply for
both USB 2.0 and 3.0 hubs to use the shared hub_5v regulator
for consistent power management.

Fixes: ccff36934137 ("arm64: dts: amlogic: Used onboard usb hub reset on odroid n2")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
index 3bca8023638d..ad959f8bc1ac 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
@@ -42,7 +42,8 @@ hub_2_0: hub@1 {
 			compatible = "usb5e3,610";
 			reg = <1>;
 			peer-hub = <&hub_3_0>;
-			vdd-supply = <&usb_pwr_en>;
+			reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
+			vdd-supply = <&hub_5v>;
 		};
 
 		/* 3.0 hub on port 4 */
@@ -51,7 +52,7 @@ hub_3_0: hub@2 {
 			reg = <2>;
 			peer-hub = <&hub_2_0>;
 			reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
-			vdd-supply = <&vcc_5v>;
+			vdd-supply = <&hub_5v>;
 		};
 	};
 

base-commit: a5806cd506af5a7c19bcd596e4708b5c464bfd21
-- 
2.49.0

