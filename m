Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED18C20CCE8;
	Sun, 20 Apr 2025 16:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745167710; cv=none; b=NE8BdsyGnpsrQnhXDf9atkWhr8Us9PtrCf2nwNlX2C2fvwvIZrI/OsgJOflM5Ghhrj1ink9l3ELBBzstSwMPZfaxYncXsTozrwG+WkwsCec52nRbH9R4rkVt3TpH7yHKMD/ioFyPybPNnWtmDskFz1dorIWvT/n07n76jAuJLdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745167710; c=relaxed/simple;
	bh=q5KCd0/Y1jvumxaNbaXiGfMVxXVi4tyTV0M4h0eTwic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CcgcHetHsjsN2dNvOctYkq4S8BskJcMwpWMen4KJX1tyzNsvX1eiW/I3iwyIxtRI0ZhT04HN4Nu6O4ySv/hzSbIss6EAGKwJQs94xjC4VxNLvxcmQPrOGuXTbZE01FBNBX0GIMzNjEhgki+8feGY4CeezCJyGmtnoiNenrV4C3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=mu/fEfva; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="mu/fEfva"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac29fd22163so507648766b.3;
        Sun, 20 Apr 2025 09:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1745167707; x=1745772507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EjUWRNhL7mfMeWSPy6sa+7SQ8UfbaKL0kzhkdxakcaA=;
        b=mu/fEfvazC+xo5DtbESZGMSNOjjuGaO4PSl57GjxTGEj5CUQjswF3sMOcTdyh8XIsa
         yBGx3+JY6GTy5FWuHGBW1riYzddPhh97GOE23D6amjAd0cU9DRwCxT87zI3J5OjYznb0
         IjOfUzP1G5dUoko4O67bOF/59ddXQ89Rl5DgF1X+NsFQTeFMIGX1FHiCbG29WQec6462
         G1sy6Il2yU+m7eKerZMAltHlhF7piDhsQpmx8FZhF1SOqR4VaImILYHqiQnYNyUVBT9p
         e+vjZMmyuMdIXd8Fa01m/ZqMDPyyRkeUVwaCiYJxTAfu07s1PSOOhK+5BdKIkBCyaMgO
         E9Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745167707; x=1745772507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EjUWRNhL7mfMeWSPy6sa+7SQ8UfbaKL0kzhkdxakcaA=;
        b=A/va7xcvzuxd0irKEvQ5UlKHraJ9tGZqz4rUBrIUplaMONUjkf2N+qHZqpi0O1NS1w
         94Od9eCVkQKvdbZHp/K9wwpO5Fd+syPv32hIplo5jA3AuA2Aus75koF/s5YVwK6uSU2r
         0Hd31yiGGmp9P01ooMNVL1FlaZFh7TX6ceAKoCrjumYBAe9rK+t9pd9in/9ileNP5nRW
         iRjNspm+qoENAhW/i/fHWHDqiJjavpkT48Orb0LOioNgUl6GUHIu4Dw9amaO6DLK4jz+
         aBN5onc3mR5A9AlqI4TE9elftUArYr6hIhMhaCFVd5yUjL6OqHT91kvX7Upe8Mg2oUHq
         hqCg==
X-Forwarded-Encrypted: i=1; AJvYcCX+UktcxO10ziuQWiaqaeC49snaRGPRMNhve4kdWTzOUb0Ip705cxC3dAzo7Sky6D61zT413fJKyyE8Fnrj@vger.kernel.org, AJvYcCXgSSeorQQZ9qOKsQ59Oornyu3b5gafRoCQd3NvWhixmwzQ1f19XxW0kIE4b07EMr0SrroqBOR4Hsox@vger.kernel.org
X-Gm-Message-State: AOJu0YxOZj7Rwhjq4pWEzS7rHXwKM9TD9vTJiz3tx8XUL7lwGVBllXpV
	bA7VKhbFnAgfaYemAZg4wfr+VoBa4i0HtH31h8iUaR6sLsZkMo2v
X-Gm-Gg: ASbGnctYgM+J6g/Z/qg3sUEmTQaakvx2pM+yOQTtTexBhgKEtwkMwwMkyp7CYhrPge+
	qNAsRgEM/eMY3UrVG3JhatqkO075ra9ppKHnrRHjgX8Vs3C+Cw8ajTa7NhfaU5uWWtmupyYUuKx
	1ffszIYuHPL7vqg6Zk2hebKLOQmzF7Ot3TWmLgUp7tIKJdKYN2ACXzszHwAqj8u7EInn1FrYBk2
	v8Z8iZ1G+agHB+GjA685PE2tdpPI2DX9PewNwND4CCwRyK/Sf4su78oB6McSlpQen/WBCYo9SXN
	+2PrbZ7x2UxBuMusPG0blr/fuGvS01P3L+JxKEXLyW/e9Y2B6qkRDAYT28oL91mCxL/MYz8DNaK
	XysIMDjQ5rncv5y+mXqrIsG90/9x0IbBvMQzW5gLZIWSapBpcyk9eJdiaA561vw/bkEt91PSkcb
	nb
X-Google-Smtp-Source: AGHT+IGQbKyjINDvHkLRsaTYirDNCXIf/EYtZjqg3lz7IMf8gugQhBZRZ/3/lwYabSVCSHziooRzLQ==
X-Received: by 2002:a17:906:478f:b0:ab7:bac4:b321 with SMTP id a640c23a62f3a-acb74b80e1fmr754056366b.29.1745167707194;
        Sun, 20 Apr 2025 09:48:27 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9ddb-f900-0000-0000-0000-0e63.310.pool.telefonica.de. [2a02:3100:9ddb:f900::e63])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-acb6ef48e5csm416142366b.148.2025.04.20.09.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 09:48:26 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: neil.armstrong@linaro.org,
	jbrunet@baylibre.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	christianshewitt@gmail.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 4/4] arm64: dts: amlogic: g12: fix reference to unknown/untested PWM clock
Date: Sun, 20 Apr 2025 18:48:01 +0200
Message-ID: <20250420164801.330505-5-martin.blumenstingl@googlemail.com>
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

Fixes: e6884f2e4129 ("arm64: dts: amlogic: g12: switch to the new PWM controller binding")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 12e8daaa1c9b..dcc927a9da80 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -2313,7 +2313,7 @@ pwm_ef: pwm@19000 {
 					     "amlogic,meson8-pwm-v2";
 				reg = <0x0 0x19000 0x0 0x20>;
 				clocks = <&xtal>,
-					 <>, /* unknown/untested, the datasheet calls it "vid_pll" */
+					 <0>, /* unknown/untested, the datasheet calls it "vid_pll" */
 					 <&clkc CLKID_FCLK_DIV4>,
 					 <&clkc CLKID_FCLK_DIV3>;
 				#pwm-cells = <3>;
@@ -2325,7 +2325,7 @@ pwm_cd: pwm@1a000 {
 					     "amlogic,meson8-pwm-v2";
 				reg = <0x0 0x1a000 0x0 0x20>;
 				clocks = <&xtal>,
-					 <>, /* unknown/untested, the datasheet calls it "vid_pll" */
+					 <0>, /* unknown/untested, the datasheet calls it "vid_pll" */
 					 <&clkc CLKID_FCLK_DIV4>,
 					 <&clkc CLKID_FCLK_DIV3>;
 				#pwm-cells = <3>;
@@ -2337,7 +2337,7 @@ pwm_ab: pwm@1b000 {
 					     "amlogic,meson8-pwm-v2";
 				reg = <0x0 0x1b000 0x0 0x20>;
 				clocks = <&xtal>,
-					 <>, /* unknown/untested, the datasheet calls it "vid_pll" */
+					 <0>, /* unknown/untested, the datasheet calls it "vid_pll" */
 					 <&clkc CLKID_FCLK_DIV4>,
 					 <&clkc CLKID_FCLK_DIV3>;
 				#pwm-cells = <3>;
-- 
2.49.0

