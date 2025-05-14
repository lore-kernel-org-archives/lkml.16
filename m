Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8006E2206B1
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 08:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747211119; cv=none; b=aUSFa1TM679MlCDb8ZwUmlkxryHvt/vdu6qtSZ4vMbxuoyBj6UIUyEAVkxPCFHe33kuXK9TJS/50P5UuRVPlYMBFLIdgW48dWndPixwaZ2/M1i9Vqbrgg+74uiMgGQBrrBf2b8RlNo8iHuNeX4ESkE//wl0PPXX7QBVaOik9jtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747211119; c=relaxed/simple;
	bh=yCkiAdtOCF9iCkdkXTKRzrhbw0DYQlsHaTH+AYSbQek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a+D9a1gGxMvqZ4d00VYSTyTCwCYXpEMpNnuN9L6E+iJ+blW7kfA2WctOJKyEybKVB7zCJHqefIuIHhZKiRzTqqqUPYlfNKgCpR0AGTmnCxM+32jOFOj0Ihf2HkrxdhR87GTNR6DSknAZy3cDVwW0ErRrHupBbx/U6P+CmW8o1mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=BAWxaOHe; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="BAWxaOHe"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43ede096d73so44979425e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 01:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1747211116; x=1747815916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X/m+AYqPg8A8mlOIVXAz+KE+GHEig3We9H42iLfgbKU=;
        b=BAWxaOHenJgAvu2UPpHQG4vjVx7sIAMlHwG/hw+RcO5936fl5xwZ7z9htW83UbAcFn
         BhPsgKQmEz5IoOfRhF5vd7pWeVWNNOZ8P6kb9CEDcxIjjewXLrqH+IkTeZt5WM+rHWKv
         rBESO5RFfMK6bOdhL3OuX8ZqtxN3qkZtys6jA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747211116; x=1747815916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X/m+AYqPg8A8mlOIVXAz+KE+GHEig3We9H42iLfgbKU=;
        b=Gf14ECdWj8OlrN6IDtwn5lI13obsLdvxrRn7IwkeCtr6CsuW+CuVHQ8BBMQoGYPFLP
         a+hitTY4hdl81uujBbaEcS+/qa5Hx6J5Cl8+4uq0UvZqYNhi24OhsfIZPOMfc+/LazWx
         KhIyUPrK5V9RwEhQnbT8MJ+QSaFZFcnsAo1VD4WHoNFmHBNbz5FzE1wEgRVBy4DFGGz8
         TXgCmEEYi0dN7YfjXxsYO4irBNaLY6pi2e5TpotPbpWf7JufNmd1PhQw8/i8neX4hetn
         yGf5aZzADu4yW6NcGCrau1lr4fd0C8bBsGj4huO9r7HB1/elPWCpRLXaFGJfp+HUUl84
         pKNg==
X-Gm-Message-State: AOJu0YyOOjYwS49XNFDav3rrVWqHgE0WqO5KxeY3UMCym5wuAiCsw7jV
	O7U1saMmYBK3f3HWktnNabSz2uXu0sbesThOkULsbOu+aeQeFzJTUpn3tCxNT153yt3llMKj7as
	mSxE=
X-Gm-Gg: ASbGnctZADxEaNQpeEkVKLn2HLbYwJitOywDXOsyhTNa4CvK3AhPzCpkSE8P6cJJCrk
	LacL6MCHcAaSDAd+1wf5+qXGrizSrz0glvXKW2nyvdGNH0DzF2zX44NiNloEohRdcBcGGc4V+6W
	L/6gZPziixvn4M5WadB+dd+QX4AnK4lpEmPM/KZN+sYPfEE3jy+mO6I32TdYgcr91nE5fi8XGXC
	8hbQ1G701COPe+goEhMl4R3qBCEaGgCwOYP3oc5UUEG39z56TeHkZpn3xHOk83viVgJ4wuuQRuT
	4vuSzSsbOu2JW1qyprOpvEH75TreBEhW8xrfKGxw8xs83AlaLU3sz4VSu3cEY412YmXa6yA6R//
	V3JfxwveudG82TNFWJuRdKpyC7EDde4/rTdVGs/OLm64=
X-Google-Smtp-Source: AGHT+IFtHHcd+lejXopr8LfFGaQVmOfL/UNHCcWzihISzr8hDJtjbOrZphMkMM72/aDayUzTnZnf0A==
X-Received: by 2002:a05:600c:609a:b0:43c:fc04:6d48 with SMTP id 5b1f17b1804b1-442f1dd31f4mr24755195e9.0.1747211115603;
        Wed, 14 May 2025 01:25:15 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.client.m3-hotspots.de ([46.189.28.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442ebda7d2csm30987365e9.3.2025.05.14.01.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 01:25:15 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Simon Holesch <simon.holesch@bshg.com>,
	Karthikdatt Anantharamrao <karthikdatt.anantharamrao@in.bosch.com>,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Wolfgang Birkner <wolfgang.birkner@bshg.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/9] arm64: dts: imx8mn-bsh-smm-s2-common: Keep wifi enable during suspend
Date: Wed, 14 May 2025 10:24:57 +0200
Message-ID: <20250514082507.1983849-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514082507.1983849-1-dario.binacchi@amarulasolutions.com>
References: <20250514082507.1983849-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michael Trimarchi <michael@amarulasolutions.com>

Allow the wifi to be enabled during suspend. Use case is needed in most
of the devices deployed in the field

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
index 0d343ffdb7f9..a983072fb835 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
@@ -277,6 +277,8 @@ &usdhc2 {
 	mmc-pwrseq = <&usdhc2_pwrseq>;
 	bus-width = <4>;
 	non-removable;
+	keep-power-in-suspend;
+
 	status = "okay";
 
 	brcmf: bcrmf@1 {
-- 
2.43.0

