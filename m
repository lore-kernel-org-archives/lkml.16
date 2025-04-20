Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692BE20CCDC;
	Sun, 20 Apr 2025 16:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745167710; cv=none; b=H1i81MU/cvw3S7gC+D58z1rdJhjjTsBWr2NkXfIaq7jzEezCxpTDjTY2G4UGBAV7zwvCZhuvBWZx6DFpfUCH9aZTcdUlRJ/HR9sxHo2OiZmYrgDNT118/SGxxGTGe9NtIRGhVH8oLchXU1wk/HZ2JZeym9WiyaIlHmxMgF3bvpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745167710; c=relaxed/simple;
	bh=uw/+1bsdwBdfgGfUbE0CoCeP34Y3QrghcmLeMHCyRQg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LoytHtFkWS8Kq2bfq/5jMQui6qYg/Bx/Rd6QG5i32OEV9qcDWpx1THA0BGQWJ15mv3w3vIl7pBpSABpipt8XprinwbLdHZO8kinqyGKTkWyKNXqd171K+b6YbAY8GTxVTUQz2aWHyzcmH3MAWQ/7a6TrW98VwnpWmFNlvVEYAmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=CmpzNDje; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="CmpzNDje"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5f4d6d6aaabso4621639a12.2;
        Sun, 20 Apr 2025 09:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1745167707; x=1745772507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5dz4v7wTWh+buxV5bkfnQh5u0ZNU8LLDOpCZ4M3mCLY=;
        b=CmpzNDjeJb8qg9rAseybeFgO9/RNUChE9A2eHTlxRjBo/i6fsEuNXy6ShY0/XL8Vk0
         mzP6pcGGgrAX5ho76ibSHmurMSUqlSBeL2Dls03tJVmZG9fSi5FV1L9KwguS+/UyrPxm
         F4SL0uTaMZyx5+WDo2nCcbfWKSZSITw1bNUbRlebATpm2spvdzXiqwut5e9bFYOAt19K
         XregUmkj2Z1nmpq5vgi14ljlEbeCLE+C9zt+9yeO5VtUNqqgEFOKsm0otE7oIBH7oaWw
         odlaygmm/9BW9Ri77julJQUVfclGZFlvQGgfw5QRr5V1bZK6DBcsonU1kz0mt9jPzIAC
         tVOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745167707; x=1745772507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5dz4v7wTWh+buxV5bkfnQh5u0ZNU8LLDOpCZ4M3mCLY=;
        b=UxUj6VAuFpFAEaFAx215VD9heZMcarvFe1ZEMt/ltro7NV0UIgXP7n+iPpXYT3j1dV
         Gi5GxkHJt+YkgM6UBVcVV0w1hJIuTRc6jRGTyG/JEHtQomqtg99mjiye8q4TWdiPefLR
         C1Dgh8+xn3z05Muh7THg9c/t6ug1j0NrAut1bsTkT5OBlqtJbDwZgsNCpIjvpvh9OBq8
         2RUqEvv6iILXc1Vj71AoUFvNucNt1OB/iKS3NGv3rqIIj3nifISyzjKbWuSul/x+w+iL
         Np+10/QmQD5XEfPYEug90pTvQQ3pR8kFg84BgWhJrMUMtL24+yR7Q4PzdqcEUK0j37u6
         rdMw==
X-Forwarded-Encrypted: i=1; AJvYcCU4Lh8owJY4K1K3xqgf553FX5vqIwiAEQYIvt3Auoq55wNeFbawPtIOab7J49Tgl/ohrG05RtYCrHBhHmF1@vger.kernel.org, AJvYcCVDcZt3STWVqs+ex836gV0dghY8070oXl/5pOxADBSw7GGPaqtzp1fd4smqwqHgvE0ZfuiSDn6xgBzW@vger.kernel.org
X-Gm-Message-State: AOJu0YyDwH6aQLxQrUtLNymAY2u4ZsDfNfH98rqRQwVzEotxUNSyG0bd
	ewDwYOa22+rTzo9ninN8Asw5SbTWoQGT8Uvon36oCMuFKAjyRuff
X-Gm-Gg: ASbGncsPTy+GoVa5FQcaBcNYAPZmNnh5FjSWrMfFPje9uY+n8R8ys+e3+MR3jx6EUaM
	n7Xro9I1LvA4MG3aRMdug1dC+9BAyLQVENx3lw/0e0C/CsQ0NEnGgfsUYfroE5FO9A8X2TKQ/gj
	0v4nKBkvJP2JNOaeBZRGXNgeZmQkUo3qtDYpOMwzGYeL58ZniispMcbIvgzLABzlX/GKCGuLV9I
	BJYG7ZboDy8bkHeV7sONIGb4MWq555hH61yEw0xAHkgHf2rEuRocV04HkfSxmXL2FMhzjsWWdKq
	Cn+1X9tWdzH22cHF3iA1O94KaunHD36JojEu9CXXVFibCTOWA6/BC4Hv+78mk/Ox5QcagIVWYlZ
	bvZnmV7XyOsNb4uArAiYlH7UjrAzuHQM7X1wGR3J2zGJR1T9LMJOIDeDL9hz8iRkrrcOIGDm9xX
	D2
X-Google-Smtp-Source: AGHT+IEBFRcd9cWwhp7FQGAe1toZz54QqQETJ9/xJS0fRLA7xLURJChGI3PkKm/lnF/PunHA3BuHHA==
X-Received: by 2002:a17:907:7255:b0:acb:33ba:2889 with SMTP id a640c23a62f3a-acb74dd0838mr829185166b.41.1745167706321;
        Sun, 20 Apr 2025 09:48:26 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9ddb-f900-0000-0000-0000-0e63.310.pool.telefonica.de. [2a02:3100:9ddb:f900::e63])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-acb6ef48e5csm416142366b.148.2025.04.20.09.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 09:48:25 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: neil.armstrong@linaro.org,
	jbrunet@baylibre.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	christianshewitt@gmail.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 3/4] arm64: dts: amlogic: gx: fix reference to unknown/untested PWM clock
Date: Sun, 20 Apr 2025 18:48:00 +0200
Message-ID: <20250420164801.330505-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250420164801.330505-1-martin.blumenstingl@googlemail.com>
References: <20250420164801.330505-1-martin.blumenstingl@googlemail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Device-tree expects absent clocks to be specified as <0> (instead of
using <>). This fixes using the FCLK4/FCLK3 clocks as they are now
seen at their correct index (while before they were recognized, but at
the correct index - resulting in the hardware using a different clock
than what the kernel sees).

Fixes: a526eeef9a81 ("arm64: dts: amlogic: gx: switch to the new PWM controller binding")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 6 +++---
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi  | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index c4a9f855e5de..f69923da07fe 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -741,7 +741,7 @@ mux {
 
 &pwm_ab {
 	clocks = <&xtal>,
-		 <>, /* unknown/untested, the datasheet calls it "vid_pll" */
+		 <0>, /* unknown/untested, the datasheet calls it "vid_pll" */
 		 <&clkc CLKID_FCLK_DIV4>,
 		 <&clkc CLKID_FCLK_DIV3>;
 };
@@ -752,14 +752,14 @@ &pwm_AO_ab {
 
 &pwm_cd {
 	clocks = <&xtal>,
-		 <>, /* unknown/untested, the datasheet calls it "vid_pll" */
+		 <0>, /* unknown/untested, the datasheet calls it "vid_pll" */
 		 <&clkc CLKID_FCLK_DIV4>,
 		 <&clkc CLKID_FCLK_DIV3>;
 };
 
 &pwm_ef {
 	clocks = <&xtal>,
-		 <>, /* unknown/untested, the datasheet calls it "vid_pll" */
+		 <0>, /* unknown/untested, the datasheet calls it "vid_pll" */
 		 <&clkc CLKID_FCLK_DIV4>,
 		 <&clkc CLKID_FCLK_DIV3>;
 };
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index 460c46cfad6a..bc52b9e954b4 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -811,7 +811,7 @@ internal_phy: ethernet-phy@8 {
 
 &pwm_ab {
 	clocks = <&xtal>,
-		 <>, /* unknown/untested, the datasheet calls it "vid_pll" */
+		 <0>, /* unknown/untested, the datasheet calls it "vid_pll" */
 		 <&clkc CLKID_FCLK_DIV4>,
 		 <&clkc CLKID_FCLK_DIV3>;
 };
@@ -822,14 +822,14 @@ &pwm_AO_ab {
 
 &pwm_cd {
 	clocks = <&xtal>,
-		 <>, /* unknown/untested, the datasheet calls it "vid_pll" */
+		 <0>, /* unknown/untested, the datasheet calls it "vid_pll" */
 		 <&clkc CLKID_FCLK_DIV4>,
 		 <&clkc CLKID_FCLK_DIV3>;
 };
 
 &pwm_ef {
 	clocks = <&xtal>,
-		 <>, /* unknown/untested, the datasheet calls it "vid_pll" */
+		 <0>, /* unknown/untested, the datasheet calls it "vid_pll" */
 		 <&clkc CLKID_FCLK_DIV4>,
 		 <&clkc CLKID_FCLK_DIV3>;
 };
-- 
2.49.0

