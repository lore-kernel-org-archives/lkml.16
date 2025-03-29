Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A6A1E32CF;
	Sat, 29 Mar 2025 18:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743274776; cv=none; b=JI4wGGcW+AbdS7QKBXzRNLEeFVWuxgRCIqNVeKT+AvSYlWDpUyUPFuFO7nMf5eM+em0eD5VxPP5T6ePsc37UPEOr/jYiONw45Xsv57PUgPLNQh9CWPiMS9S/axb3d1sWNptb0OijtF8JXCKxrkbH6B2W9TWN9AX/lmftYjUtXU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743274776; c=relaxed/simple;
	bh=DZ0HssLI9K6jcU3FNMGKWR7mlgk0rUPsHjXSsz9w8Pg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z97TNwhMcZ7aerEq4xBNMMhyPfGzoDCpivMWuMdgjffZdbcVIxHKSZ87kQvLSiNfOkK1s2wzAoNzfxBxPY6feAu0VaL4q18npuQ3AfBRq2sTEjnJvBSbuFDzr4Csr9tbKOImRyAKn2ZhXvKh3jT8OlnP67QvSyjEhkjda+yhjyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=ZT7XnTrc; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="ZT7XnTrc"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e5cd420781so6322756a12.2;
        Sat, 29 Mar 2025 11:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1743274773; x=1743879573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cwf31W03hzDQ3pn4ZEZvOqnTw7bLaOev9kguqMxCgac=;
        b=ZT7XnTrcqmkKB+ylodi0qM2X8wWz8bFzpcu+DWsqJwc0rACcadEwfw3SdQ/2PZuZ5X
         Zzd2SPgZN/YOiE4/5omKaArWCMCV1WdANVZlgjUM7IfhANNDVIJrMad1fGm2pLUWB8Jj
         RQ4YmrSa1+AtakzkjrhgnkrqBabXWLeLwtNptV4TtV1oF3crQpoU4LLDHxxmhJpmK/ky
         2GCfGBlw500vN4tQWFrG747/+rW+0siM4Ijf77WbYkAxNddiutg5zcdRLWZ350wHlfDF
         CGo+9A+s3urriNPap5Wi253D+PEC8WdS1UxBlJHjvc8R2qgXHDktSldhkJArbeoABzc6
         fnGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743274773; x=1743879573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cwf31W03hzDQ3pn4ZEZvOqnTw7bLaOev9kguqMxCgac=;
        b=h+GnbqtMMfn2Baiqkmp46ZEI7WIH4n/ukf61Q0jNTS9+HsBBAp3KRp5nS8ej2K9Z7B
         zjRmWgvva8OA+bpoBtviPEo+j8CXqIfob+ytvjzt76Cu1QivRfbYoOMDxV381nl93pYq
         G2uo4bOVJU3UjJm3EsCNnsaE58TSe1Ym/uW9wXT6p6VQ2tGwTzXoCW5tIXWp8Gkf6iqd
         T1h3czyhIXrIQiesLL0LX4TmqUWJVaWdMnt9hapG2eFvaL5q0/XwrdcZiXP8SliM/+DC
         yA2YCWnMfcC47E462zDzu6aXJ0gBwRd5YB6fPXe8nnS8ccQ2ylCtzoVILj14Ymilq8WA
         CSiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYXa2aB6NRbh3ZHvc5H3D7uv8RTn6xfjkgQU0oIuWtZGUd3h4by6+i8z+jUhhQkgzYNeyH9SV8jPB/u6RB@vger.kernel.org, AJvYcCX+7hcFnE4F3+Kft+ceZLfSPQ9hj5Z1ZLcDz8M77qf/pkEY/vQSV29JrD4fv/ZNAIlz0xvP6CHywQCo@vger.kernel.org
X-Gm-Message-State: AOJu0Yzmhk91lDq8AbvVfjqAkwQQY2njOOc4XxHtDiNPongzXk9fDi2k
	0A5Uxu/GPymmMkAXMnAaPYQ3MdLrXtmazQRmOryCRYnXPTAecUlj
X-Gm-Gg: ASbGncu3w61uSSbYNfB3Nb0EoMBIKpHNT0EjJhBduIncxTXI4QX3Zi14FsWIAavtC7n
	OmrBZhmfWL7T+hbDn1wF6MzZqgvax+BHG8WgLLKwbmBCJ4zq7JmQUdIBGguVEUeUYB/SbGjjO66
	M8XokET63V5GTIE63NgVJUPaQ25GqOg5jR2qew/yhluBYbLpJVdxQfGmGlcYzS8x36GwbpWFiwC
	cVEtNC007mVobpcQeagFXA1E1EgOCT6M9FvgbxA0wmWwXOa4Ih5CXxEqbr0vZDssVKtgUbvhf2V
	S/J0J+3EhM6skV9Vyp9/+3pBDl7nuR13Wjt98+KZMn0IM8XaeAJrVgMs+A7RYyVrgNoA2IiKS+O
	HyTjvQobr0Zf0sX+62F8l0LJt744YsTkKlZm4ANDfFdlKV3h609FkbXos0ck/DJH9vx75WA==
X-Google-Smtp-Source: AGHT+IFTpADwyhmdGZC/uMEn7HRP+YrC2xbCL6evJOQI7YFnJ9+6LvnjcqnXDwdY3wn5SL8IaD1VLQ==
X-Received: by 2002:a17:907:c26:b0:ac3:8895:8e99 with SMTP id a640c23a62f3a-ac738998f18mr322099266b.3.1743274773307;
        Sat, 29 Mar 2025 11:59:33 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad73-6800-0000-0000-0000-0e63.310.pool.telefonica.de. [2a02:3100:ad73:6800::e63])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ac7196dd46asm364497866b.160.2025.03.29.11.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 11:59:31 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	jbrunet@baylibre.com,
	khilman@baylibre.com,
	neil.armstrong@linaro.org,
	christianshewitt@gmail.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 7/7] arm64: dts: amlogic: a1: enable UART RX and TX pull up by default
Date: Sat, 29 Mar 2025 19:58:55 +0100
Message-ID: <20250329185855.854186-8-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250329185855.854186-1-martin.blumenstingl@googlemail.com>
References: <20250329185855.854186-1-martin.blumenstingl@googlemail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some boards have noise on the UART RX line when the UART pins are not
connected to another device (such as an USB UART adapter). This can
be addressed by using a pull up resistor. Not all boards may provide
such a pull up resistor on the PCB so enable the SoC's pull-up on the
UART RX and TX pads by default. This matches the default (from u-boot
or SoC hardware) state for the pinmux configuration on these pads.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
index 1eba0afb3fd9..f7f25a10f409 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
@@ -233,6 +233,7 @@ mux {
 						groups = "uart_a_tx",
 							 "uart_a_rx";
 						function = "uart_a";
+						bias-pull-up;
 					};
 				};
 
-- 
2.49.0

