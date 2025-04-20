Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6254C1EA7FE;
	Sun, 20 Apr 2025 16:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745167706; cv=none; b=D9IqRdduPnOc0LCZtV4tFhOWPzlB8b5GW65NwsJaXkMwrXoJxObJYnzKSsGy8P9h9UiSClqMU7fRWHuiKfF9LsemUu+4QzwuG0i2E5UBJ9lWCUkfyq/7O5nxzM9RfAbbBH0C/9lrMa0OBqfvZ7B/Qd2ByH035w4b+BZ1M88M0Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745167706; c=relaxed/simple;
	bh=dD7MHTcAJ8dZLQP7NejBP5RH7ngfpZYUN/1YsgBBHp8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LKKOikQ43i7cjIbbseMG5DyJbJcb7AnE3697liDBj+2TauhSB6SS+f5uddsCqULHd9hE3k5/mJiKGJgOEjYaZR0H1kPayyoNBVKyzYotkCvXEMyfhZVHjzM6ZKVbQLWDo+HzstEHltC+B3Frd/uv6jwX9jFr6g8U28TxB+KqjUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=fUnFFlQv; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="fUnFFlQv"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5edc07c777eso4353211a12.3;
        Sun, 20 Apr 2025 09:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1745167703; x=1745772503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TSDIdMS2R6liY+Rg+fw/qUWZGerrvhAudF6jdSavCD4=;
        b=fUnFFlQvol4AVxARjd3LAqO38wa531kS8Ba0HkSYvRL7NWr8wNvRYDh0EG1gQ86eiE
         eDv8G0I2L6vS9O87Fk/+71MxU+r8XJFACf5AUMjN4Idg9jlvpCiUUAZSE9OUii6OJKhS
         H9l1wXjxuV7LXNH9pjSdePcQBsiFqQvTmpJbksCjy2b+kI+pbBpCU1nj/imstRnyl8Th
         Vz5GwSmcihDzDiVO6JLYxWbPTMAMTxH60hbRAQVk1TxjPbAbp85YtFguJZ7R0AmYixkJ
         BQYeDVPsrjbR6O7r48p+zAkNPiNRN4t9opYOeOy3/FmIKO+tCDH28SEAnKtIFycLG/uz
         Wyug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745167703; x=1745772503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TSDIdMS2R6liY+Rg+fw/qUWZGerrvhAudF6jdSavCD4=;
        b=p8kQB8gwxDTAvIgcx01RVBDICUA9AkECIYnOlpGTcuXbi1QXHU/HYTCbGtDEXsug0v
         iU03uoRgaWckAR0H+eHEF6fY0vZHRRNkM12uZTDFO5KwjBk9zm+syMiGohwhCLrNPZnL
         zQjTZn5S8NRFuNA15e5qsHvjRyqXUoPX+SaL8fA0Uri0Fwz6pbza/0z86NU/BSKMqrNm
         e48LYFt0tUXShDx6QmQvrxcg5QPq5xmcw95LugWrrrYGkM+UYfdgfVy5sW371jVvMJDD
         yP5D5DRNsW7Sb6KM5Y1RZxrigZyHtm5v+6tYfQ1z9DNRyWD2CU8q6rMJuuqOrY/QJv5w
         TMAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHtsnkwglJ45sLRjB+RNRo9T5wH+MfyTmroynkfNbd+TNQPRpD22o9KG0Ra3u14sR4k7UiwpSepboa@vger.kernel.org, AJvYcCWAEPeuCJ5uxybmRJwUGf8TNVi0YRnr5op7LZ1H2VjPaJJVAhvsrndF5uxTpXF8jcN+7mZsBE1lPmXa3D/4@vger.kernel.org
X-Gm-Message-State: AOJu0Yy75ATRO1UDoLnEGRLUk5ulqSFkTEnM04J0a5gRESXcjTz6zLeH
	PyXVUV+xbiJZLx+p2/BvwCrfm4AdBfPHEbpyyAWxpdL0x8fr6UeW
X-Gm-Gg: ASbGncv/53Ir3LsJ8AV3ondle/MyKSQG87sPfRiWjbXFHA1Bb7dieydV9N8NjbDLoto
	VVYRFjHqwLnT7lA22X/7uv2eVKGpwHmNlhNzPS1AIq5Dng12k2bfrSGuktbgzTdAbRF0hNRgInd
	kS1FZU/sxZ8AXG9s7HQL582WgCQoSTSzZ7EEWyYm44DWP2UBrhpApYhCHBCOqjZAQLq/xd9TtgE
	KNuH6JqpVg37N68dOA5Qds+F0iU/d4HeUd3YsSiJ06pujgFBU7tzkxkwre7sUhywELXE6P7uk5M
	A1u9RmqpRDW4/tp0MHNHLaNj7kKHDwwVm9lOAb5/oqsq5L6LM7R8LhVx+yEyfllTtbwAbboc7q9
	HQwWtZIMUcX1ZZV4m+ZOc3+yTId6tCjPM9PWfFTayex4akBZtdqMWImX5m580L2FbEQ==
X-Google-Smtp-Source: AGHT+IHDqZGR/C4pyAoG+Pzf6q71gs+2fbe1eacbY+0bbZd64TmYxRfYf9le5qi7eevSgXvzJtxo2A==
X-Received: by 2002:a17:907:7288:b0:ab7:cfe7:116f with SMTP id a640c23a62f3a-acb74db6d92mr846438866b.46.1745167702517;
        Sun, 20 Apr 2025 09:48:22 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9ddb-f900-0000-0000-0000-0e63.310.pool.telefonica.de. [2a02:3100:9ddb:f900::e63])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-acb6ef48e5csm416142366b.148.2025.04.20.09.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 09:48:22 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: neil.armstrong@linaro.org,
	jbrunet@baylibre.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	christianshewitt@gmail.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 1/4] ARM: dts: amlogic: meson8: fix reference to unknown/untested PWM clock
Date: Sun, 20 Apr 2025 18:47:58 +0200
Message-ID: <20250420164801.330505-2-martin.blumenstingl@googlemail.com>
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

Fixes: 802cff460aab ("ARM: dts: amlogic: meson8: switch to the new PWM controller binding")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/amlogic/meson8.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/amlogic/meson8.dtsi b/arch/arm/boot/dts/amlogic/meson8.dtsi
index 7fe0c7d3ee6e..8702941ec2b1 100644
--- a/arch/arm/boot/dts/amlogic/meson8.dtsi
+++ b/arch/arm/boot/dts/amlogic/meson8.dtsi
@@ -451,7 +451,7 @@ analog_top: analog-top@81a8 {
 	pwm_ef: pwm@86c0 {
 		compatible = "amlogic,meson8-pwm-v2";
 		clocks = <&xtal>,
-			 <>, /* unknown/untested, the datasheet calls it "Video PLL" */
+			 <0>, /* unknown/untested, the datasheet calls it "Video PLL" */
 			 <&clkc CLKID_FCLK_DIV4>,
 			 <&clkc CLKID_FCLK_DIV3>;
 		reg = <0x86c0 0x10>;
@@ -705,7 +705,7 @@ timer@600 {
 &pwm_ab {
 	compatible = "amlogic,meson8-pwm-v2";
 	clocks = <&xtal>,
-		 <>, /* unknown/untested, the datasheet calls it "Video PLL" */
+		 <0>, /* unknown/untested, the datasheet calls it "Video PLL" */
 		 <&clkc CLKID_FCLK_DIV4>,
 		 <&clkc CLKID_FCLK_DIV3>;
 };
@@ -713,7 +713,7 @@ &pwm_ab {
 &pwm_cd {
 	compatible = "amlogic,meson8-pwm-v2";
 	clocks = <&xtal>,
-		 <>, /* unknown/untested, the datasheet calls it "Video PLL" */
+		 <0>, /* unknown/untested, the datasheet calls it "Video PLL" */
 		 <&clkc CLKID_FCLK_DIV4>,
 		 <&clkc CLKID_FCLK_DIV3>;
 };
-- 
2.49.0

