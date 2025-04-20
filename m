Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2946020C48A;
	Sun, 20 Apr 2025 16:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745167708; cv=none; b=WsB0ZUne78mBycTwbPz3UJKqvqFRlPr+kqGcVDCdNG/fxcwoU7A8Kbms81JJZRWV/nIbPrTcnNtM3r6CruWHXNxSXg5MfU6drP925Lx3QgAC3zcxDO4tv/j0N4vMC9FQrGU2q3OLxn2jhgvlTSll3RtNhaeKugs+C3u9wvDvmAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745167708; c=relaxed/simple;
	bh=MmcV+i6ORpTIlVVNnkp4p3q0PDn002foMs78dxHDGxY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B4QXZq63sHqIQPQwRXWk08dTfE2z51BBx+QtY6cvk96zK+WKUjuBAm+943kwTyRLg8BMMvAEyMtIDNsPVC/pndIT2oYgma8TuHGaJtolnV9EBnFfLsmNvCxlM+h9DnGZ4p78k+EYIOZqUBeMWSzatlvXxoiSs2ANAmPEHL9Yj1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=F1zQcCmX; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="F1zQcCmX"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5f62ef3c383so3173140a12.2;
        Sun, 20 Apr 2025 09:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1745167705; x=1745772505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o6B760vwD3lkBSm3PWk3A57ArcHkVyL13m2W1khg+TY=;
        b=F1zQcCmX93JCkRYis6eRF77s/V5C6Rk6cva2jTkVAQpdyFipHMKrCt6FwuvwWytXb0
         ktE1ELqHW71+4EiI6XuhevJZgIuz5tCZaVxnXwNMTMGhaBoR0mk9SJuzlbEfXFOyE8BF
         +uftKOuzC83jpxOrv3wBP849tGziagdgSw2GWtZly2CNygc0HcVIsALQMAKiDFQ1BA8h
         LeKCFwwWDFMaRIX/XacxRHc/c8ribkSuCmy7P9zXnt30RkABRWwPxnjW670wdOgu0Wzq
         D0UOLG38WC99iiO7KbVzxiUh9aObiiCL8kTnIj0XKh40pUt8N20zoAmQtubDdH5RNaqo
         0/bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745167705; x=1745772505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o6B760vwD3lkBSm3PWk3A57ArcHkVyL13m2W1khg+TY=;
        b=FLBep2LceAS0rxUNJEDexpeGHaRG8ReoWAPvlt9LLQ2xYXABVsStRjZCgiKAujdKFG
         wkIdMkq1aglZLhvgAcbC93gAy7izolq6kjvHLBCidxfRQo3SqJHUnoMWcRpzHpKhrKOe
         HsPbLXDD49vDI3uvfT8oHtlxiekWZOphd1YjCYG8doAUVKB9rPA7VcuUbvt8qE37WmBo
         NZqhNTSHtNIaXOx80VkKubZrLCgHQGNj32k4rEzrGJXLRmFpwYgVt4iE5K2OT0cDYIfR
         W2L8Yb5sOwbCrqN6YViasieUisUCNThQXTN+gh/7sAmB8HBlYRqnT1DBgifsnT8Ez+Zm
         0Lfw==
X-Forwarded-Encrypted: i=1; AJvYcCUGE2lm2rK6s3CLz4C5ZCITJi2/rOyoUqpX2BXPjBimkU5PZVNZ7qaoJnEpokbF6LkpeKt6Mvr8X1knGC05@vger.kernel.org, AJvYcCXYVQ0sr5yALumjf9JgFvqdTL4UKeUolPC2cRqC4PwjxhjDQbtdfYXsTa2LTGfkY0Qv3bLShpnD7qeo@vger.kernel.org
X-Gm-Message-State: AOJu0YzQj71thWaZrG1trzlrGK7Mhhsk4FpBoEJHkCzUImjw/Ic9BmYZ
	/EF+XUiBVoiVuSTAdlThnzFLnmk0HAsAvD5AmXk/is2b0H0vW4eHaD0QQw==
X-Gm-Gg: ASbGncu4iYKKUsOUmyVOYzPpc97ArStH2YcZ8XsRarXvKRxzNQIObrzWesbTwn8kIFq
	R5d4QOiSL00ASbfpJm84fHoghSUPm2cl/wsYH7YuGeeKGiwrxcNRXwJNDn7P7WPCOf3LJPExund
	VXNf2BDtwaEKrroIoN3s6SPdfiOCfwyOHgUTGFMRmqyWDZxxhZaSKjAaopDAIpdnEN/6toQ+OPd
	kC8C6zoRfDEiHxsBzWqjSByetntebOF+/q+mU/xjvDf9xEmdF8CfO6/e+BNJ/PuOOIoo5g3gLRT
	dVxXRYWjfvoZLnbeWhTAklUOxmt7od7yefkRz+SeVOlJL48R2jGjr50cLghFD/4+wPnmzGLaq3+
	Cso/e0inLvc8q/cn8wnpSAXpcxlWVHXa/k3FUz0B94cbqbCMTQXBPsQ4aCAQRpnCz+g==
X-Google-Smtp-Source: AGHT+IH/eLbPz2QxTBGbuutkzwofZVG2md1CrF1k2JxxXi3HLjmA0IuJvyPtAWBqRGuXvGc9OuzF1w==
X-Received: by 2002:a17:906:6a0b:b0:ac3:3d10:6f with SMTP id a640c23a62f3a-acb74ad845cmr846203266b.8.1745167705255;
        Sun, 20 Apr 2025 09:48:25 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9ddb-f900-0000-0000-0000-0e63.310.pool.telefonica.de. [2a02:3100:9ddb:f900::e63])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-acb6ef48e5csm416142366b.148.2025.04.20.09.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 09:48:23 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: neil.armstrong@linaro.org,
	jbrunet@baylibre.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	christianshewitt@gmail.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 2/4] ARM: dts: amlogic: meson8b: fix reference to unknown/untested PWM clock
Date: Sun, 20 Apr 2025 18:47:59 +0200
Message-ID: <20250420164801.330505-3-martin.blumenstingl@googlemail.com>
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

Fixes: dbf921861985 ("ARM: dts: amlogic: meson8b: switch to the new PWM controller binding")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/amlogic/meson8b.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/amlogic/meson8b.dtsi b/arch/arm/boot/dts/amlogic/meson8b.dtsi
index faf09f77c605..2d77b9876bf4 100644
--- a/arch/arm/boot/dts/amlogic/meson8b.dtsi
+++ b/arch/arm/boot/dts/amlogic/meson8b.dtsi
@@ -406,7 +406,7 @@ pwm_ef: pwm@86c0 {
 		compatible = "amlogic,meson8b-pwm-v2", "amlogic,meson8-pwm-v2";
 		reg = <0x86c0 0x10>;
 		clocks = <&xtal>,
-			 <>, /* unknown/untested, the datasheet calls it "Video PLL" */
+			 <0>, /* unknown/untested, the datasheet calls it "Video PLL" */
 			 <&clkc CLKID_FCLK_DIV4>,
 			 <&clkc CLKID_FCLK_DIV3>;
 		#pwm-cells = <3>;
@@ -680,7 +680,7 @@ timer@600 {
 &pwm_ab {
 	compatible = "amlogic,meson8b-pwm-v2", "amlogic,meson8-pwm-v2";
 	clocks = <&xtal>,
-		 <>, /* unknown/untested, the datasheet calls it "Video PLL" */
+		 <0>, /* unknown/untested, the datasheet calls it "Video PLL" */
 		 <&clkc CLKID_FCLK_DIV4>,
 		 <&clkc CLKID_FCLK_DIV3>;
 };
@@ -688,7 +688,7 @@ &pwm_ab {
 &pwm_cd {
 	compatible = "amlogic,meson8b-pwm-v2", "amlogic,meson8-pwm-v2";
 	clocks = <&xtal>,
-		 <>, /* unknown/untested, the datasheet calls it "Video PLL" */
+		 <0>, /* unknown/untested, the datasheet calls it "Video PLL" */
 		 <&clkc CLKID_FCLK_DIV4>,
 		 <&clkc CLKID_FCLK_DIV3>;
 };
-- 
2.49.0

